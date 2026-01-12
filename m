Return-Path: <linuxppc-dev+bounces-15586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 675A8D14FDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3l4yVBz3cZ4;
	Tue, 13 Jan 2026 06:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245843;
	cv=none; b=QZiAXycy+7xgvCHizAqALnrqYkUK+22lchkXnVyEyUFsEu9irtbFP1YjuAX1/kjzKhOO1HsssuvRXX2gZ41Zm3eBOezfc3wg3Hpfy2mvsA97o4s13Up9SD8ztBUUsCRtnNiOsRCM+jKg6SqI2KsCZgHgtkrNejgmqppUw1NSAx9l7oWO59Sp6WD0ZSecS4TR2kUpDH5giIoZj5d5j15z8f/04zgX8i1pKF02FR19QE4qUODKCFLVTYPJbj6Ca4MBMUgQ29B2OH0JCuxnmh5+ddaSLrzQtfd6if5f6/s1zqNM9p5ALed2hEtQ646OP060VpGy40hvaYrznv/TEr/rVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245843; c=relaxed/relaxed;
	bh=OMxlSvPQL7S3V41U4MUzI5yC5X7IcvJTh/x5oQJm1eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkOUdG7HA4K3Ysy8VsU8XxX3RRnfdECEXFMNRIGCxgZptyXMdHZOrwjIsOMoIolTq7Ubm2lZtbnkrMyoq8zFO3CF0/OnFdypQk5x9KNpqOPvoBxYbE9jIOqLItK+PSk14QdYnDSuB3LKFhLoJFEg87tUOiQLD73DeKH88pCxPh8mgauo6I8oKQQ8/igbG6hBLtlbiABHqjrfsxQtTqSq2ZM1NallDu5IRUaqmAyIj+hV930l7+/dbZaCp0QsclLqK9I1R0J0qgohvyOKPrwhFeLX9QQlwgMgUzk6wodVLPatSFak4t+B+ibMu/1c6PJ6+6szA0mFg28l442tSxDfbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gj85ij8q; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gj85ij8q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3k6fSwz3c3g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:24:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5112060055;
	Mon, 12 Jan 2026 19:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A322C2BC86;
	Mon, 12 Jan 2026 19:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245810;
	bh=wXdwY1WoVa5ZNu1Fe87Z9mILsLA3s28tZHNhWF6S8gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gj85ij8qJIew+bWKcniT1QlwS/ryjNF9CQBcnJ8+C99RNEOoBqERPk4+1FRbNhhw0
	 FZGVIA1d56xRQ+5i2prmCgQ5T+K156MKnGC9hAtOYNu+5kRR2YT0qGwptAkoCBCf54
	 rDdZRiy4YuiA9Tsxq+bEV3KDyjzv6XZto+e39v5MAzqLjDYypucU44X5+AGKiAuMm1
	 gVy605yDG4qjxS5/wUd5S5E9WiRd3DZKQ3uVMlmVp9KBGAKsdjvi+/8jWGd1aisRvp
	 db/Cr2lSi0DrDychLsRvaGIBD9agCrol/u3YT7AOB4sZgb0wbn1k5hbcfcWAHgexUs
	 LUbeyOTiy34tg==
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
Subject: [PATCH v2 22/35] staging: rtl8723bs: core: Use new AES library API
Date: Mon, 12 Jan 2026 11:20:20 -0800
Message-ID: <20260112192035.10427-23-ebiggers@kernel.org>
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
 drivers/staging/rtl8723bs/core/rtw_security.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..8ee5bed252bf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -635,15 +635,15 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 /* Performs a 128 bit AES encrypt with  */
 /* 128 bit data.                        */
 /****************************************/
 static void aes128k128d(u8 *key, u8 *data, u8 *ciphertext)
 {
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 
-	aes_expandkey(&ctx, key, 16);
-	aes_encrypt(&ctx, ciphertext, data);
-	memzero_explicit(&ctx, sizeof(ctx));
+	aes_prepareenckey(&aes, key, 16);
+	aes_encrypt(&aes, ciphertext, data);
+	memzero_explicit(&aes, sizeof(aes));
 }
 
 /************************************************/
 /* construct_mic_iv()                           */
 /* Builds the MIC IV from header fields and PN  */
@@ -1404,17 +1404,17 @@ static void gf_mulx(u8 *pad)
  * (SP) 800-38B.
  */
 static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 				u8 *addr[], size_t *len, u8 *mac)
 {
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 	u8 cbc[AES_BLOCK_SIZE], pad[AES_BLOCK_SIZE];
 	u8 *pos, *end;
 	size_t i, e, left, total_len;
 	int ret;
 
-	ret = aes_expandkey(&ctx, key, 16);
+	ret = aes_prepareenckey(&aes, key, 16);
 	if (ret)
 		return -1;
 	memset(cbc, 0, AES_BLOCK_SIZE);
 
 	total_len = 0;
@@ -1434,16 +1434,16 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 				pos = addr[e];
 				end = pos + len[e];
 			}
 		}
 		if (left > AES_BLOCK_SIZE)
-			aes_encrypt(&ctx, cbc, cbc);
+			aes_encrypt(&aes, cbc, cbc);
 		left -= AES_BLOCK_SIZE;
 	}
 
 	memset(pad, 0, AES_BLOCK_SIZE);
-	aes_encrypt(&ctx, pad, pad);
+	aes_encrypt(&aes, pad, pad);
 	gf_mulx(pad);
 
 	if (left || total_len == 0) {
 		for (i = 0; i < left; i++) {
 			cbc[i] ^= *pos++;
@@ -1457,12 +1457,12 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 		gf_mulx(pad);
 	}
 
 	for (i = 0; i < AES_BLOCK_SIZE; i++)
 		pad[i] ^= cbc[i];
-	aes_encrypt(&ctx, pad, mac);
-	memzero_explicit(&ctx, sizeof(ctx));
+	aes_encrypt(&aes, pad, mac);
+	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 /**
  * omac1_aes_128 - One-Key CBC MAC (OMAC1) hash with AES-128 (aka AES-CMAC)
-- 
2.52.0


