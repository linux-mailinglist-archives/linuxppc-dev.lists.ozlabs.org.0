Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 858951AAEBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 18:55:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492T4f5WZ0zDqkK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 02:55:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=nLe0vVLo; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492T1L6gcCzDqGx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 02:52:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492T1G34qPz9txlF;
 Wed, 15 Apr 2020 18:52:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nLe0vVLo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4uNJBYzAgdll; Wed, 15 Apr 2020 18:52:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492T1G1nWnz9txlC;
 Wed, 15 Apr 2020 18:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586969554; bh=LsLKLyYl5Xjy0u/asdU6KE2rzMETjuCz4yGERb2R7lY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nLe0vVLokIt1HlSp6M9UgQxg29bu7rGlfUNloODZ/xYnqi8GX3qXd80cEmVZK2oXd
 7wxh8522SWdc+6hummsiG8VuXLeWPYHtQ2FEJT6zPoC9aJTRGT9v0c333ua0bqJo4V
 4XPlIibLV0jBMHETKyDVWmmO5/gQMMNDDuskMC4A=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A6118BB85;
 Wed, 15 Apr 2020 18:52:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 32BWtQTR5Mhd; Wed, 15 Apr 2020 18:52:34 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D83B8BB8C;
 Wed, 15 Apr 2020 18:52:33 +0200 (CEST)
Subject: Re: [PATCH v2,5/5] drivers: uio: new driver for fsl_85xx_cache_sram
To: Wang Wenhu <wenhu.wang@vivo.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, oss@buserror.net, linuxppc-dev@lists.ozlabs.org
References: <20200415124929.GA3265842@kroah.com>
 <20200415152442.122873-1-wenhu.wang@vivo.com>
 <20200415152442.122873-6-wenhu.wang@vivo.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <37b6b890-e537-7424-6b26-04565681f40a@c-s.fr>
Date: Wed, 15 Apr 2020 18:52:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415152442.122873-6-wenhu.wang@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/04/2020 à 17:24, Wang Wenhu a écrit :
> A driver for freescale 85xx platforms to access the Cache-Sram form
> user level. This is extremely helpful for some user-space applications
> that require high performance memory accesses.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> ---
> Changes since v1:
>   * Addressed comments of Greg K-H
>   * Moved kfree(info->name) into uio_info_free_internal()
> ---
>   drivers/uio/Kconfig                   |   8 ++
>   drivers/uio/Makefile                  |   1 +
>   drivers/uio/uio_fsl_85xx_cache_sram.c | 182 ++++++++++++++++++++++++++
>   3 files changed, 191 insertions(+)
>   create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c
> 
> diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
> index 202ee81cfc2b..afd38ec13de0 100644
> --- a/drivers/uio/Kconfig
> +++ b/drivers/uio/Kconfig
> @@ -105,6 +105,14 @@ config UIO_NETX
>   	  To compile this driver as a module, choose M here; the module
>   	  will be called uio_netx.
>   
> +config UIO_FSL_85XX_CACHE_SRAM
> +	tristate "Freescale 85xx Cache-Sram driver"
> +	depends on FSL_85XX_CACHE_SRAM

Is there any point having FSL_85XX_CACHE_SRAM without this ?

Should it be the other way round, leave FSL_85XX_CACHE_SRAM unselectable 
by user, and this driver select FSL_85XX_CACHE_SRAM instead of depending 
on it ?

> +	help
> +	  Generic driver for accessing the Cache-Sram form user level. This
> +	  is extremely helpful for some user-space applications that require
> +	  high performance memory accesses.
> +
>   config UIO_FSL_ELBC_GPCM
>   	tristate "eLBC/GPCM driver"
>   	depends on FSL_LBC
> diff --git a/drivers/uio/Makefile b/drivers/uio/Makefile
> index c285dd2a4539..be2056cffc21 100644
> --- a/drivers/uio/Makefile
> +++ b/drivers/uio/Makefile
> @@ -10,4 +10,5 @@ obj-$(CONFIG_UIO_NETX)	+= uio_netx.o
>   obj-$(CONFIG_UIO_PRUSS)         += uio_pruss.o
>   obj-$(CONFIG_UIO_MF624)         += uio_mf624.o
>   obj-$(CONFIG_UIO_FSL_ELBC_GPCM)	+= uio_fsl_elbc_gpcm.o
> +obj-$(CONFIG_UIO_FSL_85XX_CACHE_SRAM)	+= uio_fsl_85xx_cache_sram.o
>   obj-$(CONFIG_UIO_HV_GENERIC)	+= uio_hv_generic.o
> diff --git a/drivers/uio/uio_fsl_85xx_cache_sram.c b/drivers/uio/uio_fsl_85xx_cache_sram.c
> new file mode 100644
> index 000000000000..fb6903fdaddb
> --- /dev/null
> +++ b/drivers/uio/uio_fsl_85xx_cache_sram.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Vivo Communication Technology Co. Ltd.
> + * Copyright (C) 2020 Wang Wenhu <wenhu.wang@vivo.com>
> + * All rights reserved.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/uio_driver.h>
> +#include <linux/stringify.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <asm/fsl_85xx_cache_sram.h>
> +
> +#define DRIVER_NAME	"uio_fsl_85xx_cache_sram"
> +#define UIO_NAME	"uio_cache_sram"
> +
> +static const struct of_device_id uio_mpc85xx_l2ctlr_of_match[] = {
> +	{	.compatible = "uio,fsl,p2020-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p2010-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1020-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1011-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1013-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1022-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,mpc8548-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,mpc8544-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,mpc8572-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,mpc8536-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1021-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1012-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1025-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1016-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1024-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1015-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,p1010-l2-cache-controller",	},
> +	{	.compatible = "uio,fsl,bsc9131-l2-cache-controller",	},
> +	{},
> +};
> +
> +static void uio_info_free_internal(struct uio_info *info)
> +{
> +	struct uio_mem *uiomem = &info->mem[0];
> +
> +	while (uiomem < &info->mem[MAX_UIO_MAPS]) {
> +		if (uiomem->size) {
> +			mpc85xx_cache_sram_free(uiomem->internal_addr);
> +			kfree(uiomem->name);
> +		}
> +		uiomem++;
> +	}
> +
> +	kfree(info->name);
> +}
> +
> +static int uio_fsl_85xx_cache_sram_probe(struct platform_device *pdev)
> +{
> +	struct device_node *parent = pdev->dev.of_node;
> +	struct device_node *node = NULL;
> +	struct uio_info *info;
> +	struct uio_mem *uiomem;
> +	const char *dt_name;
> +	u32 mem_size;
> +	u32 align;

Align is not used outside of the for loop, it should be declared in the 
loop block.

> +	void *virt;

Same for virt

> +	phys_addr_t phys;

Same for phys

> +	int ret = -ENODEV;

It looks like this init value is unneeded, you should leave 'ret' 
uninitialised (unless I missed some way out and you get a warning).

> +
> +	/* alloc uio_info for one device */
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info) {
> +		ret = -ENOMEM;
> +		goto err_out;

Nothing special is done at err_out, you should instead do:

	if (!info)
		return -ENOMEM;

> +	}
> +
> +	/* get optional uio name */
> +	if (of_property_read_string(parent, "uio_name", &dt_name))
> +		dt_name = UIO_NAME;
> +
> +	info->name = kstrdup(dt_name, GFP_KERNEL);
> +	if (!info->name) {
> +		ret = -ENOMEM;
> +		goto err_info_free;
> +	}
> +
> +	uiomem = &info->mem[0];

I'd prefer
	uiomem = info->mem;

> +	for_each_child_of_node(parent, node) {
> +		ret = of_property_read_u32(node, "cache-mem-size", &mem_size);
> +		if (ret) {
> +			ret = -EINVAL;
> +			goto err_info_free_internel;
> +		}
> +
> +		if (mem_size == 0) {
> +			dev_err(&pdev->dev, "cache-mem-size should not be 0\n");
> +			ret = -EINVAL;
> +			goto err_info_free_internel;
> +		}
> +
> +		align = 2;
> +		while (align < mem_size)
> +			align *= 2;

I think ilog2() or one of it friends should be used here, maybe 
roundup_pow_of_two()

> +		virt = mpc85xx_cache_sram_alloc(mem_size, &phys, align);
> +		if (!virt) {
> +			/* mpc85xx_cache_sram_alloc to define the cause */
> +			ret = -EINVAL;

Should it be -ENOMEM like any allocation failure ?

> +			goto err_info_free_internel;
> +		}
> +
> +		uiomem->memtype = UIO_MEM_PHYS;
> +		uiomem->addr = phys;
> +		uiomem->size = mem_size;
> +		uiomem->name = kstrdup(node->name, GFP_KERNEL);;
> +		uiomem->internal_addr = virt;
> +		++uiomem;

Usually people use

	uiomem++;

> +
> +		if (uiomem >= &info->mem[MAX_UIO_MAPS]) {

I'd prefer
		if (uiomem - info->mem >= MAX_UIO_MAPS) {

> +			dev_warn(&pdev->dev, "more than %d uio-maps for device.\n",
> +				 MAX_UIO_MAPS);
> +			break;
> +		}
> +	}
> +
> +	while (uiomem < &info->mem[MAX_UIO_MAPS]) {

I'd prefer

	while (uiomem - info->mem < MAX_UIO_MAPS) {

> +		uiomem->size = 0;
> +		++uiomem;
> +	}
> +
> +	if (info->mem[0].size == 0) {

Is there any point in doing all the clearing loop above if it's to bail 
out here ?

Wouldn't it be cleaner to do the test above the clearing loop, by just 
checking whether uiomem is still equal to info->mem ?

> +		dev_err(&pdev->dev, "error no valid uio-map configured\n");
> +		ret = -EINVAL;
> +		goto err_info_free_internel;
> +	}
> +
> +	info->version = "0.1.0";

Could you define some DRIVER_VERSION in the top of the file next to 
DRIVER_NAME instead of hard coding in the middle on a function ?

> +
> +	/* register uio device */
> +	if (uio_register_device(&pdev->dev, info)) {
> +		dev_err(&pdev->dev, "uio registration failed\n");
> +		ret = -ENODEV;
> +		goto err_info_free_internel;
> +	}
> +
> +	platform_set_drvdata(pdev, info);
> +
> +	return 0;
> +err_info_free_internel:

Do you mean 'internal' instead of 'internel' ?

> +	uio_info_free_internal(info);
> +err_info_free:
> +	kfree(info);
> +err_out:
> +	return ret;
> +}
> +
> +static int uio_fsl_85xx_cache_sram_remove(struct platform_device *pdev)
> +{
> +	struct uio_info *info = platform_get_drvdata(pdev);
> +
> +	uio_unregister_device(info);
> +
> +	uio_info_free_internal(info);
> +
> +	kfree(info);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver uio_fsl_85xx_cache_sram = {
> +	.probe = uio_fsl_85xx_cache_sram_probe,
> +	.remove = uio_fsl_85xx_cache_sram_remove,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.owner = THIS_MODULE,
> +		.of_match_table	= uio_mpc85xx_l2ctlr_of_match,
> +	},
> +};
> +
> +module_platform_driver(uio_fsl_85xx_cache_sram);
> +
> +MODULE_AUTHOR("Wang Wenhu <wenhu.wang@vivo.com>");
> +MODULE_DESCRIPTION("Freescale MPC85xx Cache-Sram UIO Platform Driver");
> +MODULE_ALIAS("platform:" DRIVER_NAME);
> +MODULE_LICENSE("GPL v2");
> 

Christophe
