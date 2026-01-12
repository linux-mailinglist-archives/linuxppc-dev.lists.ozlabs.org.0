Return-Path: <linuxppc-dev+bounces-15570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AEFD14F3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:25:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3D5tymz30WT;
	Tue, 13 Jan 2026 06:23:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245816;
	cv=none; b=lBqLQWGyaVsyW+M0UFOqhep5njeswM4ttCFjNWiK5FZzK0OAnL5THJ2MLhbGxS+Llr4Rz7oKmKTROtTO7vIEwXnfGQYH69HYoxz729c0+4RpLhJvkGMT+sTahXQT8oibWZCCnHm/0jEJOwv6oEpqBCS5gA5V/6Fetb0lEjsuERElujqa/d18Y8v+XEZQdcB54UJ59fD7tdsqeS3JoYFHJ9ezJNNzOxOUC81UlXA0HXA502VkzFqfxU19FGk0yZQ6qwaroz22m/uZLtHFCS9PB2cR/y81ES1XXqKrKRnWzbGsSZ6M0IBurskw55yrYUCZqJue8ATOBlI0L3SJXCAXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245816; c=relaxed/relaxed;
	bh=KpIe2rpQpLZfztXdTuzMDMMPDAEpP3pXswaNe/cBIQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ghti6LW622i6KgQ2T1c0lyqsl4pk7o+VIeFWOs87yTHUTuT8+a8gF4muNfoe/ZJW+nxCi7LcUJTurT2N3eb/6VL1ZH4nZ1WIeqx69utG7DBKDvwwXNYU0hRwpyO4KaLZKN7M4H5KPVDTCQmvrFVUplVDaoezfFw6zLDwxQBtJIEkhe3W6rQih0fbIpBOGzIZ9v/cx0RtdmUGQ2u8j1DjyEWCc0ZY/633/Jopg7F7+WaQMY+wOdU2alBa2Pib392MLvVgtNCrYId11+Qb+dT5kVSLJvzfO7GI2VMi/54BNlKzNd87xIPcU08IAuTHIhJGsv+yR1n460wzdaNTsoX4hA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X+MPGuKb; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X+MPGuKb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3C4Hs3z30V1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DE3C44403;
	Mon, 12 Jan 2026 19:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED5EC19425;
	Mon, 12 Jan 2026 19:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245813;
	bh=BBKB65xS0OpZpUhmAej3YWy5tO0vX+fEXhT2Dx9/+hQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X+MPGuKbhpS7/FgOBDKBzcyb8WMNKxVDlbJDnBswswVQjNTyepUQk3tSVY14vE2zG
	 UX57SThhUr6Rv+zmecFVUL2A4P+qu9QTjUEyKTZav5Gh2dKxYHvAMSCcQhXmTNnuwP
	 tLQMKrNcAajFMfItPOX1wSFsknV6Co/uCfzKLKNTgNifbkU7gxwh/q3sATLoURCx2z
	 gr0Tqh7T9MZCcuPbyEwXmKyevYKB/i8+EKi0FtQ3ug05KV0iq0dR7aeHRx+JyVWpzE
	 sIlhv3742IeqSPA8e9lIewSPkEJz1LGVfF+7jYw296kTbwivG2Ax+nyMLnnTsZwvdg
	 lrCYmNH+jyOcg==
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
Subject: [PATCH v2 29/35] crypto: drbg - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:27 -0800
Message-ID: <20260112192035.10427-30-ebiggers@kernel.org>
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
 crypto/df_sp80090a.c                | 30 ++++++++++-------------------
 crypto/drbg.c                       | 12 ++++++------
 drivers/crypto/xilinx/xilinx-trng.c |  8 ++++----
 include/crypto/df_sp80090a.h        |  2 +-
 4 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/crypto/df_sp80090a.c b/crypto/df_sp80090a.c
index dc63b31a93fc..b8134be6f7ad 100644
--- a/crypto/df_sp80090a.c
+++ b/crypto/df_sp80090a.c
@@ -12,31 +12,21 @@
 #include <linux/string.h>
 #include <crypto/aes.h>
 #include <crypto/df_sp80090a.h>
 #include <crypto/internal/drbg.h>
 
-static void drbg_kcapi_symsetkey(struct crypto_aes_ctx *aesctx,
-				 const unsigned char *key,
-				 u8 keylen);
-static void drbg_kcapi_symsetkey(struct crypto_aes_ctx *aesctx,
-				 const unsigned char *key, u8 keylen)
-{
-	aes_expandkey(aesctx, key, keylen);
-}
-
-static void drbg_kcapi_sym(struct crypto_aes_ctx *aesctx,
-			   unsigned char *outval,
+static void drbg_kcapi_sym(struct aes_enckey *aeskey, unsigned char *outval,
 			   const struct drbg_string *in, u8 blocklen_bytes)
 {
 	/* there is only component in *in */
 	BUG_ON(in->len < blocklen_bytes);
-	aes_encrypt(aesctx, outval, in->buf);
+	aes_encrypt(aeskey, outval, in->buf);
 }
 
 /* BCC function for CTR DRBG as defined in 10.4.3 */
 
-static void drbg_ctr_bcc(struct crypto_aes_ctx *aesctx,
+static void drbg_ctr_bcc(struct aes_enckey *aeskey,
 			 unsigned char *out, const unsigned char *key,
 			 struct list_head *in,
 			 u8 blocklen_bytes,
 			 u8 keylen)
 {
@@ -45,30 +35,30 @@ static void drbg_ctr_bcc(struct crypto_aes_ctx *aesctx,
 	short cnt = 0;
 
 	drbg_string_fill(&data, out, blocklen_bytes);
 
 	/* 10.4.3 step 2 / 4 */
-	drbg_kcapi_symsetkey(aesctx, key, keylen);
+	aes_prepareenckey(aeskey, key, keylen);
 	list_for_each_entry(curr, in, list) {
 		const unsigned char *pos = curr->buf;
 		size_t len = curr->len;
 		/* 10.4.3 step 4.1 */
 		while (len) {
 			/* 10.4.3 step 4.2 */
 			if (blocklen_bytes == cnt) {
 				cnt = 0;
-				drbg_kcapi_sym(aesctx, out, &data, blocklen_bytes);
+				drbg_kcapi_sym(aeskey, out, &data, blocklen_bytes);
 			}
 			out[cnt] ^= *pos;
 			pos++;
 			cnt++;
 			len--;
 		}
 	}
 	/* 10.4.3 step 4.2 for last block */
 	if (cnt)
-		drbg_kcapi_sym(aesctx, out, &data, blocklen_bytes);
+		drbg_kcapi_sym(aeskey, out, &data, blocklen_bytes);
 }
 
 /*
  * scratchpad usage: drbg_ctr_update is interlinked with crypto_drbg_ctr_df
  * (and drbg_ctr_bcc, but this function does not need any temporary buffers),
@@ -108,11 +98,11 @@ static void drbg_ctr_bcc(struct crypto_aes_ctx *aesctx,
  *			possibilities.
  * refer to crypto_drbg_ctr_df_datalen() to get required length
  */
 
 /* Derivation Function for CTR DRBG as defined in 10.4.2 */
-int crypto_drbg_ctr_df(struct crypto_aes_ctx *aesctx,
+int crypto_drbg_ctr_df(struct aes_enckey *aeskey,
 		       unsigned char *df_data, size_t bytes_to_return,
 		       struct list_head *seedlist,
 		       u8 blocklen_bytes,
 		       u8 statelen)
 {
@@ -185,11 +175,11 @@ int crypto_drbg_ctr_df(struct crypto_aes_ctx *aesctx,
 		 * holds zeros after allocation -- even the increment of i
 		 * is irrelevant as the increment remains within length of i
 		 */
 		drbg_cpu_to_be32(i, iv);
 		/* 10.4.2 step 9.2 -- BCC and concatenation with temp */
-		drbg_ctr_bcc(aesctx, temp + templen, K, &bcc_list,
+		drbg_ctr_bcc(aeskey, temp + templen, K, &bcc_list,
 			     blocklen_bytes, keylen);
 		/* 10.4.2 step 9.3 */
 		i++;
 		templen += blocklen_bytes;
 	}
@@ -199,19 +189,19 @@ int crypto_drbg_ctr_df(struct crypto_aes_ctx *aesctx,
 	drbg_string_fill(&cipherin, X, blocklen_bytes);
 
 	/* 10.4.2 step 12: overwriting of outval is implemented in next step */
 
 	/* 10.4.2 step 13 */
-	drbg_kcapi_symsetkey(aesctx, temp, keylen);
+	aes_prepareenckey(aeskey, temp, keylen);
 	while (generated_len < bytes_to_return) {
 		short blocklen = 0;
 		/*
 		 * 10.4.2 step 13.1: the truncation of the key length is
 		 * implicit as the key is only drbg_blocklen in size based on
 		 * the implementation of the cipher function callback
 		 */
-		drbg_kcapi_sym(aesctx, X, &cipherin, blocklen_bytes);
+		drbg_kcapi_sym(aeskey, X, &cipherin, blocklen_bytes);
 		blocklen = (blocklen_bytes <
 				(bytes_to_return - generated_len)) ?
 			    blocklen_bytes :
 				(bytes_to_return - generated_len);
 		/* 10.4.2 step 13.2 and 14 */
diff --git a/crypto/drbg.c b/crypto/drbg.c
index 1d433dae9955..85cc4549bd58 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -1503,13 +1503,13 @@ static int drbg_kcapi_hash(struct drbg_state *drbg, unsigned char *outval,
 #endif /* (CONFIG_CRYPTO_DRBG_HASH || CONFIG_CRYPTO_DRBG_HMAC) */
 
 #ifdef CONFIG_CRYPTO_DRBG_CTR
 static int drbg_fini_sym_kernel(struct drbg_state *drbg)
 {
-	struct crypto_aes_ctx *aesctx =	(struct crypto_aes_ctx *)drbg->priv_data;
+	struct aes_enckey *aeskey = drbg->priv_data;
 
-	kfree(aesctx);
+	kfree(aeskey);
 	drbg->priv_data = NULL;
 
 	if (drbg->ctr_handle)
 		crypto_free_skcipher(drbg->ctr_handle);
 	drbg->ctr_handle = NULL;
@@ -1524,20 +1524,20 @@ static int drbg_fini_sym_kernel(struct drbg_state *drbg)
 	return 0;
 }
 
 static int drbg_init_sym_kernel(struct drbg_state *drbg)
 {
-	struct crypto_aes_ctx *aesctx;
+	struct aes_enckey *aeskey;
 	struct crypto_skcipher *sk_tfm;
 	struct skcipher_request *req;
 	unsigned int alignmask;
 	char ctr_name[CRYPTO_MAX_ALG_NAME];
 
-	aesctx = kzalloc(sizeof(*aesctx), GFP_KERNEL);
-	if (!aesctx)
+	aeskey = kzalloc(sizeof(*aeskey), GFP_KERNEL);
+	if (!aeskey)
 		return -ENOMEM;
-	drbg->priv_data = aesctx;
+	drbg->priv_data = aeskey;
 
 	if (snprintf(ctr_name, CRYPTO_MAX_ALG_NAME, "ctr(%s)",
 	    drbg->core->backend_cra_name) >= CRYPTO_MAX_ALG_NAME) {
 		drbg_fini_sym_kernel(drbg);
 		return -EINVAL;
diff --git a/drivers/crypto/xilinx/xilinx-trng.c b/drivers/crypto/xilinx/xilinx-trng.c
index db0fbb28ff32..5276ac2d82bb 100644
--- a/drivers/crypto/xilinx/xilinx-trng.c
+++ b/drivers/crypto/xilinx/xilinx-trng.c
@@ -58,11 +58,11 @@
 
 struct xilinx_rng {
 	void __iomem *rng_base;
 	struct device *dev;
 	unsigned char *scratchpadbuf;
-	struct crypto_aes_ctx *aesctx;
+	struct aes_enckey *aeskey;
 	struct mutex lock;	/* Protect access to TRNG device */
 	struct hwrng trng;
 };
 
 struct xilinx_rng_ctx {
@@ -196,11 +196,11 @@ static int xtrng_reseed_internal(struct xilinx_rng *rng)
 
 	/* collect random data to use it as entropy (input for DF) */
 	ret = xtrng_collect_random_data(rng, entropy, TRNG_SEED_LEN_BYTES, true);
 	if (ret != TRNG_SEED_LEN_BYTES)
 		return -EINVAL;
-	ret = crypto_drbg_ctr_df(rng->aesctx, rng->scratchpadbuf,
+	ret = crypto_drbg_ctr_df(rng->aeskey, rng->scratchpadbuf,
 				 TRNG_SEED_LEN_BYTES, &seedlist, AES_BLOCK_SIZE,
 				 TRNG_SEED_LEN_BYTES);
 	if (ret)
 		return ret;
 
@@ -347,12 +347,12 @@ static int xtrng_probe(struct platform_device *pdev)
 	if (IS_ERR(rng->rng_base)) {
 		dev_err(&pdev->dev, "Failed to map resource %pe\n", rng->rng_base);
 		return PTR_ERR(rng->rng_base);
 	}
 
-	rng->aesctx = devm_kzalloc(&pdev->dev, sizeof(*rng->aesctx), GFP_KERNEL);
-	if (!rng->aesctx)
+	rng->aeskey = devm_kzalloc(&pdev->dev, sizeof(*rng->aeskey), GFP_KERNEL);
+	if (!rng->aeskey)
 		return -ENOMEM;
 
 	sb_size = crypto_drbg_ctr_df_datalen(TRNG_SEED_LEN_BYTES, AES_BLOCK_SIZE);
 	rng->scratchpadbuf = devm_kzalloc(&pdev->dev, sb_size, GFP_KERNEL);
 	if (!rng->scratchpadbuf) {
diff --git a/include/crypto/df_sp80090a.h b/include/crypto/df_sp80090a.h
index 6b25305fe611..cb5d6fe15d40 100644
--- a/include/crypto/df_sp80090a.h
+++ b/include/crypto/df_sp80090a.h
@@ -16,11 +16,11 @@ static inline int crypto_drbg_ctr_df_datalen(u8 statelen, u8 blocklen)
 		blocklen +      /* pad */
 		blocklen +      /* iv */
 		statelen + blocklen;  /* temp */
 }
 
-int crypto_drbg_ctr_df(struct crypto_aes_ctx *aes,
+int crypto_drbg_ctr_df(struct aes_enckey *aes,
 		       unsigned char *df_data,
 		       size_t bytes_to_return,
 		       struct list_head *seedlist,
 		       u8 blocklen_bytes,
 		       u8 statelen);
-- 
2.52.0


