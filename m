Return-Path: <linuxppc-dev+bounces-13047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCC5BEDF44
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Oct 2025 08:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cq8Mb2jS8z2xS9;
	Sun, 19 Oct 2025 17:50:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760856635;
	cv=none; b=YtyeHQFA5DBxW5yTgaNlDLejFr79NuNmmQ74h6AZBlvcgwtOFoKWVSS6KjugWvjBopIL3+6TKJ0HOkYWs00jDEyP9Boe9YHHy5reJTABqZ9pDAca6tCdAn9qW/sVG8taZQFLmnIhzRCl5n/dFTByBywk5isBBttRpVtOTqrfjUENuPP6Aa6UrrhXo6jHJJwFluxlwpca7bgwv5RnofBEN2fo6z/uEKmYPlT68saFHH2+BYQxdfFndeFUGmojJ9q/BnfzNQVX5yl9cUExxLRYFBE236bubjrVSgXAxf/eOdaqt95E5pxyLUdeN3QdwJYTAOoHu+c/wFLM9mbKds1Q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760856635; c=relaxed/relaxed;
	bh=7/8vLtaYtmPZs1oOh1CSMVVaBxjkTTVakzN4rmk7kwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eC4kWkB8FRTpjwJ+enVYg28PCrN9BFcANtmri4WGeOuyf8Ep+CHEIhSSCS4bqsmYrmW8d17/XBdlShOEDpnib74lpePcel1hjTs1FtLSisMPprYqUN6ZOCA0pI78ZFsMH6QoRm9zGMonG7+fcOjkpSzPpk9re+o1FAgcaKyEELNPmrq9B0dE8JRh6eovFNVLDe9K23pSbWDw1zePnDbZDa0y7YW7zHTaryBkDl3xKmzOlkzJAs2b9LrwblIMDi+gk4UMmIIBvjR1rsnDJWkC/0NDUZN0kEJ3qfzB67Qr17hyUuipbOuP/hjU5n3oYnxTDYoJMzWnu1AIzN7IQCDibg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cl0KoSN2; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cl0KoSN2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cq8MZ12SNz2xR4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Oct 2025 17:50:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A755140A5D;
	Sun, 19 Oct 2025 06:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F25C4CEE7;
	Sun, 19 Oct 2025 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760856630;
	bh=EdgpjTa5vPTpdpYEzLk3B3e9bf5d6qYFWAfS+EwNqnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cl0KoSN24WldfEYSRSfu5lozmGJAVE9xioGE6C+PBBseYSuE/7hgf2KbKvxu1nAfq
	 +AnxTaK9VaE7xdn62r2Zk9oFnNMs7lSpecdggsfr9Z5mfbyraggVUnrWZwla30ASHd
	 TTQUKVBXbjDXmyKfOdXMojvKQKorenot/jpefXad8wpoUyJQ/gWBwcSUSTx6MlFUkq
	 O4BqR0RMnSAfMnvUpkN7wKJhQIsaUmfqwAekVS20NwyN/940rzzKb69Mu6Ni7vQrxn
	 4PzVEO7y+ixH5H5iambi/6vum/20jOqyGoZB3A2tTRPyBtt8DjbzWrov4g4xwvEbN2
	 ljhF5KLlm27vA==
Date: Sun, 19 Oct 2025 02:50:21 -0400
From: Guo Ren <guoren@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 03/17] csky: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aPSKLRnWUAVSGQjF@gmail.com>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-3-kees@kernel.org>
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
In-Reply-To: <20250804164417.1612371-3-kees@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 09:43:59AM -0700, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add missing __attribute_const__ annotations to C-SKY's implementations of
> ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
> functions that always return the same result for the same input with no
> side effects, making them eligible for compiler optimization.
LGTM.

Acked-by: Guo Ren <guoren@kernel.org>

> 
> Build tested ARCH=csky defconfig with GCC csky-linux 15.1.0.
> 
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  arch/csky/include/asm/bitops.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/csky/include/asm/bitops.h b/arch/csky/include/asm/bitops.h
> index 72e1b2aa29a0..80d67eee6e86 100644
> --- a/arch/csky/include/asm/bitops.h
> +++ b/arch/csky/include/asm/bitops.h
> @@ -9,7 +9,7 @@
>  /*
>   * asm-generic/bitops/ffs.h
>   */
> -static inline int ffs(int x)
> +static inline __attribute_const__ int ffs(int x)
>  {
>  	if (!x)
>  		return 0;
> @@ -26,7 +26,7 @@ static inline int ffs(int x)
>  /*
>   * asm-generic/bitops/__ffs.h
>   */
> -static __always_inline unsigned long __ffs(unsigned long x)
> +static __always_inline __attribute_const__ unsigned long __ffs(unsigned long x)
>  {
>  	asm volatile (
>  		"brev %0\n"
> @@ -39,7 +39,7 @@ static __always_inline unsigned long __ffs(unsigned long x)
>  /*
>   * asm-generic/bitops/fls.h
>   */
> -static __always_inline int fls(unsigned int x)
> +static __always_inline __attribute_const__ int fls(unsigned int x)
>  {
>  	asm volatile(
>  		"ff1 %0\n"
> @@ -52,7 +52,7 @@ static __always_inline int fls(unsigned int x)
>  /*
>   * asm-generic/bitops/__fls.h
>   */
> -static __always_inline unsigned long __fls(unsigned long x)
> +static __always_inline __attribute_const__ unsigned long __fls(unsigned long x)
>  {
>  	return fls(x) - 1;
>  }
> -- 
> 2.34.1
> 
> 

