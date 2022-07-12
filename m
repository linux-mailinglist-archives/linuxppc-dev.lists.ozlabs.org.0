Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48116572141
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 18:44:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj65w1BPcz3c7B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 02:44:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sm5Diobr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sm5Diobr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lj6585XJsz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 02:43:23 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CGXJGg006733;
	Tue, 12 Jul 2022 16:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=PCNpx8EVKCaEh4fq9MuvoS+aL3z8TQbPhHD6h27q/cw=;
 b=sm5DiobrR7leqKwlcVjJJO//8Yg4U4/zjlc4xrDMUdHSw7hhbWpGIEf2cQ39Aw5UmIXQ
 JhJoRl3kpHviTPNO5gqUwu+sOVgDLr+HwmulO+FX0mmJERQvDmWX3DOWMoRR4QaEDxwQ
 7G/yzS1mlr7jPt448yfn0g5+Zg6oDOanVROFmTbUYoeFOFRhP/b93WXrvhaFESvQijuZ
 7zTIcPzp87NaZWTz1yPciUNpn6+ZpZLQ5lWMRMuoBNVCOMKPa2i6h/oxbfsIIv7AuKCH
 RASe7k/Z0DnoSd0Xz2lHG/nUwLQxBA6cDmZhegJpwTb6ql1KGAvKNKAwmfBkcQigdrs+ AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h997u6pay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 16:43:18 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26CEx9GA014966;
	Tue, 12 Jul 2022 16:43:17 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h997u6pa4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 16:43:17 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CGLN40007730;
	Tue, 12 Jul 2022 16:43:15 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma02fra.de.ibm.com with ESMTP id 3h71a8kr1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 16:43:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26CGhNoF30605626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Jul 2022 16:43:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A052411C04C;
	Tue, 12 Jul 2022 16:43:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F37C811C04A;
	Tue, 12 Jul 2022 16:43:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 12 Jul 2022 16:43:11 +0000 (GMT)
Received: from [9.43.200.237] (unknown [9.43.200.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9505060307;
	Wed, 13 Jul 2022 02:43:00 +1000 (AEST)
Message-ID: <44d580dab2836bbb8679067b25c8702447c498e2.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] cxl: Use the bitmap API to allocate bitmaps
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Frederic Barrat
	 <fbarrat@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Date: Wed, 13 Jul 2022 02:42:57 +1000
In-Reply-To: <59010cc7c62443030c69cb1ce0b2b62c5d47e064.1657566849.git.christophe.jaillet@wanadoo.fr>
References: 	<59010cc7c62443030c69cb1ce0b2b62c5d47e064.1657566849.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3WBbq7UcLn3rymRqn3IykH5F0GqYZ9yl
X-Proofpoint-ORIG-GUID: Owctm63FHLYZW1Jq5eIyHN4ti1QtVrYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_10,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120065
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-11 at 21:14 +0200, Christophe JAILLET wrote:
> Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.
> 
> It is less verbose and it improves the semantic.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks!

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>  drivers/misc/cxl/context.c | 2 +-
>  drivers/misc/cxl/guest.c   | 2 +-
>  drivers/misc/cxl/irq.c     | 3 +--
>  drivers/misc/cxl/of.c      | 5 ++---
>  4 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/cxl/context.c b/drivers/misc/cxl/context.c
> index e627b4056623..acaa44809c58 100644
> --- a/drivers/misc/cxl/context.c
> +++ b/drivers/misc/cxl/context.c
> @@ -331,7 +331,7 @@ static void reclaim_ctx(struct rcu_head *rcu)
>                 __free_page(ctx->ff_page);
>         ctx->sstp = NULL;
>  
> -       kfree(ctx->irq_bitmap);
> +       bitmap_free(ctx->irq_bitmap);
>  
>         /* Drop ref to the afu device taken during cxl_context_init
> */
>         cxl_afu_put(ctx->afu);
> diff --git a/drivers/misc/cxl/guest.c b/drivers/misc/cxl/guest.c
> index 3321c014913c..375f692ae9d6 100644
> --- a/drivers/misc/cxl/guest.c
> +++ b/drivers/misc/cxl/guest.c
> @@ -1053,7 +1053,7 @@ static void free_adapter(struct cxl *adapter)
>                 if (adapter->guest->irq_avail) {
>                         for (i = 0; i < adapter->guest->irq_nranges;
> i++) {
>                                 cur = &adapter->guest->irq_avail[i];
> -                               kfree(cur->bitmap);
> +                               bitmap_free(cur->bitmap);
>                         }
>                         kfree(adapter->guest->irq_avail);
>                 }
> diff --git a/drivers/misc/cxl/irq.c b/drivers/misc/cxl/irq.c
> index 5f0e2dcebb34..0ce91d99aead 100644
> --- a/drivers/misc/cxl/irq.c
> +++ b/drivers/misc/cxl/irq.c
> @@ -319,8 +319,7 @@ int afu_allocate_irqs(struct cxl_context *ctx,
> u32 count)
>         }
>  
>         ctx->irq_count = count;
> -       ctx->irq_bitmap = kcalloc(BITS_TO_LONGS(count),
> -                                 sizeof(*ctx->irq_bitmap),
> GFP_KERNEL);
> +       ctx->irq_bitmap = bitmap_zalloc(count, GFP_KERNEL);
>         if (!ctx->irq_bitmap)
>                 goto out;
>  
> diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
> index 1cfecba42d01..25ce725035e7 100644
> --- a/drivers/misc/cxl/of.c
> +++ b/drivers/misc/cxl/of.c
> @@ -308,8 +308,7 @@ static int read_adapter_irq_config(struct cxl
> *adapter, struct device_node *np)
>                 cur = &adapter->guest->irq_avail[i];
>                 cur->offset = be32_to_cpu(ranges[i * 2]);
>                 cur->range  = be32_to_cpu(ranges[i * 2 + 1]);
> -               cur->bitmap = kcalloc(BITS_TO_LONGS(cur->range),
> -                               sizeof(*cur->bitmap), GFP_KERNEL);
> +               cur->bitmap = bitmap_zalloc(cur->range, GFP_KERNEL);
>                 if (cur->bitmap == NULL)
>                         goto err;
>                 if (cur->offset < adapter->guest->irq_base_offset)
> @@ -326,7 +325,7 @@ static int read_adapter_irq_config(struct cxl
> *adapter, struct device_node *np)
>  err:
>         for (i--; i >= 0; i--) {
>                 cur = &adapter->guest->irq_avail[i];
> -               kfree(cur->bitmap);
> +               bitmap_free(cur->bitmap);
>         }
>         kfree(adapter->guest->irq_avail);
>         adapter->guest->irq_avail = NULL;


