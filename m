Return-Path: <linuxppc-dev+bounces-7763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79BA927A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:28:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZq1SMwz3c4D;
	Fri, 18 Apr 2025 04:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914435;
	cv=none; b=OVcvZZHm/SipYGDTuHIBDk7YhpsE50Mn/ryw9JwNAPJP/VWtZtn9VWFeqRSGN1SZ+OshpCm8llayJaennA6YcxMEtYm/fJ4Hf1Cn7uGPp8LYGiJRtOx0Nu18KlcsritL7PbroyDxutJFtA61OcoX1bTrxzds6BtDEbIGGIxMLdungWIA1gIE0u9ODaxXJqH3iUKxFdadDCz4d6x+42aCKadk9dIb35gST92KgECt+gF5Oti40zfIlcfIGW6m4did70zYfbzKkbgSHt9j5pMxw7c1mtvpDKFp68+LtXoN//cbpBoee9ZXHD9g8YuchJjD9jMqgs82l2U/sbACwZc7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914435; c=relaxed/relaxed;
	bh=eWTRKkKWhvpczKSnn8QWkVNNu349jBQ7I522SXZ74dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6NA3VYeG4kP9pgYlZDTyaK4m5mRvZysxvLIK/wWmLtZy4pkolW1v9uQ1N5VdyjOgi+N7i11Q4Hzz/LBzJoPkTAARBFXGCct7/z13bcSKDwwJ9iqTPTHuWZAzCEcK6gdMqriCm04lNpgyqWRaaBYBtCV9bTNTfAmbVIOEDn02uRF20nQNGayPRIoJt/VkPBWoMwZkSBGtEZOG5MVtKAOpkC1xhqHVU3axnxqrOrUXx3kmzceyzGxNzKYE4AeK5tE84bZl8tyVyq6qB1LKuZWZN53lHWfdovIIuOVcvkqexg1vXw60YuDn8kwCjJv6c88Rd9ReKQ+oxk3bcBG2FP+Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rDsCxtn3; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rDsCxtn3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZn6n0Rz3c4r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38CB74A526;
	Thu, 17 Apr 2025 18:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96532C4CEEA;
	Thu, 17 Apr 2025 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914432;
	bh=dsE7qfp3A3zmlcPG+tvm4sv24/L4ppO0aAJ6BZiEshE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rDsCxtn3lebQV/DysLhlXFbm/jncgwomZE43WtxQP24LtFE9xOa6eiBclZTQg8gDA
	 3i+j3v6r50KIUvO1d2f48AAFIoj4fUY/I6hS7t2+pB5aL99Y91V+Kzolg1S3dFzK1W
	 YmIRVjS0t8vEJ6EiUPzxMajKFyxEWSlavCF2LEd6VhnTb/rYUhXfOqH5nXDNaDa8ni
	 ar9klYXp61RWo3pSI30VW4AUilqd4McXNnCe0pDOHszpxAKhTden3pUGSby2brHFmP
	 9x6UwlkgdIPBH9H34XsZtVKioNaIav0ZkUaIIrvvYZfYdw17pnWZSyakOtR5xQXcRz
	 o04U7Rx5/k7vg==
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
Subject: [PATCH 07/15] crypto: powerpc - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:15 -0700
Message-ID: <20250417182623.67808-8-ebiggers@kernel.org>
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

Continue disentangling the crypto library functions from the generic
crypto infrastructure by removing the unnecessary CRYPTO dependency of
CRYPTO_CHACHA20_P10 and CRYPTO_POLY1305_P10.  To do this, make
arch/powerpc/crypto/Kconfig be sourced regardless of CRYPTO, and
explicitly list the CRYPTO dependency in the symbols that do need it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/Kconfig        |  2 ++
 arch/powerpc/crypto/Kconfig | 16 +++++++++-------
 crypto/Kconfig              |  3 ---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6722625a406a..9ffd80880675 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1346,8 +1346,10 @@ config PHYSICAL_START
 endif
 
 config PPC_LIB_RHEAP
 	bool
 
+source "arch/powerpc/crypto/Kconfig"
+
 source "arch/powerpc/kvm/Kconfig"
 
 source "kernel/livepatch/Kconfig"
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 8bcc69013464..0f14bdf104d5 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (powerpc)"
 
 config CRYPTO_CURVE25519_PPC64
 	tristate
-	depends on PPC64 && CPU_LITTLE_ENDIAN
+	depends on CRYPTO && PPC64 && CPU_LITTLE_ENDIAN
 	select CRYPTO_KPP
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help
@@ -15,46 +15,48 @@ config CRYPTO_CURVE25519_PPC64
 	  Architecture: PowerPC64
 	  - Little-endian
 
 config CRYPTO_MD5_PPC
 	tristate "Digests: MD5"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: powerpc
 
 config CRYPTO_SHA1_PPC
 	tristate "Hash functions: SHA-1"
+	depends on CRYPTO
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: powerpc
 
 config CRYPTO_SHA1_PPC_SPE
 	tristate "Hash functions: SHA-1 (SPE)"
-	depends on SPE
+	depends on CRYPTO && SPE
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
 config CRYPTO_SHA256_PPC_SPE
 	tristate "Hash functions: SHA-224 and SHA-256 (SPE)"
-	depends on SPE
+	depends on CRYPTO && SPE
 	select CRYPTO_SHA256
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
-	depends on SPE
+	depends on CRYPTO && SPE
 	select CRYPTO_SKCIPHER
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, and XTS modes
 
@@ -72,11 +74,11 @@ config CRYPTO_AES_PPC_SPE
 	  architecture specific assembler implementations that work on 1KB
 	  tables or 256 bytes S-boxes.
 
 config CRYPTO_AES_GCM_P10
 	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
-	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
+	depends on CRYPTO && PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_LIB_AES
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SIMD
@@ -104,17 +106,17 @@ config CRYPTO_POLY1305_P10
 	select CRYPTO_LIB_POLY1305_GENERIC
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_DEV_VMX
         bool "Support for VMX cryptographic acceleration instructions"
-        depends on PPC64 && VSX
+        depends on CRYPTO && PPC64 && VSX
         help
           Support for VMX cryptographic acceleration instructions.
 
 config CRYPTO_DEV_VMX_ENCRYPT
 	tristate "Encryption acceleration support on P8 CPU"
-	depends on CRYPTO_DEV_VMX
+	depends on CRYPTO && CRYPTO_DEV_VMX
 	select CRYPTO_AES
 	select CRYPTO_CBC
 	select CRYPTO_CTR
 	select CRYPTO_GHASH
 	select CRYPTO_XTS
diff --git a/crypto/Kconfig b/crypto/Kconfig
index cfa426bea0c6..2467dba73372 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if PPC
-source "arch/powerpc/crypto/Kconfig"
-endif
 if RISCV
 source "arch/riscv/crypto/Kconfig"
 endif
 if S390
 source "arch/s390/crypto/Kconfig"
-- 
2.49.0


