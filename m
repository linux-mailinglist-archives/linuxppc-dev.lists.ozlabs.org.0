Return-Path: <linuxppc-dev+bounces-15732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9834FD1ECEA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 13:38:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drlyL26Gqz2xMt;
	Wed, 14 Jan 2026 23:38:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768394282;
	cv=none; b=bpEcoAq83WP0gUtAexih5XWiAeoe4fgJWraFYQIXxSq0267sAxvQmBnxR7jYCz7caLT0Etgtu+Cyvfxy4mD/CPTzNfIATc7hCzGKyxR5zUPl30jLtLbIMLgh3d+YEAsqmwe/QmQiazKdmxK96pRtxzDwMd8SY6cVZ4Ot66D2UVsqNqoonVgStBi37YSVaL/0+1hYN65fNuha+v/gxICOTe/ybW/WbeJfBQTsjcvGKs9qpM6YIiPFrs1MoAc/CZkD2JGxXCjtSjxKTssws13wuXZ/Z8myKGJgh8ic49jFE8B7LnqSfTD3Xx7A6tBMe8NtWg8qgtkIF6MffBrtiDTO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768394282; c=relaxed/relaxed;
	bh=ZfFduQHUZDHno9tac+Lt06djZPeagZp/Q6r1IoLBGk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8gj7AwuRUBIGbDjd63Z8lO44XfxvlTLFmLvr868u813Bg3g9XKLXcUUSQ7gN6+peeZ/b+OM08e9EknaUwaUn9pbO+u6NAgwALI7BCwmaN8Dx/yUFjS0aWf3JMe2uLH1ielyayi5yWNNzIoh2aTpISKI7fR1x87hsrgEARPmZAfIJsfs+zkYu5jiCk2HAdFH4VswUmYKFtMAU+smMHeGAJEmHO3shAPOZkTizz8qY6++ltSEM/LDxLEMpssQ5ES/lxB0KUkEoW6yxbLtbND3tWXAVBXxTInVhzoZrxz7/OxUd+/lQyi1o/m137mCF9IoPLD22lGt3hpPbaobeb3rUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mxhIGXZS; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mxhIGXZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drlyK4Dkwz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 23:38:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D29560051;
	Wed, 14 Jan 2026 12:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E449EC4CEF7;
	Wed, 14 Jan 2026 12:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768394276;
	bh=lNpjmkdFV/Up7u2UcfDh2qsaN2WPt0yc3qVyJNVl+04=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mxhIGXZSrgGZ43btZ+ttNG5DeVmxHV6GEwrU66wB/pmLKSOywFZDEEG5gTiCS/or1
	 5zHdjDSRSL/kr6cHiZcckKD9fIfC61cyBEQUiK9hVGZTzkDpbB7ihDmfYELUZeJUOE
	 co724rkK9uytdwLB3BSN+3aMrb7WTWgY5Bu3wLdVCK3nDaFTP4btHhbP0tjKa6Fw5A
	 dFXOPC3hk62hU9/FezcMOsHId5HId+YxFmoK6sjvqm0TW9kxjkLm3vf8I2jxNqCg5b
	 YfrAAFtT66/gspVbpkk/azZaC4E9tetUPsVBGNd8FxAEue629r3yRzoIPg//nA1lm2
	 UgXStecUrLNzQ==
Message-ID: <18dacad3-ec1d-4c91-adfb-2ee8d592de29@kernel.org>
Date: Wed, 14 Jan 2026 13:37:50 +0100
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
Subject: Re: [PATCH v2 4/6] powerpc64/bpf: Add arch_bpf_stack_walk() for BPF
 JIT
To: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, naveen@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 memxor@gmail.com, iii@linux.ibm.com, shuah@kernel.org
References: <20260114114450.30405-1-adubey@linux.ibm.com>
 <20260114114450.30405-5-adubey@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260114114450.30405-5-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/01/2026 à 12:44, adubey@linux.ibm.com a écrit :
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> This function is used by bpf_throw() to unwind the stack
> until frame of exception-boundary during BPF exception
> handling.
> 
> This function is necessary to support BPF exceptions on
> PowerPC.
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit_comp64.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index cebf81fbd59f..ec58395f74f7 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -247,6 +247,34 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
>   	bpf_jit_build_fentry_stubs(image, ctx);
>   }
>   
> +void arch_bpf_stack_walk(bool (*consume_fn)(void *, u64, u64, u64), void *cookie)
> +{
> +	// callback processing always in current context
> +	unsigned long fp = current_stack_frame();
> +
> +	for (;;) {
> +		unsigned long *frame = (unsigned long *) fp;
> +		unsigned long ip;
> +
> +		if (!validate_sp(fp, current))
> +			return;
> +
> +		ip = frame[STACK_FRAME_LR_SAVE];
> +		if (!ip)
> +			break;
> +
> +		/*
> +		 * consume_fn common code expects stack pointer(sp) in third
> +		 * argument. There is no sp in ppc64, rather pass frame
> +		 * pointer.
> +		 */
> +		if (ip && !consume_fn(cookie, ip, fp, fp))
> +			break;
> +
> +		fp = frame[0];
> +	}
> +}
> +

This fonction looks very close to arch_stack_walk(). Would it be 
possible to refactor and have a common part used by both functions, like 
ARM64 for instance ?

>   int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
>   {
>   	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;


