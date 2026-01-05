Return-Path: <linuxppc-dev+bounces-15237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E52CF1EC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:19:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Z45BGhz3cbl;
	Mon, 05 Jan 2026 16:15:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590140;
	cv=none; b=klRYWBtMO1W1pozpm+pf383zHsE9mI/8btwmPyvSfrBXAmMnLuuFBLa4Q3qHPjrS19CbcQW9EcVfeC8jCKtmQPS6u6a8I4rQhD1lI+xzOl6uXgYtCFkLDHbL9LGhqac3llDPB7YsnqDDJJq6pCd0dOeg5tApERW0KYZjU8nE0Z3i11im4bBux3PhPxLiAsPFimXHkYXS6AHWokY6p6e3lMumCYnNhMUm3jkrLB6WwpJD8wl6BhoHkhx3ALSJ0reRwe53+088vItGZr6a0DHpi5DBIFlg7JDi0XZ6umMyy98kAFJFbP9fwPyTTkL5yNb6sdJpQTtPoss7UNi+iWI7Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590140; c=relaxed/relaxed;
	bh=jku3CL07+U1b76FjLnYHoEBywtmNzCcg1Uj5VCGEfso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bU6SVs1ltzgcfq7xivMM1lSvZuIMhdkcBKxoxegennWj0whWOj8m7x3462NXA35ltqsZRBhH7Ynu49+AkloZcJviNl2I7QKrdAtgkksXTS5/qYxyod8lLwtz9htqnTm5BD2KH5sDHvK7cGlaJsbiFvgMxIc9+VCwk8urDmRM6ZCu2OhcktO+c24T5cMUbfroYWQM7hGZpuQhdg64KQbHDMfS7nEdEZyhD33FMMlq8Jl19+1etVxguelrnY7ikbCe3j931RhU4AL18RowmbtETfNLQ+j5ju0/e0LFAmmFSCRB5/z5P2dMhzGw7lH+9AHdjfkDno6WXB6RGhM2zBknDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qcVBpCYW; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qcVBpCYW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2Z402bHz3cZr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39D274434D;
	Mon,  5 Jan 2026 05:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5352C19425;
	Mon,  5 Jan 2026 05:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590106;
	bh=32kb2l0NMdpg22PqusIRxtEfgY/UOrZtqLBmf/rQszE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qcVBpCYWjV2xse6dJQSomMH+1tsEuVvo82gcrovtJCAgJJDeXu5vrEAro7enrzEhB
	 DaxHZ0LdmShaUjawHJZMDqG1bXV0tmx4L5DZkVyFwzPAg0m+bv5fKBQKvlHMl88xDs
	 X0bHKanr2bLut60x824nG+hHVBE/pMXERweo8wrFEZNRR7eW0jpLtumEYksHpL/wBs
	 /5m5BvyGThfyHEVhFdRbdn8+vdrhOWgKyvSzJuMUCnFPE9oJooOmrKheKw40lTqJIp
	 0KFxGE6yoUtIrHoPV9/b1L6A8yT8uANGcjgZNyzRziawi+WbznGyyN50gHxJio+67d
	 zWINIa5JFDduQ==
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
Subject: [PATCH 23/36] crypto: arm/ghash - Use new AES library API
Date: Sun,  4 Jan 2026 21:12:56 -0800
Message-ID: <20260105051311.1607207-24-ebiggers@kernel.org>
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
 arch/arm/crypto/ghash-ce-glue.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/crypto/ghash-ce-glue.c b/arch/arm/crypto/ghash-ce-glue.c
index a52dcc8c1e33..9ab03bce352d 100644
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
+	aes_encrypt_new(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});
 
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


