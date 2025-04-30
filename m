Return-Path: <linuxppc-dev+bounces-8171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F47AA40EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 04:27:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnLgH3vdSz2yf9;
	Wed, 30 Apr 2025 12:27:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745980043;
	cv=none; b=fCxCVXfYXpII2VaNyQsiN20KXCZ2K/v5IjIzk9H5B3JjryVOPmbBaESAOWuJzTols5JXKZ+gYNUZ+EnQcDnedqUQkvk5u9TgcjGFsR1BLy2RDJpw8C//wG7e87m2tnltgC13l8dzno/TVdIZDiR+ym3u05LZEtndkoR8AHM5Vn8t8I0JpXR1pKsW0vha5mNjGCtpiptIM1/jiYzmyQl5Z/9om3rM/Ojq2UkS/x6JZYZS/3o5MtIvhnh051tZf7uF1xj1v67DJ9zJxBhk4cj4I8dlcU7kuj33jXLuvgCDxMKtefzjCtFm4KopvrwX+xj5pipn4ZIT3MJzwxgf/Q6k7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745980043; c=relaxed/relaxed;
	bh=k4QjAmh83yMZNLzUuAj1J5f4WZGw3kbBWCArSRYks8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTHvLrLKTRl1TFbzHEyfgcG3asE3LVj81hqFAVn4kVNR2q8JZDMPB3qsRCZ9xu3J8FyoxhiseLEdLvJbHFnRWb9DVkwmDBlRh0n7pCJ8D8+t76XTI4aeiutkrpYpk69KvbMCIbfUHT+OT2kGI3Zlqzch6Nky4hssYSQIUWqWcq19t18NccOddbFELeAtcltcaE9sfCu9Tow4jo6LqiyYZ6Vn6Q4V6z8m3YUX/bXK4DQnexPItvwSGwVzybWH0WnpGofGmJs4SYBhASjyMxdYRZvEIoF8PhUyx8oogiDubj5DQnouwAIDm1XaHy3BrNxpysrFbHQkLI3T4m9P3MQt9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Vieyc26V; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Vieyc26V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnLgG0jGhz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 12:27:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=k4QjAmh83yMZNLzUuAj1J5f4WZGw3kbBWCArSRYks8c=; b=Vieyc26VLhqz4zWnYRj3rYoyQj
	H0zpuIjmCDGV04Csn9F7DAzFr4VMNjSPrC0ttYmpV9ePC4GcLW04Gh2LQ1DfIxlqp8R2aL3ipQgqS
	Hoxj4/7XIQ9SP8MYTw9J6YxFRkgAmoixnyakr025Cu5UwmrQd+FkzC7jHq9Sv7Lbup88SHAX/kJOO
	gCZMT32Dh2FRvOwZvUtHvMWVDl4ZzRtgK+7mmLDbkUAE5fgD6/s5zMPyYWMNXS2Dyy648liRupOcp
	RncktiF2kCxxXhDi4UksWk66YNHf90reaqkRJHJIrq0moVeglYppY4Tl1LsVfkb0I0T9xlkGgF+Dz
	KZjeX6Og==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9xAJ-0028rg-2e;
	Wed, 30 Apr 2025 10:27:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 30 Apr 2025 10:27:15 +0800
Date: Wed, 30 Apr 2025 10:27:15 +0800
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
Message-ID: <aBGKg5bq0zLkhy3-@gondor.apana.org.au>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
 <20250429165749.GC1743@sol.localdomain>
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
In-Reply-To: <20250429165749.GC1743@sol.localdomain>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 29, 2025 at 09:57:49AM -0700, Eric Biggers wrote:
>
> To be clear, the objections I have on your v2 patchset still hold.  Your
> unsolicited changes to my patches add unnecessary complexity and redundancy,
> make the crypto_shash API even harder to use correctly, and also break the build
> for several architectures.  If you're going to again use your maintainer
> privileges to push these out anyway over my objections, I'd appreciate it if you
> at least made your dubious changes as incremental patches using your own
> authorship so that they can be properly reviewed/blamed.

Well the main problem is that your patch introduces a regression
in the shash sha256 code by making its export format differ from
other shash sha256 implementations (e.g., padlock-sha).

So your first patch cannot stand as is.  What I could do is split up
the first patch so that the lib/crypto sha stuff goes in by itself
followed by a separate patch replacing the crypto/sha256 code.

> Please also note that I've sent a v4 which fixes the one real issue that my v1
> patchset had: https://lore.kernel.org/r/20250428170040.423825-1-ebiggers@kernel.org

Yes I've seen it but it still has the same issue of changing the
shash sha256 export format.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

