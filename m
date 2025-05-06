Return-Path: <linuxppc-dev+bounces-8352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3533BAACAB4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 18:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsNq94jYGz2yxN;
	Wed,  7 May 2025 02:18:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.183
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746548293;
	cv=none; b=FIoZSXfRZYIZWgBflKXFSXivrhf1BUc089nHfq7Z01KFf1GjDfthb7aH9vw9grYTg65wuG8JKAysMvT4ZQy2zbGzeZA0RzINjuQ/Wly6E2zLNQj4iHKUxrzme4dte5Cs3SnwcqJ6pIxKQyqQ8xc6YDvvE64LjovTUMMfUzYsK2VDyneVxN2wN0IiqrBx2IwlZjf2UgdFG1PDUEHc3kZ++QnC6HJPe2dWqtatp81NXN01XEW4W1yRhPJ0G6C46+Y8UUd2VB6edTxTN/EVB9DpwSPofcXgEoQE5eHCOVnHrgbm+kI3Q0Ef8SAR0JNZzOJlNXIOiKT/CZk8uukdpaE4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746548293; c=relaxed/relaxed;
	bh=1qV/IPlLf+BQXk3s3aUJYGUbCjNNVwfejI7BFNd+3Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5bYYJqoqqI1CKZfsIJrPrPNCbgMAfKl2/nXMmmEYkGjjq5uNEg2HoOQf+5czDwUalEkmlCC/1R3yXPY/AJUQMjWWg8EcR6GVDgTHPRp+B9kXQRPFUI8D8uymf/Bi/kKckL432DT47q+puBjOxVPe/AkYEfylYNBZT3B7aHS6KGp0Y+d93TcVzXRWrVXJ7WwRbxVE6NeUMc81/6d3rop6s4nxS2gAEabr/ZsE/dNsTiUnMTjg14ypkfCUNTzllVj81Q3SR/rhzi9pcUCTJjRO3VHhVHNCjlRQBmzqYKcqcI7s9sL2jrcLT5disFSq4sIgVI2Nn48dQ0ImRWYVHcUnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YlaIEmYc; dkim-atps=neutral; spf=pass (client-ip=91.218.175.183; helo=out-183.mta0.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YlaIEmYc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.183; helo=out-183.mta0.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 482 seconds by postgrey-1.37 at boromir; Wed, 07 May 2025 02:18:07 AEST
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsNq309nDz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 02:18:06 +1000 (AEST)
Date: Tue, 6 May 2025 12:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746547778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1qV/IPlLf+BQXk3s3aUJYGUbCjNNVwfejI7BFNd+3Vs=;
	b=YlaIEmYcSk8/PtTZxOwSrASaGbeeFRKtKaqoo9uklVz9vZUZ0nphk85+skj3EGC/oW2MSf
	B0wby04uDVFsabRmx3EIeYTk+kzN8rDcgvIJPlvBQ9pipOuoa0QX5LmxWDQDRZsNgwOJ2k
	+4UalaQjK1fpKNMt1W+Ht6eGmkQb26U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-bcachefs@vger.kernel.org, 
	"Jason A . Donenfeld " <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH 1/4] crypto: lib/chacha - strongly type the ChaCha state
Message-ID: <d7de6jsfyihgc5ov3uxrttaf62lup7wykausezzpjznsqcbry5@mic43xrkngjy>
References: <20250505181824.647138-1-ebiggers@kernel.org>
 <20250505181824.647138-2-ebiggers@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505181824.647138-2-ebiggers@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 05, 2025 at 11:18:21AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The ChaCha state matrix is 16 32-bit words.  Currently it is represented
> in the code as a raw u32 array, or even just a pointer to u32.  This
> weak typing is error-prone.  Instead, introduce struct chacha_state:
> 
>     struct chacha_state {
>             u32 x[16];
>     };
> 
> Convert all ChaCha and HChaCha functions to use struct chacha_state.
> No functional changes.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Kent Overstreet <kent.overstreet@linux.dev>

> ---
>  arch/arm/lib/crypto/chacha-glue.c             | 30 +++++----
>  arch/arm/lib/crypto/chacha-scalar-core.S      |  5 +-
>  arch/arm64/lib/crypto/chacha-neon-glue.c      | 23 ++++---
>  arch/mips/lib/crypto/chacha-glue.c            |  6 +-
>  arch/powerpc/lib/crypto/chacha-p10-glue.c     | 15 +++--
>  arch/powerpc/lib/crypto/chacha-p10le-8x.S     |  6 +-
>  arch/riscv/lib/crypto/chacha-riscv64-glue.c   |  8 +--
>  arch/riscv/lib/crypto/chacha-riscv64-zvkb.S   | 10 +--
>  arch/s390/lib/crypto/chacha-glue.c            | 11 ++--
>  arch/x86/lib/crypto/chacha_glue.c             | 58 ++++++++++-------
>  crypto/chacha.c                               | 16 ++---
>  drivers/char/random.c                         | 41 ++++++------
>  fs/bcachefs/checksum.c                        | 18 ++---
>  include/crypto/chacha.h                       | 65 +++++++++++--------
>  lib/crypto/chacha.c                           | 35 +++++-----
>  lib/crypto/chacha20poly1305-selftest.c        |  8 +--
>  lib/crypto/chacha20poly1305.c                 | 51 ++++++++-------
>  lib/crypto/libchacha.c                        |  2 +-
>  .../crypto/chacha20-s390/test-cipher.c        | 10 +--
>  19 files changed, 228 insertions(+), 190 deletions(-)
> 
> diff --git a/arch/arm/lib/crypto/chacha-glue.c b/arch/arm/lib/crypto/chacha-glue.c
> index 1e28736834a0..0c2b4c62d484 100644
> --- a/arch/arm/lib/crypto/chacha-glue.c
> +++ b/arch/arm/lib/crypto/chacha-glue.c
> @@ -15,28 +15,31 @@
>  #include <asm/cputype.h>
>  #include <asm/hwcap.h>
>  #include <asm/neon.h>
>  #include <asm/simd.h>
>  
> -asmlinkage void chacha_block_xor_neon(const u32 *state, u8 *dst, const u8 *src,
> -				      int nrounds);
> -asmlinkage void chacha_4block_xor_neon(const u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
> +				      u8 *dst, const u8 *src, int nrounds);
> +asmlinkage void chacha_4block_xor_neon(const struct chacha_state *state,
> +				       u8 *dst, const u8 *src,
>  				       int nrounds, unsigned int nbytes);
> -asmlinkage void hchacha_block_arm(const u32 *state, u32 *out, int nrounds);
> -asmlinkage void hchacha_block_neon(const u32 *state, u32 *out, int nrounds);
> +asmlinkage void hchacha_block_arm(const struct chacha_state *state,
> +				  u32 *out, int nrounds);
> +asmlinkage void hchacha_block_neon(const struct chacha_state *state,
> +				   u32 *out, int nrounds);
>  
>  asmlinkage void chacha_doarm(u8 *dst, const u8 *src, unsigned int bytes,
> -			     const u32 *state, int nrounds);
> +			     const struct chacha_state *state, int nrounds);
>  
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(use_neon);
>  
>  static inline bool neon_usable(void)
>  {
>  	return static_branch_likely(&use_neon) && crypto_simd_usable();
>  }
>  
> -static void chacha_doneon(u32 *state, u8 *dst, const u8 *src,
> +static void chacha_doneon(struct chacha_state *state, u8 *dst, const u8 *src,
>  			  unsigned int bytes, int nrounds)
>  {
>  	u8 buf[CHACHA_BLOCK_SIZE];
>  
>  	while (bytes > CHACHA_BLOCK_SIZE) {
> @@ -44,26 +47,27 @@ static void chacha_doneon(u32 *state, u8 *dst, const u8 *src,
>  
>  		chacha_4block_xor_neon(state, dst, src, nrounds, l);
>  		bytes -= l;
>  		src += l;
>  		dst += l;
> -		state[12] += DIV_ROUND_UP(l, CHACHA_BLOCK_SIZE);
> +		state->x[12] += DIV_ROUND_UP(l, CHACHA_BLOCK_SIZE);
>  	}
>  	if (bytes) {
>  		const u8 *s = src;
>  		u8 *d = dst;
>  
>  		if (bytes != CHACHA_BLOCK_SIZE)
>  			s = d = memcpy(buf, src, bytes);
>  		chacha_block_xor_neon(state, d, s, nrounds);
>  		if (d != dst)
>  			memcpy(dst, buf, bytes);
> -		state[12]++;
> +		state->x[12]++;
>  	}
>  }
>  
> -void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
> +void hchacha_block_arch(const struct chacha_state *state, u32 *stream,
> +			int nrounds)
>  {
>  	if (!IS_ENABLED(CONFIG_KERNEL_MODE_NEON) || !neon_usable()) {
>  		hchacha_block_arm(state, stream, nrounds);
>  	} else {
>  		kernel_neon_begin();
> @@ -71,17 +75,17 @@ void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
>  		kernel_neon_end();
>  	}
>  }
>  EXPORT_SYMBOL(hchacha_block_arch);
>  
> -void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
> -		       int nrounds)
> +void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
> +		       unsigned int bytes, int nrounds)
>  {
>  	if (!IS_ENABLED(CONFIG_KERNEL_MODE_NEON) || !neon_usable() ||
>  	    bytes <= CHACHA_BLOCK_SIZE) {
>  		chacha_doarm(dst, src, bytes, state, nrounds);
> -		state[12] += DIV_ROUND_UP(bytes, CHACHA_BLOCK_SIZE);
> +		state->x[12] += DIV_ROUND_UP(bytes, CHACHA_BLOCK_SIZE);
>  		return;
>  	}
>  
>  	do {
>  		unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
> diff --git a/arch/arm/lib/crypto/chacha-scalar-core.S b/arch/arm/lib/crypto/chacha-scalar-core.S
> index 083fe1ab96d0..d20b5de755cc 100644
> --- a/arch/arm/lib/crypto/chacha-scalar-core.S
> +++ b/arch/arm/lib/crypto/chacha-scalar-core.S
> @@ -365,11 +365,11 @@
>  .Ldone\@:
>  .endm	// _chacha
>  
>  /*
>   * void chacha_doarm(u8 *dst, const u8 *src, unsigned int bytes,
> - *		     const u32 *state, int nrounds);
> + *		     const struct chacha_state *state, int nrounds);
>   */
>  ENTRY(chacha_doarm)
>  	cmp		r2, #0			// len == 0?
>  	reteq		lr
>  
> @@ -405,11 +405,12 @@ ENTRY(chacha_doarm)
>  1:	_chacha		12
>  	b		0b
>  ENDPROC(chacha_doarm)
>  
>  /*
> - * void hchacha_block_arm(const u32 state[16], u32 out[8], int nrounds);
> + * void hchacha_block_arm(const struct chacha_state *state,
> + *			  u32 out[8], int nrounds);
>   */
>  ENTRY(hchacha_block_arm)
>  	push		{r1,r4-r11,lr}
>  
>  	cmp		r2, #12			// ChaCha12 ?
> diff --git a/arch/arm64/lib/crypto/chacha-neon-glue.c b/arch/arm64/lib/crypto/chacha-neon-glue.c
> index 2b0de97a6daf..7b451b3c7240 100644
> --- a/arch/arm64/lib/crypto/chacha-neon-glue.c
> +++ b/arch/arm64/lib/crypto/chacha-neon-glue.c
> @@ -26,19 +26,21 @@
>  
>  #include <asm/hwcap.h>
>  #include <asm/neon.h>
>  #include <asm/simd.h>
>  
> -asmlinkage void chacha_block_xor_neon(u32 *state, u8 *dst, const u8 *src,
> -				      int nrounds);
> -asmlinkage void chacha_4block_xor_neon(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
> +				      u8 *dst, const u8 *src, int nrounds);
> +asmlinkage void chacha_4block_xor_neon(const struct chacha_state *state,
> +				       u8 *dst, const u8 *src,
>  				       int nrounds, int bytes);
> -asmlinkage void hchacha_block_neon(const u32 *state, u32 *out, int nrounds);
> +asmlinkage void hchacha_block_neon(const struct chacha_state *state,
> +				   u32 *out, int nrounds);
>  
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
>  
> -static void chacha_doneon(u32 *state, u8 *dst, const u8 *src,
> +static void chacha_doneon(struct chacha_state *state, u8 *dst, const u8 *src,
>  			  int bytes, int nrounds)
>  {
>  	while (bytes > 0) {
>  		int l = min(bytes, CHACHA_BLOCK_SIZE * 5);
>  
> @@ -46,22 +48,23 @@ static void chacha_doneon(u32 *state, u8 *dst, const u8 *src,
>  			u8 buf[CHACHA_BLOCK_SIZE];
>  
>  			memcpy(buf, src, l);
>  			chacha_block_xor_neon(state, buf, buf, nrounds);
>  			memcpy(dst, buf, l);
> -			state[12] += 1;
> +			state->x[12] += 1;
>  			break;
>  		}
>  		chacha_4block_xor_neon(state, dst, src, nrounds, l);
>  		bytes -= l;
>  		src += l;
>  		dst += l;
> -		state[12] += DIV_ROUND_UP(l, CHACHA_BLOCK_SIZE);
> +		state->x[12] += DIV_ROUND_UP(l, CHACHA_BLOCK_SIZE);
>  	}
>  }
>  
> -void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
> +void hchacha_block_arch(const struct chacha_state *state, u32 *stream,
> +			int nrounds)
>  {
>  	if (!static_branch_likely(&have_neon) || !crypto_simd_usable()) {
>  		hchacha_block_generic(state, stream, nrounds);
>  	} else {
>  		kernel_neon_begin();
> @@ -69,12 +72,12 @@ void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
>  		kernel_neon_end();
>  	}
>  }
>  EXPORT_SYMBOL(hchacha_block_arch);
>  
> -void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
> -		       int nrounds)
> +void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
> +		       unsigned int bytes, int nrounds)
>  {
>  	if (!static_branch_likely(&have_neon) || bytes <= CHACHA_BLOCK_SIZE ||
>  	    !crypto_simd_usable())
>  		return chacha_crypt_generic(state, dst, src, bytes, nrounds);
>  
> diff --git a/arch/mips/lib/crypto/chacha-glue.c b/arch/mips/lib/crypto/chacha-glue.c
> index 334ecb29fb8f..75df4040cded 100644
> --- a/arch/mips/lib/crypto/chacha-glue.c
> +++ b/arch/mips/lib/crypto/chacha-glue.c
> @@ -7,15 +7,17 @@
>  
>  #include <crypto/chacha.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  
> -asmlinkage void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_crypt_arch(struct chacha_state *state,
> +				  u8 *dst, const u8 *src,
>  				  unsigned int bytes, int nrounds);
>  EXPORT_SYMBOL(chacha_crypt_arch);
>  
> -asmlinkage void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds);
> +asmlinkage void hchacha_block_arch(const struct chacha_state *state,
> +				   u32 *stream, int nrounds);
>  EXPORT_SYMBOL(hchacha_block_arch);
>  
>  bool chacha_is_arch_optimized(void)
>  {
>  	return true;
> diff --git a/arch/powerpc/lib/crypto/chacha-p10-glue.c b/arch/powerpc/lib/crypto/chacha-p10-glue.c
> index 51daeaf5d26e..a6e6a8da1b8b 100644
> --- a/arch/powerpc/lib/crypto/chacha-p10-glue.c
> +++ b/arch/powerpc/lib/crypto/chacha-p10-glue.c
> @@ -12,12 +12,12 @@
>  #include <linux/cpufeature.h>
>  #include <linux/sizes.h>
>  #include <asm/simd.h>
>  #include <asm/switch_to.h>
>  
> -asmlinkage void chacha_p10le_8x(u32 *state, u8 *dst, const u8 *src,
> -				unsigned int len, int nrounds);
> +asmlinkage void chacha_p10le_8x(const struct chacha_state *state, u8 *dst,
> +				const u8 *src, unsigned int len, int nrounds);
>  
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
>  
>  static void vsx_begin(void)
>  {
> @@ -29,35 +29,36 @@ static void vsx_end(void)
>  {
>  	disable_kernel_vsx();
>  	preempt_enable();
>  }
>  
> -static void chacha_p10_do_8x(u32 *state, u8 *dst, const u8 *src,
> +static void chacha_p10_do_8x(struct chacha_state *state, u8 *dst, const u8 *src,
>  			     unsigned int bytes, int nrounds)
>  {
>  	unsigned int l = bytes & ~0x0FF;
>  
>  	if (l > 0) {
>  		chacha_p10le_8x(state, dst, src, l, nrounds);
>  		bytes -= l;
>  		src += l;
>  		dst += l;
> -		state[12] += l / CHACHA_BLOCK_SIZE;
> +		state->x[12] += l / CHACHA_BLOCK_SIZE;
>  	}
>  
>  	if (bytes > 0)
>  		chacha_crypt_generic(state, dst, src, bytes, nrounds);
>  }
>  
> -void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
> +void hchacha_block_arch(const struct chacha_state *state,
> +			u32 *stream, int nrounds)
>  {
>  	hchacha_block_generic(state, stream, nrounds);
>  }
>  EXPORT_SYMBOL(hchacha_block_arch);
>  
> -void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
> -		       int nrounds)
> +void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
> +		       unsigned int bytes, int nrounds)
>  {
>  	if (!static_branch_likely(&have_p10) || bytes <= CHACHA_BLOCK_SIZE ||
>  	    !crypto_simd_usable())
>  		return chacha_crypt_generic(state, dst, src, bytes, nrounds);
>  
> diff --git a/arch/powerpc/lib/crypto/chacha-p10le-8x.S b/arch/powerpc/lib/crypto/chacha-p10le-8x.S
> index 17bedb66b822..b29562bd5d40 100644
> --- a/arch/powerpc/lib/crypto/chacha-p10le-8x.S
> +++ b/arch/powerpc/lib/crypto/chacha-p10le-8x.S
> @@ -5,13 +5,10 @@
>  # Copyright 2023- IBM Corp. All rights reserved
>  #
>  #===================================================================================
>  # Written by Danny Tsen <dtsen@us.ibm.com>
>  #
> -# chacha_p10le_8x(u32 *state, byte *dst, const byte *src,
> -#				 size_t len, int nrounds);
> -#
>  # do rounds,  8 quarter rounds
>  # 1.  a += b; d ^= a; d <<<= 16;
>  # 2.  c += d; b ^= c; b <<<= 12;
>  # 3.  a += b; d ^= a; d <<<= 8;
>  # 4.  c += d; b ^= c; b <<<= 7
> @@ -573,11 +570,12 @@
>  	stxvw4x \S+47, 31, 16
>  
>  .endm
>  
>  #
> -# chacha20_p10le_8x(u32 *state, byte *dst, const byte *src, size_t len, int nrounds);
> +# void chacha_p10le_8x(const struct chacha_state *state, u8 *dst, const u8 *src,
> +#		       unsigned int len, int nrounds);
>  #
>  SYM_FUNC_START(chacha_p10le_8x)
>  .align 5
>  	cmpdi	6, 0
>  	ble	Out_no_chacha
> diff --git a/arch/riscv/lib/crypto/chacha-riscv64-glue.c b/arch/riscv/lib/crypto/chacha-riscv64-glue.c
> index 1740e1ca3a94..57541621981e 100644
> --- a/arch/riscv/lib/crypto/chacha-riscv64-glue.c
> +++ b/arch/riscv/lib/crypto/chacha-riscv64-glue.c
> @@ -13,21 +13,21 @@
>  #include <linux/linkage.h>
>  #include <linux/module.h>
>  
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(use_zvkb);
>  
> -asmlinkage void chacha_zvkb(u32 state[16], const u8 *in, u8 *out,
> +asmlinkage void chacha_zvkb(struct chacha_state *state, const u8 *in, u8 *out,
>  			    size_t nblocks, int nrounds);
>  
> -void hchacha_block_arch(const u32 *state, u32 *out, int nrounds)
> +void hchacha_block_arch(const struct chacha_state *state, u32 *out, int nrounds)
>  {
>  	hchacha_block_generic(state, out, nrounds);
>  }
>  EXPORT_SYMBOL(hchacha_block_arch);
>  
> -void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
> -		       int nrounds)
> +void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
> +		       unsigned int bytes, int nrounds)
>  {
>  	u8 block_buffer[CHACHA_BLOCK_SIZE];
>  	unsigned int full_blocks = bytes / CHACHA_BLOCK_SIZE;
>  	unsigned int tail_bytes = bytes % CHACHA_BLOCK_SIZE;
>  
> diff --git a/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S b/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
> index ab4423b3880e..b777d0b4e379 100644
> --- a/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
> +++ b/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
> @@ -130,19 +130,19 @@
>  	vror.vi		\b1, \b1, 32 - 7
>  	vror.vi		\b2, \b2, 32 - 7
>  	vror.vi		\b3, \b3, 32 - 7
>  .endm
>  
> -// void chacha_zvkb(u32 state[16], const u8 *in, u8 *out, size_t nblocks,
> -//		    int nrounds);
> +// void chacha_zvkb(struct chacha_state *state, const u8 *in, u8 *out,
> +//		    size_t nblocks, int nrounds);
>  //
>  // |nblocks| is the number of 64-byte blocks to process, and must be nonzero.
>  //
>  // |state| gives the ChaCha state matrix, including the 32-bit counter in
> -// state[12] following the RFC7539 convention; note that this differs from the
> -// original Salsa20 paper which uses a 64-bit counter in state[12..13].  The
> -// updated 32-bit counter is written back to state[12] before returning.
> +// state->x[12] following the RFC7539 convention; note that this differs from
> +// the original Salsa20 paper which uses a 64-bit counter in state->x[12..13].
> +// The updated 32-bit counter is written back to state->x[12] before returning.
>  SYM_FUNC_START(chacha_zvkb)
>  	addi		sp, sp, -96
>  	sd		s0, 0(sp)
>  	sd		s1, 8(sp)
>  	sd		s2, 16(sp)
> diff --git a/arch/s390/lib/crypto/chacha-glue.c b/arch/s390/lib/crypto/chacha-glue.c
> index b3ffaa555385..0a9fd50c1bd8 100644
> --- a/arch/s390/lib/crypto/chacha-glue.c
> +++ b/arch/s390/lib/crypto/chacha-glue.c
> @@ -14,18 +14,19 @@
>  #include <linux/module.h>
>  #include <linux/sizes.h>
>  #include <asm/fpu.h>
>  #include "chacha-s390.h"
>  
> -void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
> +void hchacha_block_arch(const struct chacha_state *state,
> +			u32 *stream, int nrounds)
>  {
>  	/* TODO: implement hchacha_block_arch() in assembly */
>  	hchacha_block_generic(state, stream, nrounds);
>  }
>  EXPORT_SYMBOL(hchacha_block_arch);
>  
> -void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src,
> +void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
>  		       unsigned int bytes, int nrounds)
>  {
>  	/* s390 chacha20 implementation has 20 rounds hard-coded,
>  	 * it cannot handle a block of data or less, but otherwise
>  	 * it can handle data of arbitrary size
> @@ -34,15 +35,15 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src,
>  		chacha_crypt_generic(state, dst, src, bytes, nrounds);
>  	} else {
>  		DECLARE_KERNEL_FPU_ONSTACK32(vxstate);
>  
>  		kernel_fpu_begin(&vxstate, KERNEL_VXR);
> -		chacha20_vx(dst, src, bytes, &state[4], &state[12]);
> +		chacha20_vx(dst, src, bytes, &state->x[4], &state->x[12]);
>  		kernel_fpu_end(&vxstate, KERNEL_VXR);
>  
> -		state[12] += round_up(bytes, CHACHA_BLOCK_SIZE) /
> -			     CHACHA_BLOCK_SIZE;
> +		state->x[12] += round_up(bytes, CHACHA_BLOCK_SIZE) /
> +				CHACHA_BLOCK_SIZE;
>  	}
>  }
>  EXPORT_SYMBOL(chacha_crypt_arch);
>  
>  bool chacha_is_arch_optimized(void)
> diff --git a/arch/x86/lib/crypto/chacha_glue.c b/arch/x86/lib/crypto/chacha_glue.c
> index 94fcefbc8827..6f00a56e3e9a 100644
> --- a/arch/x86/lib/crypto/chacha_glue.c
> +++ b/arch/x86/lib/crypto/chacha_glue.c
> @@ -10,28 +10,37 @@
>  #include <linux/jump_label.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/sizes.h>
>  
> -asmlinkage void chacha_block_xor_ssse3(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_block_xor_ssse3(const struct chacha_state *state,
> +				       u8 *dst, const u8 *src,
>  				       unsigned int len, int nrounds);
> -asmlinkage void chacha_4block_xor_ssse3(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_4block_xor_ssse3(const struct chacha_state *state,
> +					u8 *dst, const u8 *src,
>  					unsigned int len, int nrounds);
> -asmlinkage void hchacha_block_ssse3(const u32 *state, u32 *out, int nrounds);
> +asmlinkage void hchacha_block_ssse3(const struct chacha_state *state,
> +				    u32 *out, int nrounds);
>  
> -asmlinkage void chacha_2block_xor_avx2(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_2block_xor_avx2(const struct chacha_state *state,
> +				       u8 *dst, const u8 *src,
>  				       unsigned int len, int nrounds);
> -asmlinkage void chacha_4block_xor_avx2(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_4block_xor_avx2(const struct chacha_state *state,
> +				       u8 *dst, const u8 *src,
>  				       unsigned int len, int nrounds);
> -asmlinkage void chacha_8block_xor_avx2(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_8block_xor_avx2(const struct chacha_state *state,
> +				       u8 *dst, const u8 *src,
>  				       unsigned int len, int nrounds);
>  
> -asmlinkage void chacha_2block_xor_avx512vl(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_2block_xor_avx512vl(const struct chacha_state *state,
> +					   u8 *dst, const u8 *src,
>  					   unsigned int len, int nrounds);
> -asmlinkage void chacha_4block_xor_avx512vl(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_4block_xor_avx512vl(const struct chacha_state *state,
> +					   u8 *dst, const u8 *src,
>  					   unsigned int len, int nrounds);
> -asmlinkage void chacha_8block_xor_avx512vl(u32 *state, u8 *dst, const u8 *src,
> +asmlinkage void chacha_8block_xor_avx512vl(const struct chacha_state *state,
> +					   u8 *dst, const u8 *src,
>  					   unsigned int len, int nrounds);
>  
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(chacha_use_simd);
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(chacha_use_avx2);
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(chacha_use_avx512vl);
> @@ -40,86 +49,87 @@ static unsigned int chacha_advance(unsigned int len, unsigned int maxblocks)
>  {
>  	len = min(len, maxblocks * CHACHA_BLOCK_SIZE);
>  	return round_up(len, CHACHA_BLOCK_SIZE) / CHACHA_BLOCK_SIZE;
>  }
>  
> -static void chacha_dosimd(u32 *state, u8 *dst, const u8 *src,
> +static void chacha_dosimd(struct chacha_state *state, u8 *dst, const u8 *src,
>  			  unsigned int bytes, int nrounds)
>  {
>  	if (static_branch_likely(&chacha_use_avx512vl)) {
>  		while (bytes >= CHACHA_BLOCK_SIZE * 8) {
>  			chacha_8block_xor_avx512vl(state, dst, src, bytes,
>  						   nrounds);
>  			bytes -= CHACHA_BLOCK_SIZE * 8;
>  			src += CHACHA_BLOCK_SIZE * 8;
>  			dst += CHACHA_BLOCK_SIZE * 8;
> -			state[12] += 8;
> +			state->x[12] += 8;
>  		}
>  		if (bytes > CHACHA_BLOCK_SIZE * 4) {
>  			chacha_8block_xor_avx512vl(state, dst, src, bytes,
>  						   nrounds);
> -			state[12] += chacha_advance(bytes, 8);
> +			state->x[12] += chacha_advance(bytes, 8);
>  			return;
>  		}
>  		if (bytes > CHACHA_BLOCK_SIZE * 2) {
>  			chacha_4block_xor_avx512vl(state, dst, src, bytes,
>  						   nrounds);
> -			state[12] += chacha_advance(bytes, 4);
> +			state->x[12] += chacha_advance(bytes, 4);
>  			return;
>  		}
>  		if (bytes) {
>  			chacha_2block_xor_avx512vl(state, dst, src, bytes,
>  						   nrounds);
> -			state[12] += chacha_advance(bytes, 2);
> +			state->x[12] += chacha_advance(bytes, 2);
>  			return;
>  		}
>  	}
>  
>  	if (static_branch_likely(&chacha_use_avx2)) {
>  		while (bytes >= CHACHA_BLOCK_SIZE * 8) {
>  			chacha_8block_xor_avx2(state, dst, src, bytes, nrounds);
>  			bytes -= CHACHA_BLOCK_SIZE * 8;
>  			src += CHACHA_BLOCK_SIZE * 8;
>  			dst += CHACHA_BLOCK_SIZE * 8;
> -			state[12] += 8;
> +			state->x[12] += 8;
>  		}
>  		if (bytes > CHACHA_BLOCK_SIZE * 4) {
>  			chacha_8block_xor_avx2(state, dst, src, bytes, nrounds);
> -			state[12] += chacha_advance(bytes, 8);
> +			state->x[12] += chacha_advance(bytes, 8);
>  			return;
>  		}
>  		if (bytes > CHACHA_BLOCK_SIZE * 2) {
>  			chacha_4block_xor_avx2(state, dst, src, bytes, nrounds);
> -			state[12] += chacha_advance(bytes, 4);
> +			state->x[12] += chacha_advance(bytes, 4);
>  			return;
>  		}
>  		if (bytes > CHACHA_BLOCK_SIZE) {
>  			chacha_2block_xor_avx2(state, dst, src, bytes, nrounds);
> -			state[12] += chacha_advance(bytes, 2);
> +			state->x[12] += chacha_advance(bytes, 2);
>  			return;
>  		}
>  	}
>  
>  	while (bytes >= CHACHA_BLOCK_SIZE * 4) {
>  		chacha_4block_xor_ssse3(state, dst, src, bytes, nrounds);
>  		bytes -= CHACHA_BLOCK_SIZE * 4;
>  		src += CHACHA_BLOCK_SIZE * 4;
>  		dst += CHACHA_BLOCK_SIZE * 4;
> -		state[12] += 4;
> +		state->x[12] += 4;
>  	}
>  	if (bytes > CHACHA_BLOCK_SIZE) {
>  		chacha_4block_xor_ssse3(state, dst, src, bytes, nrounds);
> -		state[12] += chacha_advance(bytes, 4);
> +		state->x[12] += chacha_advance(bytes, 4);
>  		return;
>  	}
>  	if (bytes) {
>  		chacha_block_xor_ssse3(state, dst, src, bytes, nrounds);
> -		state[12]++;
> +		state->x[12]++;
>  	}
>  }
>  
> -void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
> +void hchacha_block_arch(const struct chacha_state *state,
> +			u32 *stream, int nrounds)
>  {
>  	if (!static_branch_likely(&chacha_use_simd)) {
>  		hchacha_block_generic(state, stream, nrounds);
>  	} else {
>  		kernel_fpu_begin();
> @@ -127,12 +137,12 @@ void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
>  		kernel_fpu_end();
>  	}
>  }
>  EXPORT_SYMBOL(hchacha_block_arch);
>  
> -void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
> -		       int nrounds)
> +void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
> +		       unsigned int bytes, int nrounds)
>  {
>  	if (!static_branch_likely(&chacha_use_simd) ||
>  	    bytes <= CHACHA_BLOCK_SIZE)
>  		return chacha_crypt_generic(state, dst, src, bytes, nrounds);
>  
> diff --git a/crypto/chacha.c b/crypto/chacha.c
> index 28a8ad6197ab..73ce62a9ac22 100644
> --- a/crypto/chacha.c
> +++ b/crypto/chacha.c
> @@ -48,28 +48,28 @@ static int chacha12_setkey(struct crypto_skcipher *tfm,
>  static int chacha_stream_xor(struct skcipher_request *req,
>  			     const struct chacha_ctx *ctx, const u8 *iv,
>  			     bool arch)
>  {
>  	struct skcipher_walk walk;
> -	u32 state[16];
> +	struct chacha_state state;
>  	int err;
>  
>  	err = skcipher_walk_virt(&walk, req, false);
>  
> -	chacha_init(state, ctx->key, iv);
> +	chacha_init(&state, ctx->key, iv);
>  
>  	while (walk.nbytes > 0) {
>  		unsigned int nbytes = walk.nbytes;
>  
>  		if (nbytes < walk.total)
>  			nbytes = round_down(nbytes, CHACHA_BLOCK_SIZE);
>  
>  		if (arch)
> -			chacha_crypt(state, walk.dst.virt.addr,
> +			chacha_crypt(&state, walk.dst.virt.addr,
>  				     walk.src.virt.addr, nbytes, ctx->nrounds);
>  		else
> -			chacha_crypt_generic(state, walk.dst.virt.addr,
> +			chacha_crypt_generic(&state, walk.dst.virt.addr,
>  					     walk.src.virt.addr, nbytes,
>  					     ctx->nrounds);
>  		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
>  	}
>  
> @@ -95,19 +95,19 @@ static int crypto_chacha_crypt_arch(struct skcipher_request *req)
>  static int crypto_xchacha_crypt(struct skcipher_request *req, bool arch)
>  {
>  	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
>  	const struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
>  	struct chacha_ctx subctx;
> -	u32 state[16];
> +	struct chacha_state state;
>  	u8 real_iv[16];
>  
>  	/* Compute the subkey given the original key and first 128 nonce bits */
> -	chacha_init(state, ctx->key, req->iv);
> +	chacha_init(&state, ctx->key, req->iv);
>  	if (arch)
> -		hchacha_block(state, subctx.key, ctx->nrounds);
> +		hchacha_block(&state, subctx.key, ctx->nrounds);
>  	else
> -		hchacha_block_generic(state, subctx.key, ctx->nrounds);
> +		hchacha_block_generic(&state, subctx.key, ctx->nrounds);
>  	subctx.nrounds = ctx->nrounds;
>  
>  	/* Build the real IV */
>  	memcpy(&real_iv[0], req->iv + 24, 8); /* stream position */
>  	memcpy(&real_iv[8], req->iv + 16, 8); /* remaining 64 nonce bits */
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index 38f2fab29c56..9f876ed2655b 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -307,24 +307,24 @@ static void crng_reseed(struct work_struct *work)
>   *
>   * The returned ChaCha state contains within it a copy of the old
>   * key value, at index 4, so the state should always be zeroed out
>   * immediately after using in order to maintain forward secrecy.
>   * If the state cannot be erased in a timely manner, then it is
> - * safer to set the random_data parameter to &chacha_state[4] so
> - * that this function overwrites it before returning.
> + * safer to set the random_data parameter to &chacha_state->x[4]
> + * so that this function overwrites it before returning.
>   */
>  static void crng_fast_key_erasure(u8 key[CHACHA_KEY_SIZE],
> -				  u32 chacha_state[CHACHA_STATE_WORDS],
> +				  struct chacha_state *chacha_state,
>  				  u8 *random_data, size_t random_data_len)
>  {
>  	u8 first_block[CHACHA_BLOCK_SIZE];
>  
>  	BUG_ON(random_data_len > 32);
>  
>  	chacha_init_consts(chacha_state);
> -	memcpy(&chacha_state[4], key, CHACHA_KEY_SIZE);
> -	memset(&chacha_state[12], 0, sizeof(u32) * 4);
> +	memcpy(&chacha_state->x[4], key, CHACHA_KEY_SIZE);
> +	memset(&chacha_state->x[12], 0, sizeof(u32) * 4);
>  	chacha20_block(chacha_state, first_block);
>  
>  	memcpy(key, first_block, CHACHA_KEY_SIZE);
>  	memcpy(random_data, first_block + CHACHA_KEY_SIZE, random_data_len);
>  	memzero_explicit(first_block, sizeof(first_block));
> @@ -333,11 +333,11 @@ static void crng_fast_key_erasure(u8 key[CHACHA_KEY_SIZE],
>  /*
>   * This function returns a ChaCha state that you may use for generating
>   * random data. It also returns up to 32 bytes on its own of random data
>   * that may be used; random_data_len may not be greater than 32.
>   */
> -static void crng_make_state(u32 chacha_state[CHACHA_STATE_WORDS],
> +static void crng_make_state(struct chacha_state *chacha_state,
>  			    u8 *random_data, size_t random_data_len)
>  {
>  	unsigned long flags;
>  	struct crng *crng;
>  
> @@ -393,38 +393,38 @@ static void crng_make_state(u32 chacha_state[CHACHA_STATE_WORDS],
>  	local_unlock_irqrestore(&crngs.lock, flags);
>  }
>  
>  static void _get_random_bytes(void *buf, size_t len)
>  {
> -	u32 chacha_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha_state;
>  	u8 tmp[CHACHA_BLOCK_SIZE];
>  	size_t first_block_len;
>  
>  	if (!len)
>  		return;
>  
>  	first_block_len = min_t(size_t, 32, len);
> -	crng_make_state(chacha_state, buf, first_block_len);
> +	crng_make_state(&chacha_state, buf, first_block_len);
>  	len -= first_block_len;
>  	buf += first_block_len;
>  
>  	while (len) {
>  		if (len < CHACHA_BLOCK_SIZE) {
> -			chacha20_block(chacha_state, tmp);
> +			chacha20_block(&chacha_state, tmp);
>  			memcpy(buf, tmp, len);
>  			memzero_explicit(tmp, sizeof(tmp));
>  			break;
>  		}
>  
> -		chacha20_block(chacha_state, buf);
> -		if (unlikely(chacha_state[12] == 0))
> -			++chacha_state[13];
> +		chacha20_block(&chacha_state, buf);
> +		if (unlikely(chacha_state.x[12] == 0))
> +			++chacha_state.x[13];
>  		len -= CHACHA_BLOCK_SIZE;
>  		buf += CHACHA_BLOCK_SIZE;
>  	}
>  
> -	memzero_explicit(chacha_state, sizeof(chacha_state));
> +	memzero_explicit(&chacha_state, sizeof(chacha_state));
>  }
>  
>  /*
>   * This returns random bytes in arbitrary quantities. The quality of the
>   * random bytes is good as /dev/urandom. In order to ensure that the
> @@ -439,11 +439,11 @@ void get_random_bytes(void *buf, size_t len)
>  }
>  EXPORT_SYMBOL(get_random_bytes);
>  
>  static ssize_t get_random_bytes_user(struct iov_iter *iter)
>  {
> -	u32 chacha_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha_state;
>  	u8 block[CHACHA_BLOCK_SIZE];
>  	size_t ret = 0, copied;
>  
>  	if (unlikely(!iov_iter_count(iter)))
>  		return 0;
> @@ -451,25 +451,26 @@ static ssize_t get_random_bytes_user(struct iov_iter *iter)
>  	/*
>  	 * Immediately overwrite the ChaCha key at index 4 with random
>  	 * bytes, in case userspace causes copy_to_iter() below to sleep
>  	 * forever, so that we still retain forward secrecy in that case.
>  	 */
> -	crng_make_state(chacha_state, (u8 *)&chacha_state[4], CHACHA_KEY_SIZE);
> +	crng_make_state(&chacha_state, (u8 *)&chacha_state.x[4],
> +			CHACHA_KEY_SIZE);
>  	/*
>  	 * However, if we're doing a read of len <= 32, we don't need to
>  	 * use chacha_state after, so we can simply return those bytes to
>  	 * the user directly.
>  	 */
>  	if (iov_iter_count(iter) <= CHACHA_KEY_SIZE) {
> -		ret = copy_to_iter(&chacha_state[4], CHACHA_KEY_SIZE, iter);
> +		ret = copy_to_iter(&chacha_state.x[4], CHACHA_KEY_SIZE, iter);
>  		goto out_zero_chacha;
>  	}
>  
>  	for (;;) {
> -		chacha20_block(chacha_state, block);
> -		if (unlikely(chacha_state[12] == 0))
> -			++chacha_state[13];
> +		chacha20_block(&chacha_state, block);
> +		if (unlikely(chacha_state.x[12] == 0))
> +			++chacha_state.x[13];
>  
>  		copied = copy_to_iter(block, sizeof(block), iter);
>  		ret += copied;
>  		if (!iov_iter_count(iter) || copied != sizeof(block))
>  			break;
> @@ -482,11 +483,11 @@ static ssize_t get_random_bytes_user(struct iov_iter *iter)
>  		}
>  	}
>  
>  	memzero_explicit(block, sizeof(block));
>  out_zero_chacha:
> -	memzero_explicit(chacha_state, sizeof(chacha_state));
> +	memzero_explicit(&chacha_state, sizeof(chacha_state));
>  	return ret ? ret : -EFAULT;
>  }
>  
>  /*
>   * Batched entropy returns random integers. The quality of the random
> diff --git a/fs/bcachefs/checksum.c b/fs/bcachefs/checksum.c
> index d0a34a097b80..312fda4bb1b5 100644
> --- a/fs/bcachefs/checksum.c
> +++ b/fs/bcachefs/checksum.c
> @@ -89,11 +89,11 @@ static void bch2_checksum_update(struct bch2_checksum_state *state, const void *
>  	default:
>  		BUG();
>  	}
>  }
>  
> -static void bch2_chacha20_init(u32 state[CHACHA_STATE_WORDS],
> +static void bch2_chacha20_init(struct chacha_state *state,
>  			       const struct bch_key *key, struct nonce nonce)
>  {
>  	u32 key_words[CHACHA_KEY_SIZE / sizeof(u32)];
>  
>  	BUILD_BUG_ON(sizeof(key_words) != sizeof(*key));
> @@ -107,15 +107,15 @@ static void bch2_chacha20_init(u32 state[CHACHA_STATE_WORDS],
>  }
>  
>  static void bch2_chacha20(const struct bch_key *key, struct nonce nonce,
>  			  void *data, size_t len)
>  {
> -	u32 state[CHACHA_STATE_WORDS];
> +	struct chacha_state state;
>  
> -	bch2_chacha20_init(state, key, nonce);
> -	chacha20_crypt(state, data, data, len);
> -	memzero_explicit(state, sizeof(state));
> +	bch2_chacha20_init(&state, key, nonce);
> +	chacha20_crypt(&state, data, data, len);
> +	memzero_explicit(&state, sizeof(state));
>  }
>  
>  static void bch2_poly1305_init(struct poly1305_desc_ctx *desc,
>  			       struct bch_fs *c, struct nonce nonce)
>  {
> @@ -255,18 +255,18 @@ struct bch_csum bch2_checksum_bio(struct bch_fs *c, unsigned type,
>  int __bch2_encrypt_bio(struct bch_fs *c, unsigned type,
>  		     struct nonce nonce, struct bio *bio)
>  {
>  	struct bio_vec bv;
>  	struct bvec_iter iter;
> -	u32 chacha_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha_state;
>  	int ret = 0;
>  
>  	if (bch2_fs_inconsistent_on(!c->chacha20_key_set,
>  				    c, "attempting to encrypt without encryption key"))
>  		return -BCH_ERR_no_encryption_key;
>  
> -	bch2_chacha20_init(chacha_state, &c->chacha20_key, nonce);
> +	bch2_chacha20_init(&chacha_state, &c->chacha20_key, nonce);
>  
>  	bio_for_each_segment(bv, bio, iter) {
>  		void *p;
>  
>  		/*
> @@ -278,14 +278,14 @@ int __bch2_encrypt_bio(struct bch_fs *c, unsigned type,
>  			ret = -EIO;
>  			break;
>  		}
>  
>  		p = bvec_kmap_local(&bv);
> -		chacha20_crypt(chacha_state, p, p, bv.bv_len);
> +		chacha20_crypt(&chacha_state, p, p, bv.bv_len);
>  		kunmap_local(p);
>  	}
> -	memzero_explicit(chacha_state, sizeof(chacha_state));
> +	memzero_explicit(&chacha_state, sizeof(chacha_state));
>  	return ret;
>  }
>  
>  struct bch_csum bch2_checksum_merge(unsigned type, struct bch_csum a,
>  				    struct bch_csum b, size_t b_len)
> diff --git a/include/crypto/chacha.h b/include/crypto/chacha.h
> index 58129e18cc31..64fb270f2bfc 100644
> --- a/include/crypto/chacha.h
> +++ b/include/crypto/chacha.h
> @@ -28,20 +28,27 @@
>  #define CHACHA_STATE_WORDS	(CHACHA_BLOCK_SIZE / sizeof(u32))
>  
>  /* 192-bit nonce, then 64-bit stream position */
>  #define XCHACHA_IV_SIZE		32
>  
> -void chacha_block_generic(u32 *state, u8 *stream, int nrounds);
> -static inline void chacha20_block(u32 *state, u8 *stream)
> +struct chacha_state {
> +	u32 x[CHACHA_STATE_WORDS];
> +};
> +
> +void chacha_block_generic(struct chacha_state *state, u8 *stream, int nrounds);
> +static inline void chacha20_block(struct chacha_state *state, u8 *stream)
>  {
>  	chacha_block_generic(state, stream, 20);
>  }
>  
> -void hchacha_block_arch(const u32 *state, u32 *out, int nrounds);
> -void hchacha_block_generic(const u32 *state, u32 *out, int nrounds);
> +void hchacha_block_arch(const struct chacha_state *state, u32 *out,
> +			int nrounds);
> +void hchacha_block_generic(const struct chacha_state *state, u32 *out,
> +			   int nrounds);
>  
> -static inline void hchacha_block(const u32 *state, u32 *out, int nrounds)
> +static inline void hchacha_block(const struct chacha_state *state, u32 *out,
> +				 int nrounds)
>  {
>  	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA))
>  		hchacha_block_arch(state, out, nrounds);
>  	else
>  		hchacha_block_generic(state, out, nrounds);
> @@ -52,51 +59,53 @@ enum chacha_constants { /* expand 32-byte k */
>  	CHACHA_CONSTANT_ND_3 = 0x3320646eU,
>  	CHACHA_CONSTANT_2_BY = 0x79622d32U,
>  	CHACHA_CONSTANT_TE_K = 0x6b206574U
>  };
>  
> -static inline void chacha_init_consts(u32 *state)
> +static inline void chacha_init_consts(struct chacha_state *state)
>  {
> -	state[0]  = CHACHA_CONSTANT_EXPA;
> -	state[1]  = CHACHA_CONSTANT_ND_3;
> -	state[2]  = CHACHA_CONSTANT_2_BY;
> -	state[3]  = CHACHA_CONSTANT_TE_K;
> +	state->x[0]  = CHACHA_CONSTANT_EXPA;
> +	state->x[1]  = CHACHA_CONSTANT_ND_3;
> +	state->x[2]  = CHACHA_CONSTANT_2_BY;
> +	state->x[3]  = CHACHA_CONSTANT_TE_K;
>  }
>  
> -static inline void chacha_init(u32 *state, const u32 *key, const u8 *iv)
> +static inline void chacha_init(struct chacha_state *state,
> +			       const u32 *key, const u8 *iv)
>  {
>  	chacha_init_consts(state);
> -	state[4]  = key[0];
> -	state[5]  = key[1];
> -	state[6]  = key[2];
> -	state[7]  = key[3];
> -	state[8]  = key[4];
> -	state[9]  = key[5];
> -	state[10] = key[6];
> -	state[11] = key[7];
> -	state[12] = get_unaligned_le32(iv +  0);
> -	state[13] = get_unaligned_le32(iv +  4);
> -	state[14] = get_unaligned_le32(iv +  8);
> -	state[15] = get_unaligned_le32(iv + 12);
> +	state->x[4]  = key[0];
> +	state->x[5]  = key[1];
> +	state->x[6]  = key[2];
> +	state->x[7]  = key[3];
> +	state->x[8]  = key[4];
> +	state->x[9]  = key[5];
> +	state->x[10] = key[6];
> +	state->x[11] = key[7];
> +	state->x[12] = get_unaligned_le32(iv +  0);
> +	state->x[13] = get_unaligned_le32(iv +  4);
> +	state->x[14] = get_unaligned_le32(iv +  8);
> +	state->x[15] = get_unaligned_le32(iv + 12);
>  }
>  
> -void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src,
> +void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
>  		       unsigned int bytes, int nrounds);
> -void chacha_crypt_generic(u32 *state, u8 *dst, const u8 *src,
> +void chacha_crypt_generic(struct chacha_state *state, u8 *dst, const u8 *src,
>  			  unsigned int bytes, int nrounds);
>  
> -static inline void chacha_crypt(u32 *state, u8 *dst, const u8 *src,
> +static inline void chacha_crypt(struct chacha_state *state,
> +				u8 *dst, const u8 *src,
>  				unsigned int bytes, int nrounds)
>  {
>  	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA))
>  		chacha_crypt_arch(state, dst, src, bytes, nrounds);
>  	else
>  		chacha_crypt_generic(state, dst, src, bytes, nrounds);
>  }
>  
> -static inline void chacha20_crypt(u32 *state, u8 *dst, const u8 *src,
> -				  unsigned int bytes)
> +static inline void chacha20_crypt(struct chacha_state *state,
> +				  u8 *dst, const u8 *src, unsigned int bytes)
>  {
>  	chacha_crypt(state, dst, src, bytes, 20);
>  }
>  
>  #if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA)
> diff --git a/lib/crypto/chacha.c b/lib/crypto/chacha.c
> index 3cdda3b5ee06..a7f5eb091839 100644
> --- a/lib/crypto/chacha.c
> +++ b/lib/crypto/chacha.c
> @@ -11,12 +11,13 @@
>  #include <linux/bitops.h>
>  #include <linux/string.h>
>  #include <linux/unaligned.h>
>  #include <crypto/chacha.h>
>  
> -static void chacha_permute(u32 *x, int nrounds)
> +static void chacha_permute(struct chacha_state *state, int nrounds)
>  {
> +	u32 *x = state->x;
>  	int i;
>  
>  	/* whitelist the allowed round counts */
>  	WARN_ON_ONCE(nrounds != 20 && nrounds != 12);
>  
> @@ -63,52 +64,54 @@ static void chacha_permute(u32 *x, int nrounds)
>  	}
>  }
>  
>  /**
>   * chacha_block_generic - generate one keystream block and increment block counter
> - * @state: input state matrix (16 32-bit words)
> + * @state: input state matrix
>   * @stream: output keystream block (64 bytes)
>   * @nrounds: number of rounds (20 or 12; 20 is recommended)
>   *
>   * This is the ChaCha core, a function from 64-byte strings to 64-byte strings.
>   * The caller has already converted the endianness of the input.  This function
>   * also handles incrementing the block counter in the input matrix.
>   */
> -void chacha_block_generic(u32 *state, u8 *stream, int nrounds)
> +void chacha_block_generic(struct chacha_state *state, u8 *stream, int nrounds)
>  {
> -	u32 x[16];
> +	struct chacha_state permuted_state;
>  	int i;
>  
> -	memcpy(x, state, 64);
> +	memcpy(permuted_state.x, state->x, 64);
>  
> -	chacha_permute(x, nrounds);
> +	chacha_permute(&permuted_state, nrounds);
>  
> -	for (i = 0; i < ARRAY_SIZE(x); i++)
> -		put_unaligned_le32(x[i] + state[i], &stream[i * sizeof(u32)]);
> +	for (i = 0; i < ARRAY_SIZE(state->x); i++)
> +		put_unaligned_le32(permuted_state.x[i] + state->x[i],
> +				   &stream[i * sizeof(u32)]);
>  
> -	state[12]++;
> +	state->x[12]++;
>  }
>  EXPORT_SYMBOL(chacha_block_generic);
>  
>  /**
>   * hchacha_block_generic - abbreviated ChaCha core, for XChaCha
> - * @state: input state matrix (16 32-bit words)
> + * @state: input state matrix
>   * @stream: output (8 32-bit words)
>   * @nrounds: number of rounds (20 or 12; 20 is recommended)
>   *
>   * HChaCha is the ChaCha equivalent of HSalsa and is an intermediate step
>   * towards XChaCha (see https://cr.yp.to/snuffle/xsalsa-20081128.pdf).  HChaCha
>   * skips the final addition of the initial state, and outputs only certain words
>   * of the state.  It should not be used for streaming directly.
>   */
> -void hchacha_block_generic(const u32 *state, u32 *stream, int nrounds)
> +void hchacha_block_generic(const struct chacha_state *state,
> +			   u32 *stream, int nrounds)
>  {
> -	u32 x[16];
> +	struct chacha_state permuted_state;
>  
> -	memcpy(x, state, 64);
> +	memcpy(permuted_state.x, state->x, 64);
>  
> -	chacha_permute(x, nrounds);
> +	chacha_permute(&permuted_state, nrounds);
>  
> -	memcpy(&stream[0], &x[0], 16);
> -	memcpy(&stream[4], &x[12], 16);
> +	memcpy(&stream[0], &permuted_state.x[0], 16);
> +	memcpy(&stream[4], &permuted_state.x[12], 16);
>  }
>  EXPORT_SYMBOL(hchacha_block_generic);
> diff --git a/lib/crypto/chacha20poly1305-selftest.c b/lib/crypto/chacha20poly1305-selftest.c
> index 2ea61c28be4f..e4c85bc5a6d7 100644
> --- a/lib/crypto/chacha20poly1305-selftest.c
> +++ b/lib/crypto/chacha20poly1305-selftest.c
> @@ -8830,11 +8830,11 @@ chacha20poly1305_encrypt_bignonce(u8 *dst, const u8 *src, const size_t src_len,
>  				  const u8 nonce[12],
>  				  const u8 key[CHACHA20POLY1305_KEY_SIZE])
>  {
>  	const u8 *pad0 = page_address(ZERO_PAGE(0));
>  	struct poly1305_desc_ctx poly1305_state;
> -	u32 chacha20_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha20_state;
>  	union {
>  		u8 block0[POLY1305_KEY_SIZE];
>  		__le64 lens[2];
>  	} b = {{ 0 }};
>  	u8 bottom_row[16] = { 0 };
> @@ -8842,16 +8842,16 @@ chacha20poly1305_encrypt_bignonce(u8 *dst, const u8 *src, const size_t src_len,
>  	int i;
>  
>  	memcpy(&bottom_row[4], nonce, 12);
>  	for (i = 0; i < 8; ++i)
>  		le_key[i] = get_unaligned_le32(key + sizeof(le_key[i]) * i);
> -	chacha_init(chacha20_state, le_key, bottom_row);
> -	chacha20_crypt(chacha20_state, b.block0, b.block0, sizeof(b.block0));
> +	chacha_init(&chacha20_state, le_key, bottom_row);
> +	chacha20_crypt(&chacha20_state, b.block0, b.block0, sizeof(b.block0));
>  	poly1305_init(&poly1305_state, b.block0);
>  	poly1305_update(&poly1305_state, ad, ad_len);
>  	poly1305_update(&poly1305_state, pad0, (0x10 - ad_len) & 0xf);
> -	chacha20_crypt(chacha20_state, dst, src, src_len);
> +	chacha20_crypt(&chacha20_state, dst, src, src_len);
>  	poly1305_update(&poly1305_state, dst, src_len);
>  	poly1305_update(&poly1305_state, pad0, (0x10 - src_len) & 0xf);
>  	b.lens[0] = cpu_to_le64(ad_len);
>  	b.lens[1] = cpu_to_le64(src_len);
>  	poly1305_update(&poly1305_state, (u8 *)b.lens, sizeof(b.lens));
> diff --git a/lib/crypto/chacha20poly1305.c b/lib/crypto/chacha20poly1305.c
> index 9cfa886f1f89..ed81f0658956 100644
> --- a/lib/crypto/chacha20poly1305.c
> +++ b/lib/crypto/chacha20poly1305.c
> @@ -30,11 +30,12 @@ static void chacha_load_key(u32 *k, const u8 *in)
>  	k[5] = get_unaligned_le32(in + 20);
>  	k[6] = get_unaligned_le32(in + 24);
>  	k[7] = get_unaligned_le32(in + 28);
>  }
>  
> -static void xchacha_init(u32 *chacha_state, const u8 *key, const u8 *nonce)
> +static void xchacha_init(struct chacha_state *chacha_state,
> +			 const u8 *key, const u8 *nonce)
>  {
>  	u32 k[CHACHA_KEY_WORDS];
>  	u8 iv[CHACHA_IV_SIZE];
>  
>  	memset(iv, 0, 8);
> @@ -52,11 +53,12 @@ static void xchacha_init(u32 *chacha_state, const u8 *key, const u8 *nonce)
>  	memzero_explicit(iv, sizeof(iv));
>  }
>  
>  static void
>  __chacha20poly1305_encrypt(u8 *dst, const u8 *src, const size_t src_len,
> -			   const u8 *ad, const size_t ad_len, u32 *chacha_state)
> +			   const u8 *ad, const size_t ad_len,
> +			   struct chacha_state *chacha_state)
>  {
>  	const u8 *pad0 = page_address(ZERO_PAGE(0));
>  	struct poly1305_desc_ctx poly1305_state;
>  	union {
>  		u8 block0[POLY1305_KEY_SIZE];
> @@ -80,30 +82,31 @@ __chacha20poly1305_encrypt(u8 *dst, const u8 *src, const size_t src_len,
>  	b.lens[1] = cpu_to_le64(src_len);
>  	poly1305_update(&poly1305_state, (u8 *)b.lens, sizeof(b.lens));
>  
>  	poly1305_final(&poly1305_state, dst + src_len);
>  
> -	memzero_explicit(chacha_state, CHACHA_STATE_WORDS * sizeof(u32));
> +	memzero_explicit(chacha_state, sizeof(*chacha_state));
>  	memzero_explicit(&b, sizeof(b));
>  }
>  
>  void chacha20poly1305_encrypt(u8 *dst, const u8 *src, const size_t src_len,
>  			      const u8 *ad, const size_t ad_len,
>  			      const u64 nonce,
>  			      const u8 key[CHACHA20POLY1305_KEY_SIZE])
>  {
> -	u32 chacha_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha_state;
>  	u32 k[CHACHA_KEY_WORDS];
>  	__le64 iv[2];
>  
>  	chacha_load_key(k, key);
>  
>  	iv[0] = 0;
>  	iv[1] = cpu_to_le64(nonce);
>  
> -	chacha_init(chacha_state, k, (u8 *)iv);
> -	__chacha20poly1305_encrypt(dst, src, src_len, ad, ad_len, chacha_state);
> +	chacha_init(&chacha_state, k, (u8 *)iv);
> +	__chacha20poly1305_encrypt(dst, src, src_len, ad, ad_len,
> +				   &chacha_state);
>  
>  	memzero_explicit(iv, sizeof(iv));
>  	memzero_explicit(k, sizeof(k));
>  }
>  EXPORT_SYMBOL(chacha20poly1305_encrypt);
> @@ -111,20 +114,22 @@ EXPORT_SYMBOL(chacha20poly1305_encrypt);
>  void xchacha20poly1305_encrypt(u8 *dst, const u8 *src, const size_t src_len,
>  			       const u8 *ad, const size_t ad_len,
>  			       const u8 nonce[XCHACHA20POLY1305_NONCE_SIZE],
>  			       const u8 key[CHACHA20POLY1305_KEY_SIZE])
>  {
> -	u32 chacha_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha_state;
>  
> -	xchacha_init(chacha_state, key, nonce);
> -	__chacha20poly1305_encrypt(dst, src, src_len, ad, ad_len, chacha_state);
> +	xchacha_init(&chacha_state, key, nonce);
> +	__chacha20poly1305_encrypt(dst, src, src_len, ad, ad_len,
> +				   &chacha_state);
>  }
>  EXPORT_SYMBOL(xchacha20poly1305_encrypt);
>  
>  static bool
>  __chacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
> -			   const u8 *ad, const size_t ad_len, u32 *chacha_state)
> +			   const u8 *ad, const size_t ad_len,
> +			   struct chacha_state *chacha_state)
>  {
>  	const u8 *pad0 = page_address(ZERO_PAGE(0));
>  	struct poly1305_desc_ctx poly1305_state;
>  	size_t dst_len;
>  	int ret;
> @@ -167,25 +172,25 @@ __chacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
>  bool chacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
>  			      const u8 *ad, const size_t ad_len,
>  			      const u64 nonce,
>  			      const u8 key[CHACHA20POLY1305_KEY_SIZE])
>  {
> -	u32 chacha_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha_state;
>  	u32 k[CHACHA_KEY_WORDS];
>  	__le64 iv[2];
>  	bool ret;
>  
>  	chacha_load_key(k, key);
>  
>  	iv[0] = 0;
>  	iv[1] = cpu_to_le64(nonce);
>  
> -	chacha_init(chacha_state, k, (u8 *)iv);
> +	chacha_init(&chacha_state, k, (u8 *)iv);
>  	ret = __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
> -					 chacha_state);
> +					 &chacha_state);
>  
> -	memzero_explicit(chacha_state, sizeof(chacha_state));
> +	memzero_explicit(&chacha_state, sizeof(chacha_state));
>  	memzero_explicit(iv, sizeof(iv));
>  	memzero_explicit(k, sizeof(k));
>  	return ret;
>  }
>  EXPORT_SYMBOL(chacha20poly1305_decrypt);
> @@ -193,15 +198,15 @@ EXPORT_SYMBOL(chacha20poly1305_decrypt);
>  bool xchacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
>  			       const u8 *ad, const size_t ad_len,
>  			       const u8 nonce[XCHACHA20POLY1305_NONCE_SIZE],
>  			       const u8 key[CHACHA20POLY1305_KEY_SIZE])
>  {
> -	u32 chacha_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha_state;
>  
> -	xchacha_init(chacha_state, key, nonce);
> +	xchacha_init(&chacha_state, key, nonce);
>  	return __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
> -					  chacha_state);
> +					  &chacha_state);
>  }
>  EXPORT_SYMBOL(xchacha20poly1305_decrypt);
>  
>  static
>  bool chacha20poly1305_crypt_sg_inplace(struct scatterlist *src,
> @@ -211,11 +216,11 @@ bool chacha20poly1305_crypt_sg_inplace(struct scatterlist *src,
>  				       const u8 key[CHACHA20POLY1305_KEY_SIZE],
>  				       int encrypt)
>  {
>  	const u8 *pad0 = page_address(ZERO_PAGE(0));
>  	struct poly1305_desc_ctx poly1305_state;
> -	u32 chacha_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha_state;
>  	struct sg_mapping_iter miter;
>  	size_t partial = 0;
>  	unsigned int flags;
>  	bool ret = true;
>  	int sl;
> @@ -238,12 +243,12 @@ bool chacha20poly1305_crypt_sg_inplace(struct scatterlist *src,
>  	chacha_load_key(b.k, key);
>  
>  	b.iv[0] = 0;
>  	b.iv[1] = cpu_to_le64(nonce);
>  
> -	chacha_init(chacha_state, b.k, (u8 *)b.iv);
> -	chacha20_crypt(chacha_state, b.block0, pad0, sizeof(b.block0));
> +	chacha_init(&chacha_state, b.k, (u8 *)b.iv);
> +	chacha20_crypt(&chacha_state, b.block0, pad0, sizeof(b.block0));
>  	poly1305_init(&poly1305_state, b.block0);
>  
>  	if (unlikely(ad_len)) {
>  		poly1305_update(&poly1305_state, ad, ad_len);
>  		if (ad_len & 0xf)
> @@ -274,17 +279,17 @@ bool chacha20poly1305_crypt_sg_inplace(struct scatterlist *src,
>  		if (likely(length >= CHACHA_BLOCK_SIZE || length == sl)) {
>  			size_t l = length;
>  
>  			if (unlikely(length < sl))
>  				l &= ~(CHACHA_BLOCK_SIZE - 1);
> -			chacha20_crypt(chacha_state, addr, addr, l);
> +			chacha20_crypt(&chacha_state, addr, addr, l);
>  			addr += l;
>  			length -= l;
>  		}
>  
>  		if (unlikely(length > 0)) {
> -			chacha20_crypt(chacha_state, b.chacha_stream, pad0,
> +			chacha20_crypt(&chacha_state, b.chacha_stream, pad0,
>  				       CHACHA_BLOCK_SIZE);
>  			crypto_xor(addr, b.chacha_stream, length);
>  			partial = length;
>  		}
>  
> @@ -321,11 +326,11 @@ bool chacha20poly1305_crypt_sg_inplace(struct scatterlist *src,
>  			       sizeof(b.mac[1]), src_len, !encrypt);
>  		ret = encrypt ||
>  		      !crypto_memneq(b.mac[0], b.mac[1], POLY1305_DIGEST_SIZE);
>  	}
>  
> -	memzero_explicit(chacha_state, sizeof(chacha_state));
> +	memzero_explicit(&chacha_state, sizeof(chacha_state));
>  	memzero_explicit(&b, sizeof(b));
>  
>  	return ret;
>  }
>  
> diff --git a/lib/crypto/libchacha.c b/lib/crypto/libchacha.c
> index cc1be0496eb9..ebcca381e248 100644
> --- a/lib/crypto/libchacha.c
> +++ b/lib/crypto/libchacha.c
> @@ -10,11 +10,11 @@
>  #include <linux/module.h>
>  
>  #include <crypto/algapi.h> // for crypto_xor_cpy
>  #include <crypto/chacha.h>
>  
> -void chacha_crypt_generic(u32 *state, u8 *dst, const u8 *src,
> +void chacha_crypt_generic(struct chacha_state *state, u8 *dst, const u8 *src,
>  			  unsigned int bytes, int nrounds)
>  {
>  	/* aligned to potentially speed up crypto_xor() */
>  	u8 stream[CHACHA_BLOCK_SIZE] __aligned(sizeof(long));
>  
> diff --git a/tools/testing/crypto/chacha20-s390/test-cipher.c b/tools/testing/crypto/chacha20-s390/test-cipher.c
> index 35ea65c54ffa..827507844e8f 100644
> --- a/tools/testing/crypto/chacha20-s390/test-cipher.c
> +++ b/tools/testing/crypto/chacha20-s390/test-cipher.c
> @@ -48,11 +48,11 @@ struct skcipher_def {
>  };
>  
>  /* Perform cipher operations with the chacha lib */
>  static int test_lib_chacha(u8 *revert, u8 *cipher, u8 *plain)
>  {
> -	u32 chacha_state[CHACHA_STATE_WORDS];
> +	struct chacha_state chacha_state;
>  	u8 iv[16], key[32];
>  	u64 start, end;
>  
>  	memset(key, 'X', sizeof(key));
>  	memset(iv, 'I', sizeof(iv));
> @@ -64,14 +64,14 @@ static int test_lib_chacha(u8 *revert, u8 *cipher, u8 *plain)
>  		print_hex_dump(KERN_INFO, "iv:  ", DUMP_PREFIX_OFFSET,
>  			       16, 1, iv, 16, 1);
>  	}
>  
>  	/* Encrypt */
> -	chacha_init(chacha_state, (u32 *)key, iv);
> +	chacha_init(&chacha_state, (u32 *)key, iv);
>  
>  	start = ktime_get_ns();
> -	chacha_crypt_arch(chacha_state, cipher, plain, data_size, 20);
> +	chacha_crypt_arch(&chacha_state, cipher, plain, data_size, 20);
>  	end = ktime_get_ns();
>  
>  
>  	if (debug)
>  		print_hex_dump(KERN_INFO, "encr:", DUMP_PREFIX_OFFSET,
> @@ -79,14 +79,14 @@ static int test_lib_chacha(u8 *revert, u8 *cipher, u8 *plain)
>  			       (data_size > 64 ? 64 : data_size), 1);
>  
>  	pr_info("lib encryption took: %lld nsec", end - start);
>  
>  	/* Decrypt */
> -	chacha_init(chacha_state, (u32 *)key, iv);
> +	chacha_init(&chacha_state, (u32 *)key, iv);
>  
>  	start = ktime_get_ns();
> -	chacha_crypt_arch(chacha_state, revert, cipher, data_size, 20);
> +	chacha_crypt_arch(&chacha_state, revert, cipher, data_size, 20);
>  	end = ktime_get_ns();
>  
>  	if (debug)
>  		print_hex_dump(KERN_INFO, "decr:", DUMP_PREFIX_OFFSET,
>  			       16, 1, revert,
> -- 
> 2.49.0
> 

