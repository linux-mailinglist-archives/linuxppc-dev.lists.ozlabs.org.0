Return-Path: <linuxppc-dev+bounces-15728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3C7D1EB9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 13:25:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drlgp3Y9pz30N8;
	Wed, 14 Jan 2026 23:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768393526;
	cv=none; b=SCJTgdnO9YCE8+vdLQMtLprHAlW5dM8EeXR/5C+U+tsNH62X3HA5eKvn93rq4v+4zQkGVOWWdTnBaYQRuK0kAtrlYFVpbIWBx2iFSpf6Wr4dfQNdCKaa9iaWKlb3oyuuxh3g3dtUc1qG2TPzRd972LUr5p8GmrnPJcd2dyw6bRb0WUMllBxjYUzoOYa9eSWMpRvWreAkMBGNz2DkeuHsu+hgSJZZbtN25OvuWWthgjhdJDhw4kZpEKZA/ilVnhGuY/+PiNW3twGw5aeYAGNilMVivaLeLkdGYTiWYfOkHE/oiSdWEerUEJl6Iqv8vUX98EU0sGQAbm96tYIWzY1btw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768393526; c=relaxed/relaxed;
	bh=MgVMZj/tvdhUeihhqDO6ibLarhli8ucuArgkq8yHb5o=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=RvNhNV03wNlzcOXmwJhjI3ISrVZdiu64rWd7Hme7bn963kUND4H5nrTXo0MTr9I6e4zSVSLqlyke9Far5PUCr2VzpYb5BGYugxCn34YSh+4EtX6yIPTBXKLl3rq8cv1YB7B7o2KxtcaIL2NAjyqlbF5B7vtGxfDFfHk4/hX069yKBqBcNs+CaxCgOwNmbg24tg3plpTevRXJvaAy9R1C2nFqVa79bSqInYp//lQZyCAUX/OyR5m6btk5SzjK7QNP5mpFjLGouOEKw/XHKpVAwTJw4JbtUxlkNvmq3JZ7768h1uL1mEsQq0uAyZvp4kpr+7W3ntheUBdp40uHkBzXAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RzW9sO8/; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RzW9sO8/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drlgn4VbFz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 23:25:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C671440E4;
	Wed, 14 Jan 2026 12:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC749C4CEF7;
	Wed, 14 Jan 2026 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768393520;
	bh=28BXad19nCnp3Ql2evEZsEz6QgTpTejqit7mcwOnXto=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=RzW9sO8/lwBrOZ77Ow2EnrDxEEgjR2TVcUuODk+4bvyBnZp+621TosZfCBu+jP0VH
	 x9ve9MAlCtx7EY5Azgt/Q7C/nNL6fcIxxyPsSJYnYItVcwBZ/m3MpLx+gkIiW27PpZ
	 ryw/0QsCDz3MuCX/iZlPzPNFZjui6hfCE5K9dEWg5bym+bsSFM+PVGmhgfZtnvqCkr
	 R8yPQBAFCHQfaVx6OnZ1+azLsvl6b4m1spahLWbCckvme7mZSxJ6ff2PU2/Xsn+p17
	 HHMghCVsWQRBn2n3RpxY6jjCoSnEGgXB5MRmFg8xDH50GQfdyWaWpKNcN+eRbL0/kf
	 88KkDRIvaea8w==
Content-Type: multipart/mixed; boundary="===============3401074341333993029=="
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
Message-Id: <0a6a90935a20db665f17f61d645d5aa03d8bbf1cb0763c7738b04a7af77b1729@mail.kernel.org>
In-Reply-To: <20260114114450.30405-4-adubey@linux.ibm.com>
References: <20260114114450.30405-4-adubey@linux.ibm.com>
Subject: Re: [PATCH v2 3/6] powerpc64/bpf: Tailcall handling with trampolines
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,mykolal@fb.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,naveen@kernel.org,maddy@linux.ibm.com,mpe@ellerman.id.au,npiggin@gmail.com,memxor@gmail.com,iii@linux.ibm.com,shuah@kernel.org,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 14 Jan 2026 12:25:19 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--===============3401074341333993029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 069a8822c30d..e3088cf089d1 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c

[ ... ]

> +static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_context *ctx,
> +					       int func_frame_offset,
> +					       int bpf_dummy_frame_size, int r4_off)
> +{
> +	if (IS_ENABLED(CONFIG_PPC64)) {
> +		/* See bpf_jit_stack_tailcallinfo_offset() */
> +		int tailcallinfo_offset = BPF_PPC_TAILCALL;
> +		/*
> +		 * func_frame_offset =                                   ...(1)
> +		 *     bpf_dummy_frame_size + trampoline_frame_size
> +		 */
> +		EMIT(PPC_RAW_LD(_R4, _R1, func_frame_offset));
> +		EMIT(PPC_RAW_LD(_R3, _R4, -tailcallinfo_offset));
                              ^^^^

Should this LD instruction be an ADDI instead? Looking at the stack frame
setup, after the two STLU instructions in __arch_prepare_bpf_trampoline():

  STLU _R1, _R1, -bpf_dummy_frame_size  ->  stores original _R1 at dummy frame
  STLU _R1, _R1, -bpf_frame_size        ->  stores dummy frame ptr at tramp frame

From the trampoline frame, the back chain stored in the dummy frame at offset
bpf_frame_size points to the caller's frame. But func_frame_offset equals
(bpf_dummy_frame_size + bpf_frame_size), which points into the caller's frame
itself. Loading from that address returns the caller's back chain (pointing
to the grandparent frame), not a pointer to the caller's frame.

This appears to cause the subsequent load at [_R4 - 8] to read the grandparent's
tail_call_info rather than the caller's. Would loading from [_R1 + bpf_frame_size]
give the correct pointer to the caller's frame?

For comparison, the subprogram prologue in bpf_jit_build_prologue() uses
[_R1 + 0] to get the back chain pointing to its caller, which seems like
the right pattern.

> +
> +		/*
> +		 * Setting the tail_call_info in trampoline's frame
> +		 * depending on if previous frame had value or reference.
> +		 */
> +		EMIT(PPC_RAW_CMPLWI(_R3, MAX_TAIL_CALL_CNT));
> +		PPC_COND_BRANCH(COND_GT, CTX_NIA(ctx) + 8);
> +		EMIT(PPC_RAW_ADDI(_R3, _R4, bpf_jit_stack_tailcallinfo_offset(ctx)));

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20993216190

--===============3401074341333993029==--

