Return-Path: <linuxppc-dev+bounces-10216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B49B02DCF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:28:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8X4Kzqz3bsM;
	Sun, 13 Jul 2025 09:26:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362796;
	cv=none; b=cUQUafJFhaOhI7OJatcjK/Kem8vSh7CJedznRtk8SjnhL0rV66N3MkKGa7igFMtTHhIlUKXlmOa7V5Y1UV5XPrHSvs6GpPGIZ1gx0utbQzyPo4WD/Ke2rXlmmwY8rjI2hfSF7d5ihLEaX9BSmreoheVcUkWR8n73nxUbRGLKcM/I+Q6X1T6tbdz/ETFhmijAbQGHWiaPzR8E//hg0D5zmvopsRDhXaapP86bHw6GcyfK5qehEBMiSfZRGKAclNjsxkasEJgtDuHe6hNlRYiSdq8kgkQKcpfRbJGo24qhHsYZ3NGjGKB/jYYpi7CAN4kupGG8NcbLVqdx5aQu2NifUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362796; c=relaxed/relaxed;
	bh=7DuvWhVNJl2FITNbjiKCdwfd8JX7D8enMTFVlgePxCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Odklt7R3yeyCnMqBVY/5Kje3a1619BUucVwsjGZdtgmXitpmmKJ0SA6PZGbCnVzWgrrI4qvmZaUaXeBbbVjjqMGA4hLZShRH5vhVxuyxkb2KLA/sUrA6TtjWz7eF2RDA0pS0e8/Qqk5/2QvIaq21aaVKt0O+XUg+o3WahFkAsItvt6F1Y5pwZPbgVbHJjnow/YBn/Vzjudxt1E2sm0vbLzo3n23KkD8+Az9+QDuE4raNh0c7N6yZoPo1/OQXAEIFVoKDeSRZDKIxmtctjsDw2cTWjLtoUqM9oGN/MlqlGSnWCAzZ1t0FBXxOiZsbBTd5XcF75ceOk8ULhaQeWbVLNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rz40jc33; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rz40jc33;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8P662Qz3bnJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12A3D5C558D;
	Sat, 12 Jul 2025 23:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89025C4CEF7;
	Sat, 12 Jul 2025 23:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362786;
	bh=GJ7nKp2NVjns7Vn/yd3vh/j/wSpE2hgTFf8rr99laVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rz40jc33/xphGqSYpQPco+3iJDZjL56YDYjR8lxUDvHZC9qTvA05p/dSIALTZNGLa
	 yXvMs5aBqkFHImLl8aUETc28cZI9qr1/dmBFyRLyOgDtANWvrLelg0XRsRp+H1fo49
	 2DXRpbcKWE/DMscKaQTB1MFDsjuADixByyVL5OJsS9GQAlJAw6f+QBrnQF+UwZ7wEq
	 b+hYHp4Q85Y8NjEOgve5GU4izy0luLiGraER+1MUi9nok4+Y53XmfRQ4/acQ0DDxuF
	 YuAIzEJHyD9PML6iIifGmew7AXaHbdsozX5EIyYP5MW3xQ6bkeFEF23ba0B568EVUx
	 Tvva3Jqe3BFgg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 14/26] crypto: sha1 - Remove sha1_base.h
Date: Sat, 12 Jul 2025 16:23:05 -0700
Message-ID: <20250712232329.818226-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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

sha1_base.h is no longer used, so remove it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1_base.h | 82 --------------------------------------
 1 file changed, 82 deletions(-)
 delete mode 100644 include/crypto/sha1_base.h

diff --git a/include/crypto/sha1_base.h b/include/crypto/sha1_base.h
deleted file mode 100644
index 62701d136c793..0000000000000
--- a/include/crypto/sha1_base.h
+++ /dev/null
@@ -1,82 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sha1_base.h - core logic for SHA-1 implementations
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#ifndef _CRYPTO_SHA1_BASE_H
-#define _CRYPTO_SHA1_BASE_H
-
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <linux/math.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-typedef void (sha1_block_fn)(struct sha1_state *sst, u8 const *src, int blocks);
-
-static inline int sha1_base_init(struct shash_desc *desc)
-{
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA1_H0;
-	sctx->state[1] = SHA1_H1;
-	sctx->state[2] = SHA1_H2;
-	sctx->state[3] = SHA1_H3;
-	sctx->state[4] = SHA1_H4;
-	sctx->count = 0;
-
-	return 0;
-}
-
-static inline int sha1_base_do_update_blocks(struct shash_desc *desc,
-					     const u8 *data,
-					     unsigned int len,
-					     sha1_block_fn *block_fn)
-{
-	unsigned int remain = len - round_down(len, SHA1_BLOCK_SIZE);
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-
-	sctx->count += len - remain;
-	block_fn(sctx, data, len / SHA1_BLOCK_SIZE);
-	return remain;
-}
-
-static inline int sha1_base_do_finup(struct shash_desc *desc,
-				     const u8 *src, unsigned int len,
-				     sha1_block_fn *block_fn)
-{
-	unsigned int bit_offset = SHA1_BLOCK_SIZE / 8 - 1;
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-	union {
-		__be64 b64[SHA1_BLOCK_SIZE / 4];
-		u8 u8[SHA1_BLOCK_SIZE * 2];
-	} block = {};
-
-	if (len >= bit_offset * 8)
-		bit_offset += SHA1_BLOCK_SIZE / 8;
-	memcpy(&block, src, len);
-	block.u8[len] = 0x80;
-	sctx->count += len;
-	block.b64[bit_offset] = cpu_to_be64(sctx->count << 3);
-	block_fn(sctx, block.u8, (bit_offset + 1) * 8 / SHA1_BLOCK_SIZE);
-	memzero_explicit(&block, sizeof(block));
-
-	return 0;
-}
-
-static inline int sha1_base_finish(struct shash_desc *desc, u8 *out)
-{
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-	__be32 *digest = (__be32 *)out;
-	int i;
-
-	for (i = 0; i < SHA1_DIGEST_SIZE / sizeof(__be32); i++)
-		put_unaligned_be32(sctx->state[i], digest++);
-
-	return 0;
-}
-
-#endif /* _CRYPTO_SHA1_BASE_H */
-- 
2.50.1


