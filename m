Return-Path: <linuxppc-dev+bounces-16163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCISHiVfcmnbjAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 18:32:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F06B59A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 18:32:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxp6B05fzz2ySb;
	Fri, 23 Jan 2026 04:32:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769103137;
	cv=none; b=XjB9s2cagkPLx77nj5cW/www6CsBqaa8leNGI/g13rRuVR1D7iHYo5TujP4XQH2HUmSBDRKhERfweV4X7ZsWFF40wlX5tZ1ygs/FXp9x99iMNH35QOv3gKE93fq9RmRUKVTkNcrFVZEW3teQJSotFygWWlhm9MbSMTGj4996SidckgFSo+xeUWjP4Kc9MvOlXSMPuh6mEGjBDvCH79Io6AfVH2YbljPQWxqVPoKUA4bcJgt8fW4H07YP0eaB6fsXe4HgTza+LfPHWLBhkRdaF4BwJoa7AN1W/gJ6JY4+eQRuMok6MsGcju1QjO5BIifDJ2TRp81zMlW7JMEem3XyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769103137; c=relaxed/relaxed;
	bh=FRzUR/5+dZOlbGTSDWCdno+yTrGOlxO7nq+OLcb/zXQ=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=CJ/848FwDEaC7SKfmvZirvY+WEcGq3x4s83Zxj+ivDGr2++KFZZ3U5d5z8pC/dBFwQeUk9jmmdF+NeGe6yluQqqghNkr+zNGJW4Xz9iVRsbiCWC3r8Oy3fnS+MULMwo0ujkbm/xgcn7AOpTCpo/7Vvx7pHr9w9ZtbqAC5BvcFpYarTGvSY6drCw13CGkwR+7joXiXOmnlMP2b+utHZl5K0p5v9vWNy1e+wNxwQxsAcq4i7rpy062/EN02LdcAHzQFBV1c3ZXzDElUGxQf5xKsXhSxyLqo3zopQy4rIYo2IdVYJpNJJ4XSa0CYdsfOkLvOWKyEqd3l8AwstZmtOUzsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ktVDNiW4; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ktVDNiW4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxp690cW9z2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 04:32:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB871600C4;
	Thu, 22 Jan 2026 17:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D66C116C6;
	Thu, 22 Jan 2026 17:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103134;
	bh=A2CbCQzi9H7Y9xtWAzN3DehfmuNIC6HQVvniPElAetg=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=ktVDNiW4BXGCpe67pIHOpMtbGTBn9xvT4FbWe/HXNT+/v4RPL4mzXjK4no16pIVc3
	 Y9jUuFKKJB2MEIWxBdwxa/o+uJA3EWjDFim8eESGL+U847fXuytv68jA8hHaVw7WMJ
	 DBvtQeGI+YuioHqDNX8Hhez3VXc7cKiFbO0MpJhBsuJQCy+/Hw+EoqHPa1WHuZ030v
	 wBZNRYtddTlGV9uz2F0KjyN5cJW5kRQB2TefI196UxObSTdQ9CmhteAEp0WYS1A5Kp
	 3io0CSaqiB9G5gIzqcS2Qda9XOzX3a1/ypMdp83jrlU/TTzqhlp4rLp/vLw2L8a26D
	 yTGUpoiUOJt4w==
Content-Type: multipart/mixed; boundary="===============5316141756419194533=="
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
Message-Id: <c8f39c15a39e7985d17afbd34fd8fd0a8c58e44fa21c1c08e03b27a430fa11b0@mail.kernel.org>
In-Reply-To: <20260122165716.10508-7-adubey@linux.ibm.com>
References: <20260122165716.10508-7-adubey@linux.ibm.com>
Subject: Re: [PATCH v3 6/6] powerpc64/bpf: Additional NVR handling for bpf_throw
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,mykolal@fb.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,naveen@kernel.org,maddy@linux.ibm.com,mpe@ellerman.id.au,npiggin@gmail.com,memxor@gmail.com,iii@linux.ibm.com,shuah@kernel.org,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 22 Jan 2026 17:32:13 +0000 (UTC)
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
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16163-lists,linuxppc-dev=lfdr.de,bpf-ci];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au,meta.com];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:martin.lau@kernel.org,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.250];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38]
X-Rspamd-Queue-Id: 8D6F06B59A
X-Rspamd-Action: no action

--===============5316141756419194533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index d7cd8ab6559c..cbaf811e1a35 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c

[ ... ]

> @@ -245,9 +302,25 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
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
> +
> +		/*
> +		 * LR value from boundary-frame is received as second parameter
> +		 * in exception callback.
> +		 */
> +		EMIT(PPC_RAW_MTLR(_R4));
                ^^^^^^^^^^^^^^^^^^^

This sets LR from R4 (the boundary's LR passed as second parameter).

> +	}
> +
>  	/* Tear down our stack frame */
>  	if (bpf_has_stack_frame(ctx)) {
> -		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
> +		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + ctx->stack_size));
> +
>  		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
                                          ^^^^^^^^^^^^^^^^^^^^^
>  			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
>  			EMIT(PPC_RAW_MTLR(_R0));
                        ^^^^^^^^^^^^^^^^^^^

For exception_cb programs, bpf_has_stack_frame() returns true (the function
explicitly checks ctx->exception_cb). The condition on the inner if statement
also evaluates true because of "|| ctx->exception_cb".

This means for exception_cb programs, LR is first set correctly from R4,
but then immediately overwritten by loading from the stack and issuing a
second MTLR.

The comment above the EMIT(PPC_RAW_MTLR(_R4)) states that LR is received as
the second parameter, suggesting R4 is the authoritative source. If
exception_cb and exception_boundary have different stack_depth values, the
stack-loaded LR value after the ADDI may point to an incorrect location.

Should the inner condition exclude exception_cb, perhaps something like:

    if (ctx->seen & SEEN_FUNC && !ctx->exception_cb) {

Or alternatively, should the EMIT(PPC_RAW_MTLR(_R4)) be moved after the
stack teardown code to ensure it takes precedence?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21257691486

--===============5316141756419194533==--

