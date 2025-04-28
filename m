Return-Path: <linuxppc-dev+bounces-8099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305FA9EFB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:53:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmMK562Yhz2yrn;
	Mon, 28 Apr 2025 21:53:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745841193;
	cv=none; b=BT1bDCuG7beq1+lKAPzehWj+sPHiCihXJEbkGbfzi5cvOOe68yy339Z4ooLxz2Ch4sFR1v3onQcxwpzOmWo9P7j6sa030mTzi4d9e3DFYSoF7uMZVtBA0Nr0TH9yawauw5CTeOWwgMILRDKcsrfuDorbE+dwmk6zWL5yyoM07BNU0Ib5jcL4MSw/1QsQUUymoOMsEdRjTbkoq0yZgKP8Tgos1I2DLu3uPYm7zIagzDXQWOPDXSKWDLGOxAub/B65x64LzKf7xrau/yD2ROYGO6lHfibMpjW+6UjczVVQKNTT5/v3KoWh6ypZKXwYq+woZ/y20ocpGK/DmkUkaPO+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745841193; c=relaxed/relaxed;
	bh=8T1VCs93WeCfIwMLTXrgNJ1jyLMDpCR3K8Uym9nsnV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ndLeUY22cnmoQOXm1KZ8LeO86gtD+6dHqWLJvaohld/MmE0FNdyokOtjptD0EH9Y6BIQNfeAqLA6RwTWzA4OTB4TB1QSUG3sDQe5cql0GGMhKSXD/PqEMd7wXA0D5lsH+vSu6xD5XPaCrB7RaU/qwt2HBSauKcdQkveb3RE0duyYzByrpLw8ZH8SOJn+/tX692O5YJwAcIA3Mt6xTShbz29ZL99oU7BvXQVMrY7Mf7tXOjXLsPD5L++4wRPWBNrwDFfLT+y5LS0t/lK5SOL01UHIrxfOM6mZFIiUUB7eHAIZkEByb11viUJ8HES7BwTqNFLjq1k8CdehovzZfbwP7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=F9HnbTnW; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=F9HnbTnW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmMK44L8fz2yqW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:53:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8T1VCs93WeCfIwMLTXrgNJ1jyLMDpCR3K8Uym9nsnV4=; b=F9HnbTnW/poPgQVr/cZWd+pwSz
	2p1UYqYxeKKqwA8eoU4d9x1FUmWqDFUKj4m1rUYjb/NZ9L/ay2spOHSOBLPXjjOkgGBjoE2P9jaY0
	SO6fLRcrPnA4AqqV6iTh6DthFMKWQ5y+2BNRYeq6kcb0mNigo2TQnP1X+8q2t4Cf/E71Dp+6Lc2iG
	rTQFgMhEtDcoE4KDOvGEy2T8moHCtm+9KViSFwmLwa/1cvp4ub/24zEUUuztEGO5LleSISGHI99Tf
	g1Z9Vys8EoAA69OOsZwOKwArWjMhPqhm7YMnEeA5etXfn6zfP8eJ1HnmeULhjUSmQB4vIUfCLIheP
	SY6L1ryw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9N2q-001bJS-2Z;
	Mon, 28 Apr 2025 19:53:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 19:53:08 +0800
Date: Mon, 28 Apr 2025 19:53:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH v3 00/13] Finish disentangling ChaCha, Poly1305, and
 BLAKE2s from CRYPTO
Message-ID: <aA9sJKUjfhRPMWSo@gondor.apana.org.au>
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
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org> wrote:
> This series removes the unnecessary dependency of the ChaCha, Poly1305,
> and BLAKE2s library functions on the generic crypto infrastructure, i.e.
> CONFIG_CRYPTO.  To do this, it moves the architecture-optimized
> implementations of these functions into new directories
> arch/*/lib/crypto/ which do not depend on CRYPTO.  This mirrors the
> existing distinction between crypto/ and lib/crypto/.
> 
> The last two patches remove the selection of CRYPTO by CRYPTO_LIB_CHACHA
> and CRYPTO_LIB_POLY1305, and they remove the corresponding *_INTERNAL
> symbols which were needed only because of the entanglement with CRYPTO.
> 
> Note that Curve25519 is still entangled.  Later patches will fix that.
> 
> Changed in v3:
>   - Fixed build error on arm with CONFIG_CPU_THUMBONLY=y.
>   - Small whitespace and commit message fixes.
>   - Added Acked-by's.
> 
> Changed in v2:
>   - Introduced new directories arch/*/lib/crypto/ instead of keeping
>     the library functions in arch/*/crypto/.
> 
> Eric Biggers (13):
>  crypto: arm64 - drop redundant dependencies on ARM64
>  crypto: powerpc - drop redundant dependencies on PPC
>  crypto: s390 - drop redundant dependencies on S390
>  crypto: x86 - drop redundant dependencies on X86
>  crypto: arm - move library functions to arch/arm/lib/crypto/
>  crypto: arm64 - move library functions to arch/arm64/lib/crypto/
>  crypto: mips - move library functions to arch/mips/lib/crypto/
>  crypto: powerpc - move library functions to arch/powerpc/lib/crypto/
>  crypto: riscv - move library functions to arch/riscv/lib/crypto/
>  crypto: s390 - move library functions to arch/s390/lib/crypto/
>  crypto: x86 - move library functions to arch/x86/lib/crypto/
>  crypto: lib/chacha - remove INTERNAL symbol and selection of CRYPTO
>  crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO
> 
> MAINTAINERS                                   |  1 +
> arch/arm/crypto/Kconfig                       | 23 -----
> arch/arm/crypto/Makefile                      | 14 +--
> arch/arm/lib/Makefile                         |  2 +
> arch/arm/lib/crypto/.gitignore                |  2 +
> arch/arm/lib/crypto/Kconfig                   | 24 ++++++
> arch/arm/lib/crypto/Makefile                  | 26 ++++++
> arch/arm/{ => lib}/crypto/blake2s-core.S      |  0
> arch/arm/{ => lib}/crypto/blake2s-glue.c      |  0
> arch/arm/{ => lib}/crypto/chacha-glue.c       |  0
> arch/arm/{ => lib}/crypto/chacha-neon-core.S  |  0
> .../arm/{ => lib}/crypto/chacha-scalar-core.S |  0
> arch/arm/{ => lib}/crypto/poly1305-armv4.pl   |  0
> arch/arm/{ => lib}/crypto/poly1305-glue.c     |  0
> arch/arm64/crypto/Kconfig                     | 17 +---
> arch/arm64/crypto/Makefile                    |  9 +-
> arch/arm64/lib/Makefile                       |  3 +
> arch/arm64/lib/crypto/.gitignore              |  2 +
> arch/arm64/lib/crypto/Kconfig                 | 14 +++
> arch/arm64/lib/crypto/Makefile                | 16 ++++
> .../arm64/{ => lib}/crypto/chacha-neon-core.S |  0
> .../arm64/{ => lib}/crypto/chacha-neon-glue.c |  0
> arch/arm64/{ => lib}/crypto/poly1305-armv8.pl |  0
> arch/arm64/{ => lib}/crypto/poly1305-glue.c   |  0
> arch/mips/crypto/Kconfig                      | 11 ---
> arch/mips/crypto/Makefile                     | 17 ----
> arch/mips/lib/Makefile                        |  2 +
> arch/mips/lib/crypto/.gitignore               |  2 +
> arch/mips/lib/crypto/Kconfig                  | 12 +++
> arch/mips/lib/crypto/Makefile                 | 19 ++++
> arch/mips/{ => lib}/crypto/chacha-core.S      |  0
> arch/mips/{ => lib}/crypto/chacha-glue.c      |  0
> arch/mips/{ => lib}/crypto/poly1305-glue.c    |  0
> arch/mips/{ => lib}/crypto/poly1305-mips.pl   |  0
> arch/powerpc/crypto/Kconfig                   | 22 +----
> arch/powerpc/crypto/Makefile                  |  4 -
> arch/powerpc/lib/Makefile                     |  2 +
> arch/powerpc/lib/crypto/Kconfig               | 15 ++++
> arch/powerpc/lib/crypto/Makefile              |  7 ++
> .../{ => lib}/crypto/chacha-p10-glue.c        |  0
> .../{ => lib}/crypto/chacha-p10le-8x.S        |  0
> .../{ => lib}/crypto/poly1305-p10-glue.c      |  0
> .../{ => lib}/crypto/poly1305-p10le_64.S      |  0
> arch/riscv/crypto/Kconfig                     |  7 --
> arch/riscv/crypto/Makefile                    |  3 -
> arch/riscv/lib/Makefile                       |  1 +
> arch/riscv/lib/crypto/Kconfig                 |  8 ++
> arch/riscv/lib/crypto/Makefile                |  4 +
> .../{ => lib}/crypto/chacha-riscv64-glue.c    |  0
> .../{ => lib}/crypto/chacha-riscv64-zvkb.S    |  0
> arch/s390/crypto/Kconfig                      | 16 ----
> arch/s390/crypto/Makefile                     |  3 -
> arch/s390/lib/Makefile                        |  1 +
> arch/s390/lib/crypto/Kconfig                  |  7 ++
> arch/s390/lib/crypto/Makefile                 |  4 +
> arch/s390/{ => lib}/crypto/chacha-glue.c      |  0
> arch/s390/{ => lib}/crypto/chacha-s390.S      |  0
> arch/s390/{ => lib}/crypto/chacha-s390.h      |  0
> arch/x86/crypto/Kconfig                       | 86 +++++++------------
> arch/x86/crypto/Makefile                      | 15 ----
> arch/x86/lib/Makefile                         |  2 +
> arch/x86/lib/crypto/.gitignore                |  2 +
> arch/x86/lib/crypto/Kconfig                   | 26 ++++++
> arch/x86/lib/crypto/Makefile                  | 17 ++++
> arch/x86/{ => lib}/crypto/blake2s-core.S      |  0
> arch/x86/{ => lib}/crypto/blake2s-glue.c      |  0
> .../x86/{ => lib}/crypto/chacha-avx2-x86_64.S |  0
> .../{ => lib}/crypto/chacha-avx512vl-x86_64.S |  0
> .../{ => lib}/crypto/chacha-ssse3-x86_64.S    |  0
> arch/x86/{ => lib}/crypto/chacha_glue.c       |  0
> .../crypto/poly1305-x86_64-cryptogams.pl      |  0
> arch/x86/{ => lib}/crypto/poly1305_glue.c     |  0
> crypto/Kconfig                                |  4 +-
> lib/crypto/Kconfig                            | 56 +++++++-----
> 74 files changed, 294 insertions(+), 234 deletions(-)
> create mode 100644 arch/arm/lib/crypto/.gitignore
> create mode 100644 arch/arm/lib/crypto/Kconfig
> create mode 100644 arch/arm/lib/crypto/Makefile
> rename arch/arm/{ => lib}/crypto/blake2s-core.S (100%)
> rename arch/arm/{ => lib}/crypto/blake2s-glue.c (100%)
> rename arch/arm/{ => lib}/crypto/chacha-glue.c (100%)
> rename arch/arm/{ => lib}/crypto/chacha-neon-core.S (100%)
> rename arch/arm/{ => lib}/crypto/chacha-scalar-core.S (100%)
> rename arch/arm/{ => lib}/crypto/poly1305-armv4.pl (100%)
> rename arch/arm/{ => lib}/crypto/poly1305-glue.c (100%)
> create mode 100644 arch/arm64/lib/crypto/.gitignore
> create mode 100644 arch/arm64/lib/crypto/Kconfig
> create mode 100644 arch/arm64/lib/crypto/Makefile
> rename arch/arm64/{ => lib}/crypto/chacha-neon-core.S (100%)
> rename arch/arm64/{ => lib}/crypto/chacha-neon-glue.c (100%)
> rename arch/arm64/{ => lib}/crypto/poly1305-armv8.pl (100%)
> rename arch/arm64/{ => lib}/crypto/poly1305-glue.c (100%)
> create mode 100644 arch/mips/lib/crypto/.gitignore
> create mode 100644 arch/mips/lib/crypto/Kconfig
> create mode 100644 arch/mips/lib/crypto/Makefile
> rename arch/mips/{ => lib}/crypto/chacha-core.S (100%)
> rename arch/mips/{ => lib}/crypto/chacha-glue.c (100%)
> rename arch/mips/{ => lib}/crypto/poly1305-glue.c (100%)
> rename arch/mips/{ => lib}/crypto/poly1305-mips.pl (100%)
> create mode 100644 arch/powerpc/lib/crypto/Kconfig
> create mode 100644 arch/powerpc/lib/crypto/Makefile
> rename arch/powerpc/{ => lib}/crypto/chacha-p10-glue.c (100%)
> rename arch/powerpc/{ => lib}/crypto/chacha-p10le-8x.S (100%)
> rename arch/powerpc/{ => lib}/crypto/poly1305-p10-glue.c (100%)
> rename arch/powerpc/{ => lib}/crypto/poly1305-p10le_64.S (100%)
> create mode 100644 arch/riscv/lib/crypto/Kconfig
> create mode 100644 arch/riscv/lib/crypto/Makefile
> rename arch/riscv/{ => lib}/crypto/chacha-riscv64-glue.c (100%)
> rename arch/riscv/{ => lib}/crypto/chacha-riscv64-zvkb.S (100%)
> create mode 100644 arch/s390/lib/crypto/Kconfig
> create mode 100644 arch/s390/lib/crypto/Makefile
> rename arch/s390/{ => lib}/crypto/chacha-glue.c (100%)
> rename arch/s390/{ => lib}/crypto/chacha-s390.S (100%)
> rename arch/s390/{ => lib}/crypto/chacha-s390.h (100%)
> create mode 100644 arch/x86/lib/crypto/.gitignore
> create mode 100644 arch/x86/lib/crypto/Kconfig
> create mode 100644 arch/x86/lib/crypto/Makefile
> rename arch/x86/{ => lib}/crypto/blake2s-core.S (100%)
> rename arch/x86/{ => lib}/crypto/blake2s-glue.c (100%)
> rename arch/x86/{ => lib}/crypto/chacha-avx2-x86_64.S (100%)
> rename arch/x86/{ => lib}/crypto/chacha-avx512vl-x86_64.S (100%)
> rename arch/x86/{ => lib}/crypto/chacha-ssse3-x86_64.S (100%)
> rename arch/x86/{ => lib}/crypto/chacha_glue.c (100%)
> rename arch/x86/{ => lib}/crypto/poly1305-x86_64-cryptogams.pl (100%)
> rename arch/x86/{ => lib}/crypto/poly1305_glue.c (100%)
> 
> 
> base-commit: bb9c648b334be581a791c7669abaa594e4b5ebb7

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

