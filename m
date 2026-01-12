Return-Path: <linuxppc-dev+bounces-15569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 864FED14F2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:25:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3D2kVJz30Vq;
	Tue, 13 Jan 2026 06:23:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245816;
	cv=none; b=ah9pcbNJWqiKSMulEOToYB8q9izcNRGs/NyZnRbKrhbb4puFbNJzbxucEFXri04ZPdfvSI41ir0w1Tmf2nfRUZsI9US18StFRYDC8T0ThFGrztIu0A4LhqhbX4Su7dVV5MNGPo9iwsNX/EKNBOeV5X1jI5guxuPcTnJ20elaVBWkMgqoDTihzRoitxueejHBag2ZEymA5PTbaQcfoObUFgxbMI5ppXbiGC3iILXqoXIz1zCq77Wf+j5MjDnvvDC65QO4+JIZ7LhwXzVaseSdAUfsT/OEhE98O3mlLRwQYzQoYSdyRhmU/adw3wzl4EJp/sfT/735mFU7kHjz/01J3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245816; c=relaxed/relaxed;
	bh=DWUiS6AJQJZcAWVdakexnBMIfXhXehTznfwkYQW9Ms4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fL9TzjnzxbOpgoPrkAG1zXe49XX40vvyQUhZ8XsCsZkUy+1HUlEoI5Wo6dovEADepLdkw1CLJkvLirMHA2RVUS+hDa9CLGVT/LUaO+CRf5zQXPpXqWadmFLW9tWKTm0NVlc3KEfgOutI1kKlLZSjqwE4xHSUlunfett4Ovm/NRcsuv5eu0FoOXwD/yn9pFQsiHOcfty0ZrUdcZgJd1dS57k8+eptNmsciPbvSrHwXE6M3IBkqmKr0JFR6aDMixk+XPSF13EAM5wqILkJjih4COL4GXg3Xk+zQPDg5NU9M8Z3n0osFPdV/HOncAQtR4q37cRe3wEqqueQTlGVflOZgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m+iQkfre; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m+iQkfre;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3C30NTz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2292344404;
	Mon, 12 Jan 2026 19:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D62C2BC9E;
	Mon, 12 Jan 2026 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245815;
	bh=o3zwy8vdt1uNhlRXa37yap+uRed8L836MSpoje1i5gA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+iQkfrebqurkYNcMsEDhd2QqbiCtp7wnSgHoAica72oEzTDfUKkSMUWZXpuRb9em
	 1Do/8hqedeDta5gxo8MqlDW61v9x7Q7vZTzXp2TkY2U7zjXVxEQdDb5Tc0XzAX7VVU
	 9TKEdQm8jHgXrAALBCww1rQnpHL301XBCKXcpnpH8fVqyvtxN0AZzZ4xBw/eYgSrKk
	 cV3ifLIvrwSzEZQPhWE6hzNHFva8oR20xdbCbycacxePJ6OtQUL7re5uWOMRmer5Mp
	 aKzUopZrsfMlXGNoISdPApHFyM2o8Bm7RRE27u6Iu2eUcffx29++btLMVG3D96Ohac
	 Y99nAkUMvYzgA==
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
Subject: [PATCH v2 31/35] crypto: omap - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:29 -0800
Message-ID: <20260112192035.10427-32-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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

Note that in addition to the change in the key preparation function and
the key struct type itself, the change in the type of the key struct
results in aes_encrypt() (which is temporarily a type-generic macro)
calling the new encryption function rather than the old one.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/omap-aes-gcm.c | 6 +++---
 drivers/crypto/omap-aes.h     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index 1f4586509ca4..c652f9d0062f 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -175,11 +175,11 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 
 static int do_encrypt_iv(struct aead_request *req, u32 *tag, u32 *iv)
 {
 	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
 
-	aes_encrypt(&ctx->actx, (u8 *)tag, (u8 *)iv);
+	aes_encrypt(&ctx->akey, (u8 *)tag, (const u8 *)iv);
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


