Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69379544D4C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 15:17:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJl5C2Ctxz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 23:17:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jNfas8vR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jNfas8vR;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJl4b1qNbz3bmR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 23:17:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A22CB82DD9;
	Thu,  9 Jun 2022 13:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590A0C34114;
	Thu,  9 Jun 2022 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654780633;
	bh=VWVhudhXitwHFDO5y5M/fP2VcY4/QVsKqgiTQAOqbeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNfas8vROLNPT8oBljMNAoiNvmlwO40wcKpZRWyQ5mgTG3wPDiQstZ+YzXDw1k0KQ
	 GLFNkH9n+GsmQvqV+qwracnYThiNtNc9lgg4POoooqy2PIy6aoOadL1qCSGYgagcgH
	 NUndr56byvLXB6rtQ/xPqnsKz9YbfNn0rMy2n3R4=
Date: Thu, 9 Jun 2022 15:17:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wang Wenhu <wenhu.wang@hotmail.com>
Subject: Re: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Message-ID: <YqHy1uXwCLlJmftr@kroah.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 09, 2022 at 03:28:55AM -0700, Wang Wenhu wrote:
> The l2-cache could be optionally configured as SRAM partly or fully.
> Users can make use of it as a block of independent memory that offers
> special usage, such as for debuging or other cratical status info
> storage which keeps consistently even when the whole system crashed.
> 
> The hardware related configuration process utilized the work of the
> earlier implementation, which has been removed now.
> See: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=dc21ed2aef4150fc2fcf58227a4ff24502015c03
> 
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Wang Wenhu <wenhu.wang@hotmail.com>
> ---
>  drivers/uio/Kconfig                   |  10 +
>  drivers/uio/Makefile                  |   1 +
>  drivers/uio/uio_fsl_85xx_cache_sram.c | 286 ++++++++++++++++++++++++++
>  3 files changed, 297 insertions(+)
>  create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c
> 
> diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
> index 2e16c5338e5b..9199ced03880 100644
> --- a/drivers/uio/Kconfig
> +++ b/drivers/uio/Kconfig
> @@ -105,6 +105,16 @@ config UIO_NETX
>  	  To compile this driver as a module, choose M here; the module
>  	  will be called uio_netx.
>  
> +config UIO_FSL_85XX_CACHE_SRAM
> +	tristate "Freescale 85xx Cache-Sram driver"
> +	depends on FSL_SOC_BOOKE && PPC32
> +	help
> +	  Generic driver for accessing the Cache-Sram form user level. This
> +	  is extremely helpful for some user-space applications that require
> +	  high performance memory accesses.
> +
> +	  If you don't know what to do here, say N.

Module name information?

> +
>  config UIO_FSL_ELBC_GPCM
>  	tristate "eLBC/GPCM driver"
>  	depends on FSL_LBC
> diff --git a/drivers/uio/Makefile b/drivers/uio/Makefile
> index f2f416a14228..1ba07d92a1b1 100644
> --- a/drivers/uio/Makefile
> +++ b/drivers/uio/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_UIO_MF624)         += uio_mf624.o
>  obj-$(CONFIG_UIO_FSL_ELBC_GPCM)	+= uio_fsl_elbc_gpcm.o
>  obj-$(CONFIG_UIO_HV_GENERIC)	+= uio_hv_generic.o
>  obj-$(CONFIG_UIO_DFL)	+= uio_dfl.o
> +obj-$(CONFIG_UIO_FSL_85XX_CACHE_SRAM)	+= uio_fsl_85xx_cache_sram.o
> diff --git a/drivers/uio/uio_fsl_85xx_cache_sram.c b/drivers/uio/uio_fsl_85xx_cache_sram.c
> new file mode 100644
> index 000000000000..d363f9d2b179
> --- /dev/null
> +++ b/drivers/uio/uio_fsl_85xx_cache_sram.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022 Wang Wenhu <wenhu.wang@hotmail.com>
> + * All rights reserved.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/uio_driver.h>
> +#include <linux/stringify.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/of_address.h>
> +#include <linux/io.h>
> +
> +#define DRIVER_NAME		"uio_mpc85xx_cache_sram"
> +#define UIO_INFO_VER	"0.0.1"
> +#define UIO_NAME		"uio_cache_sram"
> +
> +#define L2CR_L2FI				0x40000000	/* L2 flash invalidate */
> +#define L2CR_L2IO				0x00200000	/* L2 instruction only */
> +#define L2CR_SRAM_ZERO			0x00000000	/* L2SRAM zero size */
> +#define L2CR_SRAM_FULL			0x00010000	/* L2SRAM full size */
> +#define L2CR_SRAM_HALF			0x00020000	/* L2SRAM half size */
> +#define L2CR_SRAM_TWO_HALFS		0x00030000	/* L2SRAM two half sizes */
> +#define L2CR_SRAM_QUART			0x00040000	/* L2SRAM one quarter size */
> +#define L2CR_SRAM_TWO_QUARTS	0x00050000	/* L2SRAM two quarter size */
> +#define L2CR_SRAM_EIGHTH		0x00060000	/* L2SRAM one eighth size */
> +#define L2CR_SRAM_TWO_EIGHTH	0x00070000	/* L2SRAM two eighth size */
> +
> +#define L2SRAM_OPTIMAL_SZ_SHIFT	0x00000003	/* Optimum size for L2SRAM */
> +
> +#define L2SRAM_BAR_MSK_LO18		0xFFFFC000	/* Lower 18 bits */
> +#define L2SRAM_BARE_MSK_HI4		0x0000000F	/* Upper 4 bits */
> +
> +enum cache_sram_lock_ways {
> +	LOCK_WAYS_ZERO,
> +	LOCK_WAYS_EIGHTH,
> +	LOCK_WAYS_TWO_EIGHTH,

Why not have values for these?

> +	LOCK_WAYS_HALF = 4,
> +	LOCK_WAYS_FULL = 8,
> +};
> +
> +struct mpc85xx_l2ctlr {
> +	u32	ctl;		/* 0x000 - L2 control */

What is the endian of these u32 values?  You map them directly to
memory, so they must be specified some way, right?  Please make it
obvious what they are.

> +	u8	res1[0xC];
> +	u32	ewar0;		/* 0x010 - External write address 0 */
> +	u32	ewarea0;	/* 0x014 - External write address extended 0 */
> +	u32	ewcr0;		/* 0x018 - External write ctrl */
> +	u8	res2[4];
> +	u32	ewar1;		/* 0x020 - External write address 1 */
> +	u32	ewarea1;	/* 0x024 - External write address extended 1 */
> +	u32	ewcr1;		/* 0x028 - External write ctrl 1 */
> +	u8	res3[4];
> +	u32	ewar2;		/* 0x030 - External write address 2 */
> +	u32	ewarea2;	/* 0x034 - External write address extended 2 */
> +	u32	ewcr2;		/* 0x038 - External write ctrl 2 */
> +	u8	res4[4];
> +	u32	ewar3;		/* 0x040 - External write address 3 */
> +	u32	ewarea3;	/* 0x044 - External write address extended 3 */
> +	u32	ewcr3;		/* 0x048 - External write ctrl 3 */
> +	u8	res5[0xB4];
> +	u32	srbar0;		/* 0x100 - SRAM base address 0 */
> +	u32	srbarea0;	/* 0x104 - SRAM base addr reg ext address 0 */
> +	u32	srbar1;		/* 0x108 - SRAM base address 1 */
> +	u32	srbarea1;	/* 0x10C - SRAM base addr reg ext address 1 */
> +	u8	res6[0xCF0];
> +	u32	errinjhi;	/* 0xE00 - Error injection mask high */
> +	u32	errinjlo;	/* 0xE04 - Error injection mask low */
> +	u32	errinjctl;	/* 0xE08 - Error injection tag/ecc control */
> +	u8	res7[0x14];
> +	u32	captdatahi;	/* 0xE20 - Error data high capture */
> +	u32	captdatalo;	/* 0xE24 - Error data low capture */
> +	u32	captecc;	/* 0xE28 - Error syndrome */
> +	u8	res8[0x14];
> +	u32	errdet;		/* 0xE40 - Error detect */
> +	u32	errdis;		/* 0xE44 - Error disable */
> +	u32	errinten;	/* 0xE48 - Error interrupt enable */
> +	u32	errattr;	/* 0xE4c - Error attribute capture */
> +	u32	erradrrl;	/* 0xE50 - Error address capture low */
> +	u32	erradrrh;	/* 0xE54 - Error address capture high */
> +	u32	errctl;		/* 0xE58 - Error control */
> +	u8	res9[0x1A4];
> +};
> +
> +static int uio_cache_sram_setup(struct platform_device *pdev,
> +				phys_addr_t base, u8 ways)
> +{
> +	struct mpc85xx_l2ctlr __iomem *l2ctlr = of_iomap(pdev->dev.of_node, 0);
> +
> +	if (!l2ctlr) {
> +		dev_err(&pdev->dev, "can not map l2 controller\n");
> +		return -EINVAL;
> +	}
> +
> +	/* write bits[0-17] to srbar0 */
> +	out_be32(&l2ctlr->srbar0, lower_32_bits(base) & L2SRAM_BAR_MSK_LO18);
> +
> +	/* write bits[18-21] to srbare0 */
> +#ifdef CONFIG_PHYS_64BIT

No #ifdef in .c files please.

> +	out_be32(&l2ctlr->srbarea0, upper_32_bits(base) & L2SRAM_BARE_MSK_HI4);
> +#endif
> +
> +	clrsetbits_be32(&l2ctlr->ctl, L2CR_L2E, L2CR_L2FI);
> +
> +	switch (ways) {
> +	case LOCK_WAYS_EIGHTH:
> +		setbits32(&l2ctlr->ctl, L2CR_L2E | L2CR_L2FI | L2CR_SRAM_EIGHTH);
> +		break;
> +
> +	case LOCK_WAYS_TWO_EIGHTH:
> +		setbits32(&l2ctlr->ctl, L2CR_L2E | L2CR_L2FI | L2CR_SRAM_QUART);
> +		break;
> +
> +	case LOCK_WAYS_HALF:
> +		setbits32(&l2ctlr->ctl, L2CR_L2E | L2CR_L2FI | L2CR_SRAM_HALF);
> +		break;
> +
> +	case LOCK_WAYS_FULL:
> +	default:
> +		setbits32(&l2ctlr->ctl, L2CR_L2E | L2CR_L2FI | L2CR_SRAM_FULL);
> +		break;
> +	}
> +	eieio();
> +
> +	return 0;
> +}
> +
> +static const struct vm_operations_struct uio_cache_sram_vm_ops = {
> +#ifdef CONFIG_HAVE_IOREMAP_PROT

Same here.

> +	.access = generic_access_phys,
> +#endif
> +};
> +
> +static int uio_cache_sram_mmap(struct uio_info *info,
> +				struct vm_area_struct *vma)
> +{
> +	struct uio_mem *mem = info->mem;
> +
> +	if (mem->addr & ~PAGE_MASK)
> +		return -ENODEV;
> +
> +	if ((vma->vm_end - vma->vm_start > mem->size) ||
> +		(mem->size == 0) ||
> +		(mem->memtype != UIO_MEM_PHYS))
> +		return -EINVAL;
> +
> +	vma->vm_ops = &uio_cache_sram_vm_ops;
> +	vma->vm_page_prot = pgprot_cached(vma->vm_page_prot);
> +
> +	return remap_pfn_range(vma,
> +						   vma->vm_start,
> +						   mem->addr >> PAGE_SHIFT,
> +						   vma->vm_end - vma->vm_start,
> +						   vma->vm_page_prot);

Odd indentation, did you use checkpatch.pl on your patch?

> +}
> +
> +static int uio_cache_sram_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct uio_info *info;
> +	struct uio_mem *uiomem;
> +	const char *dt_name;
> +	phys_addr_t mem_base;
> +	u32 l2cache_size;
> +	u32 mem_size;
> +	u32 rem;
> +	u8 ways;
> +	int ret;
> +
> +	if (!node) {
> +		dev_err(&pdev->dev, "device's of_node is null\n");

How can that happen?

> +		return -EINVAL;
> +	}

thanks,

greg k-h
