Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7DA72281D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 16:02:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZb0S6LHGz3f8F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 00:02:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lx/znn1I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lx/znn1I;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZZzf25jwz3dxf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 00:02:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685973726; x=1717509726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NGA9rIhc908BS62unw9O7z7MJCnWPsT9GleQVLM6vWc=;
  b=Lx/znn1IyxPBWzhHc85VQMN4yzCR/iugWOyJvfZWv+zQBayY6WsSQs3x
   HrL9SLaLXn7LpLbMDjsPZIZ21Vxvro3mrUzGQ4UWPt3Fj0fujWpLQrOz2
   2v4HYG2khItn05d2fZHqtkTMuWW2g9WhaapSvObF6ZuslVWcmECdx13A4
   /oP/ZpS0TwUVAqcWC9CUINVpDgG09wrSMKe2hG4zP8BJt39JqjSA3xJVS
   GVPhjBEjDzyWDCmQrbD3vHly4xG28oEWk/5+MPmVi7AHSbXFOwvv5Bphw
   38zuaCrlcANB5hVIjw4mnHfoFj6PyFxgOx00eWt63D2ffkN8LnEecVqOu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358820542"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358820542"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 07:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="773746578"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="773746578"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jun 2023 07:01:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q6Alh-001O7Z-1L;
	Mon, 05 Jun 2023 17:01:09 +0300
Date: Mon, 5 Jun 2023 17:01:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v3 2/2] serial: 8250: Apply FSL workarounds also without
 SERIAL_8250_CONSOLE
Message-ID: <ZH3qpAw9+dDzGVzf@smile.fi.intel.com>
References: <20230605130857.85543-1-u.kleine-koenig@pengutronix.de>
 <20230605130857.85543-3-u.kleine-koenig@pengutronix.de>
 <2d70e8b-7722-71e7-76f3-d27a2b2caa55@linux.intel.com>
 <20230605133445.vi762odw2v7pkrog@pengutronix.de>
 <f01b13f5-34c9-62fc-52fd-33e923e2a2ba@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f01b13f5-34c9-62fc-52fd-33e923e2a2ba@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Rob Herring <robh@kernel.org>, kernel@pengutronix.de, Geert Uytterhoeven <geert+renesas@glider.be>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, linux-serial <linux-serial@vger.kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Matthew Gerlach <matthew.gerlach@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>, Liang He <windhl@126.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 05, 2023 at 04:44:08PM +0300, Ilpo Järvinen wrote:
> On Mon, 5 Jun 2023, Uwe Kleine-König wrote:
> > On Mon, Jun 05, 2023 at 04:22:55PM +0300, Ilpo Järvinen wrote:
> > > On Mon, 5 Jun 2023, Uwe Kleine-König wrote:
> > > > The need to handle the FSL variant of 8250 in a special way is also
> > > > present without console support. So soften the dependency for
> > > > SERIAL_8250_FSL accordingly. Note that with the 8250 driver compiled as
> > > > a module, some devices still might not make use of the needed
> > > > workarounds. That affects the ports instantiated in
> > > > arch/powerpc/kernel/legacy_serial.c.
> > > > 
> > > > This issue was identified by Dominik Andreas Schorpp.
> > > > 
> > > > To cope for CONFIG_SERIAL_8250=m + CONFIG_SERIAL_8250_FSL=y, 8250_fsl.o
> > > > must be put in the same compilation unit as 8250_port.o because the
> > > > latter defines some functions needed in the former and so 8250_fsl.o
> > > > must not be built-in if 8250_port.o is available in a module.
> > > > 
> > > > Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > > Link: https://lore.kernel.org/r/20230531083230.2702181-1-u.kleine-koenig@pengutronix.de
> > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > >  drivers/tty/serial/8250/Kconfig  | 2 +-
> > > >  drivers/tty/serial/8250/Makefile | 2 +-
> > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
> > > > index 5313aa31930f..10c09b19c871 100644
> > > > --- a/drivers/tty/serial/8250/Kconfig
> > > > +++ b/drivers/tty/serial/8250/Kconfig
> > > > @@ -378,7 +378,7 @@ config SERIAL_8250_BCM2835AUX
> > > >  
> > > >  config SERIAL_8250_FSL
> > > >  	bool "Freescale 16550 UART support" if COMPILE_TEST && !(PPC || ARM || ARM64)
> > > > -	depends on SERIAL_8250_CONSOLE
> > > > +	depends on SERIAL_8250
> > > 
> > > Just one additional thought: After the adding the arch side 
> > > workaround/hack, SERIAL_8250_FSL could become a tristate?
> > 
> > I see no benefit for a module separate from 8250_base.ko. There are
> > dependencies in both directions between 8250_port.o and 8250_fsl.o[1].
> > So in my book a bool SERIAL_8250_FSL that modifies 8250_base.ko (with
> > SERIAL_8250=m) is fine.

> > [1] 8250_port.o uses fsl8250_handle_irq() from 8250_fsl.o
> 
> Is that after some fix which isn't in tty-next? I see only these:
> 
> $ git grep -l fsl8250_handle_irq
> arch/powerpc/kernel/legacy_serial.c
> drivers/tty/serial/8250/8250_fsl.c
> drivers/tty/serial/8250/8250_of.c
> include/linux/serial_8250.h
> 
> No users of fsl8250_handle_irq in 8250_port.c.

> >, and 8250_fsl.o uses serial8250_modem_status from 8250_port.o.

I don't like 8250_base to be fattened by some stuff that has no
generic meaning. Can we avoid putting every quirk there?

-- 
With Best Regards,
Andy Shevchenko


