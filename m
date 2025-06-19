Return-Path: <linuxppc-dev+bounces-9564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78273AE0DCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:22:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVqC3D4wz30Vb;
	Fri, 20 Jun 2025 05:22:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750360935;
	cv=none; b=I7OiOUJ9RU/DR6vIAPajIM37KaleJiwpsZyMSGcvox7IB9mIcjIhsZefDNwy59q15EKEILNJH4g0HlrQLoUKcQUfl2Z9iemMC793kwGmAxIKA3Uu948TVGW0YXOr3Y6UsUgtATo6dvNNq0e5ReY4abKf6Jh+qcDUMHREkOkkuvNdCG3dkDwHrwSMW/NxqDMmSTNpmUE/d0oVsJO+iw6jyUOLufAEgDUfch3UrQrbcwPaxW7lmcT2BENrVvM4vY0EwEUKs7tTotQIW2q9SeCzKFBBYkuazXrQzxR9FMQuOdmmLKKuZavVhCSOYu3qPa5funYWZ2e381lNU4tgFJJRVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750360935; c=relaxed/relaxed;
	bh=TJ8b4ogAr5hnxZEfswF2JfMVRM65ckCaIcKH5oet4NI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LYg1H44oqIT8kAb4qpEPqnF8JyFPi76jggU+mTl8IGQTaM8/1N/2ManmAct9RYaGnkxZDN9HqabO+Gc6RpfU2aa8ZaRwbl4q6iBJrKkxWUqSe6ncg+gztVocDZDVTyll7F7IeH0CaPlx9JxRk2bVJbM72wZDZ2r6XEV8Vtr6rFdds89aPHMr4ebDHKmMBUROfO5K4TQXKawMAtVyIGuCOc4owjMs0SjWgZf+KTL6viC3j55zfrXQMLgfHGdVBIoNn8ZxZSviOTkgSzuI7UR0pFlKFgnZkM1SSIlPVo2/BV6Aha3w/ag9SzjZBl5DSuNmr1WXd5InUZmX6AdgqY9ZsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fryETMDp; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fryETMDp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVq65sDZz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:22:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D2CDA54692;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F175C4CEF0;
	Thu, 19 Jun 2025 19:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360926;
	bh=9UtMUWlHNA4RTeOlTBM02ODBZV5uKoJTlP1807gF6LI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fryETMDpfnoe2dioP1ES0reEAY0jhdCqMTATUdRbwGZqFnWXusMruMspNwESboOKR
	 AhstF9gQCTBZvDTE3g/brKzQ8sH1nfT1ANlq5soGCvy9TqHzUKaUruWpDFxWy3sj1T
	 9ntl5WYrs6XlnT5PkHKgQFG6ZJ8jPtwz99vLfsatgpXMSCN0myTBCMdtlWyKdVvIC2
	 3d5eHscpPXfcqEw5jaUnBMAWDq9rUcUQImWaE1XBS4Mw14NDWHQ4l3NgXQAgt34eGz
	 TrrjvSsyIoi0WxnDTuFJNCHr1A1MIJ/xk9KuSVXtxiqCjd6OxcmhT7pUg8/ls2Fama
	 DGisKNf5JUIXw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 1/9] lib/crypto: arm: move arch/arm/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:00 -0700
Message-ID: <20250619191908.134235-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Move the contents of arch/arm/lib/crypto/ into lib/crypto/arm/.

The new code organization makes a lot more sense for how this code
actually works and is developed.  In particular, it makes it possible to
build each algorithm as a single module, with better inlining and dead
code elimination.  For a more detailed explanation, see the patchset
which did this for the CRC library code:
https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
Also see the patchset which did this for SHA-512:
https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/

This is just a preparatory commit, which does the move to get the files
into their new location but keeps them building the same way as before.
Later commits will make the actual improvements to the way the
arch-optimized code is integrated for each algorithm.

Add a gitignore entry for the removed directory arch/arm/lib/crypto/ so
that people don't accidentally commit leftover generated files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/lib/.gitignore                                      | 4 ++++
 arch/arm/lib/Makefile                                        | 2 --
 arch/arm/lib/crypto/.gitignore                               | 3 ---
 lib/crypto/Kconfig                                           | 2 +-
 lib/crypto/Makefile                                          | 2 ++
 lib/crypto/arm/.gitignore                                    | 2 ++
 {arch/arm/lib/crypto => lib/crypto/arm}/Kconfig              | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/Makefile             | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-core.S       | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-glue.c       | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/chacha-glue.c        | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/chacha-neon-core.S   | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/chacha-scalar-core.S | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-armv4.pl    | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-glue.c      | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/sha256-armv4.pl      | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/sha256-ce.S          | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/sha256.c             | 0
 18 files changed, 9 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/lib/.gitignore
 delete mode 100644 arch/arm/lib/crypto/.gitignore
 rename {arch/arm/lib/crypto => lib/crypto/arm}/Kconfig (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/Makefile (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-core.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-glue.c (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/chacha-glue.c (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/chacha-neon-core.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/chacha-scalar-core.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-armv4.pl (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-glue.c (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/sha256-armv4.pl (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/sha256-ce.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/sha256.c (100%)

diff --git a/arch/arm/lib/.gitignore b/arch/arm/lib/.gitignore
new file mode 100644
index 0000000000000..647d7a922e680
--- /dev/null
+++ b/arch/arm/lib/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# This now-removed directory used to contain generated files.
+/crypto/
diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 91ea0e29107af..d05dd672bcd9c 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -3,12 +3,10 @@
 # linux/arch/arm/lib/Makefile
 #
 # Copyright (C) 1995-2000 Russell King
 #
 
-obj-y += crypto/
-
 lib-y		:= changebit.o csumipv6.o csumpartial.o               \
 		   csumpartialcopy.o csumpartialcopyuser.o clearbit.o \
 		   delay.o delay-loop.o findbit.o memchr.o memcpy.o   \
 		   memmove.o memset.o setbit.o                        \
 		   strchr.o strrchr.o                                 \
diff --git a/arch/arm/lib/crypto/.gitignore b/arch/arm/lib/crypto/.gitignore
deleted file mode 100644
index 12d74d8b03d0a..0000000000000
--- a/arch/arm/lib/crypto/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-poly1305-core.S
-sha256-core.S
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index dce127a69f131..e14bef8e87af2 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -188,11 +188,11 @@ config CRYPTO_LIB_SHA512_ARCH
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
 if ARM
-source "arch/arm/lib/crypto/Kconfig"
+source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
 source "arch/arm64/lib/crypto/Kconfig"
 endif
 if MIPS
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 4a76169de251b..ddf04e2270f1e 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -100,5 +100,7 @@ obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
+
+obj-$(CONFIG_ARM) += arm/
diff --git a/lib/crypto/arm/.gitignore b/lib/crypto/arm/.gitignore
index 670a4d97b5684..f6c4e8ef80dae 100644
--- a/lib/crypto/arm/.gitignore
+++ b/lib/crypto/arm/.gitignore
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
+sha256-core.S
 sha512-core.S
diff --git a/arch/arm/lib/crypto/Kconfig b/lib/crypto/arm/Kconfig
similarity index 100%
rename from arch/arm/lib/crypto/Kconfig
rename to lib/crypto/arm/Kconfig
diff --git a/arch/arm/lib/crypto/Makefile b/lib/crypto/arm/Makefile
similarity index 100%
rename from arch/arm/lib/crypto/Makefile
rename to lib/crypto/arm/Makefile
diff --git a/arch/arm/lib/crypto/blake2s-core.S b/lib/crypto/arm/blake2s-core.S
similarity index 100%
rename from arch/arm/lib/crypto/blake2s-core.S
rename to lib/crypto/arm/blake2s-core.S
diff --git a/arch/arm/lib/crypto/blake2s-glue.c b/lib/crypto/arm/blake2s-glue.c
similarity index 100%
rename from arch/arm/lib/crypto/blake2s-glue.c
rename to lib/crypto/arm/blake2s-glue.c
diff --git a/arch/arm/lib/crypto/chacha-glue.c b/lib/crypto/arm/chacha-glue.c
similarity index 100%
rename from arch/arm/lib/crypto/chacha-glue.c
rename to lib/crypto/arm/chacha-glue.c
diff --git a/arch/arm/lib/crypto/chacha-neon-core.S b/lib/crypto/arm/chacha-neon-core.S
similarity index 100%
rename from arch/arm/lib/crypto/chacha-neon-core.S
rename to lib/crypto/arm/chacha-neon-core.S
diff --git a/arch/arm/lib/crypto/chacha-scalar-core.S b/lib/crypto/arm/chacha-scalar-core.S
similarity index 100%
rename from arch/arm/lib/crypto/chacha-scalar-core.S
rename to lib/crypto/arm/chacha-scalar-core.S
diff --git a/arch/arm/lib/crypto/poly1305-armv4.pl b/lib/crypto/arm/poly1305-armv4.pl
similarity index 100%
rename from arch/arm/lib/crypto/poly1305-armv4.pl
rename to lib/crypto/arm/poly1305-armv4.pl
diff --git a/arch/arm/lib/crypto/poly1305-glue.c b/lib/crypto/arm/poly1305-glue.c
similarity index 100%
rename from arch/arm/lib/crypto/poly1305-glue.c
rename to lib/crypto/arm/poly1305-glue.c
diff --git a/arch/arm/lib/crypto/sha256-armv4.pl b/lib/crypto/arm/sha256-armv4.pl
similarity index 100%
rename from arch/arm/lib/crypto/sha256-armv4.pl
rename to lib/crypto/arm/sha256-armv4.pl
diff --git a/arch/arm/lib/crypto/sha256-ce.S b/lib/crypto/arm/sha256-ce.S
similarity index 100%
rename from arch/arm/lib/crypto/sha256-ce.S
rename to lib/crypto/arm/sha256-ce.S
diff --git a/arch/arm/lib/crypto/sha256.c b/lib/crypto/arm/sha256.c
similarity index 100%
rename from arch/arm/lib/crypto/sha256.c
rename to lib/crypto/arm/sha256.c
-- 
2.50.0


