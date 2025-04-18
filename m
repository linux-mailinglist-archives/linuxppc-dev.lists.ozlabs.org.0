Return-Path: <linuxppc-dev+bounces-7773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A459FA93099
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 05:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf08C3BQ1z2yYy;
	Fri, 18 Apr 2025 13:08:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744945707;
	cv=none; b=eCkRmVNZJnzUGcBItOBPMZdgBbsGRxSVntVaX/qVZjXXcvqE2skU57YL0NmCU7pOGguzR6r50r7MtyPZP5cQf4Kg/Aud2+vkQrwU/g1sJohzb06aS0gSCOarJvw/MykfFJ8HqNLp7KfEfqE1pn1ezoZAMe86V3HX4zEBd8Y49ZDKGCqsZ28XcruAIG1GcLFRYFwyawQ7B89I7GUV4ggTr0Oq0juc5IGUHV9zGDkvQcjmm9tceG4jMJmzAiQa0Hk1HohH5HR3rizpE12B7IOvsCtlQ0oaOnCqt34LRB/esn8qPKQhJGrmDL5bxepFbB9Pb3KqMvqKICcKT8BITpzYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744945707; c=relaxed/relaxed;
	bh=cBam+4bEBq9fnDxk0jHRH2r9C5SS6Xd/ZiWHED3RBr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mu1HRAoF/9y/15e+8BO2T8k5eY3oIlHvMA6c9ARTflow8tcTMe2h1NPj6IE1lJjtUBmZQx5wW+G8CzhGYvs5kMaWyN5prgZrZsXwdFwi1TYxzhauykQxSs/EXRUT3VdQWS9597dj+5pRaM0TULrGQ2YBsXsbKDNQzhlPToy5T2OAFEw5LjoqfIpRQcpXWl32sHb08kfbmpohgxOb5A0KCYWlUP7cemzvWd7VAC3lhvrrkzv+MsALr9tivbvUPgcbDFvQP++HU7n4oSkyP62lm1v09GSgxXzFwj/JjKf02Q1iOvC90mvnqUIYme+iacKaSkp2nbFoSetiJPfHCnOydg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Ad2r1puG; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Ad2r1puG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf0893PJKz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 13:08:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cBam+4bEBq9fnDxk0jHRH2r9C5SS6Xd/ZiWHED3RBr8=; b=Ad2r1puGLU+Y1rwUeDUqRhU0qO
	F7pjd6bV7RlyG39Dh5jEkE+5Cipv8h36HNwxkd/OFyixIJ6MxLwR9Lt/xnU3YlHz/ccXTGPXLJ11z
	kX3xxqCi5uGmCYV3AHyIGc+2fpgfU0xkYxttXTLSSQsa6Jc5ReCdOCQ9EshaKh69QTcEXZ2QH0dKa
	OCpbpHKL9L5fZR/YOyt7Z/zLu4/L+bkrOc8irkMvNXS8hOyxoLHQDiLQZthliGKqYzCqrgP19jXwn
	M9Ki5L0y6D3/MVduXxafDI2dZEU2TwnJJVwxN+sGp+xGVKV7/8ahMXvoJGkt55Cxb+uJ6YEljyPno
	EUy5oI0Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5c5Q-00GeUL-2y;
	Fri, 18 Apr 2025 11:08:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:08:16 +0800
Date: Fri, 18 Apr 2025 11:08:16 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAHCIL_sYIS_1JQH@gondor.apana.org.au>
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
In-Reply-To: <20250417182623.67808-2-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org> wrote:
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 25ed6f1a7c7a..86fcce738887 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1753,5 +1753,7 @@ config ARCH_HIBERNATION_POSSIBLE
>        bool
>        depends on MMU
>        default y if ARCH_SUSPEND_POSSIBLE
> 
> endmenu
> +
> +source "arch/arm/crypto/Kconfig"

...

> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 9322e42e562d..cad71f32e1e3 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1424,13 +1424,10 @@ endmenu
> 
> config CRYPTO_HASH_INFO
>        bool
> 
> if !KMSAN # avoid false positives from assembly
> -if ARM
> -source "arch/arm/crypto/Kconfig"
> -endif

So this removes the KMSAN check.  Is it still needed or not?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

