Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8505A47A6F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 10:24:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHZ0N2cC9z3bVC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 20:24:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=47.88.44.36;
 helo=out4436.biz.mail.alibaba.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHYzx0z5qz2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 20:23:40 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0V.Acb6e_1639992202; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0V.Acb6e_1639992202) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 20 Dec 2021 17:23:23 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-crypto@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: [PATCH 2/5] crypto: mips/sha - remove duplicate hash init function
Date: Mon, 20 Dec 2021 17:23:15 +0800
Message-Id: <20211220092318.5793-3-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220092318.5793-1-tianjia.zhang@linux.alibaba.com>
References: <20211220092318.5793-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sha*_base_init() series functions has implemented the initialization
of the hash context, this commit use sha*_base_init() function to
replace repeated implementations.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 arch/mips/cavium-octeon/crypto/octeon-sha1.c  | 17 +-------
 .../mips/cavium-octeon/crypto/octeon-sha256.c | 39 ++-----------------
 .../mips/cavium-octeon/crypto/octeon-sha512.c | 39 ++-----------------
 3 files changed, 8 insertions(+), 87 deletions(-)

diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha1.c b/arch/mips/cavium-octeon/crypto/octeon-sha1.c
index 30f1d75208a5..37a07b3c4568 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha1.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha1.c
@@ -15,6 +15,7 @@
 
 #include <linux/mm.h>
 #include <crypto/sha1.h>
+#include <crypto/sha1_base.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/module.h>
@@ -71,20 +72,6 @@ static void octeon_sha1_transform(const void *_block)
 	octeon_sha1_start(block[7]);
 }
 
-static int octeon_sha1_init(struct shash_desc *desc)
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
 static void __octeon_sha1_update(struct sha1_state *sctx, const u8 *data,
 				 unsigned int len)
 {
@@ -200,7 +187,7 @@ static int octeon_sha1_import(struct shash_desc *desc, const void *in)
 
 static struct shash_alg octeon_sha1_alg = {
 	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	octeon_sha1_init,
+	.init		=	sha1_base_init,
 	.update		=	octeon_sha1_update,
 	.final		=	octeon_sha1_final,
 	.export		=	octeon_sha1_export,
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
index 36cb92895d72..435e4a6e7f13 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
@@ -16,6 +16,7 @@
 
 #include <linux/mm.h>
 #include <crypto/sha2.h>
+#include <crypto/sha256_base.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/module.h>
@@ -63,40 +64,6 @@ static void octeon_sha256_transform(const void *_block)
 	octeon_sha256_start(block[7]);
 }
 
-static int octeon_sha224_init(struct shash_desc *desc)
-{
-	struct sha256_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA224_H0;
-	sctx->state[1] = SHA224_H1;
-	sctx->state[2] = SHA224_H2;
-	sctx->state[3] = SHA224_H3;
-	sctx->state[4] = SHA224_H4;
-	sctx->state[5] = SHA224_H5;
-	sctx->state[6] = SHA224_H6;
-	sctx->state[7] = SHA224_H7;
-	sctx->count = 0;
-
-	return 0;
-}
-
-static int octeon_sha256_init(struct shash_desc *desc)
-{
-	struct sha256_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA256_H0;
-	sctx->state[1] = SHA256_H1;
-	sctx->state[2] = SHA256_H2;
-	sctx->state[3] = SHA256_H3;
-	sctx->state[4] = SHA256_H4;
-	sctx->state[5] = SHA256_H5;
-	sctx->state[6] = SHA256_H6;
-	sctx->state[7] = SHA256_H7;
-	sctx->count = 0;
-
-	return 0;
-}
-
 static void __octeon_sha256_update(struct sha256_state *sctx, const u8 *data,
 				   unsigned int len)
 {
@@ -224,7 +191,7 @@ static int octeon_sha256_import(struct shash_desc *desc, const void *in)
 
 static struct shash_alg octeon_sha256_algs[2] = { {
 	.digestsize	=	SHA256_DIGEST_SIZE,
-	.init		=	octeon_sha256_init,
+	.init		=	sha256_base_init,
 	.update		=	octeon_sha256_update,
 	.final		=	octeon_sha256_final,
 	.export		=	octeon_sha256_export,
@@ -240,7 +207,7 @@ static struct shash_alg octeon_sha256_algs[2] = { {
 	}
 }, {
 	.digestsize	=	SHA224_DIGEST_SIZE,
-	.init		=	octeon_sha224_init,
+	.init		=	sha224_base_init,
 	.update		=	octeon_sha256_update,
 	.final		=	octeon_sha224_final,
 	.descsize	=	sizeof(struct sha256_state),
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha512.c b/arch/mips/cavium-octeon/crypto/octeon-sha512.c
index 359f039820d8..2dee9354e33f 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha512.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha512.c
@@ -15,6 +15,7 @@
 
 #include <linux/mm.h>
 #include <crypto/sha2.h>
+#include <crypto/sha512_base.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/module.h>
@@ -74,40 +75,6 @@ static void octeon_sha512_transform(const void *_block)
 	octeon_sha512_start(block[15]);
 }
 
-static int octeon_sha512_init(struct shash_desc *desc)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA512_H0;
-	sctx->state[1] = SHA512_H1;
-	sctx->state[2] = SHA512_H2;
-	sctx->state[3] = SHA512_H3;
-	sctx->state[4] = SHA512_H4;
-	sctx->state[5] = SHA512_H5;
-	sctx->state[6] = SHA512_H6;
-	sctx->state[7] = SHA512_H7;
-	sctx->count[0] = sctx->count[1] = 0;
-
-	return 0;
-}
-
-static int octeon_sha384_init(struct shash_desc *desc)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA384_H0;
-	sctx->state[1] = SHA384_H1;
-	sctx->state[2] = SHA384_H2;
-	sctx->state[3] = SHA384_H3;
-	sctx->state[4] = SHA384_H4;
-	sctx->state[5] = SHA384_H5;
-	sctx->state[6] = SHA384_H6;
-	sctx->state[7] = SHA384_H7;
-	sctx->count[0] = sctx->count[1] = 0;
-
-	return 0;
-}
-
 static void __octeon_sha512_update(struct sha512_state *sctx, const u8 *data,
 				   unsigned int len)
 {
@@ -223,7 +190,7 @@ static int octeon_sha384_final(struct shash_desc *desc, u8 *hash)
 
 static struct shash_alg octeon_sha512_algs[2] = { {
 	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	octeon_sha512_init,
+	.init		=	sha512_base_init,
 	.update		=	octeon_sha512_update,
 	.final		=	octeon_sha512_final,
 	.descsize	=	sizeof(struct sha512_state),
@@ -236,7 +203,7 @@ static struct shash_alg octeon_sha512_algs[2] = { {
 	}
 }, {
 	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	octeon_sha384_init,
+	.init		=	sha384_base_init,
 	.update		=	octeon_sha512_update,
 	.final		=	octeon_sha384_final,
 	.descsize	=	sizeof(struct sha512_state),
-- 
2.32.0

