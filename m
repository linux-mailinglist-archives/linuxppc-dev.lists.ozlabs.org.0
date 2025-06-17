Return-Path: <linuxppc-dev+bounces-9425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42288ADDEC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 00:30:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMM4q4Tr7z2xjN;
	Wed, 18 Jun 2025 08:30:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750199403;
	cv=none; b=P9IxXjYlxF9GkVYKVVIDb55oToIVOQ0ToO6iqAVGqfFjMeJYD7LJSWLV2zFrOFmzcj2KgiEhfYl6INR7BKiTtwnPz/Iy/MpyMZFRdRzd2XKJT3tDJBxHGMeF1jSK8azJVh6EX+tUbGzFYbS85ySnpm35x0+O51D43zpW33kfzqln5V85gfJz6iQ8sRsmPEA3qnng2z3qtOkeLR6fJFXxswDIJaGwW/q5X1i8dFFIkcElvLYiEQr7mlLovX/zJB1gskksVJiwBTZIwsHFoCOeh9Wyyb17O2Df9vGHXMULRvkGggu9cPsy2YivL71cZRF1CVe/LkKdkPS7XsUWAIxtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750199403; c=relaxed/relaxed;
	bh=0I2b5U+Xv81Zn8s0sdSKH8/oDhCFkwv0ShdSLVv9ycM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LdhExFCioFbvrxCm4GUm/BZTnUGqe1ioKcI1r054fvwmVLUu1+qloQW/AQF793py9hHN+7ZUvXwLwvPfAwclPvtx55pwTlg6TwaUYo9jSnrw6MLsMR4SS8xbt0X5XH6aVvp1neUprH9STPF5Q3d3M8mQcENFGwlHY4wgRV3Nxx0wJDF0BEkvKdt+eUF0xMs7PpKHC27xGAiKFrJlzxg4b53cdbewE1b8haGIsN57cKKnPmil0e++dkNo3t/Vtm+P48xhkU0o9sHh0iSNByOXHALuPFYSDoTxz79LgthHdRjBoiohvHFhZcGIyXrgJ2quY3u3SB5p2ZGkjotkUikfhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r876Iish; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r876Iish;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMM4m4sr0z2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 08:30:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 642494A5C3;
	Tue, 17 Jun 2025 22:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8544C4CEF1;
	Tue, 17 Jun 2025 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199398;
	bh=E1R8tZTC4zFm0PByz0jO522hOoQZFenFe04oUA8okGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r876IishAxc+pn2+pvqnZzqka17ASUqbTJbVRTqL20VRsiOnlfPiaMkAv817AJJGh
	 sGqJN5H8LVXpj+EKPjnSUI4g4bTGgDzjvYDTevWAqxOIJW7cZMQnFRL/rKd5FUWHBK
	 HgheC4z3wqYI5pUZgOIWex2e4xR9XOKNKtQEdUGLG6fC7ioQP9legtxFA6s9JQn8ZL
	 aiRtEdfX93s7BmvRkX5toKuNEtqtwx//Ifm3dTZ/U1mv5DGcLJ7IT8KeNXQLRl14vx
	 w11r8GkTWnZDuj78P/14I5ydg6GH7U5Wsl5SF6OjemIAnpyTIQxf4bVkYOTIlsAjQd
	 KaO82TpsNYkCA==
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
Subject: [PATCH 1/9] lib/crypto/arm: move arch/arm/lib/crypto/ to lib/crypto/arm/
Date: Tue, 17 Jun 2025 15:27:18 -0700
Message-ID: <20250617222726.365148-2-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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

arch/arm/lib/crypto/.gitignore is intentionally kept for now.  See
https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
I'll remove it later after some time has passed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/lib/Makefile                                        | 2 --
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
 16 files changed, 5 insertions(+), 3 deletions(-)
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
2.49.0


