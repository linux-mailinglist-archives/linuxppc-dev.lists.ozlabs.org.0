Return-Path: <linuxppc-dev+bounces-7831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33268A9492E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZgdnL72yhz2ySP;
	Mon, 21 Apr 2025 05:27:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177270;
	cv=none; b=kO33B2aNUiKam9v1VnYUbnPR5dUup0FCAIsWubSt9Aoaai0ejt80T5HnmbUSE9us+Y5fWxQVIgzzoiL8f37NSrcwN2h0roCX618CQaUGLnm2IzbChjPJjvzHnRlmv80RC6aLgcQMwlHigMRRJ9k2FmUpieju0m6ukjl92O2Ktf54zOYmA22f3bdu9ov/CeYjIXybZG3YIMNNJdJ9kV5NNfr0vZ9MlhQ2ni56aeSqsSHfmUc41j3FNPHUs8CT0SuVkLaB88uh2Lmg927zgfYP6GqC21OEOxSlpn5qlq6TgoLGFBEVZrRxEFQY+5jISriHRMOCkHV2YVGyUdV54FmApg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177270; c=relaxed/relaxed;
	bh=ANbCgz3llHchROYIOQePoX+OweczqFG3E3wg3zfRZtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwsBjU8omStAj7P9MW5fy0IZyb9kti9BjkMQ75CNCgNBttWANZqdHWKiGONWubhPUdCgNBBe0gP9JywMnNYilGOH9sx6rQmh3AJ6d+AgFDOo1MGqbJidoBIP0rU4HAg6xNjiErNOHy147DdhVsTFEJ9akPHRLEuz2fWXxPkj30O19bbrnX9EzxjWm0nkwRBlx3bqEmjbSqhWTdoR/X8l6tE6yNjTjsHhNAtRsaxHYJuPSdRefmjenpUW4I96FI3Q4X3Qrs9vSRMcIAjqBaWsCRj8/khwG4ghjLJug6J+eQ4p1t5Ma89aWjOb+3oN8NL2rQpk7kGhy7a/ANxVRrfHJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLQurH4m; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLQurH4m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZgdnF0D57z3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7F0CA4BA30;
	Sun, 20 Apr 2025 19:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDADC4CEF0;
	Sun, 20 Apr 2025 19:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177261;
	bh=u+OK7tFveVR0om3+lNaIeYM0HzeTeASq3YZREbliyFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLQurH4mvImNRkbdsejvvFmWVFmrkhdpmyEEO9MnBmWuy8/+SmxN9LYIlDW3djSE2
	 /1xoV9sY7d/MZAwj5oFvWgyU6pQZbjgUyPxdVsKOsF54vbz1mutBkw4axN+VYwfYCn
	 Ms3bMFuXRd+OFvsjAgJkn0F3MuNidZw7NM055c+XbPkkksj/I2/vpuQiUbZOXRbJ5V
	 rxBJgpMYScXs1Mb3njNRNfY9LqY/zYKdhi1Jeb+PH0l97Xt5hRoviXNzmARfwnxeka
	 cWUOZmm71r1VQuU7NOBG4ny/tFUv8B9hOAkPB6FqaDKziniWnoCqNa69YcrMoEtg7/
	 cK2/icIun6j9w==
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
Subject: [PATCH v2 10/13] crypto: s390 - move library functions to arch/s390/lib/crypto/
Date: Sun, 20 Apr 2025 12:26:06 -0700
Message-ID: <20250420192609.295075-11-ebiggers@kernel.org>
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

Continue disentangling the crypto library functions from the generic
crypto infrastructure by moving the s390 ChaCha library functions into a
new directory arch/s390/lib/crypto/ that does not depend on CRYPTO.
This mirrors the distinction between crypto/ and lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/crypto/Kconfig                 | 6 ------
 arch/s390/crypto/Makefile                | 3 ---
 arch/s390/lib/Makefile                   | 1 +
 arch/s390/lib/crypto/Kconfig             | 7 +++++++
 arch/s390/lib/crypto/Makefile            | 4 ++++
 arch/s390/{ => lib}/crypto/chacha-glue.c | 0
 arch/s390/{ => lib}/crypto/chacha-s390.S | 0
 arch/s390/{ => lib}/crypto/chacha-s390.h | 0
 lib/crypto/Kconfig                       | 3 +++
 9 files changed, 15 insertions(+), 9 deletions(-)
 create mode 100644 arch/s390/lib/crypto/Kconfig
 create mode 100644 arch/s390/lib/crypto/Makefile
 rename arch/s390/{ => lib}/crypto/chacha-glue.c (100%)
 rename arch/s390/{ => lib}/crypto/chacha-s390.S (100%)
 rename arch/s390/{ => lib}/crypto/chacha-s390.h (100%)

diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index e88d9cd256ef5..a2bfd6eef0ca3 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -97,16 +97,10 @@ config CRYPTO_DES_S390
 	  Architecture: s390
 
 	  As of z990 the ECB and CBC mode are hardware accelerated.
 	  As of z196 the CTR mode is hardware accelerated.
 
-config CRYPTO_CHACHA_S390
-	tristate
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 config CRYPTO_HMAC_S390
 	tristate "Keyed-hash message authentication code: HMAC"
 	select CRYPTO_HASH
 	help
 	  s390 specific HMAC hardware support for SHA224, SHA256, SHA384 and
diff --git a/arch/s390/crypto/Makefile b/arch/s390/crypto/Makefile
index 14dafadbcbed4..e3853774e1a3a 100644
--- a/arch/s390/crypto/Makefile
+++ b/arch/s390/crypto/Makefile
@@ -9,12 +9,9 @@ obj-$(CONFIG_CRYPTO_SHA512_S390) += sha512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_256_S390) += sha3_256_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_512_S390) += sha3_512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_DES_S390) += des_s390.o
 obj-$(CONFIG_CRYPTO_AES_S390) += aes_s390.o
 obj-$(CONFIG_CRYPTO_PAES_S390) += paes_s390.o
-obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
 obj-$(CONFIG_S390_PRNG) += prng.o
 obj-$(CONFIG_CRYPTO_GHASH_S390) += ghash_s390.o
 obj-$(CONFIG_CRYPTO_HMAC_S390) += hmac_s390.o
 obj-y += arch_random.o
-
-chacha_s390-y := chacha-glue.o chacha-s390.o
diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index 14bbfe50033c7..fce4edbe8a078 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for s390-specific library files..
 #
 
+obj-y += crypto/
 lib-y += delay.o string.o uaccess.o find.o spinlock.o tishift.o
 lib-y += csum-partial.o
 obj-y += mem.o xor.o
 lib-$(CONFIG_KPROBES) += probes.o
 lib-$(CONFIG_UPROBES) += probes.o
diff --git a/arch/s390/lib/crypto/Kconfig b/arch/s390/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..b79fd91af9fe1
--- /dev/null
+++ b/arch/s390/lib/crypto/Kconfig
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA_S390
+	tristate
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
diff --git a/arch/s390/lib/crypto/Makefile b/arch/s390/lib/crypto/Makefile
new file mode 100644
index 0000000000000..06c2cf77178ef
--- /dev/null
+++ b/arch/s390/lib/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
+chacha_s390-y := chacha-glue.o chacha-s390.o
diff --git a/arch/s390/crypto/chacha-glue.c b/arch/s390/lib/crypto/chacha-glue.c
similarity index 100%
rename from arch/s390/crypto/chacha-glue.c
rename to arch/s390/lib/crypto/chacha-glue.c
diff --git a/arch/s390/crypto/chacha-s390.S b/arch/s390/lib/crypto/chacha-s390.S
similarity index 100%
rename from arch/s390/crypto/chacha-s390.S
rename to arch/s390/lib/crypto/chacha-s390.S
diff --git a/arch/s390/crypto/chacha-s390.h b/arch/s390/lib/crypto/chacha-s390.h
similarity index 100%
rename from arch/s390/crypto/chacha-s390.h
rename to arch/s390/lib/crypto/chacha-s390.h
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 0b06c25eb38a5..db19a7acc2fbf 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -169,8 +169,11 @@ if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
 if RISCV
 source "arch/riscv/lib/crypto/Kconfig"
 endif
+if S390
+source "arch/s390/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


