Return-Path: <linuxppc-dev+bounces-8033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE60A9DE4C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 03:17:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlTG41JvKz2ym0;
	Sun, 27 Apr 2025 11:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745716652;
	cv=none; b=asFEkuf+aK75mhhBBS2zwABzNL90Q9rHlsvbwZ5k6YXXgtU20Q1XfDjgizxBCzn50fBDFdGiFD831k0MQpIIJczHuMB31BXpSVCLXAjuGHbRM/tsDiM3EDigZgrHM57fhNxGSkEXz00rLS0oT3WkEmJGcap5XjjP6D76bfWtVdLzk8B2DdOVeZXC61Cflr2CFdE+h86/w/FRQ0efH10XONz83q25K1rZWR4nzTSZRii710/0s+YNfZ395/WXGqP6A1DpjMwDN4tznoOlzotEgf5CSVLjKDjr1YM5X3JLJ36N8FdtW9129F3EqQSyOqRKh2jqM+efUoFOr5KFqvom9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745716652; c=relaxed/relaxed;
	bh=3F7iDEdSRBB2mSL+5QpO5w6bndUe8WQsHE1GcHOmdVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNM53s7zXmE0quivL6JYa6r++eQ+BcxpzUFy4BKEL1GZJOxASCK+mEMUl1WdiFWmbIlYjmxewQ17L0eAXXmVr8jUYOd5JeoXQ2mC6/Ee1wjWTrmHyqcEIrlpv+la3m7I4JWUXGEtbfpNhDxvx4PJVyrGnM4id/hwCicAvmcsQaLWr5r3NM6EwlN4z+tUC2/3Q0jHfdWp/B/24nfJJ1nWcDbxwELN5ALxy008Zc2SE65b465zG+OU3nNqKyugMmjgZqNumKeKu/fVvFtSJPehQdYxfl0qYwH5kMkwTVhjPe6OSsTFC5a+2kBFmW9kQOfF3tndrwvowAYsFSqSrqwFkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=O/r0niVz; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=O/r0niVz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlTG32gjLz2ylr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 11:17:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3F7iDEdSRBB2mSL+5QpO5w6bndUe8WQsHE1GcHOmdVw=; b=O/r0niVzoyOPfmEco/LPho1OAX
	gGXZ6INsJ4cKg8F+kqhcLeP1EXxcw67SKKTXtAYghFdkrDnWzOKvFToEc+FXMWFz+W5Kfn0d6Ha1v
	nmJArGe4ph0x2aoDazE7UTjfa1YdP1htxevT63zScgCUYo+6c0dDx1v7WR+XB7TEo9exFgzd5VNqd
	r0TVQdHeibdui8OTBHi7kfB5aY9rOS8YEXOKtdp1R5EKYF+U1zPv4G9zi4m+ESO/9A2yInPbZc+Gt
	hMr4wQQDBJIVBcyMMzH9rW+cWwtPJNGXlJWOdNbe5szGd3MGES9JjNOr8P/cWSx2hg8/c8kMhmAzz
	WlEHOoKg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8qe8-001JTp-1j;
	Sun, 27 Apr 2025 09:17:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 09:17:28 +0800
Date: Sun, 27 Apr 2025 09:17:28 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
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
In-Reply-To: <20250427011228.GC68006@quark>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Apr 26, 2025 at 06:12:28PM -0700, Eric Biggers wrote:
>
> No, that would be silly.  I'm not doing that.  The full update including the
> partial block handling is already needed in the library.  There is no need to
> implement it again at the shash level.

shash implements a lot more algorithms than the lib/crypto interface.
If you won't do this then I'll just do it instead.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

