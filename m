Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BBAD6D4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 04:47:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sfwd4NhhzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 13:47:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="F96iiTbN"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sftd1mpLzDqv4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 13:45:44 +1100 (AEDT)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02830217F9;
 Tue, 15 Oct 2019 02:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571107542;
 bh=rEgridOr8x0Q5MuTsLI43vItUDgIo4mn9nzaQ9Vl67w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F96iiTbN+pwBwSuudvaRKiotVJp0wfe0Jic4ohAgo+DLyt2dJ/uAeAqplBMMVpIv+
 Hqe4aGidB8cMgFC2IZiaPU5f6NwBkfQ6kwOpN/sCjr7TZ/KYVbNh6t5fEougninXcY
 8UOSBpMpVUx2Iwdr9/deFzDazTEqvVXCLyZrubWU=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 1/3] crypto: powerpc - don't unnecessarily use atomic
 scatterwalk
Date: Mon, 14 Oct 2019 19:45:15 -0700
Message-Id: <20191015024517.52790-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015024517.52790-1-ebiggers@kernel.org>
References: <20191015024517.52790-1-ebiggers@kernel.org>
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
Cc: Markus Stockhausen <stockhausen@collogia.de>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Eric Biggers <ebiggers@google.com>

The PowerPC SPE implementations of AES modes only disable preemption
during the actual encryption/decryption, not during the scatterwalk
functions.  It's therefore unnecessary to request an atomic scatterwalk.
So don't do so.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/aes-spe-glue.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/powerpc/crypto/aes-spe-glue.c b/arch/powerpc/crypto/aes-spe-glue.c
index 3a4ca7d32477..319f1dbb3a70 100644
--- a/arch/powerpc/crypto/aes-spe-glue.c
+++ b/arch/powerpc/crypto/aes-spe-glue.c
@@ -186,7 +186,6 @@ static int ppc_ecb_encrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
 	unsigned int ubytes;
 	int err;
 
-	desc->flags &= ~CRYPTO_TFM_REQ_MAY_SLEEP;
 	blkcipher_walk_init(&walk, dst, src, nbytes);
 	err = blkcipher_walk_virt(desc, &walk);
 
@@ -214,7 +213,6 @@ static int ppc_ecb_decrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
 	unsigned int ubytes;
 	int err;
 
-	desc->flags &= ~CRYPTO_TFM_REQ_MAY_SLEEP;
 	blkcipher_walk_init(&walk, dst, src, nbytes);
 	err = blkcipher_walk_virt(desc, &walk);
 
@@ -242,7 +240,6 @@ static int ppc_cbc_encrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
 	unsigned int ubytes;
 	int err;
 
-	desc->flags &= ~CRYPTO_TFM_REQ_MAY_SLEEP;
 	blkcipher_walk_init(&walk, dst, src, nbytes);
 	err = blkcipher_walk_virt(desc, &walk);
 
@@ -270,7 +267,6 @@ static int ppc_cbc_decrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
 	unsigned int ubytes;
 	int err;
 
-	desc->flags &= ~CRYPTO_TFM_REQ_MAY_SLEEP;
 	blkcipher_walk_init(&walk, dst, src, nbytes);
 	err = blkcipher_walk_virt(desc, &walk);
 
@@ -298,7 +294,6 @@ static int ppc_ctr_crypt(struct blkcipher_desc *desc, struct scatterlist *dst,
 	unsigned int pbytes, ubytes;
 	int err;
 
-	desc->flags &= ~CRYPTO_TFM_REQ_MAY_SLEEP;
 	blkcipher_walk_init(&walk, dst, src, nbytes);
 	err = blkcipher_walk_virt_block(desc, &walk, AES_BLOCK_SIZE);
 
@@ -329,7 +324,6 @@ static int ppc_xts_encrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
 	int err;
 	u32 *twk;
 
-	desc->flags &= ~CRYPTO_TFM_REQ_MAY_SLEEP;
 	blkcipher_walk_init(&walk, dst, src, nbytes);
 	err = blkcipher_walk_virt(desc, &walk);
 	twk = ctx->key_twk;
@@ -360,7 +354,6 @@ static int ppc_xts_decrypt(struct blkcipher_desc *desc, struct scatterlist *dst,
 	int err;
 	u32 *twk;
 
-	desc->flags &= ~CRYPTO_TFM_REQ_MAY_SLEEP;
 	blkcipher_walk_init(&walk, dst, src, nbytes);
 	err = blkcipher_walk_virt(desc, &walk);
 	twk = ctx->key_twk;
-- 
2.23.0

