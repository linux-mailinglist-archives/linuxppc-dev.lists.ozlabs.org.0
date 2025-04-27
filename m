Return-Path: <linuxppc-dev+bounces-8030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1615A9DE2E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 03:02:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlSx535Wsz2yhv;
	Sun, 27 Apr 2025 11:02:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745715769;
	cv=none; b=eMgVhPpcI8dWv9F8rCxVew0kZuDuZgFzdR4gqwlu2UBIwXqFARz1DD62wswkGrqlWVTZecvjSrRZbF7zl9atE/VUUd6vAbQfe3cSGkIPtnmPtwxIhzN6pKhxOQiNCtbnXFsPQ202OLsoUK/hKzK5eFwSn7fIwrmAtYCITrVFYuPg6lAA8wXdOoTA+k07Xs/c1FIxTWkcDhBT7W9vBT7DkYVenVDBVmFSiqNtX47dmkU8ZyyU7VujDWbUC2K0yEmYEu+HhCG2zobpHZf3VMEwP9YzzBuOeA+SPNXrAnZCKrgeSgBRzsP3KPYk82nUlt3NQyaF625aNXYzDzOazkFR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745715769; c=relaxed/relaxed;
	bh=lhZqNPK+3qur5KT4zF1H9SCOT7iiZxQ3shEb0zor8do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wc+iZ9m3agnjN8vuWN8FYU00/XJ8RRDxozK8uebnkx4FKMJRUzZkDC05oG+fLjD0zyhx25gpOqXnCBKxuwQpOUNT4zLZdSxId5ngLdv5CDWmgpDY6UVmsxpYU28P3kQFcitxfrxAdZCLSPIFp8i8wPm5GnN9W6+V8Jl4JSYxxnLFqcqbs3P5NmaWkA1yl4mf6MpJNGDhBAsr4mB1faIiAO+kdmY97m9vafWyY5IK45WhRVtQ5+1ESawDRKuAULX9eudpN/bp2iPxZgEvYOyqbpAokud3F2fT46bvhmavGuO0Hm6KC+4LiCWwyAR3XdD9t24ryWlpxgzZ/qLURBmK4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bPyZLOlv; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bPyZLOlv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlSx401vvz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 11:02:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A6B45C5B40;
	Sun, 27 Apr 2025 01:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A008C4CEE2;
	Sun, 27 Apr 2025 01:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745715765;
	bh=MwWC0ebZT3d3MlgdSCMljk/IiWQqDJK/sfFSFFVgLjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPyZLOlvkggv+3wlQaPSM6gxDYFrytafe2vABHHUGe/DW28h51dobXwpP5JnZZv8e
	 siueA/NSLIi8nuwG9dfsk1681ilJovb4Z29iknbvMhR8GPTRbN0ZVeKBFFKZOwwljj
	 3U9QNUIWg3TN3LjeAfIWIWZYU3/vTYkS431OGKS6sxinbT9y/6X+clr/wOAXFX7E2r
	 VeFF9mnbIdUIuH/fv/IyMBN/ULQFSIccwdyDW2UT7HFOKtoe4pSnJMpfS90ZAD5CqB
	 IjZesituwcBevS0RAxopmnZA/CE/trjgjd8Bsfakzob1TBrOKKYrpOqivjGk4OuyjL
	 pu9aEs4XUVNSA==
Date: Sat, 26 Apr 2025 18:02:48 -0700
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
Message-ID: <20250427010248.GA68006@quark>
References: <20250426065041.1551914-12-ebiggers@kernel.org>
 <aAy6g3nblKtRj1l3@gondor.apana.org.au>
 <20250426180326.GA1184@sol.localdomain>
 <aA138IKjqyZeQLgB@gondor.apana.org.au>
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
In-Reply-To: <aA138IKjqyZeQLgB@gondor.apana.org.au>
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 27, 2025 at 08:18:56AM +0800, Herbert Xu wrote:
> On Sat, Apr 26, 2025 at 11:03:26AM -0700, Eric Biggers wrote:
> >
> > The SHA-256 library functions currently work in any context, and this patch
> > series preserves that behavior.  Changing that would be a separate change.
> 
> I've already removed the SIMD fallback path and your patch is
> adding it back.

While you've been pushing out a lot of random broken changes to shash recently,
the SHA-256 library functions weren't SIMD-optimized until this patchset.

> > But also as I've explained before, for the library API the performance benefit
> > of removing the crypto_simd_usable() doesn't seem to be worth the footgun that
> > would be introduced.  Your position is, effectively, that if someone calls one
> > of the sha256*() functions from a hardirq, we should sometimes corrupt a random
> > task's FPU registers.  That's a really bad bug that is very difficult to
> > root-cause.  My position is that we should make it just work as expected.
> 
> kernel_fpu_begin already does a WARN_ON when called in hardirq
> context and it can't safely use the FPU, there is no silent
> corruption.

Only when CONFIG_X86_DEBUG_FPU is enabled, which people don't enable in
production.  And even if that is enabled, it's just a WARN, so the registers
still get used and corrupted anyway.

- Eric

