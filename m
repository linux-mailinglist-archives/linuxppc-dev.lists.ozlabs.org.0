Return-Path: <linuxppc-dev+bounces-15223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E04CF1E5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:17:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yc69bzz30dn;
	Mon, 05 Jan 2026 16:15:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590116;
	cv=none; b=EygHwq61jNxd7o91zTY32Hh+IwNMLQn13csC4wL3TVzgdPjLrWN4iRDaj92Rdu0cibPvylyWNOY5+m/XyTzCQi9v4V8ruHOKW4EhUbfndf2AtoBIFvL5Nc+gg2xePJlWhqmJmbFhxKNFk+rRU2+79xcHfGYYpuHLsIZjx7kbLD5Z+3+F6yk78O06VdGgkEmBFLKOgivjaXJB7i3/CQJMsZ+hDkfgR7QMWOnesFIf1v1PgPN79IQncLBh+LRyskGYBFPYzaUwho72ypRBKvmlI5V3bALYpaM206jZIhSsXsU4gGNouzp3/okwAy35hOgiuMmkn4qXnFbGUeO1v1ZtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590116; c=relaxed/relaxed;
	bh=6FnNbpGrvlniCMOLch6NApfeJnytZoAyLzv1qsCY88o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IK8zG9KZsKmk8MvfItmKNEldmLBJxTCpnqaOwQkvH8XUQ7X+skjzg57oNEwCPPgEYp0hkrZdZ7FKTRSMzs6V7PSVrdOwdewafPcQSkJB1CZFjGkF6m8NAJrXczh2ZlfCB+5G0b/hLt3J2QD8sJT8+JsnhN2nua/7VCFbJnWmaSLODCUjZxYz1HA4/pErWufXh1iifgX+nm0KOZUMzDueMZVXUIyaF0uZd/ElzY5Bpce/MvCWjEpy7S1HqlNt9KsyA5s27/g3XFhFEQqaVRAvQt7DxL7AaDokL7yiu0TmiFqIRfhpjtykKQayJKqTkUG7XDr7jbJJvBEaelqOOGzpBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hn+T5ja7; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hn+T5ja7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YX6DNWz307V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 876B344315;
	Mon,  5 Jan 2026 05:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC91C2BCB0;
	Mon,  5 Jan 2026 05:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590112;
	bh=6GiGUP+X4gmyZFn4wILAzmE5Daf6tx/zz/5Ty9L/V2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hn+T5ja72OrFlu0ck1rY36j7hbDeSAIJtr1r2XfD5CZBBnXK82U0S2S5vVueu6vnL
	 Ghn7LwihQM4Z1AZgO8m2aTE58Q+/Bjc/ZK+eWiEUcVhHFW0NBhChppDwY4rzIw+g+C
	 9p8jFujFM0C3hdvjFzSGjopv0y2xHajarIJvzOiV6qYl0h0iSEtW22Hz9i75CDqSyT
	 1QIjgA+t/pE1tWp7u+IpsDLawczDOM+9cHXE3mm2OstI914Q9UN3LNYriQKKxBDTTM
	 ALoc6OJvSK74qp7/vu/2Sm30b3bE6cpISIQX3QSUh3SiADUd6TRP9CGyKcBloveSWy
	 OJK/pBYjbcdtw==
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
Subject: [PATCH 33/36] lib/crypto: aesgcm: Use new AES library API
Date: Sun,  4 Jan 2026 21:13:06 -0800
Message-ID: <20260105051311.1607207-34-ebiggers@kernel.org>
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
 include/crypto/gcm.h |  2 +-
 lib/crypto/aesgcm.c  | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/crypto/gcm.h b/include/crypto/gcm.h
index fd9df607a836..b524e47bd4d0 100644
--- a/include/crypto/gcm.h
+++ b/include/crypto/gcm.h
@@ -64,11 +64,11 @@ static inline int crypto_ipsec_check_assoclen(unsigned int assoclen)
 	return 0;
 }
 
 struct aesgcm_ctx {
 	be128			ghash_key;
-	struct crypto_aes_ctx	aes_ctx;
+	struct aes_enckey	aes_key;
 	unsigned int		authsize;
 };
 
 int aesgcm_expandkey(struct aesgcm_ctx *ctx, const u8 *key,
 		     unsigned int keysize, unsigned int authsize);
diff --git a/lib/crypto/aesgcm.c b/lib/crypto/aesgcm.c
index ac0b2fcfd606..19106fe008fd 100644
--- a/lib/crypto/aesgcm.c
+++ b/lib/crypto/aesgcm.c
@@ -10,11 +10,11 @@
 #include <crypto/ghash.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <asm/irqflags.h>
 
-static void aesgcm_encrypt_block(const struct crypto_aes_ctx *ctx, void *dst,
+static void aesgcm_encrypt_block(const struct aes_enckey *key, void *dst,
 				 const void *src)
 {
 	unsigned long flags;
 
 	/*
@@ -24,11 +24,11 @@ static void aesgcm_encrypt_block(const struct crypto_aes_ctx *ctx, void *dst,
 	 * mitigates this risk to some extent by pulling the entire S-box into
 	 * the caches before doing any substitutions, but this strategy is more
 	 * effective when running with interrupts disabled.
 	 */
 	local_irq_save(flags);
-	aes_encrypt(ctx, dst, src);
+	aes_encrypt_new(key, dst, src);
 	local_irq_restore(flags);
 }
 
 /**
  * aesgcm_expandkey - Expands the AES and GHASH keys for the AES-GCM key
@@ -47,16 +47,16 @@ int aesgcm_expandkey(struct aesgcm_ctx *ctx, const u8 *key,
 {
 	u8 kin[AES_BLOCK_SIZE] = {};
 	int ret;
 
 	ret = crypto_gcm_check_authsize(authsize) ?:
-	      aes_expandkey(&ctx->aes_ctx, key, keysize);
+	      aes_prepareenckey(&ctx->aes_key, key, keysize);
 	if (ret)
 		return ret;
 
 	ctx->authsize = authsize;
-	aesgcm_encrypt_block(&ctx->aes_ctx, &ctx->ghash_key, kin);
+	aesgcm_encrypt_block(&ctx->aes_key, &ctx->ghash_key, kin);
 
 	return 0;
 }
 EXPORT_SYMBOL(aesgcm_expandkey);
 
@@ -95,11 +95,11 @@ static void aesgcm_mac(const struct aesgcm_ctx *ctx, const u8 *src, int src_len,
 	aesgcm_ghash(&ghash, &ctx->ghash_key, assoc, assoc_len);
 	aesgcm_ghash(&ghash, &ctx->ghash_key, src, src_len);
 	aesgcm_ghash(&ghash, &ctx->ghash_key, &tail, sizeof(tail));
 
 	ctr[3] = cpu_to_be32(1);
-	aesgcm_encrypt_block(&ctx->aes_ctx, buf, ctr);
+	aesgcm_encrypt_block(&ctx->aes_key, buf, ctr);
 	crypto_xor_cpy(authtag, buf, (u8 *)&ghash, ctx->authsize);
 
 	memzero_explicit(&ghash, sizeof(ghash));
 	memzero_explicit(buf, sizeof(buf));
 }
@@ -117,11 +117,11 @@ static void aesgcm_crypt(const struct aesgcm_ctx *ctx, u8 *dst, const u8 *src,
 		 * inadvertent IV reuse, which must be avoided at all cost for
 		 * stream ciphers such as AES-CTR. Given the range of 'int
 		 * len', this cannot happen, so no explicit test is necessary.
 		 */
 		ctr[3] = cpu_to_be32(n++);
-		aesgcm_encrypt_block(&ctx->aes_ctx, buf, ctr);
+		aesgcm_encrypt_block(&ctx->aes_key, buf, ctr);
 		crypto_xor_cpy(dst, src, buf, min(len, AES_BLOCK_SIZE));
 
 		dst += AES_BLOCK_SIZE;
 		src += AES_BLOCK_SIZE;
 		len -= AES_BLOCK_SIZE;
-- 
2.52.0


