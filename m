Return-Path: <linuxppc-dev+bounces-7887-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D08A9619C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 10:31:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhb721Pfxz3bvX;
	Tue, 22 Apr 2025 18:31:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745310686;
	cv=none; b=Myu98RSDFlf9crDRj5QgIXniAWQcgkPY2mCfXslUGAFWKamWmjFQMwF/obEyYC62mvg5U5RadyS9r6Fggn2iMY6xnk6zFhLzG6sP+MCVpGXlONQ2A6KcUvREf1G/+G8msRnPbvZp19ZzezlKZumM10pkW7xvaylRZ9enUgevPB3R/ncrKilMu3saoK9zlopFAyXbMkO0SXbaip+ufJUM6r7u+VKY6JM36HIYkU0GEddZwKBZdqFKJ+BzZpCye41QiT8UfRewsEqpeqafdqdyxUfgZ+IAb2A25mZVt5tLxy94D+DqIPNveC6EIKqap9++MMwfas5/YuaHmJPQYQZamg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745310686; c=relaxed/relaxed;
	bh=057WiFlQe8mPTuTUY3KnrVyQznfvtj6/+JJAnRm51xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AE0JrOWJWESYy903jGq0k8Q/Vru80jHpQnPvXkH7vKfchHJ2YG7UrarBa4bfgntTUcifc8rp6otpuLngmVymvWtbQU+CBPUcWRIzla9s8r5vX7hFFp38ZMXoVU/ootlYtZELBnriB1wnL7W2f5dDmDP7bjAT+KKwujut4iYsAC0C0StqeSOrpesdeEkzRmhhpTnaCIDYbNJZZRRLf9iLX6mF1N+s/5Hq23gvUKp1yIfR+QlJM4pNpJguo7ubjQmL3fnUJ90z8PdkzWTYORtBik2jINGDDrhGk4jPZcLdrY+ehCD3L1xJLm0+lz226EpCO1/Mtn+8yMQRNtpRZJETXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bKRfE9pb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bKRfE9pb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhb712t4cz3brl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 18:31:25 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LLgMLB029655;
	Tue, 22 Apr 2025 08:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=057WiF
	lQe8mPTuTUY3KnrVyQznfvtj6/+JJAnRm51xI=; b=bKRfE9pb2VuEUCdEIUNud+
	gprNBp6MbY+OlP7z7F4fXptf0xh6grJ4z6MG39Y9mvdCq1xsS/XFikmrqnpNANVe
	LizAIJyAkvIDXP9XiaIHheBBNrdWba9dDO+0bXIi2uYYN6hLDbX9vQ0Jpbn9hLH+
	zGje67ar/RnrWIUoCW6LdsERN/sK41Qy+Y2C/F3k4WUdZhcq+IJpyHjDIMcmH1Qi
	oMeJZguzB/KZTt5et19Jb7yyVoO+4ldzQhbc85/SR9/kFzJhSsevKHmBO2f4f5YM
	TydyecmUsiNzCQlBR1k0gbWvUAWcw6ZRhEXtQxWb15+L+DR+ypX2X6F90itSbaWw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465x5vt2e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 08:31:01 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53M8Kos0025852;
	Tue, 22 Apr 2025 08:31:01 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465x5vt2dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 08:31:01 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6CQB1012511;
	Tue, 22 Apr 2025 08:30:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5t27m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 08:30:41 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53M8Ucjk56951132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:30:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA23C20043;
	Tue, 22 Apr 2025 08:30:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C78E420040;
	Tue, 22 Apr 2025 08:30:35 +0000 (GMT)
Received: from [9.109.222.82] (unknown [9.109.222.82])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 08:30:35 +0000 (GMT)
Message-ID: <96d4ed6b-83f8-448e-96c9-ac19ff3fbd60@linux.ibm.com>
Date: Tue, 22 Apr 2025 14:00:34 +0530
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
Subject: Re: [PATCH v2] powerpc64/bpf: fix JIT code size calculation of bpf
 trampoline
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>, stable@vger.kernel.org
References: <20250416194037.204424-1-hbathini@linux.ibm.com>
 <93efae34-796f-48a6-9ea7-44d20a67d0d8@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <93efae34-796f-48a6-9ea7-44d20a67d0d8@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VNPxrvdQZZd87lZ_Mz926maNGaUpBJv_
X-Proofpoint-ORIG-GUID: xhzTgQ3-9mJJ7uJ_deMaMYMuzBoomlX7
X-Authority-Analysis: v=2.4 cv=CuO/cm4D c=1 sm=1 tr=0 ts=680753c5 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=RuoPzikXpl4uVTwg1ToA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=974
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220064
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 17/04/25 8:06 pm, Venkat Rao Bagalkote wrote:
> 
> On 17/04/25 1:10 am, Hari Bathini wrote:
>> arch_bpf_trampoline_size() provides JIT size of the BPF trampoline
>> before the buffer for JIT'ing it is allocated. The total number of
>> instructions emitted for BPF trampoline JIT code depends on where
>> the final image is located. So, the size arrived at with the dummy
>> pass in arch_bpf_trampoline_size() can vary from the actual size
>> needed in  arch_prepare_bpf_trampoline().  When the instructions
>> accounted in  arch_bpf_trampoline_size() is less than the number of
>> instructions emitted during the actual JIT compile of the trampoline,
>> the below warning is produced:
>>
>>    WARNING: CPU: 8 PID: 204190 at arch/powerpc/net/bpf_jit_comp.c:981 
>> __arch_prepare_bpf_trampoline.isra.0+0xd2c/0xdcc
>>
>> which is:
>>
>>    /* Make sure the trampoline generation logic doesn't overflow */
>>    if (image && WARN_ON_ONCE(&image[ctx->idx] >
>>                (u32 *)rw_image_end - BPF_INSN_SAFETY)) {
>>
>> So, during the dummy pass, instead of providing some arbitrary image
>> location, account for maximum possible instructions if and when there
>> is a dependency with image location for JIT'ing.
>>
>> Fixes: d243b62b7bd3 ("powerpc64/bpf: Add support for bpf trampolines")
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> Closes: https://lore.kernel.org/all/6168bfc8-659f-4b5a- 
>> a6fb-90a916dde3b3@linux.ibm.com/
>> Cc: stable@vger.kernel.org # v6.13+
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>
>> Changes since v1:
>> - Pass NULL for image during intial pass and account for max. possible
>>    instruction during this pass as Naveen suggested.
>>
>>
>>   arch/powerpc/net/bpf_jit.h        | 20 ++++++++++++++++---
>>   arch/powerpc/net/bpf_jit_comp.c   | 33 ++++++++++---------------------
>>   arch/powerpc/net/bpf_jit_comp64.c |  9 +++++++++
>>   3 files changed, 36 insertions(+), 26 deletions(-)
>>
>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>> index 6beacaec63d3..4c26912c2e3c 100644
>> --- a/arch/powerpc/net/bpf_jit.h
>> +++ b/arch/powerpc/net/bpf_jit.h
>> @@ -51,8 +51,16 @@
>>           EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | 
>> (offset & 0xfffc));                    \
>>       } while (0)
>> -/* Sign-extended 32-bit immediate load */
>> +/*
>> + * Sign-extended 32-bit immediate load
>> + *
>> + * If this is a dummy pass (!image), account for
>> + * maximum possible instructions.
>> + */
>>   #define PPC_LI32(d, i)        do {                          \
>> +    if (!image)                                  \
>> +        ctx->idx += 2;                              \
>> +    else {                                      \
>>           if ((int)(uintptr_t)(i) >= -32768 &&                  \
>>                   (int)(uintptr_t)(i) < 32768)              \
>>               EMIT(PPC_RAW_LI(d, i));                      \
>> @@ -60,10 +68,15 @@
>>               EMIT(PPC_RAW_LIS(d, IMM_H(i)));                  \
>>               if (IMM_L(i))                          \
>>                   EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));          \
>> -        } } while(0)
>> +        }                                  \
>> +    } } while (0)
>>   #ifdef CONFIG_PPC64
>> +/* If dummy pass (!image), account for maximum possible instructions */
>>   #define PPC_LI64(d, i)        do {                          \
>> +    if (!image)                                  \
>> +        ctx->idx += 5;                              \
>> +    else {                                      \
>>           if ((long)(i) >= -2147483648 &&                      \
>>                   (long)(i) < 2147483648)                  \
>>               PPC_LI32(d, i);                          \
>> @@ -84,7 +97,8 @@
>>               if ((uintptr_t)(i) & 0x000000000000ffffULL)          \
>>                   EMIT(PPC_RAW_ORI(d, d, (uintptr_t)(i) &       \
>>                               0xffff));             \
>> -        } } while (0)
>> +        }                                  \
>> +    } } while (0)
>>   #define PPC_LI_ADDR    PPC_LI64
>>   #ifndef CONFIG_PPC_KERNEL_PCREL
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/ 
>> bpf_jit_comp.c
>> index 2991bb171a9b..c0684733e9d6 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -504,10 +504,11 @@ static int invoke_bpf_prog(u32 *image, u32 
>> *ro_image, struct codegen_context *ct
>>       EMIT(PPC_RAW_ADDI(_R3, _R1, regs_off));
>>       if (!p->jited)
>>           PPC_LI_ADDR(_R4, (unsigned long)p->insnsi);
>> -    if (!create_branch(&branch_insn, (u32 *)&ro_image[ctx->idx], 
>> (unsigned long)p->bpf_func,
>> -               BRANCH_SET_LINK)) {
>> -        if (image)
>> -            image[ctx->idx] = ppc_inst_val(branch_insn);
>> +    /* Account for max possible instructions during dummy pass for 
>> size calculation */
>> +    if (image && !create_branch(&branch_insn, (u32 *)&ro_image[ctx- 
>> >idx],
>> +                    (unsigned long)p->bpf_func,
>> +                    BRANCH_SET_LINK)) {
>> +        image[ctx->idx] = ppc_inst_val(branch_insn);
>>           ctx->idx++;
>>       } else {
>>           EMIT(PPC_RAW_LL(_R12, _R25, offsetof(struct bpf_prog, 
>> bpf_func)));
>> @@ -889,7 +890,8 @@ static int __arch_prepare_bpf_trampoline(struct 
>> bpf_tramp_image *im, void *rw_im
>>               bpf_trampoline_restore_tail_call_cnt(image, ctx, 
>> func_frame_offset, r4_off);
>>           /* Reserve space to patch branch instruction to skip fexit 
>> progs */
>> -        im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
>> +        if (ro_image) /* image is NULL for dummy pass */
>> +            im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
>>           EMIT(PPC_RAW_NOP());
>>       }
>> @@ -912,7 +914,8 @@ static int __arch_prepare_bpf_trampoline(struct 
>> bpf_tramp_image *im, void *rw_im
>>           }
>>       if (flags & BPF_TRAMP_F_CALL_ORIG) {
>> -        im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
>> +        if (ro_image) /* image is NULL for dummy pass */
>> +            im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
>>           PPC_LI_ADDR(_R3, im);
>>           ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
>>                            (unsigned long)__bpf_tramp_exit);
>> @@ -973,25 +976,9 @@ int arch_bpf_trampoline_size(const struct 
>> btf_func_model *m, u32 flags,
>>                    struct bpf_tramp_links *tlinks, void *func_addr)
>>   {
>>       struct bpf_tramp_image im;
>> -    void *image;
>>       int ret;
>> -    /*
>> -     * Allocate a temporary buffer for __arch_prepare_bpf_trampoline().
>> -     * This will NOT cause fragmentation in direct map, as we do not
>> -     * call set_memory_*() on this buffer.
>> -     *
>> -     * We cannot use kvmalloc here, because we need image to be in
>> -     * module memory range.
>> -     */
>> -    image = bpf_jit_alloc_exec(PAGE_SIZE);
>> -    if (!image)
>> -        return -ENOMEM;
>> -
>> -    ret = __arch_prepare_bpf_trampoline(&im, image, image + 
>> PAGE_SIZE, image,
>> -                        m, flags, tlinks, func_addr);
>> -    bpf_jit_free_exec(image);
>> -
>> +    ret = __arch_prepare_bpf_trampoline(&im, NULL, NULL, NULL, m, 
>> flags, tlinks, func_addr);
>>       return ret;
>>   }
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/ 
>> bpf_jit_comp64.c
>> index 233703b06d7c..91f9efe8b8d7 100644
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>> @@ -225,6 +225,15 @@ int bpf_jit_emit_func_call_rel(u32 *image, u32 
>> *fimage, struct codegen_context *
>>       }
>>   #ifdef CONFIG_PPC_KERNEL_PCREL
>> +    /*
>> +     * If fimage is NULL (the initial pass to find image size),
>> +     * account for the maximum no. of instructions possible.
>> +     */
>> +    if (!fimage) {
>> +        ctx->idx += 7;
>> +        return 0;
>> +    }
>> +
>>       reladdr = func_addr - local_paca->kernelbase;
>>       if (reladdr < (long)SZ_8G && reladdr >= -(long)SZ_8G) {
> 
> 
> Above patch fixes the reported issue. Ran the test( ./test_progs) for 
> three times, and issue is not seen. Hence,
> 
> 
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Thanks for testing, Venkat.
Posted v3 carrying your Tested-by tag.

  
https://lore.kernel.org/linuxppc-dev/20250422082609.949301-1-hbathini@linux.ibm.com/

- Hari


