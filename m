Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2438816F8A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:41:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S76600xJzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:41:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S74D4FrnzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 18:39:56 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01Q7OSel132883
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 02:39:53 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ydcp8483t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 02:39:52 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 26 Feb 2020 07:39:51 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Feb 2020 07:39:49 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01Q7coR437945622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 07:38:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A16E4C062;
 Wed, 26 Feb 2020 07:39:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76FED4C044;
 Wed, 26 Feb 2020 07:39:47 +0000 (GMT)
Received: from pic2.home (unknown [9.145.31.96])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 07:39:47 +0000 (GMT)
Subject: Re: [PATCH] ocxl: Fix misleading comment
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200226043923.5481-1-ajd@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Wed, 26 Feb 2020 08:39:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226043923.5481-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022607-0016-0000-0000-000002EA58A9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022607-0017-0000-0000-0000334D86DA
Message-Id: <d2a8b11a-44d0-24ca-0f3a-da773b6c2c1f@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_01:2020-02-25,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=2 priorityscore=1501
 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260055
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/02/2020 à 05:39, Andrew Donnellan a écrit :
> In ocxl_context_free() we note that the AFU reference we're releasing was
> taken in "ocxl_context_init", a function that doesn't actually exist.
> 
> Fix it to say ocxl_context_alloc() instead, which I expect was what was
> intended.
> 
> Fixes: 5ef3166e8a32 ("ocxl: Driver code for 'generic' opencapi devices")
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---



ocxl_context_init() used to exist. It was renamed to 
ocxl_context_alloc() for good reasons as part of later work. So it 
should really be:
Fixes: b9721d275cc2 ("ocxl: Allow external drivers to use OpenCAPI 
contexts")

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   drivers/misc/ocxl/context.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
> index de8a66b9d76b..c21f65a5c762 100644
> --- a/drivers/misc/ocxl/context.c
> +++ b/drivers/misc/ocxl/context.c
> @@ -287,7 +287,7 @@ void ocxl_context_free(struct ocxl_context *ctx)
>   
>   	ocxl_afu_irq_free_all(ctx);
>   	idr_destroy(&ctx->irq_idr);
> -	/* reference to the AFU taken in ocxl_context_init */
> +	/* reference to the AFU taken in ocxl_context_alloc() */
>   	ocxl_afu_put(ctx->afu);
>   	kfree(ctx);
>   }
> 

