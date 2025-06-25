Return-Path: <linuxppc-dev+bounces-9706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0086AAE77EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:11:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJC2cp6z30Vn;
	Wed, 25 Jun 2025 17:10:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835435;
	cv=none; b=ZB8eR68EMbcxvaDesnlq19XSzbYotZYrkueLPE1WJwgZm8IJumbVgfWJSZl69V3C8Cmyt3xLfDMdc4opGtyISgZz4QMHWS64DVFnbvyCRHnMRHdqt3YzuBtcS7y08AOslGdc7b9N/utnMCv9umzXGZq+yGd0XQAmsUqEbuyt/JKAREXQb9jsIknINiapXiLcZgwfweHAe5p8U4OZcI/vFxOi5H1uy0BeJ9AV8e23IWIUY+VK1tKuLqpyiD7bvN7arXG5DLrl+sP1300LEFsDPfVgfNVIZ/Fiz5FIexHgD/CicT2m3T9g2kBCccbsC4yi6uW8MhMe9PeRFStPBWFgzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835435; c=relaxed/relaxed;
	bh=jmk1ZYv8Vqnkp3j2taSYxgOhWaWsh5xUu3yydRBxIZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHGe4I6kTjg+7SHKfNwOm9hbUyiBHs5k9r2dti5WJpwgdE+5xATn3wUJ/TRQ2vq33QNe9WLHIGfNQ7ZMPExmkJzHLgEqg/f0W2nAKoMV13Jfhm1LWIGDCyjndv09/GjC2YQfg3kFMwJt9+3K2lonPkhduf4rMJyxp6t0DZe9OPVaVcv4KuqLgngJlUxQJRA6aIQ6uaUVzi/rfO0z55uJ61uW95IVKsqxIzbp9vAll13q0IvI2/0NiKRj6rH9F/xcYftGcBP1VBJF0XTQLSdkFYpkNpDa84aa9MxtboQVUujB6PYKOon+3VAhNkfDtVP8Wy4pLmtWsPD1ReWNRWe58Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bHR0hOQp; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bHR0hOQp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJ74rVVz309v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDE755C64E2;
	Wed, 25 Jun 2025 07:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB70C4CEF7;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835429;
	bh=wPEV3rkHpzYVStrK7S+qOEmN99dY6Jna9uLe/dZKuSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHR0hOQpGCME4HCeGmCX904RXEPw/TVTjCShb++7vtpvuct9mHCrY3zmjEN3EOY1V
	 oc+LTrVLqyi0cKlotcCmSMOB8FKkw8Dd3Fy/b+uePu/qdN6BNQBAULp46mdxxZtTj3
	 mdwTUDBLqYDpifbNeaaeQ5Y0kDbuqjpG5o21k3CGocmTX9Rt78RohLYMG8qkf7vOYp
	 zusgIsPmXgmfMQwmrJPjaMjLTcMADjv8xcxlZYNroQzTFFD97pk5zBP3xV6LX1woWw
	 Qh1iNmOM11c5oKDqBHtp99vPiRBuJPm7QlmTpXX//ENMsdxfQKSS7wycNxJQTFVEuC
	 E+nYupYb1ivkQ==
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
Subject: [PATCH 04/18] lib/crypto: sha512: Reorder some code in sha512.c
Date: Wed, 25 Jun 2025 00:08:05 -0700
Message-ID: <20250625070819.1496119-5-ebiggers@kernel.org>
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

Put the IVs before the round constants, since the IVs are used first.

Put __sha512_final() just above sha384_final() and sha512_final(), which
are the functions that call it.

No code changes other than reordering.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha512.c | 72 ++++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/lib/crypto/sha512.c b/lib/crypto/sha512.c
index e650e2c3317b1..fe9d98b9b7db9 100644
--- a/lib/crypto/sha512.c
+++ b/lib/crypto/sha512.c
@@ -14,10 +14,24 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/wordpart.h>
 
+static const struct sha512_block_state sha384_iv = {
+	.h = {
+		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
+		SHA384_H4, SHA384_H5, SHA384_H6, SHA384_H7,
+	},
+};
+
+static const struct sha512_block_state sha512_iv = {
+	.h = {
+		SHA512_H0, SHA512_H1, SHA512_H2, SHA512_H3,
+		SHA512_H4, SHA512_H5, SHA512_H6, SHA512_H7,
+	},
+};
+
 static const u64 sha512_K[80] = {
 	0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
 	0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
 	0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
 	0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
@@ -44,24 +58,10 @@ static const u64 sha512_K[80] = {
 	0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
 	0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
 	0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL,
 };
 
-static const struct sha512_block_state sha384_iv = {
-	.h = {
-		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
-		SHA384_H4, SHA384_H5, SHA384_H6, SHA384_H7,
-	},
-};
-
-static const struct sha512_block_state sha512_iv = {
-	.h = {
-		SHA512_H0, SHA512_H1, SHA512_H2, SHA512_H3,
-		SHA512_H4, SHA512_H5, SHA512_H6, SHA512_H7,
-	},
-};
-
 #define Ch(x, y, z) ((z) ^ ((x) & ((y) ^ (z))))
 #define Maj(x, y, z) (((x) & (y)) | ((z) & ((x) | (y))))
 #define e0(x) (ror64((x), 28) ^ ror64((x), 34) ^ ror64((x), 39))
 #define e1(x) (ror64((x), 14) ^ ror64((x), 18) ^ ror64((x), 41))
 #define s0(x) (ror64((x), 1) ^ ror64((x), 8) ^ ((x) >> 7))
@@ -134,32 +134,10 @@ sha512_blocks_generic(struct sha512_block_state *state,
 #include "sha512.h" /* $(SRCARCH)/sha512.h */
 #else
 #define sha512_blocks sha512_blocks_generic
 #endif
 
-static void __sha512_final(struct __sha512_ctx *ctx,
-			   u8 *out, size_t digest_size)
-{
-	u64 bitcount_hi = (ctx->bytecount_hi << 3) | (ctx->bytecount_lo >> 61);
-	u64 bitcount_lo = ctx->bytecount_lo << 3;
-	size_t partial = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
-
-	ctx->buf[partial++] = 0x80;
-	if (partial > SHA512_BLOCK_SIZE - 16) {
-		memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - partial);
-		sha512_blocks(&ctx->state, ctx->buf, 1);
-		partial = 0;
-	}
-	memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - 16 - partial);
-	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 16] = cpu_to_be64(bitcount_hi);
-	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 8] = cpu_to_be64(bitcount_lo);
-	sha512_blocks(&ctx->state, ctx->buf, 1);
-
-	for (size_t i = 0; i < digest_size; i += 8)
-		put_unaligned_be64(ctx->state.h[i / 8], out + i);
-}
-
 static void __sha512_init(struct __sha512_ctx *ctx,
 			  const struct sha512_block_state *iv,
 			  u64 initial_bytecount)
 {
 	ctx->state = *iv;
@@ -211,10 +189,32 @@ void __sha512_update(struct __sha512_ctx *ctx, const u8 *data, size_t len)
 	if (len)
 		memcpy(&ctx->buf[partial], data, len);
 }
 EXPORT_SYMBOL_GPL(__sha512_update);
 
+static void __sha512_final(struct __sha512_ctx *ctx,
+			   u8 *out, size_t digest_size)
+{
+	u64 bitcount_hi = (ctx->bytecount_hi << 3) | (ctx->bytecount_lo >> 61);
+	u64 bitcount_lo = ctx->bytecount_lo << 3;
+	size_t partial = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
+
+	ctx->buf[partial++] = 0x80;
+	if (partial > SHA512_BLOCK_SIZE - 16) {
+		memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - partial);
+		sha512_blocks(&ctx->state, ctx->buf, 1);
+		partial = 0;
+	}
+	memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - 16 - partial);
+	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 16] = cpu_to_be64(bitcount_hi);
+	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 8] = cpu_to_be64(bitcount_lo);
+	sha512_blocks(&ctx->state, ctx->buf, 1);
+
+	for (size_t i = 0; i < digest_size; i += 8)
+		put_unaligned_be64(ctx->state.h[i / 8], out + i);
+}
+
 void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE])
 {
 	__sha512_final(&ctx->ctx, out, SHA384_DIGEST_SIZE);
 	memzero_explicit(ctx, sizeof(*ctx));
 }
-- 
2.50.0


