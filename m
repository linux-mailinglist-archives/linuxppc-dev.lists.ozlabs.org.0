Return-Path: <linuxppc-dev+bounces-7779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9430DA930E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 05:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf0qF3Qy3z3bsY;
	Fri, 18 Apr 2025 13:38:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744947529;
	cv=none; b=WWY0PUXBmA9U1LVEpCJFkGjCyhQITtcghn/V0bij/h7myjTu8KebsXGzKu3ZlOkqZCN3Mfpu4ixZ8jBmie1QwWstaUaFlqazGPeE5HpcGVbJKYyweCBflqUja/5YVjucr34XETJ2Wknye1h1B1iUncpboE5NNMloCUXVevSDErxh1tLss9Nh7Y1KoP4C1IdN3s9N3w54BkP0Kte3x4OpDMICtDwIRqsjIHuYlwvVhue/ifKc9xbiBA39X55bneia/XqoWGNYIVnClVDpJZXUNIs/jYWWGguy87YhLmz26EiWul16RN5jjshMDihkXcPiAankriSe17D0LbcyMawSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744947529; c=relaxed/relaxed;
	bh=B5FIE5cHQYuMr1+LHfbtaiLujfedpAMdrckiF6Jw7wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIWTYCQQZjfH+ZGnoUuw7iFlNFKvDz2CT6vs/MQsvpD+dxhDryOew/iQFgemvKgnTNR9i7NflHptxsvFWuQP5u8BFXbzxT2kBMtUYb8TyqxDKf26o33ABBqmWHs6O8NfuLLy73Ii+cI2JrXEwOo1R6oA4jEhcCoNBUEbF3/WhNjGYcE828xAgQdWRlsYWOKu2P+G8PLPvKYEPQHvTOvAr8KGBfKfO5xusqHkY8Z4Qo9sl0Z/IbwacHL3hCZjUyDUWxOhuYtNaDhzvgj/DaLR2EoCDXQYlYE0E0uzKV5BGeVBeWD7nDqhr6PRJEe7jFRZOXwtX74ic3YbBeh2BSrGgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Sw/SPaiI; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Sw/SPaiI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf0qD5yk8z2ydx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 13:38:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=B5FIE5cHQYuMr1+LHfbtaiLujfedpAMdrckiF6Jw7wE=; b=Sw/SPaiIwN2XkEd3xx63jQvQU8
	6GooV8x5tQUoq0lZci9EL+Z/URNL5NnWrKhvkqhVIkw/wqqBHP0/AcSjEFSPQ08OCbpdQEziW4WA1
	BjhVGq+q4PPss7KWlPRXKYTEX7bm8DfxuHlxraHZYmYNuv0dCNhAsAPT6Kl1rqkEhAWv1Dg+1HRTK
	VrGJtSoHwAef6a+FxsIYM42MFza4Tcqt3RNsgJYu+qCX0A3O1uCxjhZ7cQLllWj6ZiWPQerfPZHPk
	ZzmdOqQcktgF3XJAIgaS7LwiTpMmJyNHj8iMjo5PylXrBp3FZ7Qk+tnZJ9BoNz2srhcV4TEiX1GCE
	b//mLDQQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cYw-00Geir-1h;
	Fri, 18 Apr 2025 11:38:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:38:46 +0800
Date: Fri, 18 Apr 2025 11:38:46 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
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
In-Reply-To: <20250418033236.GB38960@quark.localdomain>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 17, 2025 at 08:32:36PM -0700, Eric Biggers wrote:
>
> I don't think that would be better.  The 'if' would be up to 400 lines long, and
> it would be easy for people to miss the context when editing the file.

We should separate the symbols for Crypto API options and the library
options.  If you're worried about people missing the if statement,
how about splitting the file into two? One for Crypto API symbols
and one for the library symbols.

In fact we could move the library files into a different directory,
e.g., arch/x86/crypto/lib or arch/x86/lib/crypto.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

