Return-Path: <linuxppc-dev+bounces-9561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB4AE0DBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:22:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVq92MvBz30MY;
	Fri, 20 Jun 2025 05:22:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750360933;
	cv=none; b=LFqUe6aYJy+K9vB/ieZ63wmo2mGpLGMamF+cywfKQCPminac/NMlegbXJGjXU/JAbAi/Myuc9lBXicmImSenO4Yx28PjUyUruEuUU99Mx6PbnG8SGm+lCed2xM0ZVbd5ySYoB/sNxKA/lA78YQqP1nsEOFrBxWLOpzsS18NRJ27FPXywhLYXbDGxowMQe7xGTumNoNMxssVQNdsYEFryDTG7z/N19PCbduAwCT/WdD7rtfSrwMavQ1u0cf9HvT5EUOKcf42L4+8PLmnhYmi9Vt/kEAQS5Y15KIfnRAuI2OywwRmiFegRpQf/ymOuEz4qOaE3TQocZMITbCT3yHLy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750360933; c=relaxed/relaxed;
	bh=GrH5VSiT8MxMaUazRdkPM5zdFPyr24toXYctKu98oRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKN3w0iXwl1sGItD7iRLO1aPbBF+UBaXEZpNYifJS44xKnSCnpJLGp/avuh7gcOZdRahkLvb5Qm/Bn8ysearMGccGqKA1ywNKJmXznIo+TJp03nCozA9OGbwm0bavrzEjmL5+uFkRN0MZf84X4BxJFTXppo/DQut7c/9zYbwRrcxGrsrbbQBO1az1IsqN4sRcq2P1H8bLuDk2JaYf1o3R8ZEflVuy/bwrr7H4GdLM76grDg1cuzHmiSR2DYAlKTsbxBLEcFPjOCEu1MFruy3pMnATwN4NU8mXWExEcY/83H8UnIwQhH0CKiSbOKecVS0+iEGzTK6ikp5rKKeXc62vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JdVrvlVo; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JdVrvlVo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVq64WX2z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:22:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E12D04AD71;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7655EC4CEF4;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360927;
	bh=ElmQYzEq2VpH5qDwci77lBilaBOMdPQESLW1rZ2SRRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JdVrvlVoT1rtjzzaiUrJC17MtKX7Yf1MYoVVn55rjbbBkeAyoyDAWcKiRxC1s4GCz
	 bcaelq71ZOJTM97boLCl0atez/vFDxJXitE/4z++ykOXNxIccnJ1WybTUdkYzbFGXG
	 Y8hzHw+grTUKsz7NPQjENahSCa73vi4pxsFRkq/MqHQPxz971u/dTf2DpYCkQhPPmB
	 llp3Om+CL2tH037cOojS9FSg0cP1sKARmB++dbAAzreVsNdpYK4/oqdCRYZm6lwUnk
	 BRaznLPDKnueBbfcH5+h3ElAsf3JTTU2fDJzk+zBp+1cbnuqHQxhaBLQ13BYY6QDgE
	 OrMdX3QCoJVXQ==
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
Subject: [PATCH v2 3/9] lib/crypto: mips: move arch/mips/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:02 -0700
Message-ID: <20250619191908.134235-4-ebiggers@kernel.org>
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

Add a gitignore entry for the removed directory arch/mips/lib/crypto/ so
that people don't accidentally commit leftover generated files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/lib/.gitignore                                   | 4 ++++
 arch/mips/lib/Makefile                                     | 2 --
 lib/crypto/Kconfig                                         | 2 +-
 lib/crypto/Makefile                                        | 1 +
 {arch/mips/lib/crypto => lib/crypto/mips}/.gitignore       | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig          | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/Makefile         | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c  | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl | 0
 11 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/lib/.gitignore
 rename {arch/mips/lib/crypto => lib/crypto/mips}/.gitignore (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Makefile (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl (100%)

diff --git a/arch/mips/lib/.gitignore b/arch/mips/lib/.gitignore
new file mode 100644
index 0000000000000..647d7a922e680
--- /dev/null
+++ b/arch/mips/lib/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# This now-removed directory used to contain generated files.
+/crypto/
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
diff --git a/arch/mips/lib/crypto/.gitignore b/lib/crypto/mips/.gitignore
similarity index 100%
rename from arch/mips/lib/crypto/.gitignore
rename to lib/crypto/mips/.gitignore
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
2.50.0


