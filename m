Return-Path: <linuxppc-dev+bounces-7467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0381A7CB61
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Apr 2025 20:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZVPDm5hJsz2yfx;
	Sun,  6 Apr 2025 04:31:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743877864;
	cv=none; b=oVP3v20IjjaQgD4ywgq4fMnr6GhMnUKCG2apaUNzNJNPumeDmmjcTU4RHwWETUjE2iq87osBKPJ2C7Pu5Fe3k4RJq/jWVMEE4fx2ZswVYhbmuOeHLKXlzUdjoTSQywWBpLsDaO4pB1utBYBIoCzeftG63hXn1zTveuobecBOI0csSGuXukvLXAnnKm/prJP2v4eF+oOMZ6hNFVWzHH93kgPLHLoxnIywMkOl7qpSIYTGvkodEzpzW8EKUZhPwmrtsf4fFwfcHHAISxZP7ckxC46O83mlabdD2XmgrnDDOf4vboUcKLu3fpvAHqSf55rqxKfAczi0B9+/qjHk6bCjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743877864; c=relaxed/relaxed;
	bh=nhCL9ALqrw3D/8w7HiPkEzxnjAyvDKamWX6KnYu6nwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fL1XSgmH9tma8BVBW+vv2wAS1RCV1hUKsFGolSahPijtiL5YPaYtHI2U1chePAyI68PO7E5/M7t8TwuxIcOxMdQ/fbIXYFRLeJ5O6hcXdK9jv+NYrO/9y9t6v8DSu0Wyy9QMFDUkC40qqoE8ZNkfMl9cjdqJrJ+P32PYUQUqsv7zw/VzOuclFg7Yx+eZQo5UMLcJlHKJK//2odQZ0FRhyFvbrKL+qGlfVpYSVSZN6NeNmoC+RXDuN1sUoBQkOHIfNsv8TI7C+1sdy0pdKs2vNCdZrbLBp8lPkFQFY7FHO1m+/9K70xaRxf8MQSEAYL4nkAJC+uFRjKa17HG0/XcVaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ju1cg6yr; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ju1cg6yr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZVPDh1Ltwz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Apr 2025 04:30:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80AAD61139;
	Sat,  5 Apr 2025 18:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91BCC4CEEE;
	Sat,  5 Apr 2025 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877857;
	bh=xm9pQBjynxcvCeIRTBV15aMlBzjyI8/pKv+7T2s3kQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ju1cg6yronHNVCwqCj3RXAUddHMdeVnV37A1BlKl8lKfGjcLZ1O5Jr47JPwtgEb8w
	 kBtjrQz3oQTK0rF2GIxt9Jca1cQ2ovIovsG6x4ozwgzI/GbWA8lRcEtmfqMDHrTqpT
	 GkdEJQJ46F2Rn2YbfgjD6ZNJWzdg9KZ4ECZmXWRKimG527EO6mCfbyhULimX30AAin
	 iZ+x9yi8figCx1FLSGpxDTsI1oClBdWm+rRR1K6l7HqAHfcbGiEQ2Yy0vRh9G1DEDV
	 Fz64+CRHAlOrMoZ3dqTecWbhgJP5bMpDNyYjfK3/ZQdfcw+7ZrPkaN6Q+fqq/Aktxg
	 VZhaClah8z4gQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 9/9] crypto: chacha - remove <crypto/internal/chacha.h>
Date: Sat,  5 Apr 2025 11:26:09 -0700
Message-ID: <20250405182609.404216-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
References: <20250405182609.404216-1-ebiggers@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

<crypto/internal/chacha.h> is now included only by crypto/chacha.c, so
fold it into there.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/chacha.c                  | 35 +++++++++++++++++++++++++-
 include/crypto/internal/chacha.h | 43 --------------------------------
 2 files changed, 34 insertions(+), 44 deletions(-)
 delete mode 100644 include/crypto/internal/chacha.h

diff --git a/crypto/chacha.c b/crypto/chacha.c
index 2009038c5e56c..5103bc0b2881f 100644
--- a/crypto/chacha.c
+++ b/crypto/chacha.c
@@ -6,14 +6,47 @@
  * Copyright (C) 2018 Google LLC
  */
 
 #include <linux/unaligned.h>
 #include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
+#include <crypto/chacha.h>
 #include <crypto/internal/skcipher.h>
 #include <linux/module.h>
 
+struct chacha_ctx {
+	u32 key[8];
+	int nrounds;
+};
+
+static int chacha_setkey(struct crypto_skcipher *tfm,
+			 const u8 *key, unsigned int keysize, int nrounds)
+{
+	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
+	int i;
+
+	if (keysize != CHACHA_KEY_SIZE)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->key); i++)
+		ctx->key[i] = get_unaligned_le32(key + i * sizeof(u32));
+
+	ctx->nrounds = nrounds;
+	return 0;
+}
+
+static int chacha20_setkey(struct crypto_skcipher *tfm,
+			   const u8 *key, unsigned int keysize)
+{
+	return chacha_setkey(tfm, key, keysize, 20);
+}
+
+static int chacha12_setkey(struct crypto_skcipher *tfm,
+			   const u8 *key, unsigned int keysize)
+{
+	return chacha_setkey(tfm, key, keysize, 12);
+}
+
 static int chacha_stream_xor(struct skcipher_request *req,
 			     const struct chacha_ctx *ctx, const u8 *iv,
 			     bool arch)
 {
 	struct skcipher_walk walk;
diff --git a/include/crypto/internal/chacha.h b/include/crypto/internal/chacha.h
deleted file mode 100644
index b085dc1ac1516..0000000000000
--- a/include/crypto/internal/chacha.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _CRYPTO_INTERNAL_CHACHA_H
-#define _CRYPTO_INTERNAL_CHACHA_H
-
-#include <crypto/chacha.h>
-#include <crypto/internal/skcipher.h>
-#include <linux/crypto.h>
-
-struct chacha_ctx {
-	u32 key[8];
-	int nrounds;
-};
-
-static inline int chacha_setkey(struct crypto_skcipher *tfm, const u8 *key,
-				unsigned int keysize, int nrounds)
-{
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	int i;
-
-	if (keysize != CHACHA_KEY_SIZE)
-		return -EINVAL;
-
-	for (i = 0; i < ARRAY_SIZE(ctx->key); i++)
-		ctx->key[i] = get_unaligned_le32(key + i * sizeof(u32));
-
-	ctx->nrounds = nrounds;
-	return 0;
-}
-
-static inline int chacha20_setkey(struct crypto_skcipher *tfm, const u8 *key,
-				  unsigned int keysize)
-{
-	return chacha_setkey(tfm, key, keysize, 20);
-}
-
-static inline int chacha12_setkey(struct crypto_skcipher *tfm, const u8 *key,
-				  unsigned int keysize)
-{
-	return chacha_setkey(tfm, key, keysize, 12);
-}
-
-#endif /* _CRYPTO_CHACHA_H */
-- 
2.49.0


