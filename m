Return-Path: <linuxppc-dev+bounces-7915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA6A970A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 17:28:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhmN52mmgz3btn;
	Wed, 23 Apr 2025 01:28:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745335701;
	cv=none; b=luFAZfkxEAHOeFAFEq3JqhdeAUfxgvdghIwARnIuNQXazZArhLutm9Au3tTdpDDA9+zeapBgF/TwH9duvc8G2ZhBvBG2ZLxITgpNpOQG00na0dOcFg5JsjgBUNmxzZLtwKNmTE8a6SoXHrSw/8S3QwKHdkI4Zfiw9c/a+mHHzJG/o6zTZAzLcgLvyORCuiwP4tmSN36ad0UOLSyW+X62AWxbLg86SnZd3jwngYBUSPxIfR350T37kdqeRsImVh3nVsg6hvRDhS78uTJ1XPl2rWbTJ1iDjYuWhJocx5CQ2tpL8eza0jjmA7fqLxnAEwajtEst4yPyqDKCk4JPeOZfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745335701; c=relaxed/relaxed;
	bh=YQvg/uQQPznL6zryuZ2Sf5aggUBSW7pCse/8MHMCaio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVIRWim427R9pOGhNAQMpXVR6n1i1luI/etmL7i5Rv0p63agfAxmuauTyU1c/EDMR03EiyzBcUeSjBF28v3mPmYiOff6Oc0QyFvwy8lQleWCeEKzhFrpp11E2/8gRUElUsS/s6Nx9+dyOXeQLQW8nTRPnR4XhXc2gp+5nS4z4doIWwhl4Ms1tZUMSJWtdnEFoGxaZm7Hr3XHC/Kk/9Gag3dMNrdpf7K9tjQeKx3Co6y6+1R+tKSQKrtwlMQj2V5Mg2KUvxTFREL0d0NL4h5o8G07Obkcftr2FY8IWOMVlZvxsocXFl/i2z0eu33eEaeWiMnaG82Hwmar0Bohypgn8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qdC0W0eL; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qdC0W0eL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhmN23FWrz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 01:28:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28C3E61569;
	Tue, 22 Apr 2025 15:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75A0C4AF0B;
	Tue, 22 Apr 2025 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335696;
	bh=u0xVqTwc+LVSbVkgBLveEACfwQ18fyzLMscrd3BGCZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qdC0W0eL6Uj1hGs8hRkxL94JtjuD44QBTP/Am8HtLUFQMxNY0qy64fWDcMMur6RGx
	 3aCYvzdhFOBp2e5glCXLasXgVtTZynY/hY0w7T2kUkW8SSm1ni0o2u3/VebmnJlH2m
	 XHVfD+il9gwPYWAoJf2OApKCUX36JzNuT5hgiFvHlkrq+182eHzjXkHm5K3uBeq4px
	 sMbyWsRQ5XPLiLXsAhbke8IFeGSAVjqooYKSX4+TJrsCgRZzMRcamWnVEqc2hJnfai
	 vq9Elw6OEjQ636Eodl4WzFMkTcgfNzcOwC9nrVctgrMZ1mBFFZ/iz3chOnYtmROXIR
	 uwFJTHlErgtsA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: [PATCH v3 03/13] crypto: s390 - drop redundant dependencies on S390
Date: Tue, 22 Apr 2025 08:27:06 -0700
Message-ID: <20250422152716.5923-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

arch/s390/crypto/Kconfig is sourced only when CONFIG_S390=y, so there is
no need for the symbols defined inside it to depend on S390.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/crypto/Kconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index 055b08f259ab2..e88d9cd256ef5 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -2,77 +2,70 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (s390)"
 
 config CRYPTO_SHA512_S390
 	tristate "Hash functions: SHA-384 and SHA-512"
-	depends on S390
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: s390
 
 	  It is available as of z10.
 
 config CRYPTO_SHA1_S390
 	tristate "Hash functions: SHA-1"
-	depends on S390
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: s390
 
 	  It is available as of z990.
 
 config CRYPTO_SHA256_S390
 	tristate "Hash functions: SHA-224 and SHA-256"
-	depends on S390
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: s390
 
 	  It is available as of z9.
 
 config CRYPTO_SHA3_256_S390
 	tristate "Hash functions: SHA3-224 and SHA3-256"
-	depends on S390
 	select CRYPTO_HASH
 	help
 	  SHA3-224 and SHA3-256 secure hash algorithms (FIPS 202)
 
 	  Architecture: s390
 
 	  It is available as of z14.
 
 config CRYPTO_SHA3_512_S390
 	tristate "Hash functions: SHA3-384 and SHA3-512"
-	depends on S390
 	select CRYPTO_HASH
 	help
 	  SHA3-384 and SHA3-512 secure hash algorithms (FIPS 202)
 
 	  Architecture: s390
 
 	  It is available as of z14.
 
 config CRYPTO_GHASH_S390
 	tristate "Hash functions: GHASH"
-	depends on S390
 	select CRYPTO_HASH
 	help
 	  GCM GHASH hash function (NIST SP800-38D)
 
 	  Architecture: s390
 
 	  It is available as of z196.
 
 config CRYPTO_AES_S390
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, XTS, GCM"
-	depends on S390
 	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	help
 	  Block cipher: AES cipher algorithms (FIPS 197)
 	  AEAD cipher: AES with GCM
@@ -90,11 +83,10 @@ config CRYPTO_AES_S390
 	  key sizes and XTS mode is hardware accelerated for 256 and
 	  512 bit keys.
 
 config CRYPTO_DES_S390
 	tristate "Ciphers: DES and Triple DES EDE, modes: ECB, CBC, CTR"
-	depends on S390
 	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_DES
 	help
 	  Block ciphers: DES (FIPS 46-2) cipher algorithm
@@ -107,18 +99,16 @@ config CRYPTO_DES_S390
 	  As of z990 the ECB and CBC mode are hardware accelerated.
 	  As of z196 the CTR mode is hardware accelerated.
 
 config CRYPTO_CHACHA_S390
 	tristate
-	depends on S390
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_HMAC_S390
 	tristate "Keyed-hash message authentication code: HMAC"
-	depends on S390
 	select CRYPTO_HASH
 	help
 	  s390 specific HMAC hardware support for SHA224, SHA256, SHA384 and
 	  SHA512.
 
-- 
2.49.0


