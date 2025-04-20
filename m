Return-Path: <linuxppc-dev+bounces-7827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FE2A94922
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Apr 2025 21:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZgdnH3Xy4z3cDr;
	Mon, 21 Apr 2025 05:27:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745177267;
	cv=none; b=oKHmO4b7xmtWsAIlgaQA0uSKZ41RHFwFI42mIRqt2DTVtOTgrvjRnktzbMrL4TMwJRzoHrYvZtiAZKpGTJt3J+5miV453INz/sokGCTIkgJgdThZuaa2DU6phYB3ij/zPBKVCvkB1aQZpA0wA9HSmSzbn1WeKWBY2yHDAxcbLfiLobdQVBUh+0+lBr87IGpRszuyKQLkQVKjKiL6AUhe+11QaNaSuFXUKvSYxC+f/qs7knsL0JdvISNPMjjPX+56tmIm2H0zlFs7S+H6TYrq51wljarkSnTWO4PjvLcEEAsFmNdtG8ay43qkE0LV1BSuALh11N9JkBSFUjnlVA8Esw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745177267; c=relaxed/relaxed;
	bh=ZL3xL18OqBepeI2rMRy6I/9dIf6929xtLwXTLCkttl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpGgp5/xcGVU2HKpYW9tqoIVjLFStmuzU8czS+LucxlZlvSX+RRG6H9URjtb05I/AE5rfE1bveNkKoDGAf5JEPp05Xq6aFL8fm+fyfJOTcHwpYHesp4Wnve/Ji0p/I51volY+8Ir7R5ML+JSJgicuxw1jdWBu0kHKmRG6R7dp6OwVzeDz4ZTh5A9VFEVXVltIUZnaTFxb1vqyG9b5XglKNiy1UZ/0o2KqMiOICILdY5AluGtndU34dzk/PXrN5ishz7pCTmseLrYiEv37FtMVriCl1oazCC3SzV0tk0k5HRuuIgdV/kZqBL5jMzZVIoF/5v40UWCfiOH7UbM1feBJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h6dG+ABp; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h6dG+ABp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZgdnB2tMfz3byZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 05:27:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 184C94A70B;
	Sun, 20 Apr 2025 19:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A2BC4CEE2;
	Sun, 20 Apr 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177260;
	bh=qN/B6X2mvQN94BK3RyJeOZTVFWohKhnnWgVazqat/cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h6dG+ABppE74ITCWwKY1e/iBpLDE6OAQ81JEKnxMExRPfYAeK3DLvhs5iwtqB9Pal
	 sifuLdiw3iJu7jDMC3pUAV1Ce/ByP37RI2Ua+WKCCHExfJk+szUnY8WQjS+htLskcx
	 HNBMnxUcR1OuQLJckDCjDkcDuxfl2XJWRSjRBz/TllBOPlh6JPYqZMliw2q7/RDVzU
	 ehTb7IR4X3rA59pQygK7EIkZMPyyPedmoSQ3I8QXR7+iTVoiRuk557p9LGmzW9tuEE
	 UH/zTjCTTke5kYyHItZNEx3NKHULyaC3ePouNyZK2maqgtd0D2RPu/gtkYLxcEpdCp
	 EiAaUdsAIGLqg==
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
Subject: [PATCH v2 07/13] crypto: mips - move library functions to arch/mips/lib/crypto/
Date: Sun, 20 Apr 2025 12:26:03 -0700
Message-ID: <20250420192609.295075-8-ebiggers@kernel.org>
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
crypto infrastructure by moving the mips ChaCha and Poly1305 library
functions into a new directory arch/mips/lib/crypto/ that does not
depend on CRYPTO.  This mirrors the distinction between crypto/ and
lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/crypto/Kconfig                    | 11 -----------
 arch/mips/crypto/Makefile                   | 17 -----------------
 arch/mips/lib/Makefile                      |  2 ++
 arch/mips/lib/crypto/.gitignore             |  2 ++
 arch/mips/lib/crypto/Kconfig                | 12 ++++++++++++
 arch/mips/lib/crypto/Makefile               | 19 +++++++++++++++++++
 arch/mips/{ => lib}/crypto/chacha-core.S    |  0
 arch/mips/{ => lib}/crypto/chacha-glue.c    |  0
 arch/mips/{ => lib}/crypto/poly1305-glue.c  |  0
 arch/mips/{ => lib}/crypto/poly1305-mips.pl |  0
 lib/crypto/Kconfig                          |  3 +++
 11 files changed, 38 insertions(+), 28 deletions(-)
 create mode 100644 arch/mips/lib/crypto/.gitignore
 create mode 100644 arch/mips/lib/crypto/Kconfig
 create mode 100644 arch/mips/lib/crypto/Makefile
 rename arch/mips/{ => lib}/crypto/chacha-core.S (100%)
 rename arch/mips/{ => lib}/crypto/chacha-glue.c (100%)
 rename arch/mips/{ => lib}/crypto/poly1305-glue.c (100%)
 rename arch/mips/{ => lib}/crypto/poly1305-mips.pl (100%)

diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 8283664a1f24b..9db1fd6d9f0e0 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -1,14 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
-config CRYPTO_POLY1305_MIPS
-	tristate
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
-
 config CRYPTO_MD5_OCTEON
 	tristate "Digests: MD5 (OCTEON)"
 	depends on CPU_CAVIUM_OCTEON
 	select CRYPTO_MD5
 	select CRYPTO_HASH
@@ -45,12 +40,6 @@ config CRYPTO_SHA512_OCTEON
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: mips OCTEON using crypto instructions, when available
 
-config CRYPTO_CHACHA_MIPS
-	tristate
-	depends on CPU_MIPS32_R2
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 endmenu
diff --git a/arch/mips/crypto/Makefile b/arch/mips/crypto/Makefile
index fddc882814123..5adb631a69c18 100644
--- a/arch/mips/crypto/Makefile
+++ b/arch/mips/crypto/Makefile
@@ -1,22 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for MIPS crypto files..
 #
 
-obj-$(CONFIG_CRYPTO_CHACHA_MIPS) += chacha-mips.o
-chacha-mips-y := chacha-core.o chacha-glue.o
-AFLAGS_chacha-core.o += -O2 # needed to fill branch delay slots
-
-obj-$(CONFIG_CRYPTO_POLY1305_MIPS) += poly1305-mips.o
-poly1305-mips-y := poly1305-core.o poly1305-glue.o
-
-perlasm-flavour-$(CONFIG_32BIT) := o32
-perlasm-flavour-$(CONFIG_64BIT) := 64
-
-quiet_cmd_perlasm = PERLASM $@
-      cmd_perlasm = $(PERL) $(<) $(perlasm-flavour-y) $(@)
-
-$(obj)/poly1305-core.S: $(src)/poly1305-mips.pl FORCE
-	$(call if_changed,perlasm)
-
-targets += poly1305-core.S
diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
index 9c024e6d5e54c..9d75845ef78e1 100644
--- a/arch/mips/lib/Makefile
+++ b/arch/mips/lib/Makefile
@@ -1,10 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for MIPS-specific library files..
 #
 
+obj-y	+= crypto/
+
 lib-y	+= bitops.o csum_partial.o delay.o memcpy.o memset.o \
 	   mips-atomic.o strncpy_user.o \
 	   strnlen_user.o uncached.o
 
 obj-y			+= iomap_copy.o
diff --git a/arch/mips/lib/crypto/.gitignore b/arch/mips/lib/crypto/.gitignore
new file mode 100644
index 0000000000000..0d47d4f21c6de
--- /dev/null
+++ b/arch/mips/lib/crypto/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
diff --git a/arch/mips/lib/crypto/Kconfig b/arch/mips/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..5b82ba753c55c
--- /dev/null
+++ b/arch/mips/lib/crypto/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA_MIPS
+	tristate
+	depends on CPU_MIPS32_R2
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+
+config CRYPTO_POLY1305_MIPS
+	tristate
+	default CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
diff --git a/arch/mips/lib/crypto/Makefile b/arch/mips/lib/crypto/Makefile
new file mode 100644
index 0000000000000..804488c7adedc
--- /dev/null
+++ b/arch/mips/lib/crypto/Makefile
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA_MIPS) += chacha-mips.o
+chacha-mips-y := chacha-core.o chacha-glue.o
+AFLAGS_chacha-core.o += -O2 # needed to fill branch delay slots
+
+obj-$(CONFIG_CRYPTO_POLY1305_MIPS) += poly1305-mips.o
+poly1305-mips-y := poly1305-core.o poly1305-glue.o
+
+perlasm-flavour-$(CONFIG_32BIT) := o32
+perlasm-flavour-$(CONFIG_64BIT) := 64
+
+quiet_cmd_perlasm = PERLASM $@
+      cmd_perlasm = $(PERL) $(<) $(perlasm-flavour-y) $(@)
+
+$(obj)/poly1305-core.S: $(src)/poly1305-mips.pl FORCE
+	$(call if_changed,perlasm)
+
+targets += poly1305-core.S
diff --git a/arch/mips/crypto/chacha-core.S b/arch/mips/lib/crypto/chacha-core.S
similarity index 100%
rename from arch/mips/crypto/chacha-core.S
rename to arch/mips/lib/crypto/chacha-core.S
diff --git a/arch/mips/crypto/chacha-glue.c b/arch/mips/lib/crypto/chacha-glue.c
similarity index 100%
rename from arch/mips/crypto/chacha-glue.c
rename to arch/mips/lib/crypto/chacha-glue.c
diff --git a/arch/mips/crypto/poly1305-glue.c b/arch/mips/lib/crypto/poly1305-glue.c
similarity index 100%
rename from arch/mips/crypto/poly1305-glue.c
rename to arch/mips/lib/crypto/poly1305-glue.c
diff --git a/arch/mips/crypto/poly1305-mips.pl b/arch/mips/lib/crypto/poly1305-mips.pl
similarity index 100%
rename from arch/mips/crypto/poly1305-mips.pl
rename to arch/mips/lib/crypto/poly1305-mips.pl
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 7395234d654b7..c5c01bc3569d5 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -160,8 +160,11 @@ if ARM
 source "arch/arm/lib/crypto/Kconfig"
 endif
 if ARM64
 source "arch/arm64/lib/crypto/Kconfig"
 endif
+if MIPS
+source "arch/mips/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


