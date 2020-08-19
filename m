Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3338249542
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 08:49:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWdgn0MVhzDqq3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 16:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWddt4rPGzDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 16:48:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWddn6Dxpz9tx2t;
 Wed, 19 Aug 2020 08:48:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sLh0Bt0UnGdV; Wed, 19 Aug 2020 08:48:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWddn5CFsz9tx2s;
 Wed, 19 Aug 2020 08:48:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B40318B7F3;
 Wed, 19 Aug 2020 08:48:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qM2bDxTqw8S9; Wed, 19 Aug 2020 08:48:14 +0200 (CEST)
Received: from [172.25.230.104] (po15451.idsi0.si.c-s.fr [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86F238B767;
 Wed, 19 Aug 2020 08:48:14 +0200 (CEST)
Subject: Re: [PATCH v3] soc: fsl: enable acpi support
To: Ran Wang <ran.wang_1@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20200819040031.40204-1-ran.wang_1@nxp.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <02fa05ad-6d39-e16d-ad02-7472d28b6627@csgroup.eu>
Date: Wed, 19 Aug 2020 08:48:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819040031.40204-1-ran.wang_1@nxp.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Peng Ma <peng.ma@nxp.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/08/2020 à 06:00, Ran Wang a écrit :
> From: Peng Ma <peng.ma@nxp.com>
> 
> This patch enables ACPI support in RCPM driver.

Can you change the subject to "soc: fsl: enable acpi support in RCPM 
driver" ?

> 
> Signed-off-by: Peng Ma <peng.ma@nxp.com>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v3:
>   - Add #ifdef CONFIG_ACPI for acpi_device_id
>   - Rename rcpm_acpi_imx_ids to rcpm_acpi_ids
> 
> Change in v2:
>   - Update acpi_device_id to fix conflict with other driver
> 
>   drivers/soc/fsl/rcpm.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
> index a093dbe..55d1d73 100644
> --- a/drivers/soc/fsl/rcpm.c
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -2,7 +2,7 @@
>   //
>   // rcpm.c - Freescale QorIQ RCPM driver
>   //
> -// Copyright 2019 NXP
> +// Copyright 2019-2020 NXP
>   //
>   // Author: Ran Wang <ran.wang_1@nxp.com>
>   
> @@ -13,6 +13,7 @@
>   #include <linux/slab.h>
>   #include <linux/suspend.h>
>   #include <linux/kernel.h>
> +#include <linux/acpi.h>
>   
>   #define RCPM_WAKEUP_CELL_MAX_SIZE	7
>   
> @@ -125,6 +126,7 @@ static int rcpm_probe(struct platform_device *pdev)
>   
>   	ret = device_property_read_u32(&pdev->dev,
>   			"#fsl,rcpm-wakeup-cells", &rcpm->wakeup_cells);
> +

This blank line addition is unrelated to the patch and shouldn't be there.

Christophe

>   	if (ret)
>   		return ret;
>   
> @@ -139,10 +141,19 @@ static const struct of_device_id rcpm_of_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, rcpm_of_match);
>   
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id rcpm_acpi_ids[] = {
> +	{"NXP0015",},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, rcpm_acpi_ids);
> +#endif
> +
>   static struct platform_driver rcpm_driver = {
>   	.driver = {
>   		.name = "rcpm",
>   		.of_match_table = rcpm_of_match,
> +		.acpi_match_table = ACPI_PTR(rcpm_acpi_ids),
>   		.pm	= &rcpm_pm_ops,
>   	},
>   	.probe = rcpm_probe,
> 
