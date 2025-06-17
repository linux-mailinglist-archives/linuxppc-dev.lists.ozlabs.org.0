Return-Path: <linuxppc-dev+bounces-9431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A975FADDEE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 00:31:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMM4x1WnZz30WF;
	Wed, 18 Jun 2025 08:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750199408;
	cv=none; b=TRS5oT7TBocF5PAhtHYgPomvSa8GAq/9b6OheuuDoN98yiNSzfPepDBBZAIHNKTYkxysZU4/nfCeHJk6TPsI3M+57qYHfyzVQFVvuCYXxXUm/L8UYI+Q+NJ/x29SdaOpe5tXfY38p4kqBIjRHSjXe12j8PILYojnsi8HWz75Qsk3US7PUqEkO7fgATFa3Qi+R7qATKnx9hYMMPgEMESRVtyR52JUMuFUocPyI8tTTFcyG/i7fvWbRa9lHY5jYt34rW1QR4E59xdUwsf/imZznegBU5GLNP49p9EPjO2ThXZssgm3cIhtuy1YlUyr7JUuoOWuHcDNxDcDrHOGEGXQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750199408; c=relaxed/relaxed;
	bh=8yDurYd6msfoL8mSdL6axYYnHQRG9iT7rHPbJKFYp8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQG3yktLJZx7PZINoitKKtr64SvHbx5ovSBlod8plFHbie7OX7GfeFQUCfuWEydneunvUE9ib0u7XF8z9WDT0z/pxfPpie+6lJhC/UKnIYvw2o+lUKuFLDXC5VmTK43HnxKpKRWYsy/pzVF2vsHcx6/aHvC8czmAdT9cElciHQVyyti4alEA9VoAEFbazfXrIgArs7lR2aDfcxQ5egtqsXUjIjrN9l6zPmgri1EffCjMpGu68dmAQmITcVcjsCLIWb99jLEee+dGvlz3ePjwuI1xwX/eSkxwtrhk8pZY5F4ik24Js+VhcUZqmePqiz1m5Ss4K9SmQG7WjJ+xhY+98A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZsitZocB; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZsitZocB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMM4p2dwjz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 08:30:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 192B4A51F9C;
	Tue, 17 Jun 2025 22:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67248C4CEF3;
	Tue, 17 Jun 2025 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199398;
	bh=C+iLWRA20P3X1lC1oFCgQmxMpv2O73JWlAx7pptA2cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZsitZocB41oAkkPQyvyXhXqiDNBnwaQ4sEvYshVLiXH0oyCVKXGvTAevOMFGVIEXZ
	 kY1+mTaemqobfKe0sOeuuj68Zz7appHM4k1I/jZo0BU74IUNttSmxDTT4QYvsKuDRy
	 Ps8+5uHMzGuXGa43J+UoxBdxpSZPHyX2qdljDE8scEg6gpN6e5g2AAWzADmurzXi7m
	 PZjqnql0C+Rx2OST5bGfXe01e9aFZHwdZeHEs8LkvKLvDqNOLh4w2PgjfltJAPenrh
	 jHKU5sXenFTuzL1pN5dCSIqwv0sAHMk+qgmIrOtUv7vnxE5wEfqvNn2t71+RbVOFFb
	 FMPN33q43wcZQ==
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
Subject: [PATCH 2/9] lib/crypto/arm64: move arch/arm64/lib/crypto/ to lib/crypto/arm64/
Date: Tue, 17 Jun 2025 15:27:19 -0700
Message-ID: <20250617222726.365148-3-ebiggers@kernel.org>
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

Move the contents of arch/arm64/lib/crypto/ into lib/crypto/arm64/.

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

arch/arm64/lib/crypto/.gitignore is intentionally kept for now.  See
https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
I'll remove it later after some time has passed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/Makefile                                        | 3 ---
 lib/crypto/Kconfig                                             | 2 +-
 lib/crypto/Makefile                                            | 3 ++-
 lib/crypto/arm64/.gitignore                                    | 2 ++
 {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig            | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile           | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl  | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c    | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl      | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S        | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c           | 0
 13 files changed, 5 insertions(+), 5 deletions(-)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c (100%)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 027bfa9689c6a..d97e290619bc5 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-
-obj-y += crypto/
-
 lib-y		:= clear_user.o delay.o copy_from_user.o		\
 		   copy_to_user.o copy_page.o				\
 		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
 		   memset.o memcmp.o strcmp.o strncmp.o strlen.o	\
 		   strnlen.o strchr.o strrchr.o tishift.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index e14bef8e87af2..fdeb91bf00328 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -191,11 +191,11 @@ config CRYPTO_LIB_SM3
 if !KMSAN # avoid false positives from assembly
 if ARM
 source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
-source "arch/arm64/lib/crypto/Kconfig"
+source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
 source "arch/mips/lib/crypto/Kconfig"
 endif
 if PPC
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index ddf04e2270f1e..63ab907e8f53b 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -81,11 +81,11 @@ clean-files += arm/sha512-core.S
 AFLAGS_arm/sha512-core.o += $(aflags-thumb2-y)
 endif
 
 ifeq ($(CONFIG_ARM64),y)
 libsha512-y += arm64/sha512-core.o
-$(obj)/arm64/sha512-core.S: $(src)/../../arch/arm64/lib/crypto/sha2-armv8.pl
+$(obj)/arm64/sha512-core.S: $(src)/arm64/sha2-armv8.pl
 	$(call cmd,perlasm_with_args)
 clean-files += arm64/sha512-core.S
 libsha512-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha512-ce-core.o
 endif
 
@@ -102,5 +102,6 @@ obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
+obj-$(CONFIG_ARM64) += arm64/
diff --git a/lib/crypto/arm64/.gitignore b/lib/crypto/arm64/.gitignore
index 670a4d97b5684..f6c4e8ef80dae 100644
--- a/lib/crypto/arm64/.gitignore
+++ b/lib/crypto/arm64/.gitignore
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
+sha256-core.S
 sha512-core.S
diff --git a/arch/arm64/lib/crypto/Kconfig b/lib/crypto/arm64/Kconfig
similarity index 100%
rename from arch/arm64/lib/crypto/Kconfig
rename to lib/crypto/arm64/Kconfig
diff --git a/arch/arm64/lib/crypto/Makefile b/lib/crypto/arm64/Makefile
similarity index 100%
rename from arch/arm64/lib/crypto/Makefile
rename to lib/crypto/arm64/Makefile
diff --git a/arch/arm64/lib/crypto/chacha-neon-core.S b/lib/crypto/arm64/chacha-neon-core.S
similarity index 100%
rename from arch/arm64/lib/crypto/chacha-neon-core.S
rename to lib/crypto/arm64/chacha-neon-core.S
diff --git a/arch/arm64/lib/crypto/chacha-neon-glue.c b/lib/crypto/arm64/chacha-neon-glue.c
similarity index 100%
rename from arch/arm64/lib/crypto/chacha-neon-glue.c
rename to lib/crypto/arm64/chacha-neon-glue.c
diff --git a/arch/arm64/lib/crypto/poly1305-armv8.pl b/lib/crypto/arm64/poly1305-armv8.pl
similarity index 100%
rename from arch/arm64/lib/crypto/poly1305-armv8.pl
rename to lib/crypto/arm64/poly1305-armv8.pl
diff --git a/arch/arm64/lib/crypto/poly1305-glue.c b/lib/crypto/arm64/poly1305-glue.c
similarity index 100%
rename from arch/arm64/lib/crypto/poly1305-glue.c
rename to lib/crypto/arm64/poly1305-glue.c
diff --git a/arch/arm64/lib/crypto/sha2-armv8.pl b/lib/crypto/arm64/sha2-armv8.pl
similarity index 100%
rename from arch/arm64/lib/crypto/sha2-armv8.pl
rename to lib/crypto/arm64/sha2-armv8.pl
diff --git a/arch/arm64/lib/crypto/sha256-ce.S b/lib/crypto/arm64/sha256-ce.S
similarity index 100%
rename from arch/arm64/lib/crypto/sha256-ce.S
rename to lib/crypto/arm64/sha256-ce.S
diff --git a/arch/arm64/lib/crypto/sha256.c b/lib/crypto/arm64/sha256.c
similarity index 100%
rename from arch/arm64/lib/crypto/sha256.c
rename to lib/crypto/arm64/sha256.c
-- 
2.49.0


