Return-Path: <linuxppc-dev+bounces-9927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A7AEE39E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:10:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1p4YnQz3btt;
	Tue,  1 Jul 2025 02:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299774;
	cv=none; b=A3TAm9VpIZr1t8Drc3lSXYjpQWTTPj5mGqnfVtioJFXb0upGcAqT0deGLr+COfSKu2Ldq6AaUBFGAECM8MLhWo+hWOwJsMA9Ex6EDe3lNKJyuvlX1oPY1wXNaKQe/Nu6ZHrfMf6S596pTIsRfdaOEYWN8e21qclFeufV192grBaMFEvcovvtHRXNcRbLooDdxg+/RqaP/kO239uShfEZJ7d8bbMQIglERhw3wtx4CiRFn578R0PRuagf9scJTHJSGYGwY6R9t1F5LuQ4gp4sCMnRDwbmS+tFfkNDR0/RqFY1rqSSGnK4WpJg5XOEM98YOjQEuGg7KwDThjYk4mD6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299774; c=relaxed/relaxed;
	bh=yEP3nEF4suXztEVxed5w1165cW8JrFC2ZGIZr2vQaKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jShPeM46XoKAyGlURhjGNRCgYCJ/tH9SkP/Td/Ke33c6GhFWbDZr8ljk+T/I6OuVVaWRbO4+zWr1dHu4YP+HzysJDUy1uWP4adpmcBXbUxqDz3XlyvxbM3t5kFaJis3TP5fDX9L9yYk7qULLH7D8wz+fhwxYAjjVcc9jqnXrgHwA7brmKAI7zWUwe51yU39gIrdEoXI3d68p8gyouR6ixYp6fw+nUM3+YtWEtwVoAwD+1dJ8mUs/4sxLnFSiVH33jWX1aEl9eXYuevYOP69X7CzyTZWuNClWonPYQrJ1/z/mN0aRtVl7lzIBLqS1eQ7ZXAgoCmaH+HKNzXjbVSgCmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oN5D7nM6; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oN5D7nM6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1j38LHz3brr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C7A9A53426;
	Mon, 30 Jun 2025 16:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4921C4CEF2;
	Mon, 30 Jun 2025 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299767;
	bh=hI7/9MXXn63qxg1DA2W2CAE23ZWS/FopAAuRjD/xhFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oN5D7nM68TGKPGZYZfUCmR2idT6QSU/9V6Bm4Nd+BH4W3ccbIdeb6eX7QizYZe7ce
	 b1C5ugHHJ0UyxkvLvqKHVwgxGKT2tGHhB6SkNjeJGS9EyxEhNmgQq5gaTCKepPBrbJ
	 5/KKuQsavBRZWjviiWq9Uc2bjEiTbU9DMXo7pTiwZtgmTIrc/Rb1onnm2pYpEKE2nL
	 jc5sTkLpA1W6qHTjKTlNmOXhKDDJcBdsrgZFT2ZZcVkciO2+Tsu4E2Cq1YITmIm7m9
	 uWHqbWEOtWiMOYhvUlspb4D980aEHInjhTTJMzcxAAfrmqYalRCh3cKOmAFJLmFBiN
	 uueT2Z+/VqTzA==
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
Subject: [PATCH v2 13/14] lib/crypto: sha256: Sync sha256_update() with sha512_update()
Date: Mon, 30 Jun 2025 09:06:44 -0700
Message-ID: <20250630160645.3198-14-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
index 68936d5cd7745..808438d4f4278 100644
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
 #include <linux/string.h>
@@ -178,12 +177,35 @@ EXPORT_SYMBOL_GPL(sha256_init);
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


