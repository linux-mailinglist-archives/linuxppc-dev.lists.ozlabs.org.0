Return-Path: <linuxppc-dev+bounces-8018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6110A9D8B3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 08:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl0kL025Tz2yqy;
	Sat, 26 Apr 2025 16:51:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745650313;
	cv=none; b=EDKDJTbdS1xrKW8yAlJfFD2QYsqb92GmhXArfe7oAvCZFB9n7kmN8vrwF69bWvLLIvtnIKOWYA/Mc6ko6OuvMx51uKgATGm1Dp4GHM13FldNphr5I0yjXwK9TACm7WEL7mUw/o1CPFy31k6oFL5XRu6CVrcFKqLoEpTbCxhSRocGuQ79+fkSOlY94u6Qapks3EPtssF8myDjyTTVufkmUxzaWqwi7eN1RX7jw9IVgZFTsBZVhx067mM71BkIxvLB4/Fi1ikoGEOdBSugEgD/NttVBeoKEYNRykrP09m0TnLfeWmouIt+4u3RGowAdIcR3NcV1ChFiLo6KKS8bTNohg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745650313; c=relaxed/relaxed;
	bh=mV6RRDzurQK/QDHVsWwoXStPnY+UbIPCihlZZGD4jdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5y4pEU6btiqRKJ9W+duF6LzQBg4fIMw6pknmJVydK3X65WF/8phAPRdxXdEs+ZuhMDcs8s2ghe5N94IXpv16mHsP+HVZwcKn/cVSgK+eNYddJe6lZDjnq5cumTnoCBJJdOOXiR+J+FU8M7JI3bKGX0DrXZ7MH0BkMp5HTK/TgU+9seZSxllVYC2eDHDuT68as/UQxdxEmYdIJfv5PDK+awaSfx2QMvGZM3XNiSeW1sgXPTi69z98aRiiaWD3V6lXul+denDVxRDjyvlUXxnOZY1yhkM5zE5ibwAXDBhli9fMUw/cTfN7EjlLXnCQ1LpxlleCkR4siy+nWX3RDbrvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oPSkMeWn; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oPSkMeWn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl0kB5Dqbz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 16:51:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0EBB4A47E;
	Sat, 26 Apr 2025 06:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3427C4AF0B;
	Sat, 26 Apr 2025 06:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745650304;
	bh=frmoNMX9rkL1gGxdvxYvF+q9FW0efq8uiNqM3qhMIXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oPSkMeWnyIurxq0SeQFDNzck9Xk9VpviNNmbWNvBFfJnjngDZ4UbsQ3+hzGEEe6pR
	 XkY7x9RxNFerL1WyjtJY7UsXDx8/LWDM2Mk8/xU8jDvaNc5i06RwYwYTDBOeSdRZHx
	 mXbC/WYzRNQce77OCmcsYYuAZZqTIIrwR/nRCjOSgD8/j1JSRsu4oUTjM1r0kjriUz
	 UllbW+msgPPJPe9qphniSzEwoxgqRj6kM9klnOR/mm0izM78qogHtW/xS45FKaLKJd
	 xNc5nEdH9k3pOB7KOvQOskLI5BfxB4Wl7ymTdSpKd6BpZrP/YwJiuTQiomEfSnj/DO
	 bDZZz//wkLHag==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 09/13] crypto: sparc - move opcodes.h into asm directory
Date: Fri, 25 Apr 2025 23:50:35 -0700
Message-ID: <20250426065041.1551914-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
References: <20250426065041.1551914-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Since arch/sparc/crypto/opcodes.h is now needed outside the
arch/sparc/crypto/ directory, move it into arch/sparc/include/asm/ so
that it can be included as <asm/opcodes.h>.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/crypto/aes_asm.S                  | 3 +--
 arch/sparc/crypto/aes_glue.c                 | 3 +--
 arch/sparc/crypto/camellia_asm.S             | 3 +--
 arch/sparc/crypto/camellia_glue.c            | 3 +--
 arch/sparc/crypto/des_asm.S                  | 3 +--
 arch/sparc/crypto/des_glue.c                 | 3 +--
 arch/sparc/crypto/md5_asm.S                  | 3 +--
 arch/sparc/crypto/md5_glue.c                 | 3 +--
 arch/sparc/crypto/sha1_asm.S                 | 3 +--
 arch/sparc/crypto/sha1_glue.c                | 3 +--
 arch/sparc/crypto/sha256_asm.S               | 3 +--
 arch/sparc/crypto/sha256_glue.c              | 3 +--
 arch/sparc/crypto/sha512_asm.S               | 3 +--
 arch/sparc/crypto/sha512_glue.c              | 3 +--
 arch/sparc/{crypto => include/asm}/opcodes.h | 6 +++---
 arch/sparc/lib/crc32c_asm.S                  | 3 +--
 16 files changed, 18 insertions(+), 33 deletions(-)
 rename arch/sparc/{crypto => include/asm}/opcodes.h (96%)

diff --git a/arch/sparc/crypto/aes_asm.S b/arch/sparc/crypto/aes_asm.S
index 155cefb98520e..f291174a72a1d 100644
--- a/arch/sparc/crypto/aes_asm.S
+++ b/arch/sparc/crypto/aes_asm.S
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 #define ENCRYPT_TWO_ROUNDS(KEY_BASE, I0, I1, T0, T1) \
 	AES_EROUND01(KEY_BASE +  0, I0, I1, T0) \
 	AES_EROUND23(KEY_BASE +  2, I0, I1, T1) \
 	AES_EROUND01(KEY_BASE +  4, T0, T1, I0) \
 	AES_EROUND23(KEY_BASE +  6, T0, T1, I1)
diff --git a/arch/sparc/crypto/aes_glue.c b/arch/sparc/crypto/aes_glue.c
index 6831508303562..359f22643b051 100644
--- a/arch/sparc/crypto/aes_glue.c
+++ b/arch/sparc/crypto/aes_glue.c
@@ -25,15 +25,14 @@
 #include <crypto/algapi.h>
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
 
 #include <asm/fpumacro.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <asm/elf.h>
 
-#include "opcodes.h"
-
 struct aes_ops {
 	void (*encrypt)(const u64 *key, const u32 *input, u32 *output);
 	void (*decrypt)(const u64 *key, const u32 *input, u32 *output);
 	void (*load_encrypt_keys)(const u64 *key);
 	void (*load_decrypt_keys)(const u64 *key);
diff --git a/arch/sparc/crypto/camellia_asm.S b/arch/sparc/crypto/camellia_asm.S
index dcdc9193fcd72..8471b346ef548 100644
--- a/arch/sparc/crypto/camellia_asm.S
+++ b/arch/sparc/crypto/camellia_asm.S
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 #define CAMELLIA_6ROUNDS(KEY_BASE, I0, I1) \
 	CAMELLIA_F(KEY_BASE +  0, I1, I0, I1) \
 	CAMELLIA_F(KEY_BASE +  2, I0, I1, I0) \
 	CAMELLIA_F(KEY_BASE +  4, I1, I0, I1) \
 	CAMELLIA_F(KEY_BASE +  6, I0, I1, I0) \
diff --git a/arch/sparc/crypto/camellia_glue.c b/arch/sparc/crypto/camellia_glue.c
index aaa9714378e66..e7a1e1c42b996 100644
--- a/arch/sparc/crypto/camellia_glue.c
+++ b/arch/sparc/crypto/camellia_glue.c
@@ -13,15 +13,14 @@
 #include <linux/types.h>
 #include <crypto/algapi.h>
 #include <crypto/internal/skcipher.h>
 
 #include <asm/fpumacro.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <asm/elf.h>
 
-#include "opcodes.h"
-
 #define CAMELLIA_MIN_KEY_SIZE        16
 #define CAMELLIA_MAX_KEY_SIZE        32
 #define CAMELLIA_BLOCK_SIZE          16
 #define CAMELLIA_TABLE_BYTE_LEN     272
 
diff --git a/arch/sparc/crypto/des_asm.S b/arch/sparc/crypto/des_asm.S
index 7157468a679df..d534446cbef9a 100644
--- a/arch/sparc/crypto/des_asm.S
+++ b/arch/sparc/crypto/des_asm.S
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 	.align	32
 ENTRY(des_sparc64_key_expand)
 	/* %o0=input_key, %o1=output_key */
 	VISEntryHalf
 	ld	[%o0 + 0x00], %f0
diff --git a/arch/sparc/crypto/des_glue.c b/arch/sparc/crypto/des_glue.c
index a499102bf7065..e50ec4cd57cde 100644
--- a/arch/sparc/crypto/des_glue.c
+++ b/arch/sparc/crypto/des_glue.c
@@ -14,15 +14,14 @@
 #include <crypto/algapi.h>
 #include <crypto/internal/des.h>
 #include <crypto/internal/skcipher.h>
 
 #include <asm/fpumacro.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <asm/elf.h>
 
-#include "opcodes.h"
-
 struct des_sparc64_ctx {
 	u64 encrypt_expkey[DES_EXPKEY_WORDS / 2];
 	u64 decrypt_expkey[DES_EXPKEY_WORDS / 2];
 };
 
diff --git a/arch/sparc/crypto/md5_asm.S b/arch/sparc/crypto/md5_asm.S
index 7a6637455f37a..60b544e4d205b 100644
--- a/arch/sparc/crypto/md5_asm.S
+++ b/arch/sparc/crypto/md5_asm.S
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 ENTRY(md5_sparc64_transform)
 	/* %o0 = digest, %o1 = data, %o2 = rounds */
 	VISEntryHalf
 	ld	[%o0 + 0x00], %f0
 	ld	[%o0 + 0x04], %f1
diff --git a/arch/sparc/crypto/md5_glue.c b/arch/sparc/crypto/md5_glue.c
index 5b018c6a376c4..b3615f0cdf626 100644
--- a/arch/sparc/crypto/md5_glue.c
+++ b/arch/sparc/crypto/md5_glue.c
@@ -13,21 +13,20 @@
  */
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <asm/elf.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <crypto/internal/hash.h>
 #include <crypto/md5.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/unaligned.h>
 
-#include "opcodes.h"
-
 struct sparc_md5_state {
 	__le32 hash[MD5_HASH_WORDS];
 	u64 byte_count;
 };
 
diff --git a/arch/sparc/crypto/sha1_asm.S b/arch/sparc/crypto/sha1_asm.S
index 7d8bf354f0e79..00b46bac1b08f 100644
--- a/arch/sparc/crypto/sha1_asm.S
+++ b/arch/sparc/crypto/sha1_asm.S
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 ENTRY(sha1_sparc64_transform)
 	/* %o0 = digest, %o1 = data, %o2 = rounds */
 	VISEntryHalf
 	ld	[%o0 + 0x00], %f0
 	ld	[%o0 + 0x04], %f1
diff --git a/arch/sparc/crypto/sha1_glue.c b/arch/sparc/crypto/sha1_glue.c
index ec5a06948e0d4..ef19d5023b1bc 100644
--- a/arch/sparc/crypto/sha1_glue.c
+++ b/arch/sparc/crypto/sha1_glue.c
@@ -10,19 +10,18 @@
  */
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <asm/elf.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha1.h>
 #include <crypto/sha1_base.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "opcodes.h"
-
 asmlinkage void sha1_sparc64_transform(struct sha1_state *digest,
 				       const u8 *data, int rounds);
 
 static int sha1_sparc64_update(struct shash_desc *desc, const u8 *data,
 			       unsigned int len)
diff --git a/arch/sparc/crypto/sha256_asm.S b/arch/sparc/crypto/sha256_asm.S
index 0b39ec7d7ca29..8ce88611e98ad 100644
--- a/arch/sparc/crypto/sha256_asm.S
+++ b/arch/sparc/crypto/sha256_asm.S
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 ENTRY(sha256_sparc64_transform)
 	/* %o0 = digest, %o1 = data, %o2 = rounds */
 	VISEntryHalf
 	ld	[%o0 + 0x00], %f0
 	ld	[%o0 + 0x04], %f1
diff --git a/arch/sparc/crypto/sha256_glue.c b/arch/sparc/crypto/sha256_glue.c
index ddb250242faf4..25008603a9868 100644
--- a/arch/sparc/crypto/sha256_glue.c
+++ b/arch/sparc/crypto/sha256_glue.c
@@ -10,19 +10,18 @@
  */
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <asm/elf.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
 #include <crypto/sha256_base.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "opcodes.h"
-
 asmlinkage void sha256_sparc64_transform(u32 *digest, const char *data,
 					 unsigned int rounds);
 
 static void sha256_block(struct crypto_sha256_state *sctx, const u8 *src,
 			 int blocks)
diff --git a/arch/sparc/crypto/sha512_asm.S b/arch/sparc/crypto/sha512_asm.S
index b2f6e67288023..9932b4fe1b599 100644
--- a/arch/sparc/crypto/sha512_asm.S
+++ b/arch/sparc/crypto/sha512_asm.S
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 ENTRY(sha512_sparc64_transform)
 	/* %o0 = digest, %o1 = data, %o2 = rounds */
 	VISEntry
 	ldd	[%o0 + 0x00], %f0
 	ldd	[%o0 + 0x08], %f2
diff --git a/arch/sparc/crypto/sha512_glue.c b/arch/sparc/crypto/sha512_glue.c
index 1d0e1f98ca461..47b9277b6877a 100644
--- a/arch/sparc/crypto/sha512_glue.c
+++ b/arch/sparc/crypto/sha512_glue.c
@@ -9,19 +9,18 @@
  */
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <asm/elf.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
 #include <crypto/sha512_base.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "opcodes.h"
-
 asmlinkage void sha512_sparc64_transform(u64 *digest, const char *data,
 					 unsigned int rounds);
 
 static void sha512_block(struct sha512_state *sctx, const u8 *src, int blocks)
 {
diff --git a/arch/sparc/crypto/opcodes.h b/arch/sparc/include/asm/opcodes.h
similarity index 96%
rename from arch/sparc/crypto/opcodes.h
rename to arch/sparc/include/asm/opcodes.h
index 417b6a10a337a..ebfda6eb49b26 100644
--- a/arch/sparc/crypto/opcodes.h
+++ b/arch/sparc/include/asm/opcodes.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _OPCODES_H
-#define _OPCODES_H
+#ifndef _SPARC_ASM_OPCODES_H
+#define _SPARC_ASM_OPCODES_H
 
 #define SPARC_CR_OPCODE_PRIORITY	300
 
 #define F3F(x,y,z)	(((x)<<30)|((y)<<19)|((z)<<5))
 
@@ -95,6 +95,6 @@
 #define MOVXTOD_G3_F60		\
 	.word	0xbbb02303;
 #define MOVXTOD_G7_F62		\
 	.word	0xbfb02307;
 
-#endif /* _OPCODES_H */
+#endif /* _SPARC_ASM_OPCODES_H */
diff --git a/arch/sparc/lib/crc32c_asm.S b/arch/sparc/lib/crc32c_asm.S
index ee454fa6aed68..4db873850f44c 100644
--- a/arch/sparc/lib/crc32c_asm.S
+++ b/arch/sparc/lib/crc32c_asm.S
@@ -1,12 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 #include <asm/asi.h>
 
-#include "../crypto/opcodes.h"
-
 ENTRY(crc32c_sparc64)
 	/* %o0=crc32p, %o1=data_ptr, %o2=len */
 	VISEntryHalf
 	lda	[%o0] ASI_PL, %f1
 1:	ldd	[%o1], %f2
-- 
2.49.0


