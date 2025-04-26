Return-Path: <linuxppc-dev+bounces-8028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EBFA9DCBC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 20:03:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlHdM1yfmz2yPd;
	Sun, 27 Apr 2025 04:03:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745690615;
	cv=none; b=AIBFI5qrAkd4eKcFpckvP10f39skh/mqlv0f0MrkKyUWA46nGLLeq6z6cL0rHT5o/MOy4Y5nRkP3UbeO7eTpr0YZTv9Dp1IXGCe1p9XUNfBA12j1CJAlOSa/UQhYRfIY4693RUEikU0G4hjl5AfLvgivTQqezlIy4iQ6x8szE0lNrOzmVBsjFFEBX6pi3kODyWCvKiTHbOLjXzQRwSQjUGtvYQWWxzTSe2xAR83Na9j0v6klzwZQvpmdlvLVlvmJh/psmbPpTZzgrS60cuHLX2Q8A6VLi2ouBGuoBhtXE5hkbLFM/O6zKCLytqN18hhUd0PVLH70mSi8999MEO/6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745690615; c=relaxed/relaxed;
	bh=Oo4JdOmDlpbxDOAUm42LDGfnVqBYFAjDDVr/rEREloo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9Pabq2sWUsqKp0ylCPceAOfCYLkA6YgaptLGMYNDIU/eKFEV+C+9PvUgZB4WaPAQbOZAQ7noC19/dFfcOGT+8IwGmJpvEMeHAXlaDraYs5/gS74XZUM3DdIVvgcBrNyf7yL3GPNHo0pV73c/Jw30WVah/Sd2LKsOnUZ7n15q1VcA+VqJLfOpXGqOOLHvbvAMBUUgSFv7k2Pgu78e4TBd3QPAGcrm3jGlIT3GhJZtIMwqlRvVyiBREyt3PyBcv7ptjlt/csJTjgGdVE1QIsbMOljcLx7dKGSrj4QSxyRd8erSAF0a0x39OgjGduPiss8pTQi0oDp1dS7DZFcZNr07g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nAIxHEC/; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nAIxHEC/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlHdL37gDz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 04:03:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13AE16115D;
	Sat, 26 Apr 2025 18:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C994C4CEE2;
	Sat, 26 Apr 2025 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745690608;
	bh=thPYajZSkuIUqKSQ0PKrjdP700DcSK2zwAu2Gky2T80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAIxHEC/RBFXC7YAAr3+tsr8rzEcee3Oga1vMPOVdLEclJGRGGYsap6d40ssYdREa
	 631y8iWvrWajenPInP5JKnMuJ2fzsFVn4xbQ/K+cHhgPVnyuchNRRoD0ozvKffZkS3
	 MqUsr8paPOUnFmn+B8HDI8yKlJGh1TXUf3fq6tuJ1SIjPZir6nq73386jFGlYKnBTI
	 uo2ZHr9L3pkwpshwb0rthNh+eao6mVOKjQYtoSDUrpgKEgzJXu+h6VzFzy4Z/K4auE
	 MgMeah9RtM9RNppv7fmQMq0y8aXytAvAE0U5aitXE09LbzHtDgGADWAkJrVYOWn55s
	 dQXkKhP5hQ5yw==
Date: Sat, 26 Apr 2025 11:03:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 11/13] crypto: x86/sha256 - implement library instead of
 shash
Message-ID: <20250426180326.GA1184@sol.localdomain>
References: <20250426065041.1551914-12-ebiggers@kernel.org>
 <aAy6g3nblKtRj1l3@gondor.apana.org.au>
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
In-Reply-To: <aAy6g3nblKtRj1l3@gondor.apana.org.au>
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Apr 26, 2025 at 06:50:43PM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > +void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
> > +                       const u8 *data, size_t nblocks)
> > +{
> > +       if (static_branch_likely(&have_sha256_x86) && crypto_simd_usable()) {
> > +               kernel_fpu_begin();
> > +               static_call(sha256_blocks_x86)(state, data, nblocks);
> > +               kernel_fpu_end();
> > +       } else {
> > +               sha256_blocks_generic(state, data, nblocks);
> > +       }
> 
> Why did you restore the SIMD fallback path? Please provide a real
> use-case for doing SHA2 in a hardirq or I'll just remove it again.

The SHA-256 library functions currently work in any context, and this patch
series preserves that behavior.  Changing that would be a separate change.

But also as I've explained before, for the library API the performance benefit
of removing the crypto_simd_usable() doesn't seem to be worth the footgun that
would be introduced.  Your position is, effectively, that if someone calls one
of the sha256*() functions from a hardirq, we should sometimes corrupt a random
task's FPU registers.  That's a really bad bug that is very difficult to
root-cause.  My position is that we should make it just work as expected.

Yes, no one *should* be doing SHA-256 in a hardirq.  But I don't think that
means we should corrupt a random task's FPU registers if someone doesn't follow
best practices, when we can easily make the API just work as expected.

- Eric

