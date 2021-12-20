Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EFC47A706
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 10:30:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHZ815d6hz2ywg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 20:30:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHZ5w3CkWz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 20:28:51 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0V.B9zcn_1639992206; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0V.B9zcn_1639992206) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 20 Dec 2021 17:23:27 +0800
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
Subject: [PATCH 5/5] crypto: s390/sha512 - Use macros instead of direct IV
 numbers
Date: Mon, 20 Dec 2021 17:23:18 +0800
Message-Id: <20211220092318.5793-6-tianjia.zhang@linux.alibaba.com>
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

In the init functions of sha512 and sha384, the initial hash value
use macros instead of numbers.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 arch/s390/crypto/sha512_s390.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/s390/crypto/sha512_s390.c b/arch/s390/crypto/sha512_s390.c
index 29a6bd404c59..43ce4956df73 100644
--- a/arch/s390/crypto/sha512_s390.c
+++ b/arch/s390/crypto/sha512_s390.c
@@ -22,14 +22,14 @@ static int sha512_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *ctx = shash_desc_ctx(desc);
 
-	*(__u64 *)&ctx->state[0] = 0x6a09e667f3bcc908ULL;
-	*(__u64 *)&ctx->state[2] = 0xbb67ae8584caa73bULL;
-	*(__u64 *)&ctx->state[4] = 0x3c6ef372fe94f82bULL;
-	*(__u64 *)&ctx->state[6] = 0xa54ff53a5f1d36f1ULL;
-	*(__u64 *)&ctx->state[8] = 0x510e527fade682d1ULL;
-	*(__u64 *)&ctx->state[10] = 0x9b05688c2b3e6c1fULL;
-	*(__u64 *)&ctx->state[12] = 0x1f83d9abfb41bd6bULL;
-	*(__u64 *)&ctx->state[14] = 0x5be0cd19137e2179ULL;
+	*(__u64 *)&ctx->state[0] = SHA512_H0;
+	*(__u64 *)&ctx->state[2] = SHA512_H1;
+	*(__u64 *)&ctx->state[4] = SHA512_H2;
+	*(__u64 *)&ctx->state[6] = SHA512_H3;
+	*(__u64 *)&ctx->state[8] = SHA512_H4;
+	*(__u64 *)&ctx->state[10] = SHA512_H5;
+	*(__u64 *)&ctx->state[12] = SHA512_H6;
+	*(__u64 *)&ctx->state[14] = SHA512_H7;
 	ctx->count = 0;
 	ctx->func = CPACF_KIMD_SHA_512;
 
@@ -87,14 +87,14 @@ static int sha384_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *ctx = shash_desc_ctx(desc);
 
-	*(__u64 *)&ctx->state[0] = 0xcbbb9d5dc1059ed8ULL;
-	*(__u64 *)&ctx->state[2] = 0x629a292a367cd507ULL;
-	*(__u64 *)&ctx->state[4] = 0x9159015a3070dd17ULL;
-	*(__u64 *)&ctx->state[6] = 0x152fecd8f70e5939ULL;
-	*(__u64 *)&ctx->state[8] = 0x67332667ffc00b31ULL;
-	*(__u64 *)&ctx->state[10] = 0x8eb44a8768581511ULL;
-	*(__u64 *)&ctx->state[12] = 0xdb0c2e0d64f98fa7ULL;
-	*(__u64 *)&ctx->state[14] = 0x47b5481dbefa4fa4ULL;
+	*(__u64 *)&ctx->state[0] = SHA384_H0;
+	*(__u64 *)&ctx->state[2] = SHA384_H1;
+	*(__u64 *)&ctx->state[4] = SHA384_H2;
+	*(__u64 *)&ctx->state[6] = SHA384_H3;
+	*(__u64 *)&ctx->state[8] = SHA384_H4;
+	*(__u64 *)&ctx->state[10] = SHA384_H5;
+	*(__u64 *)&ctx->state[12] = SHA384_H6;
+	*(__u64 *)&ctx->state[14] = SHA384_H7;
 	ctx->count = 0;
 	ctx->func = CPACF_KIMD_SHA_512;
 
-- 
2.32.0

