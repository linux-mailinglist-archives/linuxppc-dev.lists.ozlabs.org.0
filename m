Return-Path: <linuxppc-dev+bounces-1304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D5197751C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 01:22:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4YPL3xQ2z2yGh;
	Fri, 13 Sep 2024 09:22:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726163494;
	cv=none; b=Sw5Yct7VnEi1+x9luTZa4mdltt8lBfT5IdH7G7YhWyT5TRqyjL3Ri9d1zh2S3aFpTOHMvOppQ/g+fDC1BRQxfjlhwzF+cPHtMtCaGwTGn3nNCgCAUlNPrL7B4YzyoVbcfGnuLeZ7+pQVZueq9DMs+1zUlUykRLteSOhybD6NpF3zd6QFLLZna1wiyvBoOdHaLnRFSeF0f9JPX6jH7tqYC8og0rSBQF3l35h3k7ZX4hWKWabXMSvyYmI0E7bkhFVnVLoz5vz7bVEIJ7Qq/u7OW+tWKSwy/tMYc8Z3/+J4r1wxU22Daa9uy4ecPuFEsA6rbOrwN0zDeZseZRV0bx/BKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726163494; c=relaxed/relaxed;
	bh=7io/ikQfueEOsLAPTYBTvMAGI08bQdfYepchwif+lS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAKEu1TTFERWP6IpwhYDLamsHgvXlXCQTv0tOquKmuVWLiyF8PcIMizhwIZGNQb7rlZSL22CEYHO8UqV2wBwui5bm60WSIp5SaC83+rdjmPec5w5H+/RcKr6fuS2Kpd6ZGwgjA1ShcLsw1WOn4cIExGa6Q0qhDrSFfwzDrFlh3wuBYJhB05sAAv0yxJ9gRSrMPrturnl+VSd15R6+0+xIZPzYw2XVsjQU86HZE3qSbqYJfrdLe/NZQF8miJA3Pc1t7jJyojFLRkqKgMKRtafFif4CFMdLZ3wK/WXpO03ovo7HAtnUu6NVZeT8nxX8HccDHIJLdRak9YfIZnV9+9mRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rfBph9hO; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rfBph9hO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4Q3n3Wrsz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 03:51:32 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CCSaOJ015345;
	Thu, 12 Sep 2024 17:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=7io/ikQfueEOsLAPTYBTvMAGI0
	8bQdfYepchwif+lS8=; b=rfBph9hO9bpDQuEHcvRc33BqBSaMizIe0n/eOBif88
	P2aG8qrSVpFgAUouDNE1SHrdMHl+GmzceC71AYrA9FhBqHsrJBIh9c8LIoW5pFF9
	A2E/DQE8P/4/2bfQMzIX33/G4+rzc5EQJRvuw9lXiWsY94ovX7bkkicA0Thg1ia2
	HrVXsoc6hO9WLyXvP12+oWv7NGRv3LchXELdnfsY1KmQ5rG7ROfxt+a9Cmn488mb
	MR4hsfLy0qCk6mWlYNn394la4OP6T2oe4t8EzHHnU1hP+QqEEbkJh9OTG4M1epES
	exEtCfZt4waumj84KIDpajJCi328eOeKbt+aK8J12Oqw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gefyvyyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 17:46:10 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48CF6UFS019899;
	Thu, 12 Sep 2024 17:46:09 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h25q9g8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 17:46:09 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48CHk8Mu60227916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 17:46:08 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A38058054;
	Thu, 12 Sep 2024 17:46:08 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EFD25803F;
	Thu, 12 Sep 2024 17:46:07 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Sep 2024 17:46:07 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, leitao@debian.org, nayna@linux.ibm.com,
        appro@cryptogams.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com,
        Danny Tsen <dtsen@linux.ibm.com>
Subject: [PATCH 1/1] crypto: Fix data mismatch over ipsec tunnel encrypted/decrypted with ppc64le AES/GCM module.
Date: Thu, 12 Sep 2024 13:45:37 -0400
Message-ID: <20240912174537.1409567-1-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: jHKSmcOKSgTFpNS6PQjmujquCOV7qoGN
X-Proofpoint-ORIG-GUID: jHKSmcOKSgTFpNS6PQjmujquCOV7qoGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_05,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 clxscore=1011 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120130

This patch is to fix an issue when simd is not usable that data mismatch
may occur over ipsec tunnel. The fix is to register algs as SIMD modules
so that the algorithm is excecuted when SIMD instructions is usable.

A new module rfc4106(gcm(aes)) is also added. Re-write AES/GCM assembly
codes with smaller footprints and small performance gain.

This patch has been tested with the kernel crypto module tcrypt.ko and
has passed the selftest.  The patch is also tested with
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/Kconfig            |    1 +
 arch/powerpc/crypto/aes-gcm-p10-glue.c |  141 +-
 arch/powerpc/crypto/aes-gcm-p10.S      | 2421 +++++++++++-------------
 3 files changed, 1187 insertions(+), 1376 deletions(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 09ebcbdfb34f..951a43726461 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -112,6 +112,7 @@ config CRYPTO_AES_GCM_P10
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
+	select CRYPTO_SIMD
 	help
 	  AEAD cipher: AES cipher algorithms (FIPS-197)
 	  GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
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
diff --git a/arch/powerpc/crypto/aes-gcm-p10.S b/arch/powerpc/crypto/aes-gcm-p10.S
index a51f4b265308..89f50eef3512 100644
--- a/arch/powerpc/crypto/aes-gcm-p10.S
+++ b/arch/powerpc/crypto/aes-gcm-p10.S
@@ -1,42 +1,42 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
- #
- # Accelerated AES-GCM stitched implementation for ppc64le.
- #
- # Copyright 2022- IBM Inc. All rights reserved
- #
- #===================================================================================
- # Written by Danny Tsen <dtsen@linux.ibm.com>
- #
- # GHASH is based on the Karatsuba multiplication method.
- #
- #    Xi xor X1
- #
- #    X1 * H^4 + X2 * H^3 + x3 * H^2 + X4 * H =
- #      (X1.h * H4.h + xX.l * H4.l + X1 * H4) +
- #      (X2.h * H3.h + X2.l * H3.l + X2 * H3) +
- #      (X3.h * H2.h + X3.l * H2.l + X3 * H2) +
- #      (X4.h * H.h + X4.l * H.l + X4 * H)
- #
- # Xi = v0
- # H Poly = v2
- # Hash keys = v3 - v14
- #     ( H.l, H, H.h)
- #     ( H^2.l, H^2, H^2.h)
- #     ( H^3.l, H^3, H^3.h)
- #     ( H^4.l, H^4, H^4.h)
- #
- # v30 is IV
- # v31 - counter 1
- #
- # AES used,
- #     vs0 - vs14 for round keys
- #     v15, v16, v17, v18, v19, v20, v21, v22 for 8 blocks (encrypted)
- #
- # This implementation uses stitched AES-GCM approach to improve overall performance.
- # AES is implemented with 8x blocks and GHASH is using 2 4x blocks.
- #
- # ===================================================================================
- #
+#
+# Accelerated AES-GCM stitched implementation for ppc64le.
+#
+# Copyright 2024- IBM Inc.
+#
+#===================================================================================
+# Written by Danny Tsen <dtsen@us.ibm.com>
+#
+# GHASH is based on the Karatsuba multiplication method.
+#
+#    Xi xor X1
+#
+#    X1 * H^4 + X2 * H^3 + x3 * H^2 + X4 * H =
+#      (X1.h * H4.h + xX.l * H4.l + X1 * H4) +
+#      (X2.h * H3.h + X2.l * H3.l + X2 * H3) +
+#      (X3.h * H2.h + X3.l * H2.l + X3 * H2) +
+#      (X4.h * H.h + X4.l * H.l + X4 * H)
+#
+# Xi = v0
+# H Poly = v2
+# Hash keys = v3 - v14
+#     ( H.l, H, H.h)
+#     ( H^2.l, H^2, H^2.h)
+#     ( H^3.l, H^3, H^3.h)
+#     ( H^4.l, H^4, H^4.h)
+#
+# v30 is IV
+# v31 - counter 1
+#
+# AES used,
+#     vs0 - round key 0
+#     v15, v16, v17, v18, v19, v20, v21, v22 for 8 blocks (encrypted)
+#
+# This implementation uses stitched AES-GCM approach to improve overall performance.
+# AES is implemented with 8x blocks and GHASH is using 2 4x blocks.
+#
+# ===================================================================================
+#
 
 #include <asm/ppc_asm.h>
 #include <linux/linkage.h>
@@ -44,483 +44,224 @@
 .machine        "any"
 .text
 
- # 4x loops
- # v15 - v18 - input states
- # vs1 - vs9 - round keys
- #
-.macro Loop_aes_middle4x
-	xxlor	19+32, 1, 1
-	xxlor	20+32, 2, 2
-	xxlor	21+32, 3, 3
-	xxlor	22+32, 4, 4
-
-	vcipher	15, 15, 19
-	vcipher	16, 16, 19
-	vcipher	17, 17, 19
-	vcipher	18, 18, 19
-
-	vcipher	15, 15, 20
-	vcipher	16, 16, 20
-	vcipher	17, 17, 20
-	vcipher	18, 18, 20
-
-	vcipher	15, 15, 21
-	vcipher	16, 16, 21
-	vcipher	17, 17, 21
-	vcipher	18, 18, 21
-
-	vcipher	15, 15, 22
-	vcipher	16, 16, 22
-	vcipher	17, 17, 22
-	vcipher	18, 18, 22
-
-	xxlor	19+32, 5, 5
-	xxlor	20+32, 6, 6
-	xxlor	21+32, 7, 7
-	xxlor	22+32, 8, 8
-
-	vcipher	15, 15, 19
-	vcipher	16, 16, 19
-	vcipher	17, 17, 19
-	vcipher	18, 18, 19
-
-	vcipher	15, 15, 20
-	vcipher	16, 16, 20
-	vcipher	17, 17, 20
-	vcipher	18, 18, 20
-
-	vcipher	15, 15, 21
-	vcipher	16, 16, 21
-	vcipher	17, 17, 21
-	vcipher	18, 18, 21
-
-	vcipher	15, 15, 22
-	vcipher	16, 16, 22
-	vcipher	17, 17, 22
-	vcipher	18, 18, 22
-
-	xxlor	23+32, 9, 9
-	vcipher	15, 15, 23
-	vcipher	16, 16, 23
-	vcipher	17, 17, 23
-	vcipher	18, 18, 23
+.macro	SAVE_GPR GPR OFFSET FRAME
+	std	\GPR,\OFFSET(\FRAME)
 .endm
 
- # 8x loops
- # v15 - v22 - input states
- # vs1 - vs9 - round keys
- #
-.macro Loop_aes_middle8x
-	xxlor	23+32, 1, 1
-	xxlor	24+32, 2, 2
-	xxlor	25+32, 3, 3
-	xxlor	26+32, 4, 4
-
-	vcipher	15, 15, 23
-	vcipher	16, 16, 23
-	vcipher	17, 17, 23
-	vcipher	18, 18, 23
-	vcipher	19, 19, 23
-	vcipher	20, 20, 23
-	vcipher	21, 21, 23
-	vcipher	22, 22, 23
-
-	vcipher	15, 15, 24
-	vcipher	16, 16, 24
-	vcipher	17, 17, 24
-	vcipher	18, 18, 24
-	vcipher	19, 19, 24
-	vcipher	20, 20, 24
-	vcipher	21, 21, 24
-	vcipher	22, 22, 24
-
-	vcipher	15, 15, 25
-	vcipher	16, 16, 25
-	vcipher	17, 17, 25
-	vcipher	18, 18, 25
-	vcipher	19, 19, 25
-	vcipher	20, 20, 25
-	vcipher	21, 21, 25
-	vcipher	22, 22, 25
-
-	vcipher	15, 15, 26
-	vcipher	16, 16, 26
-	vcipher	17, 17, 26
-	vcipher	18, 18, 26
-	vcipher	19, 19, 26
-	vcipher	20, 20, 26
-	vcipher	21, 21, 26
-	vcipher	22, 22, 26
-
-	xxlor	23+32, 5, 5
-	xxlor	24+32, 6, 6
-	xxlor	25+32, 7, 7
-	xxlor	26+32, 8, 8
-
-	vcipher	15, 15, 23
-	vcipher	16, 16, 23
-	vcipher	17, 17, 23
-	vcipher	18, 18, 23
-	vcipher	19, 19, 23
-	vcipher	20, 20, 23
-	vcipher	21, 21, 23
-	vcipher	22, 22, 23
-
-	vcipher	15, 15, 24
-	vcipher	16, 16, 24
-	vcipher	17, 17, 24
-	vcipher	18, 18, 24
-	vcipher	19, 19, 24
-	vcipher	20, 20, 24
-	vcipher	21, 21, 24
-	vcipher	22, 22, 24
-
-	vcipher	15, 15, 25
-	vcipher	16, 16, 25
-	vcipher	17, 17, 25
-	vcipher	18, 18, 25
-	vcipher	19, 19, 25
-	vcipher	20, 20, 25
-	vcipher	21, 21, 25
-	vcipher	22, 22, 25
-
-	vcipher	15, 15, 26
-	vcipher	16, 16, 26
-	vcipher	17, 17, 26
-	vcipher	18, 18, 26
-	vcipher	19, 19, 26
-	vcipher	20, 20, 26
-	vcipher	21, 21, 26
-	vcipher	22, 22, 26
-
-	xxlor	23+32, 9, 9
-	vcipher	15, 15, 23
-	vcipher	16, 16, 23
-	vcipher	17, 17, 23
-	vcipher	18, 18, 23
-	vcipher	19, 19, 23
-	vcipher	20, 20, 23
-	vcipher	21, 21, 23
-	vcipher	22, 22, 23
+.macro	SAVE_VRS VRS OFFSET FRAME
+	stxv	\VRS+32, \OFFSET(\FRAME)
 .endm
 
-.macro Loop_aes_middle_1x
-	xxlor	19+32, 1, 1
-	xxlor	20+32, 2, 2
-	xxlor	21+32, 3, 3
-	xxlor	22+32, 4, 4
-
-	vcipher 15, 15, 19
-	vcipher 15, 15, 20
-	vcipher 15, 15, 21
-	vcipher 15, 15, 22
-
-	xxlor	19+32, 5, 5
-	xxlor	20+32, 6, 6
-	xxlor	21+32, 7, 7
-	xxlor	22+32, 8, 8
-
-	vcipher 15, 15, 19
-	vcipher 15, 15, 20
-	vcipher 15, 15, 21
-	vcipher 15, 15, 22
-
-	xxlor	19+32, 9, 9
-	vcipher 15, 15, 19
+.macro	RESTORE_GPR GPR OFFSET FRAME
+	ld	\GPR,\OFFSET(\FRAME)
 .endm
 
- #
- # Compute 4x hash values based on Karatsuba method.
- #
-.macro ppc_aes_gcm_ghash
-	vxor		15, 15, 0
-
-	vpmsumd		23, 12, 15		# H4.L * X.L
-	vpmsumd		24, 9, 16
-	vpmsumd		25, 6, 17
-	vpmsumd		26, 3, 18
-
-	vxor		23, 23, 24
-	vxor		23, 23, 25
-	vxor		23, 23, 26		# L
-
-	vpmsumd		24, 13, 15		# H4.L * X.H + H4.H * X.L
-	vpmsumd		25, 10, 16		# H3.L * X1.H + H3.H * X1.L
-	vpmsumd		26, 7, 17
-	vpmsumd		27, 4, 18
-
-	vxor		24, 24, 25
-	vxor		24, 24, 26
-	vxor		24, 24, 27		# M
-
-	# sum hash and reduction with H Poly
-	vpmsumd		28, 23, 2		# reduction
-
-	vxor		29, 29, 29
-	vsldoi		26, 24, 29, 8		# mL
-	vsldoi		29, 29, 24, 8		# mH
-	vxor		23, 23, 26		# mL + L
-
-	vsldoi		23, 23, 23, 8		# swap
-	vxor		23, 23, 28
-
-	vpmsumd		24, 14, 15		# H4.H * X.H
-	vpmsumd		25, 11, 16
-	vpmsumd		26, 8, 17
-	vpmsumd		27, 5, 18
-
-	vxor		24, 24, 25
-	vxor		24, 24, 26
-	vxor		24, 24, 27
-
-	vxor		24, 24, 29
-
-	# sum hash and reduction with H Poly
-	vsldoi		27, 23, 23, 8		# swap
-	vpmsumd		23, 23, 2
-	vxor		27, 27, 24
-	vxor		23, 23, 27
-
-	xxlor		32, 23+32, 23+32		# update hash
-
+.macro	RESTORE_VRS VRS OFFSET FRAME
+	lxv	\VRS+32, \OFFSET(\FRAME)
 .endm
 
- #
- # Combine two 4x ghash
- # v15 - v22 - input blocks
- #
-.macro ppc_aes_gcm_ghash2_4x
-	# first 4x hash
-	vxor		15, 15, 0		# Xi + X
-
-	vpmsumd		23, 12, 15		# H4.L * X.L
-	vpmsumd		24, 9, 16
-	vpmsumd		25, 6, 17
-	vpmsumd		26, 3, 18
-
-	vxor		23, 23, 24
-	vxor		23, 23, 25
-	vxor		23, 23, 26		# L
-
-	vpmsumd		24, 13, 15		# H4.L * X.H + H4.H * X.L
-	vpmsumd		25, 10, 16		# H3.L * X1.H + H3.H * X1.L
-	vpmsumd		26, 7, 17
-	vpmsumd		27, 4, 18
-
-	vxor		24, 24, 25
-	vxor		24, 24, 26
-
-	# sum hash and reduction with H Poly
-	vpmsumd		28, 23, 2		# reduction
-
-	vxor		29, 29, 29
-
-	vxor		24, 24, 27		# M
-	vsldoi		26, 24, 29, 8		# mL
-	vsldoi		29, 29, 24, 8		# mH
-	vxor		23, 23, 26		# mL + L
-
-	vsldoi		23, 23, 23, 8		# swap
-	vxor		23, 23, 28
+.macro SAVE_REGS
+	mflr 0
+	std 0, 16(1)
+	stdu 1,-512(1)
+
+	SAVE_GPR 14, 112, 1
+	SAVE_GPR 15, 120, 1
+	SAVE_GPR 16, 128, 1
+	SAVE_GPR 17, 136, 1
+	SAVE_GPR 18, 144, 1
+	SAVE_GPR 19, 152, 1
+	SAVE_GPR 20, 160, 1
+	SAVE_GPR 21, 168, 1
+	SAVE_GPR 22, 176, 1
+	SAVE_GPR 23, 184, 1
+	SAVE_GPR 24, 192, 1
+
+	addi	9, 1, 256
+	SAVE_VRS 20, 0, 9
+	SAVE_VRS 21, 16, 9
+	SAVE_VRS 22, 32, 9
+	SAVE_VRS 23, 48, 9
+	SAVE_VRS 24, 64, 9
+	SAVE_VRS 25, 80, 9
+	SAVE_VRS 26, 96, 9
+	SAVE_VRS 27, 112, 9
+	SAVE_VRS 28, 128, 9
+	SAVE_VRS 29, 144, 9
+	SAVE_VRS 30, 160, 9
+	SAVE_VRS 31, 176, 9
+.endm # SAVE_REGS
 
-	vpmsumd		24, 14, 15		# H4.H * X.H
-	vpmsumd		25, 11, 16
-	vpmsumd		26, 8, 17
-	vpmsumd		27, 5, 18
+.macro RESTORE_REGS
+	addi	9, 1, 256
+	RESTORE_VRS 20, 0, 9
+	RESTORE_VRS 21, 16, 9
+	RESTORE_VRS 22, 32, 9
+	RESTORE_VRS 23, 48, 9
+	RESTORE_VRS 24, 64, 9
+	RESTORE_VRS 25, 80, 9
+	RESTORE_VRS 26, 96, 9
+	RESTORE_VRS 27, 112, 9
+	RESTORE_VRS 28, 128, 9
+	RESTORE_VRS 29, 144, 9
+	RESTORE_VRS 30, 160, 9
+	RESTORE_VRS 31, 176, 9
+
+	RESTORE_GPR 14, 112, 1
+	RESTORE_GPR 15, 120, 1
+	RESTORE_GPR 16, 128, 1
+	RESTORE_GPR 17, 136, 1
+	RESTORE_GPR 18, 144, 1
+	RESTORE_GPR 19, 152, 1
+	RESTORE_GPR 20, 160, 1
+	RESTORE_GPR 21, 168, 1
+	RESTORE_GPR 22, 176, 1
+	RESTORE_GPR 23, 184, 1
+	RESTORE_GPR 24, 192, 1
+
+	addi    1, 1, 512
+	ld 0, 16(1)
+	mtlr 0
+.endm # RESTORE_REGS
+
+# 4x loops
+.macro AES_CIPHER_4x _VCIPHER ST r
+	\_VCIPHER	\ST, \ST, \r
+	\_VCIPHER	\ST+1, \ST+1, \r
+	\_VCIPHER	\ST+2, \ST+2, \r
+	\_VCIPHER	\ST+3, \ST+3, \r
+.endm
 
-	vxor		24, 24, 25
-	vxor		24, 24, 26
-	vxor		24, 24, 27		# H
+# 8x loops
+.macro AES_CIPHER_8x _VCIPHER ST r
+	\_VCIPHER	\ST, \ST, \r
+	\_VCIPHER	\ST+1, \ST+1, \r
+	\_VCIPHER	\ST+2, \ST+2, \r
+	\_VCIPHER	\ST+3, \ST+3, \r
+	\_VCIPHER	\ST+4, \ST+4, \r
+	\_VCIPHER	\ST+5, \ST+5, \r
+	\_VCIPHER	\ST+6, \ST+6, \r
+	\_VCIPHER	\ST+7, \ST+7, \r
+.endm
 
-	vxor		24, 24, 29		# H + mH
+.macro LOOP_8AES_STATE
+	xxlor	32+23, 1, 1
+	xxlor	32+24, 2, 2
+	xxlor	32+25, 3, 3
+	xxlor	32+26, 4, 4
+	AES_CIPHER_8x vcipher, 15, 23
+	AES_CIPHER_8x vcipher, 15, 24
+	AES_CIPHER_8x vcipher, 15, 25
+	AES_CIPHER_8x vcipher, 15, 26
+	xxlor	32+23, 5, 5
+	xxlor	32+24, 6, 6
+	xxlor	32+25, 7, 7
+	xxlor	32+26, 8, 8
+	AES_CIPHER_8x vcipher, 15, 23
+	AES_CIPHER_8x vcipher, 15, 24
+	AES_CIPHER_8x vcipher, 15, 25
+	AES_CIPHER_8x vcipher, 15, 26
+.endm
 
-	# sum hash and reduction with H Poly
-	vsldoi		27, 23, 23, 8		# swap
-	vpmsumd		23, 23, 2
-	vxor		27, 27, 24
-	vxor		27, 23, 27		# 1st Xi
-
-	# 2nd 4x hash
-	vpmsumd		24, 9, 20
-	vpmsumd		25, 6, 21
-	vpmsumd		26, 3, 22
-	vxor		19, 19, 27		# Xi + X
-	vpmsumd		23, 12, 19		# H4.L * X.L
-
-	vxor		23, 23, 24
-	vxor		23, 23, 25
-	vxor		23, 23, 26		# L
-
-	vpmsumd		24, 13, 19		# H4.L * X.H + H4.H * X.L
-	vpmsumd		25, 10, 20		# H3.L * X1.H + H3.H * X1.L
-	vpmsumd		26, 7, 21
-	vpmsumd		27, 4, 22
-
-	vxor		24, 24, 25
-	vxor		24, 24, 26
+#
+# PPC_GHASH4x(H, S1, S2, S3, S4): Compute 4x hash values based on Karatsuba method.
+# H: returning digest
+# S#: states
+#
+# S1 should xor with the previous digest
+#
+# Xi = v0
+# H Poly = v2
+# Hash keys = v3 - v14
+# Scratch: v23 - v29
+#
+.macro PPC_GHASH4x H S1 S2 S3 S4
+
+	vpmsumd	23, 12, \S1		# H4.L * X.L
+	vpmsumd	24, 9, \S2
+	vpmsumd	25, 6, \S3
+	vpmsumd	26, 3, \S4
+
+	vpmsumd	27, 13, \S1		# H4.L * X.H + H4.H * X.L
+	vpmsumd	28, 10, \S2		# H3.L * X1.H + H3.H * X1.L
+
+	vxor	23, 23, 24
+	vxor	23, 23, 25
+	vxor	23, 23, 26		# L
+
+	vxor	24, 27, 28
+	vpmsumd	25, 7, \S3
+	vpmsumd	26, 4, \S4
+
+	vxor	24, 24, 25
+	vxor	24, 24, 26		# M
 
 	# sum hash and reduction with H Poly
-	vpmsumd		28, 23, 2		# reduction
-
-	vxor		29, 29, 29
+	vpmsumd	28, 23, 2		# reduction
 
-	vxor		24, 24, 27		# M
-	vsldoi		26, 24, 29, 8		# mL
-	vsldoi		29, 29, 24, 8		# mH
-	vxor		23, 23, 26		# mL + L
+	vxor	1, 1, 1
+	vsldoi	25, 24, 1, 8		# mL
+	vsldoi	1, 1, 24, 8		# mH
+	vxor	23, 23, 25		# mL + L
 
-	vsldoi		23, 23, 23, 8		# swap
-	vxor		23, 23, 28
+	# This performs swap and xor like,
+	#   vsldoi	23, 23, 23, 8		# swap
+	#   vxor	23, 23, 28
+	xxlor	32+25, 10, 10
+	vpermxor 23, 23, 28, 25
 
-	vpmsumd		24, 14, 19		# H4.H * X.H
-	vpmsumd		25, 11, 20
-	vpmsumd		26, 8, 21
-	vpmsumd		27, 5, 22
+	vpmsumd	26, 14, \S1		# H4.H * X.H
+	vpmsumd	27, 11, \S2
+	vpmsumd	28, 8, \S3
+	vpmsumd	29, 5, \S4
 
-	vxor		24, 24, 25
-	vxor		24, 24, 26
-	vxor		24, 24, 27		# H
+	vxor	24, 26, 27
+	vxor	24, 24, 28
+	vxor	24, 24, 29
 
-	vxor		24, 24, 29		# H + mH
+	vxor	24, 24, 1
 
 	# sum hash and reduction with H Poly
-	vsldoi		27, 23, 23, 8		# swap
-	vpmsumd		23, 23, 2
-	vxor		27, 27, 24
-	vxor		23, 23, 27
-
-	xxlor		32, 23+32, 23+32		# update hash
-
+	vsldoi	25, 23, 23, 8		# swap
+	vpmsumd	23, 23, 2
+	vxor	27, 25, 24
+	vxor	\H, 23, 27
 .endm
 
- #
- # Compute update single hash
- #
-.macro ppc_update_hash_1x
-	vxor		28, 28, 0
-
-	vxor		19, 19, 19
+#
+# Compute update single ghash
+# scratch: v1, v22..v27
+#
+.macro PPC_GHASH1x H S1
 
-	vpmsumd		22, 3, 28		# L
-	vpmsumd		23, 4, 28		# M
-	vpmsumd		24, 5, 28		# H
+	vxor	1, 1, 1
 
-	vpmsumd		27, 22, 2		# reduction
+	vpmsumd	22, 3, \S1		# L
+	vpmsumd	23, 4, \S1		# M
+	vpmsumd	24, 5, \S1		# H
 
-	vsldoi		25, 23, 19, 8		# mL
-	vsldoi		26, 19, 23, 8		# mH
-	vxor		22, 22, 25		# LL + LL
-	vxor		24, 24, 26		# HH + HH
+	vpmsumd	27, 22, 2		# reduction
 
-	vsldoi		22, 22, 22, 8		# swap
-	vxor		22, 22, 27
+	vsldoi	25, 23, 1, 8		# mL
+	vsldoi	26, 1, 23, 8		# mH
+	vxor	22, 22, 25		# LL + LL
+	vxor	24, 24, 26		# HH + HH
 
-	vsldoi		20, 22, 22, 8		# swap
-	vpmsumd		22, 22, 2		# reduction
-	vxor		20, 20, 24
-	vxor		22, 22, 20
+	xxlor	32+25, 10, 10
+	vpermxor 22, 22, 27, 25
 
-	vmr		0, 22			# update hash
-
-.endm
-
-.macro SAVE_REGS
-	stdu 1,-640(1)
-	mflr 0
-
-	std	14,112(1)
-	std	15,120(1)
-	std	16,128(1)
-	std	17,136(1)
-	std	18,144(1)
-	std	19,152(1)
-	std	20,160(1)
-	std	21,168(1)
-	li	9, 256
-	stvx	20, 9, 1
-	addi	9, 9, 16
-	stvx	21, 9, 1
-	addi	9, 9, 16
-	stvx	22, 9, 1
-	addi	9, 9, 16
-	stvx	23, 9, 1
-	addi	9, 9, 16
-	stvx	24, 9, 1
-	addi	9, 9, 16
-	stvx	25, 9, 1
-	addi	9, 9, 16
-	stvx	26, 9, 1
-	addi	9, 9, 16
-	stvx	27, 9, 1
-	addi	9, 9, 16
-	stvx	28, 9, 1
-	addi	9, 9, 16
-	stvx	29, 9, 1
-	addi	9, 9, 16
-	stvx	30, 9, 1
-	addi	9, 9, 16
-	stvx	31, 9, 1
-	stxv	14, 464(1)
-	stxv	15, 480(1)
-	stxv	16, 496(1)
-	stxv	17, 512(1)
-	stxv	18, 528(1)
-	stxv	19, 544(1)
-	stxv	20, 560(1)
-	stxv	21, 576(1)
-	stxv	22, 592(1)
-	std	0, 656(1)
-.endm
-
-.macro RESTORE_REGS
-	lxv	14, 464(1)
-	lxv	15, 480(1)
-	lxv	16, 496(1)
-	lxv	17, 512(1)
-	lxv	18, 528(1)
-	lxv	19, 544(1)
-	lxv	20, 560(1)
-	lxv	21, 576(1)
-	lxv	22, 592(1)
-	li	9, 256
-	lvx	20, 9, 1
-	addi	9, 9, 16
-	lvx	21, 9, 1
-	addi	9, 9, 16
-	lvx	22, 9, 1
-	addi	9, 9, 16
-	lvx	23, 9, 1
-	addi	9, 9, 16
-	lvx	24, 9, 1
-	addi	9, 9, 16
-	lvx	25, 9, 1
-	addi	9, 9, 16
-	lvx	26, 9, 1
-	addi	9, 9, 16
-	lvx	27, 9, 1
-	addi	9, 9, 16
-	lvx	28, 9, 1
-	addi	9, 9, 16
-	lvx	29, 9, 1
-	addi	9, 9, 16
-	lvx	30, 9, 1
-	addi	9, 9, 16
-	lvx	31, 9, 1
-
-	ld	0, 656(1)
-	ld      14,112(1)
-	ld      15,120(1)
-	ld      16,128(1)
-	ld      17,136(1)
-	ld      18,144(1)
-	ld      19,152(1)
-	ld      20,160(1)
-	ld	21,168(1)
-
-	mtlr	0
-	addi	1, 1, 640
+	vsldoi	23, 22, 22, 8		# swap
+	vpmsumd	22, 22, 2		# reduction
+	vxor	23, 23, 24
+	vxor	\H, 22, 23
 .endm
 
+#
+# LOAD_HASH_TABLE
+# Xi = v0
+# H Poly = v2
+# Hash keys = v3 - v14
+#
 .macro LOAD_HASH_TABLE
 	# Load Xi
 	lxvb16x	32, 0, 8	# load Xi
@@ -557,657 +298,434 @@
 	lxvd2x	14+32, 10, 8	# H^4h
 .endm
 
- #
- # aes_p10_gcm_encrypt (const void *inp, void *out, size_t len,
- #               const char *rk, unsigned char iv[16], void *Xip);
- #
- #    r3 - inp
- #    r4 - out
- #    r5 - len
- #    r6 - AES round keys
- #    r7 - iv and other data
- #    r8 - Xi, HPoli, hash keys
- #
- #    rounds is at offset 240 in rk
- #    Xi is at 0 in gcm_table (Xip).
- #
-_GLOBAL(aes_p10_gcm_encrypt)
-.align 5
-
-	SAVE_REGS
-
-	LOAD_HASH_TABLE
-
-	# initialize ICB: GHASH( IV ), IV - r7
-	lxvb16x	30+32, 0, 7	# load IV  - v30
-
-	mr	12, 5		# length
-	li	11, 0		# block index
-
-	# counter 1
-	vxor	31, 31, 31
-	vspltisb 22, 1
-	vsldoi	31, 31, 22,1	# counter 1
-
-	# load round key to VSR
-	lxv	0, 0(6)
-	lxv	1, 0x10(6)
-	lxv	2, 0x20(6)
-	lxv	3, 0x30(6)
-	lxv	4, 0x40(6)
-	lxv	5, 0x50(6)
-	lxv	6, 0x60(6)
-	lxv	7, 0x70(6)
-	lxv	8, 0x80(6)
-	lxv	9, 0x90(6)
-	lxv	10, 0xa0(6)
-
-	# load rounds - 10 (128), 12 (192), 14 (256)
-	lwz	9,240(6)
-
-	#
-	# vxor	state, state, w # addroundkey
-	xxlor	32+29, 0, 0
-	vxor	15, 30, 29	# IV + round key - add round key 0
-
-	cmpdi	9, 10
-	beq	Loop_aes_gcm_8x
-
-	# load 2 more round keys (v11, v12)
-	lxv	11, 0xb0(6)
-	lxv	12, 0xc0(6)
-
-	cmpdi	9, 12
-	beq	Loop_aes_gcm_8x
-
-	# load 2 more round keys (v11, v12, v13, v14)
-	lxv	13, 0xd0(6)
-	lxv	14, 0xe0(6)
-	cmpdi	9, 14
-	beq	Loop_aes_gcm_8x
-
-	b	aes_gcm_out
-
-.align 5
-Loop_aes_gcm_8x:
-	mr	14, 3
-	mr	9, 4
-
-	#
-	# check partial block
-	#
-Continue_partial_check:
-	ld	15, 56(7)
-	cmpdi	15, 0
-	beq	Continue
-	bgt	Final_block
-	cmpdi	15, 16
-	blt	Final_block
-
-Continue:
-	# n blcoks
-	li	10, 128
-	divdu	10, 12, 10	# n 128 bytes-blocks
-	cmpdi	10, 0
-	beq	Loop_last_block
-
-	vaddudm	30, 30, 31	# IV + counter
-	vxor	16, 30, 29
-	vaddudm	30, 30, 31
-	vxor	17, 30, 29
-	vaddudm	30, 30, 31
-	vxor	18, 30, 29
-	vaddudm	30, 30, 31
-	vxor	19, 30, 29
-	vaddudm	30, 30, 31
-	vxor	20, 30, 29
-	vaddudm	30, 30, 31
-	vxor	21, 30, 29
-	vaddudm	30, 30, 31
-	vxor	22, 30, 29
-
-	mtctr	10
-
-	li	15, 16
-	li	16, 32
-	li	17, 48
-	li	18, 64
-	li	19, 80
-	li	20, 96
-	li	21, 112
-
-	lwz	10, 240(6)
-
-Loop_8x_block:
-
-	lxvb16x		15, 0, 14	# load block
-	lxvb16x		16, 15, 14	# load block
-	lxvb16x		17, 16, 14	# load block
-	lxvb16x		18, 17, 14	# load block
-	lxvb16x		19, 18, 14	# load block
-	lxvb16x		20, 19, 14	# load block
-	lxvb16x		21, 20, 14	# load block
-	lxvb16x		22, 21, 14	# load block
-	addi		14, 14, 128
-
-	Loop_aes_middle8x
-
-	xxlor	23+32, 10, 10
-
-	cmpdi	10, 10
-	beq	Do_next_ghash
-
-	# 192 bits
-	xxlor	24+32, 11, 11
-
-	vcipher	15, 15, 23
-	vcipher	16, 16, 23
-	vcipher	17, 17, 23
-	vcipher	18, 18, 23
-	vcipher	19, 19, 23
-	vcipher	20, 20, 23
-	vcipher	21, 21, 23
-	vcipher	22, 22, 23
-
-	vcipher	15, 15, 24
-	vcipher	16, 16, 24
-	vcipher	17, 17, 24
-	vcipher	18, 18, 24
-	vcipher	19, 19, 24
-	vcipher	20, 20, 24
-	vcipher	21, 21, 24
-	vcipher	22, 22, 24
-
-	xxlor	23+32, 12, 12
-
-	cmpdi	10, 12
-	beq	Do_next_ghash
-
-	# 256 bits
-	xxlor	24+32, 13, 13
-
-	vcipher	15, 15, 23
-	vcipher	16, 16, 23
-	vcipher	17, 17, 23
-	vcipher	18, 18, 23
-	vcipher	19, 19, 23
-	vcipher	20, 20, 23
-	vcipher	21, 21, 23
-	vcipher	22, 22, 23
-
-	vcipher	15, 15, 24
-	vcipher	16, 16, 24
-	vcipher	17, 17, 24
-	vcipher	18, 18, 24
-	vcipher	19, 19, 24
-	vcipher	20, 20, 24
-	vcipher	21, 21, 24
-	vcipher	22, 22, 24
-
-	xxlor	23+32, 14, 14
-
-	cmpdi	10, 14
-	beq	Do_next_ghash
-	b	aes_gcm_out
-
-Do_next_ghash:
-
-	#
-	# last round
-	vcipherlast     15, 15, 23
-	vcipherlast     16, 16, 23
-
-	xxlxor		47, 47, 15
-	stxvb16x        47, 0, 9	# store output
-	xxlxor		48, 48, 16
-	stxvb16x        48, 15, 9	# store output
-
-	vcipherlast     17, 17, 23
-	vcipherlast     18, 18, 23
-
-	xxlxor		49, 49, 17
-	stxvb16x        49, 16, 9	# store output
-	xxlxor		50, 50, 18
-	stxvb16x        50, 17, 9	# store output
-
-	vcipherlast     19, 19, 23
-	vcipherlast     20, 20, 23
-
-	xxlxor		51, 51, 19
-	stxvb16x        51, 18, 9	# store output
-	xxlxor		52, 52, 20
-	stxvb16x        52, 19, 9	# store output
-
-	vcipherlast     21, 21, 23
-	vcipherlast     22, 22, 23
-
-	xxlxor		53, 53, 21
-	stxvb16x        53, 20, 9	# store output
-	xxlxor		54, 54, 22
-	stxvb16x        54, 21, 9	# store output
-
-	addi		9, 9, 128
-
-	# ghash here
-	ppc_aes_gcm_ghash2_4x
-
-	xxlor	27+32, 0, 0
-	vaddudm 30, 30, 31		# IV + counter
-	vmr	29, 30
-	vxor    15, 30, 27		# add round key
-	vaddudm 30, 30, 31
-	vxor    16, 30, 27
-	vaddudm 30, 30, 31
-	vxor    17, 30, 27
-	vaddudm 30, 30, 31
-	vxor    18, 30, 27
-	vaddudm 30, 30, 31
-	vxor    19, 30, 27
-	vaddudm 30, 30, 31
-	vxor    20, 30, 27
-	vaddudm 30, 30, 31
-	vxor    21, 30, 27
-	vaddudm 30, 30, 31
-	vxor    22, 30, 27
-
-	addi    12, 12, -128
-	addi    11, 11, 128
-
-	bdnz	Loop_8x_block
-
-	vmr	30, 29
-	stxvb16x 30+32, 0, 7		# update IV
-
-Loop_last_block:
-	cmpdi   12, 0
-	beq     aes_gcm_out
-
-	# loop last few blocks
+################################################################################
+# Compute AES and ghash one block at a time.
+# r23: AES rounds
+# v30: current IV
+# vs0: roundkey 0
+#
+################################################################################
+SYM_FUNC_START_LOCAL(aes_gcm_crypt_1x)
+
+	cmpdi	5, 16
+	bge	__More_1x
+	blr
+__More_1x:
 	li      10, 16
-	divdu   10, 12, 10
-
-	mtctr   10
-
-	lwz	10, 240(6)
-
-	cmpdi   12, 16
-	blt     Final_block
-
-Next_rem_block:
-	lxvb16x 15, 0, 14		# load block
-
-	Loop_aes_middle_1x
-
-	xxlor	23+32, 10, 10
-
-	cmpdi	10, 10
-	beq	Do_next_1x
-
-	# 192 bits
-	xxlor	24+32, 11, 11
-
-	vcipher	15, 15, 23
-	vcipher	15, 15, 24
-
-	xxlor	23+32, 12, 12
+	divdu   12, 5, 10
+
+	xxlxor	32+15, 32+30, 0
+
+	# Pre-load 8 AES rounds to scratch vectors.
+	xxlor	32+16, 1, 1
+	xxlor	32+17, 2, 2
+	xxlor	32+18, 3, 3
+	xxlor	32+19, 4, 4
+	xxlor	32+20, 5, 5
+	xxlor	32+21, 6, 6
+	xxlor	32+28, 7, 7
+	xxlor	32+29, 8, 8
+	lwz	23, 240(6)	# n rounds
+	addi	22, 23, -9	# remaing AES rounds
 
-	cmpdi	10, 12
-	beq	Do_next_1x
-
-	# 256 bits
-	xxlor	24+32, 13, 13
-
-	vcipher	15, 15, 23
-	vcipher	15, 15, 24
-
-	xxlor	23+32, 14, 14
-
-	cmpdi	10, 14
-	beq	Do_next_1x
-
-Do_next_1x:
-	vcipherlast     15, 15, 23
-
-	xxlxor		47, 47, 15
-	stxvb16x	47, 0, 9	# store output
-	addi		14, 14, 16
-	addi		9, 9, 16
-
-	vmr		28, 15
-	ppc_update_hash_1x
-
-	addi		12, 12, -16
-	addi		11, 11, 16
-	xxlor		19+32, 0, 0
-	vaddudm		30, 30, 31		# IV + counter
-	vxor		15, 30, 19		# add round key
-
-	bdnz	Next_rem_block
-
-	li	15, 0
-	std	15, 56(7)		# clear partial?
-	stxvb16x 30+32, 0, 7		# update IV
 	cmpdi	12, 0
-	beq	aes_gcm_out
-
-Final_block:
-	lwz	10, 240(6)
-	Loop_aes_middle_1x
-
-	xxlor	23+32, 10, 10
-
-	cmpdi	10, 10
-	beq	Do_final_1x
-
-	# 192 bits
-	xxlor	24+32, 11, 11
-
-	vcipher	15, 15, 23
-	vcipher	15, 15, 24
-
-	xxlor	23+32, 12, 12
-
-	cmpdi	10, 12
-	beq	Do_final_1x
-
-	# 256 bits
-	xxlor	24+32, 13, 13
-
-	vcipher	15, 15, 23
-	vcipher	15, 15, 24
+	bgt	__Loop_1x
+	blr
 
-	xxlor	23+32, 14, 14
+__Loop_1x:
+	mtctr	22
+	addi	10, 6, 144
+	vcipher	15, 15, 16
+	vcipher	15, 15, 17
+	vcipher	15, 15, 18
+	vcipher	15, 15, 19
+	vcipher	15, 15, 20
+	vcipher	15, 15, 21
+	vcipher	15, 15, 28
+	vcipher	15, 15, 29
 
-	cmpdi	10, 14
-	beq	Do_final_1x
+__Loop_aes_1state:
+	lxv	32+1, 0(10)
+	vcipher	15, 15, 1
+	addi	10, 10, 16
+	bdnz	__Loop_aes_1state
+	lxv	32+1, 0(10)		# last round key
+	lxvb16x 11, 0, 14		# load input block
+	vcipherlast 15, 15, 1
+
+	xxlxor	32+15, 32+15, 11
+	stxvb16x 32+15, 0, 9	# store output
+	addi	14, 14, 16
+	addi	9, 9, 16
 
-Do_final_1x:
-	vcipherlast     15, 15, 23
+	cmpdi	24, 0	# decrypt?
+	bne	__Encrypt_1x
+	xxlor	15+32, 11, 11
+__Encrypt_1x:
+	vxor	15, 15, 0
+	PPC_GHASH1x 0, 15
 
-	# check partial block
-	li	21, 0			# encrypt
-	ld	15, 56(7)		# partial?
-	cmpdi	15, 0
-	beq	Normal_block
-	bl	Do_partial_block
+	addi	5, 5, -16
+	addi	11, 11, 16
 
+	vadduwm 30, 30, 31		# IV + counter
+	xxlxor	32+15, 32+30, 0
+	addi	12, 12, -1
 	cmpdi	12, 0
-	ble aes_gcm_out
+	bgt	__Loop_1x
 
-	b Continue_partial_check
-
-Normal_block:
-	lxvb16x	15, 0, 14		# load last block
-	xxlxor	47, 47, 15
-
-	# create partial block mask
-	li	15, 16
-	sub	15, 15, 12		# index to the mask
-
-	vspltisb	16, -1		# first 16 bytes - 0xffff...ff
-	vspltisb	17, 0		# second 16 bytes - 0x0000...00
-	li	10, 192
-	stvx	16, 10, 1
+	stxvb16x 32+30, 0, 7		# update IV
+	stxvb16x 32+0, 0, 8		# update Xi
+	blr
+SYM_FUNC_END(aes_gcm_crypt_1x)
+
+################################################################################
+# Process a normal partial block when we come here.
+#  Compute partial mask, Load and store partial block to stack.
+#  Update partial_len and pblock.
+#  pblock is (encrypted ^ AES state) for encrypt
+#        and (input ^ AES state) for decrypt.
+#
+################################################################################
+SYM_FUNC_START_LOCAL(__Process_partial)
+
+	# create partial mask
+	vspltisb 16, -1
+	li	12, 16
+	sub	12, 12, 5
+	sldi	12, 12, 3
+	mtvsrdd	32+17, 0, 12
+	vslo	16, 16, 17		# partial block mask
+
+	lxvb16x 11, 0, 14		# load partial block
+	xxland	11, 11, 32+16
+
+	# AES crypt partial
+	xxlxor	32+15, 32+30, 0
+	lwz	23, 240(6)		# n rounds
+	addi	22, 23, -1		# loop - 1
+	mtctr	22
+	addi	10, 6, 16
+
+__Loop_aes_pstate:
+	lxv	32+1, 0(10)
+	vcipher	15, 15, 1
 	addi	10, 10, 16
-	stvx	17, 10, 1
-
-	addi	10, 1, 192
-	lxvb16x	16, 15, 10		# load partial block mask
-	xxland	47, 47, 16
-
-	vmr	28, 15
-	ppc_update_hash_1x
+	bdnz	__Loop_aes_pstate
+	lxv	32+1, 0(10)		# last round key
+	vcipherlast 15, 15, 1
 
-	# * should store only the remaining bytes.
-	bl	Write_partial_block
-
-	stxvb16x 30+32, 0, 7		# update IV
-	std	12, 56(7)		# update partial?
-	li	16, 16
+	xxlxor	32+15, 32+15, 11
+	vand	15, 15, 16
 
-	stxvb16x	32, 0, 8		# write out Xi
-	stxvb16x	32, 16, 8		# write out Xi
-	b aes_gcm_out
-
- #
- # Compute data mask
- #
-.macro GEN_MASK _mask _start _end
-	vspltisb	16, -1		# first 16 bytes - 0xffff...ff
-	vspltisb	17, 0		# second 16 bytes - 0x0000...00
-	li	10, 192
-	stxvb16x	17+32, 10, 1
-	add	10, 10, \_start
-	stxvb16x	16+32, 10, 1
-	add	10, 10, \_end
-	stxvb16x	17+32, 10, 1
-
-	addi	10, 1, 192
-	lxvb16x	\_mask, 0, 10		# load partial block mask
-.endm
+	# AES crypt output v15
+	# Write partial
+	li	10, 224
+	stxvb16x 15+32, 10, 1		# write v15 to stack
+	addi	10, 1, 223
+	addi	12, 9, -1
+        mtctr	5			# partial block len
+__Write_partial:
+        lbzu	22, 1(10)
+	stbu	22, 1(12)
+        bdnz	__Write_partial
+
+	cmpdi	24, 0			# decrypt?
+	bne	__Encrypt_partial
+	xxlor	32+15, 11, 11		# decrypt using the input block
+__Encrypt_partial:
+	#vxor	15, 15, 0		# ^ previous hash
+	#PPC_GHASH1x 0, 15
+
+	add	14, 14, 5
+	add	9, 9, 5
+	std	5, 56(7)		# update partial
+	sub	11, 11, 5
+	li	5, 0			# done last byte
 
- #
- # Handle multiple partial blocks for encrypt and decrypt
- #   operations.
- #
-SYM_FUNC_START_LOCAL(Do_partial_block)
-	add	17, 15, 5
-	cmpdi	17, 16
-	bgt	Big_block
-	GEN_MASK 18, 15, 5
-	b	_Partial
-SYM_FUNC_END(Do_partial_block)
-Big_block:
+	#
+	# Don't increase IV since this is the last partial.
+	# It should get updated in gcm_update if no more data blocks.
+	#vadduwm	30, 30, 31		# increase IV
+	stxvb16x 32+30, 0, 7		# update IV
+	li	10, 64
+	stxvb16x 32+0, 0, 8		# Update X1
+	stxvb16x 32+15, 10, 7		# Update pblock
+	blr
+SYM_FUNC_END(__Process_partial)
+
+################################################################################
+# Combine partial blocks and ghash when we come here.
+#
+# The partial block has to be shifted to the right location to encrypt/decrypt
+# and compute ghash if combing the previous partial block is needed.
+# - Compute ghash for a full block. Clear Partial_len and pblock. Update IV.
+#   Write Xi.
+# - Don't compute ghash if not full block.  gcm_update will take care of it
+#   is the last block. Update Partial_len and pblock.
+#
+################################################################################
+SYM_FUNC_START_LOCAL(__Combine_partial)
+
+	ld	12, 56(7)
+	mr	21, 5			# these bytes to be processed
+
+	li	17, 0
 	li	16, 16
-	GEN_MASK 18, 15, 16
-
-_Partial:
-	lxvb16x	17+32, 0, 14		# load last block
-	sldi	16, 15, 3
-	mtvsrdd	32+16, 0, 16
-	vsro	17, 17, 16
-	xxlxor	47, 47, 17+32
-	xxland	47, 47, 18
-
-	vxor	0, 0, 0			# clear Xi
-	vmr	28, 15
-
-	cmpdi	21, 0			# encrypt/decrypt ops?
-	beq	Skip_decrypt
-	xxland	32+28, 32+17, 18
-
-Skip_decrypt:
-
-	ppc_update_hash_1x
+	sub	22, 16, 12		# bytes to complete a block
+	sub	17, 22, 5		# remaining bytes in a block
+	cmpdi	5, 16
+	ble	__Inp_msg_less16
+	li	17, 0
+	mr	21, 22
+	b	__Combine_continue
+__Inp_msg_less16:
+	cmpd	22, 5
+	bgt	__Combine_continue
+	li	17, 0
+	mr	21, 22			# these bytes to be processed
+
+__Combine_continue:
+	# load msg and shift to the proper location and mask
+	vspltisb 16, -1
+	sldi	15, 12, 3
+	mtvsrdd	32+17, 0, 15
+	vslo	16, 16, 17
+	vsro	16, 16, 17
+	sldi	15, 17, 3
+	mtvsrdd	32+17, 0, 15
+	vsro	16, 16, 17
+	vslo	16, 16, 17		# mask
+
+	lxvb16x 32+19, 0, 14		# load partial block
+	sldi	15, 12, 3
+	mtvsrdd	32+17, 0, 15
+	vsro	19, 19, 17		# 0x00..xxxx??..??
+	sldi	15, 17, 3
+	mtvsrdd	32+17, 0, 15
+	vsro	19, 19, 17		# 0x00..xxxx
+	vslo	19, 19, 17		# shift back to form 0x00..xxxx00..00
+
+	# AES crypt partial
+	xxlxor	32+15, 32+30, 0
+	lwz	23, 240(6)	# n rounds
+	addi	22, 23, -1	# loop - 1
+	mtctr	22
+	addi	10, 6, 16
+
+__Loop_aes_cpstate:
+	lxv	32+1, 0(10)
+	vcipher	15, 15, 1
+	addi	10, 10, 16
+	bdnz	__Loop_aes_cpstate
+	lxv	32+1, 0(10)		# last round key
+	vcipherlast 15, 15, 1
 
-	li	16, 16
-	lxvb16x 32+29, 16, 8
-	vxor	0, 0, 29
-	stxvb16x 32, 0, 8		# save Xi
-	stxvb16x 32, 16, 8		# save Xi
-
-	# store partial block
-	# loop the rest of the stream if any
-	sldi	16, 15, 3
-	mtvsrdd	32+16, 0, 16
-	vslo	15, 15, 16
-	#stxvb16x 15+32, 0, 9		# last block
+	vxor	15, 15, 19
+	vand	15, 15, 16
 
-	li	16, 16
-	sub	17, 16, 15		# 16 - partial
-
-	add	16, 15, 5
-	cmpdi	16, 16
-	bgt	Larger_16
-	mr	17, 5
-Larger_16:
-
-	# write partial
-	li		10, 192
-	stxvb16x	15+32, 10, 1	# save current block
-
-	addi		10, 9, -1
-	addi		16, 1, 191
-	mtctr		17		# move partial byte count
-
-Write_last_partial:
-        lbzu		18, 1(16)
-	stbu		18, 1(10)
-        bdnz		Write_last_partial
-	# Complete loop partial
-
-	add	14, 14, 17
-	add	9, 9, 17
-	sub	12, 12, 17
-	add	11, 11, 17
-
-	add	15, 15, 5
-	cmpdi	15, 16
-	blt	Save_partial
-
-	vaddudm	30, 30, 31
-	stxvb16x 30+32, 0, 7		# update IV
-	xxlor	32+29, 0, 0
-	vxor	15, 30, 29		# IV + round key - add round key 0
-	li	15, 0
-	std	15, 56(7)		# partial done - clear
-	b	Partial_done
-Save_partial:
-	std	15, 56(7)		# partial
-
-Partial_done:
+	# AES crypt output v15
+	# Write partial
+	li	10, 224
+	stxvb16x 15+32, 10, 1		# write v15 to stack
+	addi	10, 1, 223
+	add	10, 10, 12		# add offset
+	addi	15, 9, -1
+        mtctr	21			# partial block len
+__Write_combine_partial:
+        lbzu	22, 1(10)
+	stbu	22, 1(15)
+        bdnz	__Write_combine_partial
+
+	add	14, 14, 21
+	add	11, 11, 21
+	add	9, 9, 21
+	sub	5, 5, 21
+
+	# Encrypt/Decrypt?
+	cmpdi	24, 0			# decrypt?
+	bne	__Encrypt_combine_partial
+	vmr	15, 19		# decrypt using the input block
+
+__Encrypt_combine_partial:
+	#
+	# Update partial flag and combine ghash.
+__Update_partial_ghash:
+	li	10, 64
+	lxvb16x 32+17, 10, 7		# load previous pblock
+	add	12, 12, 21		# combined pprocessed
+	vxor	15, 15, 17		# combined pblock
+
+	cmpdi	12, 16
+	beq	__Clear_partial_flag
+	std	12, 56(7)		# update partial len
+	stxvb16x 32+15, 10, 7		# Update current pblock
 	blr
 
- #
- # Write partial block
- # r9 - output
- # r12 - remaining bytes
- # v15 - partial input data
- #
-SYM_FUNC_START_LOCAL(Write_partial_block)
-	li		10, 192
-	stxvb16x	15+32, 10, 1		# last block
-
-	addi		10, 9, -1
-	addi		16, 1, 191
-
-        mtctr		12			# remaining bytes
-	li		15, 0
-
-Write_last_byte:
-        lbzu		14, 1(16)
-	stbu		14, 1(10)
-        bdnz		Write_last_byte
+__Clear_partial_flag:
+	li	12, 0
+	std	12, 56(7)
+	# Update IV and ghash here
+	vadduwm	30, 30, 31		# increase IV
+	stxvb16x 32+30, 0, 7		# update IV
+
+	# v15 either is either (input blockor encrypted)^(AES state)
+	vxor	15, 15, 0
+	PPC_GHASH1x 0, 15
+	stxvb16x 32+0, 10, 7		# update pblock for debug?
+	stxvb16x 32+0, 0, 8		# update Xi
 	blr
-SYM_FUNC_END(Write_partial_block)
+SYM_FUNC_END(__Combine_partial)
 
-aes_gcm_out:
-	# out = state
-	stxvb16x	32, 0, 8		# write out Xi
-	add	3, 11, 12		# return count
+################################################################################
+# gcm_update(iv, Xi) - compute last hash
+#
+################################################################################
+SYM_FUNC_START(gcm_update)
 
-	RESTORE_REGS
-	blr
+	ld	10, 56(3)
+	cmpdi	10, 0
+	beq	__no_update
 
- #
- # 8x Decrypt
- #
-_GLOBAL(aes_p10_gcm_decrypt)
-.align 5
+	lxvb16x	32, 0, 4	# load Xi
+	# load Hash - h^4, h^3, h^2, h
+	li	10, 32
+	lxvd2x	2+32, 10, 4	# H Poli
+	li	10, 48
+	lxvd2x	3+32, 10, 4	# Hl
+	li	10, 64
+	lxvd2x	4+32, 10, 4	# H
+	li	10, 80
+	lxvd2x	5+32, 10, 4	# Hh
+
+	addis	11, 2, permx@toc@ha
+	addi	11, 11, permx@toc@l
+	lxv	10, 0(11)	# vs10: vpermxor vector
+
+	li	9, 64
+	lxvb16x 32+6, 9, 3		# load pblock
+	vxor	6, 6, 0
+
+	vxor	1, 1, 1
+	vpmsumd	12, 3, 6		# L
+	vpmsumd	13, 4, 6		# M
+	vpmsumd	14, 5, 6		# H
+	vpmsumd	17, 12, 2		# reduction
+	vsldoi	15, 13, 1, 8		# mL
+	vsldoi	16, 1, 13, 8		# mH
+	vxor	12, 12, 15		# LL + LL
+	vxor	14, 14, 16		# HH + HH
+	xxlor	32+15, 10, 10
+	vpermxor 12, 12, 17, 15
+	vsldoi	13, 12, 12, 8		# swap
+	vpmsumd	12, 12, 2		# reduction
+	vxor	13, 13, 14
+	vxor	7, 12, 13
+
+	#vxor	0, 0, 0
+	#stxvb16x 32+0, 9, 3
+	li	10, 0
+	std	10, 56(3)
+	stxvb16x 32+7, 0, 4
+
+__no_update:
+	blr
+SYM_FUNC_END(gcm_update)
+
+################################################################################
+# aes_p10_gcm_encrypt (const void *inp, void *out, size_t len,
+#               const char *rk, unsigned char iv[16], void *Xip);
+#
+#    r3 - inp
+#    r4 - out
+#    r5 - len
+#    r6 - AES round keys
+#    r7 - iv and other data
+#    r8 - Xi, HPoli, hash keys
+#
+#    rounds is at offset 240 in rk
+#    Xi is at 0 in gcm_table (Xip).
+#
+################################################################################
+SYM_FUNC_START(aes_p10_gcm_encrypt)
+
+	cmpdi	5, 0
+	ble	__Invalid_msg_len
 
 	SAVE_REGS
-
 	LOAD_HASH_TABLE
 
 	# initialize ICB: GHASH( IV ), IV - r7
 	lxvb16x	30+32, 0, 7	# load IV  - v30
 
-	mr	12, 5		# length
-	li	11, 0		# block index
+	mr	14, 3
+	mr	9, 4
 
 	# counter 1
 	vxor	31, 31, 31
 	vspltisb 22, 1
 	vsldoi	31, 31, 22,1	# counter 1
 
-	# load round key to VSR
-	lxv	0, 0(6)
-	lxv	1, 0x10(6)
-	lxv	2, 0x20(6)
-	lxv	3, 0x30(6)
-	lxv	4, 0x40(6)
-	lxv	5, 0x50(6)
-	lxv	6, 0x60(6)
-	lxv	7, 0x70(6)
-	lxv	8, 0x80(6)
-	lxv	9, 0x90(6)
-	lxv	10, 0xa0(6)
+	addis	11, 2, permx@toc@ha
+	addi	11, 11, permx@toc@l
+	lxv	10, 0(11)	# vs10: vpermxor vector
+	li	11, 0
+
+	# load 9 round keys to VSR
+	lxv	0, 0(6)			# round key 0
+	lxv	1, 16(6)		# round key 1
+	lxv	2, 32(6)		# round key 2
+	lxv	3, 48(6)		# round key 3
+	lxv	4, 64(6)		# round key 4
+	lxv	5, 80(6)		# round key 5
+	lxv	6, 96(6)		# round key 6
+	lxv	7, 112(6)		# round key 7
+	lxv	8, 128(6)		# round key 8
 
 	# load rounds - 10 (128), 12 (192), 14 (256)
-	lwz	9,240(6)
+	lwz	23, 240(6)		# n rounds
+	li	24, 1			# encrypt
 
+__Process_encrypt:
 	#
-	# vxor	state, state, w # addroundkey
-	xxlor	32+29, 0, 0
-	vxor	15, 30, 29	# IV + round key - add round key 0
-
-	cmpdi	9, 10
-	beq	Loop_aes_gcm_8x_dec
-
-	# load 2 more round keys (v11, v12)
-	lxv	11, 0xb0(6)
-	lxv	12, 0xc0(6)
-
-	cmpdi	9, 12
-	beq	Loop_aes_gcm_8x_dec
-
-	# load 2 more round keys (v11, v12, v13, v14)
-	lxv	13, 0xd0(6)
-	lxv	14, 0xe0(6)
-	cmpdi	9, 14
-	beq	Loop_aes_gcm_8x_dec
+	# Process different blocks
+	#
+	ld	12, 56(7)
+	cmpdi	12, 0
+	bgt	__Do_combine_enc
+	cmpdi	5, 128
+	blt	__Process_more_enc
+
+#
+# Process 8x AES/GCM blocks
+#
+__Process_8x_enc:
+	# 8x blcoks
+	li	10, 128
+	divdu	12, 5, 10	# n 128 bytes-blocks
 
-	b	aes_gcm_out
+	addi	12, 12, -1	# loop - 1
 
-.align 5
-Loop_aes_gcm_8x_dec:
-	mr	14, 3
-	mr	9, 4
+	vmr	15, 30		# first state: IV
+	vadduwm	16, 15, 31	# state + counter
+	vadduwm	17, 16, 31
+	vadduwm	18, 17, 31
+	vadduwm	19, 18, 31
+	vadduwm	20, 19, 31
+	vadduwm	21, 20, 31
+	vadduwm	22, 21, 31
+	xxlor	9, 32+22, 32+22	# save last state
 
-	#
-	# check partial block
-	#
-Continue_partial_check_dec:
-	ld	15, 56(7)
-	cmpdi	15, 0
-	beq	Continue_dec
-	bgt	Final_block_dec
-	cmpdi	15, 16
-	blt	Final_block_dec
-
-Continue_dec:
-	# n blcoks
-	li	10, 128
-	divdu	10, 12, 10	# n 128 bytes-blocks
-	cmpdi	10, 0
-	beq	Loop_last_block_dec
-
-	vaddudm	30, 30, 31	# IV + counter
-	vxor	16, 30, 29
-	vaddudm	30, 30, 31
-	vxor	17, 30, 29
-	vaddudm	30, 30, 31
-	vxor	18, 30, 29
-	vaddudm	30, 30, 31
-	vxor	19, 30, 29
-	vaddudm	30, 30, 31
-	vxor	20, 30, 29
-	vaddudm	30, 30, 31
-	vxor	21, 30, 29
-	vaddudm	30, 30, 31
-	vxor	22, 30, 29
-
-	mtctr	10
+	# vxor  state, state, w # addroundkey
+	xxlor	32+29, 0, 0
+        vxor    15, 15, 29      # IV + round key - add round key 0
+	vxor	16, 16, 29
+	vxor	17, 17, 29
+	vxor	18, 18, 29
+	vxor	19, 19, 29
+	vxor	20, 20, 29
+	vxor	21, 21, 29
+	vxor	22, 22, 29
 
 	li	15, 16
 	li	16, 32
@@ -1217,305 +735,502 @@ Continue_dec:
 	li	20, 96
 	li	21, 112
 
-	lwz	10, 240(6)
-
-Loop_8x_block_dec:
-
-	lxvb16x		15, 0, 14	# load block
-	lxvb16x		16, 15, 14	# load block
-	lxvb16x		17, 16, 14	# load block
-	lxvb16x		18, 17, 14	# load block
-	lxvb16x		19, 18, 14	# load block
-	lxvb16x		20, 19, 14	# load block
-	lxvb16x		21, 20, 14	# load block
-	lxvb16x		22, 21, 14	# load block
-	addi		14, 14, 128
-
-	Loop_aes_middle8x
-
-	xxlor	23+32, 10, 10
-
-	cmpdi	10, 10
-	beq	Do_next_ghash_dec
-
-	# 192 bits
-	xxlor	24+32, 11, 11
-
-	vcipher	15, 15, 23
-	vcipher	16, 16, 23
-	vcipher	17, 17, 23
-	vcipher	18, 18, 23
-	vcipher	19, 19, 23
-	vcipher	20, 20, 23
-	vcipher	21, 21, 23
-	vcipher	22, 22, 23
-
-	vcipher	15, 15, 24
-	vcipher	16, 16, 24
-	vcipher	17, 17, 24
-	vcipher	18, 18, 24
-	vcipher	19, 19, 24
-	vcipher	20, 20, 24
-	vcipher	21, 21, 24
-	vcipher	22, 22, 24
-
-	xxlor	23+32, 12, 12
-
-	cmpdi	10, 12
-	beq	Do_next_ghash_dec
-
-	# 256 bits
-	xxlor	24+32, 13, 13
-
-	vcipher	15, 15, 23
-	vcipher	16, 16, 23
-	vcipher	17, 17, 23
-	vcipher	18, 18, 23
-	vcipher	19, 19, 23
-	vcipher	20, 20, 23
-	vcipher	21, 21, 23
-	vcipher	22, 22, 23
-
-	vcipher	15, 15, 24
-	vcipher	16, 16, 24
-	vcipher	17, 17, 24
-	vcipher	18, 18, 24
-	vcipher	19, 19, 24
-	vcipher	20, 20, 24
-	vcipher	21, 21, 24
-	vcipher	22, 22, 24
-
-	xxlor	23+32, 14, 14
-
-	cmpdi	10, 14
-	beq	Do_next_ghash_dec
-	b	aes_gcm_out
+	#
+	# Pre-compute first 8 AES state and leave 1/3/5 more rounds
+	# for the loop.
+	#
+	addi	22, 23, -9		# process 8 keys
+	mtctr	22			# AES key loop
+	addi	10, 6, 144
 
-Do_next_ghash_dec:
+	LOOP_8AES_STATE			# process 8 AES keys
 
-	#
-	# last round
-	vcipherlast     15, 15, 23
-	vcipherlast     16, 16, 23
-
-	xxlxor		47, 47, 15
-	stxvb16x        47, 0, 9	# store output
-	xxlxor		48, 48, 16
-	stxvb16x        48, 15, 9	# store output
-
-	vcipherlast     17, 17, 23
-	vcipherlast     18, 18, 23
-
-	xxlxor		49, 49, 17
-	stxvb16x        49, 16, 9	# store output
-	xxlxor		50, 50, 18
-	stxvb16x        50, 17, 9	# store output
-
-	vcipherlast     19, 19, 23
-	vcipherlast     20, 20, 23
-
-	xxlxor		51, 51, 19
-	stxvb16x        51, 18, 9	# store output
-	xxlxor		52, 52, 20
-	stxvb16x        52, 19, 9	# store output
-
-	vcipherlast     21, 21, 23
-	vcipherlast     22, 22, 23
-
-	xxlxor		53, 53, 21
-	stxvb16x        53, 20, 9	# store output
-	xxlxor		54, 54, 22
-	stxvb16x        54, 21, 9	# store output
-
-	addi		9, 9, 128
-
-	xxlor           15+32, 15, 15
-	xxlor           16+32, 16, 16
-	xxlor           17+32, 17, 17
-	xxlor           18+32, 18, 18
-	xxlor           19+32, 19, 19
-	xxlor           20+32, 20, 20
-	xxlor           21+32, 21, 21
-	xxlor           22+32, 22, 22
+__PreLoop_aes_state:
+	lxv	32+1, 0(10)		# round key
+	AES_CIPHER_8x vcipher 15 1
+	addi	10, 10, 16
+	bdnz	__PreLoop_aes_state
+	lxv	32+1, 0(10)		# last round key (v1)
+
+	cmpdi	12, 0			# Only one loop (8 block)
+	beq	__Finish_ghash
+
+#
+# Loop 8x blocks and compute ghash
+#
+__Loop_8x_block_enc:
+	vcipherlast     15, 15, 1
+	vcipherlast     16, 16, 1
+	vcipherlast     17, 17, 1
+	vcipherlast     18, 18, 1
+	vcipherlast     19, 19, 1
+	vcipherlast     20, 20, 1
+	vcipherlast     21, 21, 1
+	vcipherlast     22, 22, 1
+
+	lxvb16x	32+23, 0, 14	# load block
+	lxvb16x	32+24, 15, 14	# load block
+	lxvb16x	32+25, 16, 14	# load block
+	lxvb16x	32+26, 17, 14	# load block
+	lxvb16x	32+27, 18, 14	# load block
+	lxvb16x	32+28, 19, 14	# load block
+	lxvb16x	32+29, 20, 14	# load block
+	lxvb16x	32+30, 21, 14	# load block
+	addi	14, 14, 128
+
+	vxor	15, 15, 23
+	vxor	16, 16, 24
+	vxor	17, 17, 25
+	vxor	18, 18, 26
+	vxor	19, 19, 27
+	vxor	20, 20, 28
+	vxor	21, 21, 29
+	vxor	22, 22, 30
+
+	stxvb16x 47, 0, 9	# store output
+	stxvb16x 48, 15, 9	# store output
+	stxvb16x 49, 16, 9	# store output
+	stxvb16x 50, 17, 9	# store output
+	stxvb16x 51, 18, 9	# store output
+	stxvb16x 52, 19, 9	# store output
+	stxvb16x 53, 20, 9	# store output
+	stxvb16x 54, 21, 9	# store output
+	addi	9, 9, 128
 
 	# ghash here
-	ppc_aes_gcm_ghash2_4x
-
-	xxlor	27+32, 0, 0
-	vaddudm 30, 30, 31		# IV + counter
-	vmr	29, 30
-	vxor    15, 30, 27		# add round key
-	vaddudm 30, 30, 31
-	vxor    16, 30, 27
-	vaddudm 30, 30, 31
-	vxor    17, 30, 27
-	vaddudm 30, 30, 31
-	vxor    18, 30, 27
-	vaddudm 30, 30, 31
-	vxor    19, 30, 27
-	vaddudm 30, 30, 31
-	vxor    20, 30, 27
-	vaddudm 30, 30, 31
-	vxor    21, 30, 27
-	vaddudm 30, 30, 31
-	vxor    22, 30, 27
-
-	addi    12, 12, -128
+	vxor	15, 15, 0
+	PPC_GHASH4x 0, 15, 16, 17, 18
+
+	vxor	19, 19, 0
+	PPC_GHASH4x 0, 19, 20, 21, 22
+
+	xxlor	32+15, 9, 9		# last state
+	vadduwm 15, 15, 31		# state + counter
+	vadduwm 16, 15, 31
+	vadduwm 17, 16, 31
+	vadduwm 18, 17, 31
+	vadduwm 19, 18, 31
+	vadduwm 20, 19, 31
+	vadduwm 21, 20, 31
+	vadduwm 22, 21, 31
+	xxlor	9, 32+22, 32+22		# save last state
+
+	xxlor	32+27, 0, 0		# restore roundkey 0
+        vxor    15, 15, 27		# IV + round key - add round key 0
+	vxor	16, 16, 27
+	vxor	17, 17, 27
+	vxor	18, 18, 27
+	vxor	19, 19, 27
+	vxor	20, 20, 27
+	vxor	21, 21, 27
+	vxor	22, 22, 27
+
+	addi    5, 5, -128
 	addi    11, 11, 128
 
-	bdnz	Loop_8x_block_dec
-
-	vmr	30, 29
-	stxvb16x 30+32, 0, 7		# update IV
-
-Loop_last_block_dec:
-	cmpdi   12, 0
-	beq     aes_gcm_out
-
-	# loop last few blocks
-	li      10, 16
-	divdu   10, 12, 10
-
-	mtctr   10
-
-	lwz	10, 240(6)
-
-	cmpdi   12, 16
-	blt     Final_block_dec
-
-Next_rem_block_dec:
-	lxvb16x 15, 0, 14		# load block
-
-	Loop_aes_middle_1x
-
-	xxlor	23+32, 10, 10
+	LOOP_8AES_STATE			# process 8 AES keys
+	mtctr	22			# AES key loop
+	addi	10, 6, 144
+__LastLoop_aes_state:
+	lxv	32+1, 0(10)		# round key
+	AES_CIPHER_8x vcipher 15 1
+	addi	10, 10, 16
+	bdnz	__LastLoop_aes_state
+	lxv	32+1, 0(10)		# last round key (v1)
 
-	cmpdi	10, 10
-	beq	Do_next_1x_dec
+	addi	12, 12, -1
+	cmpdi	12, 0
+	bne	__Loop_8x_block_enc
+
+__Finish_ghash:
+	vcipherlast     15, 15, 1
+	vcipherlast     16, 16, 1
+	vcipherlast     17, 17, 1
+	vcipherlast     18, 18, 1
+	vcipherlast     19, 19, 1
+	vcipherlast     20, 20, 1
+	vcipherlast     21, 21, 1
+	vcipherlast     22, 22, 1
+
+	lxvb16x	32+23, 0, 14	# load block
+	lxvb16x	32+24, 15, 14	# load block
+	lxvb16x	32+25, 16, 14	# load block
+	lxvb16x	32+26, 17, 14	# load block
+	lxvb16x	32+27, 18, 14	# load block
+	lxvb16x	32+28, 19, 14	# load block
+	lxvb16x	32+29, 20, 14	# load block
+	lxvb16x	32+30, 21, 14	# load block
+	addi	14, 14, 128
+
+	vxor	15, 15, 23
+	vxor	16, 16, 24
+	vxor	17, 17, 25
+	vxor	18, 18, 26
+	vxor	19, 19, 27
+	vxor	20, 20, 28
+	vxor	21, 21, 29
+	vxor	22, 22, 30
+
+	stxvb16x 47, 0, 9	# store output
+	stxvb16x 48, 15, 9	# store output
+	stxvb16x 49, 16, 9	# store output
+	stxvb16x 50, 17, 9	# store output
+	stxvb16x 51, 18, 9	# store output
+	stxvb16x 52, 19, 9	# store output
+	stxvb16x 53, 20, 9	# store output
+	stxvb16x 54, 21, 9	# store output
+	addi	9, 9, 128
+
+	vxor	15, 15, 0
+	PPC_GHASH4x 0, 15, 16, 17, 18
+
+	vxor	19, 19, 0
+	PPC_GHASH4x 0, 19, 20, 21, 22
+
+	xxlor	30+32, 9, 9		# last ctr
+	vadduwm	30, 30, 31		# increase ctr
+	stxvb16x 32+30, 0, 7		# update IV
+	stxvb16x 32+0, 0, 8		# update Xi
+
+	addi    5, 5, -128
+	addi    11, 11, 128
 
-	# 192 bits
-	xxlor	24+32, 11, 11
+	#
+	# Done 8x blocks
+	#
 
-	vcipher	15, 15, 23
-	vcipher	15, 15, 24
+	cmpdi   5, 0
+	beq     aes_gcm_out
 
-	xxlor	23+32, 12, 12
+__Process_more_enc:
+	li	24, 1			# encrypt
+	bl	aes_gcm_crypt_1x
+	cmpdi   5, 0
+	beq     aes_gcm_out
 
-	cmpdi	10, 12
-	beq	Do_next_1x_dec
+	bl	__Process_partial
+	cmpdi   5, 0
+	beq     aes_gcm_out
+__Do_combine_enc:
+	bl	__Combine_partial
+	cmpdi	5, 0
+	bgt	__Process_encrypt
+	b	aes_gcm_out
 
-	# 256 bits
-	xxlor	24+32, 13, 13
+SYM_FUNC_END(aes_p10_gcm_encrypt)
 
-	vcipher	15, 15, 23
-	vcipher	15, 15, 24
+################################################################################
+# aes_p10_gcm_decrypt (const void *inp, void *out, size_t len,
+#               const char *rk, unsigned char iv[16], void *Xip);
+# 8x Decrypt
+#
+################################################################################
+SYM_FUNC_START(aes_p10_gcm_decrypt)
 
-	xxlor	23+32, 14, 14
+	cmpdi	5, 0
+	ble	__Invalid_msg_len
 
-	cmpdi	10, 14
-	beq	Do_next_1x_dec
+	SAVE_REGS
+	LOAD_HASH_TABLE
 
-Do_next_1x_dec:
-	vcipherlast     15, 15, 23
+	# initialize ICB: GHASH( IV ), IV - r7
+	lxvb16x	30+32, 0, 7	# load IV  - v30
 
-	xxlxor		47, 47, 15
-	stxvb16x	47, 0, 9	# store output
-	addi		14, 14, 16
-	addi		9, 9, 16
+	mr	14, 3
+	mr	9, 4
 
-	xxlor           28+32, 15, 15
-	#vmr		28, 15
-	ppc_update_hash_1x
+	# counter 1
+	vxor	31, 31, 31
+	vspltisb 22, 1
+	vsldoi	31, 31, 22,1	# counter 1
 
-	addi		12, 12, -16
-	addi		11, 11, 16
-	xxlor		19+32, 0, 0
-	vaddudm		30, 30, 31		# IV + counter
-	vxor		15, 30, 19		# add round key
+	addis	11, 2, permx@toc@ha
+	addi	11, 11, permx@toc@l
+	lxv	10, 0(11)	# vs10: vpermxor vector
+	li	11, 0
+
+	# load 9 round keys to VSR
+	lxv	0, 0(6)			# round key 0
+	lxv	1, 16(6)		# round key 1
+	lxv	2, 32(6)		# round key 2
+	lxv	3, 48(6)		# round key 3
+	lxv	4, 64(6)		# round key 4
+	lxv	5, 80(6)		# round key 5
+	lxv	6, 96(6)		# round key 6
+	lxv	7, 112(6)		# round key 7
+	lxv	8, 128(6)		# round key 8
 
-	bdnz	Next_rem_block_dec
+	# load rounds - 10 (128), 12 (192), 14 (256)
+	lwz	23, 240(6)		# n rounds
+	li	24, 0			# decrypt
 
-	li	15, 0
-	std	15, 56(7)		# clear partial?
-	stxvb16x 30+32, 0, 7		# update IV
+__Process_decrypt:
+	#
+	# Process different blocks
+	#
+	ld	12, 56(7)
 	cmpdi	12, 0
-	beq	aes_gcm_out
-
-Final_block_dec:
-	lwz	10, 240(6)
-	Loop_aes_middle_1x
-
-	xxlor	23+32, 10, 10
-
-	cmpdi	10, 10
-	beq	Do_final_1x_dec
+	bgt	__Do_combine_dec
+	cmpdi	5, 128
+	blt	__Process_more_dec
+
+#
+# Process 8x AES/GCM blocks
+#
+__Process_8x_dec:
+	# 8x blcoks
+	li	10, 128
+	divdu	12, 5, 10	# n 128 bytes-blocks
 
-	# 192 bits
-	xxlor	24+32, 11, 11
+	addi	12, 12, -1	# loop - 1
 
-	vcipher	15, 15, 23
-	vcipher	15, 15, 24
+	vmr	15, 30		# first state: IV
+	vadduwm	16, 15, 31	# state + counter
+	vadduwm	17, 16, 31
+	vadduwm	18, 17, 31
+	vadduwm	19, 18, 31
+	vadduwm	20, 19, 31
+	vadduwm	21, 20, 31
+	vadduwm	22, 21, 31
+	xxlor	9, 32+22, 32+22	# save last state
 
-	xxlor	23+32, 12, 12
+	# vxor  state, state, w # addroundkey
+	xxlor	32+29, 0, 0
+        vxor    15, 15, 29      # IV + round key - add round key 0
+	vxor	16, 16, 29
+	vxor	17, 17, 29
+	vxor	18, 18, 29
+	vxor	19, 19, 29
+	vxor	20, 20, 29
+	vxor	21, 21, 29
+	vxor	22, 22, 29
 
-	cmpdi	10, 12
-	beq	Do_final_1x_dec
+	li	15, 16
+	li	16, 32
+	li	17, 48
+	li	18, 64
+	li	19, 80
+	li	20, 96
+	li	21, 112
 
-	# 256 bits
-	xxlor	24+32, 13, 13
+	#
+	# Pre-compute first 8 AES state and leave 1/3/5 more rounds
+	# for the loop.
+	#
+	addi	22, 23, -9		# process 8 keys
+	mtctr	22			# AES key loop
+	addi	10, 6, 144
 
-	vcipher	15, 15, 23
-	vcipher	15, 15, 24
+	LOOP_8AES_STATE			# process 8 AES keys
 
-	xxlor	23+32, 14, 14
+__PreLoop_aes_state_dec:
+	lxv	32+1, 0(10)		# round key
+	AES_CIPHER_8x vcipher 15 1
+	addi	10, 10, 16
+	bdnz	__PreLoop_aes_state_dec
+	lxv	32+1, 0(10)		# last round key (v1)
+
+	cmpdi	12, 0			# Only one loop (8 block)
+	beq	__Finish_ghash_dec
+
+#
+# Loop 8x blocks and compute ghash
+#
+__Loop_8x_block_dec:
+	vcipherlast     15, 15, 1
+	vcipherlast     16, 16, 1
+	vcipherlast     17, 17, 1
+	vcipherlast     18, 18, 1
+	vcipherlast     19, 19, 1
+	vcipherlast     20, 20, 1
+	vcipherlast     21, 21, 1
+	vcipherlast     22, 22, 1
+
+	lxvb16x	32+23, 0, 14	# load block
+	lxvb16x	32+24, 15, 14	# load block
+	lxvb16x	32+25, 16, 14	# load block
+	lxvb16x	32+26, 17, 14	# load block
+	lxvb16x	32+27, 18, 14	# load block
+	lxvb16x	32+28, 19, 14	# load block
+	lxvb16x	32+29, 20, 14	# load block
+	lxvb16x	32+30, 21, 14	# load block
+	addi	14, 14, 128
+
+	vxor	15, 15, 23
+	vxor	16, 16, 24
+	vxor	17, 17, 25
+	vxor	18, 18, 26
+	vxor	19, 19, 27
+	vxor	20, 20, 28
+	vxor	21, 21, 29
+	vxor	22, 22, 30
+
+	stxvb16x 47, 0, 9	# store output
+	stxvb16x 48, 15, 9	# store output
+	stxvb16x 49, 16, 9	# store output
+	stxvb16x 50, 17, 9	# store output
+	stxvb16x 51, 18, 9	# store output
+	stxvb16x 52, 19, 9	# store output
+	stxvb16x 53, 20, 9	# store output
+	stxvb16x 54, 21, 9	# store output
+
+	addi	9, 9, 128
+
+	vmr	15, 23
+	vmr	16, 24
+	vmr	17, 25
+	vmr	18, 26
+	vmr	19, 27
+	vmr	20, 28
+	vmr	21, 29
+	vmr	22, 30
 
-	cmpdi	10, 14
-	beq	Do_final_1x_dec
+	# ghash here
+	vxor	15, 15, 0
+	PPC_GHASH4x 0, 15, 16, 17, 18
+
+	vxor	19, 19, 0
+	PPC_GHASH4x 0, 19, 20, 21, 22
+
+	xxlor	32+15, 9, 9		# last state
+	vadduwm 15, 15, 31		# state + counter
+	vadduwm 16, 15, 31
+	vadduwm 17, 16, 31
+	vadduwm 18, 17, 31
+	vadduwm 19, 18, 31
+	vadduwm 20, 19, 31
+	vadduwm 21, 20, 31
+	vadduwm 22, 21, 31
+	xxlor	9, 32+22, 32+22		# save last state
+
+	xxlor	32+27, 0, 0		# restore roundkey 0
+        vxor    15, 15, 27		# IV + round key - add round key 0
+	vxor	16, 16, 27
+	vxor	17, 17, 27
+	vxor	18, 18, 27
+	vxor	19, 19, 27
+	vxor	20, 20, 27
+	vxor	21, 21, 27
+	vxor	22, 22, 27
+
+	addi    5, 5, -128
+	addi    11, 11, 128
 
-Do_final_1x_dec:
-	vcipherlast     15, 15, 23
+	LOOP_8AES_STATE			# process 8 AES keys
+	mtctr	22			# AES key loop
+	addi	10, 6, 144
+__LastLoop_aes_state_dec:
+	lxv	32+1, 0(10)		# round key
+	AES_CIPHER_8x vcipher 15 1
+	addi	10, 10, 16
+	bdnz	__LastLoop_aes_state_dec
+	lxv	32+1, 0(10)		# last round key (v1)
 
-	# check partial block
-	li	21, 1			# decrypt
-	ld	15, 56(7)		# partial?
-	cmpdi	15, 0
-	beq	Normal_block_dec
-	bl	Do_partial_block
+	addi	12, 12, -1
 	cmpdi	12, 0
-	ble aes_gcm_out
-
-	b Continue_partial_check_dec
+	bne	__Loop_8x_block_dec
+
+__Finish_ghash_dec:
+	vcipherlast     15, 15, 1
+	vcipherlast     16, 16, 1
+	vcipherlast     17, 17, 1
+	vcipherlast     18, 18, 1
+	vcipherlast     19, 19, 1
+	vcipherlast     20, 20, 1
+	vcipherlast     21, 21, 1
+	vcipherlast     22, 22, 1
+
+	lxvb16x	32+23, 0, 14	# load block
+	lxvb16x	32+24, 15, 14	# load block
+	lxvb16x	32+25, 16, 14	# load block
+	lxvb16x	32+26, 17, 14	# load block
+	lxvb16x	32+27, 18, 14	# load block
+	lxvb16x	32+28, 19, 14	# load block
+	lxvb16x	32+29, 20, 14	# load block
+	lxvb16x	32+30, 21, 14	# load block
+	addi	14, 14, 128
+
+	vxor	15, 15, 23
+	vxor	16, 16, 24
+	vxor	17, 17, 25
+	vxor	18, 18, 26
+	vxor	19, 19, 27
+	vxor	20, 20, 28
+	vxor	21, 21, 29
+	vxor	22, 22, 30
+
+	stxvb16x 47, 0, 9	# store output
+	stxvb16x 48, 15, 9	# store output
+	stxvb16x 49, 16, 9	# store output
+	stxvb16x 50, 17, 9	# store output
+	stxvb16x 51, 18, 9	# store output
+	stxvb16x 52, 19, 9	# store output
+	stxvb16x 53, 20, 9	# store output
+	stxvb16x 54, 21, 9	# store output
+	addi	9, 9, 128
+
+	#vmr	15, 23
+	vxor	15, 23, 0
+	vmr	16, 24
+	vmr	17, 25
+	vmr	18, 26
+	vmr	19, 27
+	vmr	20, 28
+	vmr	21, 29
+	vmr	22, 30
+
+	#vxor	15, 15, 0
+	PPC_GHASH4x 0, 15, 16, 17, 18
+
+	vxor	19, 19, 0
+	PPC_GHASH4x 0, 19, 20, 21, 22
+
+	xxlor	30+32, 9, 9		# last ctr
+	vadduwm	30, 30, 31		# increase ctr
+	stxvb16x 32+30, 0, 7		# update IV
+	stxvb16x 32+0, 0, 8		# update Xi
+
+	addi    5, 5, -128
+	addi    11, 11, 128
 
-Normal_block_dec:
-	lxvb16x	15, 0, 14		# load last block
-	xxlxor	47, 47, 15
+	#
+	# Done 8x blocks
+	#
 
-	# create partial block mask
-	li	15, 16
-	sub	15, 15, 12		# index to the mask
+	cmpdi   5, 0
+	beq     aes_gcm_out
 
-	vspltisb	16, -1		# first 16 bytes - 0xffff...ff
-	vspltisb	17, 0		# second 16 bytes - 0x0000...00
-	li	10, 192
-	stvx	16, 10, 1
-	addi	10, 10, 16
-	stvx	17, 10, 1
+__Process_more_dec:
+	li	24, 0			# decrypt
+	bl	aes_gcm_crypt_1x
+	cmpdi   5, 0
+	beq     aes_gcm_out
 
-	addi	10, 1, 192
-	lxvb16x	16, 15, 10		# load partial block mask
-	xxland	47, 47, 16
+	bl	__Process_partial
+	cmpdi   5, 0
+	beq     aes_gcm_out
+__Do_combine_dec:
+	bl	__Combine_partial
+	cmpdi	5, 0
+	bgt	__Process_decrypt
+	b	aes_gcm_out
+SYM_FUNC_END(aes_p10_gcm_decrypt)
 
-	xxland	32+28, 15, 16
-	#vmr	28, 15
-	ppc_update_hash_1x
+SYM_FUNC_START_LOCAL(aes_gcm_out)
 
-	# * should store only the remaining bytes.
-	bl	Write_partial_block
+	mr	3, 11			# return count
 
-	stxvb16x 30+32, 0, 7		# update IV
-	std	12, 56(7)		# update partial?
-	li	16, 16
+	RESTORE_REGS
+	blr
 
-	stxvb16x	32, 0, 8		# write out Xi
-	stxvb16x	32, 16, 8		# write out Xi
-	b aes_gcm_out
+__Invalid_msg_len:
+	li	3, 0
+	blr
+SYM_FUNC_END(aes_gcm_out)
+
+SYM_DATA_START_LOCAL(PERMX)
+.align 4
+# for vector permute and xor
+permx:
+.long 0x4c5d6e7f, 0x08192a3b, 0xc4d5e6f7, 0x8091a2b3
+SYM_DATA_END(permx)
-- 
2.43.0


