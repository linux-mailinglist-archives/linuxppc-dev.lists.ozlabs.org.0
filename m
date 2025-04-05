Return-Path: <linuxppc-dev+bounces-7463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7901FA7CB4F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Apr 2025 20:31:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZVPDk39WQz2yrn;
	Sun,  6 Apr 2025 04:31:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743877862;
	cv=none; b=gHGLOtRhHMHt2gRnZMa9/YmE9OBJ4VcIqlIeQUEAuDE6C0UpswkVwZI6DqxB4FXGLcqXS/fkRtAp2nFrEtflqgqIOzpW0oMj0t/j0XbOIFWHtyUS80oPLxc6YHTghCwOYMJTLCi/8lrN4G1EdnewgW9mESXLYtVN3a/RlkLsBM1l8Ylb+r+VtgGMJdBIiRaUAQtvjZd92baPZ9MCPGdsqa7AYm4DdfTZbbF+bP0QqBWF7EYyyECeEUMEy7DmGw12tOSu4swAM1QYQ+YbKaVTK9qdxoez3C8EVH1jGL6H47r1rMYhj1Myn5+jLsMXPvKupymGcURLMy0ocGNGBMfZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743877862; c=relaxed/relaxed;
	bh=3yMQgp8OMvDydSAfRE2fxabHtW1l0t3Mqtp244+I0ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOdkAfFdmn0VjwC2IbZd+FBNYklcy4QJAVoXUR6hezB1zViDBInMAaV8DZjW6gumWHVQhslKDF+2bj6n0dVOs4LaFXYhxB3BhpiQm3WUILn4F9rYM4gVNJkHLClu3wkVyGw5dFwAJyulgaQciqBWzOeM3c8BrYp+JjlwFtcnklCmXc2x0GUduE/Z3ak7VVSaayDbDIeMEkKH9Ob6tSH172NcaCCEz4xHOPnsIXVzDOuB8nkybOBjFdVUcKtl+u5k6tmKXm/DL/lPjPzXaQndGnnr3wzNEAEuxK/BfDM1SeqPLKg37I2FJjx9lZxwtRR7CZ6WwFqVFmxtPa1+ZfgQ/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CE/ooCdC; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CE/ooCdC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZVPDf2xjgz2ynR
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Apr 2025 04:30:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63D306115E;
	Sat,  5 Apr 2025 18:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AF0C4CEE9;
	Sat,  5 Apr 2025 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877856;
	bh=eW0xTEYWjFUyh4AXaM8KqKhQHIAg7OUKLr5XE1L/PVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CE/ooCdCQStDNLZa23kR/ZLdWXC5Cyy8blaw32N9VZ/HZByRudI24Av624U6J6GjI
	 vFHfKUJr5kXkrwEOfMxCzev4cmLQ0AxskdtKyhysD4HzgiRFfYhbCiyZiCraAivggH
	 cZL4pzullvEXBaDJryylkKqnIORc48+kUXizZjdOFAJrM4lGxS+NL6HCg/7JQVso1g
	 NxcrHPNy69kYkSJpwVov9VFJ9KzlJ+FkWUrAnbR7RmSmSy5Frr4XTV9WxxskziNvNK
	 nfAuxRJPNAipQqBcEr96SWMXEapihar2DCrrObyZ3tyQoRC0NtFv8ztDL5bCqP6DLl
	 s+6NA8DqN+72w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 7/9] crypto: s390/chacha - remove the skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:07 -0700
Message-ID: <20250405182609.404216-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
References: <20250405182609.404216-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Since crypto/chacha.c now registers chacha20-$(ARCH), xchacha20-$(ARCH),
and xchacha12-$(ARCH) skcipher algorithms that use the architecture's
ChaCha and HChaCha library functions, individual architectures no longer
need to do the same.  Therefore, remove the redundant skcipher
algorithms and leave just the library functions.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/crypto/Kconfig       |   7 ---
 arch/s390/crypto/chacha-glue.c | 101 +++++----------------------------
 2 files changed, 13 insertions(+), 95 deletions(-)

diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index 8c4db8b64fa21..055b08f259ab2 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -108,20 +108,13 @@ config CRYPTO_DES_S390
 	  As of z196 the CTR mode is hardware accelerated.
 
 config CRYPTO_CHACHA_S390
 	tristate
 	depends on S390
-	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving cipher: ChaCha20 stream cipher (RFC 7539)
-
-	  Architecture: s390
-
-	  It is available as of z13.
 
 config CRYPTO_HMAC_S390
 	tristate "Keyed-hash message authentication code: HMAC"
 	depends on S390
 	select CRYPTO_HASH
diff --git a/arch/s390/crypto/chacha-glue.c b/arch/s390/crypto/chacha-glue.c
index 0c68191f2aa4c..b3ffaa5553855 100644
--- a/arch/s390/crypto/chacha-glue.c
+++ b/arch/s390/crypto/chacha-glue.c
@@ -1,69 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * s390 ChaCha stream cipher.
+ * ChaCha stream cipher (s390 optimized)
  *
  * Copyright IBM Corp. 2021
  */
 
 #define KMSG_COMPONENT "chacha_s390"
 #define pr_fmt(fmt) KMSG_COMPONENT ": " fmt
 
-#include <crypto/internal/chacha.h>
-#include <crypto/internal/skcipher.h>
-#include <crypto/algapi.h>
+#include <crypto/chacha.h>
 #include <linux/cpufeature.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
 #include <asm/fpu.h>
 #include "chacha-s390.h"
 
-static void chacha20_crypt_s390(u32 *state, u8 *dst, const u8 *src,
-				unsigned int nbytes, const u32 *key,
-				u32 *counter)
-{
-	DECLARE_KERNEL_FPU_ONSTACK32(vxstate);
-
-	kernel_fpu_begin(&vxstate, KERNEL_VXR);
-	chacha20_vx(dst, src, nbytes, key, counter);
-	kernel_fpu_end(&vxstate, KERNEL_VXR);
-
-	*counter += round_up(nbytes, CHACHA_BLOCK_SIZE) / CHACHA_BLOCK_SIZE;
-}
-
-static int chacha20_s390(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	u32 state[CHACHA_STATE_WORDS] __aligned(16);
-	struct skcipher_walk walk;
-	unsigned int nbytes;
-	int rc;
-
-	rc = skcipher_walk_virt(&walk, req, false);
-	chacha_init(state, ctx->key, req->iv);
-
-	while (walk.nbytes > 0) {
-		nbytes = walk.nbytes;
-		if (nbytes < walk.total)
-			nbytes = round_down(nbytes, walk.stride);
-
-		if (nbytes <= CHACHA_BLOCK_SIZE) {
-			chacha_crypt_generic(state, walk.dst.virt.addr,
-					     walk.src.virt.addr, nbytes,
-					     ctx->nrounds);
-		} else {
-			chacha20_crypt_s390(state, walk.dst.virt.addr,
-					    walk.src.virt.addr, nbytes,
-					    &state[4], &state[12]);
-		}
-		rc = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-	return rc;
-}
-
 void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds)
 {
 	/* TODO: implement hchacha_block_arch() in assembly */
 	hchacha_block_generic(state, stream, nrounds);
 }
@@ -74,57 +28,28 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src,
 {
 	/* s390 chacha20 implementation has 20 rounds hard-coded,
 	 * it cannot handle a block of data or less, but otherwise
 	 * it can handle data of arbitrary size
 	 */
-	if (bytes <= CHACHA_BLOCK_SIZE || nrounds != 20 || !cpu_has_vx())
+	if (bytes <= CHACHA_BLOCK_SIZE || nrounds != 20 || !cpu_has_vx()) {
 		chacha_crypt_generic(state, dst, src, bytes, nrounds);
-	else
-		chacha20_crypt_s390(state, dst, src, bytes,
-				    &state[4], &state[12]);
-}
-EXPORT_SYMBOL(chacha_crypt_arch);
+	} else {
+		DECLARE_KERNEL_FPU_ONSTACK32(vxstate);
 
-static struct skcipher_alg chacha_algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-s390",
-		.base.cra_priority	= 900,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
+		kernel_fpu_begin(&vxstate, KERNEL_VXR);
+		chacha20_vx(dst, src, bytes, &state[4], &state[12]);
+		kernel_fpu_end(&vxstate, KERNEL_VXR);
 
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha20_s390,
-		.decrypt		= chacha20_s390,
+		state[12] += round_up(bytes, CHACHA_BLOCK_SIZE) /
+			     CHACHA_BLOCK_SIZE;
 	}
-};
+}
+EXPORT_SYMBOL(chacha_crypt_arch);
 
 bool chacha_is_arch_optimized(void)
 {
 	return cpu_has_vx();
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
 
-static int __init chacha_mod_init(void)
-{
-	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
-		crypto_register_skciphers(chacha_algs, ARRAY_SIZE(chacha_algs)) : 0;
-}
-
-static void __exit chacha_mod_fini(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER))
-		crypto_unregister_skciphers(chacha_algs, ARRAY_SIZE(chacha_algs));
-}
-
-arch_initcall(chacha_mod_init);
-module_exit(chacha_mod_fini);
-
-MODULE_DESCRIPTION("ChaCha20 stream cipher");
+MODULE_DESCRIPTION("ChaCha stream cipher (s390 optimized)");
 MODULE_LICENSE("GPL v2");
-
-MODULE_ALIAS_CRYPTO("chacha20");
-- 
2.49.0


