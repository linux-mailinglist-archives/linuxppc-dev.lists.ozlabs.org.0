Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F25DA19CDB6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:01:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tg7g6G4nzDrdg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:01:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tfDP68TpzDrRY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 10:19:59 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032N3nfP114625; Thu, 2 Apr 2020 19:19:55 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303uj5t8a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 19:19:55 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 032NFWme013929;
 Thu, 2 Apr 2020 23:19:55 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 301x76mgwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 23:19:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032NJrrC15598444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 23:19:53 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 740E3AE05F;
 Thu,  2 Apr 2020 23:19:53 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2EF9AE05C;
 Thu,  2 Apr 2020 23:19:52 +0000 (GMT)
Received: from p8tul1-build.aus.stglabs.ibm.com (unknown [9.3.141.206])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Apr 2020 23:19:52 +0000 (GMT)
Date: Thu, 2 Apr 2020 18:19:49 -0500
From: "Matthew R. Ochs" <mrochs@linux.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH 1/4] scsi: cxlflash: Access interrupt trigger page from
 xive directly
Message-ID: <20200402231949.GA5469@p8tul1-build.aus.stglabs.ibm.com>
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
 <20200402154352.586166-2-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402154352.586166-2-fbarrat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_13:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020166
X-Mailman-Approved-At: Fri, 03 Apr 2020 10:59:24 +1100
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

On Thu, Apr 02, 2020 at 05:43:49PM +0200, Frederic Barrat wrote:
> xive is already mapping the trigger page in kernel space and it can be
> accessed through standard APIs, so let's reuse it and simplify the code.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  drivers/scsi/cxlflash/ocxl_hw.c | 17 +++++++----------
>  drivers/scsi/cxlflash/ocxl_hw.h |  1 -
>  2 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
> index 7018cd802569..59452850f71c 100644
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
> @@ -204,15 +205,14 @@ static int afu_map_irq(u64 flags, struct ocxlflash_context *ctx, int num,
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

The removal of setting the return code injects a bug should this error leg
ever be encountered. So we should either keep the rc statement e.g. -EINVAL,
-ENXIO, -ENODEV, etc., or remove this error leg. I lean towards keeping the
statement.

>  		goto err2;
>  	}
>  
>  	irq->virq = virq;
> -	irq->vtrig = vtrig;
> +	irq->vtrig = xd->trig_mmio;
>  out:
> 
