Return-Path: <linuxppc-dev+bounces-2597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3D49B0E52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 21:17:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZsvK4KSvz2yNc;
	Sat, 26 Oct 2024 06:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729883757;
	cv=none; b=da2pZdU9uFXq8v7DyekICmQQMocjPBJAzn+/ItOXwtoG/rzSUHiYxznfB3o13lD74SBIJn/QRFIveoYDhCjTLqoCSWZPPFkDwA9ImZ60FbcYpcV+UL/fZMn14OaMdaWxw4lEbai9ndTrT0K4h0jTigUnO37lhxKUNEo4eHntU1/LrXnDPlBFpw0UMs8r7GtZyjmlQLaitY+m6QG+6fGLj5raddZkK7LOaHYGyaEYA/HUjgk3m8QhDRrvrJxgVPAYj55elaIzVfiY7KWdQc745zkyc3h5QoHLUfxxsjeoXOYZDITAXg1kGeReSVD+NXi0p/K6A2dhAGkCkC4IncVJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729883757; c=relaxed/relaxed;
	bh=jXRTLgebz7IDfXPvSxLtP6Zqr4/bnr8RDnf8H7klfR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXumYpV5xqLg7Nwex4FIdZaC2bAr4NphJVvM4NmB7UDuZNDVKKWwWW/VPvQpj6u/IQkXNsCShL/53JLW35mDjpYz5KtP4DlbTiJpmQgOFAEK3HrQvcDoMq2mbAGgTnSjKoRqlYOcoBjcRLUsaFBIUAVaEZXaS7Wv/sTiPtXAbonVph7cIrDV9CJMaemCpYwXsK4GPBch1djBcx1O8vYI2pf8o9VvSnn+ZZqKDuOBIhuT0onelX8kRMgMgMY620x95rIL6r8vO5H7JXzW212fTJpFaif8w1VJFB4mp+ps2JP7Q3RnS+MqPnYziXayeQYD6nJN6qVw6IRvuGXtT+DpcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O+BKuaiR; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O+BKuaiR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZsvF2G2Kz301G
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 06:15:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD7565C57A7;
	Fri, 25 Oct 2024 19:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E36C4CEC3;
	Fri, 25 Oct 2024 19:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729883749;
	bh=DwN16JP9+ENVqlLXmk2XcOqSS0l4MF/dAaiykDZVVoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O+BKuaiRUKTM7lT6GElL27PRdKAfI62RsEcD83Ekb/7HKliEMHMJMz/cAEO0mVoc9
	 SlvxrK9mpPk4sMzpfhnXCX3AlYxH9qQcaAgtrvD2rVsyCqthV2EgjdKR3N3qJjWdqW
	 nVFkPP0vd8d5NadZ5m+1HENb3ITBx0JPVVUD3EmvwM7v0/rMaSH20g225My5Nppag0
	 uVdsAOD/Lho2U4V8IYrFjI8b0Ejw592TgGPlwvPcnD26VadjbUEtqzjCAtgUV/vxT5
	 KLw9o6NGuybXoc9vQS7JlQZfmXMr5bKAuahOr04lm+ShtFa2rsHmLmYXH58Yw8n4Sq
	 Mh0JiY5Jzz9yg==
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
Subject: [PATCH v2 10/18] sparc/crc32: expose CRC32 functions through lib
Date: Fri, 25 Oct 2024 12:14:46 -0700
Message-ID: <20241025191454.72616-11-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Move the sparc CRC32C assembly code into the lib directory and wire it
up to the library interface.  This allows it to be used without going
through the crypto API.  It remains usable via the crypto API too via
the shash algorithms that use the library interface.  Thus all the
arch-specific "shash" code becomes unnecessary and is removed.

Note: to see the diff from arch/sparc/crypto/crc32c_glue.c to
arch/sparc/lib/crc32_glue.c, view this commit with 'git show -M10'.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/Kconfig                      |   1 +
 arch/sparc/crypto/Kconfig               |  10 --
 arch/sparc/crypto/Makefile              |   4 -
 arch/sparc/crypto/crc32c_glue.c         | 184 ------------------------
 arch/sparc/lib/Makefile                 |   2 +
 arch/sparc/lib/crc32_glue.c             |  86 +++++++++++
 arch/sparc/{crypto => lib}/crc32c_asm.S |   2 +-
 7 files changed, 90 insertions(+), 199 deletions(-)
 delete mode 100644 arch/sparc/crypto/crc32c_glue.c
 create mode 100644 arch/sparc/lib/crc32_glue.c
 rename arch/sparc/{crypto => lib}/crc32c_asm.S (92%)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index dcfdb7f1dae9..0f88123925a4 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -108,10 +108,11 @@ config SPARC64
 	select ARCH_HAS_GIGANTIC_PAGE
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
+	select ARCH_HAS_CRC32
 
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
 
 config CPU_BIG_ENDIAN
diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index cfe5102b1c68..e858597de89d 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -14,20 +14,10 @@ config CRYPTO_DES_SPARC64
 	  Length-preserving ciphers: DES with ECB and CBC modes
 	  Length-preserving ciphers: Tripe DES EDE with ECB and CBC modes
 
 	  Architecture: sparc64
 
-config CRYPTO_CRC32C_SPARC64
-	tristate "CRC32c"
-	depends on SPARC64
-	select CRYPTO_HASH
-	select CRC32
-	help
-	  CRC32c CRC algorithm with the iSCSI polynomial (RFC 3385 and RFC 3720)
-
-	  Architecture: sparc64
-
 config CRYPTO_MD5_SPARC64
 	tristate "Digests: MD5"
 	depends on SPARC64
 	select CRYPTO_MD5
 	select CRYPTO_HASH
diff --git a/arch/sparc/crypto/Makefile b/arch/sparc/crypto/Makefile
index d257186c27d1..a2d7fca40cb4 100644
--- a/arch/sparc/crypto/Makefile
+++ b/arch/sparc/crypto/Makefile
@@ -10,17 +10,13 @@ obj-$(CONFIG_CRYPTO_MD5_SPARC64) += md5-sparc64.o
 
 obj-$(CONFIG_CRYPTO_AES_SPARC64) += aes-sparc64.o
 obj-$(CONFIG_CRYPTO_DES_SPARC64) += des-sparc64.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_SPARC64) += camellia-sparc64.o
 
-obj-$(CONFIG_CRYPTO_CRC32C_SPARC64) += crc32c-sparc64.o
-
 sha1-sparc64-y := sha1_asm.o sha1_glue.o
 sha256-sparc64-y := sha256_asm.o sha256_glue.o
 sha512-sparc64-y := sha512_asm.o sha512_glue.o
 md5-sparc64-y := md5_asm.o md5_glue.o
 
 aes-sparc64-y := aes_asm.o aes_glue.o
 des-sparc64-y := des_asm.o des_glue.o
 camellia-sparc64-y := camellia_asm.o camellia_glue.o
-
-crc32c-sparc64-y := crc32c_asm.o crc32c_glue.o
diff --git a/arch/sparc/crypto/crc32c_glue.c b/arch/sparc/crypto/crc32c_glue.c
deleted file mode 100644
index 913b9a09e885..000000000000
--- a/arch/sparc/crypto/crc32c_glue.c
+++ /dev/null
@@ -1,184 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Glue code for CRC32C optimized for sparc64 crypto opcodes.
- *
- * This is based largely upon arch/x86/crypto/crc32c-intel.c
- *
- * Copyright (C) 2008 Intel Corporation
- * Authors: Austin Zhang <austin_zhang@linux.intel.com>
- *          Kent Liu <kent.liu@intel.com>
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
-#include <linux/crc32.h>
-
-#include <crypto/internal/hash.h>
-
-#include <asm/pstate.h>
-#include <asm/elf.h>
-#include <linux/unaligned.h>
-
-#include "opcodes.h"
-
-/*
- * Setting the seed allows arbitrary accumulators and flexible XOR policy
- * If your algorithm starts with ~0, then XOR with ~0 before you set
- * the seed.
- */
-static int crc32c_sparc64_setkey(struct crypto_shash *hash, const u8 *key,
-				 unsigned int keylen)
-{
-	u32 *mctx = crypto_shash_ctx(hash);
-
-	if (keylen != sizeof(u32))
-		return -EINVAL;
-	*mctx = get_unaligned_le32(key);
-	return 0;
-}
-
-static int crc32c_sparc64_init(struct shash_desc *desc)
-{
-	u32 *mctx = crypto_shash_ctx(desc->tfm);
-	u32 *crcp = shash_desc_ctx(desc);
-
-	*crcp = *mctx;
-
-	return 0;
-}
-
-extern void crc32c_sparc64(u32 *crcp, const u64 *data, unsigned int len);
-
-static u32 crc32c_compute(u32 crc, const u8 *data, unsigned int len)
-{
-	unsigned int n = -(uintptr_t)data & 7;
-
-	if (n) {
-		/* Data isn't 8-byte aligned.  Align it. */
-		n = min(n, len);
-		crc = __crc32c_le(crc, data, n);
-		data += n;
-		len -= n;
-	}
-	n = len & ~7U;
-	if (n) {
-		crc32c_sparc64(&crc, (const u64 *)data, n);
-		data += n;
-		len -= n;
-	}
-	if (len)
-		crc = __crc32c_le(crc, data, len);
-	return crc;
-}
-
-static int crc32c_sparc64_update(struct shash_desc *desc, const u8 *data,
-				 unsigned int len)
-{
-	u32 *crcp = shash_desc_ctx(desc);
-
-	*crcp = crc32c_compute(*crcp, data, len);
-	return 0;
-}
-
-static int __crc32c_sparc64_finup(const u32 *crcp, const u8 *data,
-				  unsigned int len, u8 *out)
-{
-	put_unaligned_le32(~crc32c_compute(*crcp, data, len), out);
-	return 0;
-}
-
-static int crc32c_sparc64_finup(struct shash_desc *desc, const u8 *data,
-				unsigned int len, u8 *out)
-{
-	return __crc32c_sparc64_finup(shash_desc_ctx(desc), data, len, out);
-}
-
-static int crc32c_sparc64_final(struct shash_desc *desc, u8 *out)
-{
-	u32 *crcp = shash_desc_ctx(desc);
-
-	put_unaligned_le32(~*crcp, out);
-	return 0;
-}
-
-static int crc32c_sparc64_digest(struct shash_desc *desc, const u8 *data,
-				 unsigned int len, u8 *out)
-{
-	return __crc32c_sparc64_finup(crypto_shash_ctx(desc->tfm), data, len,
-				      out);
-}
-
-static int crc32c_sparc64_cra_init(struct crypto_tfm *tfm)
-{
-	u32 *key = crypto_tfm_ctx(tfm);
-
-	*key = ~0;
-
-	return 0;
-}
-
-#define CHKSUM_BLOCK_SIZE	1
-#define CHKSUM_DIGEST_SIZE	4
-
-static struct shash_alg alg = {
-	.setkey			=	crc32c_sparc64_setkey,
-	.init			=	crc32c_sparc64_init,
-	.update			=	crc32c_sparc64_update,
-	.final			=	crc32c_sparc64_final,
-	.finup			=	crc32c_sparc64_finup,
-	.digest			=	crc32c_sparc64_digest,
-	.descsize		=	sizeof(u32),
-	.digestsize		=	CHKSUM_DIGEST_SIZE,
-	.base			=	{
-		.cra_name		=	"crc32c",
-		.cra_driver_name	=	"crc32c-sparc64",
-		.cra_priority		=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_flags		=	CRYPTO_ALG_OPTIONAL_KEY,
-		.cra_blocksize		=	CHKSUM_BLOCK_SIZE,
-		.cra_ctxsize		=	sizeof(u32),
-		.cra_module		=	THIS_MODULE,
-		.cra_init		=	crc32c_sparc64_cra_init,
-	}
-};
-
-static bool __init sparc64_has_crc32c_opcode(void)
-{
-	unsigned long cfr;
-
-	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
-		return false;
-
-	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
-	if (!(cfr & CFR_CRC32C))
-		return false;
-
-	return true;
-}
-
-static int __init crc32c_sparc64_mod_init(void)
-{
-	if (sparc64_has_crc32c_opcode()) {
-		pr_info("Using sparc64 crc32c opcode optimized CRC32C implementation\n");
-		return crypto_register_shash(&alg);
-	}
-	pr_info("sparc64 crc32c opcode not available.\n");
-	return -ENODEV;
-}
-
-static void __exit crc32c_sparc64_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(crc32c_sparc64_mod_init);
-module_exit(crc32c_sparc64_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("CRC32c (Castagnoli), sparc64 crc32c opcode accelerated");
-
-MODULE_ALIAS_CRYPTO("crc32c");
-
-#include "crop_devid.c"
diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index ee5091dd67ed..5724d0f356eb 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -51,5 +51,7 @@ lib-$(CONFIG_SPARC64) += copy_in_user.o memmove.o
 lib-$(CONFIG_SPARC64) += mcount.o ipcsum.o xor.o hweight.o ffs.o
 
 obj-$(CONFIG_SPARC64) += iomap.o
 obj-$(CONFIG_SPARC32) += atomic32.o
 obj-$(CONFIG_SPARC64) += PeeCeeI.o
+obj-$(CONFIG_CRC32_ARCH) += crc32-sparc.o
+crc32-sparc-y := crc32_glue.o crc32c_asm.o
diff --git a/arch/sparc/lib/crc32_glue.c b/arch/sparc/lib/crc32_glue.c
new file mode 100644
index 000000000000..26980fd72483
--- /dev/null
+++ b/arch/sparc/lib/crc32_glue.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Glue code for CRC32C optimized for sparc64 crypto opcodes.
+ *
+ * This is based largely upon arch/x86/crypto/crc32c-intel.c
+ *
+ * Copyright (C) 2008 Intel Corporation
+ * Authors: Austin Zhang <austin_zhang@linux.intel.com>
+ *          Kent Liu <kent.liu@intel.com>
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/crc32.h>
+#include <asm/pstate.h>
+#include <asm/elf.h>
+
+static DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
+
+u32 crc32_le_arch(u32 crc, const u8 *data, size_t len)
+{
+	return crc32_le_base(crc, data, len);
+}
+EXPORT_SYMBOL(crc32_le_arch);
+
+void crc32c_sparc64(u32 *crcp, const u64 *data, size_t len);
+
+u32 crc32c_le_arch(u32 crc, const u8 *data, size_t len)
+{
+	size_t n = -(uintptr_t)data & 7;
+
+	if (!static_branch_likely(&have_crc32c_opcode))
+		return crc32c_le_base(crc, data, len);
+
+	if (n) {
+		/* Data isn't 8-byte aligned.  Align it. */
+		n = min(n, len);
+		crc = crc32c_le_base(crc, data, n);
+		data += n;
+		len -= n;
+	}
+	n = len & ~7U;
+	if (n) {
+		crc32c_sparc64(&crc, (const u64 *)data, n);
+		data += n;
+		len -= n;
+	}
+	if (len)
+		crc = crc32c_le_base(crc, data, len);
+	return crc;
+}
+EXPORT_SYMBOL(crc32c_le_arch);
+
+u32 crc32_be_arch(u32 crc, const u8 *data, size_t len)
+{
+	return crc32_be_base(crc, data, len);
+}
+EXPORT_SYMBOL(crc32_be_arch);
+
+static int __init crc32_sparc_init(void)
+{
+	unsigned long cfr;
+
+	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
+		return 0;
+
+	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
+	if (!(cfr & CFR_CRC32C))
+		return 0;
+
+	static_branch_enable(&have_crc32c_opcode);
+	crc32_optimizations = CRC32C_OPTIMIZATION;
+	pr_info("Using sparc64 crc32c opcode optimized CRC32C implementation\n");
+	return 0;
+}
+arch_initcall(crc32_sparc_init);
+
+static void __exit crc32_sparc_exit(void)
+{
+}
+module_exit(crc32_sparc_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CRC32c (Castagnoli), sparc64 crc32c opcode accelerated");
diff --git a/arch/sparc/crypto/crc32c_asm.S b/arch/sparc/lib/crc32c_asm.S
similarity index 92%
rename from arch/sparc/crypto/crc32c_asm.S
rename to arch/sparc/lib/crc32c_asm.S
index b8659a479242..ee454fa6aed6 100644
--- a/arch/sparc/crypto/crc32c_asm.S
+++ b/arch/sparc/lib/crc32c_asm.S
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/linkage.h>
 #include <asm/visasm.h>
 #include <asm/asi.h>
 
-#include "opcodes.h"
+#include "../crypto/opcodes.h"
 
 ENTRY(crc32c_sparc64)
 	/* %o0=crc32p, %o1=data_ptr, %o2=len */
 	VISEntryHalf
 	lda	[%o0] ASI_PL, %f1
-- 
2.47.0


