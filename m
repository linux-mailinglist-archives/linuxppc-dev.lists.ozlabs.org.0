Return-Path: <linuxppc-dev+bounces-10219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4215EB02DD7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:28:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8Z3LwJz3btP;
	Sun, 13 Jul 2025 09:26:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362798;
	cv=none; b=FasMav6rh5gVkenLzc30NhibtuJtHEamqb5A02S0awMgeOwypvc0IMC3ioMp+qTHYG7a3p9LaVjW+VT7emT2oNgWK4UUNuqoY4njYP50HH3PHCcd8uSCd63sE/qyZePSF/YWka63JeNgAPy3qSYWggoRhh7+riKCAkOwtFuBQHusIiVUKmDU6K6sBHvtWCxVQz0035zeEI5or3OSEXzvHmLFprWJRb0SGhqe5IPPupjLqfE0XUqk9y/EXSxmM7Ze0b9h1KO4k8stex9tobE9TdhziA17UmQUiY3EUlRzLS7R+4xKTjRg6T3tmf2cxW5aar7gMfXSaUekmPDVfGJqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362798; c=relaxed/relaxed;
	bh=zx0KRsr6Z94mFqcy8f/S8MW+ZSAXG2w2PHmp+/LpmB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQMDK65ti7xWTgHwbD/KjzZU/gVh6mR110jhJv9OEppo3l6W4Adkja5swvEKHAYroicaLkTgWmlWzkhNhzNtQABgS2HIKwxiZX7AnimRCOmIB02qv3As+BVGFSkYSa9ZRvx7jdltNIkxpXR93yHX3nZ3KhbGUfMSK85rKPeUvNC/31IiCFu1Nq//5Gz8+IJcoMlMWgpQksFsCmMqKymIIHCFJu/oA/AQ5pbtQt8xmYm8lEeryig/ofveA+ZzGuxlnitAdCM3QtS5ja/mJrmdTttbMPnKbMmV803xm3puYD1bJabTx0kXjk41vw31h2rC+SSkXF0YPp+RDS95953Tlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IPqiN3o3; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IPqiN3o3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8S4fjtz3bpL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C44DE5C5586;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D7EC4CEF7;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362790;
	bh=CDCYvw9FzfgzLkUqSoVUscxv3AohvreIQRjFCF8Awe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPqiN3o3F2CcnU/lSiSEcezOvpLqcfESj5gdIyQXIgp9TcpJNc4+SEOkjA/C+spGj
	 Zfst73HKBkJ3RTDUfFDKvQl7Mmw5pFdQYEglIXAhZC+EODLHKRSiXTX9qIZsb0r+6+
	 1IfmLcXJraIBl0WHAvq6RVh9qLNWkjfrS6B3lhzdE9bVdL3PclsJIcFWKGGHADQexc
	 oT0UaUvZGa0iS8nC0/6k8yEYGLRNGqkkHiXlesa3+yHAYn4wA3zfIhdu47yh0jD44S
	 7YhcfQhrICpQD72yjxbbQ4I94wj4xoa+kWSTHNjoYKh6ovpvEJkyWDNQRcS909kSeF
	 7YLhXtd85zZdA==
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
Subject: [PATCH 22/26] nfc: s3fwrn5: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:13 -0700
Message-ID: <20250712232329.818226-23-ebiggers@kernel.org>
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
 drivers/nfc/s3fwrn5/Kconfig    |  3 +--
 drivers/nfc/s3fwrn5/firmware.c | 17 +----------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/Kconfig b/drivers/nfc/s3fwrn5/Kconfig
index 8a6b1a79de253..96386b73fa2b6 100644
--- a/drivers/nfc/s3fwrn5/Kconfig
+++ b/drivers/nfc/s3fwrn5/Kconfig
@@ -1,10 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config NFC_S3FWRN5
 	tristate
-	select CRYPTO
-	select CRYPTO_HASH
+	select CRYPTO_LIB_SHA1
 	help
 	  Core driver for Samsung S3FWRN5 NFC chip. Contains core utilities
 	  of chip. It's intended to be used by PHYs to avoid duplicating lots
 	  of common code.
 
diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 781cdbcac104c..64d61b2a715ae 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -6,11 +6,10 @@
  * Robert Baldyga <r.baldyga@samsung.com>
  */
 
 #include <linux/completion.h>
 #include <linux/firmware.h>
-#include <crypto/hash.h>
 #include <crypto/sha1.h>
 
 #include "s3fwrn5.h"
 #include "firmware.h"
 
@@ -409,31 +408,17 @@ bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 version
 int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 {
 	struct device *dev = &fw_info->ndev->nfc_dev->dev;
 	struct s3fwrn5_fw_image *fw = &fw_info->fw;
 	u8 hash_data[SHA1_DIGEST_SIZE];
-	struct crypto_shash *tfm;
 	u32 image_size, off;
 	int ret;
 
 	image_size = fw_info->sector_size * fw->image_sectors;
 
 	/* Compute SHA of firmware data */
-
-	tfm = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(tfm)) {
-		dev_err(dev, "Cannot allocate shash (code=%pe)\n", tfm);
-		return PTR_ERR(tfm);
-	}
-
-	ret = crypto_shash_tfm_digest(tfm, fw->image, image_size, hash_data);
-
-	crypto_free_shash(tfm);
-	if (ret) {
-		dev_err(dev, "Cannot compute hash (code=%d)\n", ret);
-		return ret;
-	}
+	sha1(fw->image, image_size, hash_data);
 
 	/* Firmware update process */
 
 	dev_info(dev, "Firmware update: %s\n", fw_info->fw_name);
 
-- 
2.50.1


