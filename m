Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916165E716
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 09:52:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NngFn1r0Vz3c7d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 19:52:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OBCkKkgD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OBCkKkgD;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NngDr1lcmz2yN9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 19:51:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672908684; x=1704444684;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=MdpIx0ME+Xfwg6tq/OLwhK9h6Pxxj28cKiqlNMlnOkE=;
  b=OBCkKkgDpcM9MDOYMV/BrNk2e9c/BAoiXhru0ec7DJMfWJrmkDlIn8Iv
   EV4+vZrf6kS+ILxvW0RnlhDCkTGPyaZB3qnnnAFZkkBIWB3N2zOjU2pyq
   bw0BOgitpWBveuma0uHtwzptanNuFHmhuoxeCE6AkbH6nW/mRH/i9wckn
   UnpgpTgTUFCIbaBeKaFEquU970SBYrrrSUw9TsTzTz/m13WOR+iF3Varl
   aUv2n4SZlt4We7pEWD2wfu/Th5hWpemwer8dIeZcQI7aCrzFb9+G7V07A
   am0Ta5TCUBFEqgMKpFNy8AiM4OlHUnEWmAjIzRqddncDojUPAK03CG7fK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319860913"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319860913"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 00:51:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="655496263"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="655496263"
Received: from khaunx-mobl1.ger.corp.intel.com ([10.252.35.181])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 00:51:12 -0800
Date: Thu, 5 Jan 2023 10:51:10 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 07/10] tty: Convert ->dtr_rts() to take bool argument
In-Reply-To: <09043f30-c516-e173-3836-5e5dd5f5c472@kernel.org>
Message-ID: <2cb9b67e-9bb-4fb2-e974-17050457d3@linux.intel.com>
References: <20230104151531.73994-1-ilpo.jarvinen@linux.intel.com> <20230104151531.73994-8-ilpo.jarvinen@linux.intel.com> <09043f30-c516-e173-3836-5e5dd5f5c472@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1066211675-1672908637=:1832"
Content-ID: <4fbbebce-aab4-fa64-6a79-6d25c81fe3c@linux.intel.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Alex Elder <elder@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer <s.hauer@pengutronix.de>, Oliver Neukum <oneukum@suse.com>, linux-mmc@vger.kernel.org, Johan Hovold <johan@kernel.org>, David Lin <dtwlin@gmail.com>, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, linux-usb@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, linux-serial <linux-serial@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1066211675-1672908637=:1832
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <207e8c25-d560-4d87-27a8-5f9cb52ce14@linux.intel.com>

On Thu, 5 Jan 2023, Jiri Slaby wrote:

> On 04. 01. 23, 16:15, Ilpo Järvinen wrote:
> > Convert the raise/on parameter in ->dtr_rts() to bool through the
> > callchain. The parameter is used like bool. In USB serial, there
> > remains a few implicit bool -> larger type conversions because some
> > devices use u8 in their control messages.
> 
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> 
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> ...
> > --- a/drivers/char/pcmcia/synclink_cs.c
> > +++ b/drivers/char/pcmcia/synclink_cs.c
> > @@ -378,7 +378,7 @@ static void async_mode(MGSLPC_INFO *info);
> >   static void tx_timeout(struct timer_list *t);
> >     static bool carrier_raised(struct tty_port *port);
> > -static void dtr_rts(struct tty_port *port, int onoff);
> > +static void dtr_rts(struct tty_port *port, bool onoff);
> 
> Not anything for this patch, but having this dubbed "onoff" instead of "on"
> makes it really confusing.
> 
> > --- a/drivers/mmc/core/sdio_uart.c
> > +++ b/drivers/mmc/core/sdio_uart.c
> > @@ -548,14 +548,14 @@ static bool uart_carrier_raised(struct tty_port
> > *tport)
> >    *	adjusted during an open, close and hangup.
> >    */
> >   -static void uart_dtr_rts(struct tty_port *tport, int onoff)
> > +static void uart_dtr_rts(struct tty_port *tport, bool onoff)
> >   {
> >   	struct sdio_uart_port *port =
> >   			container_of(tport, struct sdio_uart_port, port);
> >   	int ret = sdio_uart_claim_func(port);
> >   	if (ret)
> >   		return;
> > -	if (onoff == 0)
> > +	if (!onoff)
> >   		sdio_uart_clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> >   	else
> >   		sdio_uart_set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> 
> Especially here. What does "!onoff" mean? If it were:
> 
> if (on)
>   sdio_uart_set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> else
>   sdio_uart_clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> 
> it would be a lot more clear.
> 
> > --- a/drivers/tty/amiserial.c
> > +++ b/drivers/tty/amiserial.c
> > @@ -1459,7 +1459,7 @@ static bool amiga_carrier_raised(struct tty_port
> > *port)
> >   	return !(ciab.pra & SER_DCD);
> >   }
> >   -static void amiga_dtr_rts(struct tty_port *port, int raise)
> > +static void amiga_dtr_rts(struct tty_port *port, bool raise)
> 
> Or "raise". That makes sense too and we call it as such in
> tty_port_operations:
> 
> > --- a/include/linux/tty_port.h
> > +++ b/include/linux/tty_port.h
> ...
> > @@ -32,7 +32,7 @@ struct tty_struct;
> >    */
> >   struct tty_port_operations {
> >   	bool (*carrier_raised)(struct tty_port *port);
> > -	void (*dtr_rts)(struct tty_port *port, int raise);
> > +	void (*dtr_rts)(struct tty_port *port, bool raise);
> >   	void (*shutdown)(struct tty_port *port);
> >   	int (*activate)(struct tty_port *port, struct tty_struct *tty);
> >   	void (*destruct)(struct tty_port *port);
> 
> Care to fix that up too?

Sure. I noticed they were inconsistent but it didn't feel like changing 
the name "while at it" would be good as this is long already. I think I'll 
make another patch out of the name changes.

-- 
 i.
--8323329-1066211675-1672908637=:1832--
