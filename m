Return-Path: <linuxppc-dev+bounces-15221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F827CF1E4E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:16:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yb3fZrz30Vf;
	Mon, 05 Jan 2026 16:15:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590115;
	cv=none; b=OuDbph/y3qhX+24T+A+4BytStePy4IEMBPSjhWHIkVghOSdCkhfh/uqiVGTIXnD0G/Xe5UPVUDpl10euuWCsJAvGbLYXuLUyKnDwv8fyDcv8tFJ7/6dEk94Xp0jJI/S1tawu/cbk8EqGe4b1OnS8SfuVR13D7d3l/mjoh77OeZZor9ZfvlE7gHab2S6QUFtAuHY3RHsjdEKit2qdozTg797mpRwnm6KcLxPe2dYe60flsy/jZGDDfbC5myEOKM4S1CXIBkbkoPxz0xj1lQr6ji4zN5I98GAOQHZPGNoGFwDVJAk9I2u80FPf4D1rzsgjPOGyZHrKZKySNCZkK7TpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590115; c=relaxed/relaxed;
	bh=mh/d+16pzmf4GdRvtsnQAqjyYw0NOnZbDH3IYZgbLNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSSll0sMhGlikeLcl4uQkHEiv3n2RIoxcA3gk4swcqrxhww2uaodwnF+i9NNnNRjh5Okwk2K894EQBZpRrF5b62hvczzpQKCh5Hb1lHEVNMaC1S4awoWrIK4TdxbuYgbybrRiUCfV/3dPKqSFdjHkxAj3/7j87U6ZTea5MLjgLM+tthFzo0KEbLNMEk/TLa1wvdtRiC5tc4Z1lX0vn97rfASrZfLxK+ELreRA5RnjWfyNaV7Nvlgx2BclVq1oDHniqQfk7pz0LIqyGwpg/H83hxeYs65xbVCtwklKMbecPksPKSv32xVwbIteCQlvTXGGR8C7vrDt6rO74L9SSi4HA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WXSvV+Xi; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WXSvV+Xi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YX1fS4z2yxl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9282944132;
	Mon,  5 Jan 2026 05:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F59C2BC9E;
	Mon,  5 Jan 2026 05:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590109;
	bh=51MqJUw9vLPBjNhyqGm5KNGeBpiM474Yq2fJhY4WaSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WXSvV+XiKYdSDaoLylpVKvfPU5H02g22cONeH1AE5K3CY4QrcH+VLEe11L7WHbJzn
	 LQSqWGsgWEKCMoMaJYF+Xm5hEC43m4LeRGnKUyEVoUIPotAd44MP8wSybbaCCCat5j
	 CGqKTFDxES3LadpubNdtviwiZrJmeaUai+ibeYgYsbYGBRLhyHu5ON/yBoS0ncX7MN
	 Yl52+ZfRZsgz0TFx6YNmC1QuRryhC97RyS1FEX7bJUtKL6X9rXiLOevoqJksUXWwLk
	 owp7xxBpt2wAiibDSu/dC8MrjseY1KJivEQJxFhwfVwfauU8c3ADjYkexSt0lke601
	 5A/r1MY4KeGyg==
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
Subject: [PATCH 28/36] crypto: crypto4xx - Use new AES library API
Date: Sun,  4 Jan 2026 21:13:01 -0800
Message-ID: <20260105051311.1607207-29-ebiggers@kernel.org>
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
 drivers/crypto/amcc/crypto4xx_alg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/amcc/crypto4xx_alg.c b/drivers/crypto/amcc/crypto4xx_alg.c
index 38e8a61e9166..1947708334ef 100644
--- a/drivers/crypto/amcc/crypto4xx_alg.c
+++ b/drivers/crypto/amcc/crypto4xx_alg.c
@@ -489,23 +489,23 @@ static int crypto4xx_aes_gcm_validate_keylen(unsigned int keylen)
 }
 
 static int crypto4xx_compute_gcm_hash_key_sw(__le32 *hash_start, const u8 *key,
 					     unsigned int keylen)
 {
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 	uint8_t src[16] = { 0 };
 	int rc;
 
-	rc = aes_expandkey(&ctx, key, keylen);
+	rc = aes_prepareenckey(&aes, key, keylen);
 	if (rc) {
-		pr_err("aes_expandkey() failed: %d\n", rc);
+		pr_err("aes_prepareenckey() failed: %d\n", rc);
 		return rc;
 	}
 
-	aes_encrypt(&ctx, src, src);
+	aes_encrypt_new(&aes, src, src);
 	crypto4xx_memcpy_to_le32(hash_start, src, 16);
-	memzero_explicit(&ctx, sizeof(ctx));
+	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 int crypto4xx_setkey_aes_gcm(struct crypto_aead *cipher,
 			     const u8 *key, unsigned int keylen)
-- 
2.52.0


