Return-Path: <linuxppc-dev+bounces-1528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C1B97EC48
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2024 15:31:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XC3m54Sttz2yGs;
	Mon, 23 Sep 2024 23:31:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727098261;
	cv=none; b=RblX21QbHHmDd6gxtmYK5yIq1OcSSYJQOB3Hf5Svg+8u0emmI9VqVoQ9Ga99Pf4U2DZGCQoRf1UW3XhsqdN9QS8oW1Pv+hyUfhbux7RUbtOm0wD+qjXBvn6u9OmJvntef0J6NZ4g037dHWfZjbIr2BXkIHJiHRpr03DOX1+3xlkLHIOgUwnLeGYsF2c3BxU+Tp+xZ2R9DHrjVOI5qOtUzAR9q6uY7fh2vSyZ6GqjPw+RsWjAX3xMyIq6FLk0Og/CAno5ZJOJUdNiREw75v3k+VF6xTPFjIpJcD4Gob9qgI361iECkLCrWAcYoeJDJEBGMxPkaR86lFxAx3yBkxYPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727098261; c=relaxed/relaxed;
	bh=zLl16kE989YcR8bnlTCXmIqUA8qnBy6nvqU+S+AC7ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgPGH2h8OZGTj91LN/yogBwzQoi0rgQFDB0puvilijMqWQd3LJ6tpxHsh6/mVqjtgMdkYy/Ye+vrzzdRTh1AlXZnx2DZrJksUaK20ifsRWNwgI72qSK3QMmM1X9fHXq+2lmevfnduEGIcAJAFutvbHUHJk3T/KoVpIfMISHNc+dcWIWmMLBKqgY00q+BsN7or1LcUwgUJaKeoIymIbbSUnxfSw2nJpIVsRNvQ/tvUJwNyRBb29EWtvpUAoeMIaH5HsHqmYeIkShqtdsSf41oSW0OwKEe1OzlpSQc4PlQQ3YofZbvnRiQ2Zn5FB7dhFKdN0MRTz02YbQ3wiG/zlZFoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fi3wJ3db; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fi3wJ3db;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XC3m45ysrz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:31:00 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NAIFDh027592;
	Mon, 23 Sep 2024 13:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=zLl16kE989YcR
	8bnlTCXmIqUA8qnBy6nvqU+S+AC7ak=; b=Fi3wJ3db/jOUYcFSQwCLx4iNth4La
	k6aJxtpJc5hke86Y5y10Y7JAj6/SS9qSuoCCJHOysMdvserG93GhPRoWppOXuiEV
	uQV4mSR5ac8xmtZR/ceI2PSpo5G7Ob7BU3c1KVTbDWe0jeKTfpKHbbT0ezoQxKSu
	iDodZsk8A81UfwJPLJ7w9ZPOi3JReWjBemHSH5diBWCwCAxK51ka4pnUNcNDhrHx
	gxUvBcJRKa2JmhxUS0wFWV0hhgeK2GSQZeGfkNcDiTQSsTkI7C+TQG5spU9yJAJm
	GxNInSOiieGxY5l0gnO/ceK7G4WrcvwGLGGTwPstRk40Zcklf+pvew7/g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41snt13rt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 13:30:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48NC2AVY005862;
	Mon, 23 Sep 2024 13:30:49 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 41tapm6j3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 13:30:49 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48NDUm8s42795328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Sep 2024 13:30:48 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 097475805D;
	Mon, 23 Sep 2024 13:30:48 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C9FA5805F;
	Mon, 23 Sep 2024 13:30:47 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Sep 2024 13:30:47 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Cc: stable@vger.kernel.org, herbert@gondor.apana.org.au, leitao@debian.org,
        nayna@linux.ibm.com, appro@cryptogams.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com,
        Danny Tsen <dtsen@linux.ibm.com>
Subject: [PATCH 2/3] crypto: Register modules as SIMD modules for ppcle64 AES/GCM algs.
Date: Mon, 23 Sep 2024 09:30:39 -0400
Message-ID: <20240923133040.4630-3-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923133040.4630-1-dtsen@linux.ibm.com>
References: <20240923133040.4630-1-dtsen@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NTL3eF3ft11gaUdDkJb7uHsRkAQ97uvO
X-Proofpoint-GUID: NTL3eF3ft11gaUdDkJb7uHsRkAQ97uvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-23_10,2024-09-23_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409230099

This patch is to fix an issue when simd is not usable that data mismatch
may occur. The fix is to register algs as SIMD modules so that the
algorithm is excecuted when SIMD instructions is usable.  Called
gcm_update() to generate the final digest if needed.

A new module rfc4106(gcm(aes)) is also added.

Fixes: cdcecfd9991f ("crypto: p10-aes-gcm - Glue code for AES/GCM stitched implementation")

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/aes-gcm-p10-glue.c | 141 +++++++++++++++++++++----
 1 file changed, 118 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index f62ee54076c0..e52629334cf8 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -8,6 +8,7 @@
 #include <asm/unaligned.h>
 #include <asm/simd.h>
 #include <asm/switch_to.h>
+#include <crypto/gcm.h>
 #include <crypto/aes.h>
 #include <crypto/algapi.h>
 #include <crypto/b128ops.h>
@@ -24,6 +25,7 @@
 
 #define	PPC_ALIGN		16
 #define GCM_IV_SIZE		12
+#define RFC4106_NONCE_SIZE	4
 
 MODULE_DESCRIPTION("PPC64le AES-GCM with Stitched implementation");
 MODULE_AUTHOR("Danny Tsen <dtsen@linux.ibm.com");
@@ -31,7 +33,7 @@ MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_CRYPTO("aes");
 
 asmlinkage int aes_p10_set_encrypt_key(const u8 *userKey, const int bits,
-				      void *key);
+				       void *key);
 asmlinkage void aes_p10_encrypt(const u8 *in, u8 *out, const void *key);
 asmlinkage void aes_p10_gcm_encrypt(u8 *in, u8 *out, size_t len,
 				    void *rkey, u8 *iv, void *Xi);
@@ -39,7 +41,8 @@ asmlinkage void aes_p10_gcm_decrypt(u8 *in, u8 *out, size_t len,
 				    void *rkey, u8 *iv, void *Xi);
 asmlinkage void gcm_init_htable(unsigned char htable[], unsigned char Xi[]);
 asmlinkage void gcm_ghash_p10(unsigned char *Xi, unsigned char *Htable,
-		unsigned char *aad, unsigned int alen);
+			      unsigned char *aad, unsigned int alen);
+asmlinkage void gcm_update(u8 *iv, void *Xi);
 
 struct aes_key {
 	u8 key[AES_MAX_KEYLENGTH];
@@ -52,6 +55,7 @@ struct gcm_ctx {
 	u8 aad_hash[16];
 	u64 aadLen;
 	u64 Plen;	/* offset 56 - used in aes_p10_gcm_{en/de}crypt */
+	u8 pblock[16];
 };
 struct Hash_ctx {
 	u8 H[16];	/* subkey */
@@ -60,17 +64,20 @@ struct Hash_ctx {
 
 struct p10_aes_gcm_ctx {
 	struct aes_key enc_key;
+	u8 nonce[RFC4106_NONCE_SIZE];
 };
 
 static void vsx_begin(void)
 {
 	preempt_disable();
+	pagefault_disable();
 	enable_kernel_vsx();
 }
 
 static void vsx_end(void)
 {
 	disable_kernel_vsx();
+	pagefault_enable();
 	preempt_enable();
 }
 
@@ -185,7 +192,7 @@ static int set_authsize(struct crypto_aead *tfm, unsigned int authsize)
 }
 
 static int p10_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
-			     unsigned int keylen)
+			      unsigned int keylen)
 {
 	struct crypto_tfm *tfm = crypto_aead_tfm(aead);
 	struct p10_aes_gcm_ctx *ctx = crypto_tfm_ctx(tfm);
@@ -198,7 +205,8 @@ static int p10_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 	return ret ? -EINVAL : 0;
 }
 
-static int p10_aes_gcm_crypt(struct aead_request *req, int enc)
+static int p10_aes_gcm_crypt(struct aead_request *req, u8 *riv,
+			     int assoclen, int enc)
 {
 	struct crypto_tfm *tfm = req->base.tfm;
 	struct p10_aes_gcm_ctx *ctx = crypto_tfm_ctx(tfm);
@@ -210,7 +218,6 @@ static int p10_aes_gcm_crypt(struct aead_request *req, int enc)
 	struct skcipher_walk walk;
 	u8 *assocmem = NULL;
 	u8 *assoc;
-	unsigned int assoclen = req->assoclen;
 	unsigned int cryptlen = req->cryptlen;
 	unsigned char ivbuf[AES_BLOCK_SIZE+PPC_ALIGN];
 	unsigned char *iv = PTR_ALIGN((void *)ivbuf, PPC_ALIGN);
@@ -218,11 +225,12 @@ static int p10_aes_gcm_crypt(struct aead_request *req, int enc)
 	unsigned long auth_tag_len = crypto_aead_authsize(__crypto_aead_cast(tfm));
 	u8 otag[16];
 	int total_processed = 0;
+	int nbytes;
 
 	memset(databuf, 0, sizeof(databuf));
 	memset(hashbuf, 0, sizeof(hashbuf));
 	memset(ivbuf, 0, sizeof(ivbuf));
-	memcpy(iv, req->iv, GCM_IV_SIZE);
+	memcpy(iv, riv, GCM_IV_SIZE);
 
 	/* Linearize assoc, if not already linear */
 	if (req->src->length >= assoclen && req->src->length) {
@@ -257,19 +265,25 @@ static int p10_aes_gcm_crypt(struct aead_request *req, int enc)
 	if (ret)
 		return ret;
 
-	while (walk.nbytes > 0 && ret == 0) {
+	while ((nbytes = walk.nbytes) > 0 && ret == 0) {
+		u8 *src = walk.src.virt.addr;
+		u8 *dst = walk.dst.virt.addr;
+		u8 buf[AES_BLOCK_SIZE];
+
+		if (unlikely(nbytes > 0 && nbytes < AES_BLOCK_SIZE))
+			src = dst = memcpy(buf, src, nbytes);
 
 		vsx_begin();
 		if (enc)
-			aes_p10_gcm_encrypt(walk.src.virt.addr,
-					    walk.dst.virt.addr,
-					    walk.nbytes,
+			aes_p10_gcm_encrypt(src, dst, nbytes,
 					    &ctx->enc_key, gctx->iv, hash->Htable);
 		else
-			aes_p10_gcm_decrypt(walk.src.virt.addr,
-					    walk.dst.virt.addr,
-					    walk.nbytes,
+			aes_p10_gcm_decrypt(src, dst, nbytes,
 					    &ctx->enc_key, gctx->iv, hash->Htable);
+
+		if (unlikely(nbytes > 0 && nbytes < AES_BLOCK_SIZE))
+			memcpy(walk.dst.virt.addr, buf, nbytes);
+
 		vsx_end();
 
 		total_processed += walk.nbytes;
@@ -281,6 +295,7 @@ static int p10_aes_gcm_crypt(struct aead_request *req, int enc)
 
 	/* Finalize hash */
 	vsx_begin();
+	gcm_update(gctx->iv, hash->Htable);
 	finish_tag(gctx, hash, total_processed);
 	vsx_end();
 
@@ -302,17 +317,63 @@ static int p10_aes_gcm_crypt(struct aead_request *req, int enc)
 	return 0;
 }
 
+static int rfc4106_setkey(struct crypto_aead *tfm, const u8 *inkey,
+			  unsigned int keylen)
+{
+	struct p10_aes_gcm_ctx *ctx = crypto_aead_ctx(tfm);
+	int err;
+
+	keylen -= RFC4106_NONCE_SIZE;
+	err = p10_aes_gcm_setkey(tfm, inkey, keylen);
+	if (err)
+		return err;
+
+	memcpy(ctx->nonce, inkey + keylen, RFC4106_NONCE_SIZE);
+	return 0;
+}
+
+static int rfc4106_setauthsize(struct crypto_aead *tfm, unsigned int authsize)
+{
+	return crypto_rfc4106_check_authsize(authsize);
+}
+
+static int rfc4106_encrypt(struct aead_request *req)
+{
+	struct crypto_aead *aead = crypto_aead_reqtfm(req);
+	struct p10_aes_gcm_ctx *ctx = crypto_aead_ctx(aead);
+	u8 iv[AES_BLOCK_SIZE];
+
+	memcpy(iv, ctx->nonce, RFC4106_NONCE_SIZE);
+	memcpy(iv + RFC4106_NONCE_SIZE, req->iv, GCM_RFC4106_IV_SIZE);
+
+	return crypto_ipsec_check_assoclen(req->assoclen) ?:
+	       p10_aes_gcm_crypt(req, iv, req->assoclen - GCM_RFC4106_IV_SIZE, 1);
+}
+
+static int rfc4106_decrypt(struct aead_request *req)
+{
+	struct crypto_aead *aead = crypto_aead_reqtfm(req);
+	struct p10_aes_gcm_ctx *ctx = crypto_aead_ctx(aead);
+	u8 iv[AES_BLOCK_SIZE];
+
+	memcpy(iv, ctx->nonce, RFC4106_NONCE_SIZE);
+	memcpy(iv + RFC4106_NONCE_SIZE, req->iv, GCM_RFC4106_IV_SIZE);
+
+	return crypto_ipsec_check_assoclen(req->assoclen) ?:
+	       p10_aes_gcm_crypt(req, iv, req->assoclen - GCM_RFC4106_IV_SIZE, 0);
+}
+
 static int p10_aes_gcm_encrypt(struct aead_request *req)
 {
-	return p10_aes_gcm_crypt(req, 1);
+	return p10_aes_gcm_crypt(req, req->iv, req->assoclen, 1);
 }
 
 static int p10_aes_gcm_decrypt(struct aead_request *req)
 {
-	return p10_aes_gcm_crypt(req, 0);
+	return p10_aes_gcm_crypt(req, req->iv, req->assoclen, 0);
 }
 
-static struct aead_alg gcm_aes_alg = {
+static struct aead_alg gcm_aes_algs[] = {{
 	.ivsize			= GCM_IV_SIZE,
 	.maxauthsize		= 16,
 
@@ -321,23 +382,57 @@ static struct aead_alg gcm_aes_alg = {
 	.encrypt		= p10_aes_gcm_encrypt,
 	.decrypt		= p10_aes_gcm_decrypt,
 
-	.base.cra_name		= "gcm(aes)",
-	.base.cra_driver_name	= "aes_gcm_p10",
+	.base.cra_name		= "__gcm(aes)",
+	.base.cra_driver_name	= "__aes_gcm_p10",
 	.base.cra_priority	= 2100,
 	.base.cra_blocksize	= 1,
-	.base.cra_ctxsize	= sizeof(struct p10_aes_gcm_ctx),
+	.base.cra_ctxsize	= sizeof(struct p10_aes_gcm_ctx)+
+				  4 * sizeof(u64[2]),
 	.base.cra_module	= THIS_MODULE,
-};
+	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
+}, {
+	.ivsize			= GCM_RFC4106_IV_SIZE,
+	.maxauthsize		= 16,
+	.setkey			= rfc4106_setkey,
+	.setauthsize		= rfc4106_setauthsize,
+	.encrypt		= rfc4106_encrypt,
+	.decrypt		= rfc4106_decrypt,
+
+	.base.cra_name		= "__rfc4106(gcm(aes))",
+	.base.cra_driver_name	= "__rfc4106_aes_gcm_p10",
+	.base.cra_priority	= 2100,
+	.base.cra_blocksize	= 1,
+	.base.cra_ctxsize	= sizeof(struct p10_aes_gcm_ctx) +
+				  4 * sizeof(u64[2]),
+	.base.cra_module	= THIS_MODULE,
+	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
+}};
+
+static struct simd_aead_alg *p10_simd_aeads[ARRAY_SIZE(gcm_aes_algs)];
 
 static int __init p10_init(void)
 {
-	return crypto_register_aead(&gcm_aes_alg);
+	int ret;
+
+	if (!cpu_has_feature(PPC_FEATURE2_ARCH_3_1))
+		return 0;
+
+	ret = simd_register_aeads_compat(gcm_aes_algs,
+					 ARRAY_SIZE(gcm_aes_algs),
+					 p10_simd_aeads);
+	if (ret) {
+		simd_unregister_aeads(gcm_aes_algs, ARRAY_SIZE(gcm_aes_algs),
+				      p10_simd_aeads);
+		return ret;
+	}
+	return 0;
 }
 
 static void __exit p10_exit(void)
 {
-	crypto_unregister_aead(&gcm_aes_alg);
+	simd_unregister_aeads(gcm_aes_algs, ARRAY_SIZE(gcm_aes_algs),
+			      p10_simd_aeads);
 }
 
-module_cpu_feature_match(PPC_MODULE_FEATURE_P10, p10_init);
+module_init(p10_init);
 module_exit(p10_exit);
-- 
2.43.0


