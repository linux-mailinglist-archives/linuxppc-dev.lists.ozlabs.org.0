Return-Path: <linuxppc-dev+bounces-15236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F6CF1EC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:19:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Z33j4dz3cYm;
	Mon, 05 Jan 2026 16:15:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590139;
	cv=none; b=M6fBod0oKM5Y57d3PPqXSBcCOeh0sRkMUe40UA3o0gtHICKIKRlRAntVdKznGR7X03gwKgUWHyA5KrTqJ4MJg9rfjdQm3nm8IwnvzOOflGuoqz1SoxJccqntPq3hespEKwUHDpJ3aYBQnPDTquT0fYdX8ajLlAdVK7w0HfV+gr5u3ce1CYucRuWr6Jj8miYe21nhOnprT+JtS4ZOBV+kAc/EuTIkIlpyenJCTzJRuN/n7d/k/+A1b98hKFGZ885bbYEQhgb8cMe49CrHm/OAXcjMxR0wavLVEVCR0qOsEGNEffO0voAbvvLnhyFpb7lzMWMz2ojsBv93bPJ8fQrDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590139; c=relaxed/relaxed;
	bh=RYyqji9PE8eYzuuXi3K+bad+83MyA0VZDDSADsJ0DWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IewN3eqmSkXeZL9obJJRTtrxu2ryZ2+BC4IkUgFpB7zaNJBslpvxmvQ13kL1TrbRFv4nPo2/Od0/AMT4sAoGTiGsUGl471hcmAuFHjUFSN4XBAJBcGSRjUDcd/ZD+ZTWRfQ3LWZ/FqaDcSqZ1MzI9VmOI8vfXBcuSmeL+VimjVwNfNVUHqH73VEukSF8lxSPE+Z0aNcySEJHdiaxc5z0OGV6dQ0+3pnVdUuNhN+Ed+bPTWLfu/29TqtbqThvo2cm5+G9laHrUvfxDb4gc+YrU3NGlxAbQ/03awAVvbo12oIyqVUToQe4BZRJKLG7+EbSKK21PH1ApAsRq539zaRjGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tRQqfhtA; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tRQqfhtA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2Z23vgdz3bTR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CCC74434B;
	Mon,  5 Jan 2026 05:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DB5C2BCB2;
	Mon,  5 Jan 2026 05:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590104;
	bh=NFL++YcblhzlGK3w2LADc6E1fzvZkgF4LxjOicoIZ1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRQqfhtA2O5EPzgQlXTjC9WYjX+ogwMOT4kcPOtfAjeFNIivecPxD18ZAwTLAhQB6
	 fchsFvky/zd8YoikJGzyo9TAeEXv8d4fexYoImgFtGBdvTrxM3d51ucS+v+8du08Ea
	 Z5fK60dhIR/VDxkzg5tkCyJvE6ZN9n489TzeAKIouRaS3jInP9xdD29r3SVa5aW7Mv
	 u0ww0PR2xXwB5+Sn6y2Drvc1aV7RgL/pLeNWEW02oRogbdGpLPPzqUta8kV+oK5pDa
	 oGw4+d5oMdKOGwMtqZcoIsJoHIS/+m/1Ubp4C42AIeToZ6tR1AjZyKYzBdfWK8VUY+
	 9UYPQqDO2mBqQ==
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
Subject: [PATCH 20/36] chelsio: Use new AES library API
Date: Sun,  4 Jan 2026 21:12:53 -0800
Message-ID: <20260105051311.1607207-21-ebiggers@kernel.org>
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
 .../ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c  | 6 +++---
 .../ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c    | 8 ++++----
 .../net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c   | 6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
index 49b57bb5fac1..882d09b2b1a8 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
@@ -168,11 +168,11 @@ static int ch_ipsec_setkey(struct xfrm_state *x,
 {
 	int keylen = (x->aead->alg_key_len + 7) / 8;
 	unsigned char *key = x->aead->alg_key;
 	int ck_size, key_ctx_size = 0;
 	unsigned char ghash_h[AEAD_H_SIZE];
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 	int ret = 0;
 
 	if (keylen > 3) {
 		keylen -= 4;  /* nonce/salt is present in the last 4 bytes */
 		memcpy(sa_entry->salt, key + keylen, 4);
@@ -202,17 +202,17 @@ static int ch_ipsec_setkey(struct xfrm_state *x,
 						 key_ctx_size >> 4);
 
 	/* Calculate the H = CIPH(K, 0 repeated 16 times).
 	 * It will go in key context
 	 */
-	ret = aes_expandkey(&aes, key, keylen);
+	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret) {
 		sa_entry->enckey_len = 0;
 		goto out;
 	}
 	memset(ghash_h, 0, AEAD_H_SIZE);
-	aes_encrypt(&aes, ghash_h, ghash_h);
+	aes_encrypt_new(&aes, ghash_h, ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 
 	memcpy(sa_entry->key + (DIV_ROUND_UP(sa_entry->enckey_len, 16) *
 	       16), ghash_h, AEAD_H_SIZE);
 	sa_entry->kctx_len = ((DIV_ROUND_UP(sa_entry->enckey_len, 16)) << 4) +
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
index 4e2096e49684..09c0687f911f 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
@@ -74,11 +74,11 @@ static int chcr_ktls_save_keys(struct chcr_ktls_info *tx_info,
 {
 	int ck_size, key_ctx_size, mac_key_size, keylen, ghash_size, ret;
 	unsigned char ghash_h[TLS_CIPHER_AES_GCM_256_TAG_SIZE];
 	struct tls12_crypto_info_aes_gcm_128 *info_128_gcm;
 	struct ktls_key_ctx *kctx = &tx_info->key_ctx;
-	struct crypto_aes_ctx aes_ctx;
+	struct aes_enckey aes;
 	unsigned char *key, *salt;
 
 	switch (crypto_info->cipher_type) {
 	case TLS_CIPHER_AES_GCM_128:
 		info_128_gcm =
@@ -136,17 +136,17 @@ static int chcr_ktls_save_keys(struct chcr_ktls_info *tx_info,
 		       roundup(keylen, 16) + ghash_size;
 	/* Calculate the H = CIPH(K, 0 repeated 16 times).
 	 * It will go in key context
 	 */
 
-	ret = aes_expandkey(&aes_ctx, key, keylen);
+	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret)
 		goto out;
 
 	memset(ghash_h, 0, ghash_size);
-	aes_encrypt(&aes_ctx, ghash_h, ghash_h);
-	memzero_explicit(&aes_ctx, sizeof(aes_ctx));
+	aes_encrypt_new(&aes, ghash_h, ghash_h);
+	memzero_explicit(&aes, sizeof(aes));
 
 	/* fill the Key context */
 	if (direction == TLS_OFFLOAD_CTX_DIR_TX) {
 		kctx->ctx_hdr = FILL_KEY_CTX_HDR(ck_size,
 						 mac_key_size,
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
index fab6df21f01c..be2b623957c0 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
@@ -245,11 +245,11 @@ static int chtls_key_info(struct chtls_sock *csk,
 {
 	unsigned char key[AES_MAX_KEY_SIZE];
 	unsigned char *key_p, *salt;
 	unsigned char ghash_h[AEAD_H_SIZE];
 	int ck_size, key_ctx_size, kctx_mackey_size, salt_size;
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 	int ret;
 
 	key_ctx_size = sizeof(struct _key_ctx) +
 		       roundup(keylen, 16) + AEAD_H_SIZE;
 
@@ -289,16 +289,16 @@ static int chtls_key_info(struct chtls_sock *csk,
 	}
 
 	/* Calculate the H = CIPH(K, 0 repeated 16 times).
 	 * It will go in key context
 	 */
-	ret = aes_expandkey(&aes, key, keylen);
+	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret)
 		return ret;
 
 	memset(ghash_h, 0, AEAD_H_SIZE);
-	aes_encrypt(&aes, ghash_h, ghash_h);
+	aes_encrypt_new(&aes, ghash_h, ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 	csk->tlshws.keylen = key_ctx_size;
 
 	/* Copy the Key context */
 	if (optname == TLS_RX) {
-- 
2.52.0


