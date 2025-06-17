Return-Path: <linuxppc-dev+bounces-9430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F38CADDEE2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 00:30:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMM4w2Csyz30Vf;
	Wed, 18 Jun 2025 08:30:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750199408;
	cv=none; b=TD/IySYs4gbp+D9lhF5XjXJzsynIYKIHFY2xoitKjkWpyk2uCDc1AnCxD/J3Gu9AtT69nb8fcmVZGdWY2/5SqMcYb+TsejlBV07+JGur0MAOI7kKmh1c5DLz6I0GR0MOMo0l8lCLcdufJAANSc6jLJ+ibWlAvAijzoXogt9Jrwx2CgLQkPQdh1it78UTN9clyfQEHwQVDARUtSZflfPJC4hbgKel6vGsnnNVq/eyCdmmfIgOkUWyldZkO8Uk9A6CqQrQ02iHEiY01uHGjoLXwBEjKSD1DlvOq7tC3V85JP3zddEEr5bK2z2g0Tf04RCeCAO7JrZvdUpjzdm97SgwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750199408; c=relaxed/relaxed;
	bh=m6vNYcUym8RCs26HgEjsfbBhYr1Uldra33+azUd+Zes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W98SQmWEUN7j95clgR3z3xDO4JyE2RKOXpCVt7oqPft4pqlsAvQvZ7Onu3KWr49l9OKIIelYe4EIzRl2lyvH0TjHQxcPE2QkVdcUCbxqUvYnz/QVxL7glYWmI0twNsIFVfvF9hcWc3JHmDYRZFfCwkAIK4veTphheXx/5/gz9q/lNT/HM+JBFWu9zbbwHRtsNUfAP194AH+HCZceenPASDot1xQ6Y4GRF3FIkViYMWM86E+48VrRx0ns/vglimaWv77C5i/KmsDIG7JGPCFIv6gtkVM/CgbK7clxgFtBlP31QimbvAT/sx8ANYsVOoCYijnYbT8bPmkIn2/t0Y7/BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n1fuKE+T; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n1fuKE+T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMM4p2Gdyz2xRt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 08:30:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6540CA51FA0;
	Tue, 17 Jun 2025 22:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FA9C4CEF4;
	Tue, 17 Jun 2025 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199399;
	bh=oCGOvLpHCL5W2ZkDZ9iwmUr1h9xflh/WVFokVkwiIvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n1fuKE+TjvzwwIHuJptm/lhdma0jKIIADvDgWHzfPYyYFio+dkbFs7FIv9V1NUhzw
	 eiB4FeGixs00EnV5P6vBG1ZeOH76sq/OJstlcRiC81xjcSu+QyeTS5HtsNpTbhD1at
	 mEyLi4ZMek6U6bMjEcoNG+lkO/t5FqtznVB9HbCzmIXMT6+FqNqbsGpLx14LdkqHT4
	 tw2DrPFc29LKD0L1H/UcE6TL5RIwAPuUyPQ+Z0E1MDEOM2gslkZUQbmNiPu8rm3LtW
	 ykrREDXGIrMAvbjOjlF+Zbi2cIkZ1KBG6TsLvUm8eQdW6gYkspQHMrsewp9fC8QV0r
	 hSkxiDSJr1Flg==
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
Subject: [PATCH 3/9] lib/crypto/mips: move arch/mips/lib/crypto/ to lib/crypto/mips/
Date: Tue, 17 Jun 2025 15:27:20 -0700
Message-ID: <20250617222726.365148-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
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

Move the contents of arch/mips/lib/crypto/ into lib/crypto/mips/.

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

arch/mips/lib/crypto/.gitignore is intentionally kept for now.  See
https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
I'll remove it later after some time has passed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/lib/Makefile                                     | 2 --
 lib/crypto/Kconfig                                         | 2 +-
 lib/crypto/Makefile                                        | 1 +
 lib/crypto/mips/.gitignore                                 | 2 ++
 {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig          | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/Makefile         | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c  | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl | 0
 10 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 lib/crypto/mips/.gitignore
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Makefile (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl (100%)

diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
index 9d75845ef78e1..9c024e6d5e54c 100644
--- a/arch/mips/lib/Makefile
+++ b/arch/mips/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for MIPS-specific library files..
 #
 
-obj-y	+= crypto/
-
 lib-y	+= bitops.o csum_partial.o delay.o memcpy.o memset.o \
 	   mips-atomic.o strncpy_user.o \
 	   strnlen_user.o uncached.o
 
 obj-y			+= iomap_copy.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index fdeb91bf00328..43c44316fbbdc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -194,11 +194,11 @@ source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
 source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
-source "arch/mips/lib/crypto/Kconfig"
+source "lib/crypto/mips/Kconfig"
 endif
 if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
 if RISCV
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 63ab907e8f53b..74331243b8c44 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -103,5 +103,6 @@ obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
+obj-$(CONFIG_MIPS) += mips/
diff --git a/lib/crypto/mips/.gitignore b/lib/crypto/mips/.gitignore
new file mode 100644
index 0000000000000..0d47d4f21c6de
--- /dev/null
+++ b/lib/crypto/mips/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
diff --git a/arch/mips/lib/crypto/Kconfig b/lib/crypto/mips/Kconfig
similarity index 100%
rename from arch/mips/lib/crypto/Kconfig
rename to lib/crypto/mips/Kconfig
diff --git a/arch/mips/lib/crypto/Makefile b/lib/crypto/mips/Makefile
similarity index 100%
rename from arch/mips/lib/crypto/Makefile
rename to lib/crypto/mips/Makefile
diff --git a/arch/mips/lib/crypto/chacha-core.S b/lib/crypto/mips/chacha-core.S
similarity index 100%
rename from arch/mips/lib/crypto/chacha-core.S
rename to lib/crypto/mips/chacha-core.S
diff --git a/arch/mips/lib/crypto/chacha-glue.c b/lib/crypto/mips/chacha-glue.c
similarity index 100%
rename from arch/mips/lib/crypto/chacha-glue.c
rename to lib/crypto/mips/chacha-glue.c
diff --git a/arch/mips/lib/crypto/poly1305-glue.c b/lib/crypto/mips/poly1305-glue.c
similarity index 100%
rename from arch/mips/lib/crypto/poly1305-glue.c
rename to lib/crypto/mips/poly1305-glue.c
diff --git a/arch/mips/lib/crypto/poly1305-mips.pl b/lib/crypto/mips/poly1305-mips.pl
similarity index 100%
rename from arch/mips/lib/crypto/poly1305-mips.pl
rename to lib/crypto/mips/poly1305-mips.pl
-- 
2.49.0


