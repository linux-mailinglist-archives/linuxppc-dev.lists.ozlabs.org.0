Return-Path: <linuxppc-dev+bounces-16266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDEeOZOBdGl96QAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 09:23:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9697CFA9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 09:23:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dynrJ28g3z2yDk;
	Sat, 24 Jan 2026 19:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769243024;
	cv=none; b=S70q289FQv2w6Ewxt+BWXIiJIg31B/211DDfYsDjNyFONr2hmWCY/4u5rQfyYOAgajh2vx1ITl1CpJ1TsDPtkl6XLu/Uy6SnMmDv/P5SPH6oXMagRBiFQyIH0J/ao33EibT0d1WHdFgPQFXvGSlFcf+MauRciUOMmHcCF5TwQFJLE9JI0iNQxVNLR1jytk7Di+zVSVpSnEEdtHVCRnBrDuwVo2214McOOiAxCIkIY/i+V4H/Dsu4U5u3yvMUtA4/nml0QFf+vqV5fK8fCHUHgOrHJIQ2OuohAE4+Td1EhAP35SfbNVeDXfkytA/deg3wt4H9ve+U9brwZBvT112MLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769243024; c=relaxed/relaxed;
	bh=e466OXDzEmihJ3QGUJgQyjORu8oahV0FOyYZ5xRZbec=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=XVLFBe6Nx5uGC3RB2M+oz3A8J7eJzyzENS81b7thRteLR3W6oQ79otE330WSiRa8ulw94tLUPaqvxlYYQeDa/g0GZMfZtic6ZIG1Cq5vLx4+vfuYj5m/xeTedQM9BZiXIiGo4zxLdDIanGgjVZl5XP3IZ06eQtY2RfmPyRc4AlPtkZdgPSFSb2rDgEPbKiMetG0cr0Z4mnLzZizYip2VvSfNCR5pw16bdJHWrv/4pJXwcEA8vbYnXS+c8lcGWX1GkuMYe3p7vxIOXbmswTq37dgS/OQcVF4vxV7CBKyHpTAvh/7CPk4OByYxGHNIYHLpr9+kW6qMqaGpZMUJWDwKjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gQ4FHDzF; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gQ4FHDzF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dynrG74kfz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 19:23:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 021824407C;
	Sat, 24 Jan 2026 08:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4084FC116D0;
	Sat, 24 Jan 2026 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769243019;
	bh=KpG6/0cTWVmMn8PUAbjuUFccMtoHKtkLDwvs+w3tA30=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=gQ4FHDzFkZAci3RjPSeRlUv/3hGiShStmoyUEcn9ch2bEwIMcMY8jYI35vBB1rmsu
	 BsCy1xiJv+3hgS5i0koPdW75R3U/28Y+Z46TkwGi5RuyNqUrdvdv9VpscwsBDLfZ3N
	 iw7ggIgKw+0KbixPnVGP6VL9Pueil7PtE+bxMxY3SApM5BPhuyL0o/umE0GKiysZHE
	 xBJ7j4Qfe4TlFNKB1zR/v8tUTfYzH38wi9v+mDUQFroI61DwO47kahuO1xVqmrED3P
	 yMf7y2mIxtjFyYJhebTa1vYWrxKQLxjmVSkhw+1pMmkM43o6FjMt3uHyrWi1c1YkGc
	 hLMCZOrxEAbEQ==
Content-Type: multipart/mixed; boundary="===============0520039389324384177=="
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
Message-Id: <2a310e86a59eb4c44c3ac9e5647814469d9c955580c9c0f1b3d9ca4a44717a34@mail.kernel.org>
In-Reply-To: <20260124075223.6033-7-adubey@linux.ibm.com>
References: <20260124075223.6033-7-adubey@linux.ibm.com>
Subject: Re: [PATCH v5 6/6] powerpc64/bpf: Additional NVR handling for bpf_throw
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,mykolal@fb.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,naveen@kernel.org,maddy@linux.ibm.com,mpe@ellerman.id.au,npiggin@gmail.com,memxor@gmail.com,iii@linux.ibm.com,shuah@kernel.org,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Sat, 24 Jan 2026 08:23:39 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au,meta.com];
	TAGGED_FROM(0.00)[bounces-16266-lists,linuxppc-dev=lfdr.de,bpf-ci];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:martin.lau@kernel.org,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.kernel.org:mid]
X-Rspamd-Queue-Id: CA9697CFA9
X-Rspamd-Action: no action

--===============0520039389324384177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index db121b1404fe..17de8b53a962 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c

[ ... ]

> +/*
> + * For exception boundary & exception_cb progs:
> + *     return increased size to accommodate additional NVRs.
> + */
> +static int bpf_jit_stack_size(struct codegen_context *ctx)
> +{
> +	return ctx->exception_boundary || ctx->exception_cb ?
> +					BPF_PPC_EXC_STACKFRAME :
> +					BPF_PPC_STACKFRAME;
> +}

[ ... ]

> @@ -198,7 +249,19 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>  			EMIT(PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF));
>  		}
>
> -		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
> +		EMIT(PPC_RAW_STDU(_R1, _R1,
> +				-(bpf_jit_stack_size(ctx) + ctx->stack_size)));
> +	}

[ ... ]

> @@ -248,9 +311,19 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx)
>  		EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
>  				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
>
> +	if (ctx->exception_cb) {
> +		/*
> +		 * Recover additionally saved non volatile registers from stack
> +		 * frame of exception boundary program.
> +		 */
> +		for (i = _R14; i <= _R25; i++)
> +			EMIT(PPC_RAW_LD(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
> +	}
> +
>  	/* Tear down our stack frame */
>  	if (bpf_has_stack_frame(ctx)) {
> -		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
> +		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + ctx->stack_size));

For the exception callback case, doesn't this use the wrong stack_size?

In bpf_jit_build_prologue(), the exception callback does not create its own
frame - it sets R1 to the boundary's frame pointer via EMIT(PPC_RAW_MR(_R1,
_R5)). However here in the epilogue, the frame teardown uses ctx->stack_size
which is the callback's stack depth, not the boundary's.

The boundary program creates its frame with:
    STDU R1, R1, -(bpf_jit_stack_size(boundary_ctx) + boundary_stack_size)

But the callback tears it down with:
    ADDI R1, R1, bpf_jit_stack_size(callback_ctx) + callback_stack_size

Since each BPF subprogram can have a different stack_depth (set per-subprog
in kernel/bpf/verifier.c via func[i]->aux->stack_depth), if the exception
callback has a different stack depth than the boundary, R1 will end up at
the wrong location after this ADDI.

After the wrong R1 adjustment, the LR restore below loads from R1+16 which
is now pointing to the wrong memory location, potentially causing a return
to an invalid address.

Would it be correct to store the boundary's stack_size somewhere accessible
to the callback, or ensure the callback uses the same stack layout as the
boundary?

> +
>  		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
>  			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
>  			EMIT(PPC_RAW_MTLR(_R0));


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21311936056

--===============0520039389324384177==--

