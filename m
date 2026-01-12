Return-Path: <linuxppc-dev+bounces-15565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9FBD14F08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:24:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj394Jqgz2ywy;
	Tue, 13 Jan 2026 06:23:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245813;
	cv=none; b=Em9JYIuzLE/pHT6XpVTCGxBAwJUNq/tSDbMNa23LpcAXwRR5OzP7AyyxrEkoc6rRmakT4MKNOGvg6C1q0vOE8aqWz92If7iKnaEJvsen1H41etebs2EELdYGHxkhIw9qrgB1t5S7bCbED0B5nI6Y6XSfSRI3fSr/1tH5MMxCcSNs2TDBbECIjA3So9/jeLLrl0hVB2pb7Vbh5dP1kvkaGqPTRx1ohNdeoE2N8ORWm/XwW3JTTwM6eQiwrg1pHHb7xQLdaRpgv7OX+LeVYg0KNu+HgSUUv4vg0e/zKkvRjWt8sT3mK4b+DwC4BfjiHvg8OfIAfhSpSOAPsiyp/plBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245813; c=relaxed/relaxed;
	bh=RR5ZFYsG/57JxgYnr/js/tTygCXYA/UUGjCJI42v3HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOf1PgwVevezMESrv28/3QRjcMdLZi3eOB2QXaqbGcqhG4uLFjOjpngp1D7IOHKNMQ9UrGkpXTNwasev9CfU4A79e4t/okRMW894oDTDWsvCtSd3eJTFc6sBCxXqvazl6woi9VMxHqHYxLSaS85I2gkuxvtcEFpIsU9np2ewGn+n+cdWjY2UnweJ+ayj/V9qWTEDO6hA5qmNm8fuRk86HtqKB4n7d8bY1xPa0OKelPJv8KcjJOKOiiagHGBdZdvcIWpzpJa904OFHOSJy5EgfAuxFEoEY80q43jwIYvUmrpzadT0sS5M4XDkixtkU6F6V1cnxdqq4QvgQVV6oTjXIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qJkYL4tl; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qJkYL4tl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3872wLz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAB926011F;
	Mon, 12 Jan 2026 19:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5B2C2BC87;
	Mon, 12 Jan 2026 19:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245810;
	bh=XxVEddn0GZ4fAoRx75wvjk3qCu0xXHueABJbpQv5kcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qJkYL4tlLseMCpjL0U8f9dN8rYOWty3Ia3FUjnNcg7VcooPjVOuyBHwvFmikb5DmU
	 pMtl8HaKrWDzqclqykHr8CmsyWul/bIEeKUlWjzKQ+F0jKg+XwG7e7VHsndtQvTEtZ
	 9f5XMP5x9WrcB8YwEFncIk56cJ8jSp4bcYHgrnHb2B6oz+d656hEfmVICWK40JTNU4
	 oe7522xHypkdJVq/s9K3C/nzvsTCTsM8mL1DYY7ZaPSQwUx3MYpNbwaSLQRBo1XF2G
	 XPJy92dYb9nUXQPduk/5+ffe80SJhQOL8169Svozyyh/NAO7RavagZZj7D1QMvjAhK
	 UTLHZ9ckPvfGw==
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
Subject: [PATCH v2 23/35] crypto: arm/ghash - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:21 -0800
Message-ID: <20260112192035.10427-24-ebiggers@kernel.org>
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
 arch/arm/crypto/ghash-ce-glue.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/crypto/ghash-ce-glue.c b/arch/arm/crypto/ghash-ce-glue.c
index a52dcc8c1e33..454adcc62cc6 100644
--- a/arch/arm/crypto/ghash-ce-glue.c
+++ b/arch/arm/crypto/ghash-ce-glue.c
@@ -202,24 +202,28 @@ int pmull_gcm_dec_final(int bytes, u64 dg[], char *tag,
 
 static int gcm_aes_setkey(struct crypto_aead *tfm, const u8 *inkey,
 			  unsigned int keylen)
 {
 	struct gcm_key *ctx = crypto_aead_ctx(tfm);
-	struct crypto_aes_ctx aes_ctx;
+	struct aes_enckey aes_key;
 	be128 h, k;
 	int ret;
 
-	ret = aes_expandkey(&aes_ctx, inkey, keylen);
+	ret = aes_prepareenckey(&aes_key, inkey, keylen);
 	if (ret)
 		return -EINVAL;
 
-	aes_encrypt(&aes_ctx, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});
+	aes_encrypt(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});
 
-	memcpy(ctx->rk, aes_ctx.key_enc, sizeof(ctx->rk));
+	/*
+	 * Note: this assumes that the arm implementation of the AES library
+	 * stores the standard round keys in k.rndkeys.
+	 */
+	memcpy(ctx->rk, aes_key.k.rndkeys, sizeof(ctx->rk));
 	ctx->rounds = 6 + keylen / 4;
 
-	memzero_explicit(&aes_ctx, sizeof(aes_ctx));
+	memzero_explicit(&aes_key, sizeof(aes_key));
 
 	ghash_reflect(ctx->h[0], &k);
 
 	h = k;
 	gf128mul_lle(&h, &k);
-- 
2.52.0


