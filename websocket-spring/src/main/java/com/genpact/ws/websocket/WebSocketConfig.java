package com.genpact.ws.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	/**
	 * 注册消息连接点
	 */
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// 添加这个Endpoint，这样在网页中就可以通过websocket连接上服务了
		registry.addEndpoint("/coordination").withSockJS();
	}

	public void configureClientInboundChannel(ChannelRegistration registration) {
		// TODO Auto-generated method stub

	}

	public void configureClientOutboundChannel(ChannelRegistration registration) {
		// TODO Auto-generated method stub

	}

	public void configureMessageBroker(MessageBrokerRegistry registry) {
		System.out.println("服务器启动成功");
		// 这里设置的simple broker是指可以订阅的地址，也就是服务器可以发送的地址
		/**
		 * userChat 用于用户聊天
		 */
		registry.enableSimpleBroker("/userChat");
		registry.setApplicationDestinationPrefixes("/app");

	}

}