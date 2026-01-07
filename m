Return-Path: <linuxppc-dev+bounces-15393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF394D00053
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 21:35:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmft02lyZz2xpg;
	Thu, 08 Jan 2026 07:35:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767818104;
	cv=none; b=DRQEuTuNgu3g4UmZHWHcuYjZsy/A3shqz1looG51FMuzOkDJeBdascs875/wAGl09+Vw3FttrwhYBGgDvFRl8CNP++FfQFA+Eq3NFW1AKFHozr+O46Ww8539CBQhfGP5dMtzqF0YgQ8Kr1yxX/uPYtHDomRRYCDk8PB0T3S+jGgzK1jSZHZCQdTGox7T/t0Tb3ZZL1VzN3cSdeeMPg2JwHcDXCKreJ4T6wKm2NBifBKtBXfdh3H8F3Ql1TvYDGw4oAwK94/Fle+w7aQJJjiW1G7Z7s8TOxFExLjVvvz3v6ry0Gb0qwJeO76YCYzPXlCqN1MbW8HIv/1jNSGG4asCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767818104; c=relaxed/relaxed;
	bh=6uf35lkjp6D5y+g4oz8zOhU333GjfAcRx8LnY6QG1eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coE2cWX9bVU0QdapIet68eULa+gvooxyvuODk5GWvIWubbWr8VXlwvGQ0YX5CKtez+ufO9uX26fyRVWbI5/bO++ih7+CRbMdaC4W4wtMiVNQzvZusGDvrpLvySEwYqZODykZ/IE58pSWb83rSglN/u15ww8DQEJLydkR5G4EwrmOQ2SIZyo0celzo/3ag5hTUmz4llUHPV/fPvceywaAnR5Kcdweqrwzevwdg9gQmgpWm/KphXe3eu+AKFlRopxKMombrsQVTUgoRLb8++tW9SN3eQDmml8lf/3BpLX1Tl+9R/jzr3eOFO3Xk8pSTs4pbqd4IAFDYPwL6K6YlcZ+uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DrImanlq; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DrImanlq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmfsz4shLz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 07:35:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 523C841A19;
	Wed,  7 Jan 2026 20:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE70C4CEF1;
	Wed,  7 Jan 2026 20:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767818101;
	bh=vKhxxji3EawjSoSR0eYv3ESIoEzWRCnC8y7NrYlJoHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrImanlqQNEn8WqBqIPDAFwBghL1vkzPQ/Yb/fhl9jwCjpo9Bg2qJ2Kq56c0SOIJx
	 XEq9YTZ4bNnlJ32sMsDOJyCAA415rqCFHPJ7Dq2SsLw42f/fMNCOIFsQbOa7OX1FO9
	 cAXQtLJFygLKYp7EN85FvAo1cTsL5Ecvw0H3zHsLl5Yrwztkyk39kw0qOFSu/VrFZR
	 MMPySeQMcrSYFQxLrUZAnxci5iKikOA5vfK8QjUZRpKaDP3xX2C8Q6OVKsFJOL6dBa
	 vhyLQoEaQyvNP5SsYFkgsjtLwS9Zzx7yYNwFMHF4ryuQvbweSoz0KM95lJYISZHhOv
	 9TjiuqgHfQufQ==
Date: Wed, 7 Jan 2026 12:34:58 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Holger Dengler <dengler@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Harald Freudenberger <freude@linux.ibm.com>,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH 15/36] lib/crypto: s390/aes: Migrate optimized code into
 library
Message-ID: <20260107203458.GA2200@quark>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <20260105051311.1607207-16-ebiggers@kernel.org>
 <167cbd49-e0ba-4b1d-a724-e64ab6ee863c@linux.ibm.com>
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
In-Reply-To: <167cbd49-e0ba-4b1d-a724-e64ab6ee863c@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 07, 2026 at 08:41:02AM +0100, Holger Dengler wrote:
> Hi Eric,
> 
> first of all: happy New Year! ANd thanks for the series.
> 
> On 05/01/2026 06:12, Eric Biggers wrote:
> > Implement aes_preparekey_arch(), aes_encrypt_arch(), and 
> > aes_decrypt_arch() using the CPACF AES instructions.
> 
> I'm not sure, it it makes sense to implement this on s390 at all. The CPACF
> instructions cover full modes of operations and are  to process more
> than one cipher-block-size (*). For single-block operations, the performance
> might be worth than using the generic functions. I will look into it and do
> some performance tests. If there is a possibility to plug-in to the level
> where the modes of operation are implemented, it would make much more sense
> for s390.
> 
> (*) Yes, it's a bit uncommon, but the CPACF instructions on s390 can process
> multiple block with a single instruction call! They are so called long running
> instructions.

I'm happy to drop the CPACF single-block AES code if it's not
worthwhile.  I included it only because arch/s390/crypto/ already has
such code.  Since I'm making it so that the crypto_cipher API simply
wraps the library API, if this code is not brought into the library it
will effectively be dropped.  You had pushed back the last time I
proposed dropping one of the s390 optimizations, even a fairly minor one
(https://lore.kernel.org/linux-crypto/51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com/).

But I have no way to test or benchmark the s390 code myself.  If the
CPACF single-block AES en/decryption code isn't worthwhile, there's no
reason to keep it, so I'll remove it.

As for AES modes, later patchsets are going to introduce
architecture-optimized AES modes into the library, and the traditional
crypto API for those modes will similarly be reimplemented on top of it.
This patchset just focuses on the existing library API for key expansion
and single block en/decryption as a first step.  (As with the
traditional API, single block en/decryption is needed as a fallback to
handle any modes that don't have a standalone implementation.)

- Eric

