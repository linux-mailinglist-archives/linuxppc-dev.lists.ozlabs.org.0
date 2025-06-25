Return-Path: <linuxppc-dev+bounces-9709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C2FAE77F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJF6YnPz2xRq;
	Wed, 25 Jun 2025 17:10:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835437;
	cv=none; b=M6Vo33SEHL/VdHv+zhbeAP3t6O+NcN2MntpFRZFa/uqJPybYdTzB4/3sQZPMDx17Ra2uWS695aShPIN8tk8G9xNT49NAyDpejbwayU0fhPsm2D4rrNrBOlZrgsVg13xUKVBd8pP72rP2pLi2lufjqlfAZdUu5Ku+JLnTTAQjTR2dUvXHUTW5Tpunn6C6s3bQY6uOz7XBNVGe4KIQGqxcq30i4qOT9OK+c//e8XXi4SIvaAFEQ0Lwdaf6GgVEFJCrBEjUfKwo2NBy5PdIjtxPRVQG8Ec625IJGw3blxgB8ndq6aWdhupspv2RXvOeGRtQvszrQ2V2KG8DNG7zXaPMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835437; c=relaxed/relaxed;
	bh=o4LWu6KozvZoQiXKZGQ6FjQNodQE/1qMGQqfJH1lrUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzRm1XtGZzG0+0ZPe/KZle5NCR2hrwFAZlii0uELj6FfibQZlxJYnkhYrw/QmW9OE+tLpdJ1Npktkizxltq1tZTNRkJP1hDd+CdJJY42fAeyFxt56fXWI5+P9qXXi0Ye+SfoVklclxShDo0/GeqwOjJs4CahJZgSVTyJM0fbgdhKkRqiXJb6k+Vw995/JhIAgBn4Ww8LeCUSEXiOJqqa4wuenUcmCikGz3l5NGIIn6tuWk59hlebwJcB3yrGcnSHH1ArwoNgMYcQMMumExt5zzyOF/tBzSLwUolUPQA6c/4GFrHuk7wfVooseg+dJZpxuwtY04R4NjhgEjpXCemG0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MieT5Uj1; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MieT5Uj1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJ93jMQz30PF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 949124AFF0;
	Wed, 25 Jun 2025 07:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2662DC116B1;
	Wed, 25 Jun 2025 07:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835431;
	bh=Zeed4/7J1MAgm4uZ7/OtehAGBMIbM4x8fqn9JGGd45g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MieT5Uj1Ihmp2UzLvUIECVvfhjk3XRQ+K6PX9V8lIBOWFnkgYKRzwd0E+mvcxKkHj
	 19idi9jXV7eRt+u/ctsOrGBbUX0KEZPV4Yqlr/wUuRLD5RXeNVnd3ztGGL0yDg4VZ3
	 NWARw2GjVQOG9URFFYU3D1CSUx3UZqvkFB6oXi8nQbOruRj4I+CF2PIa4gmuuYIh2s
	 IBYHZ6Sq2S4J951FOW9I20ct1vHE6hNGWiYGsYgHVhfhGBtBde6iuHOBFNAko+e3pO
	 sj2/YhXEbYitj7xuTJe6Pss/9dxrb6Sr79+OPLcr+Nz3u4AmjUc8Lgta+bpUxsbEVt
	 gYFnuHNLcMl4w==
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
Subject: [PATCH 09/18] lib/crypto: sha256: Add sha224() and sha224_update()
Date: Wed, 25 Jun 2025 00:08:10 -0700
Message-ID: <20250625070819.1496119-10-ebiggers@kernel.org>
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

Add a one-shot SHA-224 computation function sha224(), for consistency
with sha256(), sha384(), and sha512() which all already exist.

Similarly, add sha224_update().  While for now it's identical to
sha256_update(), omitting it makes the API harder to use since users
have to "know" which functions are the same between SHA-224 and SHA-256.
Also, this is a prerequisite for using different context types for each.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h           | 10 ++++++++--
 lib/crypto/sha256.c             | 10 ++++++++++
 lib/crypto/tests/sha224_kunit.c | 13 +------------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index bb181b7996cdc..e31da0743a522 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -112,22 +112,28 @@ struct sha512_state {
 	u64 state[SHA512_DIGEST_SIZE / 8];
 	u64 count[2];
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
+
 static inline void sha224_init(struct sha256_state *sctx)
 {
 	sha224_block_init(&sctx->ctx);
 }
-/* Simply use sha256_update as it is equivalent to sha224_update. */
+static inline void sha224_update(struct sha256_state *sctx,
+				 const u8 *data, size_t len)
+{
+	sha256_update(sctx, data, len);
+}
 void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
+void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
 static inline void sha256_init(struct sha256_state *sctx)
 {
 	sha256_block_init(&sctx->ctx);
 }
-void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
 void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 573ccecbf48bf..ccaae70880166 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -68,10 +68,20 @@ void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha256_final);
 
+void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE])
+{
+	struct sha256_state sctx;
+
+	sha224_init(&sctx);
+	sha224_update(&sctx, data, len);
+	sha224_final(&sctx, out);
+}
+EXPORT_SYMBOL(sha224);
+
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
diff --git a/lib/crypto/tests/sha224_kunit.c b/lib/crypto/tests/sha224_kunit.c
index 5015861a55112..c484c1d4a2a5e 100644
--- a/lib/crypto/tests/sha224_kunit.c
+++ b/lib/crypto/tests/sha224_kunit.c
@@ -3,26 +3,15 @@
  * Copyright 2025 Google LLC
  */
 #include <crypto/sha2.h>
 #include "sha224-testvecs.h"
 
-/* TODO: add sha224() to the library itself */
-static inline void sha224(const u8 *data, size_t len,
-			  u8 out[SHA224_DIGEST_SIZE])
-{
-	struct sha256_state state;
-
-	sha224_init(&state);
-	sha256_update(&state, data, len);
-	sha224_final(&state, out);
-}
-
 #define HASH sha224
 #define HASH_CTX sha256_state
 #define HASH_SIZE SHA224_DIGEST_SIZE
 #define HASH_INIT sha224_init
-#define HASH_UPDATE sha256_update
+#define HASH_UPDATE sha224_update
 #define HASH_FINAL sha224_final
 #define HASH_TESTVECS sha224_testvecs
 /* TODO: add HMAC-SHA224 support to the library, then enable the tests for it */
 #include "hash-test-template.h"
 
-- 
2.50.0


