Return-Path: <linuxppc-dev+bounces-8048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D8A9DFAB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 08:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlcCs4QBxz2yqv;
	Sun, 27 Apr 2025 16:31:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745735465;
	cv=none; b=Q60D+LDWarEI5H+QHRqkhZ5+emRkMh5Pze13+uDwZ1VuptZtSCpgevgBnafUtDgU+c7mGjwRlv2QjxFGq3EsNMi1+x3G68QEuxi5W/qR46gemFMRsMT3bPRWsBM2ZSWsKNDrD0AIunmjWkriQdZOrBZP5826NalCuDStYxxWf2dTc8PC1OAo/TfcVDlblngxXWyAkR+wAhZ2Cov4jhqoqMWOWTvyAThQOydFnetn5M1kSaP1PhPBfI9YS8dcsz2/gTQPunNdn0U75QpgTRy+JYorf9FGropx0vAghRwRsNCnZOJwpUWTBvLgGwAjK1aEu2BvbADY+pG3D+75pCdNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745735465; c=relaxed/relaxed;
	bh=yYMhF56UBrW4vw1N5woszYg1tkkmu/whJytCBt7SJNI=;
	h=Date:Message-Id:In-Reply-To:References:From:Subject:To:Cc; b=DayuoKMTRo81utFGwfCjRwknburjMqtUu1o0pX/nGGbSOdeXo5tms6Cj2VLzWrm2wX4n5Z8oLQQV1YIUoG5Y6iF5AhGQDi+HsLU2X8Oa6xZ3M9O7FW+waN9kzCpUeXLnsxGemp0aPUfkHzOvxkXOxOz3C6Rrv98ZyVpy2bHPuMlNLzL82n39CXOurF3aoRlUabDJrP/0iMXxTnIjdZBkVjMCDhUAvC9vYlO1RkF+ey2bbOdwnhhU/WxwUtfJQLz2qL6g4rqh6hQrTYguU/0l/dvfAha+iJMUyAh4u/6AkFoWq4h1+jLtgEVUnAqQ2ymOZXdvqFvHWR6P9DFZZqMq6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=lzbCN8TK; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=lzbCN8TK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlcCs0Jdxz2y0B
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 16:31:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yYMhF56UBrW4vw1N5woszYg1tkkmu/whJytCBt7SJNI=; b=lzbCN8TKOgj9TFXcNkjw9vqfFE
	vwD1VHB+v+AabtqHlSy3Uq5fkx0l6kV/HMRXvVj5LTuZrJcv8n8tZsl+p3sAZjULIH1CaGOiyGWFZ
	la5ky3qJvgx4sHpDYUWnwyWODVnB46JAFebHvHVs93O9lenypGBoun0x6+SDz8bEdUSNvVJ+K0E/C
	cJC8GeQFYoE4Dq466vyIlgGhmfJQMM1OXkJVrs5pxFmcZetd+Eqho7yX8myN7DXKdlDZ2cXw2WwCF
	3kFu+nE+MNMj1TY2KWCGY93xfxLRCktQuOKCGyhXH08YHAI2PjFMpYzj6KiTRH1NhBu3m1IfjwRyl
	LwR253Ag==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8vXa-001LWY-2Q;
	Sun, 27 Apr 2025 14:31:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 14:31:02 +0800
Date: Sun, 27 Apr 2025 14:31:02 +0800
Message-Id: <34cbd8e954a0780f899a88755e85f7db8713d274.1745734678.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v2 PATCH 09/13] crypto: sparc - move opcodes.h into asm directory
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

From: Eric Biggers <ebiggers@google.com>

Since arch/sparc/crypto/opcodes.h is now needed outside the
arch/sparc/crypto/ directory, move it into arch/sparc/include/asm/ so
that it can be included as <asm/opcodes.h>.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
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
index 155cefb98520..f291174a72a1 100644
--- a/arch/sparc/crypto/aes_asm.S
+++ b/arch/sparc/crypto/aes_asm.S
@@ -1,9 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 #define ENCRYPT_TWO_ROUNDS(KEY_BASE, I0, I1, T0, T1) \
 	AES_EROUND01(KEY_BASE +  0, I0, I1, T0) \
 	AES_EROUND23(KEY_BASE +  2, I0, I1, T1) \
diff --git a/arch/sparc/crypto/aes_glue.c b/arch/sparc/crypto/aes_glue.c
index 683150830356..359f22643b05 100644
--- a/arch/sparc/crypto/aes_glue.c
+++ b/arch/sparc/crypto/aes_glue.c
@@ -27,11 +27,10 @@
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
diff --git a/arch/sparc/crypto/camellia_asm.S b/arch/sparc/crypto/camellia_asm.S
index dcdc9193fcd7..8471b346ef54 100644
--- a/arch/sparc/crypto/camellia_asm.S
+++ b/arch/sparc/crypto/camellia_asm.S
@@ -1,9 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 #define CAMELLIA_6ROUNDS(KEY_BASE, I0, I1) \
 	CAMELLIA_F(KEY_BASE +  0, I1, I0, I1) \
 	CAMELLIA_F(KEY_BASE +  2, I0, I1, I0) \
diff --git a/arch/sparc/crypto/camellia_glue.c b/arch/sparc/crypto/camellia_glue.c
index aaa9714378e6..e7a1e1c42b99 100644
--- a/arch/sparc/crypto/camellia_glue.c
+++ b/arch/sparc/crypto/camellia_glue.c
@@ -15,11 +15,10 @@
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
diff --git a/arch/sparc/crypto/des_asm.S b/arch/sparc/crypto/des_asm.S
index 7157468a679d..d534446cbef9 100644
--- a/arch/sparc/crypto/des_asm.S
+++ b/arch/sparc/crypto/des_asm.S
@@ -1,9 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 	.align	32
 ENTRY(des_sparc64_key_expand)
 	/* %o0=input_key, %o1=output_key */
diff --git a/arch/sparc/crypto/des_glue.c b/arch/sparc/crypto/des_glue.c
index a499102bf706..e50ec4cd57cd 100644
--- a/arch/sparc/crypto/des_glue.c
+++ b/arch/sparc/crypto/des_glue.c
@@ -16,11 +16,10 @@
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
diff --git a/arch/sparc/crypto/md5_asm.S b/arch/sparc/crypto/md5_asm.S
index 7a6637455f37..60b544e4d205 100644
--- a/arch/sparc/crypto/md5_asm.S
+++ b/arch/sparc/crypto/md5_asm.S
@@ -1,9 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 ENTRY(md5_sparc64_transform)
 	/* %o0 = digest, %o1 = data, %o2 = rounds */
 	VISEntryHalf
diff --git a/arch/sparc/crypto/md5_glue.c b/arch/sparc/crypto/md5_glue.c
index 5b018c6a376c..b3615f0cdf62 100644
--- a/arch/sparc/crypto/md5_glue.c
+++ b/arch/sparc/crypto/md5_glue.c
@@ -15,6 +15,7 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <asm/elf.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <crypto/internal/hash.h>
 #include <crypto/md5.h>
@@ -24,8 +25,6 @@
 #include <linux/string.h>
 #include <linux/unaligned.h>
 
-#include "opcodes.h"
-
 struct sparc_md5_state {
 	__le32 hash[MD5_HASH_WORDS];
 	u64 byte_count;
diff --git a/arch/sparc/crypto/sha1_asm.S b/arch/sparc/crypto/sha1_asm.S
index 7d8bf354f0e7..00b46bac1b08 100644
--- a/arch/sparc/crypto/sha1_asm.S
+++ b/arch/sparc/crypto/sha1_asm.S
@@ -1,9 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 ENTRY(sha1_sparc64_transform)
 	/* %o0 = digest, %o1 = data, %o2 = rounds */
 	VISEntryHalf
diff --git a/arch/sparc/crypto/sha1_glue.c b/arch/sparc/crypto/sha1_glue.c
index ec5a06948e0d..ef19d5023b1b 100644
--- a/arch/sparc/crypto/sha1_glue.c
+++ b/arch/sparc/crypto/sha1_glue.c
@@ -12,6 +12,7 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <asm/elf.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha1.h>
@@ -19,8 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "opcodes.h"
-
 asmlinkage void sha1_sparc64_transform(struct sha1_state *digest,
 				       const u8 *data, int rounds);
 
diff --git a/arch/sparc/crypto/sha256_asm.S b/arch/sparc/crypto/sha256_asm.S
index 0b39ec7d7ca2..8ce88611e98a 100644
--- a/arch/sparc/crypto/sha256_asm.S
+++ b/arch/sparc/crypto/sha256_asm.S
@@ -1,9 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 ENTRY(sha256_sparc64_transform)
 	/* %o0 = digest, %o1 = data, %o2 = rounds */
 	VISEntryHalf
diff --git a/arch/sparc/crypto/sha256_glue.c b/arch/sparc/crypto/sha256_glue.c
index ddb250242faf..25008603a986 100644
--- a/arch/sparc/crypto/sha256_glue.c
+++ b/arch/sparc/crypto/sha256_glue.c
@@ -12,6 +12,7 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <asm/elf.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
@@ -19,8 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "opcodes.h"
-
 asmlinkage void sha256_sparc64_transform(u32 *digest, const char *data,
 					 unsigned int rounds);
 
diff --git a/arch/sparc/crypto/sha512_asm.S b/arch/sparc/crypto/sha512_asm.S
index b2f6e6728802..9932b4fe1b59 100644
--- a/arch/sparc/crypto/sha512_asm.S
+++ b/arch/sparc/crypto/sha512_asm.S
@@ -1,9 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
+#include <asm/opcodes.h>
 #include <asm/visasm.h>
 
-#include "opcodes.h"
-
 ENTRY(sha512_sparc64_transform)
 	/* %o0 = digest, %o1 = data, %o2 = rounds */
 	VISEntry
diff --git a/arch/sparc/crypto/sha512_glue.c b/arch/sparc/crypto/sha512_glue.c
index 1d0e1f98ca46..47b9277b6877 100644
--- a/arch/sparc/crypto/sha512_glue.c
+++ b/arch/sparc/crypto/sha512_glue.c
@@ -11,6 +11,7 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <asm/elf.h>
+#include <asm/opcodes.h>
 #include <asm/pstate.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
@@ -18,8 +19,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "opcodes.h"
-
 asmlinkage void sha512_sparc64_transform(u64 *digest, const char *data,
 					 unsigned int rounds);
 
diff --git a/arch/sparc/crypto/opcodes.h b/arch/sparc/include/asm/opcodes.h
similarity index 96%
rename from arch/sparc/crypto/opcodes.h
rename to arch/sparc/include/asm/opcodes.h
index 417b6a10a337..ebfda6eb49b2 100644
--- a/arch/sparc/crypto/opcodes.h
+++ b/arch/sparc/include/asm/opcodes.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _OPCODES_H
-#define _OPCODES_H
+#ifndef _SPARC_ASM_OPCODES_H
+#define _SPARC_ASM_OPCODES_H
 
 #define SPARC_CR_OPCODE_PRIORITY	300
 
@@ -97,4 +97,4 @@
 #define MOVXTOD_G7_F62		\
 	.word	0xbfb02307;
 
-#endif /* _OPCODES_H */
+#endif /* _SPARC_ASM_OPCODES_H */
diff --git a/arch/sparc/lib/crc32c_asm.S b/arch/sparc/lib/crc32c_asm.S
index ee454fa6aed6..4db873850f44 100644
--- a/arch/sparc/lib/crc32c_asm.S
+++ b/arch/sparc/lib/crc32c_asm.S
@@ -1,10 +1,9 @@
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
-- 
2.39.5


