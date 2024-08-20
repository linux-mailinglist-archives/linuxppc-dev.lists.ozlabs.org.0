Return-Path: <linuxppc-dev+bounces-208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8B957EE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 09:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp0hz1l60z2xxr;
	Tue, 20 Aug 2024 17:00:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YRUgjv4T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp0hy5kkCz2xfP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 17:00:18 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K0qXMU001292;
	Tue, 20 Aug 2024 07:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=f
	RpfA3zQu03Luta8zveHTrUwdTsaFN3gAu//vwa7JUA=; b=YRUgjv4TzuFH/qlb2
	/epz9WMUKZIKXmWaBoa0oMsC3rbxp6eFJvV/36RwaHUXwqJdNf8Cb66HcdlpOpuo
	se74hw5fYKpu5JDkZBJ+7aTvuwgmu09pc0Ugwdk7XJCsZ8QWTjH0T4W16NM9oWyk
	1FFSDPj/SgG/7778ArtlNaPR3yOr8o7Uoo5fuF5VqQrCNgvqwaPX0b29DGoTe7h8
	v4ukhkxmScJu+sS8oUKkZ6zdv41b3XgMcpmO5g1Bkl+hliBP8bdhlVsdnSHmntQ6
	ziUJ4pfqnDmTX0bWc7qQJWVk1/7vhtd7I2Zk2sLisdmOqIn+hgD4FWPZM1SJmrVn
	yHEAQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mc4kxb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 07:00:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47K6kcU4019105;
	Tue, 20 Aug 2024 07:00:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41376pspmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 07:00:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47K708M654985052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 07:00:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 373052004D;
	Tue, 20 Aug 2024 07:00:08 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6263320040;
	Tue, 20 Aug 2024 07:00:07 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Aug 2024 07:00:07 +0000 (GMT)
Message-ID: <58493a3f-d920-46d4-8a55-365584725ec5@linux.ibm.com>
Date: Tue, 20 Aug 2024 12:30:06 +0530
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
Subject: Re: [PATCH v4 4/5] powerpc/32: Convert patch_instruction() to
 patch_uint()
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Naveen N Rao <naveen@kernel.org>
References: <20240515024445.236364-1-bgray@linux.ibm.com>
 <20240515024445.236364-5-bgray@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20240515024445.236364-5-bgray@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qUqb2ttECqtUXLggAfFPRLbm_4wVEfuU
X-Proofpoint-GUID: qUqb2ttECqtUXLggAfFPRLbm_4wVEfuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200048



On 15/05/24 8:14 am, Benjamin Gray wrote:
> These changes are for patch_instruction() uses on data. Unlike ppc64
> these should not be incorrect as-is, but using the patch_uint() alias
> better reflects what kind of data being patched and allows for
> benchmarking the effect of different patch_* implementations (e.g.,
> skipping instruction flushing when patching data).
> 
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Tested-by: Hari Bathini <hbathini@linux.ibm.com>

> ---
>   arch/powerpc/kernel/static_call.c     | 2 +-
>   arch/powerpc/platforms/powermac/smp.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/static_call.c b/arch/powerpc/kernel/static_call.c
> index 863a7aa24650..1502b7e439ca 100644
> --- a/arch/powerpc/kernel/static_call.c
> +++ b/arch/powerpc/kernel/static_call.c
> @@ -17,7 +17,7 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
>   	mutex_lock(&text_mutex);
>   
>   	if (func && !is_short) {
> -		err = patch_instruction(tramp + PPC_SCT_DATA, ppc_inst(target));
> +		err = patch_ulong(tramp + PPC_SCT_DATA, target);
>   		if (err)
>   			goto out;
>   	}
> diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
> index 15644be31990..d21b681f52fb 100644
> --- a/arch/powerpc/platforms/powermac/smp.c
> +++ b/arch/powerpc/platforms/powermac/smp.c
> @@ -827,7 +827,7 @@ static int smp_core99_kick_cpu(int nr)
>   	mdelay(1);
>   
>   	/* Restore our exception vector */
> -	patch_instruction(vector, ppc_inst(save_vector));
> +	patch_uint(vector, save_vector);
>   
>   	local_irq_restore(flags);
>   	if (ppc_md.progress) ppc_md.progress("smp_core99_kick_cpu done", 0x347);

