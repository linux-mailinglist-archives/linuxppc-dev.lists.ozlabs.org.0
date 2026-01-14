Return-Path: <linuxppc-dev+bounces-15727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1DD1EB97
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 13:25:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drlgl62b7z2xMt;
	Wed, 14 Jan 2026 23:25:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768393523;
	cv=none; b=HLH8Qt5bKtMcvKHdq3qG1zWtomPies7L3DwsZv6MYjHP+7Th80m5OhFvYUa+nFxzJQqlK1Lg3VXgWgGEOudGDJfmftmDqZdlxO9x8vzONosKbgktcpJlG5hdZOkhaTAzITjkFrFoyZbh6j/A0EBF84c3UGm2gY5nBUPveMwANIv/EUilKUpfrcYzwIJA9gZNLXiff+/ba3F85vNGwdmFDMrZNAeyG3Hyx5xq0yazvkWPwCBrRz/539JqNZc6fYCb+ENhMYBdjF21jswzGe5UxNRohHNQP9YKk57AvebkTGFIRrRTePd8n1Pka1OBwqqPOm/cLtYUs7wfLiTmF4dfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768393523; c=relaxed/relaxed;
	bh=jPJwAYG636CLk0laXnGWBgZoZ4cN9M8qVblQmoWqX2I=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=Ox3c0JIgruyuMR/8ZhcSjJmeibs+RC2nCaHQQn0tCa0gOFKZcqmesUFwhutslpMohaay27ZFHOdCF03C93oC8wcHAcNtxjabE/XPG++bu7t6EbSwd0zqH0BYxEZsm7ziIwlLKN4Mx7nisjN/ClMiwwCZN6xkYto9nc9I3lzMtoJpVZL5HG6xx9Bdpj2Mkz+Cn9zH6f+4R+wbXecVwBms74z+iZC/HXkLYkZAq6KvHnr9WB+araKlDILGYOqkzh99j/ebMXKyStb29/bOSqaCwcHHzmr8BsHiUVXsZ2U77U8TkTlsR5y9XWhDtO48jRr3VKCJI84iG2Lz5eJ28OrfwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BTGnJs3t; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BTGnJs3t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drlgk69l9z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 23:25:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF7C8600AA;
	Wed, 14 Jan 2026 12:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059F8C4CEF7;
	Wed, 14 Jan 2026 12:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768393518;
	bh=QxoiBpLx6OZiyhYHiapNZwXCTki0kD1H0U4PXDfMYEM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=BTGnJs3tef9v610pM4uVaHIhxTH5VIDn76eDjF4v1eCSUl1IJ6vdvzhhYK9fPQe0k
	 lKyzbtESgNYvVN6hSeEHO6ItdQ8vjnwVvIzbcraevbMJHm5Hhn3VRl5qtSQU5Gu2V/
	 4rchIVofcJQxjty+VX/prLA3Itc4wtmz7Mn8lJ5E0Y5p82qLmimHleev7qkSoAssZx
	 HZcwnmO1ivtFs1fDbES/MstSO5uPDhlRDNRsPhgXS9Ep2zogyUChbFH2S0Q2Q++rRV
	 KnkaOcFrCyqG1Pj7n6Avqdy1wFFdUe1aaK3s0jXdgWfywdYNBEZBrMkCQBPQV0FJry
	 X2wY/sElKZF0w==
Content-Type: multipart/mixed; boundary="===============3352543397498476185=="
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
Message-Id: <7f1767f79eaba1fc1581a544da924ebcbd3f9ee253a092fa4b6c8415212be04d@mail.kernel.org>
In-Reply-To: <20260114114450.30405-2-adubey@linux.ibm.com>
References: <20260114114450.30405-2-adubey@linux.ibm.com>
Subject: Re: [PATCH v2 1/6] powerpc64/bpf: Move tail_call_cnt to bottom of stack frame
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,mykolal@fb.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,naveen@kernel.org,maddy@linux.ibm.com,mpe@ellerman.id.au,npiggin@gmail.com,memxor@gmail.com,iii@linux.ibm.com,shuah@kernel.org,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 14 Jan 2026 12:25:18 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--===============3352543397498476185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 8334cd667bba..45d419c0ee73 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h

[ ... ]

> +/* for tailcall counter */
> +#define BPF_PPC_TAILCALL        8

This new constant defines tail_call_cnt offset as 8 bytes from prev sp.

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 1fe37128c876..39061cd742c1 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c

[ ... ]

> static int bpf_jit_stack_tailcallcnt(struct codegen_context *ctx)
> {
>-	return bpf_jit_stack_local(ctx) + 24;
>+	return bpf_jit_stack_local(ctx) + BPF_PPC_STACK_LOCALS + BPF_PPC_STACK_SAVE;
> }

The tail_call_cnt offset changes from +24 to +72 (24 + 48) relative to
bpf_jit_stack_local().

There appears to be an inconsistency with the trampoline code in
bpf_jit_comp.c. The function bpf_trampoline_setup_tail_call_cnt() and
bpf_trampoline_restore_tail_call_cnt() use a hardcoded offset:

    int tailcallcnt_offset = 7 * 8;  /* = 56 */

The comment says "See bpf_jit_stack_tailcallcnt()" but after this patch,
bpf_jit_stack_tailcallcnt() returns an offset that corresponds to 8 bytes
from prev sp (BPF_PPC_TAILCALL), not 56 bytes. When BPF_TRAMP_F_TAIL_CALL_CTX
is set, will the trampoline read/write to the wrong stack location?

Note: This appears to be fixed later in the same series by commit 6889ec3d3e10
("powerpc64/bpf: Tailcall handling with trampolines") which updates the
trampoline code to use BPF_PPC_TAILCALL instead of the hardcoded 7 * 8.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20993216190

--===============3352543397498476185==--

