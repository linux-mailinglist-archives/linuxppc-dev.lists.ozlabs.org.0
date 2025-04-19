Return-Path: <linuxppc-dev+bounces-7809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFAA94309
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Apr 2025 13:07:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zfpk73sKCz2yqw;
	Sat, 19 Apr 2025 21:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745060831;
	cv=none; b=ENu/VVka9P2QPhc2tpMjT+6EMr7yGwfha92MkrXh53EV0qC+LjG1koAr4uLpG0+E+YMLtG8aXWztruZbZdwSA9DOLuy/lklseMZkh92vFstUWSlz4YuanCv8Gy1NGnmPVS9WRWZDbbfmU8AtuXOPh28R5v8Zvu1/GQvPRc40mk9a5yt83RwTyGLNq7664zLDCFDS5gSjAU2ZjZ7iFjUqGZm4VRfyxVxGAE2brX5QjSNJ9zfC6XQT3ZeJ45ZnI2tNkUZbg6Y+zav5PDHuQ2+i55TQ9wwfhjvhwwt0OZ1+avojgfFhUqFOt1E4IVr3x1HTX2EcK+VC4kJHl+SnHpAtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745060831; c=relaxed/relaxed;
	bh=10yi65zQ0DoEv0KNYT/vhKh57OBoiLmLCOWI/9W3v8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCa6fa652iAI2EaQDqwBQyelNXiiq2DyKtZkTF6rHM6aGdQ7bzrMo8JMkplSxRCpZYc0mEOzp/kPA3EAl9sPtI85XpXKvocLX43Cpv9EQpQs/vyDUvgYHTw/tfPmHdDNVCR4U+nQF2Gn9yCfyFw/lPoVajICqE3OFPTbaLEyM3eRMPdNgIOh5jrt6QAF0qVjwH7uJQsHHEWRs3Qy9hSEcSRMTkYZHMdy2YyTuwArRTB5OeA4p6e/nDsbU/uAfarjNEaY6iaPB4JATnoYhn1kMzmPpsGwhw/LWVXWTa/f/9VGH7AHDLTf0sgfw/L8+Gzcrj89cQJiaxAilnjS48B4xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YabAh6e1; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YabAh6e1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zfpk63WvPz2yqW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 21:07:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C35B61137;
	Sat, 19 Apr 2025 11:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884DFC4CEE7;
	Sat, 19 Apr 2025 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745060824;
	bh=DSPAM263iwNs6J7exfjk+BXtsBHZVOZpvJhNDpyAmyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YabAh6e1h9zcx77wIQ1BxgBVBvygWOrUgtb3HYbDgkq0LSnrLYfl0KVxbPQa+rtLn
	 D6Vnotxm2gFI49YQJsZxcFzykAUgegr7YG2H2A5CM/Ax68zbbINK7Mt0aPmVx0mmI2
	 9mfiHaIYFdPO2QTk3zrKicClMO1/dMpHseMebVFXY2FVSuiW0BqVUxHD1kaViO3qt7
	 ci6mmx4YkNWAUiWvFkXz/Ytabi5TU6xzLkAXDZW3pbU34gJn6CRhf4db2r7EcSk9UJ
	 HRT80iXfrVRbVLg6HaDssWpgxgzCX/2ZEuwhnd9HYVfUmy+1RRudDEyA6NQbUE5OPN
	 0quiBMnH9KTYA==
Date: Sat, 19 Apr 2025 16:31:15 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] powerpc64/bpf: fix JIT code size calculation of bpf
 trampoline
Message-ID: <imwcjnoebhice2omsuaakozniph57chxuj2idzbe3dcaqb677l@inx53g65yusp>
References: <20250416194037.204424-1-hbathini@linux.ibm.com>
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
In-Reply-To: <20250416194037.204424-1-hbathini@linux.ibm.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 17, 2025 at 01:10:37AM +0530, Hari Bathini wrote:
> arch_bpf_trampoline_size() provides JIT size of the BPF trampoline
> before the buffer for JIT'ing it is allocated. The total number of
> instructions emitted for BPF trampoline JIT code depends on where
> the final image is located. So, the size arrived at with the dummy
> pass in arch_bpf_trampoline_size() can vary from the actual size
> needed in  arch_prepare_bpf_trampoline().  When the instructions
> accounted in  arch_bpf_trampoline_size() is less than the number of
> instructions emitted during the actual JIT compile of the trampoline,
> the below warning is produced:
> 
>   WARNING: CPU: 8 PID: 204190 at arch/powerpc/net/bpf_jit_comp.c:981 __arch_prepare_bpf_trampoline.isra.0+0xd2c/0xdcc
> 
> which is:
> 
>   /* Make sure the trampoline generation logic doesn't overflow */
>   if (image && WARN_ON_ONCE(&image[ctx->idx] >
>   			(u32 *)rw_image_end - BPF_INSN_SAFETY)) {
> 
> So, during the dummy pass, instead of providing some arbitrary image
> location, account for maximum possible instructions if and when there
> is a dependency with image location for JIT'ing.
> 
> Fixes: d243b62b7bd3 ("powerpc64/bpf: Add support for bpf trampolines")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/6168bfc8-659f-4b5a-a6fb-90a916dde3b3@linux.ibm.com/
> Cc: stable@vger.kernel.org # v6.13+
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> Changes since v1:
> - Pass NULL for image during intial pass and account for max. possible
>   instruction during this pass as Naveen suggested.
> 
> 
>  arch/powerpc/net/bpf_jit.h        | 20 ++++++++++++++++---
>  arch/powerpc/net/bpf_jit_comp.c   | 33 ++++++++++---------------------
>  arch/powerpc/net/bpf_jit_comp64.c |  9 +++++++++
>  3 files changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 6beacaec63d3..4c26912c2e3c 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -51,8 +51,16 @@
>  		EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | (offset & 0xfffc));					\
>  	} while (0)
>  
> -/* Sign-extended 32-bit immediate load */
> +/*
> + * Sign-extended 32-bit immediate load
> + *
> + * If this is a dummy pass (!image), account for
> + * maximum possible instructions.
> + */
>  #define PPC_LI32(d, i)		do {					      \
> +	if (!image)							      \
> +		ctx->idx += 2;						      \
> +	else {								      \
>  		if ((int)(uintptr_t)(i) >= -32768 &&			      \
>  				(int)(uintptr_t)(i) < 32768)		      \
>  			EMIT(PPC_RAW_LI(d, i));				      \
> @@ -60,10 +68,15 @@
>  			EMIT(PPC_RAW_LIS(d, IMM_H(i)));			      \
>  			if (IMM_L(i))					      \
>  				EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));	      \
> -		} } while(0)
> +		}							      \
> +	} } while (0)
>  
>  #ifdef CONFIG_PPC64
> +/* If dummy pass (!image), account for maximum possible instructions */
>  #define PPC_LI64(d, i)		do {					      \
> +	if (!image)							      \
> +		ctx->idx += 5;						      \
> +	else {								      \
>  		if ((long)(i) >= -2147483648 &&				      \
>  				(long)(i) < 2147483648)			      \
>  			PPC_LI32(d, i);					      \
> @@ -84,7 +97,8 @@
>  			if ((uintptr_t)(i) & 0x000000000000ffffULL)	      \
>  				EMIT(PPC_RAW_ORI(d, d, (uintptr_t)(i) &       \
>  							0xffff));             \
> -		} } while (0)
> +		}							      \
> +	} } while (0)

You should now also be able to remove the padding we add in 
bpf_jit_comp64.c for 'case BPF_LD | BPF_IMM | BPF_DW:'

>  #define PPC_LI_ADDR	PPC_LI64
>  
>  #ifndef CONFIG_PPC_KERNEL_PCREL
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 2991bb171a9b..c0684733e9d6 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -504,10 +504,11 @@ static int invoke_bpf_prog(u32 *image, u32 *ro_image, struct codegen_context *ct
>  	EMIT(PPC_RAW_ADDI(_R3, _R1, regs_off));
>  	if (!p->jited)
>  		PPC_LI_ADDR(_R4, (unsigned long)p->insnsi);
> -	if (!create_branch(&branch_insn, (u32 *)&ro_image[ctx->idx], (unsigned long)p->bpf_func,
> -			   BRANCH_SET_LINK)) {
> -		if (image)
> -			image[ctx->idx] = ppc_inst_val(branch_insn);
> +	/* Account for max possible instructions during dummy pass for size calculation */
> +	if (image && !create_branch(&branch_insn, (u32 *)&ro_image[ctx->idx],
> +				    (unsigned long)p->bpf_func,
> +				    BRANCH_SET_LINK)) {
> +		image[ctx->idx] = ppc_inst_val(branch_insn);
>  		ctx->idx++;
>  	} else {
>  		EMIT(PPC_RAW_LL(_R12, _R25, offsetof(struct bpf_prog, bpf_func)));
> @@ -889,7 +890,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>  			bpf_trampoline_restore_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
>  
>  		/* Reserve space to patch branch instruction to skip fexit progs */
> -		im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
> +		if (ro_image) /* image is NULL for dummy pass */
> +			im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
>  		EMIT(PPC_RAW_NOP());
>  	}
>  
> @@ -912,7 +914,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>  		}
>  
>  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
> -		im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
> +		if (ro_image) /* image is NULL for dummy pass */
> +			im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
>  		PPC_LI_ADDR(_R3, im);
>  		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
>  						 (unsigned long)__bpf_tramp_exit);
> @@ -973,25 +976,9 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
>  			     struct bpf_tramp_links *tlinks, void *func_addr)
>  {
>  	struct bpf_tramp_image im;
> -	void *image;
>  	int ret;
>  
> -	/*
> -	 * Allocate a temporary buffer for __arch_prepare_bpf_trampoline().
> -	 * This will NOT cause fragmentation in direct map, as we do not
> -	 * call set_memory_*() on this buffer.
> -	 *
> -	 * We cannot use kvmalloc here, because we need image to be in
> -	 * module memory range.
> -	 */
> -	image = bpf_jit_alloc_exec(PAGE_SIZE);
> -	if (!image)
> -		return -ENOMEM;
> -
> -	ret = __arch_prepare_bpf_trampoline(&im, image, image + PAGE_SIZE, image,
> -					    m, flags, tlinks, func_addr);
> -	bpf_jit_free_exec(image);
> -
> +	ret = __arch_prepare_bpf_trampoline(&im, NULL, NULL, NULL, m, flags, tlinks, func_addr);
>  	return ret;
>  }
>  
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 233703b06d7c..91f9efe8b8d7 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -225,6 +225,15 @@ int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *
>  	}
>  
>  #ifdef CONFIG_PPC_KERNEL_PCREL
> +	/*
> +	 * If fimage is NULL (the initial pass to find image size),
> +	 * account for the maximum no. of instructions possible.
> +	 */
> +	if (!fimage) {
> +		ctx->idx += 7;
> +		return 0;
> +	}
> +

I would merge this with the below if conditional so that this gets 
noticed if the instruction sequence below ever changes.

>  	reladdr = func_addr - local_paca->kernelbase;
>  
>  	if (reladdr < (long)SZ_8G && reladdr >= -(long)SZ_8G) {

Other than that:
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>


- Naveen


