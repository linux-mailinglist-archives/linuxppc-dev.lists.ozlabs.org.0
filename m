Return-Path: <linuxppc-dev+bounces-9715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069DDAE780B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJN2P3Rz30WT;
	Wed, 25 Jun 2025 17:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835444;
	cv=none; b=l8Oe3hhfffO4g6UX7zU+n9McoikSxiYuXGun7DCBlvPFYn7Z6j8aOrAMuU9ky+DTUr9bp41FLM8F0xlEJfBNrfFs4d3Hc9eXVX5mW3BWDp806JfQnfDXf0ib6J+yjkNbsr1rHi5Jr6dp3xCVaRH3Gw+TnmcqJJo27hXoqGDRNBYJiXIpZcsAMAaqXOn/TlBQQFhwj1Fd/6jiZSseSp+oxke8xafkld8l2EoP8Yhml/vZgfHcqK6Ih2sJRNtYeAll4bWnLTWzFxRc6kV/bpG+QL4lsHW8C85XPmjNMLMhZchrGFOgz3wBdeueBSAOqs2sX/x9iI64C/hnxUG5r1cTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835444; c=relaxed/relaxed;
	bh=n8jXU1q6B0KX6KZxSGCS7rIxrQ9U7LY3BptCiu+mNFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Elq2tunb5RmnBIW68aBcXHV5GpXIsPhzdzF5U7arjwtPIjk8G+mcaOQIztfuOQHEdwEM0FUNw+6OyWxu5gvxZXNCZBydzGRE/JYcqRTRPeVgxRTpSY/n6MuwyF+rPg3NUUnirCbGXXfWs0lRx9n3VU9LrD7yn/RzgzgNxO7B6AbgLXvYJCtld1vzE78R5nWxXIe9t1z7Ylggp0SEb1O4lh5bBoaDkhOisICnL7kG+QepiQpWJglnZ6etQz4kGQAFZpGTEuuG5/WmkNh6hEngJyOZ5+VRADAXYpdwc5iAuNs5wHX8GuLL7lpaILz3N54vzsfI3zq/1xTch7yKK0mbHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bH9JuMjc; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bH9JuMjc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJF2gDtz3bNt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E6B85C61E3;
	Wed, 25 Jun 2025 07:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFCAC4CEF2;
	Wed, 25 Jun 2025 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835435;
	bh=Y+OM4xhFGnbbVJB2/pk7w3PVA+sL8KWZ8Ahn07y2y1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bH9JuMjcvx3J7GtUczSjT11nGI4YWbo07MYlZLzC2HhSWEMCp2w/3F76EUQDdl9aH
	 x3U0E8JYWVjle7diqxhGtq75vEUoC36KAdmOt5ehtup8q9m0RB23nlpgatFdW+xPro
	 JnvpTRlkc04oJMwRgnosZlVo8rkhPtz1xEyaez2xP71hb1UjwpZwEHoEgz9hwvZZ8w
	 Xg73giZDP2UVojmC6ER8rObGC/udaKqdU8qwkmAQlqBDk2z567b670tXgzD5vy92Bv
	 LTPxk9gDYjyHb92F+u8ONsV4Eu9yHAg8GfgBAM3Y1PeC6Az6HX0fnNqfEvvqWnzfdm
	 PfOgccGBMYwtA==
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
Subject: [PATCH 17/18] lib/crypto: sha256: Sync sha256_update() with sha512_update()
Date: Wed, 25 Jun 2025 00:08:18 -0700
Message-ID: <20250625070819.1496119-18-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The BLOCK_HASH_UPDATE_BLOCKS macro is difficult to read.  For now, let's
just write the update explicitly in the straightforward way, mirroring
sha512_update().  It's possible that we'll bring back a macro for this
later, but it needs to be properly justified and hopefully a bit more
readable.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha256.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 0de49bf8e8b8b..c93bf4699160c 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -8,11 +8,10 @@
  * Copyright (c) 2014 Red Hat Inc.
  * Copyright 2025 Google LLC
  */
 
 #include <crypto/hmac.h>
-#include <crypto/internal/blockhash.h>
 #include <crypto/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
@@ -177,12 +176,35 @@ EXPORT_SYMBOL_GPL(sha256_init);
 void __sha256_update(struct __sha256_ctx *ctx, const u8 *data, size_t len)
 {
 	size_t partial = ctx->bytecount % SHA256_BLOCK_SIZE;
 
 	ctx->bytecount += len;
-	BLOCK_HASH_UPDATE_BLOCKS(sha256_blocks, &ctx->state, data, len,
-				 SHA256_BLOCK_SIZE, ctx->buf, partial);
+
+	if (partial + len >= SHA256_BLOCK_SIZE) {
+		size_t nblocks;
+
+		if (partial) {
+			size_t l = SHA256_BLOCK_SIZE - partial;
+
+			memcpy(&ctx->buf[partial], data, l);
+			data += l;
+			len -= l;
+
+			sha256_blocks(&ctx->state, ctx->buf, 1);
+		}
+
+		nblocks = len / SHA256_BLOCK_SIZE;
+		len %= SHA256_BLOCK_SIZE;
+
+		if (nblocks) {
+			sha256_blocks(&ctx->state, data, nblocks);
+			data += nblocks * SHA256_BLOCK_SIZE;
+		}
+		partial = 0;
+	}
+	if (len)
+		memcpy(&ctx->buf[partial], data, len);
 }
 EXPORT_SYMBOL(__sha256_update);
 
 static void __sha256_final(struct __sha256_ctx *ctx,
 			   u8 *out, size_t digest_size)
-- 
2.50.0


