Return-Path: <linuxppc-dev+bounces-15579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B65AD14F97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:26:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3b1Bbzz3btq;
	Tue, 13 Jan 2026 06:23:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245835;
	cv=none; b=eT79GgXOifowEHMgsQSXZjZhOB45bMx2a9zAkCN/U66UmJmO8w7NCysvcJvyH1y83qF6LnhUL+JUfBsVRGmmiDU/ohoUN5/4Srb+PmJtH/1DsyP5bsk0pq1wVFGGl4pLQt4EFlO1ePUDcgxblPU4XYIfFygZ9Q1NKDmB8u1epYdi6YyopCs9Iw5ddPsnd2+VFNztIqBDPwrcf9iJ1SJIFUXcbNGWjFhdK0Qdpw0h0okwBY/BSUgr5D5qI0NyI6c0c3W3vtMsR7SCki38KY6zh858iJy6IOvQrnONYWPsbR6G8uyAxRagNcxFLeWdSELpfTSKMm6aY0nR796j3jEUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245835; c=relaxed/relaxed;
	bh=hHIdkrNjenKerl7v9oZhF52XZ21ubgCrF9s2N2VySnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8meLE95bWRKjOjnrSipLQF92UOC/HKJK3RgaMI8/ioiYZlq99RUCGfiArKJM5Gz0OI2+f4eINPMm98mVcBxi5Od02XdwwSCu4T6Zo/P2L81szULFP52H4gf92aCXovWsJrKnrj41JmGXRU9uwdyAOoxQI+rhA/hTWPl/xgB6X43FDq4zjmeZkIGQVjO3Z+golY3bhlIXXjrg3Fs/w8rc74PL0/+SoTZB+CoZ8T0lYN3RQgQ7t+fSESe0gm3Bq7h1bwm3HBeC/unH5Vy9i8y8D67R6f4u/svt+I2gAaYfZYiSQs4FR62yiyw6DtOa7suWgzQw+qIqNrIQGcMRYECIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oSEzCq+j; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oSEzCq+j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3Z2nmcz3bsn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4931F4374B;
	Mon, 12 Jan 2026 19:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85EEC2BCB1;
	Mon, 12 Jan 2026 19:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245802;
	bh=eqf3Or+nI3+CRqy3oJpCv5lnMY4rP3QtNL7pdFy6UrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oSEzCq+jiR/8DC6FoKeyoJUpLSs0Yo3HfXBOqh7IEsEBy8rFgYOzBPo5leCndVDx5
	 E/J7T4QYTGi8wBoTu9aLADQhjO5Xz+FYOhbbtIF27ehNwgyNcNkz89ywCt9q+SrLj1
	 XiIqWs+FGgJI9XiMjudkcB4xRRLkd6rDDZCgQ3YLDJ6yJ+/p9hL8Mm7g2C3W5jNcXE
	 tGM01jJ9jQRUosrS0/AzLS/QXtAOs1a/89jHs2rvpxNVvDHvaBQXLjt7cM0PdYhxiR
	 fDZTm2SNAlxKf9JngwcHUG/bNnGc2D4U/DYcddPlqRTVgW+Wzq0f3jV8ovaNyvUV9K
	 LMbfoUhzvVraw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 08/35] crypto: aes - Remove aes-fixed-time / CONFIG_CRYPTO_AES_TI
Date: Mon, 12 Jan 2026 11:20:06 -0800
Message-ID: <20260112192035.10427-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove aes-fixed-time, i.e. CONFIG_CRYPTO_AES_TI.  This was a wrapper
around the 256-byte-table-based AES implementation in lib/crypto/aes.c,
with extra code to enable and disable IRQs for constant-time hardening.

While nice in theory, in practice this had the following issues:

- For bulk en/decryption it was 2-4 times slower than aes-generic.  This
  resulted in aes-generic still being needed, creating fragmentation.

- Having both aes-generic and aes-fixed-time punted an AES
  implementation decision to distros and users who are generally
  unprepared to handle it.  In practice, whether aes-fixed-time gets
  used tends to be incidental and not match an explicit distro or user
  intent.  (While aes-fixed-time has a higher priority than aes-generic,
  whether it actually gets enabled, loaded, and used depends on the
  kconfig and whether a modprobe of "aes" happens to be done.  It also
  has a lower priority than aes-arm and aes-arm64.)

- My changes to the generic AES code (in other commits) significantly
  close the gap with aes-fixed-time anyway.  The table size is reduced
  from 8192 bytes to 1024 bytes, and prefetching is added.

- While AES code *should* be constant-time, the real solutions for that
  are AES instructions (which most CPUs have now) or bit-slicing.  arm
  and arm64 already have bit-sliced AES code for many modes; generic
  bit-sliced code could be written but would be very slow for single
  blocks.  Overall, I suggest that trying to write constant-time
  table-based AES code is a bit futile anyway, and in the rare cases
  where a proper AES implementation is still unavailable it's reasonable
  to compromise with an implementation that simply prefetches the table.

Thus, this commit removes aes-fixed-time and CONFIG_CRYPTO_AES_TI.  The
replacement is just the existing CONFIG_CRYPTO_AES, which for now maps
to the existing aes-generic code, but I'll soon be changing to use the
improved AES library code instead.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/m68k/configs/amiga_defconfig    |  1 -
 arch/m68k/configs/apollo_defconfig   |  1 -
 arch/m68k/configs/atari_defconfig    |  1 -
 arch/m68k/configs/bvme6000_defconfig |  1 -
 arch/m68k/configs/hp300_defconfig    |  1 -
 arch/m68k/configs/mac_defconfig      |  1 -
 arch/m68k/configs/multi_defconfig    |  1 -
 arch/m68k/configs/mvme147_defconfig  |  1 -
 arch/m68k/configs/mvme16x_defconfig  |  1 -
 arch/m68k/configs/q40_defconfig      |  1 -
 arch/m68k/configs/sun3_defconfig     |  1 -
 arch/m68k/configs/sun3x_defconfig    |  1 -
 arch/s390/configs/debug_defconfig    |  2 +-
 arch/s390/configs/defconfig          |  2 +-
 crypto/Kconfig                       | 21 -------
 crypto/Makefile                      |  1 -
 crypto/aes_ti.c                      | 83 ----------------------------
 17 files changed, 2 insertions(+), 119 deletions(-)
 delete mode 100644 crypto/aes_ti.c

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index bfc1ee7c8158..bffcc417f44c 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -553,11 +553,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index d9d1f3c4c70d..3f894c20b132 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -510,11 +510,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 523205adccc8..5c5603ca16aa 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -530,11 +530,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 7b0a4ef0b010..37c747ee395e 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -502,11 +502,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 089c5c394c62..1a376c2b8c45 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -512,11 +512,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 5f2484c36733..2b26450692a5 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -529,11 +529,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 74f0a1f6d871..012e0e1f506f 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -616,11 +616,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 4bee18c820e4..37634b35bfbd 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -502,11 +502,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 322c17e55c9a..a0d2e0070afa 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -503,11 +503,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 82f9baab8fea..62cc3964fc34 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -519,11 +519,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index f94ad226cb5b..13107aa4a1b4 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -500,11 +500,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index a5ecfc505ab2..eaab0ba08989 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -500,11 +500,10 @@ CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
 CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 0713914b25b4..09f4bdb9e64f 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -768,11 +768,11 @@ CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_AES_TI=m
+CONFIG_CRYPTO_AES=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index c064e0cacc98..823193b9f4c6 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -752,11 +752,11 @@ CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_AES_TI=m
+CONFIG_CRYPTO_AES=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 443fe8e016fd..db6b0c2fb50e 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -364,31 +364,10 @@ config CRYPTO_AES
 	  demonstrates excellent performance. Rijndael's operations are
 	  among the easiest to defend against power and timing attacks.
 
 	  The AES specifies three key sizes: 128, 192 and 256 bits
 
-config CRYPTO_AES_TI
-	tristate "AES (Advanced Encryption Standard) (fixed time)"
-	select CRYPTO_ALGAPI
-	select CRYPTO_LIB_AES
-	help
-	  AES cipher algorithms (Rijndael)(FIPS-197, ISO/IEC 18033-3)
-
-	  This is a generic implementation of AES that attempts to eliminate
-	  data dependent latencies as much as possible without affecting
-	  performance too much. It is intended for use by the generic CCM
-	  and GCM drivers, and other CTR or CMAC/XCBC based modes that rely
-	  solely on encryption (although decryption is supported as well, but
-	  with a more dramatic performance hit)
-
-	  Instead of using 16 lookup tables of 1 KB each, (8 for encryption and
-	  8 for decryption), this implementation only uses just two S-boxes of
-	  256 bytes each, and attempts to eliminate data dependent latencies by
-	  prefetching the entire table into the cache at the start of each
-	  block. Interrupts are also disabled to avoid races where cachelines
-	  are evicted when the CPU is interrupted to do something else.
-
 config CRYPTO_ANUBIS
 	tristate "Anubis"
 	depends on CRYPTO_USER_API_ENABLE_OBSOLETE
 	select CRYPTO_ALGAPI
 	help
diff --git a/crypto/Makefile b/crypto/Makefile
index 23d3db7be425..be403dc20645 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -132,11 +132,10 @@ obj-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
 CFLAGS_serpent_generic.o := $(call cc-option,-fsched-pressure)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
 obj-$(CONFIG_CRYPTO_AES) += aes_generic.o
 CFLAGS_aes_generic.o := $(call cc-option,-fno-code-hoisting) # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83356
 obj-$(CONFIG_CRYPTO_SM4) += sm4.o
 obj-$(CONFIG_CRYPTO_SM4_GENERIC) += sm4_generic.o
-obj-$(CONFIG_CRYPTO_AES_TI) += aes_ti.o
 obj-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
 obj-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
 obj-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
 obj-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
 obj-$(CONFIG_CRYPTO_ARC4) += arc4.o
diff --git a/crypto/aes_ti.c b/crypto/aes_ti.c
deleted file mode 100644
index a3b342f92fab..000000000000
--- a/crypto/aes_ti.c
+++ /dev/null
@@ -1,83 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Scalar fixed time AES core transform
- *
- * Copyright (C) 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <crypto/aes.h>
-#include <crypto/algapi.h>
-#include <linux/module.h>
-
-static int aesti_set_key(struct crypto_tfm *tfm, const u8 *in_key,
-			 unsigned int key_len)
-{
-	struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return aes_expandkey(ctx, in_key, key_len);
-}
-
-static void aesti_encrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	const struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-	unsigned long flags;
-
-	/*
-	 * Temporarily disable interrupts to avoid races where cachelines are
-	 * evicted when the CPU is interrupted to do something else.
-	 */
-	local_irq_save(flags);
-
-	aes_encrypt(ctx, out, in);
-
-	local_irq_restore(flags);
-}
-
-static void aesti_decrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	const struct crypto_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-	unsigned long flags;
-
-	/*
-	 * Temporarily disable interrupts to avoid races where cachelines are
-	 * evicted when the CPU is interrupted to do something else.
-	 */
-	local_irq_save(flags);
-
-	aes_decrypt(ctx, out, in);
-
-	local_irq_restore(flags);
-}
-
-static struct crypto_alg aes_alg = {
-	.cra_name			= "aes",
-	.cra_driver_name		= "aes-fixed-time",
-	.cra_priority			= 100 + 1,
-	.cra_flags			= CRYPTO_ALG_TYPE_CIPHER,
-	.cra_blocksize			= AES_BLOCK_SIZE,
-	.cra_ctxsize			= sizeof(struct crypto_aes_ctx),
-	.cra_module			= THIS_MODULE,
-
-	.cra_cipher.cia_min_keysize	= AES_MIN_KEY_SIZE,
-	.cra_cipher.cia_max_keysize	= AES_MAX_KEY_SIZE,
-	.cra_cipher.cia_setkey		= aesti_set_key,
-	.cra_cipher.cia_encrypt		= aesti_encrypt,
-	.cra_cipher.cia_decrypt		= aesti_decrypt
-};
-
-static int __init aes_init(void)
-{
-	return crypto_register_alg(&aes_alg);
-}
-
-static void __exit aes_fini(void)
-{
-	crypto_unregister_alg(&aes_alg);
-}
-
-module_init(aes_init);
-module_exit(aes_fini);
-
-MODULE_DESCRIPTION("Generic fixed time AES");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-- 
2.52.0


