Return-Path: <linuxppc-dev+bounces-7767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A2FA927AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:28:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZv3cNDz3c9D;
	Fri, 18 Apr 2025 04:27:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914439;
	cv=none; b=Yr3v1OhnzPKiG0CJZk86x4GYykH9sGciHVYWRu+xwpnRYh64eT4rUCqX3ezBjthYfghgbwccau6R2uvMQ4w7fvdFUouoNgABxcERmkHzEiKFVVcvHs/lxzFu+b80RDozp74/GtqaacCAHx+pNcFQVedjyzVFl+e+M5dSqXhERfGL3FsB4yqP0HMvnfcLUFNReIdXwzU2la5FfmWMmE9pZ7qRnhY4QsVFlohB1fIW816gNQb8heRMSr1wCkSKNV8q9R11v/dQ2E5/laDrB7hZwvM31na5kNG4dvVHEP7L1CEbrEpSSflEVU0bfBQnLlIS65ImIiwsniL1t0bmqwqfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914439; c=relaxed/relaxed;
	bh=x5DDeOyGTQJZu8nPmBvW8E4YjaNeJuTwbZX0k8XbGZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tt37lq9XWDmxaBHH3M219EqLs+LHa7ygikUFEYaRL2q4tNAcQCa0FR1sUfL1/vWoqXuBk1avLkNwigZA1+69aSQGOmAKxLqEtHYmisFZOXhdkf32kubhv6Y9V2HSzQPoKYFGePjkRP8PbKWEGCnaISdACVaXwt9b/URsFbO+2UMjK9swiYu+ozmGQ2/IaPRgBlo8bOcpICirIp/AnHJE9L65RniHXMsTgFZbM6ZEGvBm7CDfp6ueJH11Jt0gdGiL7pK0gA/6mBFA/u1gs/clzemH8FSGw9AaifAjcUcs1lLmyiqWwnMk2RWw38YnXv0hYsc1eCbYyY2+9VXoX/ChVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TFRg94yt; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TFRg94yt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZt08R3z3c7R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4054D6846D;
	Thu, 17 Apr 2025 18:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E381C4CEE7;
	Thu, 17 Apr 2025 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914434;
	bh=obiaeiH3M3/PJ05fFDi3tJIZJm6vLPgHN3Yv3HcRMYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TFRg94ytvFwWb9eEX7DfMbWd/h6Y8idIO3Z1B3mXh/Djib/YaOtCh+29vjwVs79SA
	 QM9c0oAyqr0FmMxLVQo0BJjGSeljXZv+0ige27EFJNNGFGIrjB8PFGGxLYh9gNSLjL
	 OBJEI5gLRWvc/6c5B8jhHR1zHzlvZe5+dcUS3we+S5R+BYOZA0qjnPGO/f4gjySuGi
	 9Xc7Ce01qxhIBBgjg4Do4jIs/J3qRFhT6eXBcCtyOmba9O27SK9Cs3evZHonw/v4sI
	 CfLmw9KzH2g+HVO2hDtYFuLXnqYzsaGMf/n9P6mu//qnJKjcB6bDArCoeA6HE2U4Ts
	 VvktptufPNesg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 09/15] crypto: s390 - drop redundant dependencies on S390
Date: Thu, 17 Apr 2025 11:26:17 -0700
Message-ID: <20250417182623.67808-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
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

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/crypto/Kconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index 055b08f259ab..e88d9cd256ef 100644
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


