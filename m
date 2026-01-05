Return-Path: <linuxppc-dev+bounces-15228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A23CF1E88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:18:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yj3zYjz3bqV;
	Mon, 05 Jan 2026 16:15:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590121;
	cv=none; b=Hpz18txOb+uZj19l98ccAO3vFPM2RBWUlgOlXG85YpCYwl67EgaYHT1Y29cpUf8jUlmxJzeZVmji0RoJAsoOTdlq4euaTn0Ffniw7yvX24NZ14CdngkXU0H4ncrs9P9WjfTxWMEeaYMYZ2JVr5hBhL3/sgghKEXiJPhC5pcwyAPb5coWsdQVXw5AGgCoB4/X2o5RXVbDBWTLKuvHD5suFS4Z3aHCqsN4hkyF5MgYqZcuXAzRBE0p4wdEwJwJ1efCPc8VJZDWzIeLeKlTWo8VknuLAyl3c/E3BNIlcmEChse3wDbBkPriTs9mlhYRjTcQs2ufsEYzwDiVFG/DE+NRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590121; c=relaxed/relaxed;
	bh=hd3XBg5FT5ThbzYc/S/Y43XcCmv4iVi72TJsXVdDz+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhbj6EEhsshS/OhbSYvIGFhE2AbvyoiAp8if8ZMzCYPmTZ/0ZVlzZY1dBciWR+klfW3DUW5wY5zAg4dbNKuLiPi8DLo1ATttCkLg86DyxxhUwqAGnWBC+TYZjFDVmm5QFO4nS9xtJ3Kq2dDrsK6YNFQB1qoLMKRczsbuuhZ1Ykad4pvNiOUL6fcRYzG63emvGlI9zabGali0nc5lqZxyE02Aeg5mXcyiBzovJ8HqsoFOdVvqkm7giUUAqNtdrwqjtfHyhqy7lKe3axspRkkcIQwv0mj3vds/eU1j8ipIeqcItak/7vglGjamCX52qOvIlYLL4nn+Zo6wYGnEYs/5og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=apeAvzoF; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=apeAvzoF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2Yh2wTlz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5711560126;
	Mon,  5 Jan 2026 05:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B139C2BC86;
	Mon,  5 Jan 2026 05:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590113;
	bh=ZEZ/lY7ZIO891sPEBRd1dtmoAwyoQ6T6NHQ246zb3/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=apeAvzoFhCmf28cauH2AK1P6lYgUC26vcBsw43BItwp24FqiMj05XhvRtwpsz/QN/
	 b72Lju9LymvdFnhX7WykF3DvmMLydGXaxY5YTX7FLVoSaGvrAxQyEIC9p9lETETlnY
	 X0AeM7Qtv39qrQzjYAqmt2szo0QoZ4zymLYQje68HgXloV75XsfDnZiC7lRzOwjSST
	 xBRMsKgeTX5BzVfUKnd+8/Ec3jZ0RXnX8Khcbm4RlYYAFkf0qhnv81sZbfsuLGS2rh
	 dmb1lXlxyH1lWkoX5IitelaskMSoZm1RIUAWSg+A2NUS2uDzFqL4Cv00hUQm9s7rAl
	 FjMPUvYxijPzA==
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
Subject: [PATCH 34/36] lib/crypto: aes: Remove old AES en/decryption functions
Date: Sun,  4 Jan 2026 21:13:07 -0800
Message-ID: <20260105051311.1607207-35-ebiggers@kernel.org>
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

Now that no callers of the original aes_encrypt() and aes_decrypt()
remain, remove them.  This frees up their names for aes_encrypt_new()
and aes_decrypt_new() to be renamed to.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/aes.h |  16 ------
 lib/crypto/aes.c     | 118 -------------------------------------------
 2 files changed, 134 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 18a5f518e914..4ce710209da8 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -293,26 +293,10 @@ int aes_preparekey(struct aes_key *key, const u8 *in_key, size_t key_len);
  * Context: Any context.
  */
 int aes_prepareenckey(struct aes_enckey *enc_key,
 		      const u8 *in_key, size_t key_len);
 
-/**
- * aes_encrypt - Encrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the ciphertext
- * @in:		Buffer containing the plaintext
- */
-void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
-
-/**
- * aes_decrypt - Decrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the plaintext
- * @in:		Buffer containing the ciphertext
- */
-void aes_decrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
-
 typedef union {
 	const struct aes_enckey *enc_key;
 	const struct aes_key *full_key;
 } aes_encrypt_arg __attribute__ ((__transparent_union__));
 
diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index 57b6d68fd378..f8c67206b850 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -249,26 +249,10 @@ static u32 inv_mix_columns(u32 x)
 	u32 y = mul_by_x2(x);
 
 	return mix_columns(x ^ y ^ ror32(y, 16));
 }
 
-static __always_inline u32 subshift(u32 in[], int pos)
-{
-	return (aes_sbox[in[pos] & 0xff]) ^
-	       (aes_sbox[(in[(pos + 1) % 4] >>  8) & 0xff] <<  8) ^
-	       (aes_sbox[(in[(pos + 2) % 4] >> 16) & 0xff] << 16) ^
-	       (aes_sbox[(in[(pos + 3) % 4] >> 24) & 0xff] << 24);
-}
-
-static __always_inline u32 inv_subshift(u32 in[], int pos)
-{
-	return (aes_inv_sbox[in[pos] & 0xff]) ^
-	       (aes_inv_sbox[(in[(pos + 3) % 4] >>  8) & 0xff] <<  8) ^
-	       (aes_inv_sbox[(in[(pos + 2) % 4] >> 16) & 0xff] << 16) ^
-	       (aes_inv_sbox[(in[(pos + 1) % 4] >> 24) & 0xff] << 24);
-}
-
 static u32 subw(u32 in)
 {
 	return (aes_sbox[in & 0xff]) ^
 	       (aes_sbox[(in >>  8) & 0xff] <<  8) ^
 	       (aes_sbox[(in >> 16) & 0xff] << 16) ^
@@ -343,61 +327,10 @@ int aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
 	aes_expandkey_generic(ctx->key_enc, ctx->key_dec, in_key, key_len);
 	return 0;
 }
 EXPORT_SYMBOL(aes_expandkey);
 
-/**
- * aes_encrypt - Encrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the ciphertext
- * @in:		Buffer containing the plaintext
- */
-void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
-{
-	const u32 *rkp = ctx->key_enc + 4;
-	int rounds = 6 + ctx->key_length / 4;
-	u32 st0[4], st1[4];
-	int round;
-
-	st0[0] = ctx->key_enc[0] ^ get_unaligned_le32(in);
-	st0[1] = ctx->key_enc[1] ^ get_unaligned_le32(in + 4);
-	st0[2] = ctx->key_enc[2] ^ get_unaligned_le32(in + 8);
-	st0[3] = ctx->key_enc[3] ^ get_unaligned_le32(in + 12);
-
-	/*
-	 * Force the compiler to emit data independent Sbox references,
-	 * by xoring the input with Sbox values that are known to add up
-	 * to zero. This pulls the entire Sbox into the D-cache before any
-	 * data dependent lookups are done.
-	 */
-	st0[0] ^= aes_sbox[ 0] ^ aes_sbox[ 64] ^ aes_sbox[134] ^ aes_sbox[195];
-	st0[1] ^= aes_sbox[16] ^ aes_sbox[ 82] ^ aes_sbox[158] ^ aes_sbox[221];
-	st0[2] ^= aes_sbox[32] ^ aes_sbox[ 96] ^ aes_sbox[160] ^ aes_sbox[234];
-	st0[3] ^= aes_sbox[48] ^ aes_sbox[112] ^ aes_sbox[186] ^ aes_sbox[241];
-
-	for (round = 0;; round += 2, rkp += 8) {
-		st1[0] = mix_columns(subshift(st0, 0)) ^ rkp[0];
-		st1[1] = mix_columns(subshift(st0, 1)) ^ rkp[1];
-		st1[2] = mix_columns(subshift(st0, 2)) ^ rkp[2];
-		st1[3] = mix_columns(subshift(st0, 3)) ^ rkp[3];
-
-		if (round == rounds - 2)
-			break;
-
-		st0[0] = mix_columns(subshift(st1, 0)) ^ rkp[4];
-		st0[1] = mix_columns(subshift(st1, 1)) ^ rkp[5];
-		st0[2] = mix_columns(subshift(st1, 2)) ^ rkp[6];
-		st0[3] = mix_columns(subshift(st1, 3)) ^ rkp[7];
-	}
-
-	put_unaligned_le32(subshift(st1, 0) ^ rkp[4], out);
-	put_unaligned_le32(subshift(st1, 1) ^ rkp[5], out + 4);
-	put_unaligned_le32(subshift(st1, 2) ^ rkp[6], out + 8);
-	put_unaligned_le32(subshift(st1, 3) ^ rkp[7], out + 12);
-}
-EXPORT_SYMBOL(aes_encrypt);
-
 static __always_inline u32 enc_quarterround(const u32 w[4], int i, u32 rk)
 {
 	return rk ^ aes_enc_tab[(u8)w[i]] ^
 	       rol32(aes_enc_tab[(u8)(w[(i + 1) % 4] >> 8)], 8) ^
 	       rol32(aes_enc_tab[(u8)(w[(i + 2) % 4] >> 16)], 16) ^
@@ -502,61 +435,10 @@ static void __maybe_unused aes_decrypt_generic(const u32 inv_rndkeys[],
 	put_unaligned_le32(declast_quarterround(w, 1, *rkp++), &out[4]);
 	put_unaligned_le32(declast_quarterround(w, 2, *rkp++), &out[8]);
 	put_unaligned_le32(declast_quarterround(w, 3, *rkp++), &out[12]);
 }
 
-/**
- * aes_decrypt - Decrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the plaintext
- * @in:		Buffer containing the ciphertext
- */
-void aes_decrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
-{
-	const u32 *rkp = ctx->key_dec + 4;
-	int rounds = 6 + ctx->key_length / 4;
-	u32 st0[4], st1[4];
-	int round;
-
-	st0[0] = ctx->key_dec[0] ^ get_unaligned_le32(in);
-	st0[1] = ctx->key_dec[1] ^ get_unaligned_le32(in + 4);
-	st0[2] = ctx->key_dec[2] ^ get_unaligned_le32(in + 8);
-	st0[3] = ctx->key_dec[3] ^ get_unaligned_le32(in + 12);
-
-	/*
-	 * Force the compiler to emit data independent Sbox references,
-	 * by xoring the input with Sbox values that are known to add up
-	 * to zero. This pulls the entire Sbox into the D-cache before any
-	 * data dependent lookups are done.
-	 */
-	st0[0] ^= aes_inv_sbox[ 0] ^ aes_inv_sbox[ 64] ^ aes_inv_sbox[129] ^ aes_inv_sbox[200];
-	st0[1] ^= aes_inv_sbox[16] ^ aes_inv_sbox[ 83] ^ aes_inv_sbox[150] ^ aes_inv_sbox[212];
-	st0[2] ^= aes_inv_sbox[32] ^ aes_inv_sbox[ 96] ^ aes_inv_sbox[160] ^ aes_inv_sbox[236];
-	st0[3] ^= aes_inv_sbox[48] ^ aes_inv_sbox[112] ^ aes_inv_sbox[187] ^ aes_inv_sbox[247];
-
-	for (round = 0;; round += 2, rkp += 8) {
-		st1[0] = inv_mix_columns(inv_subshift(st0, 0)) ^ rkp[0];
-		st1[1] = inv_mix_columns(inv_subshift(st0, 1)) ^ rkp[1];
-		st1[2] = inv_mix_columns(inv_subshift(st0, 2)) ^ rkp[2];
-		st1[3] = inv_mix_columns(inv_subshift(st0, 3)) ^ rkp[3];
-
-		if (round == rounds - 2)
-			break;
-
-		st0[0] = inv_mix_columns(inv_subshift(st1, 0)) ^ rkp[4];
-		st0[1] = inv_mix_columns(inv_subshift(st1, 1)) ^ rkp[5];
-		st0[2] = inv_mix_columns(inv_subshift(st1, 2)) ^ rkp[6];
-		st0[3] = inv_mix_columns(inv_subshift(st1, 3)) ^ rkp[7];
-	}
-
-	put_unaligned_le32(inv_subshift(st1, 0) ^ rkp[4], out);
-	put_unaligned_le32(inv_subshift(st1, 1) ^ rkp[5], out + 4);
-	put_unaligned_le32(inv_subshift(st1, 2) ^ rkp[6], out + 8);
-	put_unaligned_le32(inv_subshift(st1, 3) ^ rkp[7], out + 12);
-}
-EXPORT_SYMBOL(aes_decrypt);
-
 /*
  * Note: the aes_prepare*key_* names reflect the fact that the implementation
  * might not actually expand the key.  (The s390 code for example doesn't.)
  * Where the key is expanded we use the more specific names aes_expandkey_*.
  *
-- 
2.52.0


