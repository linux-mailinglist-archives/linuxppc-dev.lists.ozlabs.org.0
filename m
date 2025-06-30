Return-Path: <linuxppc-dev+bounces-9921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF3AEE394
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:09:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1d4szXz3bgV;
	Tue,  1 Jul 2025 02:09:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299765;
	cv=none; b=dN+sX4kYQwcIGvLijNZ3VegnkGZ2k0OmYdd7yqYWDRW50BZmEwYBY1XoqEuoqI0LJvWctvw2iFw3MEerW57qjvMMoURXavkMLQSu0UV/cJ/GXEKtYiQCy1GsLq+JtBDhR2hUt6jt8XGcxFRszIOAVQxphrfo/sOFxb9YCrqSbvSf/okQ36T+NGNSvz+gfE9DgYtKaG7P0oBRZrhxnoZEW+nwAWJujpTDP50EYljp6BqV/gBgsFGZVAzjBDZsTVMYq18nSKsE62iHDLwXt1tRVDJEy9h+0Pk4wiBQHepwcXEkYWlMgdR+NcFTwB4QR6bE0kC4d9uCCVKGUSaMxGnUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299765; c=relaxed/relaxed;
	bh=Rl/X8BNjuQKErI+jOCJgRTCoqLvybfG5zlXzbd1fC88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcNcyCVBH3oLp8UlxFkYI7VkpuwKN5YM7TRrqSwe21NrnSdOdMRUXCCPY09Rinl9AL2cRawyqRo1mhtPAWXoO34DC+/a/GyKWMQVjuzuomebhpUf0/ifxzg19le8g9ySfkzT7UrQZt0OdXz4gSgC83NlziAAEyShPscxrJhY+BviKw59gi7jIRJip/n0gXidbGsXFimuNxqDPvicJDwVjs3CmpCzjPeCBBE1sAhXNeKxCixgmqWUtgHFXCZf8k1sIz4V2foK2iBAdHEbVw4dgA5ka2xCyuRA8eeRa05pJOZWaZ1tCJ4ihlQzrtzRWm8QmrCqERdE/Uw2vbT8/X4ERg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lFhWefsH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lFhWefsH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1c2Hqwz30Qb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE3BC464BC;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258CAC4CEF3;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299761;
	bh=UROoErFHCYCaDPqAxDhc4AhSGoASaVjnImGlpaYhSWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFhWefsH1fRXhIkYKGeZupotUIuzQK0mHzeRtMkQRgdXPsGlkhpPRKQobnQvGKuGT
	 7PnPapOh93KHn6MH4/WuOrwHL2xVOcpK28cyBs6+yH63i0K+m/eh3SvOmAcFeq4kxI
	 ytKgB/RYasfDuHhowfiLEeDwE87VFQr62Fm8GOL/0SHcZODK/rDekuBg57dxIvGfRV
	 nhfM4qJVirbVxiqe2/U+pyUjo6po/3IlrnKZeXL/oo5RjjQ94CZbiYjI3Vrm6Q8Qev
	 NQVMh2AOzs2cg7eK1PcomkfvEIHncEcPRawm+yQBRlbaqBJ+ws+8cn9ct24/SMfzFx
	 rTjzEXS2tfbtQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 02/14] cxl/test: Simplify fw_buf_checksum_show()
Date: Mon, 30 Jun 2025 09:06:33 -0700
Message-ID: <20250630160645.3198-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

First, just use sha256() instead of a sequence of sha256_init(),
sha256_update(), and sha256_final().  The result is the same.

Second, use *phN instead of open-coding the conversion of bytes to hex.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 tools/testing/cxl/test/mem.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
index 0f1d91f57ba34..d533481672b78 100644
--- a/tools/testing/cxl/test/mem.c
+++ b/tools/testing/cxl/test/mem.c
@@ -1826,31 +1826,14 @@ static DEVICE_ATTR_RW(security_lock);
 static ssize_t fw_buf_checksum_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
 	u8 hash[SHA256_DIGEST_SIZE];
-	unsigned char *hstr, *hptr;
-	struct sha256_state sctx;
-	ssize_t written = 0;
-	int i;
-
-	sha256_init(&sctx);
-	sha256_update(&sctx, mdata->fw, mdata->fw_size);
-	sha256_final(&sctx, hash);
-
-	hstr = kzalloc((SHA256_DIGEST_SIZE * 2) + 1, GFP_KERNEL);
-	if (!hstr)
-		return -ENOMEM;
-
-	hptr = hstr;
-	for (i = 0; i < SHA256_DIGEST_SIZE; i++)
-		hptr += sprintf(hptr, "%02x", hash[i]);
 
-	written = sysfs_emit(buf, "%s\n", hstr);
+	sha256(mdata->fw, mdata->fw_size, hash);
 
-	kfree(hstr);
-	return written;
+	return sysfs_emit(buf, "%*phN\n", SHA256_DIGEST_SIZE, hash);
 }
 
 static DEVICE_ATTR_RO(fw_buf_checksum);
 
 static ssize_t sanitize_timeout_show(struct device *dev,
-- 
2.50.0


