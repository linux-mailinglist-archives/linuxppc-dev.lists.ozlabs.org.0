Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B5E7228FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 16:39:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZbpH0mkQz3f5c
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 00:39:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VzKqkeOa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VzKqkeOa;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZbnP2LSDz3dyR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 00:38:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685975897; x=1717511897;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ii0wAsvvPcH2RH0dwkgNRbrd5Rz5fLTuzH3e9FVwJYw=;
  b=VzKqkeOaSbaDPVXP/yYlIUOJwfezoBHi8udMDsrVmqXMQyORxH2cGSSp
   E5cy7DNWV5p0UDoJwEPbWEXppFmjK7SdoQTICyJnWIsUDB8Vavq/gAYfq
   fPjRAGS+cdZwSaVExxvQUeRHs6z6PHJw6XluIezSRyizeEh00JnD03aBK
   0OgrGXv8PKxgA1OcA/bALJlsGV6TLwGIlLrNpjh+hWjaaycXlXkfAMb/3
   ChPqqJb3s2d6kWSrVIHpDvqlnXqvlG7EAqQfNySaC3qcYabXayd/w3Zib
   TRmerU4h8+ojLSzjGRbyjrkyT7Aw40S9ZCZwfb1BcRdzTfm2lU0vHDvns
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359695820"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="359695820"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 07:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="741750834"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="741750834"
Received: from gfittedx-mobl.ger.corp.intel.com ([10.252.47.115])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 07:38:07 -0700
Date: Mon, 5 Jun 2023 17:38:04 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/2] serial: 8250: Apply FSL workarounds also without
 SERIAL_8250_CONSOLE
In-Reply-To: <20230605142225.75l6px3ep5ythkl6@pengutronix.de>
Message-ID: <9fa2b513-24a5-2e37-9a63-1fd5f53fa92@linux.intel.com>
References: <20230605130857.85543-1-u.kleine-koenig@pengutronix.de> <20230605130857.85543-3-u.kleine-koenig@pengutronix.de> <2d70e8b-7722-71e7-76f3-d27a2b2caa55@linux.intel.com> <20230605133445.vi762odw2v7pkrog@pengutronix.de> <f01b13f5-34c9-62fc-52fd-33e923e2a2ba@linux.intel.com>
 <20230605142225.75l6px3ep5ythkl6@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1799272671-1685975891=:2703"
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
Cc: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Liang He <windhl@126.com>, linux-serial <linux-serial@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, kernel@pengutronix.de, Matthew Gerlach <matthew.gerlach@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1799272671-1685975891=:2703
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Mon, 5 Jun 2023, Uwe Kleine-König wrote:

> Hello Ilpo,
> 
> On Mon, Jun 05, 2023 at 04:44:08PM +0300, Ilpo Järvinen wrote:
> > On Mon, 5 Jun 2023, Uwe Kleine-König wrote:
> > > On Mon, Jun 05, 2023 at 04:22:55PM +0300, Ilpo Järvinen wrote:
> > > > On Mon, 5 Jun 2023, Uwe Kleine-König wrote:
> > > > 
> > > > > The need to handle the FSL variant of 8250 in a special way is also
> > > > > present without console support. So soften the dependency for
> > > > > SERIAL_8250_FSL accordingly. Note that with the 8250 driver compiled as
> > > > > a module, some devices still might not make use of the needed
> > > > > workarounds. That affects the ports instantiated in
> > > > > arch/powerpc/kernel/legacy_serial.c.
> > > > > 
> > > > > This issue was identified by Dominik Andreas Schorpp.
> > > > > 
> > > > > To cope for CONFIG_SERIAL_8250=m + CONFIG_SERIAL_8250_FSL=y, 8250_fsl.o
> > > > > must be put in the same compilation unit as 8250_port.o because the
> > > > > latter defines some functions needed in the former and so 8250_fsl.o
> > > > > must not be built-in if 8250_port.o is available in a module.
> > > > > 
> > > > > Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > > > Link: https://lore.kernel.org/r/20230531083230.2702181-1-u.kleine-koenig@pengutronix.de
> > > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > ---
> > > > >  drivers/tty/serial/8250/Kconfig  | 2 +-
> > > > >  drivers/tty/serial/8250/Makefile | 2 +-
> > > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
> > > > > index 5313aa31930f..10c09b19c871 100644
> > > > > --- a/drivers/tty/serial/8250/Kconfig
> > > > > +++ b/drivers/tty/serial/8250/Kconfig
> > > > > @@ -378,7 +378,7 @@ config SERIAL_8250_BCM2835AUX
> > > > >  
> > > > >  config SERIAL_8250_FSL
> > > > >  	bool "Freescale 16550 UART support" if COMPILE_TEST && !(PPC || ARM || ARM64)
> > > > > -	depends on SERIAL_8250_CONSOLE
> > > > > +	depends on SERIAL_8250
> > > > 
> > > > Just one additional thought: After the adding the arch side 
> > > > workaround/hack, SERIAL_8250_FSL could become a tristate?
> > > 
> > > I see no benefit for a module separate from 8250_base.ko. There are
> > > dependencies in both directions between 8250_port.o and 8250_fsl.o[1].
> > > So in my book a bool SERIAL_8250_FSL that modifies 8250_base.ko (with
> > > SERIAL_8250=m) is fine.
> > > 
> > > Best regards
> > > Uwe
> > > 
> > > [1] 8250_port.o uses fsl8250_handle_irq() from 8250_fsl.o
> > 
> > Is that after some fix which isn't in tty-next? I see only these:
> > 
> > $ git grep -l fsl8250_handle_irq
> > arch/powerpc/kernel/legacy_serial.c
> > drivers/tty/serial/8250/8250_fsl.c
> > drivers/tty/serial/8250/8250_of.c
> > include/linux/serial_8250.h
> > 
> > No users of fsl8250_handle_irq in 8250_port.c.
> 
> Ah right, I was too quick:
> 
> 	8250_of.o uses fsl8250_handle_irq() from 8250_fsl.o
> 	8250_fsl.o uses serial8250_modem_status() from 8250_port.o (which is in 8250_base.o)
> 
> 
> However linking 8250_fsl.o in 8250_of.o isn't a good solution either as
> 8250_fsl.o should also be available with CONFIG_SERIAL_OF_PLATFORM
> disabled to provide the ACPI driver. And as 8250_of.o already depends on
> 8250_port.o (e.g. via serial8250_em485_config()) adding 8250_fsl.o
> together with 8250_port.o into 8250_base.ko is fine and doesn't add new
> dependencies.

So we have dependencies one-way only:

8250_port

/\    |\
        \
8250_fsl \
         /
/\      /

8250_of

There's no loop here, both they be indepedent modules and configured 
independently (with a correct IS_*() in 8250_of.c).

-- 
 i.

--8323329-1799272671-1685975891=:2703--
