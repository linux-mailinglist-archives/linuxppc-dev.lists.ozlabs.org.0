Return-Path: <linuxppc-dev+bounces-7434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66202A7A743
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Apr 2025 17:50:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZT5m82Kyfz2yrF;
	Fri,  4 Apr 2025 02:50:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743695416;
	cv=none; b=Oonw0Ok1WQHfWPGZlOIbbm7DiJ7DDz6tj91oLPg95I4tY2NpOrOYnAWeq9pjPU/X4mvF1vcCsODqwGNzMBdpPyF0urDa7i5jsaMHeNmrfXZuMWR9EGabpxDSSg5tnwdH2p1DC2C4mSvCge8Yf8ZK0iBz872W7LuC5UIjFlAIz4hMJyUTd3w/fXRrRD8/59eSpChYuoYpSEWfwmAtx2BW9q3kJ3Y9kd72NnVJiEGlF4LZ90XcA98emweFygutOaGKWyKC6Lw50BVvr06GBzznwTaxPzOjmYVe3UvcIehdylNviQSY1cJi2U0gEuXkPnM6qDElaASm8jsqVdHGvLVm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743695416; c=relaxed/relaxed;
	bh=xRowmnXJ4OOI5wVfyx/KAeanpk5N4y1pw84QK1JRmAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nc9UDCqpScXO1NHxqSVpJVDkH3QGtL7jq3P8Kqy9IDtOW65/5qjpIjcrmVoiyd+3lWzpKnmvFLh0vFMhKc+EVflnO12o42M4MEDxk1Lp+ICn4NsPwJL9cd2T9VYzeWkLLEhdM5ugG7uEEsbsd3aF/Nmn72Y1jp8tlvgRygWEj3xYmqusxzUDi5N2aOgy46msK+c0k0gd19kQK/ZApW9d+3v59RiIm2dPjF3wP8JZDbvOKpVo8w9w5Ef9llCFP/TeoT7r9KbPBgVFb6to5Ev5zxpalLhRwshqoHwsy1D50uNXcX+ydejEysEOiiUQrgsHMrLsa8uUTsYNo8yXETHNjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwaNmsnz; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jwaNmsnz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZT5m72Grwz2xxy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 02:50:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67E965C5938;
	Thu,  3 Apr 2025 15:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FE1C4CEE3;
	Thu,  3 Apr 2025 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743695412;
	bh=0AC/e1p1TESoRNde9r7NQRKgzDKVZKdHxSa7/YkMjpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwaNmsnzg6AYpVJSTwVRIQdkmYfrDWwkx+dhF0jhi6H44/LEuybkDj+csuqzunsGQ
	 CnW8XRwpJZpR2bXhMB4WlHtUPBgoZ+y8kH1O+V8nEslAsxiCFZR9AlNMIe1RhJLUuO
	 hn8pOiH22VOSsxmPh0vUmwkk26Lx95Q3KVitoTnAPK0Rx7FgDH3zFXE8/OBIFb5COR
	 OP/HmrtTvfUQS7xe4FH3x06qtpxQPtm7cyz69lpXl7VkJss+nWsFbAhz2lbLB7QUw+
	 cMsPnS99d/qKrlMuAY6C7e4xewgOfeocqTj4XbG2jB3Ed7xdvUhQjiuNArMeTlvH+O
	 5SXxcos+/YfGw==
Date: Thu, 3 Apr 2025 21:15:02 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	stable@vger.kernel.org
Subject: Re: [RESEND PATCH] powerpc64/bpf: fix JIT code size calculation of
 bpf trampoline
Message-ID: <5ufbeu7staczxfhdd3uepqnkzxozlhxus2hfpxiiqllid2l4vs@n63eyfgosatl>
References: <20250326143422.1158383-1-hbathini@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326143422.1158383-1-hbathini@linux.ibm.com>
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Mar 26, 2025 at 08:04:22PM +0530, Hari Bathini wrote:
> The JIT compile of ldimm instructions can be anywhere between 1-5
> instructions long depending on the value being loaded.
> 
> arch_bpf_trampoline_size() provides JIT size of the BPF trampoline
> before the buffer for JIT'ing it is allocated. BPF trampoline JIT
> code has ldimm instructions that need to load the value of pointer
> to struct bpf_tramp_image. But this pointer value is not same while
> calling arch_bpf_trampoline_size() & arch_prepare_bpf_trampoline().
> So, the size arrived at using arch_bpf_trampoline_size() can vary
> from the size needed in arch_prepare_bpf_trampoline(). When the
> number of ldimm instructions emitted in arch_bpf_trampoline_size()
> is less than the number of ldimm instructions emitted during the
> actual JIT compile of trampoline, the below warning is produced:
> 
>   WARNING: CPU: 8 PID: 204190 at arch/powerpc/net/bpf_jit_comp.c:981 __arch_prepare_bpf_trampoline.isra.0+0xd2c/0xdcc
> 
> which is:
> 
>   /* Make sure the trampoline generation logic doesn't overflow */
>   if (image && WARN_ON_ONCE(&image[ctx->idx] >
> 			(u32 *)rw_image_end - BPF_INSN_SAFETY)) {
> 
> Pass NULL as the first argument to __arch_prepare_bpf_trampoline()
> call from arch_bpf_trampoline_size() function, to differentiate it
> from how arch_prepare_bpf_trampoline() calls it and ensure maximum
> possible instructions are emitted in arch_bpf_trampoline_size() for
> ldimm instructions that load a different value during the actual JIT
> compile of BPF trampoline.
> 
> Fixes: d243b62b7bd3 ("powerpc64/bpf: Add support for bpf trampolines")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/6168bfc8-659f-4b5a-a6fb-90a916dde3b3@linux.ibm.com/
> Cc: stable@vger.kernel.org # v6.13+
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> * Removed a redundant '/' accidently added in a comment and resending.
> 
>  arch/powerpc/net/bpf_jit_comp.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 2991bb171a9b..c94717ccb2bd 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -833,7 +833,12 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>  	EMIT(PPC_RAW_STL(_R26, _R1, nvr_off + SZL));
>  
>  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
> -		PPC_LI_ADDR(_R3, (unsigned long)im);
> +		/*
> +		 * Emit maximum possible instructions while getting the size of
> +		 * bpf trampoline to ensure trampoline JIT code doesn't overflow.
> +		 */
> +		PPC_LI_ADDR(_R3, im ? (unsigned long)im :
> +				(unsigned long)(~(1UL << (BITS_PER_LONG - 1))));

We generally rely on  a NULL 'image' to detect a dummy pass. See commit 
d3921cbb6cd6 ("powerpc/bpf: Only pad length-variable code at initial 
pass"), for instance. Have you considered updating PPC_LI64() and 
PPC_LI32() to simply emit a fixed number of nops if image is NULL? 


- Naveen


