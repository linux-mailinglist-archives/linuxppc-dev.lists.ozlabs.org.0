Return-Path: <linuxppc-dev+bounces-15939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F3D38DDF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 11:52:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtYSY412Gz309P;
	Sat, 17 Jan 2026 21:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768647117;
	cv=none; b=XcgfnN8jknRc2msMlSPmHlGXAa0UkeSJiMHRmM5GOJ/BSt68E6N1wTf/OmM9RFYxc/CT1DIcn9siQQ7txzYQosAYIjGUNhmAGvA5TTU9zpNWJqD6HVgqtjV3mT5AwLEWW+RnSpgYMCNq9fFUOmAT9n54qqHO29zttxZvrli+wRfVAKtciDP72Tew2TRrYzp3oe5t5W5dNtJ/iAAxkFGZK0ZoHq3NciUle0dVKn76y9brHAIxvqQRPkvljdF2CTdzNUEj3BszWJ4RsN+/+ayxtRphARJRgFoYJunIgAjMJ0fa6jINJ7vb2qI3nSJmwTRupz4xIQ5e6o18obrEkEjrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768647117; c=relaxed/relaxed;
	bh=kfVDCbjXC8zqETWW541g80/vE5JuUUf+AK8NyNjIWsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DXm5+gSuNW+6Kh+0SLjHDvO40QDyGogpQ37L9qL3GyZGUz4A0LeYwgTarG+pHY55lve7g0zmEQ1SZIKY17Kst2s3dbtteVmoYoOhmTMPUe1CVAjN4P33SzRc3DcJzXjgU+FV4fXPHzJjw46MHgwSpMtwWNwZFvdUh7Vv0bdkWJS2MGOX4EpH3h37QFC9vWl2VUqn2JToojoqNspTBGvdskV8lZEKvl8xM21lO6Jgbp9jdkm0w7FT3EqaYyE8s/juEUYG6BoUXVqm65bAUhINAmNGZesxutsimEkW1bw/n/ijv62eZzvb1zVbYr16sz/uhp7nrn+UZUHvf2E4WaNWCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yy+z4kan; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yy+z4kan;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtYSX2pkSz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 21:51:55 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60H4HApp018808;
	Sat, 17 Jan 2026 10:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kfVDCb
	jXC8zqETWW541g80/vE5JuUUf+AK8NyNjIWsk=; b=Yy+z4kanN6H87zn0xH0gGe
	ciWlsgTwNuIaqAoCSoa5gKzea3KtpcgZ/nDNkyAp2yoQBN7u1EftvdTyqVaijpRG
	ctDemLeY/IA4jZxPfFiTJgVkLmwKZPJGXpw84Qn91uG3zHUusdm5wAVH5d9foru4
	eC0zDkQ5pNESSKdbvr2ayXtBKzev0m9tRgDe42sScTXiYUH5l4TrL60HbZxaDldV
	wSwuPmQ6m87gYgp7Ku/OKQ2ByV5jao+QHI6w7L0FTMIVHIaCdTRC4Oez1JbJO7UV
	m7fqMjYXPHvovjHdTo/fqarA9qTANl/5JbrbS8e6if1ZE/LjqO04J9mElc2LLheQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br255gyr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:51:26 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60HApP6n024799;
	Sat, 17 Jan 2026 10:51:25 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br255gyr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:51:25 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60H5cM8P021593;
	Sat, 17 Jan 2026 10:51:24 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bqv8utnb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:51:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60HApKaB53084496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Jan 2026 10:51:20 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FC6320043;
	Sat, 17 Jan 2026 10:51:20 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F55C20040;
	Sat, 17 Jan 2026 10:51:14 +0000 (GMT)
Received: from [9.43.67.105] (unknown [9.43.67.105])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 17 Jan 2026 10:51:14 +0000 (GMT)
Message-ID: <32757ffb-2fa8-448b-8c47-6979b430cad7@linux.ibm.com>
Date: Sat, 17 Jan 2026 16:21:13 +0530
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
Subject: Re: [PATCH v2 6/6] powerpc64/bpf: Additional NVR handling for
 bpf_throw
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
 <20260114114450.30405-7-adubey@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20260114114450.30405-7-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA4OCBTYWx0ZWRfX6nH7ICCQkVCE
 og1USG+RnWHrvVogNWUhH0+zNBSIJf6Htc5W8glhn2MnWIaO+eCMfGzeWO2sioIrkMpvjEtBTEA
 CHr+kuUqTRg9o0w2LBI/zJpTJo/MNqlqnLucZYXjTy9G1zlTzWYdZoOW4xbkDQpZZBfyJtAXmBu
 R+9G0IMUOXu8WERZOklflR3Xgc1HEkSwMNPWbMTPJDQLevP1+wzmKUtphRg+tnobV3823KUR626
 4do3PXI2Zg8hPQ3FQlYCTzLzSQfEo+xeIS7znzZz+FLucRp/Pmf0B0A8sIQ1vXOfef4rESEwvlx
 k9zcEjrxSZvOuXBJt86Lar0+jFznW+/MB0hbYsYBHn7Jf9nhb637lzUASTkpkf3fjSej27thxQC
 HQoe8YaO70PS1H4fwpVv4Ny5l7C5d0iXWvfmnEXijkyWF1TobEe+T0qVEyIFYLW00Dq9XC9mxlf
 Fl6g/g5SyR3NYI8npEQ==
X-Authority-Analysis: v=2.4 cv=BpSQAIX5 c=1 sm=1 tr=0 ts=696b69ae cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=rcOsPj18wkOm5uxQGMsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dVXrvtC4vpHazqFy0P9N_mhGeRpl12rg
X-Proofpoint-ORIG-GUID: 1IZe1mavxB3DiKkNPWGqbAmNS8ajKMCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601170088
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 14/01/26 5:14 pm, adubey@linux.ibm.com wrote:
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> The bpf_throw() function never returns, if it has
> clobbered any callee-saved register, those will
> remain clobbered. The prologue must take care of
> saving all callee-saved registers in the frame of
> exception boundary program. Later these additional
> non volatile registers R14-R25 along with other
> NVRs are restored back in the epilogue of exception
> callback.
> 
> To achieve above objective the frame size is
> determined dynamically to accommodate additional
> non volatile registers in exception boundary's frame.
> For non-exception boundary program, the frame size
> remains optimal. The additional instructions to
> save & restore r14-r25 registers are emitted only during
> exception boundary and exception callback respectively.
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit_comp64.c | 70 +++++++++++++++++++++++++++----
>   1 file changed, 63 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index a6083dd9786c..941e0818c9ec 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -32,21 +32,37 @@
>    *
>    *		[	prev sp		] <-------------
>    *		[    tail_call_info	] 8		|
> - *		[   nv gpr save area	] 6*8		|
> + *		[   nv gpr save area	] 6*8 + (12*8)	|
>    *		[    local_tmp_var	] 24		|
>    * fp (r31) -->	[   ebpf stack space	] upto 512	|
>    *		[     frame header	] 32/112	|
>    * sp (r1) --->	[    stack pointer	] --------------
> + *
> + * Additional (12*8) in 'nv gpr save area' only in case of
> + * exception boundary.
>    */
>   
>   /* for bpf JIT code internal usage */
>   #define BPF_PPC_STACK_LOCALS	24
> +/*
> + * for additional non volatile registers(r14-r25) to be saved
> + * at exception boundary
> + */
> +#define BPF_PPC_EXC_STACK_SAVE (12*8)
> +
>   /* stack frame excluding BPF stack, ensure this is quadword aligned */
>   #define BPF_PPC_STACKFRAME	(STACK_FRAME_MIN_SIZE + \
>   				 BPF_PPC_STACK_LOCALS + \
>   				 BPF_PPC_STACK_SAVE   + \
>   				 BPF_PPC_TAILCALL)
>   
> +/*
> + * same as BPF_PPC_STACKFRAME with save area for additional
> + * non volatile registers saved at exception boundary.
> + * This is quad-word aligned.
> + */
> +#define BPF_PPC_EXC_STACKFRAME (BPF_PPC_STACKFRAME + BPF_PPC_EXC_STACK_SAVE)
> +
>   /* BPF register usage */
>   #define TMP_REG_1	(MAX_BPF_JIT_REG + 0)
>   #define TMP_REG_2	(MAX_BPF_JIT_REG + 1)
> @@ -103,9 +119,12 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
>    *		[	  ...       	] 		|
>    * sp (r1) --->	[    stack pointer	] --------------
>    *		[    tail_call_info	] 8
> - *		[   nv gpr save area	] 6*8
> + *		[   nv gpr save area	] 6*8 + (12*8)
>    *		[    local_tmp_var	] 24
>    *		[   unused red zone	] 224
> + *
> + * Additional (12*8) in 'nv gpr save area' only in case of
> + * exception boundary.
>    */
>   static int bpf_jit_stack_local(struct codegen_context *ctx)
>   {
> @@ -114,7 +133,11 @@ static int bpf_jit_stack_local(struct codegen_context *ctx)
>   		return STACK_FRAME_MIN_SIZE + ctx->stack_size;
>   	} else {
>   		/* Stack layout 2 */
> -		return -(BPF_PPC_TAILCALL + BPF_PPC_STACK_SAVE + BPF_PPC_STACK_LOCALS);
> +		return -(BPF_PPC_TAILCALL
> +			+ BPF_PPC_STACK_SAVE
> +			+ (ctx->exception_boundary || ctx->exception_cb ?
> +							BPF_PPC_EXC_STACK_SAVE:0)
> +			+ BPF_PPC_STACK_LOCALS);
>   	}
>   }
>   
> @@ -125,9 +148,19 @@ int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
>   
>   static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
>   {
> -	if (reg >= BPF_PPC_NVR_MIN && reg < 32)
> +	int min_valid_nvreg = BPF_PPC_NVR_MIN;
> +	/* Default frame size for all cases except exception boundary */
> +	int frame_nvr_size = BPF_PPC_STACKFRAME;
> +
> +	/* Consider all nv regs for handling exceptions */
> +	if (ctx->exception_boundary || ctx->exception_cb) {
> +		min_valid_nvreg = _R14;
> +		frame_nvr_size = BPF_PPC_EXC_STACKFRAME;
> +	}
> +
> +	if (reg >= min_valid_nvreg && reg < 32)
>   		return (bpf_has_stack_frame(ctx) ?
> -			(BPF_PPC_STACKFRAME + ctx->stack_size) : 0)
> +			(frame_nvr_size + ctx->stack_size) : 0)
>   				- (8 * (32 - reg)) - BPF_PPC_TAILCALL;
>   
>   	pr_err("BPF JIT is asking about unknown registers");
> @@ -189,7 +222,20 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   			EMIT(PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF));
>   		}
>   

> -		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
> +		int stack_expand = ctx->exception_boundary || ctx->exception_cb ?
> +					BPF_PPC_EXC_STACKFRAME : BPF_PPC_STACKFRAME;
> +		EMIT(PPC_RAW_STDU(_R1, _R1, -(stack_expand + ctx->stack_size)));

[...]

> -		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
> +		int stack_shrink = ctx->exception_cb || ctx->exception_boundary ?
> +					BPF_PPC_EXC_STACKFRAME : BPF_PPC_STACKFRAME;
> +		EMIT(PPC_RAW_ADDI(_R1, _R1, stack_shrink + ctx->stack_size));
> +

An inline helper bpf_jit_stack_size() defined to return the stack
size in both prologue and epilogue while setting up and tearing
down the stack should be more elegant.


Also, IIUC, the JIT code to handle tailcall info is irrelevant for
all subprogs of a BPF program with seen_exception. JIT code in the
prologue for tailcall count handling can be skipped for exception_cb
at least?

- Hari

