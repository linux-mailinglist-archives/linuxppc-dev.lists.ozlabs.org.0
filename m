Return-Path: <linuxppc-dev+bounces-7343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3A7A71D01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 18:22:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZND9r1qCxz2yqw;
	Thu, 27 Mar 2025 04:22:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743009728;
	cv=none; b=Ah9CIUqx4T7hLhMmdoNULAGRQQaBLtYXI/6VU0jUaXRvYZOUzIOsygebIZL3kHYlrEGKxbyGjwFm4BFN8OxygpzqUiyG+tojuMRefKZxSbvQME9BRQBlgCz5Vci1KsT6+PW2YfAB4sMR0mdZQF0er0YOHoYo+8gWFP0Q9Y3r7EBHYikGUrx7TIS1B0UU8DymQacaI16p5i6GNI7eB1aWZbndMvynKGBDi6REtnY/JwekpaC2Bxzy1NYJcMoYkK7/d2DNHFgbCAl45COa7R5QllfUiZfheBUfyt7SGtAJPrl0ALZnvisBjRGrsYKkqJZKDwPENsAmTxCSgx3OX8p9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743009728; c=relaxed/relaxed;
	bh=st3G8lYJCjPZorj4zGfWtb/UtqpB8imUheOPEssidj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KU+lh7H9/EsWHWFL/2HA0eFpFBIuz60ryoXKm5BiJMhVNXh8nUBCjtII45W96VTNrgCntK697cMkjd+1Vzy7fxRsNaqjXrbPQPlFBWkZDHWB57QUJy9E8x5aj8QzSPSgpe8/keO5xHm2vxfxjHL6henzWrCJnDAsKfcmGdio0RCp9XkHQSz7Zjlf0WbxfytY8SrxWM6aAcGiZ5NEZzdm1UrPBzUHtrAs2ujZOukoPOawixrI24xAcdIP14507CaSu1zLMWBYpq+1ZiB5/2+A0HT5G8Oe82MqKa/9mOjONSm5IzjhtemF2h52avFEB1BZxbnytKZJJem83ZEZljtnYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AKNjnZYQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AKNjnZYQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZND9q15Ywz2yqn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 04:22:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QE3tbY009182;
	Wed, 26 Mar 2025 17:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=st3G8l
	YJCjPZorj4zGfWtb/UtqpB8imUheOPEssidj0=; b=AKNjnZYQPpskG0BBM6brjc
	9HkTPUInGv+BZ2v2y1hMewkGJeIBOJTqP3pJBCuKaMSdTx570m0CMSUH21sYioNv
	ecYA6AjRzgJ8lVdmziQQAOAM9Io1lZtlY/HKCU2eAHQYnRDwsAXEgowR3Qd6f1ui
	Kaf7vU3l4FdN6yv5Zc4MSPwLXe16v+yKKMMOFlHa7Q023CK38pFAdc4iwduk3i2j
	pGuUWi6tLQu6S9RAUaTVkaw1+A6iyQIYKLMdslS01Xkm7+fHWCnvvH0pJN7M4Vmw
	MHvhUIRy2qRc9zUGYlthfYotsX6uO4GgbmM6FF+t6FvhFHqPqjELivr7aPy2RGng
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mk0q95m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 17:21:42 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52QHLfNq003232;
	Wed, 26 Mar 2025 17:21:41 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mk0q95kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 17:21:41 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52QE4xDX025462;
	Wed, 26 Mar 2025 17:21:40 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j7x09k2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 17:21:40 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52QHLcew23790244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Mar 2025 17:21:38 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B87095805F;
	Wed, 26 Mar 2025 17:21:38 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FCD858043;
	Wed, 26 Mar 2025 17:21:35 +0000 (GMT)
Received: from [9.61.254.184] (unknown [9.61.254.184])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Mar 2025 17:21:34 +0000 (GMT)
Message-ID: <1ef83c3e-7254-4c11-ba8d-1998eeffb44a@linux.ibm.com>
Date: Wed, 26 Mar 2025 22:51:33 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] powerpc64/bpf: fix JIT code size calculation of
 bpf trampoline
Content-Language: en-GB
To: Hari Bathini <hbathini@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>, stable@vger.kernel.org
References: <20250326143422.1158383-1-hbathini@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250326143422.1158383-1-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yS_pDSqlXYlTBypRvO0PTEmAUgD0Vo17
X-Proofpoint-ORIG-GUID: CdebN2kUgPJMZEArTLLqgcwU6WqdquVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503260104
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 26/03/25 8:04 pm, Hari Bathini wrote:
> The JIT compile of ldimm instructions can be anywhere between 1-5
> instructions long depending on the value being loaded.
>
> arch_bpf_trampoline_size() provides JIT size of the BPF trampoline
> before the buffer for JIT'ing it is allocated. BPF trampoline JIT
> code has ldimm instructions that need to load the value of pointer
> to struct bpf_tramp_image. But this pointer value is not same while
> calling arch_bpf_trampoline_size() & arch_prepare_bpf_trampoline().
> So, the size arrived at using arch_bpf_trampoline_size() can vary
> from the size needed in arch_prepare_bpf_trampoline(). When the
> number of ldimm instructions emitted in arch_bpf_trampoline_size()
> is less than the number of ldimm instructions emitted during the
> actual JIT compile of trampoline, the below warning is produced:
>
>    WARNING: CPU: 8 PID: 204190 at arch/powerpc/net/bpf_jit_comp.c:981 __arch_prepare_bpf_trampoline.isra.0+0xd2c/0xdcc
>
> which is:
>
>    /* Make sure the trampoline generation logic doesn't overflow */
>    if (image && WARN_ON_ONCE(&image[ctx->idx] >
> 			(u32 *)rw_image_end - BPF_INSN_SAFETY)) {
>
> Pass NULL as the first argument to __arch_prepare_bpf_trampoline()
> call from arch_bpf_trampoline_size() function, to differentiate it
> from how arch_prepare_bpf_trampoline() calls it and ensure maximum
> possible instructions are emitted in arch_bpf_trampoline_size() for
> ldimm instructions that load a different value during the actual JIT
> compile of BPF trampoline.
>
> Fixes: d243b62b7bd3 ("powerpc64/bpf: Add support for bpf trampolines")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/6168bfc8-659f-4b5a-a6fb-90a916dde3b3@linux.ibm.com/
> Cc: stable@vger.kernel.org # v6.13+
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>
> * Removed a redundant '/' accidently added in a comment and resending.
>
>   arch/powerpc/net/bpf_jit_comp.c | 29 +++++++++++++++++++++++------
>   1 file changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 2991bb171a9b..c94717ccb2bd 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -833,7 +833,12 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>   	EMIT(PPC_RAW_STL(_R26, _R1, nvr_off + SZL));
>   
>   	if (flags & BPF_TRAMP_F_CALL_ORIG) {
> -		PPC_LI_ADDR(_R3, (unsigned long)im);
> +		/*
> +		 * Emit maximum possible instructions while getting the size of
> +		 * bpf trampoline to ensure trampoline JIT code doesn't overflow.
> +		 */
> +		PPC_LI_ADDR(_R3, im ? (unsigned long)im :
> +				(unsigned long)(~(1UL << (BITS_PER_LONG - 1))));
>   		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
>   						 (unsigned long)__bpf_tramp_enter);
>   		if (ret)
> @@ -889,7 +894,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>   			bpf_trampoline_restore_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
>   
>   		/* Reserve space to patch branch instruction to skip fexit progs */
> -		im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
> +		if (im)
> +			im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
>   		EMIT(PPC_RAW_NOP());
>   	}
>   
> @@ -912,8 +918,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>   		}
>   
>   	if (flags & BPF_TRAMP_F_CALL_ORIG) {
> -		im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
> -		PPC_LI_ADDR(_R3, im);
> +		if (im)
> +			im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
> +		/*
> +		 * Emit maximum possible instructions while getting the size of
> +		 * bpf trampoline to ensure trampoline JIT code doesn't overflow.
> +		 */
> +		PPC_LI_ADDR(_R3, im ? (unsigned long)im :
> +				(unsigned long)(~(1UL << (BITS_PER_LONG - 1))));
>   		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
>   						 (unsigned long)__bpf_tramp_exit);
>   		if (ret)
> @@ -972,7 +984,6 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>   int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
>   			     struct bpf_tramp_links *tlinks, void *func_addr)
>   {
> -	struct bpf_tramp_image im;
>   	void *image;
>   	int ret;
>   
> @@ -988,7 +999,13 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
>   	if (!image)
>   		return -ENOMEM;
>   
> -	ret = __arch_prepare_bpf_trampoline(&im, image, image + PAGE_SIZE, image,
> +	/*
> +	 * Pass NULL as bpf_tramp_image pointer to differentiate the intent to get the
> +	 * buffer size for trampoline here. This differentiation helps in accounting for
> +	 * maximum possible instructions if the JIT code size is likely to vary during
> +	 * the actual JIT compile of the trampoline.
> +	 */
> +	ret = __arch_prepare_bpf_trampoline(NULL, image, image + PAGE_SIZE, image,
>   					    m, flags, tlinks, func_addr);
>   	bpf_jit_free_exec(image);


Tested this patch by applying on main line kernel, and ran the tests 5 
times, and issue is not seen. Hence the reported issue is fixed.

HeadCommit on which this patch was applied: 
1e26c5e28ca5821a824e90dd359556f5e9e7b89f.

Please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,

Venkat.

>   

