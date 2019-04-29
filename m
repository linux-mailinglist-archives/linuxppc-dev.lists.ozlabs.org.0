Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E82CDDD7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 10:15:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44syCd3fx7zDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=haabendal.dk
 (client-ip=46.30.210.185; helo=mailrelay4-1.pub.mailoutpod1-cph3.one.com;
 envelope-from=esben@haabendal.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=haabendal.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=haabendal.dk header.i=@haabendal.dk header.b="lBNJsg0T";
 dkim-atps=neutral
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sy9d1PSjzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 18:14:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=haabendal.dk; s=20140924;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=6XgGXBZd9XuP2oE4RYwYzog341NRJDxtjWMZBSjiAvQ=;
 b=lBNJsg0TqOZCs9zsmi7OlOlz1wKeTb8FI0J/+yKQeypPoT337WSvpPYP2/pyW3ht3JjaSTybk0hbz
 c0LpDVQOhmRpZB7EFxCcruxLFgSmAMtfq2RxssZSD9SC3JZbOA2dkqsbdOav7qrmogx3ryl8zofC4J
 4WA76c54x5vGgSFE=
X-HalOne-Cookie: ee6e547916cc579600553f0a2d7cd6ab5b054162
X-HalOne-ID: 164fce27-6a4c-11e9-a5a1-d0431ea8bb10
Received: from localhost (unknown [193.163.1.7])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 164fce27-6a4c-11e9-a5a1-d0431ea8bb10;
 Mon, 29 Apr 2019 06:57:43 +0000 (UTC)
From: Esben Haabendal <esben@haabendal.dk>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 08:57:43 +0200
In-Reply-To: <1556369542-13247-41-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:52:21 +0200")
Message-ID: <87muk9z4bc.fsf@haabendal.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 gregkh@linuxfoundation.org, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 sparclinux@vger.kernel.org, khilman@baylibre.com, macro@linux-mips.org,
 slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, andriy.shevchenko@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Enrico Weigelt, metux IT consult" <info@metux.net> writes:

> @@ -131,7 +133,8 @@ int __init hp300_setup_serial_console(void)
>  		pr_info("Serial console is HP DCA at select code %d\n", scode);
>  
>  		port.uartclk = HPDCA_BAUD_BASE * 16;
> -		port.mapbase = (pa + UART_OFFSET);
> +
> +		uart_memres_set_start_len(&port, (pa + UART_OFFSET));

Missing length argument here.

>  		port.membase = (char *)(port.mapbase + DIO_VIRADDRBASE);
>  		port.regshift = 1;
>  		port.irq = DIO_IPL(pa + DIO_VIRADDRBASE);

> diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
> index cf8ca66..895c90c 100644
> --- a/drivers/tty/serial/xilinx_uartps.c
> +++ b/drivers/tty/serial/xilinx_uartps.c
> @@ -1626,8 +1626,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
>  	 * This function also registers this device with the tty layer
>  	 * and triggers invocation of the config_port() entry point.
>  	 */
> -	port->mapbase = res->start;
> -	port->mapsize = CDNS_UART_REGISTER_SPACE;
> +	uart_memres_set_start_len(res->start, CDNS_UART_REGISTER_SPACE);

Missing 1st (port) argument here.

>  	port->irq = irq;
>  	port->dev = &pdev->dev;
>  	port->uartclk = clk_get_rate(cdns_uart_data->uartclk);

> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index 5fe2b03..d891c8d 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -427,6 +427,46 @@ void uart_console_write(struct uart_port *port, const char *s,
>  int uart_match_port(struct uart_port *port1, struct uart_port *port2);
>  
>  /*
> + * set physical io range from struct resource
> + * if resource is NULL, clear the fields
> + * also set the iotype to UPIO_MEM
> + */
> +static inline void uart_memres_set_res(struct uart_port *port,
> +				       struct resource *res)
> +{
> +	if (!res) {
> +		port->mapsize = 0;
> +		port->mapbase = 0;
> +		port->iobase = 0;
> +		return;
> +	}
> +
> +	if (resource_type(res) == IORESOURCE_IO) {
> +		port->iotype = UPIO_PORT;
> +		port->iobase = resource->start;
> +		return;
> +	}
> +
> +	uart->mapbase = res->start;
> +	uart->mapsize = resource_size(res);
> +	uart->iotype  = UPIO_MEM;

Hardcoding UPIO_MEM like does not work for drivers using other kind of
memory access, like UPIO_MEM16, UPIO_MEM32 and UPIO_MEM32BE.

Why not leave the control of iotype to drivers as before this patch?

> +}
> +
> +/*
> + * set physical io range by start address and length
> + * if resource is NULL, clear the fields
> + * also set the iotype to UPIO_MEM
> + */
> +static inline void uart_memres_set_start_len(struct uart_driver *uart,
> +					     resource_size_t start,
> +					     resource_size_t len)
> +{
> +	uart->mapbase = start;
> +	uart->mapsize = len;
> +	uart->iotype  = UPIO_MEM;

Same here, other iotype values must be possible.

> +}
> +
> +/*
>   * Power Management
>   */
>  int uart_suspend_port(struct uart_driver *reg, struct uart_port *port);

/Esben
