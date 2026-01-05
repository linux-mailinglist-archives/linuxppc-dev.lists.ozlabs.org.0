Return-Path: <linuxppc-dev+bounces-15220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B7CF1E48
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:16:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yb02xVz30VQ;
	Mon, 05 Jan 2026 16:15:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590114;
	cv=none; b=nbR19x0bMwBDb9r4jp/lrp0RVuebAW967Mmp1tq8e2zovM4igPeaIHMxpwoZ+xUavELPs+Q3PCEcjrWmKk8MTN9O974Fq1CjkH17FC+i8pSZaJTTuVqMx+l4YMpkqCuGlTxeo8+vOYKMM3SxCp1Y8YwMBgNcKpgZj0Ww+L/ekr7YTtQ62d373OktLONjh34pF7wt2HoBKxuYnFCK9WPkbqCGIvqg7ob6E0YC/llfA13xuy96j2WDWximKmqGjkHwiirBVMYfTLvvN0xdZjhI6LTFEyLczyz1MF8RfCffmRzlu48lRnGEhRBWtzw+pVeBAL9NQB8PTY6yjLaBnWoTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590114; c=relaxed/relaxed;
	bh=3IoOcmuEUFdalI+Xu091qv4e2opViqdVh32nVwOB630=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4sXYGrbcbTnt2pMP0fgeArrN0++A+0Yz6RV+C1E+cE99MH+diHMPomcuQO7kBlZsKM+qUrUqkP9dyhyg9QGXgwMKzUEh8R+hgsI/QZHSdbERqpJ4vyO8KeEgipfGKA5IWT2C8Vy+Xwpq8Tnvzq/WH9uAYfrUZApZrlWV38ZTVwOKVWxJYfJUK9XtnNHdVvw3PsMl7YMxQYnk+oUMXSaGvj7zzrkG2M6fT+2iz5PF3Vet5T1znV6ayk5XyINPzuclb11fKijQWPCjgohk1mvkltmoT22SD+t11lieHTAWVLiqTJ9AGLUIZ2pQbcJaL8IUIUSyU5y/RxMbCE3S3LZ3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TH4w7+H/; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TH4w7+H/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YW3xzmz2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3926B44357;
	Mon,  5 Jan 2026 05:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7216BC2BCB1;
	Mon,  5 Jan 2026 05:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590108;
	bh=CEvjFtjQNPUEArHuTq+3s4Z3LAXNjA8ATEyzFR/Xb40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TH4w7+H/0TkVDsJHMpEQqO72NXoaXdINRgTgmORdg/nBswVAhCJciDqyoaLoEsk0x
	 KAoH6UDXekrcipmj9EdyeltYyimR8UnDLawkjI+6YrgvtaV4XC6uy9bBcAwrCNOrqo
	 uvxWBU0GvZbjMMUxcxvyJ9+SSzcidEvS5+fb80pKeNVuf8mx93IcjqYPmo34LlotI8
	 R5iQTDSnm88aKbHIRjqpZ2geZ/An+n4r2q/siZIBEGFNZM6W0LiU9yHjVWFX3eojlW
	 chB+ghWLPeuD4EP0rNVXAzy1XU8rRggwi7ZW+xfi4AwjnXFQEHyAbPfYYJvt0v3Ijb
	 l3FWDTk6gFuFQ==
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
Subject: [PATCH 26/36] crypto: ccp - Use new AES library API
Date: Sun,  4 Jan 2026 21:12:59 -0800
Message-ID: <20260105051311.1607207-27-ebiggers@kernel.org>
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
 drivers/crypto/ccp/ccp-crypto-aes-cmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/ccp/ccp-crypto-aes-cmac.c b/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
index d8426bdf3190..ed5b0f8609f1 100644
--- a/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
+++ b/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
@@ -259,11 +259,11 @@ static int ccp_aes_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	struct ccp_ctx *ctx = crypto_ahash_ctx_dma(tfm);
 	struct ccp_crypto_ahash_alg *alg =
 		ccp_crypto_ahash_alg(crypto_ahash_tfm(tfm));
 	u64 k0_hi, k0_lo, k1_hi, k1_lo, k2_hi, k2_lo;
 	u64 rb_hi = 0x00, rb_lo = 0x87;
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 	__be64 *gk;
 	int ret;
 
 	switch (key_len) {
 	case AES_KEYSIZE_128:
@@ -282,17 +282,17 @@ static int ccp_aes_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 
 	/* Set to zero until complete */
 	ctx->u.aes.key_len = 0;
 
 	/* Set the key for the AES cipher used to generate the keys */
-	ret = aes_expandkey(&aes, key, key_len);
+	ret = aes_prepareenckey(&aes, key, key_len);
 	if (ret)
 		return ret;
 
 	/* Encrypt a block of zeroes - use key area in context */
 	memset(ctx->u.aes.key, 0, sizeof(ctx->u.aes.key));
-	aes_encrypt(&aes, ctx->u.aes.key, ctx->u.aes.key);
+	aes_encrypt_new(&aes, ctx->u.aes.key, ctx->u.aes.key);
 	memzero_explicit(&aes, sizeof(aes));
 
 	/* Generate K1 and K2 */
 	k0_hi = be64_to_cpu(*((__be64 *)ctx->u.aes.key));
 	k0_lo = be64_to_cpu(*((__be64 *)ctx->u.aes.key + 1));
-- 
2.52.0


