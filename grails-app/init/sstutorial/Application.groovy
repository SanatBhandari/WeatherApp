package sstutorial

import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration
import org.apache.activemq.ActiveMQConnection
import org.apache.activemq.ActiveMQConnectionFactory

import javax.jms.Connection
import javax.jms.ConnectionFactory
import javax.jms.Destination
import javax.jms.JMSException
import javax.jms.Message
import javax.jms.MessageProducer
import javax.jms.MessageConsumer
import javax.jms.Session
import javax.jms.TextMessage

class Application extends GrailsAutoConfiguration {
    private static def url = ActiveMQConnection.DEFAULT_BROKER_URL
    private static def subject = "WEATHERPLUS_QUEUE"

    // This method is used for sending message (enqueueing) to ActiveMQ server
    @org.springframework.context.annotation.Bean
    def sendMessage() throws JMSException{
        ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(url)
        Connection connection = connectionFactory.createConnection()
        connection.start()

        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE)
        Destination destination = session.createQueue(subject)
        MessageProducer producer = session.createProducer(destination)

        TextMessage message = session.createTextMessage("JMS Implemented in Weather +")
        producer.send(message)

        println("WEATHER PLUS QUEUE@@ " + message.getText())
        connection.close()
    }

    // This method is used for receiving message (dequeing) from ActiveMQ server
    @org.springframework.context.annotation.Bean
    def receiveMessage(){
        ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(url)
        Connection connection = connectionFactory.createConnection()
        connection.start()

        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE)
        Destination destination = session.createQueue(subject)
        MessageConsumer consumer = session.createConsumer(destination)

        Message message = consumer.receive()

        if(message instanceof TextMessage){
            TextMessage textMessage = (TextMessage) message
            println("Received Message " + textMessage.getText() + ".")
        }
        connection.close()
    }

    static void main(String[] args){
        GrailsApp.run(Application, args)
    }
}