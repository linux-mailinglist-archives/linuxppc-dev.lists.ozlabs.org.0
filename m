Return-Path: <linuxppc-dev+bounces-2795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369EE9BA89F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 23:32:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhTr16qbFz2yNR;
	Mon,  4 Nov 2024 09:32:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730673153;
	cv=none; b=c251FGs4+o6dVkep8cTuPxP6tgje+TSJ15N36QrzYoVw3tFxcVxPCcJfUj9njDeQO6NNy+SzotgEXTxN+cRde0NLsQrKDoGH9/wE929HcNMxYR2E9uiSRSyTPwmyqM3ZhnVzxlrQUtX52ZaD8f9qmfguH6GXLIC57Pvyq5gB06eoDWwmRKE/G4otExYqNOySQE4ju/Y/IaAOX+aPDXZZ6cMiMryi0pHQbOEd90NdHmccDRJNAM+RtmcXZ/YEkJvFb9+yRD+iD13NPHmF2jF2Ak3hVAQq8lSpat/X7I9POAqx9fjGIGaoa5eaXsLDIm7R+UKZP985IvJc1yevfLmJow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730673153; c=relaxed/relaxed;
	bh=VEpWY4sXA/S1bLoLnoNT9MT92zIxt9Oz+i41XLKt/cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQq63TAUgComti02lU1G6qlFvIa6Fftr9c7SSQeTuyZUxIdS9LmgdB55MouFQuehui4aItJ5AdLAruygnweb1X5o3MMowm0M+FQZVgdZW4XfcXIICRZfCQCiZsc4+2iDZ0YQXqR3LPS0vXX1gg231W9hbEMnGFxjwkzxco61bh/8wVv0Koz+NjUBR+MAh4EDNDzLyl9GVPMy7PPjNZ3wYNl8fdLxScJvDihfHJOFMZW19m7WcC8tUizDVVkzLp9HbyBvrDEg2AxSd5pZdzfbN9TmLlh0Wifx9YZzG50/nry0yQHUrysQFQNyYtatO/zK4SY4oJj/qyyxRYPvHICpDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WVk0uHfu; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WVk0uHfu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhTr05Hwgz2yGs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 09:32:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BBAC9A41EF8;
	Sun,  3 Nov 2024 22:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EC9C4CED3;
	Sun,  3 Nov 2024 22:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730673144;
	bh=ABiaGm+ovhik7YFigewZFubogtN32tz5BD1p0OQq720=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WVk0uHfugLJOnyBhphvAvhRdO9ietw2HwNP1FG0tEe51/9J+ho1lZSwSW5fWWkUbJ
	 cnx/nwvwkunqtyQfdB6zu5TZYLBOWj+8hIzGXkelZw/EeczfL6dFUH50WsD+A0L6wp
	 1ea3C8GpKzWp8UGmLqvWkmVACMRW7Hz5uHzbXU2Ekqvq3CV5Hvw+yULjXXbYd5nmM5
	 evs/zM1913odV1Hs8XVfpJhyXYdLZ/5asXzrkmzN0LR04luqCSG3sPYmAnYNFu82YK
	 z5A7rR9fIOw7wD5HLScsDlu1CWetycbJKeEEVPCotgB8D+8Nk/ySUHj/DWVvgFqAih
	 CURkLUSqbIfRQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 01/18] lib/crc32: drop leading underscores from __crc32c_le_base
Date: Sun,  3 Nov 2024 14:31:37 -0800
Message-ID: <20241103223154.136127-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Remove the leading underscores from __crc32c_le_base().

This is in preparation for adding crc32c_le_arch() and eventually
renaming __crc32c_le() to crc32c_le().

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crc32-glue.c | 2 +-
 arch/riscv/lib/crc32.c      | 2 +-
 crypto/crc32c_generic.c     | 8 ++++----
 include/linux/crc32.h       | 2 +-
 lib/crc32.c                 | 4 ++--
 lib/crc32test.c             | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
index 295ae3e6b997..ad015223d15d 100644
--- a/arch/arm64/lib/crc32-glue.c
+++ b/arch/arm64/lib/crc32-glue.c
@@ -42,11 +42,11 @@ u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
-		return __crc32c_le_base(crc, p, len);
+		return crc32c_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
 		kernel_neon_begin();
 		crc = crc32c_le_arm64_4way(crc, p, len);
 		kernel_neon_end();
diff --git a/arch/riscv/lib/crc32.c b/arch/riscv/lib/crc32.c
index d7dc599af3ef..333fb7af1192 100644
--- a/arch/riscv/lib/crc32.c
+++ b/arch/riscv/lib/crc32.c
@@ -224,11 +224,11 @@ u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
-				CRC32C_POLY_QT_LE, __crc32c_le_base);
+				CRC32C_POLY_QT_LE, crc32c_le_base);
 }
 
 static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 				     size_t len)
 {
diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
index 7c2357c30fdf..635599b255ec 100644
--- a/crypto/crc32c_generic.c
+++ b/crypto/crc32c_generic.c
@@ -83,11 +83,11 @@ static int chksum_setkey(struct crypto_shash *tfm, const u8 *key,
 static int chksum_update(struct shash_desc *desc, const u8 *data,
 			 unsigned int length)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
-	ctx->crc = __crc32c_le_base(ctx->crc, data, length);
+	ctx->crc = crc32c_le_base(ctx->crc, data, length);
 	return 0;
 }
 
 static int chksum_update_arch(struct shash_desc *desc, const u8 *data,
 			      unsigned int length)
@@ -106,11 +106,11 @@ static int chksum_final(struct shash_desc *desc, u8 *out)
 	return 0;
 }
 
 static int __chksum_finup(u32 *crcp, const u8 *data, unsigned int len, u8 *out)
 {
-	put_unaligned_le32(~__crc32c_le_base(*crcp, data, len), out);
+	put_unaligned_le32(~crc32c_le_base(*crcp, data, len), out);
 	return 0;
 }
 
 static int __chksum_finup_arch(u32 *crcp, const u8 *data, unsigned int len,
 			       u8 *out)
@@ -198,16 +198,16 @@ static struct shash_alg algs[] = {{
 }};
 
 static int __init crc32c_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + (&__crc32c_le != &__crc32c_le_base));
+	return crypto_register_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
 }
 
 static void __exit crc32c_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + (&__crc32c_le != &__crc32c_le_base));
+	crypto_unregister_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
 }
 
 subsys_initcall(crc32c_mod_init);
 module_exit(crc32c_mod_fini);
 
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 87f788c0d607..5b07fc9081c4 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -37,11 +37,11 @@ static inline u32 crc32_le_combine(u32 crc1, u32 crc2, size_t len2)
 {
 	return crc32_le_shift(crc1, len2) ^ crc2;
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len);
-u32 __pure __crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
+u32 __pure crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
 
 /**
  * __crc32c_le_combine - Combine two crc32c check values into one. For two
  * 			 sequences of bytes, seq1 and seq2 with lengths len1
  * 			 and len2, __crc32c_le() check values were calculated
diff --git a/lib/crc32.c b/lib/crc32.c
index ff587fee3893..c67059b0082b 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -205,12 +205,12 @@ EXPORT_SYMBOL(crc32_le);
 EXPORT_SYMBOL(__crc32c_le);
 
 u32 __pure crc32_le_base(u32, unsigned char const *, size_t) __alias(crc32_le);
 EXPORT_SYMBOL(crc32_le_base);
 
-u32 __pure __crc32c_le_base(u32, unsigned char const *, size_t) __alias(__crc32c_le);
-EXPORT_SYMBOL(__crc32c_le_base);
+u32 __pure crc32c_le_base(u32, unsigned char const *, size_t) __alias(__crc32c_le);
+EXPORT_SYMBOL(crc32c_le_base);
 
 u32 __pure crc32_be_base(u32, unsigned char const *, size_t) __alias(crc32_be);
 
 /*
  * This multiplies the polynomials x and y modulo the given modulus.
diff --git a/lib/crc32test.c b/lib/crc32test.c
index 03cf5c1f2f5d..30b8da4d8be4 100644
--- a/lib/crc32test.c
+++ b/lib/crc32test.c
@@ -824,11 +824,11 @@ static void crc32test_regenerate(void)
 	for (i = 0; i < ARRAY_SIZE(test); i++) {
 		pr_info("{0x%08x, 0x%08x, 0x%08x, 0x%08x, 0x%08x, 0x%08x},\n",
 			test[i].crc, test[i].start, test[i].length,
 			crc32_le_base(test[i].crc, test_buf + test[i].start, test[i].length),
 			crc32_be_base(test[i].crc, test_buf + test[i].start, test[i].length),
-			__crc32c_le_base(test[i].crc, test_buf + test[i].start, test[i].length));
+			crc32c_le_base(test[i].crc, test_buf + test[i].start, test[i].length));
 	}
 }
 
 static int __init crc32test_init(void)
 {
-- 
2.47.0


