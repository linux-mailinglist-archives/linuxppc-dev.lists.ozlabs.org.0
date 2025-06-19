Return-Path: <linuxppc-dev+bounces-9562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 082BDAE0DC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:22:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVq96Th7z30TY;
	Fri, 20 Jun 2025 05:22:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750360933;
	cv=none; b=TLk1TAqMUt6FkrZKFC3ZP6GMK/v8xRovvEhehiNq76U1wgb4caUMbn+LyMtP+HNGr+5D6K5NXz8OJLR4YKQ1Ma4KBqKup6ksQbGftzbQ74gBeT2EeTa25NsIoYIXTewyWDzVZtqklm4R99YfRmzGbQAZRAKAHgXa0mZCCObxuTQP/ltXtMaZPdX8goJTUUI7hSJWp4A8ZZQcJlTGgNZSbDLkhJWMLjTKcS9bccRIhTcopNvk3mb5TguC8XogCfP6Pu83x2sOUkSwLf3d6QVvHLPs9fzoH5D4zHFFF5OGOtwssnTFZWpjDvdczEZGou0Ci5VEjoQGPBRjGqYI2R49BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750360933; c=relaxed/relaxed;
	bh=fahWvOVNItLm35PMomvGhLHgfle3sZa5yLZw8PoJsQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DiFQ7meOYConrP6l/aMOK2iYph0juAr9lkVIAHNL+ognA3+itcO0XlcHav75MU7vsRpMOKUsgbe5tevuUgFRq4TpaYX6E+qco1K8MoiLB0IHUzQXeKGFuZwXNdR2R4zckeAZHmXmLYFwbXW7n7u6a8quX1KhVN/9BjbyP5VhV5/HyHEXxpTGK0slmK+DTy7s7vaRAgyTSVIJ17r6uslZCzV8/5eQJIOGX7IsK+LRrQOX+5NyPXbTIuKG8TBSFsvyr+c1RSHPCQkJjPKJvPT5u3MOk3+4anDQNrB6FZztSZSXEjveW908o6YkQ5Fte4j4cidB9nh5mHR+Wv7Hswv4Qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J/8283iY; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J/8283iY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVq64fv7z2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:22:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 615344AD79;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8D2C4CEEA;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360928;
	bh=7v+MyTeQcOpDaV4LB38tDUhI6A7m5o/4ae4xLDxCiqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J/8283iYv8EIsY7VeLxKAGdNzaGSoYqyndLVstHfyjRBZP1o1pPBwQxMUA6H+7wUH
	 snIjJBMJHLdbQxXfpvn7VI/E/IcpSWaGGnrptQoBPst3LIFeIcBtS9izH49da54K03
	 9ikt2btjP1vQfUct8pw1PUQK78WHLvyJy86yfAE+lryrdXbQcHP/y0KZKOf0Gx/OdZ
	 Lq6N7SP62AxHxJzfIXs5EuQrwpSEBdr115um089ahtmQ1ZNb5X4GkCDSHNpxvYLhQ5
	 9XfhB+rfs/w7wOSHBo8dgwV6xlUbpgFWEtfLviY+vjABxyTTECiL3LYoPMEcuOuabi
	 TUnpE8ZkUUNTQ==
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
Subject: [PATCH v2 4/9] lib/crypto: powerpc: move arch/powerpc/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:03 -0700
Message-ID: <20250619191908.134235-5-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Move the contents of arch/powerpc/lib/crypto/ into lib/crypto/powerpc/.

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

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/lib/Makefile                                       | 2 --
 lib/crypto/Kconfig                                              | 2 +-
 lib/crypto/Makefile                                             | 1 +
 {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Kconfig         | 0
 {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Makefile        | 0
 .../powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10-glue.c | 0
 .../powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10le-8x.S | 0
 .../lib/crypto => lib/crypto/powerpc}/poly1305-p10-glue.c       | 0
 .../lib/crypto => lib/crypto/powerpc}/poly1305-p10le_64.S       | 0
 .../powerpc/lib/crypto => lib/crypto/powerpc}/sha256-spe-asm.S  | 0
 {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256.c        | 0
 11 files changed, 2 insertions(+), 3 deletions(-)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Kconfig (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Makefile (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10le-8x.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10le_64.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256-spe-asm.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256.c (100%)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 481f968e42c7b..27f8a01438603 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for ppc-specific library files..
 #
 
-obj-y += crypto/
-
 CFLAGS_code-patching.o += -fno-stack-protector
 CFLAGS_feature-fixups.o += -fno-stack-protector
 
 CFLAGS_REMOVE_code-patching.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_feature-fixups.o = $(CC_FLAGS_FTRACE)
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 43c44316fbbdc..f4f9a70dd0891 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -197,11 +197,11 @@ source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
 source "lib/crypto/mips/Kconfig"
 endif
 if PPC
-source "arch/powerpc/lib/crypto/Kconfig"
+source "lib/crypto/powerpc/Kconfig"
 endif
 if RISCV
 source "arch/riscv/lib/crypto/Kconfig"
 endif
 if S390
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 74331243b8c44..47c889b881b2a 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -104,5 +104,6 @@ obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
+obj-$(CONFIG_PPC) += powerpc/
diff --git a/arch/powerpc/lib/crypto/Kconfig b/lib/crypto/powerpc/Kconfig
similarity index 100%
rename from arch/powerpc/lib/crypto/Kconfig
rename to lib/crypto/powerpc/Kconfig
diff --git a/arch/powerpc/lib/crypto/Makefile b/lib/crypto/powerpc/Makefile
similarity index 100%
rename from arch/powerpc/lib/crypto/Makefile
rename to lib/crypto/powerpc/Makefile
diff --git a/arch/powerpc/lib/crypto/chacha-p10-glue.c b/lib/crypto/powerpc/chacha-p10-glue.c
similarity index 100%
rename from arch/powerpc/lib/crypto/chacha-p10-glue.c
rename to lib/crypto/powerpc/chacha-p10-glue.c
diff --git a/arch/powerpc/lib/crypto/chacha-p10le-8x.S b/lib/crypto/powerpc/chacha-p10le-8x.S
similarity index 100%
rename from arch/powerpc/lib/crypto/chacha-p10le-8x.S
rename to lib/crypto/powerpc/chacha-p10le-8x.S
diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/lib/crypto/powerpc/poly1305-p10-glue.c
similarity index 100%
rename from arch/powerpc/lib/crypto/poly1305-p10-glue.c
rename to lib/crypto/powerpc/poly1305-p10-glue.c
diff --git a/arch/powerpc/lib/crypto/poly1305-p10le_64.S b/lib/crypto/powerpc/poly1305-p10le_64.S
similarity index 100%
rename from arch/powerpc/lib/crypto/poly1305-p10le_64.S
rename to lib/crypto/powerpc/poly1305-p10le_64.S
diff --git a/arch/powerpc/lib/crypto/sha256-spe-asm.S b/lib/crypto/powerpc/sha256-spe-asm.S
similarity index 100%
rename from arch/powerpc/lib/crypto/sha256-spe-asm.S
rename to lib/crypto/powerpc/sha256-spe-asm.S
diff --git a/arch/powerpc/lib/crypto/sha256.c b/lib/crypto/powerpc/sha256.c
similarity index 100%
rename from arch/powerpc/lib/crypto/sha256.c
rename to lib/crypto/powerpc/sha256.c
-- 
2.50.0


