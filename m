Return-Path: <linuxppc-dev+bounces-8174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D77AA4110
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 04:44:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnM2V4FFdz3bVW;
	Wed, 30 Apr 2025 12:44:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745981042;
	cv=none; b=PNRO71Lc3XwwIQGFgSsq2nQEa+UEKaDy09J91k0QjBX43wABcHXkLT7D7lnwXPlC/mmVwmUm+pBWB+dQLu2TMw31uiPg1+TI8zbAGgW4gpbcT4bMpOyGHq94en+h5JIlOD1vzbdhczXfThW6Ok1jngytNLwQrPav39JCC+tQCoxvfU9XrwNbaOMwTSv4uMrnHOUKpP2Cp0IlXGN+B087w7+qHhTvIfepxlqch76hotZW9TXK6hE6r7kJfgkoJsD6IS0C9aRWRzgywbUI7Z0NS67PVBY8WTzXx0+kZXeoeuP1n8+RdVIxbdbxP7yNtOxuG2Xd/oX7HDLHSA8YC9nidA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745981042; c=relaxed/relaxed;
	bh=m9QkBZZevuauHxVFsy3Xp8pLr99dnXjzdN0XHxuFEuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBWS8Ot15cZlYH/bOcjdD8ZN4wCfxGvDgKRlzAvU6OuHz85XQ0Pk+R0HPLXFgdsX7PmaWDtg9UDRiVhmOBdP3m5/y37+w44YxlTkA8ZdJ8U4OBJOCBpWZqySJtrB11NUjEq0pSepLUvT0Tme7LBT/1EmVDrwwFnLv6mTnbTZZWCBzswy4ovvCgQbkKZaF8bPv8wSjRo1+8O0dE9ZKDpo3MHFH1Pn4WcbB1xgcD9bJ+Htop1hSj/67XH5eDuAa3FS/dG2Bl0Q3OjeW0di6a14mn0SxVJKNgg2zGo3L/QbFh+eeLyiLvZYqAYWq14TdTytyKmcBrUwgviBg3zNH5dNwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=slhfLJxH; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=slhfLJxH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnM2T3p5Gz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 12:44:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=m9QkBZZevuauHxVFsy3Xp8pLr99dnXjzdN0XHxuFEuE=; b=slhfLJxHOtOfQ65Qhl8JSbPCcb
	XqkmyPT58SSpWJ7pD9KS7SxPajdJZ4dHGDlXKtXsR8gTS6XQAFgAP6ZYpFU3rKnoW0/9byyYAwJ/R
	GD8f4Zg1TqF0P+e9AlHd9q6ggqDu+W9ZGp/7BGKVyH2/DYezWwEWFFHvPjZcG89v4s+4o/5l4DTdz
	uzFd2vqfrtvbZbuCXjHrgZ39HSV2EJU71upABqo3N09RZ1o6SSudTUB2KoCSfytn0eM8ufQZC7TW2
	SvSbDJ9gOEk9vkgraa8eIcRuXVysE5xkBgpzhM8QKW8NjaqdOEP80zLQHXmMTMUbtTJecf2EHL+D6
	4WxmKkyA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9xQU-0028z1-2i;
	Wed, 30 Apr 2025 10:43:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 30 Apr 2025 10:43:58 +0800
Date: Wed, 30 Apr 2025 10:43:58 +0800
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
Subject: Re: [v3 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <aBGObifCORhrBXz1@gondor.apana.org.au>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
 <20250429165749.GC1743@sol.localdomain>
 <aBGKg5bq0zLkhy3-@gondor.apana.org.au>
 <20250430023849.GA275186@sol.localdomain>
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
In-Reply-To: <20250430023849.GA275186@sol.localdomain>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 29, 2025 at 07:38:49PM -0700, Eric Biggers wrote:
>
> Nothing requires that the export formats be consistent, but also the fact that
> padlock-sha uses a weird format in the first place is an artificial problem that
> you introduced just a couple weeks ago.  And even if we *must* use the same
> format as padlock-sha, that can be done by using your crypto_sha256_export_lib
> and crypto_sha256_import_lib, without all your other changes.

That was just the reason of why I can't take your first patch as
is and then add my changes as incremental patches.

I do still want to bypass the partial block handling in lib/crypto.

But alright I will do it like this:

Patch 1 is just your existing patch + my export/import functions.

Then I will add the rest of my changes as incremental patches.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

