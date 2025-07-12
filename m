Return-Path: <linuxppc-dev+bounces-10207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55441B02DA7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:27:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8N3wvTz3blc;
	Sun, 13 Jul 2025 09:26:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362788;
	cv=none; b=b5Z/BqrPzxRpas1Wl0qqINp+rMmhVp1JkP5CVewfconHZYrukzB2cKci3f3vbp6g2dT1yUngzF7mwG1tomBYdiWzPU2P0xRBlNICB/bYv1gXvG1lNCDbH4MqM9+7wZi0aaV4jmVwZ1HRbd+46cHw6HJTfCu0D2alzbOuNk6030eO3INTnuxIPujLk9efG4Kk4TTwHJPCcEYbzgZNc2mxZ21vVU3QsoRSov4QQGhvXrbNx/Y7dTbE25zkjiuDDesoskMIJCQ+5EvrrQq/0pH7nP8tAu5uUw7Blw4qZmM3gm3i2k3Pj1IzC2++XX+kBNb4yRfRTouYCwhfbiM4Zxlhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362788; c=relaxed/relaxed;
	bh=IjtML0TrbQ6Mne9IOubMaoGP9UHhnYHbKnbqj6FjkFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2kie+wXTwIKndwNl7h13QEaGrcGLLwNagiCzomI6PtO+4iY5To5r7L9012ZWmMkcWQ7M8VDC657HRPL+JAL117nrabuPYCy1iDOheRr6+w9CCIxGu3qDc0+bG+s7VsI9UrbwHEMAKA2VKLv0KxBSRPlER6HVkvfFWCxWnHfEWwu0o6W1jle4es40F0CwhgJXMQCWPMDDQ/Z9qRxrbJinjO/pf527Xe/qSUYMauiIsm79dJk+DLbwI/Se32OgahbHXTYMF7cWHhOhz42xIaPrc4ZjlfQNNnQwByjOnMmzSJqun7iwYEN0lKB+lB1wNZH2BFsx6QYoTYTbshKPgCWRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ePEcZTid; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ePEcZTid;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8J1mGKz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47DC346B4A;
	Sat, 12 Jul 2025 23:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E75C4CEF8;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362782;
	bh=p3kE84TCz0VQuyy8H041drVH/O+OxCoctuuVLXqPVR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ePEcZTid0NAvCm5AHIwLUw51pnGSlOVO3QO2ZZZKukCAL0jPAivjBViMyqd0cL+hG
	 PneEbJdkasyj4e93lFgzizFcnxdnYEpdgvoAmia9YkahWKua7t+qOKdzZU5XwRsWbT
	 0fMYEfl53qEmj9L+Qnjj9HKk2E77XueRCs2gv3cOpk+PS31Ipuv5WiqArGmWFoMY6e
	 K09W2ZJOvtzDwv3BOyhSwP8L5q3NVmdi/8Dtl0CcbqNC8lkNOPjHXpxG1QCulGsKVi
	 OtbtsNJ9Jcot1qoCCfys5OcHVXjhKc4elRBw329mjauV/R9FhqeK5KM052hbqr2du0
	 2X8QRQDnj4fXw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 04/26] lib/crypto: sha1: Add HMAC support
Date: Sat, 12 Jul 2025 16:22:55 -0700
Message-ID: <20250712232329.818226-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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

Add HMAC support to the SHA-1 library, again following what was done for
SHA-2.  Besides providing the basis for a more streamlined "hmac(sha1)"
shash, this will also be useful for multiple in-kernel users such as
net/sctp/auth.c, net/ipv6/seg6_hmac.c, and
security/keys/trusted-keys/trusted_tpm1.c.  Those are currently using
crypto_shash, but using the library functions would be much simpler.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1.h | 118 ++++++++++++++++++++++++++++++++++++++++++
 lib/crypto/sha1.c     | 106 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 222 insertions(+), 2 deletions(-)

diff --git a/include/crypto/sha1.h b/include/crypto/sha1.h
index 387f6123a05e8..162a529ec8413 100644
--- a/include/crypto/sha1.h
+++ b/include/crypto/sha1.h
@@ -94,6 +94,124 @@ void sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE]);
  *
  * Context: Any context.
  */
 void sha1(const u8 *data, size_t len, u8 out[SHA1_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha1_key - Prepared key for HMAC-SHA1
+ * @istate: private
+ * @ostate: private
+ */
+struct hmac_sha1_key {
+	struct sha1_block_state istate;
+	struct sha1_block_state ostate;
+};
+
+/**
+ * struct hmac_sha1_ctx - Context for computing HMAC-SHA1 of a message
+ * @sha_ctx: private
+ * @ostate: private
+ */
+struct hmac_sha1_ctx {
+	struct sha1_ctx sha_ctx;
+	struct sha1_block_state ostate;
+};
+
+/**
+ * hmac_sha1_preparekey() - Prepare a key for HMAC-SHA1
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA1 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha1_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha1_preparekey(struct hmac_sha1_key *key,
+			  const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha1_init() - Initialize an HMAC-SHA1 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha1() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha1_init(struct hmac_sha1_ctx *ctx, const struct hmac_sha1_key *key);
+
+/**
+ * hmac_sha1_init_usingrawkey() - Initialize an HMAC-SHA1 context for a new
+ *				  message, using a raw key
+ * @ctx: (output) the HMAC context to initialize
+ * @raw_key: the raw HMAC-SHA1 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * If you don't need incremental computation, consider hmac_sha1_usingrawkey()
+ * instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha1_init_usingrawkey(struct hmac_sha1_ctx *ctx,
+				const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha1_update() - Update an HMAC-SHA1 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha1_update(struct hmac_sha1_ctx *ctx,
+				    const u8 *data, size_t data_len)
+{
+	sha1_update(&ctx->sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha1_final() - Finish computing an HMAC-SHA1 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA1 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha1_final(struct hmac_sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE]);
+
+/**
+ * hmac_sha1() - Compute HMAC-SHA1 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA1 value
+ *
+ * If you're using the key only once, consider using hmac_sha1_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha1(const struct hmac_sha1_key *key,
+	       const u8 *data, size_t data_len, u8 out[SHA1_DIGEST_SIZE]);
+
+/**
+ * hmac_sha1_usingrawkey() - Compute HMAC-SHA1 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA1 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA1 value
+ *
+ * If you're using the key multiple times, prefer to use hmac_sha1_preparekey()
+ * followed by multiple calls to hmac_sha1() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha1_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			   const u8 *data, size_t data_len,
+			   u8 out[SHA1_DIGEST_SIZE]);
+
 #endif /* _CRYPTO_SHA1_H */
diff --git a/lib/crypto/sha1.c b/lib/crypto/sha1.c
index 7c0763cbf9f1e..89831f7f27793 100644
--- a/lib/crypto/sha1.c
+++ b/lib/crypto/sha1.c
@@ -4,17 +4,19 @@
  * and to avoid unnecessary copies into the context array.
  *
  * This was based on the git SHA1 implementation.
  */
 
+#include <crypto/hmac.h>
 #include <crypto/sha1.h>
 #include <linux/bitops.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/unaligned.h>
+#include <linux/wordpart.h>
 
 static const struct sha1_block_state sha1_iv = {
 	.h = { SHA1_H0, SHA1_H1, SHA1_H2, SHA1_H3, SHA1_H4 },
 };
 
@@ -198,11 +200,11 @@ void sha1_update(struct sha1_ctx *ctx, const u8 *data, size_t len)
 	if (len)
 		memcpy(&ctx->buf[partial], data, len);
 }
 EXPORT_SYMBOL_GPL(sha1_update);
 
-void sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
+static void __sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
 {
 	u64 bitcount = ctx->bytecount << 3;
 	size_t partial = ctx->bytecount % SHA1_BLOCK_SIZE;
 
 	ctx->buf[partial++] = 0x80;
@@ -215,10 +217,15 @@ void sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
 	*(__be64 *)&ctx->buf[SHA1_BLOCK_SIZE - 8] = cpu_to_be64(bitcount);
 	sha1_blocks(&ctx->state, ctx->buf, 1);
 
 	for (size_t i = 0; i < SHA1_DIGEST_SIZE; i += 4)
 		put_unaligned_be32(ctx->state.h[i / 4], out + i);
+}
+
+void sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
+{
+	__sha1_final(ctx, out);
 	memzero_explicit(ctx, sizeof(*ctx));
 }
 EXPORT_SYMBOL_GPL(sha1_final);
 
 void sha1(const u8 *data, size_t len, u8 out[SHA1_DIGEST_SIZE])
@@ -229,10 +236,105 @@ void sha1(const u8 *data, size_t len, u8 out[SHA1_DIGEST_SIZE])
 	sha1_update(&ctx, data, len);
 	sha1_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha1);
 
+static void __hmac_sha1_preparekey(struct sha1_block_state *istate,
+				   struct sha1_block_state *ostate,
+				   const u8 *raw_key, size_t raw_key_len)
+{
+	union {
+		u8 b[SHA1_BLOCK_SIZE];
+		unsigned long w[SHA1_BLOCK_SIZE / sizeof(unsigned long)];
+	} derived_key = { 0 };
+
+	if (unlikely(raw_key_len > SHA1_BLOCK_SIZE))
+		sha1(raw_key, raw_key_len, derived_key.b);
+	else
+		memcpy(derived_key.b, raw_key, raw_key_len);
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
+	*istate = sha1_iv;
+	sha1_blocks(istate, derived_key.b, 1);
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
+						HMAC_IPAD_VALUE);
+	*ostate = sha1_iv;
+	sha1_blocks(ostate, derived_key.b, 1);
+
+	memzero_explicit(&derived_key, sizeof(derived_key));
+}
+
+void hmac_sha1_preparekey(struct hmac_sha1_key *key,
+			  const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha1_preparekey(&key->istate, &key->ostate,
+			       raw_key, raw_key_len);
+}
+EXPORT_SYMBOL_GPL(hmac_sha1_preparekey);
+
+void hmac_sha1_init(struct hmac_sha1_ctx *ctx, const struct hmac_sha1_key *key)
+{
+	ctx->sha_ctx.state = key->istate;
+	ctx->sha_ctx.bytecount = SHA1_BLOCK_SIZE;
+	ctx->ostate = key->ostate;
+}
+EXPORT_SYMBOL_GPL(hmac_sha1_init);
+
+void hmac_sha1_init_usingrawkey(struct hmac_sha1_ctx *ctx,
+				const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha1_preparekey(&ctx->sha_ctx.state, &ctx->ostate,
+			       raw_key, raw_key_len);
+	ctx->sha_ctx.bytecount = SHA1_BLOCK_SIZE;
+}
+EXPORT_SYMBOL_GPL(hmac_sha1_init_usingrawkey);
+
+void hmac_sha1_final(struct hmac_sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
+{
+	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
+	__sha1_final(&ctx->sha_ctx, ctx->sha_ctx.buf);
+	memset(&ctx->sha_ctx.buf[SHA1_DIGEST_SIZE], 0,
+	       SHA1_BLOCK_SIZE - SHA1_DIGEST_SIZE);
+	ctx->sha_ctx.buf[SHA1_DIGEST_SIZE] = 0x80;
+	*(__be32 *)&ctx->sha_ctx.buf[SHA1_BLOCK_SIZE - 4] =
+		cpu_to_be32(8 * (SHA1_BLOCK_SIZE + SHA1_DIGEST_SIZE));
+
+	/* Compute the outer hash, which gives the HMAC value. */
+	sha1_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
+	for (size_t i = 0; i < SHA1_DIGEST_SIZE; i += 4)
+		put_unaligned_be32(ctx->ostate.h[i / 4], out + i);
+
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+EXPORT_SYMBOL_GPL(hmac_sha1_final);
+
+void hmac_sha1(const struct hmac_sha1_key *key,
+	       const u8 *data, size_t data_len, u8 out[SHA1_DIGEST_SIZE])
+{
+	struct hmac_sha1_ctx ctx;
+
+	hmac_sha1_init(&ctx, key);
+	hmac_sha1_update(&ctx, data, data_len);
+	hmac_sha1_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha1);
+
+void hmac_sha1_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			   const u8 *data, size_t data_len,
+			   u8 out[SHA1_DIGEST_SIZE])
+{
+	struct hmac_sha1_ctx ctx;
+
+	hmac_sha1_init_usingrawkey(&ctx, raw_key, raw_key_len);
+	hmac_sha1_update(&ctx, data, data_len);
+	hmac_sha1_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha1_usingrawkey);
+
 #ifdef sha1_mod_init_arch
 static int __init sha1_mod_init(void)
 {
 	sha1_mod_init_arch();
 	return 0;
@@ -243,7 +345,7 @@ static void __exit sha1_mod_exit(void)
 {
 }
 module_exit(sha1_mod_exit);
 #endif
 
-MODULE_DESCRIPTION("SHA-1 library functions");
+MODULE_DESCRIPTION("SHA-1 and HMAC-SHA1 library functions");
 MODULE_LICENSE("GPL");
-- 
2.50.1


