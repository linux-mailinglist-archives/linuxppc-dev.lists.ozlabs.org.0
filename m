Return-Path: <linuxppc-dev+bounces-7760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 702EEA9279B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:27:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZn0yX6z3c4M;
	Fri, 18 Apr 2025 04:27:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914433;
	cv=none; b=jfhWmHZncrh+fbzux9nNlG7OQryi6e3PK/W/vlgsWt8SlFPvNnOiTgNg61vhO5oWJvvWGX8H7yltAuvy5lCzwSR3hV89seKuoDefWAwF4g3g0ZVuTsTY6Lw8kqyPJ1j+5DB94ELTQUWIWs2zOI1aACEEw5CbASEuJEyKAc/nY5eRj15IWC27p9bF0ZSjPzdg2pjFrgG652OOJYqG0NERiBJSY0DvKwuAFyXwfH1vWB8jhG7usISapA4kJh+zJOISeUQaSAHc4zFzuIafqYMhYmDN0ghLGA2OCbSsvw79e/e3jRU2eVbCux7hscyqix/cuzi8K1RI1vWKCdKMYvKCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914433; c=relaxed/relaxed;
	bh=dqzaEfuawTbv+rrxt9AxdIubReRU1/0OH7HicJujxhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyPsDBDP+CtvsHv9suA/gNRXSs2MaVCgibRGEYYaKTI22IEWWSW00+pC25lNvL3Pq09xmV8x2Q6JOmUS2rIp/4ymKF0V9/FDXJYqvk7pjVc4s9bwGsoyoapoH4GwQCn0oaqPY3KuLn8mee2f4bUz8NCV9H9KVepfDLK8G1pn+H9WTVpThktAgp+DLqgfFcoNr3hAbgmrWZhwtePmApZMTpIo46e3t7pcW6pHmq2XZKcez3nxqU41xiHj/Z5ZPsg19XWZ/TqFow1nBAmckb2jCUN3DoZyW6e9ON6G7qKe7n4JrUrQJ/jchd4o+1cIwVZEODpZPTX6TV8eK2eOB4y0Cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dhq+jSRp; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dhq+jSRp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZl3VhCz3c3D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC78DA4A40B;
	Thu, 17 Apr 2025 18:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5078C4CEE4;
	Thu, 17 Apr 2025 18:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914428;
	bh=I03HgIe8hlztmVaX0kmyqHgQfk9uC8Y2YUsxqcekmxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dhq+jSRpIPLURJ7s8ysIZZYCuX6lz66JWazTUrzcabv+csLeQT+ovERbI+ddDLfrw
	 1Kgf+ZJjLsqxPtVC5El31bcJPPy05AhyHzed/kO+mlc0E9Xq+fJ1m+1CWprIHo56nA
	 273CkNbWjnRX35UsiY6IqK4NRWCRBQ0bVz5roGfPqj4p4pv+SamyAh4osGCswH4+Aj
	 LwZGPhbiAx9t3neXz2nWtjF8AG3GMWWzwWYeVmtb9a8GNogNqGaxc6N/N0pS9Nfulr
	 vVpGX9fkt0iciOEHT8EPdERvnFeMXTGoTuQqsLX1nvQ1/eOHdv8/e8u03/U+eIaSR1
	 /2/r8Yqh0y04g==
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
Subject: [PATCH 03/15] crypto: arm64 - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:11 -0700
Message-ID: <20250417182623.67808-4-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Continue disentangling the crypto library functions from the generic
crypto infrastructure by removing the unnecessary CRYPTO dependency of
CRYPTO_CHACHA20_NEON and CRYPTO_POLY1305_NEON.  To do this, make
arch/arm64/crypto/Kconfig be sourced regardless of CRYPTO, and
explicitly list the CRYPTO dependency in the symbols that do need it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/Kconfig        |  3 ++-
 arch/arm64/crypto/Kconfig | 41 +++++++++++++++++++++------------------
 crypto/Kconfig            |  3 ---
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08..7f6ce0da6f87 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2509,7 +2509,8 @@ source "drivers/cpufreq/Kconfig"
 
 endmenu # "CPU Power Management"
 
 source "drivers/acpi/Kconfig"
 
-source "arch/arm64/kvm/Kconfig"
+source "arch/arm64/crypto/Kconfig"
 
+source "arch/arm64/kvm/Kconfig"
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 704d0b7e1d13..a2cccd2accb0 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (arm64)"
 
 config CRYPTO_GHASH_ARM64_CE
 	tristate "Hash functions: GHASH (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_GF128MUL
 	select CRYPTO_AEAD
 	help
@@ -15,11 +15,11 @@ config CRYPTO_GHASH_ARM64_CE
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_NHPOLY1305_NEON
 	tristate "Hash functions: NHPoly1305 (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_NHPOLY1305
 	help
 	  NHPoly1305 hash function (Adiantum)
 
 	  Architecture: arm64 using:
@@ -31,102 +31,105 @@ config CRYPTO_POLY1305_NEON
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_SHA1_ARM64_CE
 	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA1
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_SHA256_ARM64
 	tristate "Hash functions: SHA-224 and SHA-256"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm64
 
 config CRYPTO_SHA2_ARM64_CE
 	tristate "Hash functions: SHA-224 and SHA-256 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA256_ARM64
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_SHA512_ARM64
 	tristate "Hash functions: SHA-384 and SHA-512"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm64
 
 config CRYPTO_SHA512_ARM64_CE
 	tristate "Hash functions: SHA-384 and SHA-512 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA512_ARM64
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_SHA3_ARM64
 	tristate "Hash functions: SHA-3 (ARMv8.2 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA3
 	help
 	  SHA-3 secure hash algorithms (FIPS 202)
 
 	  Architecture: arm64 using:
 	  - ARMv8.2 Crypto Extensions
 
 config CRYPTO_SM3_NEON
 	tristate "Hash functions: SM3 (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
 	help
 	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
 
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM3_ARM64_CE
 	tristate "Hash functions: SM3 (ARMv8.2 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
 	help
 	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
 
 	  Architecture: arm64 using:
 	  - ARMv8.2 Crypto Extensions
 
 config CRYPTO_POLYVAL_ARM64_CE
 	tristate "Hash functions: POLYVAL (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_POLYVAL
 	help
 	  POLYVAL hash function for HCTR2
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_AES_ARM64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, CTS, XCTR, XTS"
+	depends on CRYPTO
 	select CRYPTO_AES
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, CTS,
 	    XCTR, and XTS modes
@@ -135,22 +138,22 @@ config CRYPTO_AES_ARM64
 
 	  Architecture: arm64
 
 config CRYPTO_AES_ARM64_CE
 	tristate "Ciphers: AES (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_AES_ARM64_CE_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_AES_ARM64_CE
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
@@ -163,11 +166,11 @@ config CRYPTO_AES_ARM64_CE_BLK
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_AES_ARM64_NEON_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
@@ -187,11 +190,11 @@ config CRYPTO_CHACHA20_NEON
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_AES_ARM64_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XCTR/XTS modes (bit-sliced NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_AES_ARM64_NEON_BLK
 	select CRYPTO_LIB_AES
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
@@ -207,11 +210,11 @@ config CRYPTO_AES_ARM64_BS
 	  - bit-sliced algorithm
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_CE
 	tristate "Ciphers: SM4 (ARMv8.2 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_SM4
 	help
 	  Block ciphers: SM4 cipher algorithms (OSCCA GB/T 32907-2016)
 
@@ -219,11 +222,11 @@ config CRYPTO_SM4_ARM64_CE
 	  - ARMv8.2 Crypto Extensions
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_CE_BLK
 	tristate "Ciphers: SM4, modes: ECB/CBC/CTR/XTS (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SM4
 	help
 	  Length-preserving ciphers: SM4 cipher algorithms (OSCCA GB/T 32907-2016)
 	  with block cipher modes:
@@ -237,11 +240,11 @@ config CRYPTO_SM4_ARM64_CE_BLK
 	  - ARMv8 Crypto Extensions
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_NEON_BLK
 	tristate "Ciphers: SM4, modes: ECB/CBC/CTR (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SM4
 	help
 	  Length-preserving ciphers: SM4 cipher algorithms (OSCCA GB/T 32907-2016)
 	  with block cipher modes:
@@ -252,11 +255,11 @@ config CRYPTO_SM4_ARM64_NEON_BLK
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_AES_ARM64_CE_CCM
 	tristate "AEAD cipher: AES in CCM mode (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_AES_ARM64_CE
 	select CRYPTO_AES_ARM64_CE_BLK
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
@@ -269,11 +272,11 @@ config CRYPTO_AES_ARM64_CE_CCM
 	  - ARMv8 Crypto Extensions
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_CE_CCM
 	tristate "AEAD cipher: SM4 in CCM mode (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
 	select CRYPTO_SM4
 	select CRYPTO_SM4_ARM64_CE_BLK
 	help
@@ -285,11 +288,11 @@ config CRYPTO_SM4_ARM64_CE_CCM
 	  - ARMv8 Crypto Extensions
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_CE_GCM
 	tristate "AEAD cipher: SM4 in GCM mode (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
 	select CRYPTO_SM4
 	select CRYPTO_SM4_ARM64_CE_BLK
 	help
diff --git a/crypto/Kconfig b/crypto/Kconfig
index cad71f32e1e3..a5225c6d0488 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if ARM64
-source "arch/arm64/crypto/Kconfig"
-endif
 if LOONGARCH
 source "arch/loongarch/crypto/Kconfig"
 endif
 if MIPS
 source "arch/mips/crypto/Kconfig"
-- 
2.49.0


