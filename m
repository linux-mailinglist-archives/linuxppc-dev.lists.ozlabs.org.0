Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C68AE65E585
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 07:20:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnbtM5WJPz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 17:20:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.48; helo=mail-wm1-f48.google.com; envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nnbsq3hs9z3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 17:19:42 +1100 (AEDT)
Received: by mail-wm1-f48.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso586300wmb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Jan 2023 22:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMhTa8031xnJCr78Gg3MxS4F8Q+GpLcOHRVjapQT5tQ=;
        b=eJ7QKNCwuxDHMBsXtUK58QOgPcCDNeTMqQGklJzOz3hlIL/1cs9H1VzWGJMo0zavQu
         LihJt7dtoLlaYS07eYo+C6Y7x0O7HBDrs9+HhvFesNLmSDpBoq/k3no51JBpgnMpXRgY
         sLKE8dkG8ItUdWke0GsVj4PrE6F3aVuZG5fKsNrd4ux87H96tNfpE41oT3H8HTXyiy6M
         j/vZw4uhwC1FVEbu9ywPIC9nqAYoCOcCSp7obMmMcDBPgJPOgtMXS6JSkuhL9xJ0Qtzv
         xjKFBgQsgNgwtJ5C+aP2vl5HqCxaCYSIgIaBKkn79zjd0rXz9FMAsZ0GghUTsbK+pAkU
         JoVw==
X-Gm-Message-State: AFqh2kq5MQsYFcygJziqVlAzP6jt7as8604lGyMsAG21o7xkQsijt434
	iP9tYIeRCdHoMBDhTapCYjA=
X-Google-Smtp-Source: AMrXdXvnbuIqp+JAgFHrP0UKIr61/hDJcQemGGF6LX9p8WLjDYXsDs+9lWsr5CrFNlnRZz9V75Ka4w==
X-Received: by 2002:a05:600c:3d11:b0:3cf:8b22:76b3 with SMTP id bh17-20020a05600c3d1100b003cf8b2276b3mr35818833wmb.0.1672899577065;
        Wed, 04 Jan 2023 22:19:37 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id q187-20020a1c43c4000000b003c6c182bef9sm1319688wma.36.2023.01.04.22.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 22:19:36 -0800 (PST)
Message-ID: <09043f30-c516-e173-3836-5e5dd5f5c472@kernel.org>
Date: Thu, 5 Jan 2023 07:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Lin <dtwlin@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
References: <20230104151531.73994-1-ilpo.jarvinen@linux.intel.com>
 <20230104151531.73994-8-ilpo.jarvinen@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 07/10] tty: Convert ->dtr_rts() to take bool argument
In-Reply-To: <20230104151531.73994-8-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04. 01. 23, 16:15, Ilpo Järvinen wrote:
> Convert the raise/on parameter in ->dtr_rts() to bool through the
> callchain. The parameter is used like bool. In USB serial, there
> remains a few implicit bool -> larger type conversions because some
> devices use u8 in their control messages.

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
...
> --- a/drivers/char/pcmcia/synclink_cs.c
> +++ b/drivers/char/pcmcia/synclink_cs.c
> @@ -378,7 +378,7 @@ static void async_mode(MGSLPC_INFO *info);
>   static void tx_timeout(struct timer_list *t);
>   
>   static bool carrier_raised(struct tty_port *port);
> -static void dtr_rts(struct tty_port *port, int onoff);
> +static void dtr_rts(struct tty_port *port, bool onoff);

Not anything for this patch, but having this dubbed "onoff" instead of 
"on" makes it really confusing.

> --- a/drivers/mmc/core/sdio_uart.c
> +++ b/drivers/mmc/core/sdio_uart.c
> @@ -548,14 +548,14 @@ static bool uart_carrier_raised(struct tty_port *tport)
>    *	adjusted during an open, close and hangup.
>    */
>   
> -static void uart_dtr_rts(struct tty_port *tport, int onoff)
> +static void uart_dtr_rts(struct tty_port *tport, bool onoff)
>   {
>   	struct sdio_uart_port *port =
>   			container_of(tport, struct sdio_uart_port, port);
>   	int ret = sdio_uart_claim_func(port);
>   	if (ret)
>   		return;
> -	if (onoff == 0)
> +	if (!onoff)
>   		sdio_uart_clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
>   	else
>   		sdio_uart_set_mctrl(port, TIOCM_DTR | TIOCM_RTS);

Especially here. What does "!onoff" mean? If it were:

if (on)
   sdio_uart_set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
else
   sdio_uart_clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);

it would be a lot more clear.

> --- a/drivers/tty/amiserial.c
> +++ b/drivers/tty/amiserial.c
> @@ -1459,7 +1459,7 @@ static bool amiga_carrier_raised(struct tty_port *port)
>   	return !(ciab.pra & SER_DCD);
>   }
>   
> -static void amiga_dtr_rts(struct tty_port *port, int raise)
> +static void amiga_dtr_rts(struct tty_port *port, bool raise)

Or "raise". That makes sense too and we call it as such in 
tty_port_operations:

> --- a/include/linux/tty_port.h
> +++ b/include/linux/tty_port.h
...
> @@ -32,7 +32,7 @@ struct tty_struct;
>    */
>   struct tty_port_operations {
>   	bool (*carrier_raised)(struct tty_port *port);
> -	void (*dtr_rts)(struct tty_port *port, int raise);
> +	void (*dtr_rts)(struct tty_port *port, bool raise);
>   	void (*shutdown)(struct tty_port *port);
>   	int (*activate)(struct tty_port *port, struct tty_struct *tty);
>   	void (*destruct)(struct tty_port *port);

Care to fix that up too?

thanks,
-- 
js
suse labs

