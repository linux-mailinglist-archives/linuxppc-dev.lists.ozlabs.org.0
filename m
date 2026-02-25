Return-Path: <linuxppc-dev+bounces-17188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ET/Ns7dnmkTXgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:32:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F4196876
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:32:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLXWG07Kgz3f1v;
	Wed, 25 Feb 2026 22:32:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772019145;
	cv=none; b=MyzXVXaUi/hlPO+E/JioA6FLInjt/svi5yeYwRH/HyWlelfMP/4Yau2TYJxmNYTneBE5GCo8Yz0gwpRyB938SlKT7Q+ikh99HnitYZOg06/KP5XMkA6lujGeXkpvJhyDMwjFG9jHzYkLME9lDMSQlD4arznnf7u04b+rq3iNjALDmZAHsK1rz6yQBV8coU7dQ92VAFiCBZUrnNk0v7k9fGIC9eygjgCrc5FCKwHKR5tIZga6J6W+5KV0R6L7BusZALlbwn6xcnzisxZsWlwJiypkM484Fgk4C3LtwGseb6xsUSNnD7kxoQnIzgFHDLz6R++7z8VCGFX2B7b8jDxPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772019145; c=relaxed/relaxed;
	bh=tP9zP9sybHkL5/etQxUXDFl+HVPBPHwP8+wadmDU9IE=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=P+JKvM4w3ODewcNq068k72IeMs1+ov2ASttiB+yAUUkYegFmPKbTZW0hVNpy8mEJqPJi/q1mYgPeKGaGN+xoPTuhvi0zGT6L4h3I2pJGb5NP3+90Bjn7V8FkBsrwJMv4WenroEpZoFz23F7btuCXk5dyjqtpyyPESEVDtZ7yHJwuMZKy6Xya4hX+i3K27rQYS6HMxgDul3QSIMYweit8ZsMRXqKRP+Q+plRADEv50D+xfD/mA9Dyfh/pwanWYaiFr7yohMsTZVJqGuVmoNUvGHLLdV9mXKccoXwszl1+Rp9Udq/4EYLec1z2R7ceGuuJOGZrs3RKXtT5ozF3Iz7thw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j/EAetCC; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j/EAetCC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLXWD6gC9z3f1Z
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 22:32:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D48C560097;
	Wed, 25 Feb 2026 11:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C78BC116D0;
	Wed, 25 Feb 2026 11:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772019142;
	bh=dertjUWoCoqTLHjFr802gNUMYAMUBvWXGSbi4fea2os=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=j/EAetCCmDn2Ym4UrJaJRe9tUfMQ7TfxOg9Tl37/0w+EkMpTJUdoOoCM8DsEpRWqf
	 O+C6jPQeZ0ybtyMhOoNYMSeUYPkG3OsflTVWs85HIrZdRZyycUSQfqEJIH3oO+pWpb
	 dGxmj0tcd/QrLfhy2/azP2+pLh51PrZi1ebVzFlSCHo/O73ewrKSdbOkBHXeieCBJX
	 7vPoo1cyWzTKXvq0x9zN3uhY2UXx9QFZqmcuuepP1ogj5bftlsTKaT+TW/SyGc1t50
	 4/QfKjzcT2b2nXShYjvL5sMmeBP9UwHCi0iYH3iU6kNTozKaWuwhkXeXL6uN34vV1F
	 nqn4fFtYDkYJw==
Content-Type: multipart/mixed; boundary="===============3041621592064433641=="
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
Message-Id: <d44beebe88d00a554d0bda86f0ceccf403cd0f127e82e4a52b2a2fa2ae0bf22b@mail.kernel.org>
In-Reply-To: <20260225153950.15331-1-adubey@linux.ibm.com>
References: <20260225153950.15331-1-adubey@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc64/bpf: Implement JIT support for private stack
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org,hbathini@linux.ibm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,maddy@linux.ibm.com,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 25 Feb 2026 11:32:21 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17188-lists,linuxppc-dev=lfdr.de,bpf-ci];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:hbathini@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:maddy@linux.ibm.com,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.kernel.org:mid]
X-Rspamd-Queue-Id: 128F4196876
X-Rspamd-Action: no action

--===============3041621592064433641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c

[ ... ]

> +static void priv_stack_check_guard(void __percpu *priv_stack_ptr, int alloc_size,
> +								struct bpf_prog *fp)
> +{
> +	int cpu, underflow_idx = (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
> +	u64 *stack_ptr;
> +
> +	for_each_possible_cpu(cpu) {
> +		stack_ptr = per_cpu_ptr(priv_stack_ptr, cpu);
> +		if (stack_ptr[0] != PRIV_STACK_GUARD_VAL ||
> +			stack_ptr[1] != PRIV_STACK_GUARD_VAL ||
> +			stack_ptr[underflow_idx] != PRIV_STACK_GUARD_VAL ||
> +			stack_ptr[underflow_idx + 1] != PRIV_STACK_GUARD_VAL) {
> +			pr_err("BPF private stack overflow/underflow detected for prog %sx\n",
> +			bpf_jit_get_prog_name(fp));

Should "%sx" be "%s"? The trailing 'x' would be appended to the
program name in the error output.

> +			break;
> +		}
> +	}
> +}

[ ... ]

> +	priv_stack_ptr = fp->aux->priv_stack_ptr;
> +	if (!priv_stack_ptr && fp->aux->jits_use_priv_stack) {

[ ... ]

> +		priv_stack_ptr = __alloc_percpu_gfp(priv_stack_alloc_size, 16, GFP_KERNEL);
> +		if (!priv_stack_ptr) {
> +			fp = org_fp;
> +			goto out_priv_stack;
> +		}

[ ... ]

>  out_addrs:
> +		if (!image && priv_stack_ptr) {
> +			fp->aux->priv_stack_ptr = NULL;
> +			free_percpu(priv_stack_ptr);
> +		}
> +out_priv_stack:
>  		kfree(addrs);

When __alloc_percpu_gfp() fails above, goto out_priv_stack jumps
here. At that point, addrs is declared as:

    u32 *addrs;

without initialization and has not yet been assigned (the assignment
addrs = jit_data->addrs comes after the goto). This passes a garbage
pointer to kfree().

The x86 JIT has kvfree(addrs) at the out_addrs label (before
out_priv_stack), so the goto to out_priv_stack skips it. Should the
label ordering here be adjusted similarly, or should addrs be
initialized to NULL?

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c

[ ... ]

>  		EMIT(PPC_RAW_STDU(_R1, _R1,
> -				-(bpf_jit_stack_size(ctx) + ctx->stack_size)));
> +			-(bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : ctx->stack_size))));
>  	}

The STDU frame size is now bpf_jit_stack_size(ctx) when priv_sp is
set, excluding ctx->stack_size. However, bpf_jit_stack_offsetof()
still computes NVR save offsets including ctx->stack_size:

    bpf_jit_stack_offsetof() {
        ...
        return (bpf_has_stack_frame(ctx) ?
            (frame_nvr_size + ctx->stack_size) : 0)
                - (8 * (32 - reg)) - BPF_PPC_TAILCALL;
    }

Similarly, bpf_jit_stack_local() returns
STACK_FRAME_MIN_SIZE + ctx->stack_size.

Since the STDU frame no longer reserves space for ctx->stack_size
when using private stack, these offsets point ctx->stack_size bytes
beyond the allocated frame. This would cause NVR saves in the
prologue and restores in the epilogue to write past the frame
boundary into the caller's stack.

The x86 JIT handles this by zeroing stack_depth in do_jit() when
private stack is active, which keeps all offset calculations
consistent. Would a similar approach work here, either zeroing
ctx->stack_size after setting up priv_sp, or updating the offset
functions to account for it?

[ ... ]

>  	/* Tear down our stack frame */
>  	if (bpf_has_stack_frame(ctx)) {
> -		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + ctx->stack_size));
> +		EMIT(PPC_RAW_ADDI(_R1, _R1,
> +			bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : ctx->stack_size)));

Same issue here -- the ADDI restore is correct, but the NVR restores
emitted by bpf_jit_emit_common_epilogue() use
bpf_jit_stack_offsetof(), which still includes ctx->stack_size in
the offset and would load from the wrong location.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22393518231

AI-authorship-score: low
AI-authorship-explanation: The code shows typical human porting errors and organic review iteration across v1/v2, inconsistent with AI-generated code patterns.
issues-found: 3
issue-severity-score: high
issue-severity-explanation: Stack corruption from mismatched NVR save offsets affects every PPC64 BPF program using private stack, and kfree of an uninitialized pointer can crash or corrupt the slab allocator under memory pressure.

--===============3041621592064433641==--

