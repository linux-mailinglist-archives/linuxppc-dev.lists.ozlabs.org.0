Return-Path: <linuxppc-dev+bounces-9701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B94AE77D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJ76z5Bz30DP;
	Wed, 25 Jun 2025 17:10:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835431;
	cv=none; b=U5P0Ehq+A5SKRKwWAH3Ipjytx8WyTjE46DRVg1tOVSUeAGWCXlt33ZfQnfaoE1cdcloMLSt5+KhGO1aPydZ5DN9N6EV6tzVFtp7zcj+cSUkZcGojIuDDzV4L/uwhHaSS5LCwO0SDRbiC9TGVOUQZp5w+mwwgxBY3RQmX7QaE4sHXDrIbSqSXSpcFejongm+9oMS+Eyt0+Oh09MPUJN9ecoOIgNzUTOJnGetxSykHFlTBh5DJjp79a1uuAykwnfmTt5y9gi3I5G4mT5Z4UQjbb1vUOkuFTUeAYfVsRnvp4Xd3VSrzvFeAozFtThSArdHk6TGvDIDdLoOP7Ek0p5AtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835431; c=relaxed/relaxed;
	bh=RHtYeLfcxPt6tkSx5THYp4Q4BiufLUsgip9qC/sOP2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqDh3f4tNIboJxx3ZSPUOuPwCzPaZmeUCLd/oxJCYxbDI3Ld9a+BbnWmKxVM4NchyDEjT3QFOXYfKDL2btxiNNp03K3PEJ+FvnCBs5aljl9aaWsqjZHoS+UTg02MhlOPyv8QezA70eaIv9cebsjRcvjToZr4JFi75rbn/bYPFCHbCNVv8CY/oKf4f/dziQu01zLya0fBygSvX2iFKdRLv8S2UTcsGiNtO6g6jhqcd9uuIyYjL+3NgoBbBA5xTOZZmXBpk2l32lOMJxiM8EV78Ul2uOxGwfhNdRZN6DiIfNRZpca4WXattHXGJHrwDahsnQgeX7dIIHZgsVpk4MpS4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eaWrFSUh; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eaWrFSUh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJ63qF8z2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEEA34AFE0;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A21C4CEF8;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835428;
	bh=MVpW9jOYl5nfA5iSMc4oN4R/qeu/fhMbVZxtFi5zdFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eaWrFSUhcCI7riLUfFOXOKpU7RRqzyayHnNsr0WqvQSAzXanOJBDrb0E5xCtJtois
	 8LShoehuDb1UkTBdzvjnDGljGp3yrYnOf2GxQfhGzZJE6b/KqYJikZ8wgjHjdNfNPi
	 mSTR1FAb33fdLl/btE0meQ09o5r4K6cPrIg9STvdmgXdU1T4r2tm+MQ235u9xHlGPe
	 cdGa0cns8ZIr3XYa0cJBGr4rbTwGYLKfBa7QGwMZwnJsPNjVGxQI3of78cc5JJiyZm
	 wU21Gged0J0nqc1T/laJis8r+d0qh5/kKhXdRXWILByu9uENEwQX2fTTLyncyq9hrE
	 LX8wskdgDHsZg==
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
Subject: [PATCH 03/18] crypto: sha512 - Use the correct legacy export format
Date: Wed, 25 Jun 2025 00:08:04 -0700
Message-ID: <20250625070819.1496119-4-ebiggers@kernel.org>
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

It appears the legacy export format is intended to have the value of the
bytecount field be block-aligned, so update __crypto_sha512_export() and
__crypto_sha512_import() to match.

Fixes: e62c2fe56418 ("crypto: sha512 - Use same state format as legacy drivers")
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha512.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/crypto/sha512.c b/crypto/sha512.c
index 0eed801346018..5bda259dd22fe 100644
--- a/crypto/sha512.c
+++ b/crypto/sha512.c
@@ -13,30 +13,42 @@
 #include <linux/module.h>
 
 /*
  * Export and import functions.  crypto_shash wants a particular format that
  * matches that used by some legacy drivers.  It currently is the same as the
- * library SHA context but with the partial block length as a u8 appended to it.
+ * library SHA context, except the value in bytecount_lo must be block-aligned
+ * and the remainder must be stored in an extra u8 appended to the struct.
  */
 
 #define SHA512_SHASH_STATE_SIZE 209
 static_assert(offsetof(struct __sha512_ctx, state) == 0);
 static_assert(offsetof(struct __sha512_ctx, bytecount_lo) == 64);
 static_assert(offsetof(struct __sha512_ctx, bytecount_hi) == 72);
 static_assert(offsetof(struct __sha512_ctx, buf) == 80);
 static_assert(sizeof(struct __sha512_ctx) + 1 == SHA512_SHASH_STATE_SIZE);
 
-static int __crypto_sha512_export(const struct __sha512_ctx *ctx, void *out)
+static int __crypto_sha512_export(const struct __sha512_ctx *ctx0, void *out)
 {
-	memcpy(out, ctx, sizeof(*ctx));
-	*((u8 *)out + sizeof(*ctx)) = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
+	struct __sha512_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount_lo % SHA512_BLOCK_SIZE;
+	ctx.bytecount_lo -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
 	return 0;
 }
 
 static int __crypto_sha512_import(struct __sha512_ctx *ctx, const void *in)
 {
-	memcpy(ctx, in, sizeof(*ctx));
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount_lo += *p;
 	return 0;
 }
 
 /* SHA-384 */
 
-- 
2.50.0


