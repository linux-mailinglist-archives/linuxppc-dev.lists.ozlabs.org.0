Return-Path: <linuxppc-dev+bounces-15566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB6D14F19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:25:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3B4GgRz2yvv;
	Tue, 13 Jan 2026 06:23:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245814;
	cv=none; b=OMXWOnyw84zhrEPSC5vuIBdXL2MLSlJyBBiC1XTT8mdKNhBdW1T8jIVitjo18F1lnrl1/y9h4ECZtwJkzdFtGYAqo2vKbGrg1wlLUlIu8ypR4A7oAQMdLy5zJb/+p2aEt2eVpDv3AfGYDxw1n42Y8kfnDbmUbJ8JWic5IAQ2Yi4c7t/R2CrXELOaJJMk7z6KoXXyB3H/agwLj/nU2cNc3AsoW1ZJsRVo7Kcy7k3AHF9RkyC0nqUCVTLiC0Tih3+qzBWD8NWl2M8/TABpNvFG4g106EgRB7SWV+fZqlR8aR5xoDCGVYW9RwzrTVZhe3XiaUY75zGDXOwnjnEV4IdJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245814; c=relaxed/relaxed;
	bh=IyWtQoy5CZLOtJ00v3/DvPLSKe7LSHvJiVXyBHs4Z0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8M12rQHnm3967hV6Als3lbs5ed6JOQomOtDQsyOk+hjOaaL6ilMor6EcFStRHeHQ73WcPlXXuEzs6/zOGkEGV30NQJUfCap6aQlGdUi+9y7fpQ/QJdbCRNEQlxfYrfhrGqop0LYPa5zJJ1d4Eb4o3uO56DBh7won8qNSUvCPrC55p0VEyGYmbgahNoN9vHEi2h0Pxs0W+xzpCL3fdcwQ17mXingeUVu38c2BJe7u2IDJPOQ3D3kXTNC0qhOXXs7HwY4YgXpb5uwphpDsoyW5wWzRFhabeDpSpGI74saxioTXjuh5/Memny8SiNcrU3EMW6a9hgKuBRLRgJFUHpZOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SmkNXd0h; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SmkNXd0h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3972Jgz302l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80C4A443CE;
	Mon, 12 Jan 2026 19:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF904C2BC86;
	Mon, 12 Jan 2026 19:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245813;
	bh=GPQcbp+wkmbK7/Rcub4Dq0N8RBzNaIdUT4Zzk3rORWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SmkNXd0hD/a01rRbzRoTIUUxSVbiJvtS+SpBFPSqlginPRz7r1QpIVUkNBhUwlClB
	 wu7xWBaWVGiKfKI9UnXxuZtlKeU8IiiMoqEFFelz3rk02+N6/Ank4/srRBvn70In9G
	 TW3YnOBfyBvX8uDGz5ETCyjwSMU7T2kILTMPcTbBiDJx863zpNVbcPeU2e8YeqUDme
	 OKVwnwn6rI4vz1BrTpM6yj2boVtQGcfUBLdrDX6PC76mEZZDQv8p+qcrg9dMkE9RcZ
	 2/n/32QyL0RrxoLGdj2WxAIAMcosZ6xQGFyXIiGN3aSSA9+IaoKihFMAyf5aRVrEQR
	 cNQ3vcNviQ8PQ==
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
Subject: [PATCH v2 28/35] crypto: crypto4xx - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:26 -0800
Message-ID: <20260112192035.10427-29-ebiggers@kernel.org>
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
 drivers/crypto/amcc/crypto4xx_alg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/amcc/crypto4xx_alg.c b/drivers/crypto/amcc/crypto4xx_alg.c
index 38e8a61e9166..3177dc4f5f7b 100644
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
+	aes_encrypt(&aes, src, src);
 	crypto4xx_memcpy_to_le32(hash_start, src, 16);
-	memzero_explicit(&ctx, sizeof(ctx));
+	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 int crypto4xx_setkey_aes_gcm(struct crypto_aead *cipher,
 			     const u8 *key, unsigned int keylen)
-- 
2.52.0


