Return-Path: <linuxppc-dev+bounces-7778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ED1A930DB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 05:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf0q02x7Lz2yf3;
	Fri, 18 Apr 2025 13:38:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744947516;
	cv=none; b=l50gb9mm/TF47aYUEqLUZRNzYV8ZM2bxz9EA4Gjm+3ZPP3LrWaXLKTA2tzipgVCf2HJkV1AqqBq5TqRgv8oOsfACh7Kd9kbwe2DgYK4Iuev41gRSyuhOuSeWcxQ3WWFy0cJtBJFKYbZS5gbdxJmI65IVhHztLQhyB4gveA5jLAcVi/iCn8vLOrY6OW1uGlGuugnRJHgFnTxV653X9FqM/eirFhIwSjeFMuNCKV4u/gQRYiBRhydbflrJ50fwmioVQRMuZw6qhl1O3W4smGRrfgehIh6lsNr+wJsVbQyyfXVGuubclVNpCLorwcGPo85vJlgIxXQ47nAyu5ukzHFvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744947516; c=relaxed/relaxed;
	bh=g1/aC09ALOupd8pDTvROpyOLbulu3HVd8lVqFPnBvk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxxKA1LQKvr4ZH09vRwE+/EUFtThFrk5bUFgTB+6QwYG+VmrlXrDgPULMkPRP1OSnYuSiZDvgrwGAO4t0ZSU1bOQzRp9lC2exRYT9gKc90NMqcEb6v7G8reLwUWPzk5U4qGI55dNoZ3PvIrtRQGWFBMuHwe9iyOlFfxOKese//lN7s7Jv5u1yTrWJMfzu1utH8EX8qtDxU4+6eTIxWTLqPcm1zGEy7FrCqLxs2E7fnDo0OpHso3hGbxwx6FXDNJzoAerhJMEdjjhkWRbgPoLJ1Mlnla3qNggmYqERr/XZ4DANwn/knUNjC0aEFYciFO3c4v7U9rlzp4DPnA4GlfErg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YbV/7d47; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YbV/7d47;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf0pz5dHHz2ydx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 13:38:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2542E61120;
	Fri, 18 Apr 2025 03:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC94C4CEE2;
	Fri, 18 Apr 2025 03:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744947512;
	bh=JIccxkbUkJv2mhfcvak7GTlHD8kRGQhmDGq2CC/2MlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbV/7d47vHOJChB47qhZmb0CfoN/a3qx2MFQWBgheSbIGzLw0f2MlJ5Ku660xMDdN
	 T4loJYW/hWRNd0mew7guTwfHnu2tM8xDIubGn1ERQsyKxMx5ar2zFZUJ2Lrwbz6r98
	 yNZwbC1RlV+RdXfe82WOaIXpLWfmd2tlKB3jl32SbbQuj8P+fcZHE8UE6qTKi/BRn7
	 rRIzvkx8PAQGfQK9vD+DANxt4gQtM8rY6YozQ2Af70zxW9lO+cSmZlU7C5/oCMGSPk
	 yR8h1YTR/Hx45pr9O8JqluF6gUxSJfqBiXPtG8LY8J46QrYMhVbT8pMdKsD5QHusBf
	 izokyk+75mmyA==
Date: Thu, 17 Apr 2025 20:38:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <20250418033829.GC38960@quark.localdomain>
References: <20250405182609.404216-9-ebiggers@kernel.org>
 <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
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
In-Reply-To: <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025 at 11:24:01AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > -static void __exit chacha_simd_mod_fini(void)
> > -{
> > -       if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
> > -               crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
> > -}
> > -
> > arch_initcall(chacha_simd_mod_init);
> > -module_exit(chacha_simd_mod_fini);
> 
> Why did you remove the ability to remove the module?
> 

Well, I forgot that an empty module_exit needs to be kept around for the module
to be removable.  I'll send a patch that adds these back in, though I'm doubtful
that anyone ever removes these modules in practice.

- Eric

