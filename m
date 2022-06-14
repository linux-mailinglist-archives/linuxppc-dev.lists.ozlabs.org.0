Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2905B54A985
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 08:34:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMdw10tXCz3bks
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 16:34:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JfXOcRKG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JfXOcRKG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMdvM1bksz3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 16:34:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7E7C60BC3;
	Tue, 14 Jun 2022 06:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE730C3411B;
	Tue, 14 Jun 2022 06:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655188457;
	bh=Yt7B6XU8vtMdfA51/vbEyvmR+klBCsIE6DU6scdx+Og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JfXOcRKG6gytRIWoUWF+HR/e3gHAYGqUiRg3WCPJyW5WVCpp/iMdhVBmnNztuboW4
	 0+ZS3UT8Ivf8sGSPfxp2Nt0NkbktTzfOZ0eRB3ltI2NtTQPR55cq+UUKTMUUJrAPNU
	 vvZil3YCJ4cjkodWsLgagixCDy1i0EczEJVpuSiY=
Date: Tue, 14 Jun 2022 08:34:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wenhu Wang <wenhu.wang@hotmail.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8yXSB1?=
 =?utf-8?Q?io=3Apowerpc=3Ampc85xx?= =?utf-8?Q?=3A?= l2-cache-sram uio driver
 implementation
Message-ID: <Yqgr5jKEypU83yBF@kroah.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 14, 2022 at 06:09:35AM +0000, Wenhu Wang wrote:
> Hi Greg, thanks for the comments.
> The questions are replied specifically below.
> I have figured out and tested the patch v2, which is to be posted later.
> >发件人: Greg KH <gregkh@linuxfoundation.org>
> >发送时间: 2022年6月9日 21:17
> >收件人: Wang Wenhu <wenhu.wang@hotmail.com>
> >抄送: christophe.leroy@csgroup.eu <christophe.leroy@csgroup.eu>; mpe@ellerman.id.au <mpe@ellerman.id.au>; linuxppc-dev@lists.ozlabs.org <linuxppc-dev@lists.ozlabs.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> >主题: Re: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver implementation 
> > 
> >On Thu, Jun 09, 2022 at 03:28:55AM -0700, Wang Wenhu wrote:
> >> The l2-cache could be optionally configured as SRAM partly or fully.
> >> Users can make use of it as a block of independent memory that offers
> >> special usage, such as for debuging or other cratical status info
> >> storage which keeps consistently even when the whole system crashed.
> >> 
> >> The hardware related configuration process utilized the work of the
> >> earlier implementation, which has been removed now.
> >> See: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=dc21ed2aef4150fc2fcf58227a4ff24502015c03
> >> 
> >> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Signed-off-by: Wang Wenhu <wenhu.wang@hotmail.com>
> >> ---
> >>  drivers/uio/Kconfig                   |  10 +
> >>  drivers/uio/Makefile                  |   1 +
> >>  drivers/uio/uio_fsl_85xx_cache_sram.c | 286 ++++++++++++++++++++++++++
> >>  3 files changed, 297 insertions(+)
> >>  create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c
> >> 
> >> diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
> >> index 2e16c5338e5b..9199ced03880 100644
> >> --- a/drivers/uio/Kconfig
> >> +++ b/drivers/uio/Kconfig
> >> @@ -105,6 +105,16 @@ config UIO_NETX
> >>          To compile this driver as a module, choose M here; the module
> >>          will be called uio_netx.
> >>  
> >> +config UIO_FSL_85XX_CACHE_SRAM
> >> +     tristate "Freescale 85xx Cache-Sram driver"
> >> +     depends on FSL_SOC_BOOKE && PPC32
> >> +     help
> >> +       Generic driver for accessing the Cache-Sram form user level. This
> >> +       is extremely helpful for some user-space applications that require
> >> +       high performance memory accesses.
> >> +
> >> +       If you don't know what to do here, say N.
> >
> >Module name information?
> >
>  
> More detailed and clearer info in v2
> 
> >> +
> >>  config UIO_FSL_ELBC_GPCM
> >>        tristate "eLBC/GPCM driver"
> >>        depends on FSL_LBC
> >> diff --git a/drivers/uio/Makefile b/drivers/uio/Makefile
> >> index f2f416a14228..1ba07d92a1b1 100644
> >> --- a/drivers/uio/Makefile
> >> +++ b/drivers/uio/Makefile
> >> @@ -12,3 +12,4 @@ obj-$(CONFIG_UIO_MF624)         += uio_mf624.o
> >>  obj-$(CONFIG_UIO_FSL_ELBC_GPCM)      += uio_fsl_elbc_gpcm.o
> >>  obj-$(CONFIG_UIO_HV_GENERIC) += uio_hv_generic.o
> >>  obj-$(CONFIG_UIO_DFL)        += uio_dfl.o
> >> +obj-$(CONFIG_UIO_FSL_85XX_CACHE_SRAM)        += uio_fsl_85xx_cache_sram.o
> >> diff --git a/drivers/uio/uio_fsl_85xx_cache_sram.c b/drivers/uio/uio_fsl_85xx_cache_sram.c
> >> new file mode 100644
> >> index 000000000000..d363f9d2b179
> >> --- /dev/null
> >> +++ b/drivers/uio/uio_fsl_85xx_cache_sram.c
> >> @@ -0,0 +1,286 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (C) 2022 Wang Wenhu <wenhu.wang@hotmail.com>
> >> + * All rights reserved.
> >> + */
> >> +
> >> +#include <linux/platform_device.h>
> >> +#include <linux/uio_driver.h>
> >> +#include <linux/stringify.h>
> >> +#include <linux/module.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/of_address.h>
> >> +#include <linux/io.h>
> >> +
> >> +#define DRIVER_NAME          "uio_mpc85xx_cache_sram"
> >> +#define UIO_INFO_VER "0.0.1"
> >> +#define UIO_NAME             "uio_cache_sram"
> >> +
> >> +#define L2CR_L2FI                            0x40000000      /* L2 flash invalidate */
> >> +#define L2CR_L2IO                            0x00200000      /* L2 instruction only */
> >> +#define L2CR_SRAM_ZERO                       0x00000000      /* L2SRAM zero size */
> >> +#define L2CR_SRAM_FULL                       0x00010000      /* L2SRAM full size */
> >> +#define L2CR_SRAM_HALF                       0x00020000      /* L2SRAM half size */
> >> +#define L2CR_SRAM_TWO_HALFS          0x00030000      /* L2SRAM two half sizes */
> >> +#define L2CR_SRAM_QUART                      0x00040000      /* L2SRAM one quarter size */
> >> +#define L2CR_SRAM_TWO_QUARTS 0x00050000      /* L2SRAM two quarter size */
> >> +#define L2CR_SRAM_EIGHTH             0x00060000      /* L2SRAM one eighth size */
> >> +#define L2CR_SRAM_TWO_EIGHTH 0x00070000      /* L2SRAM two eighth size */
> >> +
> >> +#define L2SRAM_OPTIMAL_SZ_SHIFT      0x00000003      /* Optimum size for L2SRAM */
> >> +
> >> +#define L2SRAM_BAR_MSK_LO18          0xFFFFC000      /* Lower 18 bits */
> >> +#define L2SRAM_BARE_MSK_HI4          0x0000000F      /* Upper 4 bits */
> >> +
> >> +enum cache_sram_lock_ways {
> >> +     LOCK_WAYS_ZERO,
> >> +     LOCK_WAYS_EIGHTH,
> >> +     LOCK_WAYS_TWO_EIGHTH,
> >
> >Why not have values for these?
> >
> 
> full values given in v2
> 
> >> +     LOCK_WAYS_HALF = 4,
> >> +     LOCK_WAYS_FULL = 8,
> >> +};
> >> +
> >> +struct mpc85xx_l2ctlr {
> >> +     u32     ctl;            /* 0x000 - L2 control */
> >
> >What is the endian of these u32 values?  You map them directly to
> >memory, so they must be specified some way, right?  Please make it
> >obvious what they are.
> >
> 
> Surely, the values should be u32 here, modified in v2
> The controller info could be found in
> "QorIQ™ P2020 Integrated Processor Reference Manual"
> "Chapter 6 L2 Look-Aside Cache/SRAM"
> See: http://m4udit.dinauz.org/P2020RM_rev0.pdf

That's not the answer to my question :)

These are big-endian, right?  Please mark them as such and access them
properly with the correct functions.

> >> +     return remap_pfn_range(vma,
> >> +                                                vma->vm_start,
> >> +                                                mem->addr >> PAGE_SHIFT,
> >> +                                                vma->vm_end - vma->vm_start,
> >> +                                                vma->vm_page_prot);
> >
> >Odd indentation, did you use checkpatch.pl on your patch?
> >
> 
> Actually, I checked with the scripts, and there was no warning here.
> I also checked in text editors and vim, if I translate tab with 4 spaces,
> the "vma/mem" areas in the 5 lines were aligned.

Tabs in Linux are always 8 spaces wide.

thanks,

greg k-h
