Return-Path: <linuxppc-dev+bounces-8130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE112A9F6AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 19:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmV9l6M7zz3blv;
	Tue, 29 Apr 2025 03:02:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745859733;
	cv=none; b=l8YnZlAO9BQoj5ER6JX91eMfzxSqxGYoSJTYyLKDmN1SLXbooQLXNFgVQurQnm5VMx1KQe7kLDXpjfcaLv9y2Tv7+/UUceyyZ1pEUwuWrB6WUCRcK6Fopo5EtNwNARtM1OL186f3qi4boDKC6RToXtPTeGhpqn4s7WLpzXEa+74vDbi2eIt3kno9VCuq7XZt+F5QNb1BeqPAnzLHGLSLQkvzsds12xgd+a04wt4smKIVgFYZVG1cZ8b0BMEtfaz+BaAIlQW5JDy2FJLKWVV1YUrhci2zfM+jZUAmhOOWourxiUNwF0k+gI1VLmiVzTcNfClHtTfM5unQrtX4eE7K1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745859733; c=relaxed/relaxed;
	bh=Wn9BjgkE2+3mBCEiin0rtZNfMaiiTypr9lnO+2M+sxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6jnSuQVT1i/iC1EyzmDa8yd0VdVd+GnN/dYtOmApOWZ/8/pzPjw707805htb0arlzAeQE79m8Fd4rJ5xpO6hW6Wys9Ht8JMIByHpLW68HlZXFytbcMipCGSgYAB9odIccMm91JbIbd59REMU9SdBVFUTyQwFrkIp9enKkiTH0A0YLNAe101Riplc6Jc5fXVr5ZhAXGekPwu3MN4CVndPAFV1sXlodrf/kFHnAm3isUTV63w53sAKrRjSw4dyLvX6c1pTE9bRstf90YwYIAaMfzpilDqJ8yG+X6jiHSIcRJ/3WhdZ4lyNta+FJ/QYAKcd+8GIBynBTQjUp8cZXg12g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fhWU0v5r; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fhWU0v5r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmV9Z3wHRz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 03:02:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B45F44AAB0;
	Mon, 28 Apr 2025 17:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51142C4CEE4;
	Mon, 28 Apr 2025 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859725;
	bh=nXzVAsBZCcgzdRMgpyZqkLVLDfQ1jazwy8tBAdc6LUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fhWU0v5rvclI0LyXWoFJWCc8BBqZDSK9XM7bRtugjwHxkC9RmCMCl2vCKuOh436Ey
	 Ig/QtscHPvoggKplKY8rsRsfkwt0OwdOq34ZqZDAbiEv8E5P01FA/mfMJ72ATs6yi5
	 xtI4vlMR9BO7Dk/EK/p0TqckPPgaRp0M4L70oTI7kuhAq08xKo8Ct0naj+YkYryNq7
	 blhBW4oQl/I7gEJaoQUPcdRlQut7zku3n/Ndeo5F4OSGVa3pMFbqtC6wAXO56chZBJ
	 HuVy4LX5Sijc6DMVip1M6D8+vuscZaaisIZodo+tI3jQpBF1IChO5AMAywdJvSVo6A
	 y5G4kI3kbrXAg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v4 12/13] crypto: sha256 - remove sha256_base.h
Date: Mon, 28 Apr 2025 10:00:37 -0700
Message-ID: <20250428170040.423825-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428170040.423825-1-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

sha256_base.h is no longer used, so remove it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/crypto/sha256_base.h | 183 -----------------------------------
 1 file changed, 183 deletions(-)
 delete mode 100644 include/crypto/sha256_base.h

diff --git a/include/crypto/sha256_base.h b/include/crypto/sha256_base.h
deleted file mode 100644
index 6878fb9c26c04..0000000000000
--- a/include/crypto/sha256_base.h
+++ /dev/null
@@ -1,183 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sha256_base.h - core logic for SHA-256 implementations
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#ifndef _CRYPTO_SHA256_BASE_H
-#define _CRYPTO_SHA256_BASE_H
-
-#include <crypto/internal/hash.h>
-#include <crypto/internal/sha2.h>
-#include <linux/math.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-typedef void (sha256_block_fn)(struct crypto_sha256_state *sst, u8 const *src,
-			       int blocks);
-
-static inline int sha224_base_init(struct shash_desc *desc)
-{
-	struct sha256_state *sctx = shash_desc_ctx(desc);
-
-	sha224_init(sctx);
-	return 0;
-}
-
-static inline int sha256_base_init(struct shash_desc *desc)
-{
-	struct sha256_state *sctx = shash_desc_ctx(desc);
-
-	sha256_init(sctx);
-	return 0;
-}
-
-static inline int lib_sha256_base_do_update(struct sha256_state *sctx,
-					    const u8 *data,
-					    unsigned int len,
-					    sha256_block_fn *block_fn)
-{
-	unsigned int partial = sctx->count % SHA256_BLOCK_SIZE;
-	struct crypto_sha256_state *state = (void *)sctx;
-
-	sctx->count += len;
-
-	if (unlikely((partial + len) >= SHA256_BLOCK_SIZE)) {
-		int blocks;
-
-		if (partial) {
-			int p = SHA256_BLOCK_SIZE - partial;
-
-			memcpy(sctx->buf + partial, data, p);
-			data += p;
-			len -= p;
-
-			block_fn(state, sctx->buf, 1);
-		}
-
-		blocks = len / SHA256_BLOCK_SIZE;
-		len %= SHA256_BLOCK_SIZE;
-
-		if (blocks) {
-			block_fn(state, data, blocks);
-			data += blocks * SHA256_BLOCK_SIZE;
-		}
-		partial = 0;
-	}
-	if (len)
-		memcpy(sctx->buf + partial, data, len);
-
-	return 0;
-}
-
-static inline int lib_sha256_base_do_update_blocks(
-	struct crypto_sha256_state *sctx, const u8 *data, unsigned int len,
-	sha256_block_fn *block_fn)
-{
-	unsigned int remain = len - round_down(len, SHA256_BLOCK_SIZE);
-
-	sctx->count += len - remain;
-	block_fn(sctx, data, len / SHA256_BLOCK_SIZE);
-	return remain;
-}
-
-static inline int sha256_base_do_update_blocks(
-	struct shash_desc *desc, const u8 *data, unsigned int len,
-	sha256_block_fn *block_fn)
-{
-	return lib_sha256_base_do_update_blocks(shash_desc_ctx(desc), data,
-						len, block_fn);
-}
-
-static inline int lib_sha256_base_do_finup(struct crypto_sha256_state *sctx,
-					   const u8 *src, unsigned int len,
-					   sha256_block_fn *block_fn)
-{
-	unsigned int bit_offset = SHA256_BLOCK_SIZE / 8 - 1;
-	union {
-		__be64 b64[SHA256_BLOCK_SIZE / 4];
-		u8 u8[SHA256_BLOCK_SIZE * 2];
-	} block = {};
-
-	if (len >= bit_offset * 8)
-		bit_offset += SHA256_BLOCK_SIZE / 8;
-	memcpy(&block, src, len);
-	block.u8[len] = 0x80;
-	sctx->count += len;
-	block.b64[bit_offset] = cpu_to_be64(sctx->count << 3);
-	block_fn(sctx, block.u8, (bit_offset + 1) * 8 / SHA256_BLOCK_SIZE);
-	memzero_explicit(&block, sizeof(block));
-
-	return 0;
-}
-
-static inline int sha256_base_do_finup(struct shash_desc *desc,
-				       const u8 *src, unsigned int len,
-				       sha256_block_fn *block_fn)
-{
-	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
-
-	if (len >= SHA256_BLOCK_SIZE) {
-		int remain;
-
-		remain = lib_sha256_base_do_update_blocks(sctx, src, len,
-							  block_fn);
-		src += len - remain;
-		len = remain;
-	}
-	return lib_sha256_base_do_finup(sctx, src, len, block_fn);
-}
-
-static inline int lib_sha256_base_do_finalize(struct sha256_state *sctx,
-					      sha256_block_fn *block_fn)
-{
-	unsigned int partial = sctx->count % SHA256_BLOCK_SIZE;
-	struct crypto_sha256_state *state = (void *)sctx;
-
-	sctx->count -= partial;
-	return lib_sha256_base_do_finup(state, sctx->buf, partial, block_fn);
-}
-
-static inline int sha256_base_do_finalize(struct shash_desc *desc,
-					  sha256_block_fn *block_fn)
-{
-	struct sha256_state *sctx = shash_desc_ctx(desc);
-
-	return lib_sha256_base_do_finalize(sctx, block_fn);
-}
-
-static inline int __sha256_base_finish(u32 state[SHA256_DIGEST_SIZE / 4],
-				       u8 *out, unsigned int digest_size)
-{
-	__be32 *digest = (__be32 *)out;
-	int i;
-
-	for (i = 0; digest_size > 0; i++, digest_size -= sizeof(__be32))
-		put_unaligned_be32(state[i], digest++);
-	return 0;
-}
-
-static inline void lib_sha256_base_finish(struct sha256_state *sctx, u8 *out,
-					  unsigned int digest_size)
-{
-	__sha256_base_finish(sctx->state, out, digest_size);
-	memzero_explicit(sctx, sizeof(*sctx));
-}
-
-static inline int sha256_base_finish(struct shash_desc *desc, u8 *out)
-{
-	unsigned int digest_size = crypto_shash_digestsize(desc->tfm);
-	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
-
-	return __sha256_base_finish(sctx->state, out, digest_size);
-}
-
-static inline void sha256_transform_blocks(struct crypto_sha256_state *sst,
-					   const u8 *input, int blocks)
-{
-	sha256_blocks_generic(sst->state, input, blocks);
-}
-
-#endif /* _CRYPTO_SHA256_BASE_H */
-- 
2.49.0


