Return-Path: <linuxppc-dev+bounces-8128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D74A9F6A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 19:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmV9l1qDdz3bh0;
	Tue, 29 Apr 2025 03:02:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745859732;
	cv=none; b=XNc8sJ8wFjY9BJWyi6z+XTvJYVoCVTDZS7fxi6q78HeAbKoJmOfzIRBMleFY0RuVxfVoGABxjNhGf6/F43qx5yZxeM8bEjGWJy1DOdVn6Njto2Wpgm92dZUqac4zqhWT5nmpygcVp4VJEYjvA6ga1b0OTJo04Kcx/GjKWeMewVzNjq8jT8AN+VsDWGV2wNFHtJnWfn2p11Km97ntB90KW6AVZluJlAbml+RirEgvD9W1x7XjYfFByIS1SxElSeUYigrteDsUqzN0c/2DnjgBwJ5lpV9j6yNB0io4RGDLQ14c06t41zvNpPUKD0BjGzTZ8zjQ8wjFbasx3wpqREmWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745859732; c=relaxed/relaxed;
	bh=k8qT6W+9XIBDEh2wbbkzKqysWN3rqlOAw3WfBG922vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1pNVlYkdzH9tvT12dNrrHrgCA4fzXrWynDuTOKM8JyEvAaNhaKAgjv0CCZQd9AiTo3abtsgUzDqmzsFsh0HzbW8mPnkrTJ57CVJCJqL02F0oQUbkCyutt+YRNGFZTqCAxNH5tegRc9zy+BLto1LR/C7ZVncYwfBHIGWISA2qEjXY8Y2HgpUo7PZCOF5gk1cCMrREJie2E5UOuCu2gqT8ZvCn+a3QUw5BeI1yvnXpe6Zsc/IUd8EyGVSvdrovdW7Ir5rwpQY9uSebblXLkG8xgb3gbL+PDUGvCeOGr7OsITUMXTzNGkC/P8PcjeyKxjk0Us7LySn0iDl5joSev3/oA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nag0WVQ8; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nag0WVQ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmV9Y6SmSz30WQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 03:02:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6DEDA4B51D;
	Mon, 28 Apr 2025 16:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F35C4CEEE;
	Mon, 28 Apr 2025 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859726;
	bh=E4ZzeBfk2GgJquy2SDIZkSeNX8NfXIoZAmTNK3XNeXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nag0WVQ8E1TihrQTSEoFR0DZgEIeqxXwyV4+iqc41yTiRiDzs5/2T7qkhTZmHaBIe
	 3NpNYnemnWcQOCXagA5m6zVEi7yUaK7qNITYrJvmQFRS87Igf4LlFVCkGoqoGOGCVG
	 rsFgw3ex79z6SbNqm4v8+b5mBZMqZ9O4OXQBeaDADtRT7kk2/LXqD81qq3/EBLuNs4
	 Xf+BQasDscoPMcUxBho7bRSlGZgBqQCEuwezVvdvBqukAt516lxDSngixk8QEtC60Q
	 hSwIdPcr5osF5Xfc1HTMgM8PDAUDpsO71gwKURmbiK0loWyPcYwTVOaYNJujt2ACtq
	 ABI2T4XgqEKSw==
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
Subject: [PATCH v4 13/13] crypto: lib/sha256 - improve function prototypes
Date: Mon, 28 Apr 2025 10:00:38 -0700
Message-ID: <20250428170040.423825-14-ebiggers@kernel.org>
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

Follow best practices by changing the length parameters to size_t and
explicitly specifying the length of the output digest arrays.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/crypto/sha2.h | 8 ++++----
 lib/crypto/sha256.c   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 444484d1b1cfa..7dfc560daa2c7 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -93,13 +93,13 @@ static inline void sha256_init(struct sha256_state *sctx)
 	sctx->state[5] = SHA256_H5;
 	sctx->state[6] = SHA256_H6;
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
 	sctx->state[0] = SHA224_H0;
 	sctx->state[1] = SHA224_H1;
@@ -110,8 +110,8 @@ static inline void sha224_init(struct sha256_state *sctx)
 	sctx->state[6] = SHA224_H6;
 	sctx->state[7] = SHA224_H7;
 	sctx->count = 0;
 }
 /* Simply use sha256_update as it is equivalent to sha224_update. */
-void sha224_final(struct sha256_state *sctx, u8 *out);
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
 #endif /* _CRYPTO_SHA2_H */
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 4b19cf977ef1b..563f09c9f3815 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -68,11 +68,11 @@ static inline void __sha256_update(struct sha256_state *sctx, const u8 *data,
 	}
 	if (len)
 		memcpy(&sctx->buf[partial], data, len);
 }
 
-void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len)
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len)
 {
 	__sha256_update(sctx, data, len, false);
 }
 EXPORT_SYMBOL(sha256_update);
 
@@ -99,23 +99,23 @@ static inline void __sha256_final(struct sha256_state *sctx, u8 *out,
 		put_unaligned_be32(sctx->state[i / 4], out + i);
 
 	memzero_explicit(sctx, sizeof(*sctx));
 }
 
-void sha256_final(struct sha256_state *sctx, u8 *out)
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA256_DIGEST_SIZE, false);
 }
 EXPORT_SYMBOL(sha256_final);
 
-void sha224_final(struct sha256_state *sctx, u8 *out)
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA224_DIGEST_SIZE, false);
 }
 EXPORT_SYMBOL(sha224_final);
 
-void sha256(const u8 *data, unsigned int len, u8 *out)
+void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
 	sha256_update(&sctx, data, len);
-- 
2.49.0


