Return-Path: <linuxppc-dev+bounces-9928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0576FAEE39F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:10:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1q1Fkfz3bwJ;
	Tue,  1 Jul 2025 02:09:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299774;
	cv=none; b=Oi9nUCg1ZFHhaZ8XcYDjd7+GWlLsk0tc0BTkNF+qV9S6uGH0Uq9ab7fchVxwVSvh6XxzuR6wPOGR+lAHSiW1VHXYjv3ryt0t7kYKgsGhG/fJCwb2GDNgVJvWTdzWeHDn7AevflSeSjMEI9Rhygi8Bc170fv7A4WEwaCyF5vVAYX6hxEi7Za+6twQnyqgJy1GOfLezu4xhP7owWibKwqqBRJCSC0g3ttP8vg48tM3E1o4eGJX+xYWF2oWvVSeON7iqDlr81WQzKomQ2JBd9m5fecwe+ZmBcQXqkkTUI2C2F9evKP9Dfc+VsSsVVYJXn7j6sHNnnXetFjziSxZ8RUQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299774; c=relaxed/relaxed;
	bh=7eiDuH+C+jphs4n+B3gHg7q20nkHcNUfHjsZMQ6IwbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mifoGTmeI8BeOm9CO7EsmZHi1909cphu0Ko4uwCO2Wvl6EWAKKsKvz7YqlwFrrKx/ugZe5CK9+SHmvN8rLHpXNPne1MAdW5JCerF6oSskrmSXzJn9GRAq7c7Ls6rj07SPyDQ7ubIDHjH8nSaorrkezQF5/pIsY25zHXLV8Eld8tUOEKbyykRdFE85Qg18BhHAeHHGfx5OkZ2TaESNnrO+/GPhIuoNnLnPo5oq0U7QqxQ79cK2hcEqakSmp9yjFB+Xc98pFqkiSc0USsIMquNelLv2oC2trGp8AEn8BPAcZGDMkR3+YYAVJ8Qxrp1Bd4f4YaNHxyauO6JgwNfFJFipg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pKdLPUZ4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pKdLPUZ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1f68yFz30Qb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CA9BEA53512;
	Mon, 30 Jun 2025 16:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA45C4CEE3;
	Mon, 30 Jun 2025 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299764;
	bh=6+1ubXJ5b0bOzmaWleh5feSsXbrBTAhB9wekRcwvDtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pKdLPUZ4iPSy5ucV76BIQubqoZ6TZ+DcSGMDHnJnEXHNML2skEmjhhdsULpfgmiv7
	 cFCvviTJAakdR+OMH5ifszQIAWtXClFC+iqTOyhYtqIfU66w0U3zgN88hAw1mQ82fJ
	 zEHfMCE58dT4TPc0HIYunE4CyxuB44hWsq2uEUBUd5fHHQ45d19GdtZQkvV+VhHwK5
	 VEI9nWc/C214nFeUOAy0bGW196Bd4dI/dVa1BQ555QJaxBORFySgjmrDtJMM9L8mDD
	 HeAdVHWSR09McZMw4X4ypJ0jsnUcmTvko+k06fHPIHbki+4wM2k7SKlJ0NDAYSrU3c
	 ztOWrKhWVF4jQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 08/14] lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
Date: Mon, 30 Jun 2025 09:06:39 -0700
Message-ID: <20250630160645.3198-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
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

Since HMAC support is commonly needed and is fairly simple, include it
as a first-class citizen of the SHA-256 library.

The API supports both incremental and one-shot computation, and either
preparing the key ahead of time or just using a raw key.  The
implementation is much more streamlined than crypto/hmac.c.

I've kept it consistent with the HMAC-SHA384 and HMAC-SHA512 code as
much as possible.

Testing of these functions will be via sha224_kunit and sha256_kunit,
added by a later commit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 222 ++++++++++++++++++++++++++++++++++++++++++
 lib/crypto/sha256.c   | 147 +++++++++++++++++++++++++++-
 2 files changed, 364 insertions(+), 5 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 18e1eec841b71..2e3fc2cf4aa0d 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -129,10 +129,26 @@ struct __sha256_ctx {
 	u64 bytecount;
 	u8 buf[SHA256_BLOCK_SIZE] __aligned(__alignof__(__be64));
 };
 void __sha256_update(struct __sha256_ctx *ctx, const u8 *data, size_t len);
 
+/*
+ * HMAC key and message context structs, shared by HMAC-SHA224 and HMAC-SHA256.
+ * The hmac_sha224_* and hmac_sha256_* structs wrap this one so that the API has
+ * proper typing and doesn't allow mixing the functions arbitrarily.
+ */
+struct __hmac_sha256_key {
+	struct sha256_block_state istate;
+	struct sha256_block_state ostate;
+};
+struct __hmac_sha256_ctx {
+	struct __sha256_ctx sha_ctx;
+	struct sha256_block_state ostate;
+};
+void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
+			const struct __hmac_sha256_key *key);
+
 /**
  * struct sha224_ctx - Context for hashing a message with SHA-224
  * @ctx: private
  */
 struct sha224_ctx {
@@ -146,10 +162,113 @@ static inline void sha224_update(struct sha224_ctx *ctx,
 	__sha256_update(&ctx->ctx, data, len);
 }
 void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
 void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha224_key - Prepared key for HMAC-SHA224
+ * @key: private
+ */
+struct hmac_sha224_key {
+	struct __hmac_sha256_key key;
+};
+
+/**
+ * struct hmac_sha224_ctx - Context for computing HMAC-SHA224 of a message
+ * @ctx: private
+ */
+struct hmac_sha224_ctx {
+	struct __hmac_sha256_ctx ctx;
+};
+
+/**
+ * hmac_sha224_preparekey() - Prepare a key for HMAC-SHA224
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA224 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha224_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha224_preparekey(struct hmac_sha224_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha224_init() - Initialize an HMAC-SHA224 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha224() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha224_init(struct hmac_sha224_ctx *ctx,
+				    const struct hmac_sha224_key *key)
+{
+	__hmac_sha256_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha224_update() - Update an HMAC-SHA224 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha224_update(struct hmac_sha224_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha256_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha224_final() - Finish computing an HMAC-SHA224 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA224 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha224_final(struct hmac_sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
+
+/**
+ * hmac_sha224() - Compute HMAC-SHA224 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA224 value
+ *
+ * If you're using the key only once, consider using hmac_sha224_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha224(const struct hmac_sha224_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA224_DIGEST_SIZE]);
+
+/**
+ * hmac_sha224_usingrawkey() - Compute HMAC-SHA224 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA224 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA224 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha224_preparekey() followed by multiple calls to hmac_sha224() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA224_DIGEST_SIZE]);
+
 /**
  * struct sha256_ctx - Context for hashing a message with SHA-256
  * @ctx: private
  */
 struct sha256_ctx {
@@ -163,10 +282,113 @@ static inline void sha256_update(struct sha256_ctx *ctx,
 	__sha256_update(&ctx->ctx, data, len);
 }
 void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha256_key - Prepared key for HMAC-SHA256
+ * @key: private
+ */
+struct hmac_sha256_key {
+	struct __hmac_sha256_key key;
+};
+
+/**
+ * struct hmac_sha256_ctx - Context for computing HMAC-SHA256 of a message
+ * @ctx: private
+ */
+struct hmac_sha256_ctx {
+	struct __hmac_sha256_ctx ctx;
+};
+
+/**
+ * hmac_sha256_preparekey() - Prepare a key for HMAC-SHA256
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA256 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha256_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha256_preparekey(struct hmac_sha256_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha256_init() - Initialize an HMAC-SHA256 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha256() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha256_init(struct hmac_sha256_ctx *ctx,
+				    const struct hmac_sha256_key *key)
+{
+	__hmac_sha256_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha256_update() - Update an HMAC-SHA256 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha256_update(struct hmac_sha256_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha256_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha256_final() - Finish computing an HMAC-SHA256 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA256 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha256_final(struct hmac_sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
+
+/**
+ * hmac_sha256() - Compute HMAC-SHA256 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA256 value
+ *
+ * If you're using the key only once, consider using hmac_sha256_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha256(const struct hmac_sha256_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA256_DIGEST_SIZE]);
+
+/**
+ * hmac_sha256_usingrawkey() - Compute HMAC-SHA256 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA256 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA256 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha256_preparekey() followed by multiple calls to hmac_sha256() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha256_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA256_DIGEST_SIZE]);
+
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
 	u64 h[8];
 };
 
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 3e7797a4489de..12b4b59052c4a 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -1,24 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * SHA-256, as specified in
- * http://csrc.nist.gov/groups/STM/cavp/documents/shs/sha256-384-512.pdf
- *
- * SHA-256 code by Jean-Luc Cooke <jlcooke@certainkey.com>.
+ * SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256 library functions
  *
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  * Copyright (c) 2014 Red Hat Inc.
  */
 
+#include <crypto/hmac.h>
 #include <crypto/internal/blockhash.h>
 #include <crypto/internal/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
+#include <linux/wordpart.h>
 
 static const struct sha256_block_state sha224_iv = {
 	.h = {
 		SHA224_H0, SHA224_H1, SHA224_H2, SHA224_H3,
 		SHA224_H4, SHA224_H5, SHA224_H6, SHA224_H7,
@@ -134,7 +133,145 @@ void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 	sha256_update(&ctx, data, len);
 	sha256_final(&ctx, out);
 }
 EXPORT_SYMBOL(sha256);
 
-MODULE_DESCRIPTION("SHA-256 Algorithm");
+/* pre-boot environment (as indicated by __DISABLE_EXPORTS) doesn't need HMAC */
+#ifndef __DISABLE_EXPORTS
+static void __hmac_sha256_preparekey(struct __hmac_sha256_key *key,
+				     const u8 *raw_key, size_t raw_key_len,
+				     const struct sha256_block_state *iv)
+{
+	union {
+		u8 b[SHA256_BLOCK_SIZE];
+		unsigned long w[SHA256_BLOCK_SIZE / sizeof(unsigned long)];
+	} derived_key = { 0 };
+
+	if (unlikely(raw_key_len > SHA256_BLOCK_SIZE)) {
+		if (iv == &sha224_iv)
+			sha224(raw_key, raw_key_len, derived_key.b);
+		else
+			sha256(raw_key, raw_key_len, derived_key.b);
+	} else {
+		memcpy(derived_key.b, raw_key, raw_key_len);
+	}
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
+	key->istate = *iv;
+	sha256_blocks(&key->istate, derived_key.b, 1);
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
+						HMAC_IPAD_VALUE);
+	key->ostate = *iv;
+	sha256_blocks(&key->ostate, derived_key.b, 1);
+
+	memzero_explicit(&derived_key, sizeof(derived_key));
+}
+
+void hmac_sha224_preparekey(struct hmac_sha224_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha256_preparekey(&key->key, raw_key, raw_key_len, &sha224_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha224_preparekey);
+
+void hmac_sha256_preparekey(struct hmac_sha256_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha256_preparekey(&key->key, raw_key, raw_key_len, &sha256_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha256_preparekey);
+
+void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
+			const struct __hmac_sha256_key *key)
+{
+	__sha256_init(&ctx->sha_ctx, &key->istate, SHA256_BLOCK_SIZE);
+	ctx->ostate = key->ostate;
+}
+EXPORT_SYMBOL_GPL(__hmac_sha256_init);
+
+static void __hmac_sha256_final(struct __hmac_sha256_ctx *ctx,
+				u8 *out, size_t digest_size)
+{
+	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
+	__sha256_final(&ctx->sha_ctx, ctx->sha_ctx.buf, digest_size);
+	memset(&ctx->sha_ctx.buf[digest_size], 0,
+	       SHA256_BLOCK_SIZE - digest_size);
+	ctx->sha_ctx.buf[digest_size] = 0x80;
+	*(__be32 *)&ctx->sha_ctx.buf[SHA256_BLOCK_SIZE - 4] =
+		cpu_to_be32(8 * (SHA256_BLOCK_SIZE + digest_size));
+
+	/* Compute the outer hash, which gives the HMAC value. */
+	sha256_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
+	for (size_t i = 0; i < digest_size; i += 4)
+		put_unaligned_be32(ctx->ostate.h[i / 4], out + i);
+
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
+void hmac_sha224_final(struct hmac_sha224_ctx *ctx,
+		       u8 out[SHA224_DIGEST_SIZE])
+{
+	__hmac_sha256_final(&ctx->ctx, out, SHA224_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha224_final);
+
+void hmac_sha256_final(struct hmac_sha256_ctx *ctx,
+		       u8 out[SHA256_DIGEST_SIZE])
+{
+	__hmac_sha256_final(&ctx->ctx, out, SHA256_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha256_final);
+
+void hmac_sha224(const struct hmac_sha224_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA224_DIGEST_SIZE])
+{
+	struct hmac_sha224_ctx ctx;
+
+	hmac_sha224_init(&ctx, key);
+	hmac_sha224_update(&ctx, data, data_len);
+	hmac_sha224_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha224);
+
+void hmac_sha256(const struct hmac_sha256_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA256_DIGEST_SIZE])
+{
+	struct hmac_sha256_ctx ctx;
+
+	hmac_sha256_init(&ctx, key);
+	hmac_sha256_update(&ctx, data, data_len);
+	hmac_sha256_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha256);
+
+void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA224_DIGEST_SIZE])
+{
+	struct hmac_sha224_key key;
+
+	hmac_sha224_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha224(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha224_usingrawkey);
+
+void hmac_sha256_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA256_DIGEST_SIZE])
+{
+	struct hmac_sha256_key key;
+
+	hmac_sha256_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha256(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha256_usingrawkey);
+#endif /* !__DISABLE_EXPORTS */
+
+MODULE_DESCRIPTION("SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256 library functions");
 MODULE_LICENSE("GPL");
-- 
2.50.0


