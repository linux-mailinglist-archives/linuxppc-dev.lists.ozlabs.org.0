Return-Path: <linuxppc-dev+bounces-8305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1ECAA9B66
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 20:19:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrqYZ0cgyz2yqq;
	Tue,  6 May 2025 04:19:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746469170;
	cv=none; b=kcddb7LxZgl3ShNDcTOGWV1FDWo3Izcly6ay5qdOPxK9Gry3m9j7RyeCpsYayU0bWQO5MyU6g2/qMmDzNjcj8n23sAKQs3fIinf6KmTnzkvYR3zm8UShM1koKsevESiwdvOqCZyZt813PmLfCwLu4ipO8AJFTunKUM+Ci2a3iED/Br6f3TyeC870PSUfqBdPtP6B+lndsIqUKtfJptIXZYVxdSPn03Ji9Oe6eZG6un1kxLbuW+teJptDNnVKnR2ApupmDL0dMCMyq2jMd9t++WV4XWjVbuz6zHjshRqKhV9ghAIr5ZyJj8y5VLLKrBU4JcYzOcLYcqO0/1cqQ0EE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746469170; c=relaxed/relaxed;
	bh=Z8UiWoK8LfZ3z/+az3mRrsX/3bsrRFwN44fs5f5Dyyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eV5KeqVYQxVm2Wiu8U0Em5df9ukF7sHCXbmo3z62034vn+dAiXioycdm8IO/Riz2El+KMkwjEe6R6tLogiYhBBEp2KJEboidwz4e9M+uoLg05mK40KrcUGl5de+YdZ15yUmOhno6nSLKdMd2b+qLH4bApHtH03/yzGKavYlWQQcFOjeUuoB+OJjo9UmjfLBlvgQmneijhUAUduIOihHNIHzstW3P33aQY9t0vOXN09NIbLtboo3OiCGl/shp7LIYXesOnWziC591IQex+0QUhXCIIyUztJuEu2sbDx/iSARf3sXNuBBWzheZAWDFhjiTbmvEhudqlylDVBDyz5K8uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IdccGkzZ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IdccGkzZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrqYW13wkz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 04:19:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A89D444DA6;
	Mon,  5 May 2025 18:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA062C4CEF2;
	Mon,  5 May 2025 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746469164;
	bh=mMc5BO3KaWzzAhqaUs9saVNrK9FbauW+oehe6PKy+Aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IdccGkzZQnmV4j3zL0qW2HEPMFQO7Lbww2PjWdjgi17/TjJjHo3Rabs0jOB2pLBFR
	 BNystxBX4qdoUELqjrc8NRgh4C6DjNKebmGQQv4FS+8mziYF0YiD5rENIf9z+kTYQo
	 d/5anHb8+6JLhMlascA+6GaHteo22tUvh09FwyEJKqzORMaKb3DgTTSNzhVmuXmmE0
	 Jr1NQbeZonSiGvqI9p9VDbFjLVPnTv/FDbVSc+/MEpQj9N6o9vOdldAqt/tkvpP1fX
	 RlHYn2sj2qI+hhlBZdf50Md2DXuONGO0ckmyZ6fIjPKP/cDcPY76pUPCDIqrLnfjvV
	 E3yOy0SyJb5hA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH 3/4] crypto: lib/chacha - add strongly-typed state zeroization
Date: Mon,  5 May 2025 11:18:23 -0700
Message-ID: <20250505181824.647138-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505181824.647138-1-ebiggers@kernel.org>
References: <20250505181824.647138-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Now that the ChaCha state matrix is strongly-typed, add a helper
function chacha_zeroize_state() which zeroizes it.  Then convert all
applicable callers to use it instead of direct memzero_explicit.  No
functional changes.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/char/random.c         | 4 ++--
 fs/bcachefs/checksum.c        | 4 ++--
 include/crypto/chacha.h       | 6 ++++++
 lib/crypto/chacha20poly1305.c | 6 +++---
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 9f876ed2655b..5f22a08101f6 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -420,11 +420,11 @@ static void _get_random_bytes(void *buf, size_t len)
 			++chacha_state.x[13];
 		len -= CHACHA_BLOCK_SIZE;
 		buf += CHACHA_BLOCK_SIZE;
 	}
 
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 }
 
 /*
  * This returns random bytes in arbitrary quantities. The quality of the
  * random bytes is good as /dev/urandom. In order to ensure that the
@@ -483,11 +483,11 @@ static ssize_t get_random_bytes_user(struct iov_iter *iter)
 		}
 	}
 
 	memzero_explicit(block, sizeof(block));
 out_zero_chacha:
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 	return ret ? ret : -EFAULT;
 }
 
 /*
  * Batched entropy returns random integers. The quality of the random
diff --git a/fs/bcachefs/checksum.c b/fs/bcachefs/checksum.c
index 312fda4bb1b5..a4df8eba75f3 100644
--- a/fs/bcachefs/checksum.c
+++ b/fs/bcachefs/checksum.c
@@ -111,11 +111,11 @@ static void bch2_chacha20(const struct bch_key *key, struct nonce nonce,
 {
 	struct chacha_state state;
 
 	bch2_chacha20_init(&state, key, nonce);
 	chacha20_crypt(&state, data, data, len);
-	memzero_explicit(&state, sizeof(state));
+	chacha_zeroize_state(&state);
 }
 
 static void bch2_poly1305_init(struct poly1305_desc_ctx *desc,
 			       struct bch_fs *c, struct nonce nonce)
 {
@@ -281,11 +281,11 @@ int __bch2_encrypt_bio(struct bch_fs *c, unsigned type,
 
 		p = bvec_kmap_local(&bv);
 		chacha20_crypt(&chacha_state, p, p, bv.bv_len);
 		kunmap_local(p);
 	}
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 	return ret;
 }
 
 struct bch_csum bch2_checksum_merge(unsigned type, struct bch_csum a,
 				    struct bch_csum b, size_t b_len)
diff --git a/include/crypto/chacha.h b/include/crypto/chacha.h
index 64fb270f2bfc..7c2e6c68919b 100644
--- a/include/crypto/chacha.h
+++ b/include/crypto/chacha.h
@@ -14,10 +14,11 @@
 
 #ifndef _CRYPTO_CHACHA_H
 #define _CRYPTO_CHACHA_H
 
 #include <linux/unaligned.h>
+#include <linux/string.h>
 #include <linux/types.h>
 
 /* 32-bit stream position, then 96-bit nonce (RFC7539 convention) */
 #define CHACHA_IV_SIZE		16
 
@@ -106,10 +107,15 @@ static inline void chacha20_crypt(struct chacha_state *state,
 				  u8 *dst, const u8 *src, unsigned int bytes)
 {
 	chacha_crypt(state, dst, src, bytes, 20);
 }
 
+static inline void chacha_zeroize_state(struct chacha_state *state)
+{
+	memzero_explicit(state, sizeof(*state));
+}
+
 #if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA)
 bool chacha_is_arch_optimized(void);
 #else
 static inline bool chacha_is_arch_optimized(void)
 {
diff --git a/lib/crypto/chacha20poly1305.c b/lib/crypto/chacha20poly1305.c
index ed81f0658956..2e7bbc1a67ea 100644
--- a/lib/crypto/chacha20poly1305.c
+++ b/lib/crypto/chacha20poly1305.c
@@ -82,11 +82,11 @@ __chacha20poly1305_encrypt(u8 *dst, const u8 *src, const size_t src_len,
 	b.lens[1] = cpu_to_le64(src_len);
 	poly1305_update(&poly1305_state, (u8 *)b.lens, sizeof(b.lens));
 
 	poly1305_final(&poly1305_state, dst + src_len);
 
-	memzero_explicit(chacha_state, sizeof(*chacha_state));
+	chacha_zeroize_state(chacha_state);
 	memzero_explicit(&b, sizeof(b));
 }
 
 void chacha20poly1305_encrypt(u8 *dst, const u8 *src, const size_t src_len,
 			      const u8 *ad, const size_t ad_len,
@@ -186,11 +186,11 @@ bool chacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
 
 	chacha_init(&chacha_state, k, (u8 *)iv);
 	ret = __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
 					 &chacha_state);
 
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 	memzero_explicit(iv, sizeof(iv));
 	memzero_explicit(k, sizeof(k));
 	return ret;
 }
 EXPORT_SYMBOL(chacha20poly1305_decrypt);
@@ -326,11 +326,11 @@ bool chacha20poly1305_crypt_sg_inplace(struct scatterlist *src,
 			       sizeof(b.mac[1]), src_len, !encrypt);
 		ret = encrypt ||
 		      !crypto_memneq(b.mac[0], b.mac[1], POLY1305_DIGEST_SIZE);
 	}
 
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 	memzero_explicit(&b, sizeof(b));
 
 	return ret;
 }
 
-- 
2.49.0


