Return-Path: <linuxppc-dev+bounces-17209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BM7HQhdn2lRagQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 21:35:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8527719D4D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 21:35:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLmYc6H8Xz3fFW;
	Thu, 26 Feb 2026 07:35:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772051716;
	cv=none; b=jqSPXZXnjxr5mU1I9kBgMdnpfwi4wBV47df3wTSZRnFCtTqdN+wZNnHvqG1uQfWACK5rX+XRc7gqzEm20E5XVv6ivpB66ozyninrzv5I5x6wY00RxGjxqC6nV363KBMyyvej4VP1hGCeZYFwtOl9MIBJ8T1mOUGHJOotRoC8cMzisJhDuSPRHlQLwc1nPkIVKq/bJbltXIvNbNUusW72pgxkAaev5g0Fzr64RyghxziFVMdYFDzCR7kpOv3HD2OtKZJYUCemaYD6Eetutu7IT3saS6P473s7R6OAEV+/hQC8kBmr3uBvumTNobqxHOwV2iGH7K7ng5x+pjf3zI+C3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772051716; c=relaxed/relaxed;
	bh=5cuvEe034MOuTS31CdoMjTcRlb8gEzIj/KXfyUGYrTU=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=L0ygPDUf/a4sgd/iLA5G75KwUZruYeVAGIkfaatcO6e8q0grMFsxUWlLWO+pmuKLjudeWQq1SF1ytgbYhfbL6ry8aSN+ymTU7sp4+CwoMpeLMv9/1feHDbb6U60LCXQJhG/h0BqToavhb/Tl2UzygUErJkqBGf11nthtOepX/nlsAQ4sSQC72vy9Umo1zIh1bUM2tcvTZu05VkLwecrka9n0XEoRHPyJcNQtKT7iChQuRtHkcTbq8j6JdvRTGueAj+XoAqWU9XPQx6ZtU85ITbpf94hnJX6oRWtXQQ/YLdbFlVjR7eTGCvs6gwJzB9ZhtDo/WNLC+KWjXCZm3BBYDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVesk7qc; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVesk7qc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLmYb74JXz3fFD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 07:35:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07E0A60097;
	Wed, 25 Feb 2026 20:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A7BC116D0;
	Wed, 25 Feb 2026 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772051713;
	bh=e0r3/PS0HD8MVO62a3bxSxV4kemPjRLsQmHi+/fzruA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=hVesk7qchHZ6t9Yzp5mQ/vmVNbOnAdQyGLEGWLaMx5b3jNOwtsT298ZNArS2AbRKF
	 V9Ccq2FZOiR2Hl5Bk0YCmexktaH08/OtsWpSd7ywN/k8L/0T+JVji0lSrj1mIGQm2w
	 zmrxrkRut1oB87oOfPYIsWzrczMi9CeuBrw3axtJcnmw9WPUyww9NKm7fwe2J27mmC
	 SpYcFD5bshWhflezwTChe85KIhsetiXrClxoTnzhkER7/KTO/hMOsn87N/jKF657rC
	 TBDOF1QDS91BYXkE5FNLgbGKuatfGmNgaEc3IzTx4coCZcpgQGRoeLcG/JGoKInN6f
	 0zn1RA1s+jQXQ==
Content-Type: multipart/mixed; boundary="===============8260834179809546704=="
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
Message-Id: <e4ce5ae55b41231ac40edee888d793b574eb9fab2036264dd615117c6c0e9fbb@mail.kernel.org>
In-Reply-To: <20260226005440.9570-1-adubey@linux.ibm.com>
References: <20260226005440.9570-1-adubey@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] powerpc64/bpf: Implement JIT support for private stack
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org,hbathini@linux.ibm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,maddy@linux.ibm.com,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 25 Feb 2026 20:35:12 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17209-lists,linuxppc-dev=lfdr.de,bpf-ci];
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
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 8527719D4D1
X-Rspamd-Action: no action

--===============8260834179809546704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c

[ ... ]

> @@ -209,6 +264,9 @@
>  	cgctx.is_subprog = bpf_is_subprog(fp);
>  	cgctx.exception_boundary = fp->aux->exception_boundary;
>  	cgctx.exception_cb = fp->aux->exception_cb;
> +	cgctx.priv_sp = priv_stack_ptr;
> +	if (priv_stack_ptr)
> +		cgctx.stack_size = 0;

This zeros ctx->stack_size before the JIT passes, which is correct
for the kernel stack frame allocation (skipping BPF stack space on
the kernel stack).

However, emit_fp_priv_stack() also reads ctx->stack_size to compute
the BPF frame pointer offset within the private stack allocation:

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c

[ ... ]

> +static void emit_fp_priv_stack(u32 *image, struct codegen_context *ctx)
> +{
> +	/* Load percpu data offset */
> +	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R13,
> +			offsetof(struct paca_struct, data_offset)));
> +	PPC_LI64(bpf_to_ppc(BPF_REG_FP), (__force long)ctx->priv_sp);
> +	/*
> +	 * Load base percpu pointer of private stack allocation.
> +	 * Runtime per-cpu address = (base + data_offset) + (guard + stack_size)
> +	 */
> +	EMIT(PPC_RAW_ADD(bpf_to_ppc(BPF_REG_FP),
> +			bpf_to_ppc(TMP_REG_1), bpf_to_ppc(BPF_REG_FP)));
> +	EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), bpf_to_ppc(BPF_REG_FP),
> +			PRIV_STACK_GUARD_SZ + round_up(ctx->stack_size, 16)));
> +}

Since ctx->stack_size was set to 0 earlier in bpf_int_jit_compile(),
the ADDI immediate here becomes PRIV_STACK_GUARD_SZ + 0 = 16.
This places BPF_REG_FP at the bottom of the usable stack area
(just past the overflow guard), rather than at the top.

The commit message describes the intended layout:

    BPF frame pointer = Priv stack allocation start address +
                        Overflow guard +
                        Actual stack size defined by verifier

But the "Actual stack size defined by verifier" term is lost because
ctx->stack_size is already zero at this point.

BPF programs access the stack at FP-8, FP-16, etc.  With FP at
offset 16 from the allocation base, FP-8 lands inside the overflow
guard and larger offsets go below the allocation entirely.

For comparison, x86 in do_jit() pre-computes the offset before
zeroing:

    priv_frame_ptr = priv_stack_ptr + PRIV_STACK_GUARD_SZ +
                     round_up(stack_depth, 8);
    stack_depth = 0;

And arm64 in build_prologue() does not zero ctx->stack_size at all,
instead using it directly:

    priv_stack_ptr = prog->aux->priv_stack_ptr + PRIV_STACK_GUARD_SZ;
    emit_percpu_ptr(priv_sp, priv_stack_ptr, ctx);
    emit(A64_ADD_I(1, fp, priv_sp, ctx->stack_size), ctx);

The v1 of this patch also had it correct, pre-computing in
bpf_jit_build_prologue():

    priv_frame_ptr = (void*) ctx->priv_sp + PRIV_STACK_GUARD_SZ +
                     round_up(ctx->stack_size, 16);

It appears the "Minor refactoring" in v1->v2 moved the
cgctx.stack_size = 0 earlier in the pipeline and removed the
pre-computation step, but did not account for emit_fp_priv_stack()
needing the original stack depth.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22413899411

AI-authorship-score: low
AI-authorship-explanation: Code follows established powerpc JIT patterns with architecture-specific constructs; commit history references specific CI-bot fixes consistent with human iterative development.
issues-found: 1
issue-severity-score: high
issue-severity-explanation: BPF frame pointer is miscalculated due to using zeroed ctx->stack_size in emit_fp_priv_stack(), causing all BPF stack accesses to write outside the allocated private stack region, resulting in memory corruption.

--===============8260834179809546704==--

