Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC5715499
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 06:51:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVg3X310dz3f5K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 14:51:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jdhcX2gd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jdhcX2gd;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVf3c5GXcz3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 14:06:52 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34U3eCXn000827
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 04:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SlT8Z4dL2PHelWPfKGmfGhyl1w+p4VxddWCE2QvXzcU=;
 b=jdhcX2gdLr1JHGniX1D/eBhjuH7X55KQkKRvVoRFeZssvz6V7eXT0bAQs/Py+8LLAn0L
 i2qbtKX0bKmhmI3iQGsaZEZ2roW6gz+AwMU8N4Ii2TW+QopoBPD4bzThBfMmrCV5il8k
 H+l+FijtvU/IAQRDTXmA9pn5/nPzSXRbJ1H98jY4bTUHvQnAkSQSZie75ThlGXbi/TaO
 NXAK01VKUMOuT6tQMA2r2mKuMlHpnoUFUwqmUpqTQsNYzP+Qfa7YOK+xK1+1gX+MvpO2
 FBSS2MOYb2uvrYU74aIPhN6Wcqoo1NcxiE3rtYTjfeRrn2KKPPXGiORPa7BzCm3/Pkmj Mg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qw95v0kyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 04:06:48 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34U3IRei016846
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 04:06:44 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3qu9g6cg68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 04:06:44 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34U46hQo65864082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 04:06:43 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF06B58052
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 04:06:42 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F97A58050
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 04:06:42 +0000 (GMT)
Received: from [9.43.0.192] (unknown [9.43.0.192])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 04:06:41 +0000 (GMT)
Message-ID: <4fba984e-7be9-d7c6-9e55-557f70a42be2@linux.ibm.com>
Date: Tue, 30 May 2023 09:36:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] powerpc/crypto: Fix aes-gcm-p10 link errors
To: linuxppc-dev@lists.ozlabs.org
References: <20230525150501.37081-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Vishal Chourasia <vishalc@linux.ibm.com>
In-Reply-To: <20230525150501.37081-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ashyeEbvsX5NOzaz1dmS1LUlvP8jcIn3
X-Proofpoint-ORIG-GUID: ashyeEbvsX5NOzaz1dmS1LUlvP8jcIn3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_01,2023-05-29_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300032
X-Mailman-Approved-At: Tue, 30 May 2023 14:51:10 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After applying the patch, I was able to successfully build the Linux 
kernel v6.4-rc4.
I encountered no errors during the build process. The issue pertaining 
to multiple
definitions of certain functions appears to be resolved.

λ grep -i CRYPTO_AES_GCM_P10 .config
CONFIG_CRYPTO_AES_GCM_P10=y

λ grep -i CRYPTO_DEV_VMX_ENCRYPT .config
CONFIG_CRYPTO_DEV_VMX_ENCRYPT=y

  + make O=${BUILD_DIR} CC=clang ARCH=powerpc
CROSS_COMPILE=powerpc64le-linux-gnu- -j16 -s vmlinux modules

Thank you for the well-detailed fix.

  -- vishal.c


On 5/25/23 20:35, Michael Ellerman wrote:
> The recently added P10 AES/GCM code added some files containing
> CRYPTOGAMS perl-asm code which are near duplicates of the p8 files
> found in drivers/crypto/vmx.
>
> In particular the newly added files produce functions with identical
> names to the existing code.
>
> When the kernel is built with CONFIG_CRYPTO_AES_GCM_P10=y and
> CONFIG_CRYPTO_DEV_VMX_ENCRYPT=y that leads to link errors, eg:
>
>    ld: drivers/crypto/vmx/aesp8-ppc.o: in function `aes_p8_set_encrypt_key':
>    (.text+0xa0): multiple definition of `aes_p8_set_encrypt_key'; arch/powerpc/crypto/aesp8-ppc.o:(.text+0xa0): first defined here
>    ...
>    ld: drivers/crypto/vmx/ghashp8-ppc.o: in function `gcm_ghash_p8':
>    (.text+0x140): multiple definition of `gcm_ghash_p8'; arch/powerpc/crypto/ghashp8-ppc.o:(.text+0x2e4): first defined here
>
> Fix it for now by renaming the newly added files and functions to use
> "p10" instead of "p8" in the names.
>
> Fixes: 45a4672b9a6e ("crypto: p10-aes-gcm - Update Kconfig and Makefile")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/crypto/Makefile                   | 10 +++++-----
>   arch/powerpc/crypto/aes-gcm-p10-glue.c         | 18 +++++++++---------
>   .../crypto/{aesp8-ppc.pl => aesp10-ppc.pl}     |  2 +-
>   .../crypto/{ghashp8-ppc.pl => ghashp10-ppc.pl} | 12 ++++++------
>   4 files changed, 21 insertions(+), 21 deletions(-)
>   rename arch/powerpc/crypto/{aesp8-ppc.pl => aesp10-ppc.pl} (99%)
>   rename arch/powerpc/crypto/{ghashp8-ppc.pl => ghashp10-ppc.pl} (97%)
>
> diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
> index 05c7486f42c5..7b4f516abec1 100644
> --- a/arch/powerpc/crypto/Makefile
> +++ b/arch/powerpc/crypto/Makefile
> @@ -22,15 +22,15 @@ sha1-ppc-spe-y := sha1-spe-asm.o sha1-spe-glue.o
>   sha256-ppc-spe-y := sha256-spe-asm.o sha256-spe-glue.o
>   crc32c-vpmsum-y := crc32c-vpmsum_asm.o crc32c-vpmsum_glue.o
>   crct10dif-vpmsum-y := crct10dif-vpmsum_asm.o crct10dif-vpmsum_glue.o
> -aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp8-ppc.o aesp8-ppc.o
> +aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
>   
>   quiet_cmd_perl = PERL    $@
>         cmd_perl = $(PERL) $< $(if $(CONFIG_CPU_LITTLE_ENDIAN), linux-ppc64le, linux-ppc64) > $@
>   
> -targets += aesp8-ppc.S ghashp8-ppc.S
> +targets += aesp10-ppc.S ghashp10-ppc.S
>   
> -$(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
> +$(obj)/aesp10-ppc.S $(obj)/ghashp10-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
>   	$(call if_changed,perl)
>   
> -OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
> -OBJECT_FILES_NON_STANDARD_ghashp8-ppc.o := y
> +OBJECT_FILES_NON_STANDARD_aesp10-ppc.o := y
> +OBJECT_FILES_NON_STANDARD_ghashp10-ppc.o := y
> diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> index bd3475f5348d..4b6e899895e7 100644
> --- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
> +++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
> @@ -30,15 +30,15 @@ MODULE_AUTHOR("Danny Tsen <dtsen@linux.ibm.com");
>   MODULE_LICENSE("GPL v2");
>   MODULE_ALIAS_CRYPTO("aes");
>   
> -asmlinkage int aes_p8_set_encrypt_key(const u8 *userKey, const int bits,
> +asmlinkage int aes_p10_set_encrypt_key(const u8 *userKey, const int bits,
>   				      void *key);
> -asmlinkage void aes_p8_encrypt(const u8 *in, u8 *out, const void *key);
> +asmlinkage void aes_p10_encrypt(const u8 *in, u8 *out, const void *key);
>   asmlinkage void aes_p10_gcm_encrypt(u8 *in, u8 *out, size_t len,
>   				    void *rkey, u8 *iv, void *Xi);
>   asmlinkage void aes_p10_gcm_decrypt(u8 *in, u8 *out, size_t len,
>   				    void *rkey, u8 *iv, void *Xi);
>   asmlinkage void gcm_init_htable(unsigned char htable[256], unsigned char Xi[16]);
> -asmlinkage void gcm_ghash_p8(unsigned char *Xi, unsigned char *Htable,
> +asmlinkage void gcm_ghash_p10(unsigned char *Xi, unsigned char *Htable,
>   		unsigned char *aad, unsigned int alen);
>   
>   struct aes_key {
> @@ -93,7 +93,7 @@ static void set_aad(struct gcm_ctx *gctx, struct Hash_ctx *hash,
>   	gctx->aadLen = alen;
>   	i = alen & ~0xf;
>   	if (i) {
> -		gcm_ghash_p8(nXi, hash->Htable+32, aad, i);
> +		gcm_ghash_p10(nXi, hash->Htable+32, aad, i);
>   		aad += i;
>   		alen -= i;
>   	}
> @@ -102,7 +102,7 @@ static void set_aad(struct gcm_ctx *gctx, struct Hash_ctx *hash,
>   			nXi[i] ^= aad[i];
>   
>   		memset(gctx->aad_hash, 0, 16);
> -		gcm_ghash_p8(gctx->aad_hash, hash->Htable+32, nXi, 16);
> +		gcm_ghash_p10(gctx->aad_hash, hash->Htable+32, nXi, 16);
>   	} else {
>   		memcpy(gctx->aad_hash, nXi, 16);
>   	}
> @@ -115,7 +115,7 @@ static void gcmp10_init(struct gcm_ctx *gctx, u8 *iv, unsigned char *rdkey,
>   {
>   	__be32 counter = cpu_to_be32(1);
>   
> -	aes_p8_encrypt(hash->H, hash->H, rdkey);
> +	aes_p10_encrypt(hash->H, hash->H, rdkey);
>   	set_subkey(hash->H);
>   	gcm_init_htable(hash->Htable+32, hash->H);
>   
> @@ -126,7 +126,7 @@ static void gcmp10_init(struct gcm_ctx *gctx, u8 *iv, unsigned char *rdkey,
>   	/*
>   	 * Encrypt counter vector as iv tag and increment counter.
>   	 */
> -	aes_p8_encrypt(iv, gctx->ivtag, rdkey);
> +	aes_p10_encrypt(iv, gctx->ivtag, rdkey);
>   
>   	counter = cpu_to_be32(2);
>   	*((__be32 *)(iv+12)) = counter;
> @@ -160,7 +160,7 @@ static void finish_tag(struct gcm_ctx *gctx, struct Hash_ctx *hash, int len)
>   	/*
>   	 * hash (AAD len and len)
>   	 */
> -	gcm_ghash_p8(hash->Htable, hash->Htable+32, aclen, 16);
> +	gcm_ghash_p10(hash->Htable, hash->Htable+32, aclen, 16);
>   
>   	for (i = 0; i < 16; i++)
>   		hash->Htable[i] ^= gctx->ivtag[i];
> @@ -192,7 +192,7 @@ static int p10_aes_gcm_setkey(struct crypto_aead *aead, const u8 *key,
>   	int ret;
>   
>   	vsx_begin();
> -	ret = aes_p8_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
> +	ret = aes_p10_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
>   	vsx_end();
>   
>   	return ret ? -EINVAL : 0;
> diff --git a/arch/powerpc/crypto/aesp8-ppc.pl b/arch/powerpc/crypto/aesp10-ppc.pl
> similarity index 99%
> rename from arch/powerpc/crypto/aesp8-ppc.pl
> rename to arch/powerpc/crypto/aesp10-ppc.pl
> index 1f22aec27d79..2c06ce2a2c7c 100644
> --- a/arch/powerpc/crypto/aesp8-ppc.pl
> +++ b/arch/powerpc/crypto/aesp10-ppc.pl
> @@ -110,7 +110,7 @@ die "can't locate ppc-xlate.pl";
>   open STDOUT,"| $^X $xlate $flavour ".shift || die "can't call $xlate: $!";
>   
>   $FRAME=8*$SIZE_T;
> -$prefix="aes_p8";
> +$prefix="aes_p10";
>   
>   $sp="r1";
>   $vrsave="r12";
> diff --git a/arch/powerpc/crypto/ghashp8-ppc.pl b/arch/powerpc/crypto/ghashp10-ppc.pl
> similarity index 97%
> rename from arch/powerpc/crypto/ghashp8-ppc.pl
> rename to arch/powerpc/crypto/ghashp10-ppc.pl
> index b56603b4a893..27a6b0bec645 100644
> --- a/arch/powerpc/crypto/ghashp8-ppc.pl
> +++ b/arch/powerpc/crypto/ghashp10-ppc.pl
> @@ -64,7 +64,7 @@ $code=<<___;
>   
>   .text
>   
> -.globl	.gcm_init_p8
> +.globl	.gcm_init_p10
>   	lis		r0,0xfff0
>   	li		r8,0x10
>   	mfspr		$vrsave,256
> @@ -110,7 +110,7 @@ $code=<<___;
>   	.long		0
>   	.byte		0,12,0x14,0,0,0,2,0
>   	.long		0
> -.size	.gcm_init_p8,.-.gcm_init_p8
> +.size	.gcm_init_p10,.-.gcm_init_p10
>   
>   .globl	.gcm_init_htable
>   	lis		r0,0xfff0
> @@ -237,7 +237,7 @@ $code=<<___;
>   	.long		0
>   .size	.gcm_init_htable,.-.gcm_init_htable
>   
> -.globl	.gcm_gmult_p8
> +.globl	.gcm_gmult_p10
>   	lis		r0,0xfff8
>   	li		r8,0x10
>   	mfspr		$vrsave,256
> @@ -283,9 +283,9 @@ $code=<<___;
>   	.long		0
>   	.byte		0,12,0x14,0,0,0,2,0
>   	.long		0
> -.size	.gcm_gmult_p8,.-.gcm_gmult_p8
> +.size	.gcm_gmult_p10,.-.gcm_gmult_p10
>   
> -.globl	.gcm_ghash_p8
> +.globl	.gcm_ghash_p10
>   	lis		r0,0xfff8
>   	li		r8,0x10
>   	mfspr		$vrsave,256
> @@ -350,7 +350,7 @@ Loop:
>   	.long		0
>   	.byte		0,12,0x14,0,0,0,4,0
>   	.long		0
> -.size	.gcm_ghash_p8,.-.gcm_ghash_p8
> +.size	.gcm_ghash_p10,.-.gcm_ghash_p10
>   
>   .asciz  "GHASH for PowerISA 2.07, CRYPTOGAMS by <appro\@openssl.org>"
>   .align  2
