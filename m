Return-Path: <linuxppc-dev+bounces-15878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF204D2C8A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 07:28:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsqg90fV9z2xSN;
	Fri, 16 Jan 2026 17:28:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768544916;
	cv=none; b=KIioJG1u6o0GfAIW5jKK5aRP7wcXnVj5tHVYZdcNXmdZrxw8ngx+K59fiSn9O/FxzrAlabTmmTyce5+oPLIT8VcD358t745mHDcNNr93gK77nIfUCAkmsfj9x2s9d620XT+FlxndyTDstrN13KWbIeAJmThg2mTe2QjZ1E7JhpQG9X+CJmzaDE1/9/7z9x7ROfTVrRGroOCFjqXYdmMHRjFhgzcN6iV4gwPzQ2wFGs6QeoN36ecRrYg1s0oV2PfDkYTYCVLtz1IXqaFjoHCK9sy1Q6W/gJKAKHr1CmgJwKu7b0tF66W0qmTwN2w+afjXk7rrs9FCh3cBQBB5ivAB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768544916; c=relaxed/relaxed;
	bh=FcLPAHm1b5V0LiIvXBQvn5Ixpkw/sS7eXVDxcRETIko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2GzJF5R8rW/pwpkbMiMTIHBoGV1255hIFbLLMbwz0eK6Xw0jm12XxKXYzlhpr1YfZAtf6KXMqxzXqJecF8aiXlXAti8pZuELAMhjEl2F5dRL9JnhrrxEd5b/wb0akbeMc/ePNBWT3gPwEaGQdH1QoweOESOTLZroIr1q8uhea5rCqBa9AVOrLtaiaJvgAse1V+tkRomFL4OPeSkLR2VBnceLsRbzUzJuUlWeYx+OqvVawxLlh/Ma0+gEEffJZm0VLMRm1mec+q8u7rPznc5Ks6ffkVWGp18QOuCjpp2FPDLw0JL0ug6LwxPlQderFKG0S3MVstGZNDbuRx+OWVK3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NL1+7KcU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NL1+7KcU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsqg74Xgyz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 17:28:35 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FMlwlO023552;
	Fri, 16 Jan 2026 06:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FcLPAH
	m1b5V0LiIvXBQvn5Ixpkw/sS7eXVDxcRETIko=; b=NL1+7KcU7OgoGwHnaFRstr
	EPIUqesjn2x+cAkWEsV57xN87Evxv+p6SRdFxxeAuhi/LoUy70nLIHJMtCjkE8py
	I28b0Nox4BVeP5EHEEbUwz5pwe3Mt5z3NjY40ln93t8HJM/drdTxCaCsGAeOunze
	VNsv6wen4BRK8RQ6KqbYrrTkSRqaADxAYjEO6qeD3ZtAV+qVNTh7DAFHeLjYzD44
	EcmwBSoM9MxFXjUrKBVNTJyDSir6bv7VdFVuf1jXJH9Ku1DE4fWE9omHZVnlRY59
	G93QwvNIt9xuE2g+fbIb8VTKHbKeECrobbkRFnNQrDvkktoLreGQrUQ+ha6fThog
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9bnh7t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 06:27:58 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60G6Rvr4014401;
	Fri, 16 Jan 2026 06:27:58 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9bnh7t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 06:27:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60G50UwK030131;
	Fri, 16 Jan 2026 06:27:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3ak49q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 06:27:56 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60G6Rrbi51249426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 06:27:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A66C20049;
	Fri, 16 Jan 2026 06:27:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D2BC20040;
	Fri, 16 Jan 2026 06:27:47 +0000 (GMT)
Received: from [9.43.87.191] (unknown [9.43.87.191])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jan 2026 06:27:47 +0000 (GMT)
Message-ID: <70242dc7-0f3e-4b8d-ad11-e24d9e4dfbb3@linux.ibm.com>
Date: Fri, 16 Jan 2026 11:57:46 +0530
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
Subject: Re: [PATCH v2 5/6] powerpc64/bpf: Support exceptions
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
 <20260114114450.30405-6-adubey@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20260114114450.30405-6-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA0OSBTYWx0ZWRfX1h59OFx1Sia0
 0HT+S+rmgFUMFJS5bNKAoHAbumXea8ljuCN9uHqh1uNb0qfpk2iqguDFhDL1uLRLq6YmKrLxYTo
 Bhodi6kuUZcVVLg8ll3h0dvbXTpuaa0xlxmnbjM/uow9+Fx+ETTcYHvtqlMYzeGslVmhBVxZV00
 QWZ47cC46Qhl9Gi0yIzVB0Jdc8x8AEYTZKL/VvU3dQeGX1etcgI0DqIWb8J+QFsGGLN4GN9SEXW
 tu59teSY6TkIGg8xSaRwufIwiyO8yq2Q0ZzJwIcUzzx9Ky0PoZP+G7VdjYS8jIi8fnTqtNjA1DA
 yEtlYgoqYjn1OeXPDrvhreM+/irrnmN5iOpPj6sTSaAmpbh3T75HmQGAFC7CHcp8x6YRpRAaDWC
 4TzZz9xOnr3+aNYmphIKCfF3ukISDepD8YgjUNvGXuotxg/i7TxXNpmvxFLUYxDIYMXZNK89umQ
 T8v45uOA7HMqOK0eR3Q==
X-Proofpoint-GUID: trPHaRqcVJh1xboM6gSDfEJThQeKPkQG
X-Authority-Analysis: v=2.4 cv=VNPQXtPX c=1 sm=1 tr=0 ts=6969da6e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DU0EyFXtAAAA:8 a=VnNF1IyMAAAA:8 a=T6DxGVK8PeSMhVRyarwA:9 a=QEXdDO2ut3YA:10
 a=UCR5be5CC-YrbG9FbbB0:22
X-Proofpoint-ORIG-GUID: p_PaoMwaTeEjKigKn9IZftk6rGiuIY-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601160049
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 14/01/26 5:14 pm, adubey@linux.ibm.com wrote:
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> The modified prologue/epilogue generation code now
> enables exception-callback to use the stack frame of
> the program marked as exception boundary, where callee
> saved registers are stored.
> 
> As per ppc64 ABIv2 documentation[1], r14-r31 are callee
> saved registers. BPF programs on ppc64 already saves
> r26-r31 registers. Saving the remaining set of callee
> saved registers(r14-r25) is handled in the next patch.
> 
> [1] https://ftp.rtems.org/pub/rtems/people/sebh/ABI64BitOpenPOWERv1.1_16July2015_pub.pdf
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit.h        |  2 ++
>   arch/powerpc/net/bpf_jit_comp.c   |  7 ++++
>   arch/powerpc/net/bpf_jit_comp64.c | 53 +++++++++++++++++++++----------
>   3 files changed, 45 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 5d735bc5e6bd..fb548ae5d143 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -179,6 +179,8 @@ struct codegen_context {
>   	u64 arena_vm_start;
>   	u64 user_vm_start;
>   	bool is_subprog;
> +	bool exception_boundary;
> +	bool exception_cb;
>   };
>   
>   #define bpf_to_ppc(r)	(ctx->b2p[r])
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index e3088cf089d1..26991940d36e 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -207,6 +207,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
>   	cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
>   	cgctx.is_subprog = bpf_is_subprog(fp);
> +	cgctx.exception_boundary = fp->aux->exception_boundary;
> +	cgctx.exception_cb = fp->aux->exception_cb;
>   
>   	/* Scouting faux-generate pass 0 */
>   	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
> @@ -436,6 +438,11 @@ void bpf_jit_free(struct bpf_prog *fp)
>   	bpf_prog_unlock_free(fp);
>   }
>   
> +bool bpf_jit_supports_exceptions(void)
> +{
> +	return IS_ENABLED(CONFIG_PPC64);
> +}
> +
>   bool bpf_jit_supports_subprog_tailcalls(void)
>   {
>   	return IS_ENABLED(CONFIG_PPC64);
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index ec58395f74f7..a6083dd9786c 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -89,7 +89,9 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
>   	 * - the bpf program uses its stack area
>   	 * The latter condition is deduced from the usage of BPF_REG_FP
>   	 */
> -	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP));
> +	return ctx->seen & SEEN_FUNC ||
> +	       bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)) ||
> +	       ctx->exception_cb;
>   }
>   
>   /*
> @@ -190,23 +192,32 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
>   	}
>   
> -	/*
> -	 * Back up non-volatile regs -- BPF registers 6-10
> -	 * If we haven't created our own stack frame, we save these
> -	 * in the protected zone below the previous stack frame
> -	 */
> -	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
> -		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
> -			EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
> +	if (!ctx->exception_cb) {
> +		/*
> +		 * Back up non-volatile regs -- BPF registers 6-10
> +		 * If we haven't created our own stack frame, we save these
> +		 * in the protected zone below the previous stack frame
> +		 */
> +		for (i = BPF_REG_6; i <= BPF_REG_10; i++)
> +			if (ctx->exception_boundary || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
> +				EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1,
> +					bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>   
> -	if (ctx->arena_vm_start)
> -		EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
> +		if (ctx->exception_boundary || ctx->arena_vm_start)
> +			EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
>   				 bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
>   
> -	/* Setup frame pointer to point to the bpf stack area */
> -	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
> -		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
> +		/* Setup frame pointer to point to the bpf stack area */
> +		if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
> +			EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
>   				STACK_FRAME_MIN_SIZE + ctx->stack_size));
> +	} else {
> +		/*
> +		 * Exception callback receives Frame Pointer of main
> +		 * program as third arg
> +		 */
> +		EMIT(PPC_RAW_MR(_R1, _R5));
> +	}
>   
>   	if (ctx->arena_vm_start)
>   		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
> @@ -218,17 +229,25 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
>   
>   	/* Restore NVRs */
>   	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
> -		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
> +		if (ctx->exception_cb || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
>   			EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>   
> -	if (ctx->arena_vm_start)
> +	if (ctx->exception_cb || ctx->arena_vm_start)
>   		EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
>   				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
>   

> +	if (ctx->exception_cb) {
> +		/*
> +		 * LR value from boundary-frame is received as second parameter
> +		 * in exception callback.
> +		 */
> +		EMIT(PPC_RAW_MTLR(_R4));
> +	}
> +

No. Both second and third parameter of exception_cb() are stack pointer
(or frame pointer, if you prefer that) and not LR.
The above hunk is wrong. It still worked because of mtlr
instruction below that restored LR from PPC_LR_STKOFF offset
on the stack. Please drop the above hunk.

>   	/* Tear down our stack frame */
>   	if (bpf_has_stack_frame(ctx)) {
>   		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
> -		if (ctx->seen & SEEN_FUNC) {
> +		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
>   			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
>   			EMIT(PPC_RAW_MTLR(_R0));
>   		}

- Hari

