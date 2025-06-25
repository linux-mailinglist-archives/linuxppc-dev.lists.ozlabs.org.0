Return-Path: <linuxppc-dev+bounces-9705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC6AAE77E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:11:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJB6T6Tz30VR;
	Wed, 25 Jun 2025 17:10:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835434;
	cv=none; b=jv3Qz4z6s7sOYJxj+7grPaLBXsz6FXtqNISmH6jb+pHY2+FWN67rT7RmwE6I+6JrWLuMzBTibGC6XB/Mo2NJ9Eefpa12Lg+eDujgaDPBVL5/eRPqlHfovy7LLjH/vlj+ZntS2lNRYcbOL9Duto/Slfw3xv/DtkTU6SOyQJV63RTNehJpSyaxuU0Gi98AjFZs6FlxxwrQ8M63bE9Lj6ZWzjD7bqRQ+0Gmadd1uxrXFwfRwOxDGjaAExDQCsQqdE6HO5QP0Tuu6yTxQx0M8EmNqQu8FLnOe6vZHLEG8oT5F6+3jD+y1KZ2R1yH2qt07vE4eZbU/JGEhDcHaemTRY2fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835434; c=relaxed/relaxed;
	bh=of6wCNXS5Ss8rOtX027YOzmJzT22LfAjPavKHPx9nZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHmI0NnQi/6JhnJsZyMSNVJKpCkTa+0oFjdLUuDjotY35pS2uUMtfxjLjzaywsUHWJEL4nYIK6T5HFmzS24wagfv8fFpzgs3UI9CYo3A48mO6JBRjxodfBqYn7qdqKIv248ddeCs/RfRPPW/sq0XtNBpPsfJslmiQHFBZgycLprU0+vV9warMXTQc9uOjIxwLFIXZsBndXwkbL0m0n2Wz68pvoN7H8C1g1ZS2az8FXeaSafqafKf1Av363yzgyrlUNjaYDja/CbyslWPI4bfDee5U+tU74FCVvosDUrfN21j+x8RCUOOxenu13oLGJWjGTY/xiqrWZdAT3O8ESAjjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UyXquyVZ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UyXquyVZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJ75jlkz30BG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22DE24AFFA;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66DCC4CEF2;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835430;
	bh=2LrGs37CGEadHzUgE3udzC7iJiB7yoZqC5JHegQK+WQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyXquyVZWgisY6zFwDG5d4ZzxprCHqDlisQ41lEvQ5IHurjnN/m8NqcWJG2vqieps
	 QNFaI0iSMcmJ46Ug61uPBEtuUygIKDzSDjAxynb4e32/Bzo9ew8IRX1nVeNa3fkzqN
	 syi5JxOKQKXDORFsRNuQUSvE2MTtpLQan5nDKmPDEZTdAAdaOORBOzhXfhVgW++ZhS
	 8aQcYq36vJoEcgEO11QoLWRlxYpBu5iW/xpJLuTKV0vQsT609fAI+9N0MKxz1aEcLo
	 feCNVsiIJhz/3Gd10BL2tMvEMtB3M5eyiDmrObThqsEaq+JwDKnQHAVQO+KU2HI6MX
	 nTvdfxLoh5QYA==
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
Subject: [PATCH 06/18] lib/crypto: sha512: Fix a grammatical error in kerneldoc comments
Date: Wed, 25 Jun 2025 00:08:07 -0700
Message-ID: <20250625070819.1496119-7-ebiggers@kernel.org>
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

"An HMAC", not "A HMAC".

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 36a9dab805be7..296ce9d468bfc 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -247,11 +247,11 @@ struct hmac_sha384_ctx {
  */
 void hmac_sha384_preparekey(struct hmac_sha384_key *key,
 			    const u8 *raw_key, size_t raw_key_len);
 
 /**
- * hmac_sha384_init() - Initialize a HMAC-SHA384 context for a new message
+ * hmac_sha384_init() - Initialize an HMAC-SHA384 context for a new message
  * @ctx: (output) the HMAC context to initialize
  * @key: the prepared HMAC key
  *
  * If you don't need incremental computation, consider hmac_sha384() instead.
  *
@@ -262,11 +262,11 @@ static inline void hmac_sha384_init(struct hmac_sha384_ctx *ctx,
 {
 	__hmac_sha512_init(&ctx->ctx, &key->key);
 }
 
 /**
- * hmac_sha384_update() - Update a HMAC-SHA384 context with message data
+ * hmac_sha384_update() - Update an HMAC-SHA384 context with message data
  * @ctx: the HMAC context to update; must have been initialized
  * @data: the message data
  * @data_len: the data length in bytes
  *
  * This can be called any number of times.
@@ -278,11 +278,11 @@ static inline void hmac_sha384_update(struct hmac_sha384_ctx *ctx,
 {
 	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
 }
 
 /**
- * hmac_sha384_final() - Finish computing a HMAC-SHA384 value
+ * hmac_sha384_final() - Finish computing an HMAC-SHA384 value
  * @ctx: the HMAC context to finalize; must have been initialized
  * @out: (output) the resulting HMAC-SHA384 value
  *
  * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
  *
@@ -405,11 +405,11 @@ struct hmac_sha512_ctx {
  */
 void hmac_sha512_preparekey(struct hmac_sha512_key *key,
 			    const u8 *raw_key, size_t raw_key_len);
 
 /**
- * hmac_sha512_init() - Initialize a HMAC-SHA512 context for a new message
+ * hmac_sha512_init() - Initialize an HMAC-SHA512 context for a new message
  * @ctx: (output) the HMAC context to initialize
  * @key: the prepared HMAC key
  *
  * If you don't need incremental computation, consider hmac_sha512() instead.
  *
@@ -420,11 +420,11 @@ static inline void hmac_sha512_init(struct hmac_sha512_ctx *ctx,
 {
 	__hmac_sha512_init(&ctx->ctx, &key->key);
 }
 
 /**
- * hmac_sha512_update() - Update a HMAC-SHA512 context with message data
+ * hmac_sha512_update() - Update an HMAC-SHA512 context with message data
  * @ctx: the HMAC context to update; must have been initialized
  * @data: the message data
  * @data_len: the data length in bytes
  *
  * This can be called any number of times.
@@ -436,11 +436,11 @@ static inline void hmac_sha512_update(struct hmac_sha512_ctx *ctx,
 {
 	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
 }
 
 /**
- * hmac_sha512_final() - Finish computing a HMAC-SHA512 value
+ * hmac_sha512_final() - Finish computing an HMAC-SHA512 value
  * @ctx: the HMAC context to finalize; must have been initialized
  * @out: (output) the resulting HMAC-SHA512 value
  *
  * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
  *
-- 
2.50.0


