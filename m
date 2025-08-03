Return-Path: <linuxppc-dev+bounces-10543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C0CB1954E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 22:46:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwBXg41Wdz3bpx;
	Mon,  4 Aug 2025 06:45:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754253939;
	cv=none; b=ew1LsDclFdyLcxngF8AxWQ+UV+sIfX0Ym5Luzeg+F4imKbCGCtClYspkcjvRlx1RjJB0eHkoL2bwaJykPz+3fPOd8f/JOgu+wwBIxAzlqJTQz9A9/fPnC6v9R2Svg9+KoHF1VLnPT2lx6HRhYDQ6M82tVQ8qwn/odj+MbofkpFPqVMU51jXl/f1CGYVDNTAvr9uQbRcjOHNEHMK3pBiFvDp7oCdy0dqFZ07tCEQ6MEZQmsMJlbvGMnGjaMGTcYMjH2PpfLYIOsVRN8H98SJBeF2O6S8wAMiV5b7nfW0qX/UMDUk2pL2WbEIFyXtCwaIZhipNhDTS/kjLkrIrSilDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754253939; c=relaxed/relaxed;
	bh=zczdgzC3g5CxDbqWb6DC1az/gdasie2ItOhDgf4g9QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DU9kVsKm0TZ/w1y7+iZmiKe0ldAkroa7pCctHaS8RNqNV+oSy1H1d+BxTqgtYYptFsnfTI9joujaUScWB6vR+ldd0X1eg3JcUn/JXtYOw7Irlhdwh5S8wiwSkZwxH3u/98M4gCQmcz2lRBYkZPQAxvs2I1V/RKT9spFlFyMEEjIV0wQyZW2dYcNMMpeq0aba/a3F8wAha4HXbMyYbQQ0krMuFONYZ3Uk65HBwIt2/hnV8uZn4UCRLGPIt0jnhVdeXBhY64KsXbokXVNBny/KQkJXW5dQe1g47d7q0/Hh0otNFJNL3exZDsZuOGdESYs1k36iRZcxENIcUVl+3wbeQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qc5jCx85; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qc5jCx85;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwBXd3dWWz30WT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 06:45:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DEBB601E8;
	Sun,  3 Aug 2025 20:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3293BC4CEFA;
	Sun,  3 Aug 2025 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253934;
	bh=fiYchuo+RVrtqKxrjd7Ts9LYrhDRRyPxeI/QJOoy2Wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qc5jCx85M84K5w05XqbmmSLpUlvcDdzhsi76Ie1v7XMMuYk1AQeJw5YbHFHeFXrGG
	 f4xxtUWE/4niOZN8pPu1sGTskOJ2JdfhPZsffG8+KJko5RxKuQlr13CtjtV1xB4+wW
	 vAUFR82FPtBfNh9+UiXjvvJSKH83f3ykc2iweGpLkE0mHkU+OIc2wUMhdNRX2TOWl6
	 CXCuSCQCOcQUn75tawLHOo/xQbgjFE5XjbXZHKTpbFqTcuO67MS89QBL3JwBJoP//l
	 tWg4sY2tyj8uLNddvC1oFqWeE7j1DWwDG+emhb5Ygc+UZY54rR96dLdqqJjX7NZNSI
	 uR4VwLHXj7e7g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 6/7] crypto: md5 - Wrap library and add HMAC support
Date: Sun,  3 Aug 2025 13:44:32 -0700
Message-ID: <20250803204433.75703-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803204433.75703-1-ebiggers@kernel.org>
References: <20250803204433.75703-1-ebiggers@kernel.org>
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

Reimplement crypto/md5.c on top of the new MD5 library functions.  Also
add support for HMAC-MD5, again just wrapping the library functions.

This closely mirrors crypto/sha1.c.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Kconfig            |   2 +-
 crypto/md5.c              | 359 ++++++++++++++++++--------------------
 crypto/testmgr.c          |   3 +
 drivers/crypto/img-hash.c |   2 +-
 4 files changed, 171 insertions(+), 195 deletions(-)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 23bd98981ae8e..331c4fbb158b2 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -937,11 +937,11 @@ config CRYPTO_MD4
 
 config CRYPTO_MD5
 	tristate "MD5"
 	select CRYPTO_HASH
 	help
-	  MD5 message digest algorithm (RFC1321)
+	  MD5 message digest algorithm (RFC1321), including HMAC support.
 
 config CRYPTO_MICHAEL_MIC
 	tristate "Michael MIC"
 	select CRYPTO_HASH
 	help
diff --git a/crypto/md5.c b/crypto/md5.c
index 32c0819f51185..d05c53e6f3c2c 100644
--- a/crypto/md5.c
+++ b/crypto/md5.c
@@ -1,224 +1,197 @@
-/* 
- * Cryptographic API.
- *
- * MD5 Message Digest Algorithm (RFC1321).
- *
- * Derived from cryptoapi implementation, originally based on the
- * public domain implementation written by Colin Plumb in 1993.
- *
- * Copyright (c) Cryptoapi developers.
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- * 
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the Free
- * Software Foundation; either version 2 of the License, or (at your option) 
- * any later version.
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Crypto API support for MD5 and HMAC-MD5
  *
+ * Copyright 2025 Google LLC
  */
 #include <crypto/internal/hash.h>
 #include <crypto/md5.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/string.h>
+
+/*
+ * Export and import functions.  crypto_shash wants a particular format that
+ * matches that used by some legacy drivers.  It currently is the same as the
+ * library MD5 context, except the value in bytecount must be block-aligned and
+ * the remainder must be stored in an extra u8 appended to the struct.
+ */
+
+#define MD5_SHASH_STATE_SIZE (sizeof(struct md5_ctx) + 1)
+static_assert(sizeof(struct md5_ctx) == sizeof(struct md5_state));
+static_assert(offsetof(struct md5_ctx, state) == offsetof(struct md5_state, hash));
+static_assert(offsetof(struct md5_ctx, bytecount) == offsetof(struct md5_state, byte_count));
+static_assert(offsetof(struct md5_ctx, buf) == offsetof(struct md5_state, block));
+
+static int __crypto_md5_export(const struct md5_ctx *ctx0, void *out)
+{
+	struct md5_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount % MD5_BLOCK_SIZE;
+	ctx.bytecount -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
+	return 0;
+}
+
+static int __crypto_md5_import(struct md5_ctx *ctx, const void *in)
+{
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount += *p;
+	return 0;
+}
 
 const u8 md5_zero_message_hash[MD5_DIGEST_SIZE] = {
 	0xd4, 0x1d, 0x8c, 0xd9, 0x8f, 0x00, 0xb2, 0x04,
 	0xe9, 0x80, 0x09, 0x98, 0xec, 0xf8, 0x42, 0x7e,
 };
 EXPORT_SYMBOL_GPL(md5_zero_message_hash);
 
-#define F1(x, y, z)	(z ^ (x & (y ^ z)))
-#define F2(x, y, z)	F1(z, x, y)
-#define F3(x, y, z)	(x ^ y ^ z)
-#define F4(x, y, z)	(y ^ (x | ~z))
-
-#define MD5STEP(f, w, x, y, z, in, s) \
-	(w += f(x, y, z) + in, w = (w<<s | w>>(32-s)) + x)
-
-static void md5_transform(__u32 *hash, __u32 const *in)
-{
-	u32 a, b, c, d;
-
-	a = hash[0];
-	b = hash[1];
-	c = hash[2];
-	d = hash[3];
-
-	MD5STEP(F1, a, b, c, d, in[0] + 0xd76aa478, 7);
-	MD5STEP(F1, d, a, b, c, in[1] + 0xe8c7b756, 12);
-	MD5STEP(F1, c, d, a, b, in[2] + 0x242070db, 17);
-	MD5STEP(F1, b, c, d, a, in[3] + 0xc1bdceee, 22);
-	MD5STEP(F1, a, b, c, d, in[4] + 0xf57c0faf, 7);
-	MD5STEP(F1, d, a, b, c, in[5] + 0x4787c62a, 12);
-	MD5STEP(F1, c, d, a, b, in[6] + 0xa8304613, 17);
-	MD5STEP(F1, b, c, d, a, in[7] + 0xfd469501, 22);
-	MD5STEP(F1, a, b, c, d, in[8] + 0x698098d8, 7);
-	MD5STEP(F1, d, a, b, c, in[9] + 0x8b44f7af, 12);
-	MD5STEP(F1, c, d, a, b, in[10] + 0xffff5bb1, 17);
-	MD5STEP(F1, b, c, d, a, in[11] + 0x895cd7be, 22);
-	MD5STEP(F1, a, b, c, d, in[12] + 0x6b901122, 7);
-	MD5STEP(F1, d, a, b, c, in[13] + 0xfd987193, 12);
-	MD5STEP(F1, c, d, a, b, in[14] + 0xa679438e, 17);
-	MD5STEP(F1, b, c, d, a, in[15] + 0x49b40821, 22);
-
-	MD5STEP(F2, a, b, c, d, in[1] + 0xf61e2562, 5);
-	MD5STEP(F2, d, a, b, c, in[6] + 0xc040b340, 9);
-	MD5STEP(F2, c, d, a, b, in[11] + 0x265e5a51, 14);
-	MD5STEP(F2, b, c, d, a, in[0] + 0xe9b6c7aa, 20);
-	MD5STEP(F2, a, b, c, d, in[5] + 0xd62f105d, 5);
-	MD5STEP(F2, d, a, b, c, in[10] + 0x02441453, 9);
-	MD5STEP(F2, c, d, a, b, in[15] + 0xd8a1e681, 14);
-	MD5STEP(F2, b, c, d, a, in[4] + 0xe7d3fbc8, 20);
-	MD5STEP(F2, a, b, c, d, in[9] + 0x21e1cde6, 5);
-	MD5STEP(F2, d, a, b, c, in[14] + 0xc33707d6, 9);
-	MD5STEP(F2, c, d, a, b, in[3] + 0xf4d50d87, 14);
-	MD5STEP(F2, b, c, d, a, in[8] + 0x455a14ed, 20);
-	MD5STEP(F2, a, b, c, d, in[13] + 0xa9e3e905, 5);
-	MD5STEP(F2, d, a, b, c, in[2] + 0xfcefa3f8, 9);
-	MD5STEP(F2, c, d, a, b, in[7] + 0x676f02d9, 14);
-	MD5STEP(F2, b, c, d, a, in[12] + 0x8d2a4c8a, 20);
-
-	MD5STEP(F3, a, b, c, d, in[5] + 0xfffa3942, 4);
-	MD5STEP(F3, d, a, b, c, in[8] + 0x8771f681, 11);
-	MD5STEP(F3, c, d, a, b, in[11] + 0x6d9d6122, 16);
-	MD5STEP(F3, b, c, d, a, in[14] + 0xfde5380c, 23);
-	MD5STEP(F3, a, b, c, d, in[1] + 0xa4beea44, 4);
-	MD5STEP(F3, d, a, b, c, in[4] + 0x4bdecfa9, 11);
-	MD5STEP(F3, c, d, a, b, in[7] + 0xf6bb4b60, 16);
-	MD5STEP(F3, b, c, d, a, in[10] + 0xbebfbc70, 23);
-	MD5STEP(F3, a, b, c, d, in[13] + 0x289b7ec6, 4);
-	MD5STEP(F3, d, a, b, c, in[0] + 0xeaa127fa, 11);
-	MD5STEP(F3, c, d, a, b, in[3] + 0xd4ef3085, 16);
-	MD5STEP(F3, b, c, d, a, in[6] + 0x04881d05, 23);
-	MD5STEP(F3, a, b, c, d, in[9] + 0xd9d4d039, 4);
-	MD5STEP(F3, d, a, b, c, in[12] + 0xe6db99e5, 11);
-	MD5STEP(F3, c, d, a, b, in[15] + 0x1fa27cf8, 16);
-	MD5STEP(F3, b, c, d, a, in[2] + 0xc4ac5665, 23);
-
-	MD5STEP(F4, a, b, c, d, in[0] + 0xf4292244, 6);
-	MD5STEP(F4, d, a, b, c, in[7] + 0x432aff97, 10);
-	MD5STEP(F4, c, d, a, b, in[14] + 0xab9423a7, 15);
-	MD5STEP(F4, b, c, d, a, in[5] + 0xfc93a039, 21);
-	MD5STEP(F4, a, b, c, d, in[12] + 0x655b59c3, 6);
-	MD5STEP(F4, d, a, b, c, in[3] + 0x8f0ccc92, 10);
-	MD5STEP(F4, c, d, a, b, in[10] + 0xffeff47d, 15);
-	MD5STEP(F4, b, c, d, a, in[1] + 0x85845dd1, 21);
-	MD5STEP(F4, a, b, c, d, in[8] + 0x6fa87e4f, 6);
-	MD5STEP(F4, d, a, b, c, in[15] + 0xfe2ce6e0, 10);
-	MD5STEP(F4, c, d, a, b, in[6] + 0xa3014314, 15);
-	MD5STEP(F4, b, c, d, a, in[13] + 0x4e0811a1, 21);
-	MD5STEP(F4, a, b, c, d, in[4] + 0xf7537e82, 6);
-	MD5STEP(F4, d, a, b, c, in[11] + 0xbd3af235, 10);
-	MD5STEP(F4, c, d, a, b, in[2] + 0x2ad7d2bb, 15);
-	MD5STEP(F4, b, c, d, a, in[9] + 0xeb86d391, 21);
-
-	hash[0] += a;
-	hash[1] += b;
-	hash[2] += c;
-	hash[3] += d;
-}
-
-static inline void md5_transform_helper(struct md5_state *ctx,
-					u32 block[MD5_BLOCK_WORDS])
-{
-	le32_to_cpu_array(block, MD5_BLOCK_WORDS);
-	md5_transform(ctx->hash, block);
-}
-
-static int md5_init(struct shash_desc *desc)
-{
-	struct md5_state *mctx = shash_desc_ctx(desc);
-
-	mctx->hash[0] = MD5_H0;
-	mctx->hash[1] = MD5_H1;
-	mctx->hash[2] = MD5_H2;
-	mctx->hash[3] = MD5_H3;
-	mctx->byte_count = 0;
+#define MD5_CTX(desc) ((struct md5_ctx *)shash_desc_ctx(desc))
 
+static int crypto_md5_init(struct shash_desc *desc)
+{
+	md5_init(MD5_CTX(desc));
 	return 0;
 }
 
-static int md5_update(struct shash_desc *desc, const u8 *data, unsigned int len)
-{
-	struct md5_state *mctx = shash_desc_ctx(desc);
-	u32 block[MD5_BLOCK_WORDS];
-
-	mctx->byte_count += len;
-	do {
-		memcpy(block, data, sizeof(block));
-		md5_transform_helper(mctx, block);
-		data += sizeof(block);
-		len -= sizeof(block);
-	} while (len >= sizeof(block));
-	memzero_explicit(block, sizeof(block));
-	mctx->byte_count -= len;
-	return len;
-}
-
-static int md5_finup(struct shash_desc *desc, const u8 *data, unsigned int len,
-		     u8 *out)
-{
-	struct md5_state *mctx = shash_desc_ctx(desc);
-	u32 block[MD5_BLOCK_WORDS];
-	unsigned int offset;
-	int padding;
-	char *p;
-
-	memcpy(block, data, len);
-
-	offset = len;
-	p = (char *)block + offset;
-	padding = 56 - (offset + 1);
-
-	*p++ = 0x80;
-	if (padding < 0) {
-		memset(p, 0x00, padding + sizeof (u64));
-		md5_transform_helper(mctx, block);
-		p = (char *)block;
-		padding = 56;
-	}
-
-	memset(p, 0, padding);
-	mctx->byte_count += len;
-	block[14] = mctx->byte_count << 3;
-	block[15] = mctx->byte_count >> 29;
-	le32_to_cpu_array(block, (sizeof(block) - sizeof(u64)) / sizeof(u32));
-	md5_transform(mctx->hash, block);
-	memzero_explicit(block, sizeof(block));
-	cpu_to_le32_array(mctx->hash, sizeof(mctx->hash) / sizeof(u32));
-	memcpy(out, mctx->hash, sizeof(mctx->hash));
+static int crypto_md5_update(struct shash_desc *desc,
+			     const u8 *data, unsigned int len)
+{
+	md5_update(MD5_CTX(desc), data, len);
+	return 0;
+}
 
+static int crypto_md5_final(struct shash_desc *desc, u8 *out)
+{
+	md5_final(MD5_CTX(desc), out);
 	return 0;
 }
 
-static struct shash_alg alg = {
-	.digestsize	=	MD5_DIGEST_SIZE,
-	.init		=	md5_init,
-	.update		=	md5_update,
-	.finup		=	md5_finup,
-	.descsize	=	MD5_STATE_SIZE,
-	.base		=	{
-		.cra_name	 =	"md5",
-		.cra_driver_name =	"md5-generic",
-		.cra_flags	 =	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	 =	MD5_HMAC_BLOCK_SIZE,
-		.cra_module	 =	THIS_MODULE,
-	}
-};
+static int crypto_md5_digest(struct shash_desc *desc,
+			     const u8 *data, unsigned int len, u8 *out)
+{
+	md5(data, len, out);
+	return 0;
+}
+
+static int crypto_md5_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_md5_export(MD5_CTX(desc), out);
+}
+
+static int crypto_md5_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_md5_import(MD5_CTX(desc), in);
+}
 
-static int __init md5_mod_init(void)
+#define HMAC_MD5_KEY(tfm) ((struct hmac_md5_key *)crypto_shash_ctx(tfm))
+#define HMAC_MD5_CTX(desc) ((struct hmac_md5_ctx *)shash_desc_ctx(desc))
+
+static int crypto_hmac_md5_setkey(struct crypto_shash *tfm,
+				  const u8 *raw_key, unsigned int keylen)
+{
+	hmac_md5_preparekey(HMAC_MD5_KEY(tfm), raw_key, keylen);
+	return 0;
+}
+
+static int crypto_hmac_md5_init(struct shash_desc *desc)
+{
+	hmac_md5_init(HMAC_MD5_CTX(desc), HMAC_MD5_KEY(desc->tfm));
+	return 0;
+}
+
+static int crypto_hmac_md5_update(struct shash_desc *desc,
+				  const u8 *data, unsigned int len)
+{
+	hmac_md5_update(HMAC_MD5_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_hmac_md5_final(struct shash_desc *desc, u8 *out)
+{
+	hmac_md5_final(HMAC_MD5_CTX(desc), out);
+	return 0;
+}
+
+static int crypto_hmac_md5_digest(struct shash_desc *desc,
+				  const u8 *data, unsigned int len, u8 *out)
+{
+	hmac_md5(HMAC_MD5_KEY(desc->tfm), data, len, out);
+	return 0;
+}
+
+static int crypto_hmac_md5_export(struct shash_desc *desc, void *out)
 {
-	return crypto_register_shash(&alg);
+	return __crypto_md5_export(&HMAC_MD5_CTX(desc)->hash_ctx, out);
 }
 
-static void __exit md5_mod_fini(void)
+static int crypto_hmac_md5_import(struct shash_desc *desc, const void *in)
 {
-	crypto_unregister_shash(&alg);
+	struct hmac_md5_ctx *ctx = HMAC_MD5_CTX(desc);
+
+	ctx->ostate = HMAC_MD5_KEY(desc->tfm)->ostate;
+	return __crypto_md5_import(&ctx->hash_ctx, in);
 }
 
-module_init(md5_mod_init);
-module_exit(md5_mod_fini);
+static struct shash_alg algs[] = {
+	{
+		.base.cra_name		= "md5",
+		.base.cra_driver_name	= "md5-lib",
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= MD5_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= MD5_DIGEST_SIZE,
+		.init			= crypto_md5_init,
+		.update			= crypto_md5_update,
+		.final			= crypto_md5_final,
+		.digest			= crypto_md5_digest,
+		.export			= crypto_md5_export,
+		.import			= crypto_md5_import,
+		.descsize		= sizeof(struct md5_ctx),
+		.statesize		= MD5_SHASH_STATE_SIZE,
+	},
+	{
+		.base.cra_name		= "hmac(md5)",
+		.base.cra_driver_name	= "hmac-md5-lib",
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= MD5_BLOCK_SIZE,
+		.base.cra_ctxsize	= sizeof(struct hmac_md5_key),
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= MD5_DIGEST_SIZE,
+		.setkey			= crypto_hmac_md5_setkey,
+		.init			= crypto_hmac_md5_init,
+		.update			= crypto_hmac_md5_update,
+		.final			= crypto_hmac_md5_final,
+		.digest			= crypto_hmac_md5_digest,
+		.export			= crypto_hmac_md5_export,
+		.import			= crypto_hmac_md5_import,
+		.descsize		= sizeof(struct hmac_md5_ctx),
+		.statesize		= MD5_SHASH_STATE_SIZE,
+	},
+};
+
+static int __init crypto_md5_mod_init(void)
+{
+	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
+}
+module_init(crypto_md5_mod_init);
+
+static void __exit crypto_md5_mod_exit(void)
+{
+	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
+}
+module_exit(crypto_md5_mod_exit);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MD5 Message Digest Algorithm");
+MODULE_DESCRIPTION("Crypto API support for MD5 and HMAC-MD5");
+
 MODULE_ALIAS_CRYPTO("md5");
+MODULE_ALIAS_CRYPTO("md5-lib");
+MODULE_ALIAS_CRYPTO("hmac(md5)");
+MODULE_ALIAS_CRYPTO("hmac-md5-lib");
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index ee33ba21ae2bc..beab926ba102e 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4176,10 +4176,11 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.cprng = __VECS(ansi_cprng_aes_tv_template)
 		}
 	}, {
 		.alg = "authenc(hmac(md5),ecb(cipher_null))",
+		.generic_driver = "authenc(hmac-md5-lib,ecb-cipher_null)",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_md5_ecb_cipher_null_tv_template)
 		}
 	}, {
@@ -5062,10 +5063,11 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.cipher = __VECS(aes_hctr2_tv_template)
 		}
 	}, {
 		.alg = "hmac(md5)",
+		.generic_driver = "hmac-md5-lib",
 		.test = alg_test_hash,
 		.suite = {
 			.hash = __VECS(hmac_md5_tv_template)
 		}
 	}, {
@@ -5248,10 +5250,11 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(md4_tv_template)
 		}
 	}, {
 		.alg = "md5",
+		.generic_driver = "md5-lib",
 		.test = alg_test_hash,
 		.suite = {
 			.hash = __VECS(md5_tv_template)
 		}
 	}, {
diff --git a/drivers/crypto/img-hash.c b/drivers/crypto/img-hash.c
index 76b7ecb5624b1..f22c12e36b56c 100644
--- a/drivers/crypto/img-hash.c
+++ b/drivers/crypto/img-hash.c
@@ -698,11 +698,11 @@ static int img_hash_cra_init(struct crypto_tfm *tfm, const char *alg_name)
 	return 0;
 }
 
 static int img_hash_cra_md5_init(struct crypto_tfm *tfm)
 {
-	return img_hash_cra_init(tfm, "md5-generic");
+	return img_hash_cra_init(tfm, "md5-lib");
 }
 
 static int img_hash_cra_sha1_init(struct crypto_tfm *tfm)
 {
 	return img_hash_cra_init(tfm, "sha1-lib");
-- 
2.50.1


