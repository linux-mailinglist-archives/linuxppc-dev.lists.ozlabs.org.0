Return-Path: <linuxppc-dev+bounces-8062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895A8A9E33C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 15:11:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zln61222qz2yr8;
	Sun, 27 Apr 2025 23:11:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745759497;
	cv=none; b=WxuuBrwD3QwgGV3xFoU2JlHj4PoC/71v6hiWhNpGDx2EBJtMv4tJtLl0kiP+Tg2GjWYsfeMDx/MsMxyOP3BxwraXESNVWMln8tS+LC6KjOJgdvIT6TdCkgSWDXpIKpv8qaZt8eAlcrxf6uZHPDMM+zqLRjcyF85kLj4Mq6icPDyYbLv24et+M3tWy3mK/aBLiGsO/KJL87zMZzzaH3ysa4pI98dXrvMO6p/eNhaT2iTu+7ZZ1wpiKG8x8RBWP8Ed7i1/Xa1pHEgZkgH30xZZjDArjgR7lduQq/r2aw1dEJf+1rqSTdE69NmKvKsZNiUCI2nsHhcIQ1EdxNL/XLju/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745759497; c=relaxed/relaxed;
	bh=I2RcUQv/8dBIN2L2LWxeQcaAIEeCjjfBUxKcWps9ai0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGQCafbTjXdBj1kY6sTGHJeWIj3Ezxt363vlQgiwcEHf1UiHf1XhEGlpQJBXyLsdCgUQlYegBEf97jJglKfMeLBBKPxtdfXEPSgsvP/u+rnnOnDgQgl/7TuThaRCj872heq9Cgp+co2G3OV3f3eyWWNF/I7nzF+jpXItxFTAolsddzeu/sSfdZ8OzAqgcKEDVchswzU4guxZ9xG/yYCKkwW30Uu4CSx0wAXUNbpPIBfXplHDvNG0luqjVyfogQdUJUbAADPm69VGJg7rkgduLiOdjlJxDcdc7ElAJgwOW1FfL0GORy/szIKf6vYedzg6+HjG18jRst9nCISyz3a6cQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Js5eBBxo; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Js5eBBxo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zln603xlDz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 23:11:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 078886116F;
	Sun, 27 Apr 2025 13:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8414C4CEE3;
	Sun, 27 Apr 2025 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745759493;
	bh=hIg9xiL1wTkWBQvd+WTVpN2UA7enXw1novSCVk6FraQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Js5eBBxoHlcS56/LWyr45u7eRowNxoCYA6Md7I33bPaPRQLs3baLIHPlyTp0csghf
	 mNCXTEbu1yNMtMOT7JTf854tXYRVvArrq3HZEnVUBQlFqylkwky2LSYaFxEK8/Kw5X
	 Z/AcD9AseJYp4rgJMRwQ8XY9rmHzUm+sI/ac4vuLvW0OU9Ii9N2xfO9Puzy+QkAVof
	 Nyn3ibUt23OszHmj1FWPHbibu4rE+VmW/6hBdidH2RcSqJWI7TquPP9TueEjIP/oSw
	 /d5OvCZ/JlLLJjOP3DLWAlgxyVxgFiRpBDxeOK061Pq27N2K0t8Z0HoPDa2VNsTeb+
	 FuI4gqQiU6ppA==
Date: Sun, 27 Apr 2025 06:11:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <20250427131138.GC1161@quark>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
 <20250427123514.GA1161@quark>
 <aA4mAlozk3RvxvTe@gondor.apana.org.au>
 <20250427125641.GB1161@quark>
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
In-Reply-To: <20250427125641.GB1161@quark>
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 27, 2025 at 05:56:43AM -0700, Eric Biggers wrote:
> On Sun, Apr 27, 2025 at 08:41:38PM +0800, Herbert Xu wrote:
> > On Sun, Apr 27, 2025 at 05:35:14AM -0700, Eric Biggers wrote:
> > >
> > > Well, barely a day and you've already ruined my patch series.  Now instead of a
> > > clean design where the crypto_shash API is built on top of the normal library
> > > API (sha256_update() etc.), there's now a special low-level API
> > > "sha256_choose_blocks()" just for shash that it's built on top of instead, for
> > > no good reason.  You're also still pushing your broken BLOCK_HASH_UPDATE_BLOCKS
> > > macro that doesn't work with size_t, and putting my name on your broken code
> > > that uses it.
> > 
> > Your design is unacceptable because you're forcing the partial block
> > handling on shash where it's not needed,
> 
> Excuse me?  It's the other way around.  In my version the partial block handling
> is only in the library, not shash.  In your version you've forced it into the
> shash layer, even though the library does it already.  I understand that you've
> added support for partial block handling to crypto/shash.c and you want to feel
> like your work is useful, but in this case it's not, since the libray has to
> handle arbitrary-length inputs anyway.
> 
> > just as you're forcing the hardirq support on everything.
> 
> If you want crypto_shash to warn on hardirq usage you should just put a
> WARN_ON(in_hardirq()) in crypto_shash_*(), which will actually achieve that.
> Not add a shash-specific non-hardirq-safe low-level API to the library that can
> silently corrupt random tasks' SIMD registers on production systems.

By the way, as I mentioned in my cover letter:

    For now the SHA-256 library is well-covered by the crypto_shash
    self-tests, but I plan to add a test for the library directly later.

But due to your gratuitous changes where crypto_shash is no longer built on top
of the normal SHA-256 library API, that's no longer the case.

So while I do still plan to add a SHA-256 library test anyway, I don't see the
reason for not also making crypto_shash just do the right thing.

- Eric

