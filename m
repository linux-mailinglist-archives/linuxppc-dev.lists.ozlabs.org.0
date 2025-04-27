Return-Path: <linuxppc-dev+bounces-8052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27162A9DFB8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 08:32:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlcD25YPmz3bby;
	Sun, 27 Apr 2025 16:31:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745735474;
	cv=none; b=Na70e6SVrWQmzhR8sJqx3xx3NL8gEl7ijN9Ts+9QlHZ2DctBausHK/cQumE/DTJzOFjkjhcuecEXzKl8qH5x26iUXC4HdJizK8p+Wr53JCUU37G5ZfCQGMmhpfYH8ytZ3pUi+b/XoRwaXMaGRrGXeFKgxWPA3AIUJC3jQ73WnjoCVk5jSN76aGkIZKN6TbirR56PIQfN9ZnSUtPxSwxdBeqn8n/D/YG54++ZhFbQMarjlKp2Mc0ljU45NjHCgVpW6I1scynbsfIbNC8/3nJU07lwKXGu8X0EiwYVhGg3iI5uREsj3Q2DnF2SguPa0K25oy8BGoANyiCvG7IuGh8axQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745735474; c=relaxed/relaxed;
	bh=p52B43yI7yzG7IFY2yqwoQVRnjSzHB18F+tstzNAX4I=;
	h=Date:Message-Id:In-Reply-To:References:From:Subject:To:Cc; b=ExMBbijzye1Jh3k8UbFQITsf2Va1YlivrIeicRbtVKNCsfcbopMlYmxO3HPZKNBBvf/RYXOuBe7CgadN4XdWZTj0rNyfKPmUQB5UXjiskcn8c2fPh7CHeu6zA/ZxZDPkpR8uxvQUa01mXqzNB1XaKgOJRu6A7N85HmMg+znhiy28l6J45VCbSroA5gTZZCWpHA9TYVHMFxxlYYz9RVYE8FYyUc8Uu8RvZOjJ7Gv6AZ1Sj1J21K5moVtv4j0Gf7ujq11QXSf6B9v/YodkPt62oJgZ+4ORCeHXCaNUS1Fp7J0WES3fAstkYLKt1Ff53cQwxzEcMIFEV75mykPZXE0/HA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=c/bG7Pmo; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=c/bG7Pmo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlcD22brQz3bWX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 16:31:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p52B43yI7yzG7IFY2yqwoQVRnjSzHB18F+tstzNAX4I=; b=c/bG7PmonGoeGCcd/Ntc0Cz8ar
	hBLXW/VxFBpKXZi3xo5i2meaz/6R3cCqYVdKIiRLrWN8VtjiN2F2WnWy/q1ssBztd4D9XD5HFR1jA
	5Pkj4sPqYktI1OYjVt90QVAYdnL20m4K4SVVgn/yL8O0uNkSi9U1peWa/6h9PeYowVZbIjhDo8FqJ
	e5ZTZoS2dqBy9gLSGnQ/qAy9o28ctdu2ZwBndw9Y4lbPpberlPlWMKIVZb8QJwVZpQTkg2i0d621G
	Iq5lPqLx2si1FzrOOa00uCCojbqrFJ2or0Rid0kTydSAI9sRXY8WsdsztGHyCvAvDQYfbfeArMD6z
	RHhemc1A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8vXk-001LXh-0E;
	Sun, 27 Apr 2025 14:31:13 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 14:31:12 +0800
Date: Sun, 27 Apr 2025 14:31:12 +0800
Message-Id: <e1fd4c41e9c1e0da47176b811e23ae2c84fa1d98.1745734678.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v2 PATCH 13/13] crypto: lib/sha256 - improve function prototypes
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

From: Eric Biggers <ebiggers@google.com>

Follow best practices by changing the length parameters to size_t and
explicitly specifying the length of the output digest arrays.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 include/crypto/internal/sha2.h |  2 +-
 include/crypto/sha2.h          |  8 ++++----
 lib/crypto/sha256.c            | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
index 09f622c2ae7d..421872a93a83 100644
--- a/include/crypto/internal/sha2.h
+++ b/include/crypto/internal/sha2.h
@@ -46,7 +46,7 @@ static inline void sha256_choose_blocks(
 
 static __always_inline void sha256_finup(
 	struct crypto_sha256_state *sctx, const u8 *src, unsigned int len,
-	u8 *out, size_t digest_size, bool force_generic,
+	u8 out[SHA256_DIGEST_SIZE], size_t digest_size, bool force_generic,
 	bool force_simd)
 {
 	unsigned int bit_offset = SHA256_BLOCK_SIZE / 8 - 1;
diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 9a56286d736d..9853cd2d1291 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -100,9 +100,9 @@ static inline void sha256_init(struct sha256_state *sctx)
 	sctx->state[7] = SHA256_H7;
 	sctx->count = 0;
 }
-void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len);
-void sha256_final(struct sha256_state *sctx, u8 *out);
-void sha256(const u8 *data, unsigned int len, u8 *out);
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
+void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 static inline void sha224_init(struct sha256_state *sctx)
 {
@@ -117,6 +117,6 @@ static inline void sha224_init(struct sha256_state *sctx)
 	sctx->count = 0;
 }
 /* Simply use sha256_update as it is equivalent to sha224_update. */
-void sha224_final(struct sha256_state *sctx, u8 *out);
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
 #endif /* _CRYPTO_SHA2_H */
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index d2bd9fdb8571..107d2bdea682 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -33,7 +33,7 @@ static inline void sha256_blocks(u32 state[SHA256_STATE_WORDS], const u8 *data,
 			     sha256_force_generic(), false);
 }
 
-void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len)
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len)
 {
 	size_t partial = sctx->count % SHA256_BLOCK_SIZE;
 
@@ -43,8 +43,8 @@ void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len)
 }
 EXPORT_SYMBOL(sha256_update);
 
-static void __sha256_final(struct sha256_state *sctx, u8 *out,
-			   size_t digest_size)
+static void __sha256_final(struct sha256_state *sctx,
+			   u8 out[SHA256_DIGEST_SIZE], size_t digest_size)
 {
 	unsigned int len = sctx->count % SHA256_BLOCK_SIZE;
 
@@ -54,19 +54,19 @@ static void __sha256_final(struct sha256_state *sctx, u8 *out,
 	memzero_explicit(sctx, sizeof(*sctx));
 }
 
-void sha256_final(struct sha256_state *sctx, u8 *out)
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha256_final);
 
-void sha224_final(struct sha256_state *sctx, u8 *out)
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA224_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha224_final);
 
-void sha256(const u8 *data, unsigned int len, u8 *out)
+void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
-- 
2.39.5


