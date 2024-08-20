Return-Path: <linuxppc-dev+bounces-211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CEB957EE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 09:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp0ms2d0kz2y8V;
	Tue, 20 Aug 2024 17:03:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p9WtnMAv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp0ms0DYdz2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 17:03:40 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JIg7NR004655;
	Tue, 20 Aug 2024 07:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=P
	HJX21vLwGG2SodHSm0pMc9+YZbr7R7iemFeYvOvfn8=; b=p9WtnMAvbmp3lejVk
	0sVJ+RXtl/z6ovrGPOwRwppu7RL39vrHS5xLd7vyFyovxRX4TsXp1D+v/ow1yO2L
	9H58d4pCHC/nlwBjXgMAbxEebALht4M41mm/rTLmTqfY/DWpg5Q/qvZenrjcI6KE
	L/ynuGdUjScIKyouxptEbn4NLZeLIXlNpITHQlH6GT7xWt0fwnDEPPvyxhx14VLq
	BHatNdbdKtQAkADPkx3AfRwG9PIcM8hik5I+hWdvzdpu7GBgzJRwQNLj4T8D7IVH
	hP21Skwd3iBYOm7l2b8m6KQI2pB9xMEz/rTORkPm5YlgKY9BxdafzN3LcB3r09cp
	2XkVw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4141y1mtkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 07:03:37 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47K2l2xA029443;
	Tue, 20 Aug 2024 07:03:36 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4138dm9g81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 07:03:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47K73Tww49873400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 07:03:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0981C2004F;
	Tue, 20 Aug 2024 07:03:29 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32DE22004D;
	Tue, 20 Aug 2024 07:03:28 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Aug 2024 07:03:27 +0000 (GMT)
Message-ID: <398e285c-6146-4dbc-b439-8f9e8f34a903@linux.ibm.com>
Date: Tue, 20 Aug 2024 12:33:27 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] powerpc/code-patching: Add data patch alignment
 check
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Naveen N Rao <naveen@kernel.org>
References: <20240515024445.236364-1-bgray@linux.ibm.com>
 <20240515024445.236364-3-bgray@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20240515024445.236364-3-bgray@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R11co7MnjA93D5iuShJZYCGorQjq_RZy
X-Proofpoint-ORIG-GUID: R11co7MnjA93D5iuShJZYCGorQjq_RZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200051



On 15/05/24 8:14 am, Benjamin Gray wrote:
> The new data patching still needs to be aligned within a
> cacheline too for the flushes to work correctly. To simplify
> this requirement, we just say data patches must be aligned.
> 
> Detect when data patching is not aligned, returning an invalid
> argument error.
> 
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> 
> ---
> 
> v3: * New in v3
> ---
>   arch/powerpc/include/asm/code-patching.h | 6 ++++++
>   arch/powerpc/lib/code-patching.c         | 6 ++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
> index 21a36e2c4e26..e7f14720f630 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -95,11 +95,17 @@ int patch_ulong(void *addr, unsigned long val);
>   
>   static inline int patch_uint(void *addr, unsigned int val)
>   {
> +	if (!IS_ALIGNED((unsigned long)addr, sizeof(unsigned int)))
> +		return -EINVAL;
> +
>   	return patch_instruction(addr, ppc_inst(val));
>   }
>   
>   static inline int patch_ulong(void *addr, unsigned long val)
>   {
> +	if (!IS_ALIGNED((unsigned long)addr, sizeof(unsigned long)))
> +		return -EINVAL;
> +
>   	return patch_instruction(addr, ppc_inst(val));
>   }
>   
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 18f762616db9..384b275d1bc5 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -386,12 +386,18 @@ NOKPROBE_SYMBOL(patch_instruction);
>   
>   int patch_uint(void *addr, unsigned int val)
>   {
> +	if (!IS_ALIGNED((unsigned long)addr, sizeof(unsigned int)))
> +		return -EINVAL;
> +
>   	return patch_mem(addr, val, false);
>   }
>   NOKPROBE_SYMBOL(patch_uint);
>   
>   int patch_ulong(void *addr, unsigned long val)
>   {
> +	if (!IS_ALIGNED((unsigned long)addr, sizeof(unsigned long)))
> +		return -EINVAL;
> +
>   	return patch_mem(addr, val, true);
>   }
>   NOKPROBE_SYMBOL(patch_ulong);

