Return-Path: <linuxppc-dev+bounces-8061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5CCA9E322
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 14:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zlmmm0JcRz2yr4;
	Sun, 27 Apr 2025 22:56:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745758599;
	cv=none; b=BmblUb1ffRcY9jVnhFSg5nVRSTjWLhukYWuvzboqKpyP+aDUYLSORU1BM9WteW/KUWY/4yTXVQn6oqoviuIPluss9xEPa+EV0kjKrfCw+njoNoAjE4csJEH4zM6TzoapkEzbNHS8GazcqjYKJLnlZiHyWSJdUJnz2I3PYYeNCqcTcuytPQ/2yQuAZVGXZSsXsBwuXBhsuVTgXBQdxDyPXf4x2hJjSVJoUl4w6wrmz1gfZAS8tg7J4kY5W61MnC+1hSj3VBlWYo78DhWnriNF8BERGnXsut/llweP+QYYm6X2B19yzA5RU5a0BPMx+LtyXe7G40fxRGEfrvWzcnRfow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745758599; c=relaxed/relaxed;
	bh=rHSpiOueUoNTIkl27VuQyXCY6OcM3JqCwXOu2CmkJ+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QC7CyG6Xi3rBp2vGSLPvUDEC6Dsjt5sRRd/gCpdhbWLSje1y47A+oVed1mLGRxN2/Q9Z3oq38GtjYE55T0TT3vLXGi0SbRn/uB8kVlIcrGMcfCqGLdKXBPuNNZiUmzTgWZuyIcz+b0a/g4KVlyc4jIX4dDTwwEYzXQEm2ITGjzHmWtOfloguzJnDrlkvEc7pKmrv1bdaS3xUSZgeH+lk/oiqrkA9qgAKFCx/khN7CCXU9FeV8vi2GTlbD5kJAC39mPuZt4KZNkx19b0zhB0jajl6kNdnml0PAwjoT9fxhXB9QRw3Ki4jEHlSOlwbOxK2xMAxSsfjncl53P52fcQNyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qV/qYJtt; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qV/qYJtt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zlmml2Bdbz2yr0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 22:56:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFCA544F7A;
	Sun, 27 Apr 2025 12:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD42C4CEE3;
	Sun, 27 Apr 2025 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745758596;
	bh=AgqV1hMsSjVwY25pYZciWVxf7VAWpBvP9JfqHyR35EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV/qYJttnMqF/e8OqPLChbglT+OXe0BUI3C3XJkFZdTZhhNyHpOmlW5bb+1pxLyao
	 gwGGLC+l03/YlzGd5+J56KHsYr0ohKSxDi747S0hGoCacZJ2qaaZmYUqJ2US3FnkyK
	 Tu/o38Ex6SQrwWRr+GMMtqdU70l2SZNmFzlAG7PYaH28iELmPY1EI0osYVw1sYYhyG
	 uGzqeuOneXyF0+JHSk9mnATjjGPRJIaqEHig6iKUkyyMDrwIc+ilmnaGMs99Mvxqgv
	 8h/Ac2RS79Wo+V7nYuNH9MBFb5lhQYMARyeMIsV0ibobHTJbQn5pg36EgAkKZDDFP6
	 PxMIuzZeFmMsQ==
Date: Sun, 27 Apr 2025 05:56:41 -0700
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
Message-ID: <20250427125641.GB1161@quark>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
 <20250427123514.GA1161@quark>
 <aA4mAlozk3RvxvTe@gondor.apana.org.au>
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
In-Reply-To: <aA4mAlozk3RvxvTe@gondor.apana.org.au>
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 27, 2025 at 08:41:38PM +0800, Herbert Xu wrote:
> On Sun, Apr 27, 2025 at 05:35:14AM -0700, Eric Biggers wrote:
> >
> > Well, barely a day and you've already ruined my patch series.  Now instead of a
> > clean design where the crypto_shash API is built on top of the normal library
> > API (sha256_update() etc.), there's now a special low-level API
> > "sha256_choose_blocks()" just for shash that it's built on top of instead, for
> > no good reason.  You're also still pushing your broken BLOCK_HASH_UPDATE_BLOCKS
> > macro that doesn't work with size_t, and putting my name on your broken code
> > that uses it.
> 
> Your design is unacceptable because you're forcing the partial block
> handling on shash where it's not needed,

Excuse me?  It's the other way around.  In my version the partial block handling
is only in the library, not shash.  In your version you've forced it into the
shash layer, even though the library does it already.  I understand that you've
added support for partial block handling to crypto/shash.c and you want to feel
like your work is useful, but in this case it's not, since the libray has to
handle arbitrary-length inputs anyway.

> just as you're forcing the hardirq support on everything.

If you want crypto_shash to warn on hardirq usage you should just put a
WARN_ON(in_hardirq()) in crypto_shash_*(), which will actually achieve that.
Not add a shash-specific non-hardirq-safe low-level API to the library that can
silently corrupt random tasks' SIMD registers on production systems.

- Eric

