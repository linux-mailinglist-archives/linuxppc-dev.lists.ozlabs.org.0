Return-Path: <linuxppc-dev+bounces-7771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F0A927C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZy4YD1z3cFG;
	Fri, 18 Apr 2025 04:27:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914442;
	cv=none; b=VfbSlHWNb/52gU7fZy53aoSEKr/QJ3ztyUbkDURp8zBqgUME8JUDe9qNPEll7alDU4cQORe1lIN9EcES6wV+gpn2zbu9D+Vayy1rg275Oasy/m+46B6E/PJqjRhfp5DuxITR0GnwGZLw4dlESKe2AcKU0ov0477XzuSI7Kyn+AmG+mTSvoifaIFjP0ZSxj1jiPLGms5WrlcMIIH/C6MxAJ+EuHilW/WJ/5TJwjABKrOZFx/1ifq5ArNygRHR0wCrz6GJbGJnrX2iyBT/WelLuHqGL6dIMThnNHQ+BNinV3lLGnKsTtVELTNf0oyjKs/XBri+BU/FVeHPmhupvgIG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914442; c=relaxed/relaxed;
	bh=Dab1Yeb/KPj3QqGFZoHfT8xxA05WsfmS3bVgMYeNt/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxEwBAPkXXrLIxkM+eajBOwLBxVhgmlEyQUfWUnKHCzucUJ7Iqt6P7TfsksEamWbzaeFHPLRaPT3kn9c+MshVku3B3oalsDAUf1aRt2FwfJ7MMC3g1yPUC1paEmIAoo8/i2T8fR7kZyQsD6fvKilWj+ct+rwe1lvRZfWDYxgLRyiHi9bIowe3pwy1NCAqYa72+j8k4kCIRkcWe0QEoLzcTXaagIKcYNWeQHMFcU9ukJs/Un6rjfHmLLsgv/Qw8FoAMWDngy6MuA5nWO2w4rPL7JT7LvyRAZgBza31db5kAXt+I6++cvvB9XKO7UPa9aSfPQ7o7uO+bq3LZNtmJavEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCjTuszM; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCjTuszM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZx61YVz3cFq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9C43AA4A456;
	Thu, 17 Apr 2025 18:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8210C4CEEA;
	Thu, 17 Apr 2025 18:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914439;
	bh=weiHwrb8NYhC3jbXTkeAL6uW1ADDBVix7ENL1hEP9Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FCjTuszM4I5za4jOS9EsyjTspBJ0uQZA9yPGKgtPAF7EVQ2UNhku70F5twl78Voz7
	 zH8nB24XT3iK9Toliv9UmuFBiKNZ2u0oe2Kj4ZWUNAZpWxDfAK15NzmpfU7I+QUs5M
	 DcXDHvJryrsVLrQzW0CfMkzTynFe80rCTNySXXLH7KI5Vvz4tIBSYTe85v+4OGCQfe
	 UMzel9rxjWo16CbMZrcP7CD7JcGkgw0esCydWj4tzx8p6eoASPrrwV6JmhYpWmtHSW
	 qDj9PHIEf35cxMjKbq+467s1ksm3R0HGCyDsW0ND+Ggl3MnILrL9VNSbaILZOiATP/
	 VWO7CaooiMU4Q==
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
Subject: [PATCH 15/15] crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO
Date: Thu, 17 Apr 2025 11:26:23 -0700
Message-ID: <20250417182623.67808-16-ebiggers@kernel.org>
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

Now that the architecture-optimized Poly1305 kconfig symbols are visible
without CRYPTO, there is no need for CRYPTO_LIB_POLY1305 to select
CRYPTO.  So, remove that.  This makes the indirection through the
CRYPTO_LIB_POLY1305_INTERNAL symbol unnecessary, so get rid of that and
just use CRYPTO_LIB_POLY1305 directly.  Finally, make the fallback to
the generic implementation use a default value instead of a select; this
makes it consistent with how the arch-optimized code gets enabled and
also with how CRYPTO_LIB_BLAKE2S_GENERIC gets enabled.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/crypto/Kconfig     |  2 +-
 arch/arm64/crypto/Kconfig   |  2 +-
 arch/mips/crypto/Kconfig    |  2 +-
 arch/powerpc/crypto/Kconfig |  2 +-
 arch/x86/crypto/Kconfig     |  2 +-
 crypto/Kconfig              |  2 +-
 lib/crypto/Kconfig          | 16 +++++-----------
 7 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 960602271443..e07ff8081da7 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -46,12 +46,12 @@ config CRYPTO_NHPOLY1305_NEON
 	  Architecture: arm using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_ARM
 	tristate
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_BLAKE2S_ARM
 	bool "Hash functions: BLAKE2s"
 	select CRYPTO_ARCH_HAVE_LIB_BLAKE2S
 	help
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 8184da75b24f..c3322a0fc2f1 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -26,12 +26,12 @@ config CRYPTO_NHPOLY1305_NEON
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_NEON
 	tristate
 	depends on KERNEL_MODE_NEON
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_SHA1_ARM64_CE
 	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
 	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index f1d61457518f..98c9a2afd676 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -2,12 +2,12 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
 config CRYPTO_POLY1305_MIPS
 	tristate
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_MD5_OCTEON
 	tristate "Digests: MD5 (OCTEON)"
 	depends on CRYPTO && CPU_CAVIUM_OCTEON
 	select CRYPTO_MD5
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index dd3bd22d8e20..3f3253215470 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -100,13 +100,13 @@ config CRYPTO_CHACHA20_P10
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 
 config CRYPTO_POLY1305_P10
 	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
-	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_DEV_VMX
         bool "Support for VMX cryptographic acceleration instructions"
         depends on CRYPTO && PPC64 && VSX
         help
diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 5b9d6dbe6185..6f4bcdf410d8 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -397,12 +397,12 @@ config CRYPTO_POLYVAL_CLMUL_NI
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
 config CRYPTO_POLY1305_X86_64
 	tristate
 	depends on 64BIT
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_SHA1_SSSE3
 	tristate "Hash functions: SHA-1 (SSSE3/AVX/AVX2/SHA-NI)"
 	depends on CRYPTO && 64BIT
 	select CRYPTO_SHA1
diff --git a/crypto/Kconfig b/crypto/Kconfig
index ed50d1b6f6f3..82c61c8e7235 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -954,12 +954,12 @@ config CRYPTO_POLYVAL
 	  cryptographic hash function.
 
 config CRYPTO_POLY1305
 	tristate "Poly1305"
 	select CRYPTO_HASH
+	select CRYPTO_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
-	select CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
 	  Poly1305 is an authenticator algorithm designed by Daniel J. Bernstein.
 	  It is used for the ChaCha20-Poly1305 AEAD, specified in RFC7539 for use
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index cc4c0ee04f98..e23280af302a 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -112,25 +112,19 @@ config CRYPTO_ARCH_HAVE_LIB_POLY1305
 	  accelerated implementation of the Poly1305 library interface,
 	  either builtin or as a module.
 
 config CRYPTO_LIB_POLY1305_GENERIC
 	tristate
+	default CRYPTO_LIB_POLY1305 if !CRYPTO_ARCH_HAVE_LIB_POLY1305
 	help
-	  This symbol can be depended upon by arch implementations of the
-	  Poly1305 library interface that require the generic code as a
-	  fallback, e.g., for SIMD implementations. If no arch specific
-	  implementation is enabled, this implementation serves the users
-	  of CRYPTO_LIB_POLY1305.
-
-config CRYPTO_LIB_POLY1305_INTERNAL
-	tristate
-	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
+	  This symbol can be selected by arch implementations of the Poly1305
+	  library interface that require the generic code as a fallback, e.g.,
+	  for SIMD implementations. If no arch specific implementation is
+	  enabled, this implementation serves the users of CRYPTO_LIB_POLY1305.
 
 config CRYPTO_LIB_POLY1305
 	tristate
-	select CRYPTO
-	select CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Enable the Poly1305 library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one
 	  is available and enabled.
 
-- 
2.49.0


