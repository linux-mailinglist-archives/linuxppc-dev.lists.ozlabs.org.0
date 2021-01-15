Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C87502F729B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 06:57:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH9S86PDhzDsdx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 16:57:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q6FW2NR2; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH9MM1rJmzDsZ5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 16:53:03 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10F5WVV9104602; Fri, 15 Jan 2021 00:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9RzfaDewltJCLho+pt37aiXcKvvoCQLK/mirVHr6Wy0=;
 b=q6FW2NR29Zx9crf+zzyhgdaHFYLfp7TUTLFZ54TFBXC4xkJOsDZQHvhaP8tYkWzXCz0G
 8kvTLmwlbYr4Pgsu3lE6RNQP4BBhicxsQ800KAEzm4T1e5kw0ZPnGvYrsFZhUQom1xOo
 o1Kd2Iub3DCcyMa3h3Y3gCh/aGKN/HUiKDryrQuZKUoQR3er+Yg0dICP2nQbF3ZAK9nB
 vKVEY9yv56Py5YloOfCICRlLJOpf7Pxff6oRZ6T81klg8wEAE37axoRl7y5oOcsLEqKd
 xQKDdfOa52+hYL4qGjJpllo0PNHkXehS5dkFfhJlra3MRK4BGtVeVoi9dejjqmHGFF9d 4Q== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362yhn7kyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 00:52:57 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10F5qfPL015719;
 Fri, 15 Jan 2021 05:52:55 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 35y448krrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 05:52:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10F5qrGO28115384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 05:52:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11B87A405B;
 Fri, 15 Jan 2021 05:52:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3987A4054;
 Fri, 15 Jan 2021 05:52:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 05:52:52 +0000 (GMT)
Received: from [9.102.61.252] (unknown [9.102.61.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 70F6E601F5;
 Fri, 15 Jan 2021 16:52:51 +1100 (AEDT)
Subject: Re: [PATCH 3/6] powerpc/rtas: remove ibm_suspend_me_token
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-4-nathanl@linux.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <8c78ed11-ebd6-af5a-7294-5b77e2acfaa0@linux.ibm.com>
Date: Fri, 15 Jan 2021 16:52:51 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114220004.1138993-4-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_01:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150027
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
Cc: aik@ozlabs.ru, tyreld@linux.ibm.com, brking@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/1/21 9:00 am, Nathan Lynch wrote:
> There's not a compelling reason to cache the value of the token for
> the ibm,suspend-me function. Just look it up when needed in the RTAS
> syscall's special case for it.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   arch/powerpc/kernel/rtas.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index d126d71ea5bd..60fcf7f7b0b8 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -828,7 +828,6 @@ void rtas_activate_firmware(void)
>   		pr_err("ibm,activate-firmware failed (%i)\n", fwrc);
>   }
>   
> -static int ibm_suspend_me_token = RTAS_UNKNOWN_SERVICE;
>   #ifdef CONFIG_PPC_PSERIES
>   /**
>    * rtas_call_reentrant() - Used for reentrant rtas calls
> @@ -1103,7 +1102,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>   		return -EINVAL;
>   
>   	/* Need to handle ibm,suspend_me call specially */
> -	if (token == ibm_suspend_me_token) {
> +	if (token == rtas_token("ibm,suspend-me")) {
>   
>   		/*
>   		 * rtas_ibm_suspend_me assumes the streamid handle is in cpu
> @@ -1191,10 +1190,8 @@ void __init rtas_initialize(void)
>   	 * the stop-self token if any
>   	 */
>   #ifdef CONFIG_PPC64
> -	if (firmware_has_feature(FW_FEATURE_LPAR)) {
> +	if (firmware_has_feature(FW_FEATURE_LPAR))
>   		rtas_region = min(ppc64_rma_size, RTAS_INSTANTIATE_MAX);
> -		ibm_suspend_me_token = rtas_token("ibm,suspend-me");
> -	}
>   #endif
>   	rtas_rmo_buf = memblock_phys_alloc_range(RTAS_RMOBUF_MAX, PAGE_SIZE,
>   						 0, rtas_region);
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
