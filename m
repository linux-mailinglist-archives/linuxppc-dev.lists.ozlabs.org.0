Return-Path: <linuxppc-dev+bounces-7823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD055A94916
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:28:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZgdnB6FHXz3c3H;
	Mon, 21 Apr 2025 05:27:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177262;
	cv=none; b=O/3UeTVItNQj/A3PD6fDvu/NNAnUKnFEQedm54y/YGZr7voSMnEOIS7blLNG028fqrXIq1ePi1nUGR9P7AmVjE8pRAjvIs1qR3gi1O93q7btrz1oXKCB6UqRmk23R/RtpdAfmsMBZnORV1VpCFZMLbPlgrOnAj5ek8EXoKyRbAzS/rvjmxKDR4D0875sn6SsUdzJ3NTBEy6BFj+vHqier1fm87MBVMX5kdI6W9QZ89U00SazVWQhIvPcY6UfgUG6Rb8ejKlt9JsN15/9IDrdtrlyjngZ5UP/qTsKW8ZGR8VDoQSyTDCpmBEhB4rBS0IQvssku3mobWtsO4G7GG+EGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177262; c=relaxed/relaxed;
	bh=4DMhBpbB5hVtdCMSWSFlZWSE/3ga1+hDYBx7vs5k7hE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1nVTsx/TTd2xgRaSQkgTspnaDd+QQ+kDajvVth6bPV6WCMs6ie5TuQgYg10sKRyOnGYUOMqiJr2FfB5A2MKmKR3t7iL2XjowfRuLCv3DwM5INI1bFjbxdtTQeclCcJC1A+nWCYtwZFyQqhVQs8VE8v/SuR/aoURbjo/jhyPMzyDOiBYQUoPovGTmTFIxuxGBcXSVigNmwuR67B4zUJgbL5c+vay61xbxWCHWA/d0cuTN2ninak2I07mDDIXHyJZGAuZpHR3yUJSM6QeNVauCrmPIcN0dM7HwC7zvmE/DOCQENiSPMVaqy+9ukJLEuZ//+seL+jMXsLTAp/soB883Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ON5X492w; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ON5X492w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgdn83Sjhz2ySp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AB664A6EF;
	Sun, 20 Apr 2025 19:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33055C4CEEE;
	Sun, 20 Apr 2025 19:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177258;
	bh=0fs52xVhkpJgVpZDJvGbv9MYJ3m4Z5mmmYA6A5muSpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ON5X492w+kvxjKlQGY1gmSPr8/Hxy60CHAUGMEaz8iqN0VdupswwTrEU3HYeUCg5Z
	 5GJLBCXqOiiQrxCIHvIYezKn4U42k58ZGeCszwfVdI8S2q7JO0cniv//wN59z8bv2p
	 98yiJ6Yle3+6SKiSyDh44QrfGrJ/q5eR5t6lgdPmYKSNRJ+qjaTeVyrhrxtxcTIlcX
	 XZ8t2zcLjAS+ULJyANYBgtEq97FVrcWSBRv1A93pslXJRjex560Sdhlx/3Mudr32bM
	 83lkDLrLPMvyXK5hBL7LahqNgYSuQMpuGTX7npIGAFTlZKMdRjBQc9UJoM/MvMuLVX
	 GwzmCso2fYWEg==
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
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 03/13] crypto: s390 - drop redundant dependencies on S390
Date: Sun, 20 Apr 2025 12:25:59 -0700
Message-ID: <20250420192609.295075-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420192609.295075-1-ebiggers@kernel.org>
References: <20250420192609.295075-1-ebiggers@kernel.org>
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


