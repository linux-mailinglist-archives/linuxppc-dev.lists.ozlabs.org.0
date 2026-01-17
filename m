Return-Path: <linuxppc-dev+bounces-15938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AACD38DCF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 11:41:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtYDv4PF0z309P;
	Sat, 17 Jan 2026 21:41:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768646511;
	cv=none; b=nBB5cvj1FsaBQpsP5EWLGm2eU+GJvvA4sDr04r5ogzWsxsiLnWr6Y7GRYb9WndvQVyABOL/iGNhyDOPMMBEppEltK7QmUKiUaKDuqVbnAc51ya03tBxLpHwOag8EfUU1CuXyUfYnozP9tQ0lz0/FPDp4zz/A5ETGwmc5llQzS5WTkQdjVRQWwi6CPsiPfzfd4dI/STaFpGgSzoF7idUzDhgW0ZLoH2r/EElly6SdxDHIHkHOgZzeloSi/ueNr3GB8h5m55z2jvuRrBxWL6QY5FBItTQqDeETLh2GAmjUmeiQaDgEbACtIUvnHCPaJ0jQjb14Hebf5l/XE3kmoX8B7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768646511; c=relaxed/relaxed;
	bh=TWABhKDdDVeCf4YdyifoGH0PbBdkNqFOO5b6tw2PIb8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WOE2CITXYHRF4PxZBCkb+Wq2vBWUrF8jdege0IDY74IPepkMtb2iwnpkLN7dauJK4bjrXxIKuBRzTxdC+c7c+uOenfIgx2bO/6foJMySMq4WekEVTXwZxU3iVLmxSbl1cg/BXyGAR9I6Bo9aUgupz+BlNfHNtnBV+TbGQ084NzHqmizvCkNpAMURP7mfCcM36IeyRWZU0yrBaHT6r+p03MgFMKgO4386yIq011Expy8+oC/k4AiwUX0q8xvAdVEPf5fXMKTiI7f5RhcGZXL/cAG0DMeWyr9kau6bH6rYc7GwPyjp9f8PeuPci68/pdvbIfUwLsh6KKMmI61Pm+0ioQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kvVw/cKQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kvVw/cKQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtYDt5QXbz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 21:41:50 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60HAE5s6019690;
	Sat, 17 Jan 2026 10:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TWABhK
	DdDVeCf4YdyifoGH0PbBdkNqFOO5b6tw2PIb8=; b=kvVw/cKQJPuSfA5RKEZEYg
	c3Z66oL58eK2JuK+lQXkDEAGmxn2nEFdvg3R3qaRVRGqDebBonkD1Ie9HeJsc7sN
	4X2k/kaqz3WGOsNLaOmZNt++aVdhqygXGo6Is+jUZwvfm9Uh/xq75ULJS42HK7TP
	U7nllMQXBrqvhvCeYsMDuVxVeN5XfNol/Ib3O2pQRP2qJW8238MgFAR4e3OND4lj
	SI1TV9Lb6wyOeDI2YfEXchJJKwFjc9qG/77abEpzmsS1TRGMybPha1hWo+rgm5RB
	s3NC33bjZqwo/bTCPz3qE6BsHhP2jwPZgFY5O7HwLWqvn1eDrem03bkxIBYjputw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br0uf1151-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:41:17 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60HAfG1w031751;
	Sat, 17 Jan 2026 10:41:16 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br0uf114y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:41:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60HARSf3009077;
	Sat, 17 Jan 2026 10:41:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bqv8xjmkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:41:15 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60HAfBfn50856342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Jan 2026 10:41:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A5B420043;
	Sat, 17 Jan 2026 10:41:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFAF920040;
	Sat, 17 Jan 2026 10:41:05 +0000 (GMT)
Received: from [9.43.67.105] (unknown [9.43.67.105])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 17 Jan 2026 10:41:05 +0000 (GMT)
Message-ID: <e1883afa-5ec3-4a92-ad7e-26cc896a853b@linux.ibm.com>
Date: Sat, 17 Jan 2026 16:11:04 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] powerpc64/bpf: Tailcall handling with trampolines
From: Hari Bathini <hbathini@linux.ibm.com>
To: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
References: <20260114114450.30405-1-adubey@linux.ibm.com>
 <20260114114450.30405-4-adubey@linux.ibm.com>
 <49fda5e0-554b-4c62-a1be-477c5337b591@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <49fda5e0-554b-4c62-a1be-477c5337b591@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o62EDpOuAUU_XxFceZ6y7ZcBZlEAi6ac
X-Proofpoint-ORIG-GUID: gxJWPCS3je6-CPRAo3VnEHa0Sqp9oFrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA4NCBTYWx0ZWRfXywgOxKNNPpXk
 rKSzoxYX2iOlGp54RINFVPtsDgbc/T8LYhJdYqHttCQ+VBpPzIqz7AjJm3c2TgZXpQmf8AXgFYL
 grSrn2ZUBkiUhqtbm4yUc60HtyMC3+eGrWAuc2I0cwH81HTT4HqW+xWLrL1QQwOAtzmqxjvX8v9
 lFRiA2MvpDPAm9Qo87p1xtkz7YuKpSSRKnOpt49OnbtXwTXmBOsqe4Bc43xsn2QZ6aSJrzmZOqs
 dIQ0ILQoN8rTfJkFvODVVYRM5NAYVC0L5qJpQrCXJzxenpIa4zafWWRUQ+V0MGFGu2MaAsMLM3R
 GYklEdktKa8KH5KPHzDEInQQnru3SJLA64/jBhk32GK61SkqXwR9aZ3nSCOMcYtt1d37Vyjo1NS
 dHLL4kgtj5NiF3dCHSep0UMYglhkTtrNt0yzFYY6it56foFPUQrXoczccPpD3fcIMNSVKuSRMMK
 tn1/ChR4y/0aLPHgstA==
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=696b674d cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=usXJn3OU05F9Ks-MQu4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601170084
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 17/01/26 4:09 pm, Hari Bathini wrote:
> 
> 
> On 14/01/26 5:14 pm, adubey@linux.ibm.com wrote:
>> From: Abhishek Dubey <adubey@linux.ibm.com>
>>
>> The trampoline mechanism sets up its own stack frame and
>> an additional dummy frame. We need to have additional JIT
>> instructions handling tailcall dereferencing in the
>> trampoline's context.
>>
>> We don't add the two stack frames pointed above, rather
>> add space for tail_call_info at bottom in trampoline frame
>> for ppc64. This makes the trampoline's frame consistent with
>> layout of all other frames wrt tail_call_info offset.
>>
>> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
>> ---
>>   arch/powerpc/net/bpf_jit_comp.c | 83 ++++++++++++++++++++++-----------
>>   1 file changed, 56 insertions(+), 27 deletions(-)
>>
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/ 
>> bpf_jit_comp.c
>> index 069a8822c30d..e3088cf089d1 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -606,33 +606,58 @@ static int invoke_bpf_mod_ret(u32 *image, u32 
>> *ro_image, struct codegen_context
>>       return 0;
>>   }
>> -static void bpf_trampoline_setup_tail_call_cnt(u32 *image, struct 
>> codegen_context *ctx,
>> -                           int func_frame_offset, int r4_off)
>> -{
>> -    if (IS_ENABLED(CONFIG_PPC64)) {
>> -        /* See bpf_jit_stack_tailcallinfo_offset() */
>> -        int tailcallcnt_offset = 7 * 8;
>> -
>> -        EMIT(PPC_RAW_LL(_R3, _R1, func_frame_offset - 
>> tailcallcnt_offset));
>> -        EMIT(PPC_RAW_STL(_R3, _R1, -tailcallcnt_offset));
>> -    } else {
>> -        /* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
>> -        EMIT(PPC_RAW_LL(_R4, _R1, r4_off));
>> -    }
>> -}
>> +/*
>> + * Refer the label 'Generated stack layout' in this file for actual 
>> stack
>> + * layout during trampoline invocation.
>> + *
>> + * Refer __arch_prepare_bpf_trampoline() for stack component details.
>> + *
>> + * The tailcall count/reference is present in caller's stack frame. 
>> Its required
>> + * to copy the content of tail_call_info before calling the actual 
>> function
>> + * to which the trampoline is attached.
>> + *
>> + */
>> -static void bpf_trampoline_restore_tail_call_cnt(u32 *image, struct 
>> codegen_context *ctx,
>> -                         int func_frame_offset, int r4_off)
>> +static void bpf_trampoline_setup_tail_call_info(u32 *image, struct 
>> codegen_context *ctx,
>> +                           int func_frame_offset,
>> +                           int bpf_dummy_frame_size, int r4_off)
>>   {
>>       if (IS_ENABLED(CONFIG_PPC64)) {
>>           /* See bpf_jit_stack_tailcallinfo_offset() */
> 
>> -        int tailcallcnt_offset = 7 * 8;
>> +        int tailcallinfo_offset = BPF_PPC_TAILCALL;
> 
> This offset update should have been part of patch#1
> 
>> +        /*
>> +         * func_frame_offset =                                   ...(1)
>> +         *     bpf_dummy_frame_size + trampoline_frame_size
>> +         */
>> +        EMIT(PPC_RAW_LD(_R4, _R1, func_frame_offset));
>> +        EMIT(PPC_RAW_LD(_R3, _R4, -tailcallinfo_offset));
>> +
>> +        /*
>> +         * Setting the tail_call_info in trampoline's frame
>> +         * depending on if previous frame had value or reference.
>> +         */
>> +        EMIT(PPC_RAW_CMPLWI(_R3, MAX_TAIL_CALL_CNT));
>> +        PPC_COND_BRANCH(COND_GT, CTX_NIA(ctx) + 8);
>> +        EMIT(PPC_RAW_ADDI(_R3, _R4, 
>> bpf_jit_stack_tailcallinfo_offset(ctx)));
>> +        /*
>> +         * From ...(1) above:
>> +         * trampoline_frame_bottom =                            ...(2)
>> +         *     func_frame_offset - bpf_dummy_frame_size
>> +         *
>> +         * Using ...(2) derived above:
>> +         *  trampoline_tail_call_info_offset =                  ...(3)
>> +         *      trampoline_frame_bottom - tailcallinfo_offset
>> +         *
>> +         * From ...(3):
>> +         * Use trampoline_tail_call_info_offset to write reference of 
>> main's
>> +         * tail_call_info in trampoline frame.
>> +         */
>> +        EMIT(PPC_RAW_STL(_R3, _R1, (func_frame_offset - 
>> bpf_dummy_frame_size)
>> +                    - tailcallinfo_offset));
>> -        EMIT(PPC_RAW_LL(_R3, _R1, -tailcallcnt_offset));
>> -        EMIT(PPC_RAW_STL(_R3, _R1, func_frame_offset - 
>> tailcallcnt_offset));
>>       } else {
>>           /* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
>> -        EMIT(PPC_RAW_STL(_R4, _R1, r4_off));
>> +        EMIT(PPC_RAW_LL(_R4, _R1, r4_off));
>>       }
>>   }
>> @@ -720,6 +745,7 @@ static int __arch_prepare_bpf_trampoline(struct 
>> bpf_tramp_image *im, void *rw_im
>>        * LR save area                 [ r0 save (64-bit)  ]   | header
>>        *                              [ r0 save (32-bit)  ]   |
>>        * dummy frame for unwind       [ back chain 1      ] --

>> +     *                              [ tail_call_info    ] non 
>> optional - 64-bit powerpc

Also, why non-optional? This can be optional on BPF_TRAMP_F_CALL_ORIG
and BPF_TRAMP_F_TAIL_CALL_CTX flags?

>>        *                              [ padding           ] align 
>> stack frame
>>        *       r4_off                 [ r4 (tailcallcnt)  ] optional - 
>> 32-bit powerpc
>>        *       alt_lr_off             [ real lr (ool stub)] optional - 
>> actual lr
> 
>> @@ -801,8 +827,14 @@ static int __arch_prepare_bpf_trampoline(struct 
>> bpf_tramp_image *im, void *rw_im
>>           }
>>       }
>> -    /* Padding to align stack frame, if any */
>> -    bpf_frame_size = round_up(bpf_frame_size, SZL * 2);
>> +    if (!(bpf_frame_size % (2 * SZL))) {
>> +        /* Stack is 16-byte aligned */
>> +        /* Room for padding followed by 64-bit tail_call_info */
>> +        bpf_frame_size += SZL + BPF_PPC_TAILCALL;
>> +    } else {
>> +        /* Room for 64-bit tail_call_info */
>> +        bpf_frame_size += BPF_PPC_TAILCALL;
>> +    }
>>       /* Dummy frame size for proper unwind - includes 64-bytes red 
>> zone for 64-bit powerpc */
>>       bpf_dummy_frame_size = STACK_FRAME_MIN_SIZE + 64;
> 
> This change assumes the size is at least 8-byte aligned which is
> true today but better skip that assumption by not touching the
> padding part. The above hunk could simply be:
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/ 
> bpf_jit_comp.c
> index 5e976730b2f5..266cc6f17dcc 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -795,6 +795,10 @@ static int __arch_prepare_bpf_trampoline(struct 
> bpf_tramp_image *im, void *rw_im
>                  }
>          }
> 
> +       /* Save tailcall count pointer at the same offset on the stack 
> where subprogs expect it */
> +       if ((flags & BPF_TRAMP_F_CALL_ORIG) && (flags & 
> BPF_TRAMP_F_TAIL_CALL_CTX))
> +               bpf_frame_size += SZL;
> +
>          /* Padding to align stack frame, if any */
>          bpf_frame_size = round_up(bpf_frame_size, SZL * 2);
> 
> 
> Patch#2 is not complete without this change. Please fold this patch
> into patch#2 itself.
> 

- Hari


