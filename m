Return-Path: <linuxppc-dev+bounces-16170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ANHCWOZcmnBmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:40:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2756DDCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:40:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxvcv1nW5z30M6;
	Fri, 23 Jan 2026 08:40:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769118047;
	cv=none; b=X522H2145TfAu17HADbKC6XO+fTaQIO/OkDy21ETbpCO6z6IBQYaakhjjRVrmX356dzNQWeKissIqVWbOtjzz0EElRBjSMDELXabHi7Aw7AO5qhiiekJdHzFzoQ2Oe7U1er1oi7qL0mTYL86Lqqatt1aq4D9aK1nSUZRcu1mlGEpz+6vr8ee1jfyHl4ptA/p5gvkydTOAF+TelrxcEfV7BGneKRkpqlSixMzGQR7FeDVaQi0diMH7DgJzCiVgyx+cxd4BOPIgM0oOpwHw+3NL/cDtC+sDfZ4itzCTNfTeLXKsDLfyynaw81gDuAnvXoV6CdV7fey7uWC1mH8Vh6Zug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769118047; c=relaxed/relaxed;
	bh=JyacsPXnAfpiV8RqWjoYbb1a93quFh3hXO3boqerOeo=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=TdfA6E4Tw/S0SwxMHvKmstYexK00l5th5YlJGnlgpA2GXboiBbUFNEzBMwcPyNXSC8c1GPblIZCGAokGEbm9OzQvva+xn23oA0k51uUVGRWZvn5FkLa84av9hADLVhs4pDy6KEdJB+YBVnZFdf7Z0eYhXzNldQc99EwKrWZ+Dd5aEOq96vhMfeWCOp5Xn12PL6jVtvA92/rQnRitcH96nhkzh6bN9Ywfqy+RV7HsYcOD/5WF0mXxuVpGc7SI6Pmb9PiMDhaU6/3iBditNYRMJl45yaxSot7V07B9gGIhwCUGgNc0So7HblWDcYCkoSfTbUJ+ZUycoGpb3HHV3coT5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WkL2AwkM; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WkL2AwkM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxvct35b0z2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 08:40:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDD2940890;
	Thu, 22 Jan 2026 21:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071EDC116C6;
	Thu, 22 Jan 2026 21:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769118043;
	bh=1Nnhn/yFdXfGhXqZb6rKEAIzjm4Y+H9DE9pNT3uRZvI=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=WkL2AwkMslaNibmLrcuMqERxGf5wKIAOdkx8o4us6eZVCdZdz8edkbgVTZcR+xgTx
	 1SMhj7+EFi69sKB/pjAkBud0b7QX26Iye6Sk6gFoAVzktEX2XyiaLLdBzyrkBy8jbh
	 geoD9FYejgS90O/fRgoq788IywfDy/wnHMHx2sYAC6ui7u/+xmcoe5g2mthh3nTblO
	 H48fFg8AbRVMcPmuuMj0bP2PyHxVfoKzwiQEw0sLOAGonq8tCFxahgNKR2xtnGk2+w
	 +5fQEkzEduhsi4AeNsAefe/VmSMqLyCdHKgMu+fCiblaye7NiCJI6haIOHmxB+g99O
	 hiuUW9ldBWDpA==
Content-Type: multipart/mixed; boundary="===============4329220787654898227=="
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
Message-Id: <e63a916bd44b8352aace4fd47fdeb459dc75cceb71615f44e6234cc1b6ffbd69@mail.kernel.org>
In-Reply-To: <20260122211854.5508-7-adubey@linux.ibm.com>
References: <20260122211854.5508-7-adubey@linux.ibm.com>
Subject: Re: [PATCH v4 6/6] powerpc64/bpf: Additional NVR handling for bpf_throw
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,mykolal@fb.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,naveen@kernel.org,maddy@linux.ibm.com,mpe@ellerman.id.au,npiggin@gmail.com,memxor@gmail.com,iii@linux.ibm.com,shuah@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 22 Jan 2026 21:40:42 +0000 (UTC)
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
	TAGGED_FROM(0.00)[bounces-16170-lists,linuxppc-dev=lfdr.de,bpf-ci];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:martin.lau@kernel.org,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.244];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.kernel.org:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BE2756DDCF
X-Rspamd-Action: no action

--===============4329220787654898227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index c284a12fce6e..98780a15fc69 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c

[ ... ]

> @@ -125,9 +149,19 @@ int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
>
>  static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
>  {
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
>  		return (bpf_has_stack_frame(ctx) ?
> -			(BPF_PPC_STACKFRAME + ctx->stack_size) : 0)
> +			(frame_nvr_size + ctx->stack_size) : 0)
>  				- (8 * (32 - reg)) - BPF_PPC_TAILCALL;

For the redzone case (no stack frame) with exception_boundary, this
formula computes R23 at offset -80 and R24 at offset -72 from R1.

However, bpf_stf_barrier() uses hardcoded offsets -80(1) and -72(1) to
temporarily save R21 and R22 during STF barrier execution:

    asm (
    "	bpf_stf_barrier:		;"
    "		std	21,-80(1)	;"
    "		std	22,-72(1)	;"
    "		sync			;"
    "		ld	21,-80(1)	;"
    "		ld	22,-72(1)	;"
    ...
    );

When an exception_boundary program without its own stack frame executes a
memory load that triggers STF_BARRIER_FALLBACK, can bpf_stf_barrier()
corrupt the saved R23 and R24 values? The hardcoded offsets would overlap
with the extended NVR save area.

If exception_cb later restores these registers, it would get R21/R22 values
instead of the original R23/R24 values.

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21265643939

--===============4329220787654898227==--

