Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC31E710F0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 17:05:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRrwL6Bbtz3fGq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 01:05:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IP2WmgdY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRrvS4fSQz3f6n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 01:05:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IP2WmgdY;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRrvS1jJGz4x1f;
	Fri, 26 May 2023 01:05:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685027108;
	bh=Yugt0W+VFVSDPC+o3CYwVw2DfSd+n8rBxVNHF+lq1eo=;
	h=From:To:Cc:Subject:Date:From;
	b=IP2WmgdYEsJaxOGjd+WY/2m+kiF+VFtHHyYl785Ogv6pG3rfItfGyJItf7DCS5Vb7
	 l1ajWzTBnts1zCoZHxMm3cvghBe38tA2o0+YWUTTRr6/RWTUiP8Av1rB2sbYi1H6j2
	 N4uibh71gjEH21QQ2BzWSsRSTR8cVq7hd+r0pZn+eqIAh1J3Bvf2ylyUPJpMomjwhH
	 SVke2q6llN0A327y0XjVe3BYQ1uRrWVCK8zY5zmoUXppjcer54It6q98itOPZOI+C2
	 mW635uH2aEs0dMzmSAy05KL3o+ZW7nBW+RYrGXy37/H5O3JQgc8oiFJJ+c4yXK1XyI
	 RePJ30bbxBqyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/crypto: Fix aes-gcm-p10 link errors
Date: Fri, 26 May 2023 01:05:01 +1000
Message-Id: <20230525150501.37081-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
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
Cc: dtsen@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recently added P10 AES/GCM code added some files containing
CRYPTOGAMS perl-asm code which are near duplicates of the p8 files
found in drivers/crypto/vmx.

In particular the newly added files produce functions with identical
names to the existing code.

When the kernel is built with CONFIG_CRYPTO_AES_GCM_P10=y and
CONFIG_CRYPTO_DEV_VMX_ENCRYPT=y that leads to link errors, eg:

  ld: drivers/crypto/vmx/aesp8-ppc.o: in function `aes_p8_set_encrypt_key':
  (.text+0xa0): multiple definition of `aes_p8_set_encrypt_key'; arch/powerpc/crypto/aesp8-ppc.o:(.text+0xa0): first defined here
  ...
  ld: drivers/crypto/vmx/ghashp8-ppc.o: in function `gcm_ghash_p8':
  (.text+0x140): multiple definition of `gcm_ghash_p8'; arch/powerpc/crypto/ghashp8-ppc.o:(.text+0x2e4): first defined here

Fix it for now by renaming the newly added files and functions to use
"p10" instead of "p8" in the names.

Fixes: 45a4672b9a6e ("crypto: p10-aes-gcm - Update Kconfig and Makefile")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/crypto/Makefile                   | 10 +++++-----
 arch/powerpc/crypto/aes-gcm-p10-glue.c         | 18 +++++++++---------
 .../crypto/{aesp8-ppc.pl => aesp10-ppc.pl}     |  2 +-
 .../crypto/{ghashp8-ppc.pl => ghashp10-ppc.pl} | 12 ++++++------
 4 files changed, 21 insertions(+), 21 deletions(-)
 rename arch/powerpc/crypto/{aesp8-ppc.pl => aesp10-ppc.pl} (99%)
 rename arch/powerpc/crypto/{ghashp8-ppc.pl => ghashp10-ppc.pl} (97%)

diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 05c7486f42c5..7b4f516abec1 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -22,15 +22,15 @@ sha1-ppc-spe-y := sha1-spe-asm.o sha1-spe-glue.o
 sha256-ppc-spe-y := sha256-spe-asm.o sha256-spe-glue.o
 crc32c-vpmsum-y := crc32c-vpmsum_asm.o crc32c-vpmsum_glue.o
 crct10dif-vpmsum-y := crct10dif-vpmsum_asm.o crct10dif-vpmsum_glue.o
-aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp8-ppc.o aesp8-ppc.o
+aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 
 quiet_cmd_perl = PERL    $@
       cmd_perl = $(PERL) $< $(if $(CONFIG_CPU_LITTLE_ENDIAN), linux-ppc64le, linux-ppc64) > $@
 
-targets += aesp8-ppc.S ghashp8-ppc.S
+targets += aesp10-ppc.S ghashp10-ppc.S
 
-$(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
+$(obj)/aesp10-ppc.S $(obj)/ghashp10-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
 	$(call if_changed,perl)
 
-OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
-OBJECT_FILES_NON_STANDARD_ghashp8-ppc.o := y
+OBJECT_FILES_NON_STANDARD_aesp10-ppc.o := y
+OBJECT_FILES_NON_STANDARD_ghashp10-ppc.o := y
diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index bd3475f5348d..4b6e899895e7 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -30,15 +30,15 @@ MODULE_AUTHOR("Danny Tsen <dtsen@linux.ibm.com");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_CRYPTO("aes");
 
-asmlinkage int aes_p8_set_encrypt_key(const u8 *userKey, const int bits,
+asmlinkage int aes_p10_set_encrypt_key(const u8 *userKey, const int bits,
 				      void *key);
-asmlinkage void aes_p8_encrypt(const u8 *in, u8 *out, const void *key);
+asmlinkage void aes_p10_encrypt(const u8 *in, u8 *out, const void *key);
 asmlinkage void aes_p10_gcm_encrypt(u8 *in, u8 *out, size_t len,
 				    void *rkey, u8 *iv, void *Xi);
 asmlinkage void aes_p10_gcm_decrypt(u8 *in, u8 *out, size_t len,
 				    void *rkey, u8 *iv, void *Xi);
 asmlinkage void gcm_init_htable(unsigned char htable[256], unsigned char Xi[16]);
-asmlinkage void gcm_ghash_p8(unsigned char *Xi, unsigned char *Htable,
+asmlinkage void gcm_ghash_p10(unsigned char *Xi, unsigned char *Htable,
 		unsigned char *aad, unsigned int alen);
 
 struct aes_key {
@@ -93,7 +93,7 @@ static void set_aad(struct gcm_ctx *gctx, struct Hash_ctx *hash,
 	gctx->aadLen = alen;
 	i = alen & ~0xf;
 	if (i) {
-		gcm_ghash_p8(nXi, hash->Htable+32, aad, i);
+		gcm_ghash_p10(nXi, hash->Htable+32, aad, i);
 		aad += i;
 		alen -= i;
 	}
@@ -102,7 +102,7 @@ static void set_aad(struct gcm_ctx *gctx, struct Hash_ctx *hash,
 			nXi[i] ^= aad[i];
 
 		memset(gctx->aad_hash, 0, 16);
-		gcm_ghash_p8(gctx->aad_hash, hash->Htable+32, nXi, 16);
+		gcm_ghash_p10(gctx->aad_hash, hash->Htable+32, nXi, 16);
 	} else {
 		memcpy(gctx->aad_hash, nXi, 16);
 	}
@@ -115,7 +115,7 @@ static void gcmp10_init(struct gcm_ctx *gctx, u8 *iv, unsigned char *rdkey,
 {
 	__be32 counter = cpu_to_be32(1);
 
-	aes_p8_encrypt(hash->H, hash->H, rdkey);
+	aes_p10_encrypt(hash->H, hash->H, rdkey);
 	set_subkey(hash->H);
 	gcm_init_htable(hash->Htable+32, hash->H);
 
@@ -126,7 +126,7 @@ static void gcmp10_init(struct gcm_ctx *gctx, u8 *iv, unsigned char *rdkey,
 	/*
 	 * Encrypt counter vector as iv tag and increment counter.
 	 */
-	aes_p8_encrypt(iv, gctx->ivtag, rdkey);
+	aes_p10_encrypt(iv, gctx->ivtag, rdkey);
 
 	counter = cpu_to_be32(2);
 	*((__be32 *)(iv+12)) = counter;
@@ -160,7 +160,7 @@ static void finish_tag(struct gcm_ctx *gctx, struct Hash_ctx *hash, int len)
 	/*
 	 * hash (AAD len and len)
 	 */
-	gcm_ghash_p8(hash->Htable, hash->Htable+32, aclen, 16);
+	gcm_ghash_p10(hash->Htable, hash->Htable+32, aclen, 16);
 
 	for (i = 0; i < 16; i++)
 		hash->Htable[i] ^= gctx->ivtag[i];
@@ -192,7 +192,7 @@ static int p10_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 	int ret;
 
 	vsx_begin();
-	ret = aes_p8_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
+	ret = aes_p10_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
 	vsx_end();
 
 	return ret ? -EINVAL : 0;
diff --git a/arch/powerpc/crypto/aesp8-ppc.pl b/arch/powerpc/crypto/aesp10-ppc.pl
similarity index 99%
rename from arch/powerpc/crypto/aesp8-ppc.pl
rename to arch/powerpc/crypto/aesp10-ppc.pl
index 1f22aec27d79..2c06ce2a2c7c 100644
--- a/arch/powerpc/crypto/aesp8-ppc.pl
+++ b/arch/powerpc/crypto/aesp10-ppc.pl
@@ -110,7 +110,7 @@ die "can't locate ppc-xlate.pl";
 open STDOUT,"| $^X $xlate $flavour ".shift || die "can't call $xlate: $!";
 
 $FRAME=8*$SIZE_T;
-$prefix="aes_p8";
+$prefix="aes_p10";
 
 $sp="r1";
 $vrsave="r12";
diff --git a/arch/powerpc/crypto/ghashp8-ppc.pl b/arch/powerpc/crypto/ghashp10-ppc.pl
similarity index 97%
rename from arch/powerpc/crypto/ghashp8-ppc.pl
rename to arch/powerpc/crypto/ghashp10-ppc.pl
index b56603b4a893..27a6b0bec645 100644
--- a/arch/powerpc/crypto/ghashp8-ppc.pl
+++ b/arch/powerpc/crypto/ghashp10-ppc.pl
@@ -64,7 +64,7 @@ $code=<<___;
 
 .text
 
-.globl	.gcm_init_p8
+.globl	.gcm_init_p10
 	lis		r0,0xfff0
 	li		r8,0x10
 	mfspr		$vrsave,256
@@ -110,7 +110,7 @@ $code=<<___;
 	.long		0
 	.byte		0,12,0x14,0,0,0,2,0
 	.long		0
-.size	.gcm_init_p8,.-.gcm_init_p8
+.size	.gcm_init_p10,.-.gcm_init_p10
 
 .globl	.gcm_init_htable
 	lis		r0,0xfff0
@@ -237,7 +237,7 @@ $code=<<___;
 	.long		0
 .size	.gcm_init_htable,.-.gcm_init_htable
 
-.globl	.gcm_gmult_p8
+.globl	.gcm_gmult_p10
 	lis		r0,0xfff8
 	li		r8,0x10
 	mfspr		$vrsave,256
@@ -283,9 +283,9 @@ $code=<<___;
 	.long		0
 	.byte		0,12,0x14,0,0,0,2,0
 	.long		0
-.size	.gcm_gmult_p8,.-.gcm_gmult_p8
+.size	.gcm_gmult_p10,.-.gcm_gmult_p10
 
-.globl	.gcm_ghash_p8
+.globl	.gcm_ghash_p10
 	lis		r0,0xfff8
 	li		r8,0x10
 	mfspr		$vrsave,256
@@ -350,7 +350,7 @@ Loop:
 	.long		0
 	.byte		0,12,0x14,0,0,0,4,0
 	.long		0
-.size	.gcm_ghash_p8,.-.gcm_ghash_p8
+.size	.gcm_ghash_p10,.-.gcm_ghash_p10
 
 .asciz  "GHASH for PowerISA 2.07, CRYPTOGAMS by <appro\@openssl.org>"
 .align  2
-- 
2.40.1

