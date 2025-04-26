Return-Path: <linuxppc-dev+bounces-8017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F8A9D8B1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 08:52:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl0kK2gydz2yF1;
	Sat, 26 Apr 2025 16:51:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745650313;
	cv=none; b=gQ+ft8He0POaaftOros8S68TV6tZt4kqcV7eCvIWSiBcqqRbs60AsYKkQkgFZuDkeA6HJwyyesEMVMqs7/WO335UNr7+s8aeK//oR97UEFDjsoBPOjLkHgfqMhVBY45zZE7DHCjGsYyN1h1YAUE3GocGu0ntRN+d/iQ81TH6dBMHQrvIE6OfbRZ3UOpeEtCeigbHwWbto/kiqSOXQ+IpNvrGcbDbc0xVGdrIavub75nVupNStXKEQ962M8x8r0Vs3X+H0FeiKK2GKsMdaX2fqlk3oa4/yucxCYk+rg631wIL+mrA8/GhhhlAk/Cp76WuRVhZDoi7gvr1OoWjsphz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745650313; c=relaxed/relaxed;
	bh=MMBp45GBautOw7WqSZPOQOnGnEeRn6bNAgMNS2shkkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KvmfR1thGQjq8Zf/00DgvuX7zB9vl5dRVWMEylzPWr9JiylZac2XusjTWMRs+maAD2PcCYF/OiflMu2WxE8K843/UBXb2woEPyW7RfCx5Rc3icj5TxZ1IJW2bG5nP+CAsg5hOYzQbH0BEydN60QYmfg1k1UmShPyfj9H5vukoq9K/VXKNkupGc6bZLjrAAWuCnEnSqG0N6kE9ZW8dTr4Mzh4f6oXoPIk3cOjUcpPwUEV3qzvB9aKVtxccac+2rMzl2EAqo0D6WQ8hcl/B2nxDI3P40JabuAlj5q7NrN26QQRGq3h6foXaVmtlN2+oMTBQ8Z8yLSVBjBtvjOrQ76wiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HilrkFzM; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HilrkFzM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl0kF4Zvcz2ySf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 16:51:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E34975C2BAA;
	Sat, 26 Apr 2025 06:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09417C4CEED;
	Sat, 26 Apr 2025 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745650306;
	bh=uxkZytCeZvKEdMW9eFrdi+rqyJFN6GhaSoUePQ/ntfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HilrkFzMypaE/jIuU0kTXgtftC4qBLOTw4seM8HhEu/vbFizNFfHH6KMuDCWnG6Q/
	 KZPP3M7aruiQPHkimuNafc0ZgceaGQVq7ihnupITN9O6kx0XqsuuUAkEzbVAzyOYeX
	 eQyqtz08tOMEv+wvVdrqGo0qjmnc6yj+Mk9W+BXiXEPwTGvG4hdgUi29/4kuoy8hmw
	 CxUKHIyOuWc/K/8MGHFuDPyXBSUbyq41L95FNpDiYx9Vo0epwwRv7r8GF9cSfKtMBQ
	 cVCOCOElXPtNz7aRifsPpDm9k1hZ8uJ05EZZUo+ycNHIvMt3kVa6z4k3RpSwuY1UqN
	 X3XoiFpLXmAJA==
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
Subject: [PATCH 13/13] crypto: lib/sha256 - improve function prototypes
Date: Fri, 25 Apr 2025 23:50:39 -0700
Message-ID: <20250426065041.1551914-14-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
index 182d1088d8893..50b7eeac2d89e 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -182,11 +182,11 @@ static inline void __sha256_update(struct sha256_state *sctx, const u8 *data,
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
 
@@ -213,23 +213,23 @@ static inline void __sha256_final(struct sha256_state *sctx, u8 *out,
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


