Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 743AA722750
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 15:24:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZZ7z1pfXz3f91
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 23:24:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VCD9rf0Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VCD9rf0Z;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZZ761M5yz3dyX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 23:23:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685971410; x=1717507410;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GaPBRwh/p3/q9XjwiMmF7kgvfkl5/deErODgA22dN94=;
  b=VCD9rf0ZLlZ5h5U3sGYidDJqFC3byjLiX/4hNNeMT32Q0J6aBOF0aSAb
   8tLx4XV08PNspbqn4jwmIn8ZR3rTA4HrQ3fejkiIPXH1Mr0kmm/WbGm5u
   r3aD3ZuhqIyyd6sFEA2ggpuJma3ZJ/esvrOuIYWCf4lBxEam5O0mWVpf9
   8JU1D/Ftd60Uhw/mXaKCHoEHa6O4ixvCw6vy8enVWPk3V7K0069tcc3pJ
   LXa3kSjzTADgrfK0R8qFBGm+HngzZ591dWuPdMrc01PJ4evAQ+J2h8dUM
   OLnIxtSrD/9GulrfvqbXZwdJeqfUBzT41pnZ6VeKqvp5tgD8cNRqfIP5p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359676145"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="359676145"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 06:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="882905242"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="882905242"
Received: from gfittedx-mobl.ger.corp.intel.com ([10.252.47.115])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 06:22:58 -0700
Date: Mon, 5 Jun 2023 16:22:55 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/2] serial: 8250: Apply FSL workarounds also without
 SERIAL_8250_CONSOLE
In-Reply-To: <20230605130857.85543-3-u.kleine-koenig@pengutronix.de>
Message-ID: <2d70e8b-7722-71e7-76f3-d27a2b2caa55@linux.intel.com>
References: <20230605130857.85543-1-u.kleine-koenig@pengutronix.de> <20230605130857.85543-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-830021027-1685971383=:2703"
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
Cc: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Liang He <windhl@126.com>, linux-serial <linux-serial@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, kernel@pengutronix.de, Matthew Gerlach <matthew.gerlach@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-830021027-1685971383=:2703
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 5 Jun 2023, Uwe Kleine-König wrote:

> The need to handle the FSL variant of 8250 in a special way is also
> present without console support. So soften the dependency for
> SERIAL_8250_FSL accordingly. Note that with the 8250 driver compiled as
> a module, some devices still might not make use of the needed
> workarounds. That affects the ports instantiated in
> arch/powerpc/kernel/legacy_serial.c.
> 
> This issue was identified by Dominik Andreas Schorpp.
> 
> To cope for CONFIG_SERIAL_8250=m + CONFIG_SERIAL_8250_FSL=y, 8250_fsl.o
> must be put in the same compilation unit as 8250_port.o because the
> latter defines some functions needed in the former and so 8250_fsl.o
> must not be built-in if 8250_port.o is available in a module.
> 
> Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Link: https://lore.kernel.org/r/20230531083230.2702181-1-u.kleine-koenig@pengutronix.de
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/tty/serial/8250/Kconfig  | 2 +-
>  drivers/tty/serial/8250/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
> index 5313aa31930f..10c09b19c871 100644
> --- a/drivers/tty/serial/8250/Kconfig
> +++ b/drivers/tty/serial/8250/Kconfig
> @@ -378,7 +378,7 @@ config SERIAL_8250_BCM2835AUX
>  
>  config SERIAL_8250_FSL
>  	bool "Freescale 16550 UART support" if COMPILE_TEST && !(PPC || ARM || ARM64)
> -	depends on SERIAL_8250_CONSOLE
> +	depends on SERIAL_8250

Just one additional thought: After the adding the arch side 
workaround/hack, SERIAL_8250_FSL could become a tristate?

(1/2 might need a small change to take into account that it can now be a 
module).

>  	default PPC || ARM || ARM64
>  	help
>  	  Selecting this option enables a workaround for a break-detection
> diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
> index 4fc2fc1f41b6..8824ba5295b6 100644
> --- a/drivers/tty/serial/8250/Makefile
> +++ b/drivers/tty/serial/8250/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_SERIAL_8250)		+= 8250.o 8250_base.o
>  8250_base-$(CONFIG_SERIAL_8250_DMA)	+= 8250_dma.o
>  8250_base-$(CONFIG_SERIAL_8250_DWLIB)	+= 8250_dwlib.o
>  8250_base-$(CONFIG_SERIAL_8250_FINTEK)	+= 8250_fintek.o
> +8250_base-$(CONFIG_SERIAL_8250_FSL)	+= 8250_fsl.o
>  8250_base-$(CONFIG_SERIAL_8250_PCILIB)	+= 8250_pcilib.o
>  obj-$(CONFIG_SERIAL_8250_PARISC)	+= 8250_parisc.o
>  obj-$(CONFIG_SERIAL_8250_PCI)		+= 8250_pci.o
> @@ -28,7 +29,6 @@ obj-$(CONFIG_SERIAL_8250_BOCA)		+= 8250_boca.o
>  obj-$(CONFIG_SERIAL_8250_EXAR_ST16C554)	+= 8250_exar_st16c554.o
>  obj-$(CONFIG_SERIAL_8250_HUB6)		+= 8250_hub6.o
>  obj-$(CONFIG_SERIAL_8250_PCI1XXXX)	+= 8250_pci1xxxx.o
> -obj-$(CONFIG_SERIAL_8250_FSL)		+= 8250_fsl.o
>  obj-$(CONFIG_SERIAL_8250_MEN_MCB)	+= 8250_men_mcb.o
>  obj-$(CONFIG_SERIAL_8250_DFL)		+= 8250_dfl.o
>  obj-$(CONFIG_SERIAL_8250_DW)		+= 8250_dw.o

-- 
 i.

--8323329-830021027-1685971383=:2703--
