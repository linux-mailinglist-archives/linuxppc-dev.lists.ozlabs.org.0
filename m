Return-Path: <linuxppc-dev+bounces-15225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD55CF1E6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:17:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yf422Mz2yvV;
	Mon, 05 Jan 2026 16:15:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590118;
	cv=none; b=EsE79C8hTdgWHc/u/Yo8gn1A0bVe1vpyOI8acMFTD2TjrYV5StslNxwhkueROy6mTN8Y+/xibPgNu3aU4dVgA29UZm5dMoMm2CCYPrfULHuPzwrO/EgYG8FsTbHxKqGIzaJYtrIB/s7x8Ddw8uOnP0nbhNITRRg61JO4RpJSOxMScOWAiaqcBZt2pFr+Q4e/f8Tm58BReEc+Tx5FlIyGLXgaLELRbqF86hym/egjGcs4tBufOjkWqVUOSLYeh4noQLCdjwyI+HNDTqkyoFX6ij26/emAv2z1+LYhxy1iJXUtxCNcyQtYiG7CkMfNt5CzPyNY07mI73O+3fSgWxGn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590118; c=relaxed/relaxed;
	bh=Zdbutd7xk34HtAtvqrcQVwED4CYvcEnoDCthOylDXvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YponhQLuYwVff/s00moztMwhRhYyzjtUXPJiXRRMDWmYUMYbuRKjVUHaRIQTXozrdruU8dMNPJ+Vwt6roIoey/O4Wa6DKSGzti05RbAbNCeSpR1y5O+6axWzf3HqGY1tFUZUGfiJODp0DYtFk5QAZwilP9T9nOdcQtEs0QwDnDboqXJnBvN46JgExxuv8RpqEzmK279SKPE2+pqV4STrnvIWYagBYPYQCB5G/A06viI/8kCgoY8sTrxSFEXlCnAukDlSyUiBN2NRdLqfVD2ZurhLQbUPAlTrwoe5zAFJbPRat42RLgVTdvQSwV5Cv8QXV/BhNwNybnWlOzH0w8tasQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=COMWjura; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=COMWjura;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YY6v7Lz30PH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B30560143;
	Mon,  5 Jan 2026 05:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF868C19424;
	Mon,  5 Jan 2026 05:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590111;
	bh=aczZF388MJyjmHPpFhPybAXNgrNBDPfQD3X1AxBltYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=COMWjurarSx0tc1u0S//8fc2KTuNtS7ijGjFRXrLCJRnu+BuhGv5rgrBzbQUJ9eF5
	 fVBqlLQCuTXn/8/pQ/36762MnXgp49Y/vHrPz+Wy10++9qVLD712eBBI3lj9aXnofW
	 w9BoBKOvqzQIGb/Y3WbOUvJy4+90x0vv1nkK6HHPztOSezbco4jwJZe26f9WBPqpFS
	 Y33A2c+vhXOxvM9uuhpD/HfuD9O3XcHzM9gQcrRCNuE3jgGt8ftga6xph8pPM2WNwy
	 LnP5SXRnh6sRdcCJDF0YTvrEIRBr9CnT0phwNCdB/LyCfXliTTCkqThp8KHp5P5g2+
	 PtPGFK4PWLXCg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 31/36] crypto: omap - Use new AES library API
Date: Sun,  4 Jan 2026 21:13:04 -0800
Message-ID: <20260105051311.1607207-32-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note: aes_encrypt_new() will be renamed to aes_encrypt() once all
callers of the old aes_encrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/omap-aes-gcm.c | 6 +++---
 drivers/crypto/omap-aes.h     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index 1f4586509ca4..efe94a983589 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -175,11 +175,11 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 
 static int do_encrypt_iv(struct aead_request *req, u32 *tag, u32 *iv)
 {
 	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
 
-	aes_encrypt(&ctx->actx, (u8 *)tag, (u8 *)iv);
+	aes_encrypt_new(&ctx->akey, (u8 *)tag, (const u8 *)iv);
 	return 0;
 }
 
 void omap_aes_gcm_dma_out_callback(void *data)
 {
@@ -312,11 +312,11 @@ int omap_aes_gcm_setkey(struct crypto_aead *tfm, const u8 *key,
 			unsigned int keylen)
 {
 	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(tfm);
 	int ret;
 
-	ret = aes_expandkey(&ctx->actx, key, keylen);
+	ret = aes_prepareenckey(&ctx->akey, key, keylen);
 	if (ret)
 		return ret;
 
 	memcpy(ctx->octx.key, key, keylen);
 	ctx->octx.keylen = keylen;
@@ -332,11 +332,11 @@ int omap_aes_4106gcm_setkey(struct crypto_aead *tfm, const u8 *key,
 
 	if (keylen < 4)
 		return -EINVAL;
 	keylen -= 4;
 
-	ret = aes_expandkey(&ctx->actx, key, keylen);
+	ret = aes_prepareenckey(&ctx->akey, key, keylen);
 	if (ret)
 		return ret;
 
 	memcpy(ctx->octx.key, key, keylen);
 	memcpy(ctx->octx.nonce, key + keylen, 4);
diff --git a/drivers/crypto/omap-aes.h b/drivers/crypto/omap-aes.h
index 99c36a777e97..6aa70bde387a 100644
--- a/drivers/crypto/omap-aes.h
+++ b/drivers/crypto/omap-aes.h
@@ -96,11 +96,11 @@ struct omap_aes_ctx {
 	struct crypto_skcipher	*fallback;
 };
 
 struct omap_aes_gcm_ctx {
 	struct omap_aes_ctx	octx;
-	struct crypto_aes_ctx	actx;
+	struct aes_enckey	akey;
 };
 
 struct omap_aes_reqctx {
 	struct omap_aes_dev *dd;
 	unsigned long mode;
-- 
2.52.0


