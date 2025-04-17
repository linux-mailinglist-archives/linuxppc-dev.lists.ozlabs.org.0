Return-Path: <linuxppc-dev+bounces-7764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A2A927A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 20:28:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdmZs5Ng8z3c6Z;
	Fri, 18 Apr 2025 04:27:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744914437;
	cv=none; b=NyTKNcF1RX7ULbwfNZreC1IKwO2fO8BRXNSLIAeXghhVa7pw2jP9VH7wcWV/W1oQG9bpa/URTMBqxA/Ny2eBanlHqdYMcJfzSOz62nK9V+/Po7PvjeMfj+ZRVbnn1a0IlYVAmznEzLYBrc9pXu1bATxXt1RtIDNQAoLjQrfPGqS+waoDaNahDA+mo+4tlWAMSR58LY0I+HRiUf2uteYTNxFUz8hIHpM9pwA/y8+TTKnnRJyF6oR6YjIPKpVWfKmfS2rrZgyVwM4K66MhVLUin4cqvp/8dOm6TwlupEZ5sZ8KFJPho2g2Q3JWumFD6gLz8Kg3JnyqrmZLCC9psi3D7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744914437; c=relaxed/relaxed;
	bh=Q1OkdsfczKfuuMwdp5evoONWBl+wnTUoP+ZyM/DXJYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0gR+pP75L33roBycVJvZGaVbLd+UYzBnX889hfHW8WK3IHyu65LI49DG4kc0urYJhUm6G4Ti3KbmF8gU7B+sSB8MSlZp5o2wvk6X553YPeMebq7jRtpZyel21TIEoffKiCXUmBn0/K0DNb2jVOxrpdTUa4UtwMd7h7hv8QHH4l6KuXhkWO9lujGD5FJaO7NVhMz3mul/gbuWjqdct5hb9FKj0TgeYfHIMY+6gmlx+AUiNKkRlIrl61fynCNhMC/CGDKNnpKgnqatTYYC8XuMRKcMd9dMCobsjgh/qCsnwZksN/60eGooQuYi3eRvwiRdP8FN/Fq5291wREmHk1K0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XbNidi6A; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XbNidi6A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdmZs00c5z3c4r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 04:27:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 503C55C587E;
	Thu, 17 Apr 2025 18:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4949CC4CEEC;
	Thu, 17 Apr 2025 18:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914435;
	bh=wTYOYOEcD2tS5YApzAw5JpRPXQeBTl3cVi6SPyyOu+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XbNidi6AtUqg9ISmFMuBJvftddFhJ2bcWeL+ejDz2zW4ZErEzBHzZYDummTru8tmW
	 y4GOfnNa09S9itz1MfWA23c6oDCpNd7uqxbv1F/9JdCV0B2Db+8HsWek8EzVZdO+vO
	 +sRYZ5pucJykN1CDLhm35tsJPBJYshSIF25x70GuEHXa11iNNqyuO1DDOcDJ2EkRza
	 xWWwnzzSLvJGFi/kjZWECMXrYXrGklDMeY0x2rXJWAIFC+B6H8ACWQ5kPnlU+4xN3i
	 mkhVtPkRCj5RRVowUKtQFtRaTZhi7MCmpNj8shK6yD8mqvrdNNF7TxpMUYCJ9d3FwO
	 qcCdh5Ka8LHMQ==
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
Subject: [PATCH 10/15] crypto: s390 - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:18 -0700
Message-ID: <20250417182623.67808-11-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Continue disentangling the crypto library functions from the generic
crypto infrastructure by removing the unnecessary CRYPTO dependency of
CRYPTO_CHACHA_S390.  To do this, make arch/s390/crypto/Kconfig be
sourced regardless of CRYPTO, and explicitly list the CRYPTO dependency
in the symbols that do need it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/Kconfig        | 4 ++++
 arch/s390/crypto/Kconfig | 9 +++++++++
 crypto/Kconfig           | 3 ---
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index db8161ebb43c..2f32d51e8a73 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -679,10 +679,14 @@ config KERNEL_IMAGE_BASE
 
 	  If the value of this option leads to the kernel image overlapping
 	  the virtual memory where other data structures are located, this
 	  option is ignored and the image is loaded above the structures.
 
+if !KMSAN # avoid false positives from assembly
+source "arch/s390/crypto/Kconfig"
+endif
+
 endmenu
 
 menu "Memory setup"
 
 config ARCH_SPARSEMEM_ENABLE
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index e88d9cd256ef..a2e6efd8aed8 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -2,70 +2,77 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (s390)"
 
 config CRYPTO_SHA512_S390
 	tristate "Hash functions: SHA-384 and SHA-512"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: s390
 
 	  It is available as of z10.
 
 config CRYPTO_SHA1_S390
 	tristate "Hash functions: SHA-1"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: s390
 
 	  It is available as of z990.
 
 config CRYPTO_SHA256_S390
 	tristate "Hash functions: SHA-224 and SHA-256"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: s390
 
 	  It is available as of z9.
 
 config CRYPTO_SHA3_256_S390
 	tristate "Hash functions: SHA3-224 and SHA3-256"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA3-224 and SHA3-256 secure hash algorithms (FIPS 202)
 
 	  Architecture: s390
 
 	  It is available as of z14.
 
 config CRYPTO_SHA3_512_S390
 	tristate "Hash functions: SHA3-384 and SHA3-512"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA3-384 and SHA3-512 secure hash algorithms (FIPS 202)
 
 	  Architecture: s390
 
 	  It is available as of z14.
 
 config CRYPTO_GHASH_S390
 	tristate "Hash functions: GHASH"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  GCM GHASH hash function (NIST SP800-38D)
 
 	  Architecture: s390
 
 	  It is available as of z196.
 
 config CRYPTO_AES_S390
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, XTS, GCM"
+	depends on CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	help
 	  Block cipher: AES cipher algorithms (FIPS 197)
 	  AEAD cipher: AES with GCM
@@ -83,10 +90,11 @@ config CRYPTO_AES_S390
 	  key sizes and XTS mode is hardware accelerated for 256 and
 	  512 bit keys.
 
 config CRYPTO_DES_S390
 	tristate "Ciphers: DES and Triple DES EDE, modes: ECB, CBC, CTR"
+	depends on CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_DES
 	help
 	  Block ciphers: DES (FIPS 46-2) cipher algorithm
@@ -105,10 +113,11 @@ config CRYPTO_CHACHA_S390
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_HMAC_S390
 	tristate "Keyed-hash message authentication code: HMAC"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  s390 specific HMAC hardware support for SHA224, SHA256, SHA384 and
 	  SHA512.
 
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 8c334c9f2081..78e83ce576ed 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if S390
-source "arch/s390/crypto/Kconfig"
-endif
 if SPARC
 source "arch/sparc/crypto/Kconfig"
 endif
 if X86
 source "arch/x86/crypto/Kconfig"
-- 
2.49.0


