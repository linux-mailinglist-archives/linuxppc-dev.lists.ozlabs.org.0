Return-Path: <linuxppc-dev+bounces-2593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD49B0E44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 21:16:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZsvH3RNdz2yN4;
	Sat, 26 Oct 2024 06:15:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729883755;
	cv=none; b=Atr8pZRwHY0PXM+Pi6LlmSlvmzyBaVsPN1GizFDdQ9iqu+1ZV1IMkN9SZ9tGgnumVyL7Ao/o/+HdHAHW2KzzQkCLfsUyz0a+RoZ6kiPNKbssWMKgqJThCVYw9YCZgLcDiiGHmFZ+jogMwVuYKkyklDHBlZFzc886Df65nZ7iD8fTZ6fwg8tJTeQWCkmZUJS0za8oUs4Y3+mVolZ/YuZCoYYvddIA0lSgkRLe+AX4oxx95zaRX2mYsQWzMpSp7dqJLc1pD+Kvl5nVLaHIXLNd2g9xBfryBXwneL9Io9qJCtZ1OlOEnkVdSTrDx5DsAvAdRykNVOqG0t0B3s7HzRqt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729883755; c=relaxed/relaxed;
	bh=E2SCIf2s+9i3pgv0GaKSKhwMU848aHzBLjPg6cJmpO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqF6YyBS59/MtWWMK9nh2zxm+H3PowMlfZUVktHUGU61F+AqOGJnyirTiueQcOFCk778khD51ku7UJxedv2WjzeSSb15yAHZs8zwjHx+c0a71nIUWEB1abETvFirNdR/S8qfPv97/FuSTmEPwlwZwL6y1ZAcxpgkLQlQ7co1P89t4KwjY2el3xdM7V3joZ9Kq3Au6qAZHX/YV3QIVBUU+EacLXK8ejN9fbucqavb2D03LO0xXkBcqh2PSlkfw+igmeAoKxB4SF2N4wqreStxfjJdgE0gP3esQcv0T8JgxEU4lxnIovW44JUbId3ayjHkeSAsPrlAXOnqWPOPb3Ch3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=org7YM15; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=org7YM15;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZsvC1JC3z2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 06:15:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 849C95C5D37;
	Fri, 25 Oct 2024 19:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E98C4CEE4;
	Fri, 25 Oct 2024 19:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729883748;
	bh=BGZLghSvAb2m+jtn0c04NmLEPBfZhFCQo/tDCb7ZInA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=org7YM15SpNa/jS7oSk+5MHxNzixiKZqwKn8dWx0VY2xpe3qlG1HU80q2ZRu+vO/l
	 n5FmJn6ehiVXBNsDDOuQa3pUDPqA4SOtqEhQvefvlsBxikTG20j/9oBC5PvV+mvWDS
	 gPnLazVSwRcginJL8nzcRDtp3dw0pWDLMxmqrSdBf3r8g98aflUYQubsgu5AC4Kz1X
	 F4Q7SSFbGLb2PbUTYr5rSvU5A5TxwTuOSXlCt/2B+RiRNFWnNLAI8H3GzK3TyRRDwf
	 2J2xs7COAFUBV3YtOAutAY+nelo7FCVCNK3U+cOclWabee0F+QkOWCAKwYpzA5d2Bg
	 4WiskxceC5WFA==
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
Subject: [PATCH v2 08/18] powerpc/crc32: expose CRC32 functions through lib
Date: Fri, 25 Oct 2024 12:14:44 -0700
Message-ID: <20241025191454.72616-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025191454.72616-1-ebiggers@kernel.org>
References: <20241025191454.72616-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Move the powerpc CRC32C assembly code into the lib directory and wire it
up to the library interface.  This allows it to be used without going
through the crypto API.  It remains usable via the crypto API too via
the shash algorithms that use the library interface.  Thus all the
arch-specific "shash" code becomes unnecessary and is removed.

Note: to see the diff from arch/powerpc/crypto/crc32c-vpmsum_glue.c to
arch/powerpc/lib/crc32-glue.c, view this commit with 'git show -M10'.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |  15 +-
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/crc32c-vpmsum_glue.c      | 173 ------------------
 arch/powerpc/crypto/crct10dif-vpmsum_asm.S    |   2 +-
 arch/powerpc/lib/Makefile                     |   3 +
 arch/powerpc/lib/crc32-glue.c                 |  86 +++++++++
 .../{crypto => lib}/crc32-vpmsum_core.S       |   0
 .../{crypto => lib}/crc32c-vpmsum_asm.S       |   0
 11 files changed, 92 insertions(+), 192 deletions(-)
 delete mode 100644 arch/powerpc/crypto/crc32c-vpmsum_glue.c
 create mode 100644 arch/powerpc/lib/crc32-glue.c
 rename arch/powerpc/{crypto => lib}/crc32-vpmsum_core.S (100%)
 rename arch/powerpc/{crypto => lib}/crc32c-vpmsum_asm.S (100%)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8094a01974cc..b05889400b04 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -125,10 +125,11 @@ config PPC
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_COPY_MC			if PPC64
+	select ARCH_HAS_CRC32			if PPC64 && ALTIVEC
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX		if STRICT_KERNEL_RWX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index ee84ade7a033..4a7ddea05b4d 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -318,11 +318,10 @@ CONFIG_FTR_FIXUP_SELFTEST=y
 CONFIG_MSI_BITMAP_SELFTEST=y
 CONFIG_XMON=y
 CONFIG_CRYPTO_TEST=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_CRC32C_VPMSUM=m
 CONFIG_CRYPTO_CRCT10DIF_VPMSUM=m
 CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_SHA256=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index a5e3e7f97f4d..ea01c0d6705f 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -388,11 +388,10 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_LZO=m
-CONFIG_CRYPTO_CRC32C_VPMSUM=m
 CONFIG_CRYPTO_CRCT10DIF_VPMSUM=m
 CONFIG_CRYPTO_VPMSUM_TESTER=m
 CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_AES_GCM_P10=m
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 46a4c85e85e2..5c016ec39530 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -11,23 +11,10 @@ config CRYPTO_CURVE25519_PPC64
 	  Curve25519 algorithm
 
 	  Architecture: PowerPC64
 	  - Little-endian
 
-config CRYPTO_CRC32C_VPMSUM
-	tristate "CRC32c"
-	depends on PPC64 && ALTIVEC
-	select CRYPTO_HASH
-	select CRC32
-	help
-	  CRC32c CRC algorithm with the iSCSI polynomial (RFC 3385 and RFC 3720)
-
-	  Architecture: powerpc64 using
-	  - AltiVec extensions
-
-	  Enable on POWER8 and newer processors for improved performance.
-
 config CRYPTO_CRCT10DIF_VPMSUM
 	tristate "CRC32T10DIF"
 	depends on PPC64 && ALTIVEC && CRC_T10DIF
 	select CRYPTO_HASH
 	help
@@ -38,11 +25,11 @@ config CRYPTO_CRCT10DIF_VPMSUM
 
 	  Enable on POWER8 and newer processors for improved performance.
 
 config CRYPTO_VPMSUM_TESTER
 	tristate "CRC32c and CRC32T10DIF hardware acceleration tester"
-	depends on CRYPTO_CRCT10DIF_VPMSUM && CRYPTO_CRC32C_VPMSUM
+	depends on CRYPTO_CRCT10DIF_VPMSUM && CRC32_ARCH
 	help
 	  Stress test for CRC32c and CRCT10DIF algorithms implemented with
 	  powerpc64 AltiVec extensions (POWER8 vpmsum instructions).
 	  Unless you are testing these algorithms, you don't need this.
 
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 59808592f0a1..54486192273c 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -8,11 +8,10 @@
 obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_MD5_PPC) += md5-ppc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC) += sha1-powerpc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC_SPE) += sha1-ppc-spe.o
 obj-$(CONFIG_CRYPTO_SHA256_PPC_SPE) += sha256-ppc-spe.o
-obj-$(CONFIG_CRYPTO_CRC32C_VPMSUM) += crc32c-vpmsum.o
 obj-$(CONFIG_CRYPTO_CRCT10DIF_VPMSUM) += crct10dif-vpmsum.o
 obj-$(CONFIG_CRYPTO_VPMSUM_TESTER) += crc-vpmsum_test.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_CHACHA20_P10) += chacha-p10-crypto.o
 obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
@@ -22,11 +21,10 @@ obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
 md5-ppc-y := md5-asm.o md5-glue.o
 sha1-powerpc-y := sha1-powerpc-asm.o sha1.o
 sha1-ppc-spe-y := sha1-spe-asm.o sha1-spe-glue.o
 sha256-ppc-spe-y := sha256-spe-asm.o sha256-spe-glue.o
-crc32c-vpmsum-y := crc32c-vpmsum_asm.o crc32c-vpmsum_glue.o
 crct10dif-vpmsum-y := crct10dif-vpmsum_asm.o crct10dif-vpmsum_glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
 poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
diff --git a/arch/powerpc/crypto/crc32c-vpmsum_glue.c b/arch/powerpc/crypto/crc32c-vpmsum_glue.c
deleted file mode 100644
index 63760b7dbb76..000000000000
--- a/arch/powerpc/crypto/crc32c-vpmsum_glue.c
+++ /dev/null
@@ -1,173 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-#include <linux/crc32.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
-#include <linux/cpufeature.h>
-#include <asm/simd.h>
-#include <asm/switch_to.h>
-
-#define CHKSUM_BLOCK_SIZE	1
-#define CHKSUM_DIGEST_SIZE	4
-
-#define VMX_ALIGN		16
-#define VMX_ALIGN_MASK		(VMX_ALIGN-1)
-
-#define VECTOR_BREAKPOINT	512
-
-u32 __crc32c_vpmsum(u32 crc, unsigned char const *p, size_t len);
-
-static u32 crc32c_vpmsum(u32 crc, unsigned char const *p, size_t len)
-{
-	unsigned int prealign;
-	unsigned int tail;
-
-	if (len < (VECTOR_BREAKPOINT + VMX_ALIGN) || !crypto_simd_usable())
-		return __crc32c_le(crc, p, len);
-
-	if ((unsigned long)p & VMX_ALIGN_MASK) {
-		prealign = VMX_ALIGN - ((unsigned long)p & VMX_ALIGN_MASK);
-		crc = __crc32c_le(crc, p, prealign);
-		len -= prealign;
-		p += prealign;
-	}
-
-	if (len & ~VMX_ALIGN_MASK) {
-		preempt_disable();
-		pagefault_disable();
-		enable_kernel_altivec();
-		crc = __crc32c_vpmsum(crc, p, len & ~VMX_ALIGN_MASK);
-		disable_kernel_altivec();
-		pagefault_enable();
-		preempt_enable();
-	}
-
-	tail = len & VMX_ALIGN_MASK;
-	if (tail) {
-		p += len & ~VMX_ALIGN_MASK;
-		crc = __crc32c_le(crc, p, tail);
-	}
-
-	return crc;
-}
-
-static int crc32c_vpmsum_cra_init(struct crypto_tfm *tfm)
-{
-	u32 *key = crypto_tfm_ctx(tfm);
-
-	*key = ~0;
-
-	return 0;
-}
-
-/*
- * Setting the seed allows arbitrary accumulators and flexible XOR policy
- * If your algorithm starts with ~0, then XOR with ~0 before you set
- * the seed.
- */
-static int crc32c_vpmsum_setkey(struct crypto_shash *hash, const u8 *key,
-			       unsigned int keylen)
-{
-	u32 *mctx = crypto_shash_ctx(hash);
-
-	if (keylen != sizeof(u32))
-		return -EINVAL;
-	*mctx = le32_to_cpup((__le32 *)key);
-	return 0;
-}
-
-static int crc32c_vpmsum_init(struct shash_desc *desc)
-{
-	u32 *mctx = crypto_shash_ctx(desc->tfm);
-	u32 *crcp = shash_desc_ctx(desc);
-
-	*crcp = *mctx;
-
-	return 0;
-}
-
-static int crc32c_vpmsum_update(struct shash_desc *desc, const u8 *data,
-			       unsigned int len)
-{
-	u32 *crcp = shash_desc_ctx(desc);
-
-	*crcp = crc32c_vpmsum(*crcp, data, len);
-
-	return 0;
-}
-
-static int __crc32c_vpmsum_finup(u32 *crcp, const u8 *data, unsigned int len,
-				u8 *out)
-{
-	*(__le32 *)out = ~cpu_to_le32(crc32c_vpmsum(*crcp, data, len));
-
-	return 0;
-}
-
-static int crc32c_vpmsum_finup(struct shash_desc *desc, const u8 *data,
-			      unsigned int len, u8 *out)
-{
-	return __crc32c_vpmsum_finup(shash_desc_ctx(desc), data, len, out);
-}
-
-static int crc32c_vpmsum_final(struct shash_desc *desc, u8 *out)
-{
-	u32 *crcp = shash_desc_ctx(desc);
-
-	*(__le32 *)out = ~cpu_to_le32p(crcp);
-
-	return 0;
-}
-
-static int crc32c_vpmsum_digest(struct shash_desc *desc, const u8 *data,
-			       unsigned int len, u8 *out)
-{
-	return __crc32c_vpmsum_finup(crypto_shash_ctx(desc->tfm), data, len,
-				     out);
-}
-
-static struct shash_alg alg = {
-	.setkey		= crc32c_vpmsum_setkey,
-	.init		= crc32c_vpmsum_init,
-	.update		= crc32c_vpmsum_update,
-	.final		= crc32c_vpmsum_final,
-	.finup		= crc32c_vpmsum_finup,
-	.digest		= crc32c_vpmsum_digest,
-	.descsize	= sizeof(u32),
-	.digestsize	= CHKSUM_DIGEST_SIZE,
-	.base		= {
-		.cra_name		= "crc32c",
-		.cra_driver_name	= "crc32c-vpmsum",
-		.cra_priority		= 200,
-		.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
-		.cra_blocksize		= CHKSUM_BLOCK_SIZE,
-		.cra_ctxsize		= sizeof(u32),
-		.cra_module		= THIS_MODULE,
-		.cra_init		= crc32c_vpmsum_cra_init,
-	}
-};
-
-static int __init crc32c_vpmsum_mod_init(void)
-{
-	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-		return -ENODEV;
-
-	return crypto_register_shash(&alg);
-}
-
-static void __exit crc32c_vpmsum_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_cpu_feature_match(PPC_MODULE_FEATURE_VEC_CRYPTO, crc32c_vpmsum_mod_init);
-module_exit(crc32c_vpmsum_mod_fini);
-
-MODULE_AUTHOR("Anton Blanchard <anton@samba.org>");
-MODULE_DESCRIPTION("CRC32C using vector polynomial multiply-sum instructions");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS_CRYPTO("crc32c");
-MODULE_ALIAS_CRYPTO("crc32c-vpmsum");
diff --git a/arch/powerpc/crypto/crct10dif-vpmsum_asm.S b/arch/powerpc/crypto/crct10dif-vpmsum_asm.S
index f0b93a0fe168..0a52261bf859 100644
--- a/arch/powerpc/crypto/crct10dif-vpmsum_asm.S
+++ b/arch/powerpc/crypto/crct10dif-vpmsum_asm.S
@@ -840,6 +840,6 @@
 	.octa 0x000000000000000000000001f65a57f8	/* x^64 div p(x) */
 	/* Barrett constant n */
 	.octa 0x0000000000000000000000018bb70000
 
 #define CRC_FUNCTION_NAME __crct10dif_vpmsum
-#include "crc32-vpmsum_core.S"
+#include "../lib/crc32-vpmsum_core.S"
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index f14ecab674a3..da9381a1c95b 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -76,6 +76,9 @@ obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
 obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
 CFLAGS_xor_vmx.o += -mhard-float -maltivec $(call cc-option,-mabi=altivec)
 # Enable <altivec.h>
 CFLAGS_xor_vmx.o += -isystem $(shell $(CC) -print-file-name=include)
 
+obj-$(CONFIG_CRC32_ARCH) += crc32-powerpc.o
+crc32-powerpc-y := crc32-glue.o crc32c-vpmsum_asm.o
+
 obj-$(CONFIG_PPC64) += $(obj64-y)
diff --git a/arch/powerpc/lib/crc32-glue.c b/arch/powerpc/lib/crc32-glue.c
new file mode 100644
index 000000000000..ee53c38f9fab
--- /dev/null
+++ b/arch/powerpc/lib/crc32-glue.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/crc32.h>
+#include <crypto/internal/simd.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/cpufeature.h>
+#include <asm/simd.h>
+#include <asm/switch_to.h>
+
+#define VMX_ALIGN		16
+#define VMX_ALIGN_MASK		(VMX_ALIGN-1)
+
+#define VECTOR_BREAKPOINT	512
+
+static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
+
+u32 __crc32c_vpmsum(u32 crc, const u8 *p, size_t len);
+
+u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+{
+	return crc32_le_base(crc, p, len);
+}
+EXPORT_SYMBOL(crc32_le_arch);
+
+u32 crc32c_le_arch(u32 crc, const u8 *p, size_t len)
+{
+	unsigned int prealign;
+	unsigned int tail;
+
+	if (len < (VECTOR_BREAKPOINT + VMX_ALIGN) || !crypto_simd_usable() ||
+	    !static_branch_likely(&have_vec_crypto))
+		return crc32c_le_base(crc, p, len);
+
+	if ((unsigned long)p & VMX_ALIGN_MASK) {
+		prealign = VMX_ALIGN - ((unsigned long)p & VMX_ALIGN_MASK);
+		crc = crc32c_le_base(crc, p, prealign);
+		len -= prealign;
+		p += prealign;
+	}
+
+	if (len & ~VMX_ALIGN_MASK) {
+		preempt_disable();
+		pagefault_disable();
+		enable_kernel_altivec();
+		crc = __crc32c_vpmsum(crc, p, len & ~VMX_ALIGN_MASK);
+		disable_kernel_altivec();
+		pagefault_enable();
+		preempt_enable();
+	}
+
+	tail = len & VMX_ALIGN_MASK;
+	if (tail) {
+		p += len & ~VMX_ALIGN_MASK;
+		crc = crc32c_le_base(crc, p, tail);
+	}
+
+	return crc;
+}
+EXPORT_SYMBOL(crc32c_le_arch);
+
+u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
+{
+	return crc32_be_base(crc, p, len);
+}
+EXPORT_SYMBOL(crc32_be_arch);
+
+static int __init crc32_powerpc_init(void)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
+	    (cur_cpu_spec->cpu_user_features2 & PPC_FEATURE2_VEC_CRYPTO)) {
+		static_branch_enable(&have_vec_crypto);
+		crc32_optimizations = CRC32C_OPTIMIZATION;
+	}
+	return 0;
+}
+arch_initcall(crc32_powerpc_init);
+
+static void __exit crc32_powerpc_exit(void)
+{
+}
+module_exit(crc32_powerpc_exit);
+
+MODULE_AUTHOR("Anton Blanchard <anton@samba.org>");
+MODULE_DESCRIPTION("CRC32C using vector polynomial multiply-sum instructions");
+MODULE_LICENSE("GPL");
diff --git a/arch/powerpc/crypto/crc32-vpmsum_core.S b/arch/powerpc/lib/crc32-vpmsum_core.S
similarity index 100%
rename from arch/powerpc/crypto/crc32-vpmsum_core.S
rename to arch/powerpc/lib/crc32-vpmsum_core.S
diff --git a/arch/powerpc/crypto/crc32c-vpmsum_asm.S b/arch/powerpc/lib/crc32c-vpmsum_asm.S
similarity index 100%
rename from arch/powerpc/crypto/crc32c-vpmsum_asm.S
rename to arch/powerpc/lib/crc32c-vpmsum_asm.S
-- 
2.47.0


