Return-Path: <linuxppc-dev+bounces-7923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B9A970C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 17:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhmND1RMcz3byl;
	Wed, 23 Apr 2025 01:28:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745335708;
	cv=none; b=Qn4saSk9EqezF246GwNmPw8Nr61gMO9gRKAM5GUPwoWsxl+k78rHWuXaU4sYyVqMXsk3MkfgGJ2Lc+jBL1HBpfBb6eh6SRfPCFXAhcd7liPFRJH1vrtYz5K01KlUTt7m9qnI4fSgaPBtKLS5QYNnjnNh6AAbHIs8/eAGDS7N2wOqTTHiRJye5wlG8hV3lWVPuw3eOWVkr8Yxomyo/kN2EAJZBu7K6GcYeesMHUXPw1Poa9Eq9wRJdawyfAaQI74IGXBDu85EvA5qyxePGVRxMmn1+h0zD3xFYvI6yMHzZeprfkIhOy0hS2gkPvUdjR1EyUz84TuSbu2IeRNE7tup5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745335708; c=relaxed/relaxed;
	bh=JTbO3bkLwy7G2nJqTkGEYXUtBveaaxyR2UC7H7HLcoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxzIYcGuXB5nE9LBpiR7fEw5PrWnIkJox+OpRkkmE/7lxFE9DpChWgojHZK7zctFL4fsvR/3tXY1V8hg9UlDM01GvuXHEnbYpHd3Fu7W3W4lmlIhEG5Aq7RPknENePk4R3wU/3UmUPcF4lYWAPluAOXZpaS2EcXZAGgVHXnCrQcAIVR9LMQ2W2uStUNp1dvLyCN24rlY/iIstEq6aKhEDU3O5AyLlYX82jgcTj7xbp2rr948Y5d/to+mK+RK7zIGNzDjAU7x9QUb5VVXUEa8WThhADy3KSGfLM222ybhmODeI5vs1yX0DAHII5ab540H24lUrVZjb9WgbT4SGirjNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S1Iqr1h9; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S1Iqr1h9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhmN60WD4z3c89
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 01:28:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E0DC4A957;
	Tue, 22 Apr 2025 15:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87429C4CEE9;
	Tue, 22 Apr 2025 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335698;
	bh=JceMeyvHZFS3hU3osMnM8DtDXrhU/UjeqoFMt/NCYhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S1Iqr1h9HcAr7bVNT5cba2ArhH18ZszXuXxOULo1zOhqYgh93BeDmZmHR/LwJsF7b
	 dhj8C+xJh4XhDT2g2eWx7IzOWw1s2s3vyJ6hz4uAM5jSnIcp07jjdJszZrqTUv20bS
	 A4bMr1hXWDqFBHAU3/BabcvlSFb65cZFqD5VpKVjHDz2iPn7goCrvRJGSiSGjJOq08
	 fG1/R2TuLkBGrejtmZ4GemCxXYilTCCNeo0uNnYhgCiJ4TpYBKNFEWgtZq6U5cAqYr
	 taRybWcMEKlFRSxFM9HBqPP0OEHH06GdOtPd+jUapb+VTerV7yzqXLVE36IbD8U6Jj
	 a9MwsvOLwBXFQ==
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
Subject: [PATCH v3 09/13] crypto: riscv - move library functions to arch/riscv/lib/crypto/
Date: Tue, 22 Apr 2025 08:27:12 -0700
Message-ID: <20250422152716.5923-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
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
crypto infrastructure by moving the riscv ChaCha library functions into
a new directory arch/riscv/lib/crypto/ that does not depend on CRYPTO.
This mirrors the distinction between crypto/ and lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/crypto/Kconfig                         | 7 -------
 arch/riscv/crypto/Makefile                        | 3 ---
 arch/riscv/lib/Makefile                           | 1 +
 arch/riscv/lib/crypto/Kconfig                     | 8 ++++++++
 arch/riscv/lib/crypto/Makefile                    | 4 ++++
 arch/riscv/{ => lib}/crypto/chacha-riscv64-glue.c | 0
 arch/riscv/{ => lib}/crypto/chacha-riscv64-zvkb.S | 0
 lib/crypto/Kconfig                                | 3 +++
 8 files changed, 16 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/lib/crypto/Kconfig
 create mode 100644 arch/riscv/lib/crypto/Makefile
 rename arch/riscv/{ => lib}/crypto/chacha-riscv64-glue.c (100%)
 rename arch/riscv/{ => lib}/crypto/chacha-riscv64-zvkb.S (100%)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index 27a1f26d41bde..4863be2a4ec2f 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -16,17 +16,10 @@ config CRYPTO_AES_RISCV64
 	  - Zvkned vector crypto extension
 	  - Zvbb vector extension (XTS)
 	  - Zvkb vector crypto extension (CTR)
 	  - Zvkg vector crypto extension (XTS)
 
-config CRYPTO_CHACHA_RISCV64
-	tristate
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	select CRYPTO_LIB_CHACHA_GENERIC
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 config CRYPTO_GHASH_RISCV64
 	tristate "Hash functions: GHASH"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_GCM
 	help
diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
index 247c7bc7288ce..4ae9bf762e907 100644
--- a/arch/riscv/crypto/Makefile
+++ b/arch/riscv/crypto/Makefile
@@ -2,13 +2,10 @@
 
 obj-$(CONFIG_CRYPTO_AES_RISCV64) += aes-riscv64.o
 aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o \
 		 aes-riscv64-zvkned-zvbb-zvkg.o aes-riscv64-zvkned-zvkb.o
 
-obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
-chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
-
 obj-$(CONFIG_CRYPTO_GHASH_RISCV64) += ghash-riscv64.o
 ghash-riscv64-y := ghash-riscv64-glue.o ghash-riscv64-zvkg.o
 
 obj-$(CONFIG_CRYPTO_SHA256_RISCV64) += sha256-riscv64.o
 sha256-riscv64-y := sha256-riscv64-glue.o sha256-riscv64-zvknha_or_zvknhb-zvkb.o
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index b1c46153606a6..0baec92d2f55b 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-y			+= crypto/
 lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
diff --git a/arch/riscv/lib/crypto/Kconfig b/arch/riscv/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..46ce2a7ac1f2c
--- /dev/null
+++ b/arch/riscv/lib/crypto/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA_RISCV64
+	tristate
+	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_LIB_CHACHA_GENERIC
diff --git a/arch/riscv/lib/crypto/Makefile b/arch/riscv/lib/crypto/Makefile
new file mode 100644
index 0000000000000..e27b78f317fc8
--- /dev/null
+++ b/arch/riscv/lib/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
+chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
diff --git a/arch/riscv/crypto/chacha-riscv64-glue.c b/arch/riscv/lib/crypto/chacha-riscv64-glue.c
similarity index 100%
rename from arch/riscv/crypto/chacha-riscv64-glue.c
rename to arch/riscv/lib/crypto/chacha-riscv64-glue.c
diff --git a/arch/riscv/crypto/chacha-riscv64-zvkb.S b/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
similarity index 100%
rename from arch/riscv/crypto/chacha-riscv64-zvkb.S
rename to arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 4b3e94ed84bb6..0b06c25eb38a5 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -166,8 +166,11 @@ if MIPS
 source "arch/mips/lib/crypto/Kconfig"
 endif
 if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
+if RISCV
+source "arch/riscv/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


