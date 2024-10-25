Return-Path: <linuxppc-dev+bounces-2594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6748A9B0E46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 21:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZsvJ0vXVz3bfS;
	Sat, 26 Oct 2024 06:15:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729883756;
	cv=none; b=G15CHw92Tz1zXxrTLV+8YvfiCkUI0iYl7L09YrOjjv3KiPApp3VXaLAh48t2Z1ZQnUkHKFj4SNm9dlByxcgGd516CwAmSxZ5dgC6ggbT/XuZdyqQoRJSQQVfWiFDKFs4k7I26WZBABO4/QLE4IEGzxl5P08+zt8Pd/JK5U1S7A1ZEpkE8xxnlnf5sAr/RXc2dPFIufNVYeA0oda1bU3De3KbE+BM47WxTNwYkM0mktSUKr3UfgdfQE66lKde76iKlgC8y4ZSsrpWEaDVH7IACPFh42BDE3G7wCtxzRKv4efTsmHT2a6RBMvk+RFLPfBUvnvO4OqMOBhllt5H7AjA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729883756; c=relaxed/relaxed;
	bh=0tfHyVNP09hxZcHl0TJ6XhuReHbxoVy/T882xCZy06Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fvh4MDdIIb4f5aS6yh2HmzcNN9qO9PqDX1wuA0j9BcwDyLtE/wBYH4s34Xx4elTJ8Fl/Ueb1RN3w7X8WIl+Z22F4WxPUxE7iAKYLDlNoqcPL3fwJp9kqOzGwy9alU4a2z3zBpWZWQEGc/3BHu0RMv25x8n1EccPBwhR+uYw5qpZ/BiXU+e5Vv1DeOjmlMgskgDVo3JJdc/vMHkZlWRZ5aeX4FsAWpciUJlt36VO0K6QJTSfPBt5FJ6y4Pos2RWI/EbmGKbMp0dZpf+IjksaKlasAgKCnez4bJUzph96jYE1srHN2WsnWGRLOfEs0FK7sPVRb11OpkIHH/ITH7RlmhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PDbxlUaG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PDbxlUaG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZsvC1ZZSz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 06:15:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F5F15C5F4C;
	Fri, 25 Oct 2024 19:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968ABC4CEE8;
	Fri, 25 Oct 2024 19:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729883749;
	bh=42C73Y2WHPV9otpDqNZffcix1j90pKjRRBGAFIVR+vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PDbxlUaGjJ3xZTsjLcN6UXQD2Cw7qtEjvtyy9DQld4yzdSI3Q+uMYmCHzXu2kh9V+
	 vKOoKOEXyr+5f3SJLrQlX9fbmCfXA9UFeSsU0lmaGELLAWytkyUxlhKgvWh10jVrz5
	 d7EE3/AmW00TpsSeMUjhRRwcwV91TAinCU1B3Y5vlOGikMnxvT196rA5LF1f/YV1RA
	 QI/o/2VAN/1Ouh/Vb41zU07L0Q0OoM5pOYQX9rMCjXbRUrBwLvMq03wHVk0MQgIQrH
	 s9+Gu/JXNEtg/Vblpqv9RLLnH/op6AOWdKbgnPEeeQCT99Oq5TussZsxh9D64XvvAa
	 Cm/ltCVHJpLaQ==
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
Subject: [PATCH v2 09/18] s390/crc32: expose CRC32 functions through lib
Date: Fri, 25 Oct 2024 12:14:45 -0700
Message-ID: <20241025191454.72616-10-ebiggers@kernel.org>
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

Move the s390 CRC32 assembly code into the lib directory and wire it up
to the library interface.  This allows it to be used without going
through the crypto API.  It remains usable via the crypto API too via
the shash algorithms that use the library interface.  Thus all the
arch-specific "shash" code becomes unnecessary and is removed.

Note: to see the diff from arch/s390/crypto/crc32-vx.c to
arch/s390/lib/crc32-glue.c, view this commit with 'git show -M10'.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/Kconfig                      |   1 +
 arch/s390/configs/debug_defconfig      |   1 -
 arch/s390/configs/defconfig            |   1 -
 arch/s390/crypto/Kconfig               |  12 -
 arch/s390/crypto/Makefile              |   2 -
 arch/s390/crypto/crc32-vx.c            | 306 -------------------------
 arch/s390/lib/Makefile                 |   3 +
 arch/s390/lib/crc32-glue.c             |  86 +++++++
 arch/s390/{crypto => lib}/crc32-vx.h   |   0
 arch/s390/{crypto => lib}/crc32be-vx.c |   0
 arch/s390/{crypto => lib}/crc32le-vx.c |   0
 11 files changed, 90 insertions(+), 322 deletions(-)
 delete mode 100644 arch/s390/crypto/crc32-vx.c
 create mode 100644 arch/s390/lib/crc32-glue.c
 rename arch/s390/{crypto => lib}/crc32-vx.h (100%)
 rename arch/s390/{crypto => lib}/crc32be-vx.c (100%)
 rename arch/s390/{crypto => lib}/crc32le-vx.c (100%)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index d339fe4fdedf..d1fde8b941d2 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -63,10 +63,11 @@ config S390
 	select ARCH_BINFMT_ELF_STATE
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
+	select ARCH_HAS_CRC32
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index fb0e9a1d9be2..fd83d8958f0b 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -792,11 +792,10 @@ CONFIG_CRYPTO_ZSTD=m
 CONFIG_CRYPTO_ANSI_CPRNG=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_CRC32_S390=y
 CONFIG_CRYPTO_SHA512_S390=m
 CONFIG_CRYPTO_SHA1_S390=m
 CONFIG_CRYPTO_SHA256_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index 88be0a734b60..3bdeb6d5cbd9 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -779,11 +779,10 @@ CONFIG_CRYPTO_ANSI_CPRNG=m
 CONFIG_CRYPTO_JITTERENTROPY_OSR=1
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_CRC32_S390=y
 CONFIG_CRYPTO_SHA512_S390=m
 CONFIG_CRYPTO_SHA1_S390=m
 CONFIG_CRYPTO_SHA256_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index d3eb3a233693..b760232537f1 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -1,21 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (s390)"
 
-config CRYPTO_CRC32_S390
-	tristate "CRC32c and CRC32"
-	depends on S390
-	select CRYPTO_HASH
-	select CRC32
-	help
-	  CRC32c and CRC32 CRC algorithms
-
-	  Architecture: s390
-
-	  It is available with IBM z13 or later.
-
 config CRYPTO_SHA512_S390
 	tristate "Hash functions: SHA-384 and SHA-512"
 	depends on S390
 	select CRYPTO_HASH
 	help
diff --git a/arch/s390/crypto/Makefile b/arch/s390/crypto/Makefile
index a0cb96937c3d..14dafadbcbed 100644
--- a/arch/s390/crypto/Makefile
+++ b/arch/s390/crypto/Makefile
@@ -12,11 +12,9 @@ obj-$(CONFIG_CRYPTO_DES_S390) += des_s390.o
 obj-$(CONFIG_CRYPTO_AES_S390) += aes_s390.o
 obj-$(CONFIG_CRYPTO_PAES_S390) += paes_s390.o
 obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
 obj-$(CONFIG_S390_PRNG) += prng.o
 obj-$(CONFIG_CRYPTO_GHASH_S390) += ghash_s390.o
-obj-$(CONFIG_CRYPTO_CRC32_S390) += crc32-vx_s390.o
 obj-$(CONFIG_CRYPTO_HMAC_S390) += hmac_s390.o
 obj-y += arch_random.o
 
-crc32-vx_s390-y := crc32-vx.o crc32le-vx.o crc32be-vx.o
 chacha_s390-y := chacha-glue.o chacha-s390.o
diff --git a/arch/s390/crypto/crc32-vx.c b/arch/s390/crypto/crc32-vx.c
deleted file mode 100644
index 89a10337e6ea..000000000000
--- a/arch/s390/crypto/crc32-vx.c
+++ /dev/null
@@ -1,306 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Crypto-API module for CRC-32 algorithms implemented with the
- * z/Architecture Vector Extension Facility.
- *
- * Copyright IBM Corp. 2015
- * Author(s): Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
- */
-#define KMSG_COMPONENT	"crc32-vx"
-#define pr_fmt(fmt)	KMSG_COMPONENT ": " fmt
-
-#include <linux/module.h>
-#include <linux/cpufeature.h>
-#include <linux/crc32.h>
-#include <crypto/internal/hash.h>
-#include <asm/fpu.h>
-#include "crc32-vx.h"
-
-#define CRC32_BLOCK_SIZE	1
-#define CRC32_DIGEST_SIZE	4
-
-#define VX_MIN_LEN		64
-#define VX_ALIGNMENT		16L
-#define VX_ALIGN_MASK		(VX_ALIGNMENT - 1)
-
-struct crc_ctx {
-	u32 key;
-};
-
-struct crc_desc_ctx {
-	u32 crc;
-};
-
-/*
- * DEFINE_CRC32_VX() - Define a CRC-32 function using the vector extension
- *
- * Creates a function to perform a particular CRC-32 computation. Depending
- * on the message buffer, the hardware-accelerated or software implementation
- * is used.   Note that the message buffer is aligned to improve fetch
- * operations of VECTOR LOAD MULTIPLE instructions.
- *
- */
-#define DEFINE_CRC32_VX(___fname, ___crc32_vx, ___crc32_sw)		    \
-	static u32 __pure ___fname(u32 crc,				    \
-				unsigned char const *data, size_t datalen)  \
-	{								    \
-		unsigned long prealign, aligned, remaining;		    \
-		DECLARE_KERNEL_FPU_ONSTACK16(vxstate);			    \
-									    \
-		if (datalen < VX_MIN_LEN + VX_ALIGN_MASK)		    \
-			return ___crc32_sw(crc, data, datalen);		    \
-									    \
-		if ((unsigned long)data & VX_ALIGN_MASK) {		    \
-			prealign = VX_ALIGNMENT -			    \
-				  ((unsigned long)data & VX_ALIGN_MASK);    \
-			datalen -= prealign;				    \
-			crc = ___crc32_sw(crc, data, prealign);		    \
-			data = (void *)((unsigned long)data + prealign);    \
-		}							    \
-									    \
-		aligned = datalen & ~VX_ALIGN_MASK;			    \
-		remaining = datalen & VX_ALIGN_MASK;			    \
-									    \
-		kernel_fpu_begin(&vxstate, KERNEL_VXR_LOW);		    \
-		crc = ___crc32_vx(crc, data, aligned);			    \
-		kernel_fpu_end(&vxstate, KERNEL_VXR_LOW);		    \
-									    \
-		if (remaining)						    \
-			crc = ___crc32_sw(crc, data + aligned, remaining);  \
-									    \
-		return crc;						    \
-	}
-
-DEFINE_CRC32_VX(crc32_le_vx, crc32_le_vgfm_16, crc32_le)
-DEFINE_CRC32_VX(crc32_be_vx, crc32_be_vgfm_16, crc32_be)
-DEFINE_CRC32_VX(crc32c_le_vx, crc32c_le_vgfm_16, __crc32c_le)
-
-
-static int crc32_vx_cra_init_zero(struct crypto_tfm *tfm)
-{
-	struct crc_ctx *mctx = crypto_tfm_ctx(tfm);
-
-	mctx->key = 0;
-	return 0;
-}
-
-static int crc32_vx_cra_init_invert(struct crypto_tfm *tfm)
-{
-	struct crc_ctx *mctx = crypto_tfm_ctx(tfm);
-
-	mctx->key = ~0;
-	return 0;
-}
-
-static int crc32_vx_init(struct shash_desc *desc)
-{
-	struct crc_ctx *mctx = crypto_shash_ctx(desc->tfm);
-	struct crc_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	ctx->crc = mctx->key;
-	return 0;
-}
-
-static int crc32_vx_setkey(struct crypto_shash *tfm, const u8 *newkey,
-			   unsigned int newkeylen)
-{
-	struct crc_ctx *mctx = crypto_shash_ctx(tfm);
-
-	if (newkeylen != sizeof(mctx->key))
-		return -EINVAL;
-	mctx->key = le32_to_cpu(*(__le32 *)newkey);
-	return 0;
-}
-
-static int crc32be_vx_setkey(struct crypto_shash *tfm, const u8 *newkey,
-			     unsigned int newkeylen)
-{
-	struct crc_ctx *mctx = crypto_shash_ctx(tfm);
-
-	if (newkeylen != sizeof(mctx->key))
-		return -EINVAL;
-	mctx->key = be32_to_cpu(*(__be32 *)newkey);
-	return 0;
-}
-
-static int crc32le_vx_final(struct shash_desc *desc, u8 *out)
-{
-	struct crc_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	*(__le32 *)out = cpu_to_le32p(&ctx->crc);
-	return 0;
-}
-
-static int crc32be_vx_final(struct shash_desc *desc, u8 *out)
-{
-	struct crc_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	*(__be32 *)out = cpu_to_be32p(&ctx->crc);
-	return 0;
-}
-
-static int crc32c_vx_final(struct shash_desc *desc, u8 *out)
-{
-	struct crc_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	/*
-	 * Perform a final XOR with 0xFFFFFFFF to be in sync
-	 * with the generic crc32c shash implementation.
-	 */
-	*(__le32 *)out = ~cpu_to_le32p(&ctx->crc);
-	return 0;
-}
-
-static int __crc32le_vx_finup(u32 *crc, const u8 *data, unsigned int len,
-			      u8 *out)
-{
-	*(__le32 *)out = cpu_to_le32(crc32_le_vx(*crc, data, len));
-	return 0;
-}
-
-static int __crc32be_vx_finup(u32 *crc, const u8 *data, unsigned int len,
-			      u8 *out)
-{
-	*(__be32 *)out = cpu_to_be32(crc32_be_vx(*crc, data, len));
-	return 0;
-}
-
-static int __crc32c_vx_finup(u32 *crc, const u8 *data, unsigned int len,
-			     u8 *out)
-{
-	/*
-	 * Perform a final XOR with 0xFFFFFFFF to be in sync
-	 * with the generic crc32c shash implementation.
-	 */
-	*(__le32 *)out = ~cpu_to_le32(crc32c_le_vx(*crc, data, len));
-	return 0;
-}
-
-
-#define CRC32_VX_FINUP(alg, func)					      \
-	static int alg ## _vx_finup(struct shash_desc *desc, const u8 *data,  \
-				   unsigned int datalen, u8 *out)	      \
-	{								      \
-		return __ ## alg ## _vx_finup(shash_desc_ctx(desc),	      \
-					      data, datalen, out);	      \
-	}
-
-CRC32_VX_FINUP(crc32le, crc32_le_vx)
-CRC32_VX_FINUP(crc32be, crc32_be_vx)
-CRC32_VX_FINUP(crc32c, crc32c_le_vx)
-
-#define CRC32_VX_DIGEST(alg, func)					      \
-	static int alg ## _vx_digest(struct shash_desc *desc, const u8 *data, \
-				     unsigned int len, u8 *out)		      \
-	{								      \
-		return __ ## alg ## _vx_finup(crypto_shash_ctx(desc->tfm),    \
-					      data, len, out);		      \
-	}
-
-CRC32_VX_DIGEST(crc32le, crc32_le_vx)
-CRC32_VX_DIGEST(crc32be, crc32_be_vx)
-CRC32_VX_DIGEST(crc32c, crc32c_le_vx)
-
-#define CRC32_VX_UPDATE(alg, func)					      \
-	static int alg ## _vx_update(struct shash_desc *desc, const u8 *data, \
-				     unsigned int datalen)		      \
-	{								      \
-		struct crc_desc_ctx *ctx = shash_desc_ctx(desc);	      \
-		ctx->crc = func(ctx->crc, data, datalen);		      \
-		return 0;						      \
-	}
-
-CRC32_VX_UPDATE(crc32le, crc32_le_vx)
-CRC32_VX_UPDATE(crc32be, crc32_be_vx)
-CRC32_VX_UPDATE(crc32c, crc32c_le_vx)
-
-
-static struct shash_alg crc32_vx_algs[] = {
-	/* CRC-32 LE */
-	{
-		.init		=	crc32_vx_init,
-		.setkey		=	crc32_vx_setkey,
-		.update		=	crc32le_vx_update,
-		.final		=	crc32le_vx_final,
-		.finup		=	crc32le_vx_finup,
-		.digest		=	crc32le_vx_digest,
-		.descsize	=	sizeof(struct crc_desc_ctx),
-		.digestsize	=	CRC32_DIGEST_SIZE,
-		.base		=	{
-			.cra_name	 = "crc32",
-			.cra_driver_name = "crc32-vx",
-			.cra_priority	 = 200,
-			.cra_flags	 = CRYPTO_ALG_OPTIONAL_KEY,
-			.cra_blocksize	 = CRC32_BLOCK_SIZE,
-			.cra_ctxsize	 = sizeof(struct crc_ctx),
-			.cra_module	 = THIS_MODULE,
-			.cra_init	 = crc32_vx_cra_init_zero,
-		},
-	},
-	/* CRC-32 BE */
-	{
-		.init		=	crc32_vx_init,
-		.setkey		=	crc32be_vx_setkey,
-		.update		=	crc32be_vx_update,
-		.final		=	crc32be_vx_final,
-		.finup		=	crc32be_vx_finup,
-		.digest		=	crc32be_vx_digest,
-		.descsize	=	sizeof(struct crc_desc_ctx),
-		.digestsize	=	CRC32_DIGEST_SIZE,
-		.base		=	{
-			.cra_name	 = "crc32be",
-			.cra_driver_name = "crc32be-vx",
-			.cra_priority	 = 200,
-			.cra_flags	 = CRYPTO_ALG_OPTIONAL_KEY,
-			.cra_blocksize	 = CRC32_BLOCK_SIZE,
-			.cra_ctxsize	 = sizeof(struct crc_ctx),
-			.cra_module	 = THIS_MODULE,
-			.cra_init	 = crc32_vx_cra_init_zero,
-		},
-	},
-	/* CRC-32C LE */
-	{
-		.init		=	crc32_vx_init,
-		.setkey		=	crc32_vx_setkey,
-		.update		=	crc32c_vx_update,
-		.final		=	crc32c_vx_final,
-		.finup		=	crc32c_vx_finup,
-		.digest		=	crc32c_vx_digest,
-		.descsize	=	sizeof(struct crc_desc_ctx),
-		.digestsize	=	CRC32_DIGEST_SIZE,
-		.base		=	{
-			.cra_name	 = "crc32c",
-			.cra_driver_name = "crc32c-vx",
-			.cra_priority	 = 200,
-			.cra_flags	 = CRYPTO_ALG_OPTIONAL_KEY,
-			.cra_blocksize	 = CRC32_BLOCK_SIZE,
-			.cra_ctxsize	 = sizeof(struct crc_ctx),
-			.cra_module	 = THIS_MODULE,
-			.cra_init	 = crc32_vx_cra_init_invert,
-		},
-	},
-};
-
-
-static int __init crc_vx_mod_init(void)
-{
-	return crypto_register_shashes(crc32_vx_algs,
-				       ARRAY_SIZE(crc32_vx_algs));
-}
-
-static void __exit crc_vx_mod_exit(void)
-{
-	crypto_unregister_shashes(crc32_vx_algs, ARRAY_SIZE(crc32_vx_algs));
-}
-
-module_cpu_feature_match(S390_CPU_FEATURE_VXRS, crc_vx_mod_init);
-module_exit(crc_vx_mod_exit);
-
-MODULE_AUTHOR("Hendrik Brueckner <brueckner@linux.vnet.ibm.com>");
-MODULE_DESCRIPTION("CRC-32 algorithms using z/Architecture Vector Extension Facility");
-MODULE_LICENSE("GPL");
-
-MODULE_ALIAS_CRYPTO("crc32");
-MODULE_ALIAS_CRYPTO("crc32-vx");
-MODULE_ALIAS_CRYPTO("crc32c");
-MODULE_ALIAS_CRYPTO("crc32c-vx");
diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index f43f897d3fc0..14bbfe50033c 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -22,5 +22,8 @@ obj-$(CONFIG_S390_MODULES_SANITY_TEST) += test_modules.o
 obj-$(CONFIG_S390_MODULES_SANITY_TEST_HELPERS) += test_modules_helpers.o
 
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
+
+obj-$(CONFIG_CRC32_ARCH) += crc32-s390.o
+crc32-s390-y := crc32-glue.o crc32le-vx.o crc32be-vx.o
diff --git a/arch/s390/lib/crc32-glue.c b/arch/s390/lib/crc32-glue.c
new file mode 100644
index 000000000000..1ac2fb872af9
--- /dev/null
+++ b/arch/s390/lib/crc32-glue.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CRC-32 implemented with the z/Architecture Vector Extension Facility.
+ *
+ * Copyright IBM Corp. 2015
+ * Author(s): Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
+ */
+#define KMSG_COMPONENT	"crc32-vx"
+#define pr_fmt(fmt)	KMSG_COMPONENT ": " fmt
+
+#include <linux/module.h>
+#include <linux/cpufeature.h>
+#include <linux/crc32.h>
+#include <asm/fpu.h>
+#include "crc32-vx.h"
+
+#define VX_MIN_LEN		64
+#define VX_ALIGNMENT		16L
+#define VX_ALIGN_MASK		(VX_ALIGNMENT - 1)
+
+static DEFINE_STATIC_KEY_FALSE(have_vxrs);
+
+/*
+ * DEFINE_CRC32_VX() - Define a CRC-32 function using the vector extension
+ *
+ * Creates a function to perform a particular CRC-32 computation. Depending
+ * on the message buffer, the hardware-accelerated or software implementation
+ * is used.   Note that the message buffer is aligned to improve fetch
+ * operations of VECTOR LOAD MULTIPLE instructions.
+ */
+#define DEFINE_CRC32_VX(___fname, ___crc32_vx, ___crc32_sw)		    \
+	u32 ___fname(u32 crc, const u8 *data, size_t datalen)		    \
+	{								    \
+		unsigned long prealign, aligned, remaining;		    \
+		DECLARE_KERNEL_FPU_ONSTACK16(vxstate);			    \
+									    \
+		if (datalen < VX_MIN_LEN + VX_ALIGN_MASK ||		    \
+		    !static_branch_likely(&have_vxrs))			    \
+			return ___crc32_sw(crc, data, datalen);		    \
+									    \
+		if ((unsigned long)data & VX_ALIGN_MASK) {		    \
+			prealign = VX_ALIGNMENT -			    \
+				  ((unsigned long)data & VX_ALIGN_MASK);    \
+			datalen -= prealign;				    \
+			crc = ___crc32_sw(crc, data, prealign);		    \
+			data = (void *)((unsigned long)data + prealign);    \
+		}							    \
+									    \
+		aligned = datalen & ~VX_ALIGN_MASK;			    \
+		remaining = datalen & VX_ALIGN_MASK;			    \
+									    \
+		kernel_fpu_begin(&vxstate, KERNEL_VXR_LOW);		    \
+		crc = ___crc32_vx(crc, data, aligned);			    \
+		kernel_fpu_end(&vxstate, KERNEL_VXR_LOW);		    \
+									    \
+		if (remaining)						    \
+			crc = ___crc32_sw(crc, data + aligned, remaining);  \
+									    \
+		return crc;						    \
+	}								    \
+	EXPORT_SYMBOL(___fname);
+
+DEFINE_CRC32_VX(crc32_le_arch, crc32_le_vgfm_16, crc32_le_base)
+DEFINE_CRC32_VX(crc32_be_arch, crc32_be_vgfm_16, crc32_be_base)
+DEFINE_CRC32_VX(crc32c_le_arch, crc32c_le_vgfm_16, crc32c_le_base)
+
+static int __init crc32_s390_init(void)
+{
+	if (cpu_have_feature(S390_CPU_FEATURE_VXRS)) {
+		static_branch_enable(&have_vxrs);
+		crc32_optimizations = CRC32_LE_OPTIMIZATION |
+				      CRC32_BE_OPTIMIZATION |
+				      CRC32C_OPTIMIZATION;
+	}
+	return 0;
+}
+arch_initcall(crc32_s390_init);
+
+static void __exit crc32_s390_exit(void)
+{
+}
+module_exit(crc32_s390_exit);
+
+MODULE_AUTHOR("Hendrik Brueckner <brueckner@linux.vnet.ibm.com>");
+MODULE_DESCRIPTION("CRC-32 algorithms using z/Architecture Vector Extension Facility");
+MODULE_LICENSE("GPL");
diff --git a/arch/s390/crypto/crc32-vx.h b/arch/s390/lib/crc32-vx.h
similarity index 100%
rename from arch/s390/crypto/crc32-vx.h
rename to arch/s390/lib/crc32-vx.h
diff --git a/arch/s390/crypto/crc32be-vx.c b/arch/s390/lib/crc32be-vx.c
similarity index 100%
rename from arch/s390/crypto/crc32be-vx.c
rename to arch/s390/lib/crc32be-vx.c
diff --git a/arch/s390/crypto/crc32le-vx.c b/arch/s390/lib/crc32le-vx.c
similarity index 100%
rename from arch/s390/crypto/crc32le-vx.c
rename to arch/s390/lib/crc32le-vx.c
-- 
2.47.0


