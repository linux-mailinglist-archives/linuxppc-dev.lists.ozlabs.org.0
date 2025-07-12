Return-Path: <linuxppc-dev+bounces-10223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE82BB02DE7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:29:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8c3N0tz3bp7;
	Sun, 13 Jul 2025 09:26:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362800;
	cv=none; b=QlvE3gney7IVnWkwbxIlIGg9Ng1Z+BlKEWowuadoW8Raege9TABHay9g7/21PE1x974jykFFkmK+zfLh6RtVObr3D2oQAnWp7c8RsqBHReq1b91vDbamvrDawEeIVj+xvV2sF996JR0zhsIWdrfElDI84YPRpiBh1jllyP0qduA4Kdno9MFg9ojxNyHZxoK27hWJj/OmvnkXANNlOfCNPyaL0nzEjiBHZtahDlzeKIRB7DpxafxEvOQDfSoRvCk1zZUy000lL78vhDfyqEBoMjLOwQDSdYibK4URM+RHdDkLtZ7jHuwih/ByzAOZAY6eQnoxFOy1a4Xe+8awd3vvBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362800; c=relaxed/relaxed;
	bh=nuX1ud78/VxRBT7LeIurfx88B3B30dpQ41jGp+WBhmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZoa/sFzybiMJIY5Io8RhUamsTj1XFsEYvqRbPsP9eY9ucD0gLyOZmBqsdbU540htfgvMn/o7juXf0ZFK0glXZEx1mNcSnWJA7RKBNba+QcRkAsWehgFXBz3RxEb7U3hxxyvBUhoYWVVnsM04n6CLV4Q8xVCUpAl/cIrfiALW5qI8Yb+vVQyrqcjcODgaTaava6r4hdRlDOSipvTofQWFNIoC7Kk84Z0JNmfTJTcoN8fml8GZtCEFpT4ERQXTaUEkrvBUmTJUVSby2MSX6/IKQHzdcaLJAkXDRlLS6S8/dQpslAgAzQxNwuT08kVoeVUBCGnKRB+l8cnP9OKha6Wjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jHOgR8/e; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jHOgR8/e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8T2myMz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 528005C558A;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9477C4CEF8;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362790;
	bh=xZzl/xlzSt8gsN4p0nytxwCdAqxySD8jh31PuuGyOBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHOgR8/eAUWb+TKPF25TOK6Sliz7m1aUYz+j/MLYKMsxt4rKWRZJGo5hPIHSV64zn
	 7of82OAPvifGLUpuHuFDsjdQA92aH7ZkFpmPXS8OiM9eZNvip/CMvh2gfWUfpsJ3l4
	 CkTk+rCEkdibLqaQH8fh3UiGr6mwjUtiZs07/Qkt+YZg1C0SccjXKZMsmT6RS+7pet
	 /YF/SspJy/r11r/BVbRD6U5wKlFEU4eWNfug2GDWZgxrSSqch+PUOQAWyZXRrUKu2z
	 Vu/ThPYn8ewEdUblbxsMvgsAY7zmfj03U8oqUd9gKkQTaGl7/Z/+oEZXpbIf/sMfr8
	 r38CY8t/o97kQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 21/26] drm/bridge: it6505: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:12 -0700
Message-ID: <20250712232329.818226-22-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use the SHA-1 library instead of crypto_shash.  This is simpler and
faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/gpu/drm/bridge/Kconfig      |  3 +--
 drivers/gpu/drm/bridge/ite-it6505.c | 33 ++---------------------------
 2 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b9e0ca85226a6..89ac820a13e1e 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -118,12 +118,11 @@ config DRM_ITE_IT6505
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select EXTCON
-	select CRYPTO
-	select CRYPTO_HASH
+	select CRYPTO_LIB_SHA1
 	help
 	  ITE IT6505 DisplayPort bridge chip driver.
 
 config DRM_LONTIUM_LT8912B
 	tristate "Lontium LT8912B DSI/HDMI bridge"
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1383d1e21afea..319d956c0a28c 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -19,11 +19,11 @@
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
 #include <linux/wait.h>
 #include <linux/bitfield.h>
 
-#include <crypto/hash.h>
+#include <crypto/sha1.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -2105,39 +2105,10 @@ static void it6505_hdcp_part1_auth(struct it6505 *it6505)
 			HDCP_TRIGGER_START);
 
 	it6505->hdcp_status = HDCP_AUTH_GOING;
 }
 
-static int it6505_sha1_digest(struct it6505 *it6505, u8 *sha1_input,
-			      unsigned int size, u8 *output_av)
-{
-	struct shash_desc *desc;
-	struct crypto_shash *tfm;
-	int err;
-	struct device *dev = it6505->dev;
-
-	tfm = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(tfm)) {
-		dev_err(dev, "crypto_alloc_shash sha1 failed");
-		return PTR_ERR(tfm);
-	}
-	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
-	if (!desc) {
-		crypto_free_shash(tfm);
-		return -ENOMEM;
-	}
-
-	desc->tfm = tfm;
-	err = crypto_shash_digest(desc, sha1_input, size, output_av);
-	if (err)
-		dev_err(dev, "crypto_shash_digest sha1 failed");
-
-	crypto_free_shash(tfm);
-	kfree(desc);
-	return err;
-}
-
 static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 {
 	struct device *dev = it6505->dev;
 	u8 binfo[2];
 	int down_stream_count, err, msg_count = 0;
@@ -2203,11 +2174,11 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 	if (i <= 0) {
 		dev_err(dev, "SHA-1 Input length error %d", i);
 		return false;
 	}
 
-	it6505_sha1_digest(it6505, it6505->sha1_input, i, (u8 *)av);
+	sha1(it6505->sha1_input, i, (u8 *)av);
 	/*1B-05 V' must retry 3 times */
 	for (retry = 0; retry < 3; retry++) {
 		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
 				      sizeof(bv));
 
-- 
2.50.1


