Return-Path: <linuxppc-dev+bounces-9717-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD746AE7814
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJP2rk4z30WX;
	Wed, 25 Jun 2025 17:10:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835445;
	cv=none; b=eWj1YzTVx1LF/0SiVjmWTLvJ2WaWfPV3yQFC3m8RVaQHe7mqaYyZj7gBRkGAVyPjTV54Mee4D7yLVfje0W+uNNALYKaVnImQBi/pYO9DLLKsRsebO/8ZzOc3Ow6jLa/PWfEQT078BVg8JCd65CdVQHo7lEJaAnzpcwF0vYEuP+ycRNV2KKOn4T8WtpjCf0Ky1Tb7RcSwC/x87aahxpLBS6MEgFqGxemfIo6uX4zLDviITpcnYWlSEjAt0UZHPJh3VavfNW1Pdr0Ft2GWTBRoY+OlOaxHr3eU3V8P0K2DaCVRtQJjPLqQWg72VKlYnRg7spDNCguD12AcYTZtJlQSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835445; c=relaxed/relaxed;
	bh=RgNrCjq6lsOkp6g05Z5E9V8l08rRXcQ6exdzrdyOjWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mI+irdq+OsKClgy++qmYXHppBYGEnphH1EFG4z0RQkSjMQRops2ILViBPm207QVrdjqYx9DLsSXOx1HEh+Izm2gALmxGbxj/C59oSEqChBaQU5bTbVsm935wn7JnGB8fxJ+AQZq8a5IKfqzcIMWyzDjqhlBb0QWlZLnMrBw8tNDcUTXWV19gfGm92oc2Dh/0ZGfSe8/AyoXSHq3GdsHpXw0d9UPE8IpVvOvPbWD20SCRcaAGSLIOb1v7A9azPolBB7KQ1Xjfr4EGskV2YlHlsliMX2FAk2fcEGi3ZMm7xibi6B7wTvDGroFfR9ZxW6iTeG2Aq0ptNfa/4M6wH0VOYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eZmKP/fI; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eZmKP/fI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJG4Mk4z3bcj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 053204AFEE;
	Wed, 25 Jun 2025 07:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850B0C4CEF1;
	Wed, 25 Jun 2025 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835435;
	bh=pkoFPfsdz5mUfc5I4FK+MnyFLsCjGsnnD9jc5ME9fN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eZmKP/fIDXW6rkeKR6Thsj7qhzrxUo7+anqcEdA8gXs47TnZN6DL2kX7bOmniF+Af
	 +piPAyua5mV1/j2iaeJwcTEQSZit4PSpaEuHxsuX3Gh7qbJL1/S6+cmg48nAkVE0dN
	 ZyGYkK4KNRVoHZ8kRyXFP+D5WRT1bmxJwqycb3x7/rHw4Si1XjQgAf3mJF4Ppbc3st
	 vVZqoNdVE/MzcDZ1B21vwKhKKnzwJYGxof7gMCU3EX3I9Jd+xgPmhyMAFfRtKRsS7F
	 8ucsuq7Ii9jB5dRSQBWrDMV+5Y5BLLHL58mBqSOsHYMJPjSbhmNrrHgtHdtCEEmFJL
	 s0DeneNL1I14g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 18/18] lib/crypto: sha256: Document the SHA-224 and SHA-256 API
Date: Wed, 25 Jun 2025 00:08:19 -0700
Message-ID: <20250625070819.1496119-19-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
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


