Return-Path: <linuxppc-dev+bounces-15211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5BCCF1DF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2YQ2VGcz2yqF;
	Mon, 05 Jan 2026 16:15:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590106;
	cv=none; b=KjYqCY1sg6IObtbk3QC/39cRZQWU85xsZszpePCcscQqESEGiwTh4fB0vZATAFqA+BPueFLjl48bsuWFXTGHAPuyzBTGXn2IF62i2iocw7RbmgLvEO5x1ZKExENU7LAzkeiNJWh4aO5/C6gnyZ9CfFPV9KYBk9CpWBntQ6aRHMU505a+2jQfWohZ2mpIPtxVw9SmgX4GusA9VZ7A+Lxo7viCWwROtpFk6ZLMANn70blwJem4iX8tgzaWw3dou2lKUdLFakCnXmEN9YI490AkBSsVXpOpdpD8JUGBINI2aPp7OhC0UpzkaMJFi6NV3LfiqczIvA7wbYkC3I+frNHjYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590106; c=relaxed/relaxed;
	bh=cu/OYem5JfBfUKKlqH54nv7PEAeXYvWGR7DSoN01Sic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ui4alIvzCSGzIM4QhX3riU1jmLhkb0EnQ0Ww1MvG5/K5osw6N5o3RRZr3MCSgOxWzLmEDkP0VeYX3IPdrjD2OoRaDpSqdXgKwrnWIWQYsFp45W96hYNo92+jpeFWLInSRNx2XCaaHUMmIUXpmbaQ5y71ls/1sLD559lLyRmtGOLppSCvtxiKN31OHfOXpQFONjvy7TxXmoNy5eHP9F1DQXpMfn1FZm8OAIsyc9sSsV+Fb2i2oZxXkYEbf7fuie3mbE/UtQctCA5YT69/oKRgyVM+5C3ruJ0QFSN5fJsB1PigmguyaG89q2t6hEAViguLn8gbI44THra9jxMWcRTGfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d1CIbrQy; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d1CIbrQy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2YJ4jKVz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 768A14430E;
	Mon,  5 Jan 2026 05:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68A6C4AF0F;
	Mon,  5 Jan 2026 05:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590098;
	bh=6o3GJgNO3+qhDeZcBcOFMC7mOIMcNsXDI5dORGkm4b8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d1CIbrQyE+09yYQYpmoUoYrRIuPsxLgFqB9fe79FMlgPMcy6I4ddG+GBVc1FgHx/R
	 hWMxCxgnP3J/TqJ8gUECjXS1u9P7eT4lqFHUaxZDl9yArB8qGWfBGYRi9sRCRIH6Jd
	 mpQxJRZvG46ly9iK9/KlMDvJI/u0hIXUCIGaP2pKlAezF/Bi9jQ89RpN2CN5cPom1M
	 8De8z8ZomaCaFAMGBMx/eQu+l7fGLGULuLKf3lIjys/08dvSIDVifZxUUvuU8xGOrn
	 D8jA4vHyCuLWPGfp5vylvssw1JATSfW5oRWThnGyzcfYNBzW+bpxkPCJmNBiImaPRB
	 XpcY5IoBNJZEQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 13/36] lib/crypto: powerpc/aes: Migrate POWER8 optimized code into library
Date: Sun,  4 Jan 2026 21:12:46 -0800
Message-ID: <20260105051311.1607207-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move the POWER8 AES assembly code into lib/crypto/, wire the key
expansion and single-block en/decryption functions up to the AES library
API, and remove the superseded "p8_aes" crypto_cipher algorithm.

The result is that both the AES library and crypto_cipher APIs are now
optimized for POWER8, whereas previously only crypto_cipher was (and
optimizations weren't enabled by default, which this commit fixes too).

Note that many of the functions in the POWER8 assembly code are still
used by the AES mode implementations in arch/powerpc/crypto/.  For now,
just export these functions.  These exports will go away once the AES
modes are migrated to the library as well.  (Trying to split up the
assembly file seemed like much more trouble than it would be worth.)

Another challenge with this code is that the POWER8 assembly code uses a
custom format for the expanded AES key.  Since that code is imported
from OpenSSL and is also targeted to POWER8 (rather than POWER9 which
has better data movement and byteswap instructions), that is not easily
changed.  For now I've just kept the custom format.  To maintain full
correctness, this requires executing some slow fallback code in the case
where the usability of VSX changes between key expansion and use.  This
should be tolerable, as this case shouldn't happen in practice.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/powerpc/crypto/Makefile                  |   7 +-
 arch/powerpc/crypto/aes.c                     | 134 --------------
 arch/powerpc/crypto/aesp8-ppc.h               |  23 ---
 arch/powerpc/crypto/vmx.c                     |  10 +-
 include/crypto/aes.h                          |  41 +++++
 lib/crypto/Kconfig                            |   2 +-
 lib/crypto/Makefile                           |  14 +-
 lib/crypto/powerpc/.gitignore                 |   2 +
 lib/crypto/powerpc/aes.h                      | 164 ++++++++++++++++++
 .../crypto/powerpc}/aesp8-ppc.pl              |   1 +
 10 files changed, 226 insertions(+), 172 deletions(-)
 delete mode 100644 arch/powerpc/crypto/aes.c
 create mode 100644 lib/crypto/powerpc/.gitignore
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/aesp8-ppc.pl (99%)

diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index e22310da86b5..3ac0886282a2 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -9,11 +9,11 @@ obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 
 aes-ppc-spe-y := aes-spe-glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
-vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
+vmx-crypto-objs := vmx.o ghashp8-ppc.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
 else
 ifdef CONFIG_PPC64_ELF_ABI_V2
@@ -24,17 +24,16 @@ endif
 endif
 
 quiet_cmd_perl = PERL    $@
       cmd_perl = $(PERL) $< $(flavour) > $@
 
-targets += aesp10-ppc.S ghashp10-ppc.S aesp8-ppc.S ghashp8-ppc.S
+targets += aesp10-ppc.S ghashp10-ppc.S ghashp8-ppc.S
 
 $(obj)/aesp10-ppc.S $(obj)/ghashp10-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
 	$(call if_changed,perl)
 
-$(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
+$(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
 	$(call if_changed,perl)
 
 OBJECT_FILES_NON_STANDARD_aesp10-ppc.o := y
 OBJECT_FILES_NON_STANDARD_ghashp10-ppc.o := y
-OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
 OBJECT_FILES_NON_STANDARD_ghashp8-ppc.o := y
diff --git a/arch/powerpc/crypto/aes.c b/arch/powerpc/crypto/aes.c
deleted file mode 100644
index b7192ee719fc..000000000000
--- a/arch/powerpc/crypto/aes.c
+++ /dev/null
@@ -1,134 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * AES routines supporting VMX instructions on the Power 8
- *
- * Copyright (C) 2015 International Business Machines Inc.
- *
- * Author: Marcelo Henrique Cerri <mhcerri@br.ibm.com>
- */
-
-#include <asm/simd.h>
-#include <asm/switch_to.h>
-#include <crypto/aes.h>
-#include <crypto/internal/cipher.h>
-#include <crypto/internal/simd.h>
-#include <linux/err.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/uaccess.h>
-
-#include "aesp8-ppc.h"
-
-struct p8_aes_ctx {
-	struct crypto_cipher *fallback;
-	struct p8_aes_key enc_key;
-	struct p8_aes_key dec_key;
-};
-
-static int p8_aes_init(struct crypto_tfm *tfm)
-{
-	const char *alg = crypto_tfm_alg_name(tfm);
-	struct crypto_cipher *fallback;
-	struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	fallback = crypto_alloc_cipher(alg, 0, CRYPTO_ALG_NEED_FALLBACK);
-	if (IS_ERR(fallback)) {
-		printk(KERN_ERR
-		       "Failed to allocate transformation for '%s': %ld\n",
-		       alg, PTR_ERR(fallback));
-		return PTR_ERR(fallback);
-	}
-
-	crypto_cipher_set_flags(fallback,
-				crypto_cipher_get_flags((struct
-							 crypto_cipher *)
-							tfm));
-	ctx->fallback = fallback;
-
-	return 0;
-}
-
-static void p8_aes_exit(struct crypto_tfm *tfm)
-{
-	struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	if (ctx->fallback) {
-		crypto_free_cipher(ctx->fallback);
-		ctx->fallback = NULL;
-	}
-}
-
-static int p8_aes_setkey(struct crypto_tfm *tfm, const u8 *key,
-			 unsigned int keylen)
-{
-	int ret;
-	struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	preempt_disable();
-	pagefault_disable();
-	enable_kernel_vsx();
-	ret = aes_p8_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
-	ret |= aes_p8_set_decrypt_key(key, keylen * 8, &ctx->dec_key);
-	disable_kernel_vsx();
-	pagefault_enable();
-	preempt_enable();
-
-	ret |= crypto_cipher_setkey(ctx->fallback, key, keylen);
-
-	return ret ? -EINVAL : 0;
-}
-
-static void p8_aes_encrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	if (!crypto_simd_usable()) {
-		crypto_cipher_encrypt_one(ctx->fallback, dst, src);
-	} else {
-		preempt_disable();
-		pagefault_disable();
-		enable_kernel_vsx();
-		aes_p8_encrypt(src, dst, &ctx->enc_key);
-		disable_kernel_vsx();
-		pagefault_enable();
-		preempt_enable();
-	}
-}
-
-static void p8_aes_decrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	if (!crypto_simd_usable()) {
-		crypto_cipher_decrypt_one(ctx->fallback, dst, src);
-	} else {
-		preempt_disable();
-		pagefault_disable();
-		enable_kernel_vsx();
-		aes_p8_decrypt(src, dst, &ctx->dec_key);
-		disable_kernel_vsx();
-		pagefault_enable();
-		preempt_enable();
-	}
-}
-
-struct crypto_alg p8_aes_alg = {
-	.cra_name = "aes",
-	.cra_driver_name = "p8_aes",
-	.cra_module = THIS_MODULE,
-	.cra_priority = 1000,
-	.cra_type = NULL,
-	.cra_flags = CRYPTO_ALG_TYPE_CIPHER | CRYPTO_ALG_NEED_FALLBACK,
-	.cra_alignmask = 0,
-	.cra_blocksize = AES_BLOCK_SIZE,
-	.cra_ctxsize = sizeof(struct p8_aes_ctx),
-	.cra_init = p8_aes_init,
-	.cra_exit = p8_aes_exit,
-	.cra_cipher = {
-		       .cia_min_keysize = AES_MIN_KEY_SIZE,
-		       .cia_max_keysize = AES_MAX_KEY_SIZE,
-		       .cia_setkey = p8_aes_setkey,
-		       .cia_encrypt = p8_aes_encrypt,
-		       .cia_decrypt = p8_aes_decrypt,
-	},
-};
diff --git a/arch/powerpc/crypto/aesp8-ppc.h b/arch/powerpc/crypto/aesp8-ppc.h
index 0bea010128cb..6862c605cc33 100644
--- a/arch/powerpc/crypto/aesp8-ppc.h
+++ b/arch/powerpc/crypto/aesp8-ppc.h
@@ -1,31 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/types.h>
 #include <crypto/aes.h>
 
-struct p8_aes_key {
-	u8 key[AES_MAX_KEYLENGTH];
-	int rounds;
-};
-
 extern struct shash_alg p8_ghash_alg;
-extern struct crypto_alg p8_aes_alg;
 extern struct skcipher_alg p8_aes_cbc_alg;
 extern struct skcipher_alg p8_aes_ctr_alg;
 extern struct skcipher_alg p8_aes_xts_alg;
-
-int aes_p8_set_encrypt_key(const u8 *userKey, const int bits,
-			   struct p8_aes_key *key);
-int aes_p8_set_decrypt_key(const u8 *userKey, const int bits,
-			   struct p8_aes_key *key);
-void aes_p8_encrypt(const u8 *in, u8 *out, const struct p8_aes_key *key);
-void aes_p8_decrypt(const u8 *in, u8 *out, const struct p8_aes_key *key);
-void aes_p8_cbc_encrypt(const u8 *in, u8 *out, size_t len,
-			const struct p8_aes_key *key, u8 *iv, const int enc);
-void aes_p8_ctr32_encrypt_blocks(const u8 *in, u8 *out, size_t len,
-				 const struct p8_aes_key *key, const u8 *iv);
-void aes_p8_xts_encrypt(const u8 *in, u8 *out, size_t len,
-			const struct p8_aes_key *key1,
-			const struct p8_aes_key *key2, u8 *iv);
-void aes_p8_xts_decrypt(const u8 *in, u8 *out, size_t len,
-			const struct p8_aes_key *key1,
-			const struct p8_aes_key *key2, u8 *iv);
diff --git a/arch/powerpc/crypto/vmx.c b/arch/powerpc/crypto/vmx.c
index 0b725e826388..7d2beb774f99 100644
--- a/arch/powerpc/crypto/vmx.c
+++ b/arch/powerpc/crypto/vmx.c
@@ -25,17 +25,13 @@ static int __init p8_init(void)
 
 	ret = crypto_register_shash(&p8_ghash_alg);
 	if (ret)
 		goto err;
 
-	ret = crypto_register_alg(&p8_aes_alg);
-	if (ret)
-		goto err_unregister_ghash;
-
 	ret = crypto_register_skcipher(&p8_aes_cbc_alg);
 	if (ret)
-		goto err_unregister_aes;
+		goto err_unregister_ghash;
 
 	ret = crypto_register_skcipher(&p8_aes_ctr_alg);
 	if (ret)
 		goto err_unregister_aes_cbc;
 
@@ -47,12 +43,10 @@ static int __init p8_init(void)
 
 err_unregister_aes_ctr:
 	crypto_unregister_skcipher(&p8_aes_ctr_alg);
 err_unregister_aes_cbc:
 	crypto_unregister_skcipher(&p8_aes_cbc_alg);
-err_unregister_aes:
-	crypto_unregister_alg(&p8_aes_alg);
 err_unregister_ghash:
 	crypto_unregister_shash(&p8_ghash_alg);
 err:
 	return ret;
 }
@@ -60,11 +54,10 @@ static int __init p8_init(void)
 static void __exit p8_exit(void)
 {
 	crypto_unregister_skcipher(&p8_aes_xts_alg);
 	crypto_unregister_skcipher(&p8_aes_ctr_alg);
 	crypto_unregister_skcipher(&p8_aes_cbc_alg);
-	crypto_unregister_alg(&p8_aes_alg);
 	crypto_unregister_shash(&p8_ghash_alg);
 }
 
 module_cpu_feature_match(PPC_MODULE_FEATURE_VEC_CRYPTO, p8_init);
 module_exit(p8_exit);
@@ -72,6 +65,5 @@ module_exit(p8_exit);
 MODULE_AUTHOR("Marcelo Cerri<mhcerri@br.ibm.com>");
 MODULE_DESCRIPTION("IBM VMX cryptographic acceleration instructions "
 		   "support on Power 8");
 MODULE_LICENSE("GPL");
 MODULE_VERSION("1.0.0");
-MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 49ce2d1e086e..e6082b7c6443 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -16,26 +16,51 @@
 #define AES_KEYSIZE_256		32
 #define AES_BLOCK_SIZE		16
 #define AES_MAX_KEYLENGTH	(15 * 16)
 #define AES_MAX_KEYLENGTH_U32	(AES_MAX_KEYLENGTH / sizeof(u32))
 
+/*
+ * The POWER8 VSX optimized AES assembly code is borrowed from OpenSSL and
+ * inherits OpenSSL's AES_KEY format, which stores the number of rounds after
+ * the round keys.  That assembly code is difficult to change.  So for
+ * compatibility purposes we reserve space for the extra nrounds field on PPC64.
+ *
+ * Note: when prepared for decryption, the round keys are just the reversed
+ * standard round keys, not the round keys for the Equivalent Inverse Cipher.
+ */
+struct p8_aes_key {
+	u32 rndkeys[AES_MAX_KEYLENGTH_U32];
+	int nrounds;
+};
+
 union aes_enckey_arch {
 	u32 rndkeys[AES_MAX_KEYLENGTH_U32];
 #ifdef CONFIG_CRYPTO_LIB_AES_ARCH
 #if defined(CONFIG_PPC) && defined(CONFIG_SPE)
 	/* Used unconditionally (when SPE AES code is enabled in kconfig) */
 	u32 spe_enc_key[AES_MAX_KEYLENGTH_U32] __aligned(8);
+#elif defined(CONFIG_PPC)
+	/*
+	 * Kernels that include the POWER8 VSX optimized AES code use this field
+	 * when that code is usable at key preparation time.  Otherwise they
+	 * fall back to rndkeys.  In the latter case, p8.nrounds (which doesn't
+	 * overlap rndkeys) is set to 0 to differentiate the two formats.
+	 */
+	struct p8_aes_key p8;
 #endif
 #endif /* CONFIG_CRYPTO_LIB_AES_ARCH */
 };
 
 union aes_invkey_arch {
 	u32 inv_rndkeys[AES_MAX_KEYLENGTH_U32];
 #ifdef CONFIG_CRYPTO_LIB_AES_ARCH
 #if defined(CONFIG_PPC) && defined(CONFIG_SPE)
 	/* Used unconditionally (when SPE AES code is enabled in kconfig) */
 	u32 spe_dec_key[AES_MAX_KEYLENGTH_U32] __aligned(8);
+#elif defined(CONFIG_PPC)
+	/* Used conditionally, analogous to aes_enckey_arch::p8 */
+	struct p8_aes_key p8;
 #endif
 #endif /* CONFIG_CRYPTO_LIB_AES_ARCH */
 };
 
 /**
@@ -153,10 +178,26 @@ void ppc_crypt_ctr(u8 *out, const u8 *in, u32 *key_enc, u32 rounds, u32 bytes,
 		   u8 *iv);
 void ppc_encrypt_xts(u8 *out, const u8 *in, u32 *key_enc, u32 rounds, u32 bytes,
 		     u8 *iv, u32 *key_twk);
 void ppc_decrypt_xts(u8 *out, const u8 *in, u32 *key_dec, u32 rounds, u32 bytes,
 		     u8 *iv, u32 *key_twk);
+int aes_p8_set_encrypt_key(const u8 *userKey, const int bits,
+			   struct p8_aes_key *key);
+int aes_p8_set_decrypt_key(const u8 *userKey, const int bits,
+			   struct p8_aes_key *key);
+void aes_p8_encrypt(const u8 *in, u8 *out, const struct p8_aes_key *key);
+void aes_p8_decrypt(const u8 *in, u8 *out, const struct p8_aes_key *key);
+void aes_p8_cbc_encrypt(const u8 *in, u8 *out, size_t len,
+			const struct p8_aes_key *key, u8 *iv, const int enc);
+void aes_p8_ctr32_encrypt_blocks(const u8 *in, u8 *out, size_t len,
+				 const struct p8_aes_key *key, const u8 *iv);
+void aes_p8_xts_encrypt(const u8 *in, u8 *out, size_t len,
+			const struct p8_aes_key *key1,
+			const struct p8_aes_key *key2, u8 *iv);
+void aes_p8_xts_decrypt(const u8 *in, u8 *out, size_t len,
+			const struct p8_aes_key *key1,
+			const struct p8_aes_key *key2, u8 *iv);
 #endif
 
 /**
  * aes_preparekey() - Prepare an AES key for encryption and decryption
  * @key: (output) The key structure to initialize
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 50057f534aec..ddd3fe826b81 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -14,11 +14,11 @@ config CRYPTO_LIB_AES
 config CRYPTO_LIB_AES_ARCH
 	bool
 	depends on CRYPTO_LIB_AES && !UML && !KMSAN
 	default y if ARM
 	default y if ARM64
-	default y if PPC && SPE
+	default y if PPC && (SPE || (PPC64 && VSX))
 
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index d68fde004104..16140616ace8 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -33,11 +33,23 @@ ifeq ($(CONFIG_PPC),y)
 ifeq ($(CONFIG_SPE),y)
 libaes-y += powerpc/aes-spe-core.o \
 	    powerpc/aes-spe-keys.o \
 	    powerpc/aes-spe-modes.o \
 	    powerpc/aes-tab-4k.o
-endif
+else
+libaes-y += powerpc/aesp8-ppc.o
+aes-perlasm-flavour-y := linux-ppc64
+aes-perlasm-flavour-$(CONFIG_PPC64_ELF_ABI_V2) := linux-ppc64-elfv2
+aes-perlasm-flavour-$(CONFIG_CPU_LITTLE_ENDIAN) := linux-ppc64le
+quiet_cmd_perlasm_aes = PERLASM $@
+      cmd_perlasm_aes = $(PERL) $< $(aes-perlasm-flavour-y) $@
+# Use if_changed instead of cmd, in case the flavour changed.
+$(obj)/powerpc/aesp8-ppc.S: $(src)/powerpc/aesp8-ppc.pl FORCE
+	$(call if_changed,perlasm_aes)
+targets += powerpc/aesp8-ppc.S
+OBJECT_FILES_NON_STANDARD_powerpc/aesp8-ppc.o := y
+endif # !CONFIG_SPE
 endif # CONFIG_PPC
 
 endif # CONFIG_CRYPTO_LIB_AES_ARCH
 
 ################################################################################
diff --git a/lib/crypto/powerpc/.gitignore b/lib/crypto/powerpc/.gitignore
new file mode 100644
index 000000000000..598ca7aff6b1
--- /dev/null
+++ b/lib/crypto/powerpc/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+aesp8-ppc.S
diff --git a/lib/crypto/powerpc/aes.h b/lib/crypto/powerpc/aes.h
index cf22020f9050..42e0a993c619 100644
--- a/lib/crypto/powerpc/aes.h
+++ b/lib/crypto/powerpc/aes.h
@@ -1,17 +1,20 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
+ * Copyright (C) 2015 International Business Machines Inc.
  * Copyright 2026 Google LLC
  */
 #include <asm/simd.h>
 #include <asm/switch_to.h>
 #include <linux/cpufeature.h>
 #include <linux/jump_label.h>
 #include <linux/preempt.h>
 #include <linux/uaccess.h>
 
+#ifdef CONFIG_SPE
+
 EXPORT_SYMBOL_GPL(ppc_expand_key_128);
 EXPORT_SYMBOL_GPL(ppc_expand_key_192);
 EXPORT_SYMBOL_GPL(ppc_expand_key_256);
 EXPORT_SYMBOL_GPL(ppc_generate_decrypt_key);
 EXPORT_SYMBOL_GPL(ppc_encrypt_ecb);
@@ -70,5 +73,166 @@ static void aes_decrypt_arch(const struct aes_key *key,
 {
 	spe_begin();
 	ppc_decrypt_aes(out, in, key->inv_k.spe_dec_key, key->nrounds / 2 - 1);
 	spe_end();
 }
+
+#else /* CONFIG_SPE */
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
+
+EXPORT_SYMBOL_GPL(aes_p8_set_encrypt_key);
+EXPORT_SYMBOL_GPL(aes_p8_set_decrypt_key);
+EXPORT_SYMBOL_GPL(aes_p8_encrypt);
+EXPORT_SYMBOL_GPL(aes_p8_decrypt);
+EXPORT_SYMBOL_GPL(aes_p8_cbc_encrypt);
+EXPORT_SYMBOL_GPL(aes_p8_ctr32_encrypt_blocks);
+EXPORT_SYMBOL_GPL(aes_p8_xts_encrypt);
+EXPORT_SYMBOL_GPL(aes_p8_xts_decrypt);
+
+static inline bool is_vsx_format(const struct p8_aes_key *key)
+{
+	return key->nrounds != 0;
+}
+
+/*
+ * Convert a round key from VSX to generic format by reflecting the 16 bytes,
+ * and (if apply_inv_mix=true) applying InvMixColumn to each column.
+ *
+ * It would be nice if the VSX and generic key formats would be compatible.  But
+ * that's very difficult to do, with the assembly code having been borrowed from
+ * OpenSSL and also targeted to POWER8 rather than POWER9.
+ *
+ * Fortunately, this conversion should only be needed in extremely rare cases,
+ * possibly not at all in practice.  It's just included for full correctness.
+ */
+static void rndkey_from_vsx(u32 out[4], const u32 in[4], bool apply_inv_mix)
+{
+	u32 k0 = swab32(in[0]);
+	u32 k1 = swab32(in[1]);
+	u32 k2 = swab32(in[2]);
+	u32 k3 = swab32(in[3]);
+
+	if (apply_inv_mix) {
+		k0 = inv_mix_columns(k0);
+		k1 = inv_mix_columns(k1);
+		k2 = inv_mix_columns(k2);
+		k3 = inv_mix_columns(k3);
+	}
+	out[0] = k3;
+	out[1] = k2;
+	out[2] = k1;
+	out[3] = k0;
+}
+
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	const int keybits = 8 * key_len;
+	int ret;
+
+	if (static_branch_likely(&have_vec_crypto) && likely(may_use_simd())) {
+		preempt_disable();
+		pagefault_disable();
+		enable_kernel_vsx();
+		ret = aes_p8_set_encrypt_key(in_key, keybits, &k->p8);
+		/*
+		 * aes_p8_set_encrypt_key() should never fail here, since the
+		 * key length was already validated.
+		 */
+		WARN_ON_ONCE(ret);
+		if (inv_k) {
+			ret = aes_p8_set_decrypt_key(in_key, keybits,
+						     &inv_k->p8);
+			/* ... and likewise for aes_p8_set_decrypt_key(). */
+			WARN_ON_ONCE(ret);
+		}
+		disable_kernel_vsx();
+		pagefault_enable();
+		preempt_enable();
+	} else {
+		aes_expandkey_generic(k->rndkeys,
+				      inv_k ? inv_k->inv_rndkeys : NULL,
+				      in_key, key_len);
+		/* Mark the key as using the generic format. */
+		k->p8.nrounds = 0;
+		if (inv_k)
+			inv_k->p8.nrounds = 0;
+	}
+}
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (static_branch_likely(&have_vec_crypto) &&
+	    likely(is_vsx_format(&key->k.p8) && may_use_simd())) {
+		preempt_disable();
+		pagefault_disable();
+		enable_kernel_vsx();
+		aes_p8_encrypt(in, out, &key->k.p8);
+		disable_kernel_vsx();
+		pagefault_enable();
+		preempt_enable();
+	} else if (unlikely(is_vsx_format(&key->k.p8))) {
+		/*
+		 * This handles (the hopefully extremely rare) case where a key
+		 * was prepared using the VSX optimized format, then encryption
+		 * is done in a context that cannot use VSX instructions.
+		 */
+		u32 rndkeys[AES_MAX_KEYLENGTH_U32];
+
+		for (int i = 0; i < 4 * (key->nrounds + 1); i += 4)
+			rndkey_from_vsx(&rndkeys[i],
+					&key->k.p8.rndkeys[i], false);
+		aes_encrypt_generic(rndkeys, key->nrounds, out, in);
+	} else {
+		aes_encrypt_generic(key->k.rndkeys, key->nrounds, out, in);
+	}
+}
+
+static void aes_decrypt_arch(const struct aes_key *key, u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (static_branch_likely(&have_vec_crypto) &&
+	    likely(is_vsx_format(&key->inv_k.p8) && may_use_simd())) {
+		preempt_disable();
+		pagefault_disable();
+		enable_kernel_vsx();
+		aes_p8_decrypt(in, out, &key->inv_k.p8);
+		disable_kernel_vsx();
+		pagefault_enable();
+		preempt_enable();
+	} else if (unlikely(is_vsx_format(&key->inv_k.p8))) {
+		/*
+		 * This handles (the hopefully extremely rare) case where a key
+		 * was prepared using the VSX optimized format, then decryption
+		 * is done in a context that cannot use VSX instructions.
+		 */
+		u32 inv_rndkeys[AES_MAX_KEYLENGTH_U32];
+		int i;
+
+		rndkey_from_vsx(&inv_rndkeys[0],
+				&key->inv_k.p8.rndkeys[0], false);
+		for (i = 4; i < 4 * key->nrounds; i += 4) {
+			rndkey_from_vsx(&inv_rndkeys[i],
+					&key->inv_k.p8.rndkeys[i], true);
+		}
+		rndkey_from_vsx(&inv_rndkeys[i],
+				&key->inv_k.p8.rndkeys[i], false);
+		aes_decrypt_generic(inv_rndkeys, key->nrounds, out, in);
+	} else {
+		aes_decrypt_generic(key->inv_k.inv_rndkeys, key->nrounds,
+				    out, in);
+	}
+}
+
+#define aes_mod_init_arch aes_mod_init_arch
+static void aes_mod_init_arch(void)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
+	    (cur_cpu_spec->cpu_user_features2 & PPC_FEATURE2_VEC_CRYPTO))
+		static_branch_enable(&have_vec_crypto);
+}
+
+#endif /* !CONFIG_SPE */
diff --git a/arch/powerpc/crypto/aesp8-ppc.pl b/lib/crypto/powerpc/aesp8-ppc.pl
similarity index 99%
rename from arch/powerpc/crypto/aesp8-ppc.pl
rename to lib/crypto/powerpc/aesp8-ppc.pl
index f729589d792e..253a06758057 100644
--- a/arch/powerpc/crypto/aesp8-ppc.pl
+++ b/lib/crypto/powerpc/aesp8-ppc.pl
@@ -103,10 +103,11 @@ if ($flavour =~ /64/) {
 $LITTLE_ENDIAN = ($flavour=~/le$/) ? $SIZE_T : 0;
 
 $0 =~ m/(.*[\/\\])[^\/\\]+$/; $dir=$1;
 ( $xlate="${dir}ppc-xlate.pl" and -f $xlate ) or
 ( $xlate="${dir}../../perlasm/ppc-xlate.pl" and -f $xlate) or
+( $xlate="${dir}../../../arch/powerpc/crypto/ppc-xlate.pl" and -f $xlate) or
 die "can't locate ppc-xlate.pl";
 
 open STDOUT,"| $^X $xlate $flavour ".shift || die "can't call $xlate: $!";
 
 $FRAME=8*$SIZE_T;
-- 
2.52.0


