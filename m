Return-Path: <linuxppc-dev+bounces-7683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32106A8B2E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 10:00:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZctkQ3KB8z2yDr;
	Wed, 16 Apr 2025 18:00:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744790446;
	cv=none; b=ZJ1Y6qeUrW7Q4aShuZ8ta7OBplJwL5Je7KlpoUNGer1xpn2oG9J4/kxjT+9zvg8V4JWCRvA2A2GDBAFuEm4Tgxd+7TXKKgbvv7WhyfqPm4We9g+T1TioN/Su0ckHJIr8xXwv++7/iJRv7DF3a/SOtnAJA0vtjQZR2lNHKDfk31zu8aw29CP5TnvZtwANozyhfZ/ffW4WzhRQAfLMqiYn83LBexVJWeR0d2TGbP0M0LJrmmWBer4Llk1IPfHpk3JI5Dzbh57xTsJiBtcMqUFgIvFcDgqPDQ/HQIEwwfoLKWUBi0iNFIswps9W0SGCtsb959pNiqM7R2hiY71Rrw+v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744790446; c=relaxed/relaxed;
	bh=CxllXsS7oZKhmgl74o8BLeNmMQKxBZycllNwlO7QoVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=J/eMGko/f0QGPlCgXcUCnRFduyzVSOWG5MLX3Ev0jYBuZvagDL4ZiBr6kXTpe/tdGLQtJWXu8xH+Dqcdvn+NQgKvTPyvboY8RWJcP2xcnspNY2SJWP3A65BU/3z8zlCRh9qyHrascPDNNMSTSWB1ogvLUQzrWGBvttvJO5C7sKwKt5S8FdfZq0wf88VOFVHDQ16j6OnCHBgAuIu77tiusMo8KkvRYPXUOShdk2LKaBz/MUgvmY/O9Uexsq3ZDtMRRjCdaXxWLT4fbYFyCPNIm0NfeWVpK3M99VRICYtwqV95KXoCB26RSLoBQzDgALfPFAV66kDRu47A4hdZOjLJXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=p6rOFRuB; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=p6rOFRuB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZctkP69YMz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 18:00:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CxllXsS7oZKhmgl74o8BLeNmMQKxBZycllNwlO7QoVM=; b=p6rOFRuBNqBL9Vs+KMLwfIwpaW
	yz/TUWI06KiYLjDOWRkW1thUO1NCa0FsczE1IdP8yWQJuNPoj7zLoeTV/bcNnNzwnrrQZxCAF6hWN
	rR3nya2bEWTJ06hsRLUYISaUNvMGmmJL2xQjFg9UXnzbuNs+F3O8tZDTNTPjcwkWcdfZbNyJ4y44h
	MNkHBN0Q6sxrv8XtbZop2V1nmDZtMJY4YBCj2ZV5ufdu+NQuPvRjnUCx6msKVoK7FpDyGaHfZtkeJ
	fVmHWHaHPram2mO/vEo3QW8W7xM+RzwRRrwC4Eq7LpM/nK/62FTZQlA3nyOmTRNvV4g+dWKgbKTzE
	D7ct5GZA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u4xhH-00G7yK-1U;
	Wed, 16 Apr 2025 16:00:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Apr 2025 16:00:39 +0800
Date: Wed, 16 Apr 2025 16:00:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH 0/9] Remove per-architecture poly1305 shash glue code
Message-ID: <Z_9jp6J6YKImbzyg@gondor.apana.org.au>
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
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org> wrote:
> This series removes the per-architecture poly1305 shash glue code and
> re-implements the poly1305 shashes on top of the Poly1305 library
> functions.  This ends up being much simpler, and it is how it should
> have been done originally.  This follows similar changes to crc32,
> crc32c, and chacha20.
> 
> This series also makes the Poly1305 library be optimized on PowerPC.
> Previously the PowerPC-optimized Poly1305 code only supported shash.
> 
> Eric Biggers (9):
>  crypto: powerpc/poly1305 - implement library instead of shash
>  crypto: poly1305 - centralize the shash wrappers for arch code
>  crypto: arm/poly1305 - remove redundant shash algorithm
>  crypto: arm64/poly1305 - remove redundant shash algorithm
>  crypto: mips/poly1305 - drop redundant dependency on CONFIG_MIPS
>  crypto: mips/poly1305 - remove redundant shash algorithm
>  crypto: x86/poly1305 - remove redundant shash algorithm
>  crypto: x86/poly1305 - don't select CRYPTO_LIB_POLY1305_GENERIC
>  crypto: poly1305 - remove rset and sset fields of poly1305_desc_ctx
> 
> arch/arm/crypto/Kconfig                 |   6 -
> arch/arm/crypto/poly1305-glue.c         | 170 ++----------------------
> arch/arm64/crypto/Kconfig               |   6 -
> arch/arm64/crypto/poly1305-glue.c       | 143 ++------------------
> arch/mips/crypto/Kconfig                |   6 -
> arch/mips/crypto/poly1305-glue.c        | 120 +----------------
> arch/powerpc/crypto/Kconfig             |  11 +-
> arch/powerpc/crypto/poly1305-p10-glue.c | 134 ++++++-------------
> arch/x86/crypto/Kconfig                 |   8 --
> arch/x86/crypto/poly1305_glue.c         |  99 ++------------
> crypto/Makefile                         |   3 +-
> crypto/poly1305.c                       | 153 +++++++++++++++++++++
> crypto/poly1305_generic.c               | 149 ---------------------
> include/crypto/poly1305.h               |  13 +-
> lib/crypto/poly1305.c                   |   2 -
> 15 files changed, 242 insertions(+), 781 deletions(-)
> create mode 100644 crypto/poly1305.c
> delete mode 100644 crypto/poly1305_generic.c
> 
> 
> base-commit: 3be3f70ee95da03a87d94c4a714ee679a5c7b34d

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

