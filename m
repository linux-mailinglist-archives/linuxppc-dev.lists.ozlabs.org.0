Return-Path: <linuxppc-dev+bounces-15215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C57CF1E27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2YW6v8sz2yw7;
	Mon, 05 Jan 2026 16:15:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590111;
	cv=none; b=dWzgiBFiQXaMJOdawZbgn9mgF2JwbHFj9oz29pNPfKxsxQuQUMXkHK24TwzdFDkQMXWx7LTn1MNsQvzgb7FqlEnmukXgQVoEcOC7cHeHggy7o8icYteQHKyiqBlOwAbvm3U8wSSdRWXlvXbfGecjsO/HX5wYoTp0TTFQVI99Z+hIZ7UFN2uI1t49heE/J0k4EbQtX6UvW7X35waeXKvXSAs7aLsUlRd3pQY3VCobb1Ji0aZ+KPT/hKBISQAj/0vO6WCnjpof5HA/pX8ZTN+grFwM3QoSZpwywB08PEjgYWUzWKHrRRSoSeGi3eTgoMT4n+F0igQKH8g9URItO0C4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590111; c=relaxed/relaxed;
	bh=IrNXuA5XCX5yZmJuLZA2CL5iNIlF0NiGXOcIMPIAZWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLjHfboLW05taW5itsoQvqtGAbKrC82ifrYKFst6XKcTttw36aVdyxUxvDYBjtxb8ve5EB14b+prwXifh0d9BHSLXNUjKwA53o00BJxMtcIiW5DUohGhtRPEpiztotqeRWqilQiJUcHZklQAQkU4m+3DlqmKdnNrS59m/swdheF9LjYvzND8j/arTKMuMDMAuc8IB18K7BNRC+0qheLSI0NqYvfyfd+MYW4cvOs7n3TqOHXHJ/8ixP0sdf0lYIFcGo47zHPqXsKCi1pLBRkxNKr5MSmGhgkJ8ztGy+FHQ2ejt2sul0+6efygtnpbfTtePMEcZ9rVZLDWWcWBcpSx3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fHgMZsjZ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fHgMZsjZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YR2Wmtz2yrK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9418B43C9D;
	Mon,  5 Jan 2026 05:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0343C116D0;
	Mon,  5 Jan 2026 05:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590103;
	bh=klPJ473PykKQQDYl1om5YMlpRUk81c20WTNsOMHP7DU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fHgMZsjZMHek5raGp9g4rQhMLz2r2A2VSURUybAP2Cxx+6Ssxofsf4uFiW7PHNrTr
	 4GcZbeM1ankeyfaCs+YLYh+37aFeXhTqf74mKTHvp8g8IpcUt92ndg+QZ8kR+Hmii+
	 pp9HT+sxj+akKmL0CinvqZOieJKQYibROmAYqdxYjeOCAI1EbB6kres3FykuAc+p0x
	 fDPK6mTfflJDPsC18bTxnw4qRTdSL8OSOURKrt84Jk2RxdrNy4WkOvkSKRHMkl8N38
	 ynLZheSoFmmfOpvBaCGWb/b8fYimMD6hfL6muOcB2p2mIsu/ppKEzPSBjECrWPeafC
	 uRfZpAT6wO16A==
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
Subject: [PATCH 19/36] Bluetooth: SMP: Use new AES library API
Date: Sun,  4 Jan 2026 21:12:52 -0800
Message-ID: <20260105051311.1607207-20-ebiggers@kernel.org>
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
 net/bluetooth/smp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 3a1ce04a7a53..69007e510177 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -372,36 +372,36 @@ static int smp_h7(struct crypto_shash *tfm_cmac, const u8 w[16],
  * s1 and ah.
  */
 
 static int smp_e(const u8 *k, u8 *r)
 {
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 	uint8_t tmp[16], data[16];
 	int err;
 
 	SMP_DBG("k %16phN r %16phN", k, r);
 
 	/* The most significant octet of key corresponds to k[0] */
 	swap_buf(k, tmp, 16);
 
-	err = aes_expandkey(&ctx, tmp, 16);
+	err = aes_prepareenckey(&aes, tmp, 16);
 	if (err) {
 		BT_ERR("cipher setkey failed: %d", err);
 		return err;
 	}
 
 	/* Most significant octet of plaintextData corresponds to data[0] */
 	swap_buf(r, data, 16);
 
-	aes_encrypt(&ctx, data, data);
+	aes_encrypt_new(&aes, data, data);
 
 	/* Most significant octet of encryptedData corresponds to data[0] */
 	swap_buf(data, r, 16);
 
 	SMP_DBG("r %16phN", r);
 
-	memzero_explicit(&ctx, sizeof(ctx));
+	memzero_explicit(&aes, sizeof(aes));
 	return err;
 }
 
 static int smp_c1(const u8 k[16],
 		  const u8 r[16], const u8 preq[7], const u8 pres[7], u8 _iat,
-- 
2.52.0


