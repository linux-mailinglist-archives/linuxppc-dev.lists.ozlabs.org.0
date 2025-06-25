Return-Path: <linuxppc-dev+bounces-9703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E494AE77E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJ94y7Gz30Pg;
	Wed, 25 Jun 2025 17:10:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835433;
	cv=none; b=dafiOnFydQSAGx5Nk2n4PpOLREGwujS0laAU4ccJBuEHNYM/XMB7ZVhhBR1r86TZqUtTMw3G0kebb/mpkTVYVYzvoTPvy7jaxOMTN343boKlNHlaAx3Mskx6DCoZugvErkjtf65qYs8giiALO/6LXzrXgyhsaOYJLQf4UL6jOpVO3GzhemBsK0GkXS05fcqPeS3k15jtTs4S8hxly1wVIXLGoSPwvEtsnbJJ59XKp8PPWO22mcn9LSiYKiZvvB5gIa11GfQcCJs33q64069seh7UoD0fyUbwoVAZzPSWu44oIs0bu5SaVOlAy5Zz5toZbgWxbnR29g5orfqwe4pg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835433; c=relaxed/relaxed;
	bh=Rl/X8BNjuQKErI+jOCJgRTCoqLvybfG5zlXzbd1fC88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jApicFrw6ZlZ7+4zAphk39qKDSPWxnRw5/44xL+y2OJ5HSpWKxLsPuM1PiiyhiHevcoKsiodQwssJQElf+kv4tLTSFgkOYI3zabFWwMtxCGKcRnRgzoj395ZhZcz4LU4njt3cmyuha6GOBQNzc7PSGyY116gIFADfnbWxSM9kozPZ2ab0gRJZX8lQcqB9q3XHdp3NrX8E+ZAuAxSC4z95nkwMau5IPqJ0WwK31wsJohY2PGkNLPpXnAgZMS9DlOXhtZUnjcX/HBdHisEI+Fz9w9tTzJMPg7U4CPKOFE34WFa9ywPv2Ist2h1svKYH2A57LQNM6UmdCog1ibZtTpLAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AFyVXiVi; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AFyVXiVi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJ645Rpz2xbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32D384AA30;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4181C4CEF4;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835428;
	bh=UROoErFHCYCaDPqAxDhc4AhSGoASaVjnImGlpaYhSWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFyVXiVibPF18EO8gj6Jg8HFt9D0dAKEtmgBllL6vS9puXEkLps5gGp8IKQOMYoEU
	 5cIMp+c+4Lw+Md2qvcSaljt6xufjhViD2eHp77C7AyQs1BQx07SSUxJHjp1R0N/16N
	 C9qn8pZxEt5b6NDQUrlVxIrbOHtSyYVwN3KGx7y0MOmYsCFQU2MsU02kMD0HmvZdME
	 yIShdZk23UOa1raxW1EGKtqSRe/5QtI3T6rhPGDi9zx6HVJpqsBfLq3VyQx3ChC4Nn
	 p2b5qocKN78Ox6UeR+WxFAOugP5RqbJOBsLqASFPiHO8G/b6w8RjDlMzNOJo72ptLm
	 N8Lwk1i6vX/Nw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 02/18] cxl/test: Simplify fw_buf_checksum_show()
Date: Wed, 25 Jun 2025 00:08:03 -0700
Message-ID: <20250625070819.1496119-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
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


