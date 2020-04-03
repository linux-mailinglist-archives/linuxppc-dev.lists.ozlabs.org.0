Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1A319DABF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:03:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v4Vh5hWwzDq8X
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 03:03:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.33.202; helo=13.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 13.mo3.mail-out.ovh.net (13.mo3.mail-out.ovh.net
 [188.165.33.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v4Mt1WyCzDrDf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 02:58:00 +1100 (AEDT)
Received: from player761.ha.ovh.net (unknown [10.108.54.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 8DADF2487C9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 17:48:25 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id 2371D1119FAAA;
 Fri,  3 Apr 2020 15:48:16 +0000 (UTC)
Subject: Re: [PATCH v2 1/4] scsi: cxlflash: Access interrupt trigger page from
 xive directly
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 christophe_lombard@fr.ibm.com, ajd@linux.ibm.com, ukrishn@linux.ibm.com,
 mrochs@linux.ibm.com
References: <20200403153838.29224-1-fbarrat@linux.ibm.com>
 <20200403153838.29224-2-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <da35afa6-fad8-260b-b08b-573879fac489@kaod.org>
Date: Fri, 3 Apr 2020 17:48:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403153838.29224-2-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6541759936675220377
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeigdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeiuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: haren@linux.ibm.com, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/3/20 5:38 PM, Frederic Barrat wrote:
> xive is already mapping the trigger page in kernel space and it can be
> accessed through standard APIs, so let's reuse it and simplify the code.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 

> ---
> Changelog:
> v2: Define rc = -ENXIO on the error path (Matt)
> 
> 	
>  drivers/scsi/cxlflash/ocxl_hw.c | 18 ++++++++----------
>  drivers/scsi/cxlflash/ocxl_hw.h |  1 -
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
> index 7018cd802569..d6eec434a607 100644
> --- a/drivers/scsi/cxlflash/ocxl_hw.c
> +++ b/drivers/scsi/cxlflash/ocxl_hw.c
> @@ -15,7 +15,8 @@
>  #include <linux/pseudo_fs.h>
>  #include <linux/poll.h>
>  #include <linux/sched/signal.h>
> -
> +#include <linux/interrupt.h>
> +#include <asm/xive.h>
>  #include <misc/ocxl.h>
>  
>  #include <uapi/misc/cxl.h>
> @@ -180,7 +181,7 @@ static int afu_map_irq(u64 flags, struct ocxlflash_context *ctx, int num,
>  	struct ocxl_hw_afu *afu = ctx->hw_afu;
>  	struct device *dev = afu->dev;
>  	struct ocxlflash_irqs *irq;
> -	void __iomem *vtrig;
> +	struct xive_irq_data *xd;
>  	u32 virq;
>  	int rc = 0;
>  
> @@ -204,15 +205,15 @@ static int afu_map_irq(u64 flags, struct ocxlflash_context *ctx, int num,
>  		goto err1;
>  	}
>  
> -	vtrig = ioremap(irq->ptrig, PAGE_SIZE);
> -	if (unlikely(!vtrig)) {
> -		dev_err(dev, "%s: Trigger page mapping failed\n", __func__);
> -		rc = -ENOMEM;
> +	xd = irq_get_handler_data(virq);
> +	if (unlikely(!xd)) {
> +		dev_err(dev, "%s: Can't get interrupt data\n", __func__);
> +		rc = -ENXIO;
>  		goto err2;
>  	}
>  
>  	irq->virq = virq;
> -	irq->vtrig = vtrig;
> +	irq->vtrig = xd->trig_mmio;
>  out:
>  	return rc;
>  err2:
> @@ -259,8 +260,6 @@ static void afu_unmap_irq(u64 flags, struct ocxlflash_context *ctx, int num,
>  	}
>  
>  	irq = &ctx->irqs[num];
> -	if (irq->vtrig)
> -		iounmap(irq->vtrig);
>  
>  	if (irq_find_mapping(NULL, irq->hwirq)) {
>  		free_irq(irq->virq, cookie);
> @@ -648,7 +647,6 @@ static int alloc_afu_irqs(struct ocxlflash_context *ctx, int num)
>  		}
>  
>  		irqs[i].hwirq = hwirq;
> -		irqs[i].ptrig = addr;
>  	}
>  
>  	ctx->irqs = irqs;
> diff --git a/drivers/scsi/cxlflash/ocxl_hw.h b/drivers/scsi/cxlflash/ocxl_hw.h
> index fc6ad4f985de..f2fe88816bea 100644
> --- a/drivers/scsi/cxlflash/ocxl_hw.h
> +++ b/drivers/scsi/cxlflash/ocxl_hw.h
> @@ -13,7 +13,6 @@
>  struct ocxlflash_irqs {
>  	int hwirq;
>  	u32 virq;
> -	u64 ptrig;
>  	void __iomem *vtrig;
>  };
>  
> 

