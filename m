Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9454DD7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 10:14:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44syB65gQwzDqRP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:14:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=haabendal.dk
 (client-ip=46.30.210.182; helo=mailrelay1-1.pub.mailoutpod1-cph3.one.com;
 envelope-from=esben@haabendal.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=haabendal.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=haabendal.dk header.i=@haabendal.dk header.b="J72ulJHK";
 dkim-atps=neutral
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44swj109SczDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 17:07:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=haabendal.dk; s=20140924;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=Rf8sJx3ur2QK6RYa5XV2vgfxSi64pRoBLm32TUjXvQ4=;
 b=J72ulJHKQ5eRR7B3qrSTNdLv9fhmdBLHYdplxN71Kgqcrdgo5MySuk4ZXn9V8yxr3eOg/6LQPGt9z
 tne8BVs+PM5pe6qif7+qjVZFmLlWRRmRD5cd/6UVv5y2i2zaREWePHqki8KPN48Pg0BL/QXjGGbA2X
 p2Q/6XzJRGrQkj7U=
X-HalOne-Cookie: c9f683bd629857cf1aa4cd2256f9c542bd663e00
X-HalOne-ID: 58b9dc8e-6a4d-11e9-b614-d0431ea8a283
Received: from localhost (unknown [193.163.1.7])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 58b9dc8e-6a4d-11e9-b614-d0431ea8a283;
 Mon, 29 Apr 2019 07:06:44 +0000 (UTC)
From: Esben Haabendal <esben@haabendal.dk>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 35/41] drivers: tty: serial: 8250: add mapsize to platform
 data
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-36-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 09:06:44 +0200
In-Reply-To: <1556369542-13247-36-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:52:16 +0200")
Message-ID: <87wojdxpbv.fsf@haabendal.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 29 Apr 2019 18:12:14 +1000
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

> Adding a mapsize field for the 8250 port platform data struct,
> so we can now set the resource size (eg. *1) and don't need
> funny runtime detections like serial8250_port_size() anymore.
>
> For now, serial8250_port_size() is called everytime we need
> the io resource size. That function checks which chip we
> actually have and returns the appropriate size. This approach
> is a bit clumpsy and not entirely easy to understand, and
> it's a violation of layers :p
>
> Obviously, that information cannot change after the driver init,
> so we can safely do that probing once on driver init and just
> use the stored value later.
>
> *1) arch/mips/alchemy/common/platform.c
>
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/tty/serial/8250/8250_core.c | 1 +
>  include/linux/serial_8250.h         | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
> index e441221..71a398b 100644
> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@ -814,6 +814,7 @@ static int serial8250_probe(struct platform_device *dev)
>  		uart.port.iotype	= p->iotype;
>  		uart.port.flags		= p->flags;
>  		uart.port.mapbase	= p->mapbase;
> +		uart.port.mapsize	= p->mapsize;
>  		uart.port.hub6		= p->hub6;
>  		uart.port.private_data	= p->private_data;
>  		uart.port.type		= p->type;
> diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
> index 5a655ba..8b8183a 100644
> --- a/include/linux/serial_8250.h
> +++ b/include/linux/serial_8250.h
> @@ -22,6 +22,7 @@ struct plat_serial8250_port {
>  	unsigned long	iobase;		/* io base address */
>  	void __iomem	*membase;	/* ioremap cookie or NULL */
>  	resource_size_t	mapbase;	/* resource base */
> +	resource_size_t	mapsize;	/* resource size */
>  	unsigned int	irq;		/* interrupt number */
>  	unsigned long	irqflags;	/* request_irq flags */
>  	unsigned int	uartclk;	/* UART clock rate */

Or replace iobase, mapbase and mapsize with a struct resource value?

/Esben
