Return-Path: <linuxppc-dev+bounces-17135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFGhN1EYnmmcTQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 22:29:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F311118CC5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 22:29:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL9q21Gncz3cMD;
	Wed, 25 Feb 2026 08:29:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771968590;
	cv=none; b=FbUDkwH1Qb3aBejL/tEhFvOmzrJd0NKxejOzkiHuQ3n7QGuIq78Dr7xHowdzwpKD81elSj154dq3v+FzGOGnuWA8rc33w7yxBNM/QKj6P2nDCYGKQr9lPZaCvS9GbyPl4zuww5wFJhhUUypshX5GJWtFtmc2zO/ZV37+AsXW2/ioLfwuicFA32FmFsn/rD2bG/+BrvG7HevAqtIRAUHnG+/6ZMDOQ4z8RpI/zMjl5FAY9mgmFmolx6sBqJepphOzoQNZjJfZgS6BtSR5PRqsoDFsPnxaNG0ovhJK56nuTsHefEAicUHJJFq6zBv6Gn6R39kt5J1/Gbixm1vhhov/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771968590; c=relaxed/relaxed;
	bh=q10+uC/aYDkdKm829ZpOBGZg/BCmUVy0TnhE+fQq53I=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=JyYNZURUZNe1mMvS8k6Xsva8xDQRkZbsHxDt2l6UU6XTZiJFgeq1WftGusF5olK4fUglceCShHuXapFjNAlwbduINLpihVHj3Aj+JakQZvWxmlYAORx8lLS2LZxwhwg1E2BzgcNd7H+jwTSw0hS9UeYwixFeKyQJby8w1sUFBfPVUHkPQzvKPxBEySp8BS3xfUcfFMETxVOrwE0L+OOvTUvfTu5RMNsTum8jBnLNAThKB7lie8fSHTmI/8ZGZJksBacGcdwswoKkfZQB9SAwMy7ZsWEU6oFJOWmxUr3fJdQtWkibSSpI2GlxTdHoT9z1/in6JBmk0mOWnZhpLPH2rQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jc6BIQKZ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jc6BIQKZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL9q06TdKz2xN2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 08:29:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66E2B60053;
	Tue, 24 Feb 2026 21:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD53C116D0;
	Tue, 24 Feb 2026 21:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771968586;
	bh=75wFjdLGpHCy36wy8xROygNeEyyiavbM5IBG1ytvkKs=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=jc6BIQKZhDP0Fw8ryEyJuwTU9nb3PVbbMInrmC86lfEXFQgDCmRHLxTlcrfqleLGK
	 bW7AW+h+lH394daVpxBnzCdO5vliuMNTKUIzMa206/I2pZQSfq5VNaMBfq9gM2erse
	 oMWanjnulqaGMccx74WsG87tuqnOSYs0umeizAMeCVOSP/9J+MdDLK1h29IJWDnUrd
	 pdEooMBOtNPk8JcZtDlpjn2suLhT/gk2TiDOc7sp+L/UmSbSDovYAgkYLByy3FMfxf
	 ZNJxwsq8VnionIo7TZkDrRncKA7LdEfmsr0w2hrDHdZb+/lnr+1GpSgM1eFT/2eQs7
	 /S5ORyr0PR6kw==
Content-Type: multipart/mixed; boundary="===============4812018571603848610=="
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
Message-Id: <29abe0604fd96a4e172f6ff49dacddb3f207c2e84959e0d93223ca30ba90d77f@mail.kernel.org>
In-Reply-To: <20260225013627.22098-2-adubey@linux.ibm.com>
References: <20260225013627.22098-2-adubey@linux.ibm.com>
Subject: Re: [PATCH 1/4] powerpc/bpf: Move out dummy_tramp_addr after Long branch stub
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org,hbathini@linux.ibm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,maddy@linux.ibm.com,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 24 Feb 2026 21:29:44 +0000 (UTC)
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
	TAGGED_FROM(0.00)[bounces-17135-lists,linuxppc-dev=lfdr.de,bpf-ci];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.kernel.org:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F311118CC5D
X-Rspamd-Action: no action

--===============4812018571603848610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c

[ ... ]

> +	/* Relative offset of dummy_tramp_addr wrt start of long branch stub */
> +	tramp_idx = long_branch_stub_idx + 7;
> +	/*
> +	 * Image layout need not be considered 8-byte aligned.
> +	 * Lower 3 bits must be clear for 8-bytes alignment.
> +	 * Adjust offset for padding NOP before dummy_tramp_addr
> +	 */
> +	tramp_needs_align = (((unsigned long)&image[tramp_idx]) & 7) != 0;
> +	tramp_load_offset = tramp_needs_align ? 24 : 20;

Can the alignment check produce different results between the sizing
pass and the code generation pass?

During the sizing pass, bpf_int_jit_compile() calls
bpf_jit_build_epilogue(NULL, &cgctx), so image is NULL here.
&image[tramp_idx] evaluates to (tramp_idx * 4), and the alignment
decision depends only on the parity of tramp_idx.

During code generation, image is code_base, which may or may not be
8-byte aligned. bpf_jit_binary_pack_alloc() uses alignment=4 with a
random start offset, so roughly half the time code_base will have
bit 2 set. When it does, the alignment check flips:

    sizing pass (image=NULL, tramp_idx odd):
        ((tramp_idx * 4) & 7) = 4, tramp_needs_align = true

    code gen pass (code_base bit 2 set, tramp_idx odd):
        (((unsigned long)code_base + tramp_idx * 4) & 7) = 0,
        tramp_needs_align = false

This means the sizing pass may emit a NOP that the code generation
pass omits (or vice versa), causing the stub to be a different size
than what was computed during sizing.

> +	EMIT(PPC_RAW_LL(_R12, _R12, tramp_load_offset));
> +	EMIT(PPC_RAW_MTCTR(_R12));
> +	EMIT(PPC_RAW_MTLR(_R11));
> +	EMIT(PPC_RAW_BCTR());
> +
> +	/* align dummy_tramp_addr to 8 bytes */
> +	if (tramp_needs_align)
> +		EMIT(PPC_RAW_NOP());
> +
> +	if (image)
> +		*((unsigned long *)&image[ctx->idx]) = (unsigned long)dummy_tramp;
> +
> +	ctx->idx += SZL / 4;
> +
>  	if (!bpf_jit_ool_stub) {
>  		bpf_jit_ool_stub = (ctx->idx - ool_stub_idx) * 4;
>  		bpf_jit_long_branch_stub = (ctx->idx - long_branch_stub_idx) * 4;
>  	}

Because the conditional NOP makes the stub size variable,
bpf_jit_long_branch_stub now depends on whether tramp_needs_align
was true when it was first set. This global is set once during the
first program's sizing pass and reused for all subsequent programs.

Since each BPF program has a different body size (different N for
long_branch_stub_idx), and each allocation may have different
code_base alignment, the stub size can vary per-program. But
bpf_arch_text_poke() uses the fixed global to compute the branch
target:

    create_branch(&old_inst, ip,
                  bpf_func_end - bpf_jit_long_branch_stub,
                  branch_flags);

If this program's actual stub size differs from the global by 4
bytes, the branch lands one instruction before or after the intended
mflr r11 at the stub entry.

In the old code, the stub had a fixed layout with no conditional
instructions, so bpf_jit_long_branch_stub was the same for all
programs.

[ ... ]

> @@ -1161,6 +1180,8 @@ static void do_isync(void *info __maybe_unused)
>  *	mtctr	r12
>  *	mtlr	r11 // needed to retain ftrace ABI
>  *	bctr
> + *	nop         // optinonal, mem align dummy_tramp field
> + *	.long	<branch_addr>/<dummy_tramp>

Typo: "optinonal" should be "optional".

Also, the comment block above this still shows the old load offset:

 *	ld	r12, -16(r12)

This should reflect the new forward offset (20 or 24).

[ ... ]

>  	/*
>  	 * Long branch stub:
>  	 *	mflr	r11
>  	 *	bcl	20,31,$+4
> -	 *	mflr	r12
> -	 *	ld	r12, -8-SZL(r12)
> +	 *	mflr	r12		// lr/r12 stores current pc
> +	 *	ld	r12, 20(r12)	// offset(dummy_tramp_addr) from prev inst. is 20

The hardcoded 20 in this comment is only correct when no alignment
NOP is needed. When tramp_needs_align is true, the offset is 24.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22369534987

AI-authorship-score: low
AI-authorship-explanation: Domain-specific code with detailed hardware debugging output in the cover letter suggests manual engineering work.
issues-found: 3
issue-severity-score: high
issue-severity-explanation: Alignment check uses NULL image pointer during sizing pass, causing variable stub sizes that break the bpf_jit_long_branch_stub global used by bpf_arch_text_poke to compute branch targets, potentially causing incorrect JIT code execution.

--===============4812018571603848610==--

