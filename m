Return-Path: <linuxppc-dev+bounces-7828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83739A94926
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZgdnK0mMsz3byZ;
	Mon, 21 Apr 2025 05:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177268;
	cv=none; b=hBw8JKalh6gBw6F+k7nYKkDSY8nB46Kl+MPEnrNKy74LZ7VigJgubL0Ptny+8Tlp/6DsO8OJxW81/DB3hm+vEiZEKfVs/HN6cbWc2vhNf4bqkxY2csaao12l4QbyCLMg69VYJ78Loj4moOnK/RIqTWjk/xc46lnxfBkCplJLKrEOPgivO4U0abYjfqwEqB2/v8qw4GIwRmzo886BOHISwa10s3qv5gSBxvcYP5nE+B8ojY7SkmiCWj6tCg/Sg5vUSBM+Je8ZlfrqyUy+sGbodVU0ssYTM5RB+hC0PWrMWwHKZ/NQn4lWAInqHhvGGfBZ7DJ03wPfd2kKcl/fAynqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177268; c=relaxed/relaxed;
	bh=PoacIltR1i/jDsr4GLHB/rQGoaje1PKsTSdEzeCr5TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BN3Ca1sk4mmH0upZ6fLUyw1v36uxB8HZOe5gQSSQWnkT7DGUNHhmBunRy2PfZS9KUkt6mqO2bZc+trKPUr3Lte2nM7wX6qJ+UqA7iBWC0u9JG1WY0rX/z6PYQzC3/G86oP1+iY37Hw70hF/SoatSc78fhZvBwNliP1BWeskZXHrOtKwfGBHvVO/RGz+qB6ljDyCcQKE4GBp8p8kV2r0EpOZwRdhcghkSy5v0/Usj+q6CvxgDhCbEjm8goQRn5cILfj/Dw1HB6N93TVVKshurmWSykv7OQU1BJl0XGPR6NDM/93C3Kd5CgBHSs6Cd4wUdrps47/U7wPeco1ikJF9M8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OLfdv4Pe; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OLfdv4Pe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zgdn93m6pz2yST
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8AF94A6EC;
	Sun, 20 Apr 2025 19:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FA0C4CEEF;
	Sun, 20 Apr 2025 19:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177259;
	bh=mivDVzERcJd4HNiCgpjTrrXLffBBYDH/2mu7Bg91B/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OLfdv4Pe2JXQFWbsP+znq+SEBDoP7GQwOeJnh2K7v7E4jz3e2jlwQyDkoSmd2f7vP
	 hYDMRT/e9w+Tn/NFgav+tHYX6q+dVUBHjcLKcsSe8SkgJLGJkp/bGX+QRpXZVBbHgL
	 KvX1O4QT2j4IgddN7bAY8so3PwRgP8NF1DZdE+PB0E5hN53vexaCCfFsbHxKbvuA0r
	 qV+gLqUDFPl6W3YLfHX7CtLPhfkAQAWIf+VMWBcxQOFktBmanjrVWwq1BxmNBKYiPk
	 ZHQ/xXuzETMHqV6DPf7pGt4U+e0ePyJSAtpTh7+3AdYZJH6+85zpmv44HLaGPh6kim
	 Lv2QqswnV/sNw==
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
Subject: [PATCH v2 04/13] crypto: x86 - drop redundant dependencies on X86
Date: Sun, 20 Apr 2025 12:26:00 -0700
Message-ID: <20250420192609.295075-5-ebiggers@kernel.org>
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

arch/x86/crypto/Kconfig is sourced only when CONFIG_X86=y, so there is
no need for the symbols defined inside it to depend on X86.

In the case of CRYPTO_TWOFISH_586 and CRYPTO_TWOFISH_X86_64, the
dependency was actually on '(X86 || UML_X86)', which suggests that these
two symbols were intended to be available under user-mode Linux as well.
Yet, again these symbols were defined only when CONFIG_X86=y, so that
was not the case.  Just remove this redundant dependency.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/Kconfig | 67 ++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 9a3cade49f638..b4df6cf37e0ea 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (x86)"
 
 config CRYPTO_CURVE25519_X86
 	tristate
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_KPP
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help
@@ -15,11 +15,10 @@ config CRYPTO_CURVE25519_X86
 	  Architecture: x86_64 using:
 	  - ADX (large integer arithmetic)
 
 config CRYPTO_AES_NI_INTEL
 	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XCTR, XTS, GCM (AES-NI/VAES)"
-	depends on X86
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_GF128MUL
 	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
@@ -35,11 +34,11 @@ config CRYPTO_AES_NI_INTEL
 	  Some algorithm implementations are supported only in 64-bit builds,
 	  and some have additional prerequisites such as AVX2 or AVX512.
 
 config CRYPTO_BLOWFISH_X86_64
 	tristate "Ciphers: Blowfish, modes: ECB, CBC"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_BLOWFISH_COMMON
 	imply CRYPTO_CTR
 	help
 	  Block cipher: Blowfish cipher algorithm
@@ -47,22 +46,22 @@ config CRYPTO_BLOWFISH_X86_64
 
 	  Architecture: x86_64
 
 config CRYPTO_CAMELLIA_X86_64
 	tristate "Ciphers: Camellia with modes: ECB, CBC"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	imply CRYPTO_CTR
 	help
 	  Block cipher: Camellia cipher algorithms
 	  Length-preserving ciphers: Camellia with ECB and CBC modes
 
 	  Architecture: x86_64
 
 config CRYPTO_CAMELLIA_AESNI_AVX_X86_64
 	tristate "Ciphers: Camellia with modes: ECB, CBC (AES-NI/AVX)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_CAMELLIA_X86_64
 	imply CRYPTO_XTS
 	help
 	  Length-preserving ciphers: Camellia with ECB and CBC modes
@@ -71,22 +70,22 @@ config CRYPTO_CAMELLIA_AESNI_AVX_X86_64
 	  - AES-NI (AES New Instructions)
 	  - AVX (Advanced Vector Extensions)
 
 config CRYPTO_CAMELLIA_AESNI_AVX2_X86_64
 	tristate "Ciphers: Camellia with modes: ECB, CBC (AES-NI/AVX2)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_CAMELLIA_AESNI_AVX_X86_64
 	help
 	  Length-preserving ciphers: Camellia with ECB and CBC modes
 
 	  Architecture: x86_64 using:
 	  - AES-NI (AES New Instructions)
 	  - AVX2 (Advanced Vector Extensions 2)
 
 config CRYPTO_CAST5_AVX_X86_64
 	tristate "Ciphers: CAST5 with modes: ECB, CBC (AVX)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_CAST5
 	select CRYPTO_CAST_COMMON
 	imply CRYPTO_CTR
 	help
@@ -98,11 +97,11 @@ config CRYPTO_CAST5_AVX_X86_64
 
 	  Processes 16 blocks in parallel.
 
 config CRYPTO_CAST6_AVX_X86_64
 	tristate "Ciphers: CAST6 with modes: ECB, CBC (AVX)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_CAST6
 	select CRYPTO_CAST_COMMON
 	imply CRYPTO_XTS
 	imply CRYPTO_CTR
@@ -115,11 +114,11 @@ config CRYPTO_CAST6_AVX_X86_64
 
 	  Processes eight blocks in parallel.
 
 config CRYPTO_DES3_EDE_X86_64
 	tristate "Ciphers: Triple DES EDE with modes: ECB, CBC"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_DES
 	imply CRYPTO_CTR
 	help
 	  Block cipher: Triple DES EDE (FIPS 46-3) cipher algorithm
@@ -129,11 +128,11 @@ config CRYPTO_DES3_EDE_X86_64
 
 	  Processes one or three blocks in parallel.
 
 config CRYPTO_SERPENT_SSE2_X86_64
 	tristate "Ciphers: Serpent with modes: ECB, CBC (SSE2)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SERPENT
 	imply CRYPTO_CTR
 	help
 	  Length-preserving ciphers: Serpent cipher algorithm
@@ -144,11 +143,11 @@ config CRYPTO_SERPENT_SSE2_X86_64
 
 	  Processes eight blocks in parallel.
 
 config CRYPTO_SERPENT_SSE2_586
 	tristate "Ciphers: Serpent with modes: ECB, CBC (32-bit with SSE2)"
-	depends on X86 && !64BIT
+	depends on !64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SERPENT
 	imply CRYPTO_CTR
 	help
 	  Length-preserving ciphers: Serpent cipher algorithm
@@ -159,11 +158,11 @@ config CRYPTO_SERPENT_SSE2_586
 
 	  Processes four blocks in parallel.
 
 config CRYPTO_SERPENT_AVX_X86_64
 	tristate "Ciphers: Serpent with modes: ECB, CBC (AVX)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SERPENT
 	imply CRYPTO_XTS
 	imply CRYPTO_CTR
 	help
@@ -175,11 +174,11 @@ config CRYPTO_SERPENT_AVX_X86_64
 
 	  Processes eight blocks in parallel.
 
 config CRYPTO_SERPENT_AVX2_X86_64
 	tristate "Ciphers: Serpent with modes: ECB, CBC (AVX2)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SERPENT_AVX_X86_64
 	help
 	  Length-preserving ciphers: Serpent cipher algorithm
 	  with ECB and CBC modes
 
@@ -188,11 +187,11 @@ config CRYPTO_SERPENT_AVX2_X86_64
 
 	  Processes 16 blocks in parallel.
 
 config CRYPTO_SM4_AESNI_AVX_X86_64
 	tristate "Ciphers: SM4 with modes: ECB, CBC, CTR (AES-NI/AVX)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ALGAPI
 	select CRYPTO_SM4
 	help
 	  Length-preserving ciphers: SM4 cipher algorithms
@@ -208,11 +207,11 @@ config CRYPTO_SM4_AESNI_AVX_X86_64
 
 	  If unsure, say N.
 
 config CRYPTO_SM4_AESNI_AVX2_X86_64
 	tristate "Ciphers: SM4 with modes: ECB, CBC, CTR (AES-NI/AVX2)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ALGAPI
 	select CRYPTO_SM4
 	select CRYPTO_SM4_AESNI_AVX_X86_64
 	help
@@ -229,33 +228,33 @@ config CRYPTO_SM4_AESNI_AVX2_X86_64
 
 	  If unsure, say N.
 
 config CRYPTO_TWOFISH_586
 	tristate "Ciphers: Twofish (32-bit)"
-	depends on (X86 || UML_X86) && !64BIT
+	depends on !64BIT
 	select CRYPTO_ALGAPI
 	select CRYPTO_TWOFISH_COMMON
 	imply CRYPTO_CTR
 	help
 	  Block cipher: Twofish cipher algorithm
 
 	  Architecture: x86 (32-bit)
 
 config CRYPTO_TWOFISH_X86_64
 	tristate "Ciphers: Twofish"
-	depends on (X86 || UML_X86) && 64BIT
+	depends on 64BIT
 	select CRYPTO_ALGAPI
 	select CRYPTO_TWOFISH_COMMON
 	imply CRYPTO_CTR
 	help
 	  Block cipher: Twofish cipher algorithm
 
 	  Architecture: x86_64
 
 config CRYPTO_TWOFISH_X86_64_3WAY
 	tristate "Ciphers: Twofish with modes: ECB, CBC (3-way parallel)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_TWOFISH_COMMON
 	select CRYPTO_TWOFISH_X86_64
 	help
 	  Length-preserving cipher: Twofish cipher algorithm
@@ -266,11 +265,11 @@ config CRYPTO_TWOFISH_X86_64_3WAY
 	  Processes three blocks in parallel, better utilizing resources of
 	  out-of-order CPUs.
 
 config CRYPTO_TWOFISH_AVX_X86_64
 	tristate "Ciphers: Twofish with modes: ECB, CBC (AVX)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_TWOFISH_COMMON
 	select CRYPTO_TWOFISH_X86_64
 	select CRYPTO_TWOFISH_X86_64_3WAY
 	imply CRYPTO_XTS
@@ -283,11 +282,11 @@ config CRYPTO_TWOFISH_AVX_X86_64
 
 	  Processes eight blocks in parallel.
 
 config CRYPTO_ARIA_AESNI_AVX_X86_64
 	tristate "Ciphers: ARIA with modes: ECB, CTR (AES-NI/AVX/GFNI)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ALGAPI
 	select CRYPTO_ARIA
 	help
 	  Length-preserving cipher: ARIA cipher algorithms
@@ -300,11 +299,11 @@ config CRYPTO_ARIA_AESNI_AVX_X86_64
 
 	  Processes 16 blocks in parallel.
 
 config CRYPTO_ARIA_AESNI_AVX2_X86_64
 	tristate "Ciphers: ARIA with modes: ECB, CTR (AES-NI/AVX2/GFNI)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ALGAPI
 	select CRYPTO_ARIA
 	select CRYPTO_ARIA_AESNI_AVX_X86_64
 	help
@@ -318,11 +317,11 @@ config CRYPTO_ARIA_AESNI_AVX2_X86_64
 
 	  Processes 32 blocks in parallel.
 
 config CRYPTO_ARIA_GFNI_AVX512_X86_64
 	tristate "Ciphers: ARIA with modes: ECB, CTR (AVX512/GFNI)"
-	depends on X86 && 64BIT && AS_GFNI
+	depends on 64BIT && AS_GFNI
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ALGAPI
 	select CRYPTO_ARIA
 	select CRYPTO_ARIA_AESNI_AVX_X86_64
 	select CRYPTO_ARIA_AESNI_AVX2_X86_64
@@ -336,49 +335,49 @@ config CRYPTO_ARIA_GFNI_AVX512_X86_64
 
 	  Processes 64 blocks in parallel.
 
 config CRYPTO_CHACHA20_X86_64
 	tristate
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_AEGIS128_AESNI_SSE2
 	tristate "AEAD ciphers: AEGIS-128 (AES-NI/SSE4.1)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_AEAD
 	help
 	  AEGIS-128 AEAD algorithm
 
 	  Architecture: x86_64 using:
 	  - AES-NI (AES New Instructions)
 	  - SSE4.1 (Streaming SIMD Extensions 4.1)
 
 config CRYPTO_NHPOLY1305_SSE2
 	tristate "Hash functions: NHPoly1305 (SSE2)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_NHPOLY1305
 	help
 	  NHPoly1305 hash function for Adiantum
 
 	  Architecture: x86_64 using:
 	  - SSE2 (Streaming SIMD Extensions 2)
 
 config CRYPTO_NHPOLY1305_AVX2
 	tristate "Hash functions: NHPoly1305 (AVX2)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_NHPOLY1305
 	help
 	  NHPoly1305 hash function for Adiantum
 
 	  Architecture: x86_64 using:
 	  - AVX2 (Advanced Vector Extensions 2)
 
 config CRYPTO_BLAKE2S_X86
 	bool "Hash functions: BLAKE2s (SSSE3/AVX-512)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_LIB_BLAKE2S_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_BLAKE2S
 	help
 	  BLAKE2s cryptographic hash function (RFC 7693)
 
@@ -386,27 +385,27 @@ config CRYPTO_BLAKE2S_X86
 	  - SSSE3 (Supplemental SSE3)
 	  - AVX-512 (Advanced Vector Extensions-512)
 
 config CRYPTO_POLYVAL_CLMUL_NI
 	tristate "Hash functions: POLYVAL (CLMUL-NI)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_POLYVAL
 	help
 	  POLYVAL hash function for HCTR2
 
 	  Architecture: x86_64 using:
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
 config CRYPTO_POLY1305_X86_64
 	tristate
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_SHA1_SSSE3
 	tristate "Hash functions: SHA-1 (SSSE3/AVX/AVX2/SHA-NI)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SHA1
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
@@ -416,11 +415,11 @@ config CRYPTO_SHA1_SSSE3
 	  - AVX2 (Advanced Vector Extensions 2)
 	  - SHA-NI (SHA Extensions New Instructions)
 
 config CRYPTO_SHA256_SSSE3
 	tristate "Hash functions: SHA-224 and SHA-256 (SSSE3/AVX/AVX2/SHA-NI)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SHA256
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
@@ -430,11 +429,11 @@ config CRYPTO_SHA256_SSSE3
 	  - AVX2 (Advanced Vector Extensions 2)
 	  - SHA-NI (SHA Extensions New Instructions)
 
 config CRYPTO_SHA512_SSSE3
 	tristate "Hash functions: SHA-384 and SHA-512 (SSSE3/AVX/AVX2)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_SHA512
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
@@ -443,11 +442,11 @@ config CRYPTO_SHA512_SSSE3
 	  - AVX (Advanced Vector Extensions)
 	  - AVX2 (Advanced Vector Extensions 2)
 
 config CRYPTO_SM3_AVX_X86_64
 	tristate "Hash functions: SM3 (AVX)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
 	help
 	  SM3 secure hash function as defined by OSCCA GM/T 0004-2012 SM3
 
@@ -456,11 +455,11 @@ config CRYPTO_SM3_AVX_X86_64
 
 	  If unsure, say N.
 
 config CRYPTO_GHASH_CLMUL_NI_INTEL
 	tristate "Hash functions: GHASH (CLMUL-NI)"
-	depends on X86 && 64BIT
+	depends on 64BIT
 	select CRYPTO_CRYPTD
 	help
 	  GCM GHASH hash function (NIST SP800-38D)
 
 	  Architecture: x86_64 using:
-- 
2.49.0


