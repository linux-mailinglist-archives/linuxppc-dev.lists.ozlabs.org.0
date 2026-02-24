Return-Path: <linuxppc-dev+bounces-17134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOEXN8oRnmlsTQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 22:02:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE618C929
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 22:02:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL9Bv35VCz2xQB;
	Wed, 25 Feb 2026 08:01:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771966919;
	cv=none; b=CsV6W/rDocbD7ktDAfdQ05YnCsjXLK2Vs3r/yc8IVVJiJT9PVsAnsLCfDNDXFG+TGKCnAS46FKGcNUi40Icg/n5KUokvU2kF9wNd8CHd//glZ8i0/janfIE/qFuCxhFoUlXB9r0FQtlFNubn/rbwi0iOHAI3GUoKY4X/CufY+ZFUanLZvMvNTXK8Cgu1GPTMlXlRNPfp6Iy1Zcyuxanj3uoGLgtvRLGGfo6K/f0TAA4R6pMsiSsu3ELe5AVYpcDDHx5DO4nuqjzkLWfaAdtUgLcnmYhtCSNcxjTGJF+SQYiKD2zc/0ECA4NDyEduP4Mpp7L5w1gqt6jU7bGIlhMVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771966919; c=relaxed/relaxed;
	bh=lE840fOf2zf4Dgfox0H0BhhA8SZtLuHDg7mTvLDv3eY=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=XnB5lP2iW0UPgZMLp4xKiN/z+8KPWnSB7U9fMIiWUWa6/wkyMkoMpIjL1gd0O41weHchWOIpVGTXc35nmZYOozZiyjft3XlbJ95gyEN7FUJQtY6BLIhbQYQfODD4UMdldB2p0Ns6h1ugDLfciFXwqrajeo+KRhafBUpHIjKUDDRzOaUTlKwWEVkntkndyVCWQPccGuJeUbrXYnNWPURSR4+sL1tQqZ4o4EjzRKxtQf5JSalzQipTAlThP0LKRr/4Cj6dxKq8Wv/+zYGXSwLNuscnbszOy1dkX1soWYrpDguWw2kM03hYHjHVB4ML85fZoZxKRri5elyFUyZs8wsnjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cNJrq7MS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cNJrq7MS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL9Bt1dX9z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 08:01:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF60760053;
	Tue, 24 Feb 2026 21:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70ABCC116D0;
	Tue, 24 Feb 2026 21:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771966914;
	bh=RsPVPaopC3BXTr46mcSYS7S0dKw/uRjutei23T7qobo=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=cNJrq7MSne/g/e1PNiCNGRpmnDJokkDLcgx5wBC9XvtlP0Hzbzt5bwO1SiZb6lP2f
	 HNqlj7tkMyGgA3qNI3iiKUHNxAZeXaA38o+/ffqVxKYmWXWVbxyv7OR9YRDuBpKPr3
	 vKyTF47Fj4CjzUYYw4fLJtXCmdZftRICoGqW//98YXFGwArwFREWYliCeCQfIBTCHp
	 PkGXv3ydXjc05SeUdf1r2bkwgguR5SNEZMg/roV4FSGfuA7+daia/ykBWPwvGBmxgy
	 Ti72dkJ/Ar6dnJS8rxkABhp9sm65r46ePRDyz1ATdTbvvdId/RAb2TNiE/GDh7wy7N
	 IYq/OWmP1/WeQ==
Content-Type: multipart/mixed; boundary="===============1101494537671284616=="
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
Message-Id: <90202a7fb1a4fd05e2b5dae0d662fcbfeeef483fbe555305eaf15b75aad15a24@mail.kernel.org>
In-Reply-To: <20260225010950.20218-2-adubey@linux.ibm.com>
References: <20260225010950.20218-2-adubey@linux.ibm.com>
Subject: Re: [PATCH 1/4] powerpc64/bpf: Add support for instruction array
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org,hbathini@linux.ibm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,maddy@linux.ibm.com,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 24 Feb 2026 21:01:53 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17134-lists,linuxppc-dev=lfdr.de,bpf-ci];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.kernel.org:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EFCE618C929
X-Rspamd-Action: no action

--===============1101494537671284616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 52162e4a7f84..9c27740650b5 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -318,6 +318,12 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>  		jit_data->hdr = hdr;
>  	}
>
> +	/*
> +	 * The bpf_prog_update_insn_ptrs function expects addrs to
> +	 * point to the first byte of the jitted instruction.
> +	 */
> +	bpf_prog_update_insn_ptrs(fp, addrs, fimage);

Is addrs still valid at this point?  Looking at the code above, in the
final-pass path where (!fp->is_func || extra_pass) is true, addrs has
already been freed:

bpf_int_jit_compile() {
    ...
    if (!fp->is_func || extra_pass) {
        ...
        bpf_prog_fill_jited_linfo(fp, addrs);
out_addrs:
        kfree(addrs);
        kfree(jit_data);
        fp->aux->jit_data = NULL;
    } else {
        jit_data->addrs = addrs;
        ...
        jit_data->hdr = hdr;
    }

    bpf_prog_update_insn_ptrs(fp, addrs, fimage);  /* <-- here */
    ...
}

The kfree(addrs) happens before this call.  The NULL check inside
bpf_prog_update_insn_ptrs() does not catch this because kfree()
does not set the pointer to NULL, so offsets[xlated_off] would read
from freed memory.

The x86 JIT avoids this by placing bpf_prog_update_insn_ptrs() inside
the if (image) block before the addrs are freed:

arch/x86/net/bpf_jit_comp.c:bpf_int_jit_compile() {
    ...
    bpf_prog_update_insn_ptrs(prog, addrs, image);
    ...
    /* addrs freed later */
    kvfree(addrs);
}

Should this call be moved before the out_addrs label, similar to
how x86 does it?

Additionally, for CONFIG_PPC64_ELF_ABI_V1 where FUNCTION_DESCR_SIZE
is 24, the addrs offsets are relative to code_base, not fimage:

    code_base = (u32 *)(image + FUNCTION_DESCR_SIZE);
    fcode_base = (u32 *)(fimage + FUNCTION_DESCR_SIZE);

Would the image argument need to be (fimage + FUNCTION_DESCR_SIZE)
rather than fimage to produce the correct absolute addresses in
insn_array->ips[]?

>  out:
>  	if (bpf_blinded)
>  		bpf_jit_prog_release_other(fp, fp == org_fp ? tmp_fp : org_fp);

---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22368663191

AI-authorship-score: low
AI-authorship-explanation: Standard kernel patch conventions with specific upstream references; no AI-generation indicators.
issues-found: 2
issue-severity-score: high
issue-severity-explanation: Use-after-free on addrs array in normal JIT success path can corrupt insn_array jump targets, leading to crashes or undefined behavior.

--===============1101494537671284616==--

