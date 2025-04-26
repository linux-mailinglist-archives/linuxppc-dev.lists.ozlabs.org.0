Return-Path: <linuxppc-dev+bounces-8019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B38A9D8B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 08:53:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl0kL2N6tz2ywh;
	Sat, 26 Apr 2025 16:51:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745650314;
	cv=none; b=EAr904HVf85cFM04NJKJ/G46JfwsrnyoEwCdCYu4M+AS5nRFTxUm7+262BOusx5j7S8jZKxFKv1AOQ9giYxS5Ahs6CerFXP+xgjoMZKLoSV2zpqJcF1waDHDodm6I8c9GUGxe1rRgiavbkl9dnbp3PWzAD/LZfmWsICa0D/yqfWdqRewRUBgWKyr0G/zZ9SW0Y7+4D/5ax9Y7u8nFbJXfgaqE1itd7PfCVn/EjM2/q8vEJiRz8I/tGI10pRWK0pB6O+vQ39tMeCGJ+XuFLTCiqpBbgdMmjEw46GTY1RcUI4yc3YAzB0Otz18OQXsuqfPP4qjJu2VITnBYVGSPCdKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745650314; c=relaxed/relaxed;
	bh=Wn9BjgkE2+3mBCEiin0rtZNfMaiiTypr9lnO+2M+sxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrnxnC0WxLt4r+OoHWppxib3hvorgMk9CbS7r3PYr/MKvC+BGXtITRt2nRewwT5FOdU7JM57+MBQHx349pcCEGvKnF1CuVmKxqN5dKPkKXH5gH5ZHHNi9RgJOlX3CyP0IlbYsS1bvZJkeM/W230jdeRP/mavuueL5cnrj27dH1p+x1zgOrFwUPLMceVzGj7gaMQVRUOLxV69Ix56kMEgxsuiFP7z5CTMRpveYwrdoeb33WjRWTAmZIrmojgwJcgmZpGCVjfS1vXNSpQjnvPrLzasWB142AxH2crVZqyr8hQYPjYO2JOic9GseGArEqx00IzCGduao0e+PXIFCjKnNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Oq8ssxQ2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Oq8ssxQ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl0kD3Thfz2ySJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 16:51:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E074A4BC5F;
	Sat, 26 Apr 2025 06:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D10DC4CEEE;
	Sat, 26 Apr 2025 06:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745650305;
	bh=nXzVAsBZCcgzdRMgpyZqkLVLDfQ1jazwy8tBAdc6LUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oq8ssxQ2GMaLbsEayviAIoUFEUGfQTZgnJtQuqcFykH5letAis0NfyzrSfsDuCSzo
	 3mjZPq2Rg/VizvELuxhjNjHoKOZvJtjb1PIujZYuKSFuKStz3U0MPdqHOwbbQREGQ9
	 RKBtmb4JrJv4gbuQzfPxyw4cFZz9wDYz+hnL7WN1vs4zNd/n1BYh4YpwtmxkIqHhVO
	 ae99PXdIm5XQN9iaiar/CL1gYBEuX7tFehMVv2p7F2QMEAy0VCg9iI/QThbYJRjWoZ
	 wyJbqbe5imZKLIKNTFpqetItMSvvRIFT20nKYXB5P/2frtOW8Llhw0sPKFzR5Rbtx1
	 ulF6OeRhV8H7Q==
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
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 12/13] crypto: sha256 - remove sha256_base.h
Date: Fri, 25 Apr 2025 23:50:38 -0700
Message-ID: <20250426065041.1551914-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
References: <20250426065041.1551914-1-ebiggers@kernel.org>
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


