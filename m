Return-Path: <linuxppc-dev+bounces-15585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA4D14FD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:27:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj3l3CKtz3cYd;
	Tue, 13 Jan 2026 06:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245843;
	cv=none; b=jOFWvQkzCczQcgQL4wHpTmpOGYnOKndlSZmAyorGVQk5m2W5ZkSh4FdbmbcGuBBTnZsHETeY5+d1cPp87627kB06ImUUo+lEkYMYSA6MUxO7DbPtVUn2bMPphYZNSkZehZB71KP5XrYoe8ku6hXwsyrZxoXwD9g9XpTK+Y3a97vH5v3i+B8k8DCguU4gpARs1TrpXITv9dVHkcCJc/kS3yslgYdDPo0SYivuTfp8L2+Mt+008kNv/CCxjz47wNJH21tzSruEXkdNpayTNNJR7rPJutWaY/zXvVuLtTx3ftnwlTSmMuN7I2b4QJdWnDQAf3KetGq020x+hEPeDhCRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245843; c=relaxed/relaxed;
	bh=03t5xqxXWXQya2vnXvkh4sBRhE7hCvYdebD40Mx8iOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OsGH4iPjw6aB8tGkYoZEZb+fbXlemUpNfbGQXnUNtI4EnC6F1j6/7RCponkQu/wgsigmlpa4ROkRK2jlULaDr3+HATe7G+JF54mBDPJ9ebAnVZBhsdDOPo++toEZfdg7Vgko9wtNZCr34cVBIPdumQVmaYDvGLdxnahHdNTqvhW1PLusacXnLTe8nl1PZDFVn9ppH9XRmmhrhTzG17Wvy9JMJ5GjFxZ49ZCzoXs0NNUhd16io3qm+RSJjChhCfxAVtjiPSY190Vu2R7TS8QJU+gn+jd/OzB/vxRGIbVCH4jNtilBedy84l6+UNxzWvyxeVXKPOJ27RbqA0QcBf1ULw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qfFo8JDs; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qfFo8JDs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj3k6fdjz3c4r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:24:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFEB560125;
	Mon, 12 Jan 2026 19:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157D1C19422;
	Mon, 12 Jan 2026 19:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245809;
	bh=zZjTigRkrr+RJfey+6vJW4bfvWaLAxFdbVVJ4sVGLrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qfFo8JDsoztKnqQM8LDVsG/RZYZxuwTk6m5qZdjQd/xXiyEc7egrbByJjtgR4sZdu
	 RcpNZKXOvWe5RDLB7hOVlH6OXua6/OEZPnBLFISFOa3J9MSrW455FqrBKQI77CQJcs
	 y9tlA15wqYgSNGZRxDqsKIsEYbUvlHRl/M6y7e+iul2Ov7gxDV2ezDzKhpNPivrM9P
	 zwOHwRjPkvT69tX3CGSI6iww5CkwpdRRVVEkHnpxQ2h5oHalu2FfFBkGaWRFvW3rVB
	 uvUHQfOkJvB3PC+Xs0dSKIdnrH6Xj+YQwsz98IhE5tYp8ma1ZcTvtU9SKRX/Kgvx9M
	 vIGAYuZKdialA==
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
Subject: [PATCH v2 21/35] net: phy: mscc: macsec: Use new AES library API
Date: Mon, 12 Jan 2026 11:20:19 -0800
Message-ID: <20260112192035.10427-22-ebiggers@kernel.org>
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
 drivers/net/phy/mscc/mscc_macsec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_macsec.c b/drivers/net/phy/mscc/mscc_macsec.c
index 4f39ba63a9a9..9a38a29cf397 100644
--- a/drivers/net/phy/mscc/mscc_macsec.c
+++ b/drivers/net/phy/mscc/mscc_macsec.c
@@ -502,19 +502,19 @@ static u32 vsc8584_macsec_flow_context_id(struct macsec_flow *flow)
 
 /* Derive the AES key to get a key for the hash autentication */
 static int vsc8584_macsec_derive_key(const u8 *key, u16 key_len, u8 hkey[16])
 {
 	const u8 input[AES_BLOCK_SIZE] = {0};
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 	int ret;
 
-	ret = aes_expandkey(&ctx, key, key_len);
+	ret = aes_prepareenckey(&aes, key, key_len);
 	if (ret)
 		return ret;
 
-	aes_encrypt(&ctx, hkey, input);
-	memzero_explicit(&ctx, sizeof(ctx));
+	aes_encrypt(&aes, hkey, input);
+	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 static int vsc8584_macsec_transformation(struct phy_device *phydev,
 					 struct macsec_flow *flow,
-- 
2.52.0


