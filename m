Return-Path: <linuxppc-dev+bounces-10541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2588B19547
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 22:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwBXf4Tlnz2yQH;
	Mon,  4 Aug 2025 06:45:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754253938;
	cv=none; b=JSCEcnC2ie9GyiwWOMVE0VDPpUyp2dYLqOH6DRbVt8NXOYqzcXVD2vWciqgujgJw405zT17uITYYQ+V2RKJxYng4oddrMkw4vPlgk7mdT2rzQznhiIigQ/57WEn984y9T1jSD8xvas7ra40Px/uPxtkj2xmLlcoYlTFyCw85BB9m2s8s8JpYiOxcjrqSRhEk7wzSra26lexl/uDivZIJQa1adU6e7DiF4CLtvQl7CLk85fWe8sTCkEQ6dhrtSK0lzdYez6Ih20+1DGMBeHslxcqCCX9k2PDKJ2r/QQg1Mm1pt4q+eXMtsgMfQmF8hrwv4eCltbIHhgutgLjT+9UWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754253938; c=relaxed/relaxed;
	bh=eMfGkrtxctQbmNULGkSpLbKbc4e5LgCl7j7yHq01dz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fs7wsfSEnIt/8NB5avO0s0mtU8kb6sE5/vU9WfDSCHk8rNMlNZRORd7zKu0ztSUX85xR2nEFqZVKD4lakf/O1YIE9xwKc7KMVjj6M2Gb70pxzlVyraIx9f+bcNsdpVZqBC+ZlvhTYeaYD7dyYBgzcN5wvgkbAUhZEIfx7uSTrbUPd6SnIL6EVPSCdCXQK7T0IqLLJFGETk8Ag/g8MjSYNRoQMQiRjYyB0BB6/aZNektY74CtbgFolaW1B2ihQcDfhFCfshPVPmSbicSPWPguuC3FsHzKOvr2adWdIzCFDAmuq9HluLF9ZMAfgQgVJhARwkGW7vXdtUWSYFEiJ8Bg0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NOK0sEaw; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NOK0sEaw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwBXc2frPz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 06:45:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 506255C5B51;
	Sun,  3 Aug 2025 20:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E507C4CEF9;
	Sun,  3 Aug 2025 20:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253934;
	bh=ZKqjBGMT1lPpSPEhosXQ6UaXTwS5COxO+pglv8pCRY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NOK0sEawntaqjNTr10YqcDWlLtWQjR0JYjE2TEA+vuLZwWUer7HGG3wQacp3kNZhJ
	 iIQHx41eboAVWCAuE5p0D4FS9Y0wXogk1psDWboM33Ct8s1Al5eyxrYdaCXVZVSn1K
	 NYc2CJDYxp9QtI+VIH4JH1zZLD2wU/UQxpP7hIdIZ7zwsGy/2zJlqiivmbnjevKjbT
	 fTpLxXSp5YhMV4zVqrgSqYK36l4Bf51KrRM+dpC0jq4kw0ig5o6WAhS3rBvKSY0kb+
	 nxaSCzmiEZZfMztQbYRXKKXNiTdALn3yM2UtXCm53K+2RI6VwSKn3iEcd53D+35wFL
	 dcRLBgjudZ65g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 5/7] lib/crypto: md5: Add MD5 and HMAC-MD5 library functions
Date: Sun,  3 Aug 2025 13:44:31 -0700
Message-ID: <20250803204433.75703-6-ebiggers@kernel.org>
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

Add library functions for MD5, including HMAC support.  The MD5
implementation is derived from crypto/md5.c.  This closely mirrors the
corresponding SHA-1 and SHA-2 changes; however, support for architecture
optimized MD5 implementations isn't included since it is unnecessary.

While MD5 is an insecure legacy algorithm, it still has various
in-kernel users that implement legacy protocols.  Switching to a simple
library API, which is the way the code should have been organized
originally, will greatly simplify their code.  For example:

    MD5:
        drivers/md/dm-crypt.c (for lmk IV generation)
        fs/nfsd/nfs4recover.c
        fs/ecryptfs/
        fs/smb/client/
        net/{ipv4,ipv6}/ (for TCP-MD5 signatures)

    HMAC-MD5:
        fs/smb/client/
        fs/smb/server/

(Also net/sctp/ if it continues using HMAC-MD5 for cookie generation.
However, that use case has the flexibility to upgrade to a more modern
algorithm, which I'll be proposing instead.)

As usual, the "md5" and "hmac(md5)" crypto_shash algorithms will also be
reimplemented on top of these library functions.  For "hmac(md5)" this
will provide a faster, more streamlined implementation.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/md5.h | 181 ++++++++++++++++++++++++++-
 lib/crypto/Kconfig   |   6 +
 lib/crypto/Makefile  |   3 +
 lib/crypto/md5.c     | 290 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 479 insertions(+), 1 deletion(-)
 create mode 100644 lib/crypto/md5.c

diff --git a/include/crypto/md5.h b/include/crypto/md5.h
index 28ee533a0507a..d8e4d3c7c0369 100644
--- a/include/crypto/md5.h
+++ b/include/crypto/md5.h
@@ -5,10 +5,11 @@
 #include <crypto/hash.h>
 #include <linux/types.h>
 
 #define MD5_DIGEST_SIZE		16
 #define MD5_HMAC_BLOCK_SIZE	64
+#define MD5_BLOCK_SIZE		64
 #define MD5_BLOCK_WORDS		16
 #define MD5_HASH_WORDS		4
 #define MD5_STATE_SIZE		24
 
 #define MD5_H0	0x67452301UL
@@ -25,6 +26,184 @@ struct md5_state {
 	u32 hash[MD5_HASH_WORDS];
 	u64 byte_count;
 	u32 block[MD5_BLOCK_WORDS];
 };
 
-#endif
+/* State for the MD5 compression function */
+struct md5_block_state {
+	u32 h[MD5_HASH_WORDS];
+};
+
+/**
+ * struct md5_ctx - Context for hashing a message with MD5
+ * @state: the compression function state
+ * @bytecount: number of bytes processed so far
+ * @buf: partial block buffer; bytecount % MD5_BLOCK_SIZE bytes are valid
+ */
+struct md5_ctx {
+	struct md5_block_state state;
+	u64 bytecount;
+	u8 buf[MD5_BLOCK_SIZE] __aligned(__alignof__(__le64));
+};
+
+/**
+ * md5_init() - Initialize an MD5 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider md5() instead.
+ *
+ * Context: Any context.
+ */
+void md5_init(struct md5_ctx *ctx);
+
+/**
+ * md5_update() - Update an MD5 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+void md5_update(struct md5_ctx *ctx, const u8 *data, size_t len);
+
+/**
+ * md5_final() - Finish computing an MD5 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting MD5 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void md5_final(struct md5_ctx *ctx, u8 out[MD5_DIGEST_SIZE]);
+
+/**
+ * md5() - Compute MD5 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting MD5 message digest
+ *
+ * Context: Any context.
+ */
+void md5(const u8 *data, size_t len, u8 out[MD5_DIGEST_SIZE]);
+
+/**
+ * struct hmac_md5_key - Prepared key for HMAC-MD5
+ * @istate: private
+ * @ostate: private
+ */
+struct hmac_md5_key {
+	struct md5_block_state istate;
+	struct md5_block_state ostate;
+};
+
+/**
+ * struct hmac_md5_ctx - Context for computing HMAC-MD5 of a message
+ * @hash_ctx: private
+ * @ostate: private
+ */
+struct hmac_md5_ctx {
+	struct md5_ctx hash_ctx;
+	struct md5_block_state ostate;
+};
+
+/**
+ * hmac_md5_preparekey() - Prepare a key for HMAC-MD5
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-MD5 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_md5_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_md5_preparekey(struct hmac_md5_key *key,
+			 const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_md5_init() - Initialize an HMAC-MD5 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_md5() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_md5_init(struct hmac_md5_ctx *ctx, const struct hmac_md5_key *key);
+
+/**
+ * hmac_md5_init_usingrawkey() - Initialize an HMAC-MD5 context for a new
+ *				  message, using a raw key
+ * @ctx: (output) the HMAC context to initialize
+ * @raw_key: the raw HMAC-MD5 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * If you don't need incremental computation, consider hmac_md5_usingrawkey()
+ * instead.
+ *
+ * Context: Any context.
+ */
+void hmac_md5_init_usingrawkey(struct hmac_md5_ctx *ctx,
+			       const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_md5_update() - Update an HMAC-MD5 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_md5_update(struct hmac_md5_ctx *ctx,
+				   const u8 *data, size_t data_len)
+{
+	md5_update(&ctx->hash_ctx, data, data_len);
+}
+
+/**
+ * hmac_md5_final() - Finish computing an HMAC-MD5 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-MD5 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_md5_final(struct hmac_md5_ctx *ctx, u8 out[MD5_DIGEST_SIZE]);
+
+/**
+ * hmac_md5() - Compute HMAC-MD5 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-MD5 value
+ *
+ * If you're using the key only once, consider using hmac_md5_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_md5(const struct hmac_md5_key *key, const u8 *data, size_t data_len,
+	      u8 out[MD5_DIGEST_SIZE]);
+
+/**
+ * hmac_md5_usingrawkey() - Compute HMAC-MD5 in one shot, using a raw key
+ * @raw_key: the raw HMAC-MD5 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-MD5 value
+ *
+ * If you're using the key multiple times, prefer to use hmac_md5_preparekey()
+ * followed by multiple calls to hmac_md5() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_md5_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			  const u8 *data, size_t data_len,
+			  u8 out[MD5_DIGEST_SIZE]);
+
+#endif /* _CRYPTO_MD5_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index c2b65b6a9bb6f..f1b2a51450df2 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -99,10 +99,16 @@ config CRYPTO_LIB_CURVE25519
 	  one, if one is available and enabled.
 
 config CRYPTO_LIB_DES
 	tristate
 
+config CRYPTO_LIB_MD5
+	tristate
+	help
+	  The MD5 and HMAC-MD5 library functions.  Select this if your module
+	  uses any of the functions from <crypto/md5.h>.
+
 config CRYPTO_LIB_POLY1305_RSIZE
 	int
 	default 2 if MIPS
 	default 11 if X86_64
 	default 9 if ARM || ARM64
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index e4151be2ebd44..252480ab97e9c 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -57,10 +57,13 @@ libcurve25519-y					+= curve25519.o
 libcurve25519-$(CONFIG_CRYPTO_SELFTESTS)	+= curve25519-selftest.o
 
 obj-$(CONFIG_CRYPTO_LIB_DES)			+= libdes.o
 libdes-y					:= des.o
 
+obj-$(CONFIG_CRYPTO_LIB_MD5)			+= libmd5.o
+libmd5-y					:= md5.o
+
 obj-$(CONFIG_CRYPTO_LIB_POLY1305)		+= libpoly1305.o
 libpoly1305-y					+= poly1305.o
 
 obj-$(CONFIG_CRYPTO_LIB_POLY1305_GENERIC)	+= libpoly1305-generic.o
 libpoly1305-generic-y				:= poly1305-donna32.o
diff --git a/lib/crypto/md5.c b/lib/crypto/md5.c
new file mode 100644
index 0000000000000..17323340963b5
--- /dev/null
+++ b/lib/crypto/md5.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * MD5 and HMAC-MD5 library functions
+ *
+ * md5_transform() is derived from cryptoapi implementation, originally based on
+ * the public domain implementation written by Colin Plumb in 1993.
+ *
+ * Copyright (c) Cryptoapi developers.
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ * Copyright 2025 Google LLC
+ */
+
+#include <crypto/hmac.h>
+#include <crypto/md5.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+#include <linux/wordpart.h>
+
+static const struct md5_block_state md5_iv = {
+	.h = { MD5_H0, MD5_H1, MD5_H2, MD5_H3 },
+};
+
+#define F1(x, y, z) (z ^ (x & (y ^ z)))
+#define F2(x, y, z) F1(z, x, y)
+#define F3(x, y, z) (x ^ y ^ z)
+#define F4(x, y, z) (y ^ (x | ~z))
+
+#define MD5STEP(f, w, x, y, z, in, s) \
+	(w += f(x, y, z) + in, w = (w << s | w >> (32 - s)) + x)
+
+static void md5_transform(struct md5_block_state *state,
+			  const u8 data[MD5_BLOCK_SIZE])
+{
+	u32 in[MD5_BLOCK_WORDS];
+	u32 a, b, c, d;
+
+	memcpy(in, data, MD5_BLOCK_SIZE);
+	le32_to_cpu_array(in, ARRAY_SIZE(in));
+
+	a = state->h[0];
+	b = state->h[1];
+	c = state->h[2];
+	d = state->h[3];
+
+	MD5STEP(F1, a, b, c, d, in[0] + 0xd76aa478, 7);
+	MD5STEP(F1, d, a, b, c, in[1] + 0xe8c7b756, 12);
+	MD5STEP(F1, c, d, a, b, in[2] + 0x242070db, 17);
+	MD5STEP(F1, b, c, d, a, in[3] + 0xc1bdceee, 22);
+	MD5STEP(F1, a, b, c, d, in[4] + 0xf57c0faf, 7);
+	MD5STEP(F1, d, a, b, c, in[5] + 0x4787c62a, 12);
+	MD5STEP(F1, c, d, a, b, in[6] + 0xa8304613, 17);
+	MD5STEP(F1, b, c, d, a, in[7] + 0xfd469501, 22);
+	MD5STEP(F1, a, b, c, d, in[8] + 0x698098d8, 7);
+	MD5STEP(F1, d, a, b, c, in[9] + 0x8b44f7af, 12);
+	MD5STEP(F1, c, d, a, b, in[10] + 0xffff5bb1, 17);
+	MD5STEP(F1, b, c, d, a, in[11] + 0x895cd7be, 22);
+	MD5STEP(F1, a, b, c, d, in[12] + 0x6b901122, 7);
+	MD5STEP(F1, d, a, b, c, in[13] + 0xfd987193, 12);
+	MD5STEP(F1, c, d, a, b, in[14] + 0xa679438e, 17);
+	MD5STEP(F1, b, c, d, a, in[15] + 0x49b40821, 22);
+
+	MD5STEP(F2, a, b, c, d, in[1] + 0xf61e2562, 5);
+	MD5STEP(F2, d, a, b, c, in[6] + 0xc040b340, 9);
+	MD5STEP(F2, c, d, a, b, in[11] + 0x265e5a51, 14);
+	MD5STEP(F2, b, c, d, a, in[0] + 0xe9b6c7aa, 20);
+	MD5STEP(F2, a, b, c, d, in[5] + 0xd62f105d, 5);
+	MD5STEP(F2, d, a, b, c, in[10] + 0x02441453, 9);
+	MD5STEP(F2, c, d, a, b, in[15] + 0xd8a1e681, 14);
+	MD5STEP(F2, b, c, d, a, in[4] + 0xe7d3fbc8, 20);
+	MD5STEP(F2, a, b, c, d, in[9] + 0x21e1cde6, 5);
+	MD5STEP(F2, d, a, b, c, in[14] + 0xc33707d6, 9);
+	MD5STEP(F2, c, d, a, b, in[3] + 0xf4d50d87, 14);
+	MD5STEP(F2, b, c, d, a, in[8] + 0x455a14ed, 20);
+	MD5STEP(F2, a, b, c, d, in[13] + 0xa9e3e905, 5);
+	MD5STEP(F2, d, a, b, c, in[2] + 0xfcefa3f8, 9);
+	MD5STEP(F2, c, d, a, b, in[7] + 0x676f02d9, 14);
+	MD5STEP(F2, b, c, d, a, in[12] + 0x8d2a4c8a, 20);
+
+	MD5STEP(F3, a, b, c, d, in[5] + 0xfffa3942, 4);
+	MD5STEP(F3, d, a, b, c, in[8] + 0x8771f681, 11);
+	MD5STEP(F3, c, d, a, b, in[11] + 0x6d9d6122, 16);
+	MD5STEP(F3, b, c, d, a, in[14] + 0xfde5380c, 23);
+	MD5STEP(F3, a, b, c, d, in[1] + 0xa4beea44, 4);
+	MD5STEP(F3, d, a, b, c, in[4] + 0x4bdecfa9, 11);
+	MD5STEP(F3, c, d, a, b, in[7] + 0xf6bb4b60, 16);
+	MD5STEP(F3, b, c, d, a, in[10] + 0xbebfbc70, 23);
+	MD5STEP(F3, a, b, c, d, in[13] + 0x289b7ec6, 4);
+	MD5STEP(F3, d, a, b, c, in[0] + 0xeaa127fa, 11);
+	MD5STEP(F3, c, d, a, b, in[3] + 0xd4ef3085, 16);
+	MD5STEP(F3, b, c, d, a, in[6] + 0x04881d05, 23);
+	MD5STEP(F3, a, b, c, d, in[9] + 0xd9d4d039, 4);
+	MD5STEP(F3, d, a, b, c, in[12] + 0xe6db99e5, 11);
+	MD5STEP(F3, c, d, a, b, in[15] + 0x1fa27cf8, 16);
+	MD5STEP(F3, b, c, d, a, in[2] + 0xc4ac5665, 23);
+
+	MD5STEP(F4, a, b, c, d, in[0] + 0xf4292244, 6);
+	MD5STEP(F4, d, a, b, c, in[7] + 0x432aff97, 10);
+	MD5STEP(F4, c, d, a, b, in[14] + 0xab9423a7, 15);
+	MD5STEP(F4, b, c, d, a, in[5] + 0xfc93a039, 21);
+	MD5STEP(F4, a, b, c, d, in[12] + 0x655b59c3, 6);
+	MD5STEP(F4, d, a, b, c, in[3] + 0x8f0ccc92, 10);
+	MD5STEP(F4, c, d, a, b, in[10] + 0xffeff47d, 15);
+	MD5STEP(F4, b, c, d, a, in[1] + 0x85845dd1, 21);
+	MD5STEP(F4, a, b, c, d, in[8] + 0x6fa87e4f, 6);
+	MD5STEP(F4, d, a, b, c, in[15] + 0xfe2ce6e0, 10);
+	MD5STEP(F4, c, d, a, b, in[6] + 0xa3014314, 15);
+	MD5STEP(F4, b, c, d, a, in[13] + 0x4e0811a1, 21);
+	MD5STEP(F4, a, b, c, d, in[4] + 0xf7537e82, 6);
+	MD5STEP(F4, d, a, b, c, in[11] + 0xbd3af235, 10);
+	MD5STEP(F4, c, d, a, b, in[2] + 0x2ad7d2bb, 15);
+	MD5STEP(F4, b, c, d, a, in[9] + 0xeb86d391, 21);
+
+	state->h[0] += a;
+	state->h[1] += b;
+	state->h[2] += c;
+	state->h[3] += d;
+}
+
+void md5_init(struct md5_ctx *ctx)
+{
+	ctx->state = md5_iv;
+	ctx->bytecount = 0;
+}
+EXPORT_SYMBOL_GPL(md5_init);
+
+void md5_update(struct md5_ctx *ctx, const u8 *data, size_t len)
+{
+	size_t partial = ctx->bytecount % MD5_BLOCK_SIZE;
+
+	ctx->bytecount += len;
+
+	if (partial + len >= MD5_BLOCK_SIZE) {
+
+		if (partial) {
+			size_t l = MD5_BLOCK_SIZE - partial;
+
+			memcpy(&ctx->buf[partial], data, l);
+			data += l;
+			len -= l;
+
+			md5_transform(&ctx->state, ctx->buf);
+		}
+
+		while (len >= MD5_BLOCK_SIZE) {
+			md5_transform(&ctx->state, data);
+			data += MD5_BLOCK_SIZE;
+			len -= MD5_BLOCK_SIZE;
+		}
+		partial = 0;
+	}
+	if (len)
+		memcpy(&ctx->buf[partial], data, len);
+}
+EXPORT_SYMBOL_GPL(md5_update);
+
+static void __md5_final(struct md5_ctx *ctx, u8 out[MD5_DIGEST_SIZE])
+{
+	u64 bitcount = ctx->bytecount << 3;
+	size_t partial = ctx->bytecount % MD5_BLOCK_SIZE;
+
+	ctx->buf[partial++] = 0x80;
+	if (partial > MD5_BLOCK_SIZE - 8) {
+		memset(&ctx->buf[partial], 0, MD5_BLOCK_SIZE - partial);
+		md5_transform(&ctx->state, ctx->buf);
+		partial = 0;
+	}
+	memset(&ctx->buf[partial], 0, MD5_BLOCK_SIZE - 8 - partial);
+	*(__le64 *)&ctx->buf[MD5_BLOCK_SIZE - 8] = cpu_to_le64(bitcount);
+	md5_transform(&ctx->state, ctx->buf);
+
+	cpu_to_le32_array(ctx->state.h, ARRAY_SIZE(ctx->state.h));
+	memcpy(out, ctx->state.h, MD5_DIGEST_SIZE);
+}
+
+void md5_final(struct md5_ctx *ctx, u8 out[MD5_DIGEST_SIZE])
+{
+	__md5_final(ctx, out);
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+EXPORT_SYMBOL_GPL(md5_final);
+
+void md5(const u8 *data, size_t len, u8 out[MD5_DIGEST_SIZE])
+{
+	struct md5_ctx ctx;
+
+	md5_init(&ctx);
+	md5_update(&ctx, data, len);
+	md5_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(md5);
+
+static void __hmac_md5_preparekey(struct md5_block_state *istate,
+				  struct md5_block_state *ostate,
+				  const u8 *raw_key, size_t raw_key_len)
+{
+	union {
+		u8 b[MD5_BLOCK_SIZE];
+		unsigned long w[MD5_BLOCK_SIZE / sizeof(unsigned long)];
+	} derived_key = { 0 };
+
+	if (unlikely(raw_key_len > MD5_BLOCK_SIZE))
+		md5(raw_key, raw_key_len, derived_key.b);
+	else
+		memcpy(derived_key.b, raw_key, raw_key_len);
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
+	*istate = md5_iv;
+	md5_transform(istate, derived_key.b);
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
+						HMAC_IPAD_VALUE);
+	*ostate = md5_iv;
+	md5_transform(ostate, derived_key.b);
+
+	memzero_explicit(&derived_key, sizeof(derived_key));
+}
+
+void hmac_md5_preparekey(struct hmac_md5_key *key,
+			 const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_md5_preparekey(&key->istate, &key->ostate, raw_key, raw_key_len);
+}
+EXPORT_SYMBOL_GPL(hmac_md5_preparekey);
+
+void hmac_md5_init(struct hmac_md5_ctx *ctx, const struct hmac_md5_key *key)
+{
+	ctx->hash_ctx.state = key->istate;
+	ctx->hash_ctx.bytecount = MD5_BLOCK_SIZE;
+	ctx->ostate = key->ostate;
+}
+EXPORT_SYMBOL_GPL(hmac_md5_init);
+
+void hmac_md5_init_usingrawkey(struct hmac_md5_ctx *ctx,
+			       const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_md5_preparekey(&ctx->hash_ctx.state, &ctx->ostate,
+			      raw_key, raw_key_len);
+	ctx->hash_ctx.bytecount = MD5_BLOCK_SIZE;
+}
+EXPORT_SYMBOL_GPL(hmac_md5_init_usingrawkey);
+
+void hmac_md5_final(struct hmac_md5_ctx *ctx, u8 out[MD5_DIGEST_SIZE])
+{
+	/* Generate the padded input for the outer hash in ctx->hash_ctx.buf. */
+	__md5_final(&ctx->hash_ctx, ctx->hash_ctx.buf);
+	memset(&ctx->hash_ctx.buf[MD5_DIGEST_SIZE], 0,
+	       MD5_BLOCK_SIZE - MD5_DIGEST_SIZE);
+	ctx->hash_ctx.buf[MD5_DIGEST_SIZE] = 0x80;
+	*(__le64 *)&ctx->hash_ctx.buf[MD5_BLOCK_SIZE - 8] =
+		cpu_to_le64(8 * (MD5_BLOCK_SIZE + MD5_DIGEST_SIZE));
+
+	/* Compute the outer hash, which gives the HMAC value. */
+	md5_transform(&ctx->ostate, ctx->hash_ctx.buf);
+	cpu_to_le32_array(ctx->ostate.h, ARRAY_SIZE(ctx->ostate.h));
+	memcpy(out, ctx->ostate.h, MD5_DIGEST_SIZE);
+
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+EXPORT_SYMBOL_GPL(hmac_md5_final);
+
+void hmac_md5(const struct hmac_md5_key *key, const u8 *data, size_t data_len,
+	      u8 out[MD5_DIGEST_SIZE])
+{
+	struct hmac_md5_ctx ctx;
+
+	hmac_md5_init(&ctx, key);
+	hmac_md5_update(&ctx, data, data_len);
+	hmac_md5_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_md5);
+
+void hmac_md5_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			  const u8 *data, size_t data_len,
+			  u8 out[MD5_DIGEST_SIZE])
+{
+	struct hmac_md5_ctx ctx;
+
+	hmac_md5_init_usingrawkey(&ctx, raw_key, raw_key_len);
+	hmac_md5_update(&ctx, data, data_len);
+	hmac_md5_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_md5_usingrawkey);
+
+MODULE_DESCRIPTION("MD5 and HMAC-MD5 library functions");
+MODULE_LICENSE("GPL");
-- 
2.50.1


