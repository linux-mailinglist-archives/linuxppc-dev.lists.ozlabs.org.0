Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818B2666105
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 17:55:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsYhk2g3Gz3cgV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 03:55:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NZ2n4T9W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=johan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NZ2n4T9W;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsYgr0mhpz3c65
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 03:54:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF9D3B81C87;
	Wed, 11 Jan 2023 16:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC4BC433D2;
	Wed, 11 Jan 2023 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673456082;
	bh=mXESQehV0wt8kRi6/+LpO/EWbusEEZr0NKPtbWhQXkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZ2n4T9WAfM31GVkMr0U+OYQ1Le0CO4szDFcbo43kBez/1J9qnZ9YKq8esW75ezAZ
	 8JfUAS86yxHZ9RhJ0V0pNmj/VY/ORz9S6fCeFssGIrcuF1Xfq9yUTkn3I4Is0Wx2Mc
	 NFzsNx9oyDWOwe61DNPL38/EqDVkfCeFJN2jUfno83iUYhu70LDJ+1tw4eGExWbpbY
	 EOSUDeG+tMj/l65lE9dJr/seo+5C+OIm0cRJdutUZSTltGuxSufv6PYLoSM27KZI6v
	 4KVn8oRKJo1GTkXYra54pA1zq+/IHJ9a5qCkOem0Z3aiYG9t9YXNKYj154cUDU8BE7
	 E8CK13X7gSsBA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pFeN6-0003YU-Rv; Wed, 11 Jan 2023 17:54:41 +0100
Date: Wed, 11 Jan 2023 17:54:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v3 11/13] tty/serial: Call ->dtr_rts() parameter active
 consistently
Message-ID: <Y77p0P9YaCwPArxv@hovoldconsulting.com>
References: <20230111142331.34518-1-ilpo.jarvinen@linux.intel.com>
 <20230111142331.34518-12-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111142331.34518-12-ilpo.jarvinen@linux.intel.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Rodolfo Giometti <giometti@enneenne.com>, Alex Elder <elder@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Iglesias =?utf-8?Q?Gons=C3=A1lvez?= <siglesias@igalia.com>, linux-staging@lists.linux.dev, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, David Lin <dtwlin@gmail.com>, greybus-dev@lists.linaro.org, linux-usb@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 04:23:29PM +0200, Ilpo Järvinen wrote:
> Convert various parameter names for ->dtr_rts() and related functions
> from onoff, on, and raise to active.
> 
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/char/pcmcia/synclink_cs.c | 6 +++---
>  drivers/mmc/core/sdio_uart.c      | 6 +++---
>  drivers/staging/greybus/uart.c    | 4 ++--
>  drivers/tty/amiserial.c           | 4 ++--
>  drivers/tty/hvc/hvc_console.h     | 2 +-
>  drivers/tty/hvc/hvc_iucv.c        | 6 +++---
>  drivers/tty/mxser.c               | 4 ++--
>  drivers/tty/n_gsm.c               | 4 ++--
>  drivers/tty/serial/serial_core.c  | 8 ++++----
>  drivers/tty/synclink_gt.c         | 4 ++--
>  include/linux/tty_port.h          | 4 ++--
>  include/linux/usb/serial.h        | 2 +-
>  12 files changed, 27 insertions(+), 27 deletions(-)

> diff --git a/include/linux/tty_port.h b/include/linux/tty_port.h
> index c44e489de0ff..edf685a24f7c 100644
> --- a/include/linux/tty_port.h
> +++ b/include/linux/tty_port.h
> @@ -16,7 +16,7 @@ struct tty_struct;
>  /**
>   * struct tty_port_operations -- operations on tty_port
>   * @carrier_raised: return true if the carrier is raised on @port
> - * @dtr_rts: raise the DTR line if @raise is true, otherwise lower DTR
> + * @dtr_rts: raise the DTR line if @active is true, otherwise lower DTR
>   * @shutdown: called when the last close completes or a hangup finishes IFF the
>   *	port was initialized. Do not use to free resources. Turn off the device
>   *	only. Called under the port mutex to serialize against @activate and
> @@ -32,7 +32,7 @@ struct tty_struct;
>   */
>  struct tty_port_operations {
>  	bool (*carrier_raised)(struct tty_port *port);
> -	void (*dtr_rts)(struct tty_port *port, bool raise);
> +	void (*dtr_rts)(struct tty_port *port, bool active);
>  	void (*shutdown)(struct tty_port *port);
>  	int (*activate)(struct tty_port *port, struct tty_struct *tty);
>  	void (*destruct)(struct tty_port *port);
> diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
> index bad343c5e8a7..33afd9f3ebbe 100644
> --- a/include/linux/usb/serial.h
> +++ b/include/linux/usb/serial.h
> @@ -292,7 +292,7 @@ struct usb_serial_driver {
>  			struct serial_icounter_struct *icount);
>  	/* Called by the tty layer for port level work. There may or may not
>  	   be an attached tty at this point */
> -	void (*dtr_rts)(struct usb_serial_port *port, bool on);
> +	void (*dtr_rts)(struct usb_serial_port *port, bool active);

This is not a tty_port callback so this change does not belong in this
patch.

>  	bool (*carrier_raised)(struct usb_serial_port *port);
>  	/* Called by the usb serial hooks to allow the user to rework the
>  	   termios state */

Johan
