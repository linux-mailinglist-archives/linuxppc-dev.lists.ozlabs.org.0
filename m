Return-Path: <linuxppc-dev+bounces-7825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E67A9491E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:28:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZgdnG3qplz3cBZ;
	Mon, 21 Apr 2025 05:27:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177266;
	cv=none; b=ON2S4gUEfUuFFJBO8OJiALL917tcKgitxg9iSwIMqZDYpyQHkR1TjEMOi/7BENPoZ6WILsC7z0f4PUiIzAY/RFG/WibZ6OX4IwAEdYbPVKkkOjj++yCc2XJsj52ak1YLQJ6xp4Wp7S5chwkQer3d+ANQ3Qm7Rl5OHxJdvFEhthF3AWviLfXG/GMrh0gaAUXLrkR8GYDw03osmbol8zpvBIG18ArcmGWHKJbod6c/wiMmcIxRSOR6djXSy671k1fUpP6FnudjBSf2Qspkv+WcTNk67ooIhoa/aNSiEOIvgv/7+R7dL1wcKCZrqCBmCcCWToBhts4/YNwoDH/KsWiy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177266; c=relaxed/relaxed;
	bh=N4/iVPOekibSVcXx6xn/2OFGRib3PJkM5gI51BVRk2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRA3oQKdomJ7zEJH9Y1VfIqrpO468n7hj4Gn6Sc4KR26gsumFyoFhvfPX8jTtRuW7vju/6ByiFRfOCZnnD836beH+FeU4/D2sT4ii/r7vo3+guioNHLZ+Mm2bfNVbSe5gC6eN/tr8ZlmjNvM+d7sv82FuCk78kbuXXrDvnsqHUzmZqf7D7KbsYL8FfJrGc5axlOsjamjde+4K99+FB/cOFnENFSmx+utu/r7saYOyJ0oGZK23yUHEZP87G+hHZ3n70sgjUWO0wyhRKcYsr8RiNEkYG9/GOsV5+dWMfmpwLMcM3WQJzucOd6McDxzNGQUtItATQmwjL2neFoL1SVuyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PxoY21zh; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PxoY21zh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZgdnB3QWxz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BF2A4A6EE;
	Sun, 20 Apr 2025 19:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940B6C4CEEE;
	Sun, 20 Apr 2025 19:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177259;
	bh=qwubLRmYWTY89E3AJnlutYUREOIU1w2leDnXcCjVCNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PxoY21zhWDA83kgmqgyYVf3zPZRPUbhnNwc5deADyd4PsivzUvZ8yjjol3QDCYZPI
	 NZsyVEAlcG6K3YtI6gYYgYeZeBrk73vPUWkFXx1zi1Dio2S3+kUinvvpaHa5PCcMHg
	 RKl4WwDeTzDUXP2IA+I65LszxxJ0RaMpZmH1bRysagYjhhgWqnTtQtLFY0aCn8fIBf
	 sXGpcX09Z/RPKMzzJNoz48Ko6Xc+e8cXuqGxu8RsXr6zYywlMGTom7Ij8rZzZt30HO
	 mX0cbGokvuYUBjGKneIUmL3pfxRMPTQQ2gPEcLLgXkaMC/xNI5a9LP620ZgfOxbfHq
	 V8OAB+L4Eyyww==
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
Subject: [PATCH v2 06/13] crypto: arm64 - move library functions to arch/arm64/lib/crypto/
Date: Sun, 20 Apr 2025 12:26:02 -0700
Message-ID: <20250420192609.295075-7-ebiggers@kernel.org>
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
crypto infrastructure by moving the arm64 ChaCha and Poly1305 library
functions into a new directory arch/arm64/lib/crypto/ that does not
depend on CRYPTO.  This mirrors the distinction between crypto/ and
lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/Kconfig                      | 13 -------------
 arch/arm64/crypto/Makefile                     |  9 +--------
 arch/arm64/lib/Makefile                        |  3 +++
 arch/arm64/lib/crypto/.gitignore               |  2 ++
 arch/arm64/lib/crypto/Kconfig                  | 14 ++++++++++++++
 arch/arm64/lib/crypto/Makefile                 | 16 ++++++++++++++++
 arch/arm64/{ => lib}/crypto/chacha-neon-core.S |  0
 arch/arm64/{ => lib}/crypto/chacha-neon-glue.c |  0
 arch/arm64/{ => lib}/crypto/poly1305-armv8.pl  |  0
 arch/arm64/{ => lib}/crypto/poly1305-glue.c    |  0
 lib/crypto/Kconfig                             |  3 +++
 11 files changed, 39 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm64/lib/crypto/.gitignore
 create mode 100644 arch/arm64/lib/crypto/Kconfig
 create mode 100644 arch/arm64/lib/crypto/Makefile
 rename arch/arm64/{ => lib}/crypto/chacha-neon-core.S (100%)
 rename arch/arm64/{ => lib}/crypto/chacha-neon-glue.c (100%)
 rename arch/arm64/{ => lib}/crypto/poly1305-armv8.pl (100%)
 rename arch/arm64/{ => lib}/crypto/poly1305-glue.c (100%)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 704d0b7e1d137..55a7d87a67690 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -23,16 +23,10 @@ config CRYPTO_NHPOLY1305_NEON
 	  NHPoly1305 hash function (Adiantum)
 
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
-config CRYPTO_POLY1305_NEON
-	tristate
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
-
 config CRYPTO_SHA1_ARM64_CE
 	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA1
@@ -178,17 +172,10 @@ config CRYPTO_AES_ARM64_NEON_BLK
 	    and IEEE 1619)
 
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
-config CRYPTO_CHACHA20_NEON
-	tristate
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 config CRYPTO_AES_ARM64_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XCTR/XTS modes (bit-sliced NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_AES_ARM64_NEON_BLK
diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index e7139c4768ce4..089ae3ddde810 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -60,17 +60,10 @@ obj-$(CONFIG_CRYPTO_SHA256_ARM64) += sha256-arm64.o
 sha256-arm64-y := sha256-glue.o sha256-core.o
 
 obj-$(CONFIG_CRYPTO_SHA512_ARM64) += sha512-arm64.o
 sha512-arm64-y := sha512-glue.o sha512-core.o
 
-obj-$(CONFIG_CRYPTO_CHACHA20_NEON) += chacha-neon.o
-chacha-neon-y := chacha-neon-core.o chacha-neon-glue.o
-
-obj-$(CONFIG_CRYPTO_POLY1305_NEON) += poly1305-neon.o
-poly1305-neon-y := poly1305-core.o poly1305-glue.o
-AFLAGS_poly1305-core.o += -Dpoly1305_init=poly1305_init_arm64
-
 obj-$(CONFIG_CRYPTO_NHPOLY1305_NEON) += nhpoly1305-neon.o
 nhpoly1305-neon-y := nh-neon-core.o nhpoly1305-neon-glue.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64) += aes-arm64.o
 aes-arm64-y := aes-cipher-core.o aes-cipher-glue.o
@@ -85,6 +78,6 @@ $(obj)/%-core.S: $(src)/%-armv8.pl
 	$(call cmd,perlasm)
 
 $(obj)/sha256-core.S: $(src)/sha512-armv8.pl
 	$(call cmd,perlasm)
 
-clean-files += poly1305-core.S sha256-core.S sha512-core.S
+clean-files += sha256-core.S sha512-core.S
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 4d49dff721a84..25be7825f28d8 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
+
+obj-y += crypto/
+
 lib-y		:= clear_user.o delay.o copy_from_user.o		\
 		   copy_to_user.o copy_page.o				\
 		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
 		   memset.o memcmp.o strcmp.o strncmp.o strlen.o	\
 		   strnlen.o strchr.o strrchr.o tishift.o
diff --git a/arch/arm64/lib/crypto/.gitignore b/arch/arm64/lib/crypto/.gitignore
new file mode 100644
index 0000000000000..0d47d4f21c6de
--- /dev/null
+++ b/arch/arm64/lib/crypto/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
diff --git a/arch/arm64/lib/crypto/Kconfig b/arch/arm64/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..169311547efe3
--- /dev/null
+++ b/arch/arm64/lib/crypto/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA20_NEON
+	tristate
+	depends on KERNEL_MODE_NEON
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+
+config CRYPTO_POLY1305_NEON
+	tristate
+	depends on KERNEL_MODE_NEON
+	default CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
diff --git a/arch/arm64/lib/crypto/Makefile b/arch/arm64/lib/crypto/Makefile
new file mode 100644
index 0000000000000..ac624c3effdaf
--- /dev/null
+++ b/arch/arm64/lib/crypto/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA20_NEON) += chacha-neon.o
+chacha-neon-y := chacha-neon-core.o chacha-neon-glue.o
+
+obj-$(CONFIG_CRYPTO_POLY1305_NEON) += poly1305-neon.o
+poly1305-neon-y := poly1305-core.o poly1305-glue.o
+AFLAGS_poly1305-core.o += -Dpoly1305_init=poly1305_init_arm64
+
+quiet_cmd_perlasm = PERLASM $@
+      cmd_perlasm = $(PERL) $(<) void $(@)
+
+$(obj)/%-core.S: $(src)/%-armv8.pl
+	$(call cmd,perlasm)
+
+clean-files += poly1305-core.S
diff --git a/arch/arm64/crypto/chacha-neon-core.S b/arch/arm64/lib/crypto/chacha-neon-core.S
similarity index 100%
rename from arch/arm64/crypto/chacha-neon-core.S
rename to arch/arm64/lib/crypto/chacha-neon-core.S
diff --git a/arch/arm64/crypto/chacha-neon-glue.c b/arch/arm64/lib/crypto/chacha-neon-glue.c
similarity index 100%
rename from arch/arm64/crypto/chacha-neon-glue.c
rename to arch/arm64/lib/crypto/chacha-neon-glue.c
diff --git a/arch/arm64/crypto/poly1305-armv8.pl b/arch/arm64/lib/crypto/poly1305-armv8.pl
similarity index 100%
rename from arch/arm64/crypto/poly1305-armv8.pl
rename to arch/arm64/lib/crypto/poly1305-armv8.pl
diff --git a/arch/arm64/crypto/poly1305-glue.c b/arch/arm64/lib/crypto/poly1305-glue.c
similarity index 100%
rename from arch/arm64/crypto/poly1305-glue.c
rename to arch/arm64/lib/crypto/poly1305-glue.c
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 59135009e4f02..7395234d654b7 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -157,8 +157,11 @@ config CRYPTO_LIB_SM3
 
 if !KMSAN # avoid false positives from assembly
 if ARM
 source "arch/arm/lib/crypto/Kconfig"
 endif
+if ARM64
+source "arch/arm64/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


