Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 671FA19DABA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:01:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v4SB2b7DzDqxG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 03:01:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mrochs@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v4Dc3B3qzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 02:51:44 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033FYJdi133738; Fri, 3 Apr 2020 11:51:40 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 305emg464v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 11:51:39 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 033FogCJ008555;
 Fri, 3 Apr 2020 15:51:39 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 301x77xkqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 15:51:39 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 033Fpbta51839260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 15:51:37 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DBB1AC05F;
 Fri,  3 Apr 2020 15:51:37 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEE0BAC05B;
 Fri,  3 Apr 2020 15:51:36 +0000 (GMT)
Received: from p8tul1-build.aus.stglabs.ibm.com (unknown [9.3.141.206])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Apr 2020 15:51:36 +0000 (GMT)
Date: Fri, 3 Apr 2020 10:51:35 -0500
From: "Matthew R. Ochs" <mrochs@linux.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] scsi: cxlflash: Access interrupt trigger page
 from xive directly
Message-ID: <20200403155135.GB6661@p8tul1-build.aus.stglabs.ibm.com>
References: <20200403153838.29224-1-fbarrat@linux.ibm.com>
 <20200403153838.29224-2-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403153838.29224-2-fbarrat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_11:2020-04-03,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=2
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030133
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
Cc: ukrishn@linux.ibm.com, ajd@linux.ibm.com, haren@linux.ibm.com,
 groug@kaod.org, clg@kaod.org, linuxppc-dev@lists.ozlabs.org,
 christophe_lombard@fr.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 03, 2020 at 05:38:35PM +0200, Frederic Barrat wrote:
> xive is already mapping the trigger page in kernel space and it can be
> accessed through standard APIs, so let's reuse it and simplify the code.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Looks good!

Acked-by: Matthew R. Ochs <mrochs@linux.ibm.com>

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
> -- 
> 2.25.1
> 
