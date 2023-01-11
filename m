Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F06661C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 18:26:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsZNw2Wc3z3cFP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:26:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fTRr1wKf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=johan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fTRr1wKf;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsZMx5QN0z3bXv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 04:26:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0641BB81C86;
	Wed, 11 Jan 2023 17:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBF8C433D2;
	Wed, 11 Jan 2023 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457961;
	bh=NP2y6S++5x5+MUjd094n7ofaKtyxtCts0E9o4Nm2WhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTRr1wKfHYmqMZ5v6bSHbTdMA2ka1a7Nnlw8K+fSSkbq5Nr2+xsgG8Vvz5DEPQD52
	 XR2Cznr9+ibqxJEcnihsl/sg6Vh2djlx3pRKodDWjmQRIBlAKjzo7+kIlVPkgvQHMI
	 yrw5+uzjR5x1ilAAvGAbjb6VtLqjULGI7zS64eanDyOLLjzf/PkwGczFQO7xcQqQjd
	 FJmDKFouwNkx7lnnjYBz0EgNP2G6vmdBMkX0pkssT+PSVrx7K+jv8jWH2S94kyAu9L
	 cBIRYZTienPKKu4yaJKGBFHwJd3LvTBTgHgoanYP7+r7vzXHHbGTegkozs3mIeN3J1
	 y63M2Wkx05RMw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pFerW-00047W-B0; Wed, 11 Jan 2023 18:26:06 +0100
Date: Wed, 11 Jan 2023 18:26:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v3 07/13] tty: Convert ->dtr_rts() to take bool argument
Message-ID: <Y77xLmLCbldH1VOX@hovoldconsulting.com>
References: <20230111142331.34518-1-ilpo.jarvinen@linux.intel.com>
 <20230111142331.34518-8-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111142331.34518-8-ilpo.jarvinen@linux.intel.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org, Samuel Iglesias =?utf-8?Q?Gons=C3=A1lvez?= <siglesias@igalia.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, linux-staging@lists.linux.dev, David Lin <dtwlin@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, greybus-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, Rodolfo Giometti <giometti@enneenne.com>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 04:23:25PM +0200, Ilpo Järvinen wrote:
> Convert the raise/on parameter in ->dtr_rts() to bool through the
> callchain. The parameter is used like bool. In USB serial, there
> remains a few implicit bool -> larger type conversions because some
> devices use u8 in their control messages.
> 
> In moxa_tiocmget(), dtr variable was reused for line status which
> requires int so use a separate variable for status.
> 
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/char/pcmcia/synclink_cs.c    |  4 +--
>  drivers/mmc/core/sdio_uart.c         |  4 +--
>  drivers/staging/greybus/uart.c       |  2 +-
>  drivers/tty/amiserial.c              |  2 +-
>  drivers/tty/hvc/hvc_console.c        |  4 +--
>  drivers/tty/hvc/hvc_console.h        |  2 +-
>  drivers/tty/hvc/hvc_iucv.c           |  4 +--
>  drivers/tty/moxa.c                   | 54 ++++++++++++++--------------
>  drivers/tty/mxser.c                  |  2 +-
>  drivers/tty/n_gsm.c                  |  2 +-
>  drivers/tty/serial/serial_core.c     |  8 ++---
>  drivers/tty/synclink_gt.c            |  2 +-
>  drivers/tty/tty_port.c               |  4 +--
>  drivers/usb/class/cdc-acm.c          |  2 +-
>  drivers/usb/serial/ch341.c           |  2 +-
>  drivers/usb/serial/cp210x.c          |  4 +--
>  drivers/usb/serial/cypress_m8.c      |  6 ++--
>  drivers/usb/serial/digi_acceleport.c |  6 ++--
>  drivers/usb/serial/f81232.c          |  2 +-
>  drivers/usb/serial/f81534.c          |  2 +-
>  drivers/usb/serial/ftdi_sio.c        |  2 +-
>  drivers/usb/serial/ipw.c             |  2 +-
>  drivers/usb/serial/keyspan.c         |  2 +-
>  drivers/usb/serial/keyspan_pda.c     |  2 +-
>  drivers/usb/serial/mct_u232.c        |  4 +--
>  drivers/usb/serial/mxuport.c         |  2 +-
>  drivers/usb/serial/pl2303.c          |  2 +-
>  drivers/usb/serial/quatech2.c        |  2 +-
>  drivers/usb/serial/sierra.c          |  2 +-
>  drivers/usb/serial/spcp8x5.c         |  2 +-
>  drivers/usb/serial/ssu100.c          |  2 +-
>  drivers/usb/serial/upd78f0730.c      |  6 ++--
>  drivers/usb/serial/usb-serial.c      |  2 +-
>  drivers/usb/serial/usb-wwan.h        |  2 +-
>  drivers/usb/serial/usb_wwan.c        |  2 +-
>  drivers/usb/serial/xr_serial.c       |  6 ++--
>  include/linux/tty_port.h             |  4 +--
>  include/linux/usb/serial.h           |  2 +-
>  38 files changed, 84 insertions(+), 82 deletions(-)

Same here. No need to lump the tty-port changes with USB-serial changes.

Johan
