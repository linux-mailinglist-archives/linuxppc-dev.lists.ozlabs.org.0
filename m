Return-Path: <linuxppc-dev+bounces-7441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 555BEA7B2D8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 02:05:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTJlH0Pm5z30Kg;
	Fri,  4 Apr 2025 11:05:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743725115;
	cv=none; b=GWPA3ppALeDZJ1Lg1TlOsU0v6QX2gCa04eNjAu92fZv2mHo3hMByM8et3Wv3DYtmtKYK7Mzp2oSuYn/5NxK/4CfF6ABOUJCCh7nCL4wCNl8l/qvTNvY24KiRRlb1p9oZ0ookSqZKHXHlDtDcXIU5/QHVcnyO5RZRRDn3JxeAdlycRlfkEmvpNW3G65APG4r7KDLCqBg5z/SMJxr/bgIb3hqLAJkexhDykBMDa9iUujClF8kpzkvG7Cbsuhnben4ym7TSN7bFCGaZ/JnRvf4tUjdaKGgmll5lRFs3KXaewUqvmwqnONVbsYPil76B4DR3Q6U4Pm2abhFf6UohXvJxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743725115; c=relaxed/relaxed;
	bh=wwQJWT3E4Za1gMFmO0KiwKEGd+4lX/BAmsR8ca0Ov4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gUV0kqeWi98T24EXhIndM5ZQTJd1tTaIo13/qwSIpk+wP+18Ks+Kr6wUa3liFdKoewLVMYbyjLG58OnbMMRhRPn8tdfd8AZ5qjk247XfHwpz99wG9ql5kTVDM/K6hF8UsEmFmQyC3eyi1O9DEljGmuVcZFOcU1RpdnZlqhHf94SKDAGU5ugWF+6u5UjsqK1kjPn4QDFATEu7xUpKNsO9ZsqgL1fnkxkbgaMSGqGxJXvQfvIvSDLckOh4J8aM822iyCXc+wdRQRlzPV7GpxmEAragzr2xFXEPpn6gFv/BybUhhFnc1O3roowdogqotjTn6zMZunD6GDNYob5Rvq/bFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TeaEjhBb; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TeaEjhBb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTJlG1RTQz2yfF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 11:05:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F1FAA46A8E;
	Thu,  3 Apr 2025 23:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EB0C4CEE3;
	Fri,  4 Apr 2025 00:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725111;
	bh=kVQgNxq4m2oGBNbzDF5BjkGwrAuG/5jrS+kaq/UaZzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TeaEjhBbCQSJHQu2oOakvU3VJOdnaAPlxybbFw3CiY/b6ZUpxdUJOULr0igtTwkj/
	 N7cb7T/oIlDQFUhejWsaWKuJ9mLdikAoxhSrUdUzvOicU7o7Llg19Mjyb9G20bbDdN
	 desEkL0bU1F/i7qrxaMGjAOSqn2hm51x7x33/z9uYIwAQbtVraOGl4DFCGDASQZlSM
	 4h4UUPdFC4xapT7ga4hLX9be2YV6IUgzfZm6kjsAFihqVdTwahUzp+XeS8qQxZnCBB
	 ikU3NTrbtZ+xrxMq0WyszIMkBYs+TK3IIIB77ia5RRckAPSuqcULcxpyneoiON6KG7
	 UzGCT0pEzPZeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	linux@armlinux.org.uk,
	leitao@debian.org,
	nayna@linux.ibm.com,
	pfsmorigo@gmail.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.13 07/22] crypto: lib/Kconfig - Fix lib built-in failure when arch is modular
Date: Thu,  3 Apr 2025 20:04:36 -0400
Message-Id: <20250404000453.2688371-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000453.2688371-1-sashal@kernel.org>
References: <20250404000453.2688371-1-sashal@kernel.org>
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Herbert Xu <herbert@gondor.apana.org.au>

[ Upstream commit 1047e21aecdf17c8a9ab9fd4bd24c6647453f93d ]

The HAVE_ARCH Kconfig options in lib/crypto try to solve the
modular versus built-in problem, but it still fails when the
the LIB option (e.g., CRYPTO_LIB_CURVE25519) is selected externally.

Fix this by introducing a level of indirection with ARCH_MAY_HAVE
Kconfig options, these then go on to select the ARCH_HAVE options
if the ARCH Kconfig options matches that of the LIB option.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501230223.ikroNDr1-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/crypto/Kconfig     |  6 +++---
 arch/powerpc/crypto/Kconfig |  4 ++--
 arch/x86/crypto/Kconfig     |  6 +++---
 lib/crypto/Kconfig          | 26 ++++++++++++++++++--------
 4 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 5ff49a5e9afc9..8af59c1735ea4 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -6,7 +6,7 @@ config CRYPTO_CURVE25519_NEON
 	tristate "Public key crypto: Curve25519 (NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -47,7 +47,7 @@ config CRYPTO_NHPOLY1305_NEON
 config CRYPTO_POLY1305_ARM
 	tristate "Hash functions: Poly1305 (NEON)"
 	select CRYPTO_HASH
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -214,7 +214,7 @@ config CRYPTO_AES_ARM_CE
 config CRYPTO_CHACHA20_NEON
 	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (NEON)"
 	select CRYPTO_SKCIPHER
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 951a437264611..14299927d7964 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -6,7 +6,7 @@ config CRYPTO_CURVE25519_PPC64
 	tristate "Public key crypto: Curve25519 (PowerPC64)"
 	depends on PPC64 && CPU_LITTLE_ENDIAN
 	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -128,7 +128,7 @@ config CRYPTO_CHACHA20_P10
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 3d2e38ba52403..82c5fbb13f048 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -6,7 +6,7 @@ config CRYPTO_CURVE25519_X86
 	tristate "Public key crypto: Curve25519 (ADX)"
 	depends on X86 && 64BIT
 	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -352,7 +352,7 @@ config CRYPTO_CHACHA20_X86_64
 	depends on X86 && 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
@@ -420,7 +420,7 @@ config CRYPTO_POLY1305_X86_64
 	tristate "Hash functions: Poly1305 (SSE2/AVX2)"
 	depends on X86 && 64BIT
 	select CRYPTO_LIB_POLY1305_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index b01253cac70a7..c542ef1d64d03 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -42,12 +42,17 @@ config CRYPTO_LIB_BLAKE2S_GENERIC
 	  of CRYPTO_LIB_BLAKE2S.
 
 config CRYPTO_ARCH_HAVE_LIB_CHACHA
-	tristate
+	bool
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the ChaCha library interface,
 	  either builtin or as a module.
 
+config CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
+	tristate
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_LIB_CHACHA=m
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA=y
+
 config CRYPTO_LIB_CHACHA_GENERIC
 	tristate
 	select CRYPTO_LIB_UTILS
@@ -60,7 +65,6 @@ config CRYPTO_LIB_CHACHA_GENERIC
 
 config CRYPTO_LIB_CHACHA
 	tristate "ChaCha library interface"
-	depends on CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_CHACHA
 	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
 	help
 	  Enable the ChaCha library interface. This interface may be fulfilled
@@ -68,12 +72,17 @@ config CRYPTO_LIB_CHACHA
 	  is available and enabled.
 
 config CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	tristate
+	bool
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the Curve25519 library interface,
 	  either builtin or as a module.
 
+config CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
+	tristate
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_LIB_CURVE25519=m
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519=y
+
 config CRYPTO_LIB_CURVE25519_GENERIC
 	tristate
 	help
@@ -85,7 +94,6 @@ config CRYPTO_LIB_CURVE25519_GENERIC
 
 config CRYPTO_LIB_CURVE25519
 	tristate "Curve25519 scalar multiplication library"
-	depends on CRYPTO_ARCH_HAVE_LIB_CURVE25519 || !CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
 	select CRYPTO_LIB_UTILS
 	help
@@ -104,12 +112,17 @@ config CRYPTO_LIB_POLY1305_RSIZE
 	default 1
 
 config CRYPTO_ARCH_HAVE_LIB_POLY1305
-	tristate
+	bool
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the Poly1305 library interface,
 	  either builtin or as a module.
 
+config CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
+	tristate
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_LIB_POLY1305=m
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305=y
+
 config CRYPTO_LIB_POLY1305_GENERIC
 	tristate
 	help
@@ -121,7 +134,6 @@ config CRYPTO_LIB_POLY1305_GENERIC
 
 config CRYPTO_LIB_POLY1305
 	tristate "Poly1305 library interface"
-	depends on CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
 	help
 	  Enable the Poly1305 library interface. This interface may be fulfilled
@@ -130,8 +142,6 @@ config CRYPTO_LIB_POLY1305
 
 config CRYPTO_LIB_CHACHA20POLY1305
 	tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library version)"
-	depends on CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_CHACHA
-	depends on CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_POLY1305
 	depends on CRYPTO
 	select CRYPTO_LIB_CHACHA
 	select CRYPTO_LIB_POLY1305
-- 
2.39.5


