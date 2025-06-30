Return-Path: <linuxppc-dev+bounces-9922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FBCAEE395
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1g5hT1z3bnq;
	Tue,  1 Jul 2025 02:09:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299767;
	cv=none; b=SXctTpUj2rGr8tpGjsHGu+JNb/uXGaUeo13EUsPGJMmORCY0OZRRo6NKCvkBCbrmvKr0mbjJIlE1Jtiho6Gt+JhwjCUvrocgy1rbySxiLVZcrMXT1xxYecOGCfCCZwqEq2gVomph0em03+Ud/fsGMtDmi9wQ9bL2sZEVl/iRtPnELm9EYM5fja5l+K/HIKCOH4kt7XQG3iiLAMxwicHDOHKPvlXPFYEltbINVKn5BNlcaHHnmlKuyblkF8o1OMdVKAkzof7YYc+GgH1GRMPiHaeC6YxMGSAavB3lxW7Ioi8BmHCQJ6EkdkwMLt2/ZxfD+Dc9FB+987NOa8VPc2Gm2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299767; c=relaxed/relaxed;
	bh=uk0sE/BCMGvaA7bCbAXV+RAu7t0GwWYb3WWV/cO67KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kq7xCeBhUEtmhu4wc7rbOEAbf4VSdwA46EvvK2p8exx6nqt2lzXK0Ey20Tr94tXsJhFQ/Bu5fr4GmSAOw/o55bbzYOCO1yNkWVErABzZSZrZneVawOMl6eV2EUzZhBI5yvp5TWHTxa8IXQPsOwiwdWomE5v58DDUx3amspAOwX/dFFYvd/lCBvE4+Dqx2YW9BpTuNWIw7WHzFO7l77qLuBKawNhuN8ydycvQSfYsD8WDesQqhei6aw6bJiOqYlTnniQq8pJG5DR54pgP2kYfKotsRReCLWNFekF2YEowZeT1y2YUr1ZiRWhmjySX4b7ONTU4sl7p0TKxqZ0E6f+qDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e+N+Rp7s; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e+N+Rp7s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1c6tHKz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54C5F6113B;
	Mon, 30 Jun 2025 16:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35A7C4CEF5;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299762;
	bh=5WUT3FVFtGYY38nGQk9FGEw/eHR0uyP40u2JgCeMrws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+N+Rp7skA/eq8mkB7Jny8AcWCh4HRKnMJmSFz+cvafpdyHVdMjSt93EsD54zMvMs
	 /WyIqcz+TKrriW94MpM4zGQLw28AMAEVLamI7OUOzNdCwAx3uld43AU3LB0bXYQaIL
	 Ysygpb5KwKvQP7ez1n7hmFLHtqPW5XGEZUJXWUjJC9cc94Y1TNGXVe+6j/bItAqLGD
	 qYieA8QBrcCXt1v+n5nzgDRTzRRqNgaYFws411PqpqpH5xwUSLN2oWBAHvhRDWfsWF
	 uMyxhU4KDrgRJZRyK+SkqvDJ+p6MHQl6jFOoW7w7ndpIfaimBkuREJiy4Uux35Q1I6
	 BdnmQUWL/SNCQ==
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
Subject: [PATCH v2 03/14] lib/crypto: sha256: Reorder some code
Date: Mon, 30 Jun 2025 09:06:34 -0700
Message-ID: <20250630160645.3198-4-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

First, move the declarations of sha224_init/update/final to be just
above the corresponding SHA-256 code, matching the order that I used for
SHA-384 and SHA-512.  In sha2.h, the end result is that SHA-224,
SHA-256, SHA-384, and SHA-512 are all in the logical order.

Second, move sha224_block_init() and sha256_block_init() to be just
below crypto_sha256_state.  In later changes, these functions as well as
struct crypto_sha256_state will no longer be used by the library
functions.  They'll remain just for some legacy offload drivers.  This
gets them into a logical place in the file for that.

No code changes other than reordering.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 60 +++++++++++++++++++++----------------------
 lib/crypto/sha256.c   | 12 ++++-----
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 296ce9d468bfc..bb181b7996cdc 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -69,10 +69,36 @@ extern const u8 sha512_zero_message_hash[SHA512_DIGEST_SIZE];
 struct crypto_sha256_state {
 	u32 state[SHA256_STATE_WORDS];
 	u64 count;
 };
 
+static inline void sha224_block_init(struct crypto_sha256_state *sctx)
+{
+	sctx->state[0] = SHA224_H0;
+	sctx->state[1] = SHA224_H1;
+	sctx->state[2] = SHA224_H2;
+	sctx->state[3] = SHA224_H3;
+	sctx->state[4] = SHA224_H4;
+	sctx->state[5] = SHA224_H5;
+	sctx->state[6] = SHA224_H6;
+	sctx->state[7] = SHA224_H7;
+	sctx->count = 0;
+}
+
+static inline void sha256_block_init(struct crypto_sha256_state *sctx)
+{
+	sctx->state[0] = SHA256_H0;
+	sctx->state[1] = SHA256_H1;
+	sctx->state[2] = SHA256_H2;
+	sctx->state[3] = SHA256_H3;
+	sctx->state[4] = SHA256_H4;
+	sctx->state[5] = SHA256_H5;
+	sctx->state[6] = SHA256_H6;
+	sctx->state[7] = SHA256_H7;
+	sctx->count = 0;
+}
+
 struct sha256_state {
 	union {
 		struct crypto_sha256_state ctx;
 		struct {
 			u32 state[SHA256_STATE_WORDS];
@@ -86,51 +112,25 @@ struct sha512_state {
 	u64 state[SHA512_DIGEST_SIZE / 8];
 	u64 count[2];
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
-static inline void sha256_block_init(struct crypto_sha256_state *sctx)
+static inline void sha224_init(struct sha256_state *sctx)
 {
-	sctx->state[0] = SHA256_H0;
-	sctx->state[1] = SHA256_H1;
-	sctx->state[2] = SHA256_H2;
-	sctx->state[3] = SHA256_H3;
-	sctx->state[4] = SHA256_H4;
-	sctx->state[5] = SHA256_H5;
-	sctx->state[6] = SHA256_H6;
-	sctx->state[7] = SHA256_H7;
-	sctx->count = 0;
+	sha224_block_init(&sctx->ctx);
 }
+/* Simply use sha256_update as it is equivalent to sha224_update. */
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
 static inline void sha256_init(struct sha256_state *sctx)
 {
 	sha256_block_init(&sctx->ctx);
 }
 void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
 void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
-static inline void sha224_block_init(struct crypto_sha256_state *sctx)
-{
-	sctx->state[0] = SHA224_H0;
-	sctx->state[1] = SHA224_H1;
-	sctx->state[2] = SHA224_H2;
-	sctx->state[3] = SHA224_H3;
-	sctx->state[4] = SHA224_H4;
-	sctx->state[5] = SHA224_H5;
-	sctx->state[6] = SHA224_H6;
-	sctx->state[7] = SHA224_H7;
-	sctx->count = 0;
-}
-
-static inline void sha224_init(struct sha256_state *sctx)
-{
-	sha224_block_init(&sctx->ctx);
-}
-/* Simply use sha256_update as it is equivalent to sha224_update. */
-void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
-
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
 	u64 h[8];
 };
 
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 6bfa4ae8dfb59..573ccecbf48bf 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -56,22 +56,22 @@ static inline void __sha256_final(struct sha256_state *sctx, u8 *out,
 	sha256_finup(&sctx->ctx, sctx->buf, partial, out, digest_size,
 		     sha256_purgatory(), false);
 	memzero_explicit(sctx, sizeof(*sctx));
 }
 
-void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
-{
-	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
-}
-EXPORT_SYMBOL(sha256_final);
-
 void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA224_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha224_final);
 
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
+{
+	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
+}
+EXPORT_SYMBOL(sha256_final);
+
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
-- 
2.50.0


