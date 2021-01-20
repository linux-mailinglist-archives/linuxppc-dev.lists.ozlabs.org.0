Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EAF2FD8EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 19:59:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLZZd2LmSzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 05:59:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLZXM1VThzDqTj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 05:57:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DLZX62sgcz9tybr;
 Wed, 20 Jan 2021 19:57:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wNUy4APIEvhB; Wed, 20 Jan 2021 19:57:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DLZX623DVz9tybZ;
 Wed, 20 Jan 2021 19:57:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CBFF8B7F8;
 Wed, 20 Jan 2021 19:57:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pDsI-BVMOiaA; Wed, 20 Jan 2021 19:57:26 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 048988B7F2;
 Wed, 20 Jan 2021 19:57:26 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D733566A56; Wed, 20 Jan 2021 18:57:25 +0000 (UTC)
Message-Id: <bb8560ebc6db72a82afd0fcdecf5ca80cb9c9d3d.1611169001.git.christophe.leroy@csgroup.eu>
In-Reply-To: <4b7a870573f485b9fea496b13c9b02d86dd97314.1611169001.git.christophe.leroy@csgroup.eu>
References: <4b7a870573f485b9fea496b13c9b02d86dd97314.1611169001.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] crypto: talitos - Fix ctr(aes) on SEC1
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Date: Wed, 20 Jan 2021 18:57:25 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While ctr(aes) requires the use of a special descriptor on SEC2 (see
commit 70d355ccea89 ("crypto: talitos - fix ctr-aes-talitos")), that
special descriptor doesn't work on SEC1, see commit e738c5f15562
("powerpc/8xx: Add DT node for using the SEC engine of the MPC885").

However, the common nonsnoop descriptor works properly on SEC1 for
ctr(aes).

Add a second template for ctr(aes) that will be registered
only on SEC1.

Fixes: 70d355ccea89 ("crypto: talitos - fix ctr-aes-talitos")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/crypto/talitos.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index b656983c1ef4..25c9f825b8b5 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -2765,6 +2765,22 @@ static struct talitos_alg_template driver_algs[] = {
 				     DESC_HDR_SEL0_AESU |
 				     DESC_HDR_MODE0_AESU_CTR,
 	},
+	{	.type = CRYPTO_ALG_TYPE_SKCIPHER,
+		.alg.skcipher = {
+			.base.cra_name = "ctr(aes)",
+			.base.cra_driver_name = "ctr-aes-talitos",
+			.base.cra_blocksize = 1,
+			.base.cra_flags = CRYPTO_ALG_ASYNC |
+					  CRYPTO_ALG_ALLOCATES_MEMORY,
+			.min_keysize = AES_MIN_KEY_SIZE,
+			.max_keysize = AES_MAX_KEY_SIZE,
+			.ivsize = AES_BLOCK_SIZE,
+			.setkey = skcipher_aes_setkey,
+		},
+		.desc_hdr_template = DESC_HDR_TYPE_COMMON_NONSNOOP_NO_AFEU |
+				     DESC_HDR_SEL0_AESU |
+				     DESC_HDR_MODE0_AESU_CTR,
+	},
 	{	.type = CRYPTO_ALG_TYPE_SKCIPHER,
 		.alg.skcipher = {
 			.base.cra_name = "ecb(des)",
@@ -3182,6 +3198,12 @@ static struct talitos_crypto_alg *talitos_alg_alloc(struct device *dev,
 			t_alg->algt.alg.skcipher.setkey ?: skcipher_setkey;
 		t_alg->algt.alg.skcipher.encrypt = skcipher_encrypt;
 		t_alg->algt.alg.skcipher.decrypt = skcipher_decrypt;
+		if (!strcmp(alg->cra_name, "ctr(aes)") && !has_ftr_sec1(priv) &&
+		    DESC_TYPE(t_alg->algt.desc_hdr_template) !=
+		    DESC_TYPE(DESC_HDR_TYPE_AESU_CTR_NONSNOOP)) {
+			devm_kfree(dev, t_alg);
+			return ERR_PTR(-ENOTSUPP);
+		}
 		break;
 	case CRYPTO_ALG_TYPE_AEAD:
 		alg = &t_alg->algt.alg.aead.base;
-- 
2.25.0

