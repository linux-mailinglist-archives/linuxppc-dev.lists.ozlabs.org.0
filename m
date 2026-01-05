Return-Path: <linuxppc-dev+bounces-15216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F33CCF1E2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:16:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2YX0WNTz2yx7;
	Mon, 05 Jan 2026 16:15:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590111;
	cv=none; b=ID63y2/GT6LAAa4CWnWEGo44el4TTs3ciU8sFYTjK9AzuS13lJ/8wLpTnzIFS4FxhdpdRO+MbFB6ix5FBKNcdoqWwyAZFkx8jTcuzGBhvzhKDN2i2274Zoj5DXIrgX45pyXGYDvE92Cjn1nSQwsJXBlJJeKnswrA/j1pu/tr7dYwPvWti73cr2LHUQgLuNrBD8g65IgL7/2Iw1xHLyv6poA6maaVZ1ZNZ1nPwOw+OiT/pWhCwKj8mCwlipGR2w23zHPaGIbwzo41KVDdj9vzZe5TJD8Kd+6FMSTqW7BoI2ODU6oey/WyUHyibhZUuxWMtD+KI0NcP8xUJGudP1HYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590111; c=relaxed/relaxed;
	bh=k4CPf2ZJynm0JU5P5TMioqoG4hO+NATA51L2XquL3Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFCJPh06C7jrcKtOmrwQ0UOl9cGRf8VU80YoMbT16TpHA49xKAkLrHLLGIeWoXjlWEJ8dAAPaNNRmA6cRSXAhBcavRdRBwfKT7sr4vFNntWD4hMKARsYAoFPxDZy/6MF8tQnBP7d2ncZFKLztlf3zZpU6FbwFPF0O/tW/lyV+kdrV+6M2BXoBS4wKEoBa4XtaT1HYIJGmXURMAIPT0RyfHGW2NNnAA/5KVEEstNVZ498DxXKWq0ok5rTqJmml/i8I/0QNl0SmSerXh8cqDJeO7jjoh+Ki0bDAgBYh5/M9f7IX7aThRaWmuc2aM7K6cFYfGIIRNI4OB1OjvZz14rz6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G3G0Bk0G; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G3G0Bk0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YS5W1Hz2ytx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3E4E44345;
	Mon,  5 Jan 2026 05:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DBAC19425;
	Mon,  5 Jan 2026 05:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590104;
	bh=QrYuLwUNu/mVSc/Yo9MLheYVuGpn5hYaMt0fTaKLTGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G3G0Bk0G56Ktu3wG+6a9uAZH1lAOba80s4ElWn2pJFGgFmNV/Cvh+Z4L4klecwAfJ
	 4A4jYZkIX5u/TAbMBp2/t6kvMz1vfkfl6kK8wTbdYEMZzD48byZukOJjTQls80D1Xy
	 4WkndmU3Qn4EkS0p+n03CEKYzEJ0P2Wu+x5eAaKoh0QJtMhWu243+nRHSrwnSBLnET
	 /USJVwZLIvP7OD84paOmDdk+WrENSjRQUTX3tIVS55nIybRN4WLxj52YLt7MKHOYg9
	 LR99hxKJTTahowUoQL9JPYKxznndT0rryjV8qUaCJhK4rY0IHuWnAW46qVo1Gxtx6a
	 1WQW7lG89tSYQ==
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
Subject: [PATCH 21/36] net: phy: mscc: macsec: Use new AES library API
Date: Sun,  4 Jan 2026 21:12:54 -0800
Message-ID: <20260105051311.1607207-22-ebiggers@kernel.org>
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
 drivers/net/phy/mscc/mscc_macsec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_macsec.c b/drivers/net/phy/mscc/mscc_macsec.c
index 4f39ba63a9a9..bcb7f5a4a8fd 100644
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
+	aes_encrypt_new(&aes, hkey, input);
+	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 static int vsc8584_macsec_transformation(struct phy_device *phydev,
 					 struct macsec_flow *flow,
-- 
2.52.0


