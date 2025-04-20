Return-Path: <linuxppc-dev+bounces-7834-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E26F5A94936
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:29:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZgdnN5g00z3bcy;
	Mon, 21 Apr 2025 05:27:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177272;
	cv=none; b=kYKs8T5RYUUb1fkvt4+sgBxsf3GxTsYeC//ywD/9Zm+Yn2iLmf7G33odAYEuSmQTvrk0hqHPbiheTAlGaEE+z7G+EFu7Ogjy3Ftv6Ejch+7FyO8G1qYKLOsYMysL82eibhVBXqXenucS7fTTnvTIqDJR9IUOlVhPINIU5cS0Yd0NZcpmFLKi7SfGpr6rN1z7HPbLE1eh+LUe/s2+PWCVjcgZEV+CFIPb4QdLPVYg6vXq8Vr7zKBDU9rxYAZSGKjPAfTdzDPajBqrTmitFpEAqsvR4kKtOOvjsTLUhnL50WFfQ3N2Lg8TDzPPBFF9ZQjrAYBEzNkoICeFLpPDZXFwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177272; c=relaxed/relaxed;
	bh=bB/n0tuy5MXIwOkt9tAaesxs0ng5wAqNy5T0xn6i1nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtbjvHvPHPudxMcb1R+0s07OLEaxH00Rljxb/yZqqjrT65DKTVIutKpbZwNDvYxB5aUiCcTLNmROsg4PmkPeGgSkQpi6WetfJV81NsEPymRjfEVObwIlLEP1HVG8zAG6zE2tyDew/L44NUZYDwwMMI9fTzswhdPxzYy9Tqs1PALTYGRHRLe/x4rreCoctSKvEvolAYj/flQ3J8woehLBX16Q+UbT3xrs8dhxf0LA3E6fc48nrg8J625aRasPG3U9tchJppsKmrCd+vXFF+eQgYwT55MMTd2R/9t3m05h4Wm+7eU2dFT4lJN9qys1CoKIcODWnlKYBSW5t8CpvgAmig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d4LM7CNb; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d4LM7CNb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZgdnG2BJVz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C49B961164;
	Sun, 20 Apr 2025 19:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88C2C4CEED;
	Sun, 20 Apr 2025 19:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177263;
	bh=HMSzkB91c7IREkKSrVwmdHo1uPEnRz+uSzHzcQq/qGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d4LM7CNbFNHSY9hnaV2d6rZrucqFS5jA0FMbMBdwQhTnV7B6CFjDepHfolH+jxCrh
	 5XrCpkEXF1CKL3Wv+meg+/WDdpWDdzMR6d0YTyx/HMTSK39QvEDQeB71H5T3OYMhbQ
	 5VulWkvXdM9Xy1c1JPSKPDoyxWJdCE7DGFYzgLOZ3vzo4owv5FqfvufKOKkpiWf6ak
	 UXWhl2RLrqSHRmi1NhZJ+h6oMbe+HEnlebNSYSvOQn5oR2L7vVspR7zZJYQhFQjLyp
	 PtqZ72j6asn+SwPhNngp7lPFqIHWEE/AUUj4NuLpX4GKx59STfPOQ4Q/f6vEY1VZeM
	 Yzu6bjYzg4QGw==
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
Subject: [PATCH v2 13/13] crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO
Date: Sun, 20 Apr 2025 12:26:09 -0700
Message-ID: <20250420192609.295075-14-ebiggers@kernel.org>
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
 arch/arm/lib/crypto/Kconfig     |  2 +-
 arch/arm64/lib/crypto/Kconfig   |  2 +-
 arch/mips/lib/crypto/Kconfig    |  2 +-
 arch/powerpc/lib/crypto/Kconfig |  2 +-
 arch/x86/lib/crypto/Kconfig     |  2 +-
 crypto/Kconfig                  |  2 +-
 lib/crypto/Kconfig              | 16 +++++-----------
 7 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/arch/arm/lib/crypto/Kconfig b/arch/arm/lib/crypto/Kconfig
index 5d10bd13fc8df..e8444fd0aae30 100644
--- a/arch/arm/lib/crypto/Kconfig
+++ b/arch/arm/lib/crypto/Kconfig
@@ -18,7 +18,7 @@ config CRYPTO_CHACHA20_NEON
 	default CRYPTO_LIB_CHACHA
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 
 config CRYPTO_POLY1305_ARM
 	tristate
-	default CRYPTO_LIB_POLY1305_INTERNAL
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
diff --git a/arch/arm64/lib/crypto/Kconfig b/arch/arm64/lib/crypto/Kconfig
index 2a8ff7cfc08d3..0b903ef524d85 100644
--- a/arch/arm64/lib/crypto/Kconfig
+++ b/arch/arm64/lib/crypto/Kconfig
@@ -8,7 +8,7 @@ config CRYPTO_CHACHA20_NEON
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 
 config CRYPTO_POLY1305_NEON
 	tristate
 	depends on KERNEL_MODE_NEON
-	default CRYPTO_LIB_POLY1305_INTERNAL
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
diff --git a/arch/mips/lib/crypto/Kconfig b/arch/mips/lib/crypto/Kconfig
index 454354e30d76c..0670a170c1be0 100644
--- a/arch/mips/lib/crypto/Kconfig
+++ b/arch/mips/lib/crypto/Kconfig
@@ -6,7 +6,7 @@ config CRYPTO_CHACHA_MIPS
 	default CRYPTO_LIB_CHACHA
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 
 config CRYPTO_POLY1305_MIPS
 	tristate
-	default CRYPTO_LIB_POLY1305_INTERNAL
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
diff --git a/arch/powerpc/lib/crypto/Kconfig b/arch/powerpc/lib/crypto/Kconfig
index 6627d28cd24e0..bf6d0ab22c27d 100644
--- a/arch/powerpc/lib/crypto/Kconfig
+++ b/arch/powerpc/lib/crypto/Kconfig
@@ -8,8 +8,8 @@ config CRYPTO_CHACHA20_P10
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 
 config CRYPTO_POLY1305_P10
 	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
-	default CRYPTO_LIB_POLY1305_INTERNAL
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
diff --git a/arch/x86/lib/crypto/Kconfig b/arch/x86/lib/crypto/Kconfig
index e44403d9677f5..546fe2afe0b51 100644
--- a/arch/x86/lib/crypto/Kconfig
+++ b/arch/x86/lib/crypto/Kconfig
@@ -20,7 +20,7 @@ config CRYPTO_CHACHA20_X86_64
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 
 config CRYPTO_POLY1305_X86_64
 	tristate
 	depends on 64BIT
-	default CRYPTO_LIB_POLY1305_INTERNAL
+	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 832af6363951f..9878286d1d683 100644
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
index c6ab724c1dbd9..af2368799579f 100644
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


