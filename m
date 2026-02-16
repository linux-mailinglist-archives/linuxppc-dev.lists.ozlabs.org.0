Return-Path: <linuxppc-dev+bounces-16874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AidDKnHkmm6xgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 08:30:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 886CB14142D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 08:30:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDvZY03bGz2ySS;
	Mon, 16 Feb 2026 18:30:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771227044;
	cv=none; b=XJ3v6BRepQqhrBQ0BQ6tWBdh53d2EflEDbDc5wpF6dunPbyJrKpb/VUCekUPQkrTybMd52qaQxgaB3mg0vARtQWyjeONp4QbpeW2CcZfLeqmGd5ALbisTHSUjZ2TPpJQ2SyTX5FFTvnBLnd2AnfdKobqpVXxdIBbN7rqYi8BjUrH4Q0gF00EtyVeqsvN5nIr6i7wvJowCV6JEDk36CV3P2uFK4OWxFk1tjdP6Xhfbs4QAHaGdhPwmH5e9a7WalbaP3h75GGz7/ivKVGQKUzJru73UH+jg+RS2Q+XtkZpnaD1F/JCummG24Ryqcgo3bonzgDWrxSlerQu/DnTRlUm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771227044; c=relaxed/relaxed;
	bh=0T873KUv57qF5qW2FkIjWfwyjSZeCPGzK1ZQ81PfAB8=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=LNQoLlOW1X8dDDpzAz9S4okkb5nrYLs/u9T4BKply1y8LQZ+XbbskWp/DS3xx+l1LRsdyQhsBtyC5myQiOsHfRef7PFt0VvuAnnJah8NxldaVQMVrmcjKw9fr//U4r90FQTMnFwVF4c5xFQjrk5uQSW7n3XY4q9Pv9AcVX7yjBYy/smxZHNvYdy/IRcYjKFZwf7Zz8RWlKN/wzk4uyuQ3KXkChuQ2OgG3FrDaGSPuyFEiH0y7iGfX08UcdqmByYi56GwgmBzHWQlxoYapkRDQH6d+KuHI6hvO6g+4k6E0xW9lLfExHpLtJ/R9ry++8BTS4CiOtoTG8bHKJsDIajbzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NWIZpJH4; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NWIZpJH4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDvZW3f9Bz2xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 18:30:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAAD5600B0;
	Mon, 16 Feb 2026 07:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE94C116C6;
	Mon, 16 Feb 2026 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771227035;
	bh=13Mqke7gIK4lAxiakC91RfJyqVunfetraO5/cIOFkcQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=NWIZpJH4lATV01d4Uxh3yaYFbwui2ZKa7AJKr5L3g1RyF5ipO+va18T47sJOdIeXJ
	 FZq/Zbn6dZvlSssZX+aOhq8pRjUuTbrpwDPugQTCbL883IMjxN/jcModmulu6RSEI7
	 ZTS3n/b71GcDobqQMRdpUoLU3Cn0Vc4ONExieHcqAcJehlOBjlJm8pS6LGxBdoQE7E
	 hKiVljmYsErWULoK++4odeFRnCEC0J7zU2I9jgarA0iQzaYQ9NfwI4t7g7dQTxRHmi
	 1jGBTv3p+s8r6zBpVDWfFyt+5910mrqthOAb79bH+M4Kakmmm//cOT90fTx/tgGcVa
	 RRqQJENNFfZ1g==
Content-Type: multipart/mixed; boundary="===============2651187141770340201=="
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
Message-Id: <36f23ae77c2dd15ad313d3103b53daa229750e06b32aaf09f2a965dfb034313c@mail.kernel.org>
In-Reply-To: <20260216065639.1750181-4-hbathini@linux.ibm.com>
References: <20260216065639.1750181-4-hbathini@linux.ibm.com>
Subject: Re: [PATCH 3/5] powerpc64/bpf: use consistent tailcall offset in trampoline
From: bot+bpf-ci@kernel.org
To: hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,skb99@linux.ibm.com,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 16 Feb 2026 07:30:35 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16874-lists,linuxppc-dev=lfdr.de,bpf-ci];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,iogearbox.net,linux.ibm.com,gmail.com,linux.dev,meta.com];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:adubey@linux.ibm.com,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 886CB14142D
X-Rspamd-Action: no action

--===============2651187141770340201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> powerpc64/bpf: use consistent tailcall offset in trampoline
>
> Ideally, the offset used to load the tail call info field and to find
> the pass by reference address for tail call field should be the same.
> But while setting up the tail call info in the trampoline, this was
> not followed. This can be misleading and can lead to unpredicable

This isn't a bug, but "unpredicable" should be "unpredictable".

> results if and when bpf_has_stack_frame() ends up returning true
> for trampoline frame.

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c

[ ... ]

> @@ -658,7 +656,7 @@ static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_context *ctx,
>  		 */
>  		EMIT(PPC_RAW_CMPLWI(_R3, MAX_TAIL_CALL_CNT));
>  		PPC_BCC_CONST_SHORT(COND_GT, 8);
> -		EMIT(PPC_RAW_ADDI(_R3, _R4, bpf_jit_stack_tailcallinfo_offset(ctx)));
> +		EMIT(PPC_RAW_ADDI(_R3, _R4, -BPF_PPC_TAILCALL));
>  		/*
>  		 * From ...(1) above:
>  		 * trampoline_frame_bottom =                            ...(2)
>  		 *      func_frame_offset - bpf_dummy_frame_size
>  		 *
>  		 * Using ...(2) derived above:
>  		 * trampoline_tail_call_info_offset =                  ...(3)
>  		 *      trampoline_frame_bottom - tailcallinfo_offset

The comment still references "tailcallinfo_offset" but the local
variable by that name was removed in this patch. Should this say
"BPF_PPC_TAILCALL" instead?

>  		 *
>  		 * From ...(3):
>  		 * Use trampoline_tail_call_info_offset to write reference of main's
>  		 * tail_call_info in trampoline frame.
>  		 */
>  		EMIT(PPC_RAW_STL(_R3, _R1, (func_frame_offset - bpf_dummy_frame_size)
> -								- tailcallinfo_offset));
> +								- BPF_PPC_TAILCALL));


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22053464899

AI-authorship-score: low
AI-authorship-explanation: The patch follows standard kernel conventions with a human-like typo in the commit message, and addresses a specific powerpc BPF JIT implementation detail consistent with the author's domain expertise.
issues-found: 2
issue-severity-score: low
issue-severity-explanation: Two minor issues found: a stale comment referencing a removed local variable, and a spelling error in the commit message. Neither affects code correctness or runtime behavior.

--===============2651187141770340201==--

