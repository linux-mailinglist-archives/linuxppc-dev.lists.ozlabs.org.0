Return-Path: <linuxppc-dev+bounces-8029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01701A9DDFA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 02:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlRyc3vZyz2xrb;
	Sun, 27 Apr 2025 10:19:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745713144;
	cv=none; b=JuPUQCz2tuKgjt84en1fi8Z4DX3Sh5gthRJzuC1bMFRYNmleV8nA/4vuaTxH9Z2Jgqir3uwDTSFC5Ff11bIT6AlHKK6hA5KoITqcS7ygUzOOT5K+EX3pc/eoL4cDsFk3k/H+smOHfZkSY1lnnI2qonZFqCuU8bs80wpUTTPbGyg1koaQwuNtSjyGoiZOWXGqt+4O8KUW6+1ZaBN2flEAGAc48g5kJeSkDrW8HuSIHyoCNCKPGCjRegpvfMw11lFbybR80k0Por9Voqg3+fkK6cAvt9PnBRxRMNABv4ZJE/95x9zNiYkudL/DJNt+9SA1q+sYUTBlhnT3zvxztOBT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745713144; c=relaxed/relaxed;
	bh=qIc1CnqWjP+VDV+/eTU2C9hwQs+hAGsJroIHvnLDXc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz0Nj1mgT71RNlSW3kRoauOJFlf8w/wdEB7upxbH/TOKND4DY+uWmfkmQWRWjNLIQJIVbXfznL+/DhnZrywcLUW6cowWFalcAvONYyjzn6KlMli7I/E0PuVk5/aVsnZm01tjbNxO+IwGP5rBCJzVaueBLxYdRPq42yvLtj4YRrEuoLvVhmIUrOGousBIsJaMuRZmc1SzTVDeubJrLPX9O2urXPmvuOi0N+0aUM2U85EKUZ9M0hsT+AZBvpBJT81jMxH3+RuzDJHHLcCH+qF2AUD2mXddvNzIgU67KoNjDI+n15F+jT8mT92lv9Wqi6WclLrDe4ZsNOsOK3SWW1KaOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=LsUBruIG; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=LsUBruIG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlRyZ0bkKz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 10:19:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qIc1CnqWjP+VDV+/eTU2C9hwQs+hAGsJroIHvnLDXc0=; b=LsUBruIGAs9uLBJRTk9h6fgdB0
	2xisb0QqkU5+qP/eEYOH3uvK2DCnuZkERHnCECKmdbX85eZlMfmPqVki9sSxjYrxdWFAhjUUMsUD3
	P2JtdRMdBzT9y1/R7BdqzGhm5+HW6Qeftz51Y5755VFfohf8/0ee7AMDCj9lJUk5Fsi5cY7ScWSiM
	wAarhpfnk8TKu4CA4qEF5xdYMq88s0cnneBOdtKkePk/L0Ss41Ue/EHUkeraGj4GuqVbngWnxOuPy
	zGJVAmP3Tblrt5KCk9xwxPfx3IMbexqk44KkQviPivswZwKydYQtt5WMVkj4AP4WS2Vj5Wn0x9m7M
	CuGifb1w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8pjU-001IyU-22;
	Sun, 27 Apr 2025 08:18:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 08:18:56 +0800
Date: Sun, 27 Apr 2025 08:18:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 11/13] crypto: x86/sha256 - implement library instead of
 shash
Message-ID: <aA138IKjqyZeQLgB@gondor.apana.org.au>
References: <20250426065041.1551914-12-ebiggers@kernel.org>
 <aAy6g3nblKtRj1l3@gondor.apana.org.au>
 <20250426180326.GA1184@sol.localdomain>
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
In-Reply-To: <20250426180326.GA1184@sol.localdomain>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Apr 26, 2025 at 11:03:26AM -0700, Eric Biggers wrote:
>
> The SHA-256 library functions currently work in any context, and this patch
> series preserves that behavior.  Changing that would be a separate change.

I've already removed the SIMD fallback path and your patch is
adding it back.

> But also as I've explained before, for the library API the performance benefit
> of removing the crypto_simd_usable() doesn't seem to be worth the footgun that
> would be introduced.  Your position is, effectively, that if someone calls one
> of the sha256*() functions from a hardirq, we should sometimes corrupt a random
> task's FPU registers.  That's a really bad bug that is very difficult to
> root-cause.  My position is that we should make it just work as expected.

kernel_fpu_begin already does a WARN_ON when called in hardirq
context and it can't safely use the FPU, there is no silent
corruption.

In fact if anything your patch is making the problem worse by
making a hardirq stochastically slow with no visible warnings
at all.

> Yes, no one *should* be doing SHA-256 in a hardirq.  But I don't think that
> means we should corrupt a random task's FPU registers if someone doesn't follow
> best practices, when we can easily make the API just work as expected.

If you really want to support this, do it in the FPU layer, not here.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

