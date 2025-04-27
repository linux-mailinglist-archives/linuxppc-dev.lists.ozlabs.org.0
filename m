Return-Path: <linuxppc-dev+bounces-8060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A11A9E306
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 14:41:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlmRd2k0Dz2yr3;
	Sun, 27 Apr 2025 22:41:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745757709;
	cv=none; b=F6dqqX6UPGpVxO1V/vv0G60iZ+y1vSjNgCkrp0fbbacuuNHrocMaXKZSM7vi/OnEqbQWfqQYOaNjuqm83vzXI3F4gS4I+MJHstuVhHx5x5SNiKwOLyybS7HNj9m1Rc+Gz+67wPTU6dlJQgLCLDWdJGvsRwu2Tjt5f2/REFhv7SG+U6cYGfq4STCVS2QJIPApEPz5/JW+oJNOLQgAp6HtGAPCl9cWDqJ02UUZUsgIvJoMgqdP0rNt9XL9RAPaHs8bLgsjNksLVTJeDZNy1uJFOsRf6RAQlvqjKlA3cI6pP+oxXqy4Pn5m29e5sem8DGXZrnT2FTGs0Z4aEcWAmDCOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745757709; c=relaxed/relaxed;
	bh=8B83JaeVQLHgFCWXWffwqUb0JmXK1uEo4GZHcdcva+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1jgdoMQ8Tk5klW/5r1iqo+15WPX3+BT4Jt/TVCkVaIEo94wKeSje/kR4MWMsDgC4pk1CIuMnVIIktjdy0kAj45dCitlWXtBVy9Hw32grEPGN94Xv9VQ2UOoVpLavoxirNXCt4RRaKWGFRnKC3xnOIUd2fniDMZ3fOlTQWyN9qq6gtAVtrS42oTrX87FVQ2slOCxo4JJ1ekwBhGIqxlcKN4mkCnAPR9bBzmJV4lnBziBx+zL1Zkb+FY+CmmDkYJPLAChDJy6VYmK4QRwawRz5gwaBqm4G/aW5cmcQaikBGzCglPgGw4sBC9psxmAIaq0BlK1dxtm9HkF1nu1CPclIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=LB/WZAlf; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=LB/WZAlf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlmRb10CBz2yr0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 22:41:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8B83JaeVQLHgFCWXWffwqUb0JmXK1uEo4GZHcdcva+Y=; b=LB/WZAlfGOzyKCTr/sq7hB3Rdp
	87DGEL/SX99F82X/5S3CEt+KMPNil4eQ5XKn9HKMnUxA4cfDf2PrRlmreWsvqfNqxji0Ahm+IqUQd
	wXdO33aEhGmFBOIXuWpE+8bZioYkuicGAN5B/jPJ2fK2P8K9cQiDFC/DlSxp1X3SHny4nVm15XAer
	aSB48aWcfnwfs22dSqJc1WnuG99u9FTL86VXIeZNZAw4NPoARt7CX+u2bzA4RtU1Kraqbddk4uCU/
	yAMqvxfq3a/ZkqN2tSwmIOwRD7TQsIjCpK6QaSzQIFGD7u7OUwRc33CrLVfbIPdhLP99OmnTsWDY/
	Uek3AdhQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u91KE-001OSo-2c;
	Sun, 27 Apr 2025 20:41:39 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 20:41:38 +0800
Date: Sun, 27 Apr 2025 20:41:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <aA4mAlozk3RvxvTe@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
 <20250427123514.GA1161@quark>
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
In-Reply-To: <20250427123514.GA1161@quark>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 27, 2025 at 05:35:14AM -0700, Eric Biggers wrote:
>
> Well, barely a day and you've already ruined my patch series.  Now instead of a
> clean design where the crypto_shash API is built on top of the normal library
> API (sha256_update() etc.), there's now a special low-level API
> "sha256_choose_blocks()" just for shash that it's built on top of instead, for
> no good reason.  You're also still pushing your broken BLOCK_HASH_UPDATE_BLOCKS
> macro that doesn't work with size_t, and putting my name on your broken code
> that uses it.

Your design is unacceptable because you're forcing the partial block
handling on shash where it's not needed, just as you're forcing the
hardirq support on everything.

I'll take your point about size_t and update the BLOCK_HASH helper.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

