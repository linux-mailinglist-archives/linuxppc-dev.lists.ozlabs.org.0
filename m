Return-Path: <linuxppc-dev+bounces-9932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308DAEE3A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:11:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1t5Qlvz30Qb;
	Tue,  1 Jul 2025 02:09:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299777;
	cv=none; b=nvbPf8bwJGjkrmduwbu2wRpYKYCCN+ogsPhazYbbnPh+XZAMUOYhTxxuWLv3b/i/BroYlD2eiLyejqpkJXO6Cij9G8+eQkQ6tgt2jLYaQjzV3MfD4oHvOYEDU7B2vynJLEPxzXM0vIpVwZE9GrrMNgnBFV/0k1S0zi00MerAqmNXYcRbpujpuK4od4bPh/Oaoci64mMskxxQMDjLmAqvnOORW5dt68P0JFbzhLjTaHS6bHX2Spd+avfBY10wLGJdJCMh6n1XB+DcnXOMLeyu/MMDPM2pBgLKWvXKMVoVD8oueQ7hVu2ih+zAIozZAHRarKkQSlEs3CEUeDOiiWZlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299777; c=relaxed/relaxed;
	bh=RgNrCjq6lsOkp6g05Z5E9V8l08rRXcQ6exdzrdyOjWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0AX+NBhRBC6Q4pRCWSXtp1j87In9zOEN0Pn6BIkmNwsQnTFXYN0CzkVlIGW4oSUHejN3k5NQSESiyrelOrn/d6IODr5MZ+eZwB4rPsu4m2lw6pckeWYurE+s2l17tjW51+GiA5s7wQh6Geb6rhgFHiLDV4zt1ca3BJ1i81R/EhBm2PRDR2fmB9/MvQpfeW58rIcjsvFzn9O+pzY+umJkAJ+021s2/nQJSkXQWK3WDayl0OSD5ZZWJly9vrVqh2hP2BRCrinYBoy4y6Jha9WCcJHjp9UnJDvEt/lIj6RPiZ5JAN8Nom6DerHl+9jg50iPICe594KMOkgk5Ddowo++w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jnBxR32k; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jnBxR32k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1l0Wsmz3brx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19317A53519;
	Mon, 30 Jun 2025 16:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC2DC4CEF3;
	Mon, 30 Jun 2025 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299767;
	bh=pkoFPfsdz5mUfc5I4FK+MnyFLsCjGsnnD9jc5ME9fN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnBxR32keuveFDD/erORneyVQFZMExFVwQ2m1PRHBM8e09zhVEcpdxXezXwhIRIep
	 1b/hAsrsEPE4GO34uoemDkgD6DfhLn2c+0We3yqTqkDW1Zdqk+usXyKw0ahpO/QyDk
	 kq8OJiVNVNYv+79sZjwcLRLPE8u+AXxrFrb5rUo1EG4MgLQWKf4VRjl6PqF6ZW6RvL
	 tO/4ewF4TqSoMw0NJ2cWpzPbScaI6j0B3laWfK7QYlGoz9vuy6ps6Y8wwL6bttBzRT
	 i6YDWFUv5OhMZDpFhfE2wkKZC04+niDSZ+wBsXg2HLi3z3ji0M2HuML4L/kX6ufOLl
	 sxIXnWBzurdOw==
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
Subject: [PATCH v2 14/14] lib/crypto: sha256: Document the SHA-224 and SHA-256 API
Date: Mon, 30 Jun 2025 09:06:45 -0700
Message-ID: <20250630160645.3198-15-ebiggers@kernel.org>
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

Add kerneldoc comments, consistent with the kerneldoc comments of the
SHA-384 and SHA-512 API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 76 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 2e3fc2cf4aa0d..e0a08f6addd00 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -153,17 +153,55 @@ void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
  */
 struct sha224_ctx {
 	struct __sha256_ctx ctx;
 };
 
+/**
+ * sha224_init() - Initialize a SHA-224 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider sha224() instead.
+ *
+ * Context: Any context.
+ */
 void sha224_init(struct sha224_ctx *ctx);
+
+/**
+ * sha224_update() - Update a SHA-224 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
 static inline void sha224_update(struct sha224_ctx *ctx,
 				 const u8 *data, size_t len)
 {
 	__sha256_update(&ctx->ctx, data, len);
 }
+
+/**
+ * sha224_final() - Finish computing a SHA-224 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting SHA-224 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
 void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
+
+/**
+ * sha224() - Compute SHA-224 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting SHA-224 message digest
+ *
+ * Context: Any context.
+ */
 void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
 /**
  * struct hmac_sha224_key - Prepared key for HMAC-SHA224
  * @key: private
@@ -273,17 +311,55 @@ void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
  */
 struct sha256_ctx {
 	struct __sha256_ctx ctx;
 };
 
+/**
+ * sha256_init() - Initialize a SHA-256 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider sha256() instead.
+ *
+ * Context: Any context.
+ */
 void sha256_init(struct sha256_ctx *ctx);
+
+/**
+ * sha256_update() - Update a SHA-256 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
 static inline void sha256_update(struct sha256_ctx *ctx,
 				 const u8 *data, size_t len)
 {
 	__sha256_update(&ctx->ctx, data, len);
 }
+
+/**
+ * sha256_final() - Finish computing a SHA-256 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting SHA-256 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
 void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
+
+/**
+ * sha256() - Compute SHA-256 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting SHA-256 message digest
+ *
+ * Context: Any context.
+ */
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 /**
  * struct hmac_sha256_key - Prepared key for HMAC-SHA256
  * @key: private
-- 
2.50.0


