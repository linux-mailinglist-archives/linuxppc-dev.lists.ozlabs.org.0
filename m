Return-Path: <linuxppc-dev+bounces-10208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF2B02DAA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8N5RJqz3bm3;
	Sun, 13 Jul 2025 09:26:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362788;
	cv=none; b=Ecmi93P2huhHCamr9rZ2fHZ3IuhAWrS+SckH3drO/E1uycGE/+IQrs5vG7jtZtfzYnPqwrNsppSOCFk5STp+eZlVnkj4vKSEnYEhonGF3++nK8ccP6FI/AP4y9qe8xHInLannIjbNEu+oFAk7wyqMgxuktGiGAeunIlhLxR5GDCxq3vHSowld//L/erLp//yCQGusDjy9WrKDgxUgNxC2aIL3dWBGaPJ5O2tuPpHYrANjdFd1fzP97rNdBTFvLJNcYzThY+qxWT1/+HpG+gkLe3ARDYILrwk2g8mIyu8kz1FEltCPL1d+BSAFJ18fUFVqg9NH4+DcI4BJzL6qjT1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362788; c=relaxed/relaxed;
	bh=E0NBiZ6WLxLxF7Gi1K9zQFBAmoLGzX9ivZTRhCFh3mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSZ+Es85x8ACEHMsaojjZ7gEFd30MFAZs+b4V9GrkDBMjfQJCwgcVjmOQydb5aD++RhUcEvxDMbuojn9MMif5hz/q4S6nCmnB9u+twjnIWJ4bP413viqxqWMpVT7S8dxsMQe9LDNrbAZB4qfB3L6k3muvhUC4bQMNF6TgsD7RVpsmmTkvhjIVBHXHCSNZ+8wXPNUzQLGnf6qbDdtEVvWhMQf+yfUAcf/E3sqI9Fxhu22mu9XjXmLt/uHB0SiDcTQAKnfACogIO+muKGEDtWFW3tTJKlmDgh57XgUe3FafBvRnVMw9C/zoBPSdilWkJzQiNXnwvhBb1sXVNubU5BAHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a45xcfmJ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a45xcfmJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8J3zcgz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C403C46A4C;
	Sat, 12 Jul 2025 23:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7B8C4CEEF;
	Sat, 12 Jul 2025 23:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362782;
	bh=AlEfsWshuJVJoEqIWDUHgVA6EIWkvwPPCzh+qlha/7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a45xcfmJxSdS2gmP8Arke0HTOR8xVfTQZ3wbcilteIj4ntdMDu9slJhe//M/jB8bX
	 fKSvKhuDxUW7NqL2XbNdHzN125wzKynYOGdG7BPCKKw+vyIsz+ymx2YzA/BeKz3sft
	 Kg67dJX9xNYEJIECVlK3C7vtWISPqdOsa2nbQu1D6IcLd/C2oEYpgxz7WotH+AM2/0
	 TIQcPsKlVtGLtiEfS0tLHKIGXa/p3BruwzUS3sV5IYNsOKCMTQI58R7TnA/cLSc79q
	 SNX6M/G5iSJPQJdI0WgB5L6O/2ybDntJkcoDTKsI3N7QRZ1adU2k96AJvsUDUfxHsg
	 thxXtYqtTspLA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 05/26] crypto: sha1 - Wrap library and add HMAC support
Date: Sat, 12 Jul 2025 16:22:56 -0700
Message-ID: <20250712232329.818226-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Like I did for crypto/sha512.c, rework crypto/sha1_generic.c (renamed to
crypto/sha1.c) to simply wrap the normal library functions instead of
accessing the low-level block function directly.  Also add support for
HMAC-SHA1, again just wrapping the library functions.

Since the replacement crypto_shash algorithms are implemented using the
(potentially arch-optimized) library functions, give them driver names
ending with "-lib" rather than "-generic".  Update crypto/testmgr.c and
an odd driver to take this change in driver name into account.

Note: to see the diff from crypto/sha1_generic.c to crypto/sha1.c, view
this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Makefile           |   2 +-
 crypto/sha1.c             | 135 ++++++++++++++++++++++++++++++++++++++
 crypto/sha1_generic.c     |  87 ------------------------
 crypto/testmgr.c          |   6 ++
 drivers/crypto/img-hash.c |   2 +-
 5 files changed, 143 insertions(+), 89 deletions(-)
 create mode 100644 crypto/sha1.c
 delete mode 100644 crypto/sha1_generic.c

diff --git a/crypto/Makefile b/crypto/Makefile
index 816607e0e78ce..9110f708e5a9f 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -73,11 +73,11 @@ obj-$(CONFIG_CRYPTO_HMAC) += hmac.o
 obj-$(CONFIG_CRYPTO_XCBC) += xcbc.o
 obj-$(CONFIG_CRYPTO_NULL) += crypto_null.o
 obj-$(CONFIG_CRYPTO_MD4) += md4.o
 obj-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
-obj-$(CONFIG_CRYPTO_SHA1) += sha1_generic.o
+obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
 obj-$(CONFIG_CRYPTO_SHA256) += sha256.o
 obj-$(CONFIG_CRYPTO_SHA512) += sha512.o
 obj-$(CONFIG_CRYPTO_SHA3) += sha3_generic.o
 obj-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
 obj-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
diff --git a/crypto/sha1.c b/crypto/sha1.c
new file mode 100644
index 0000000000000..00e273b0401db
--- /dev/null
+++ b/crypto/sha1.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Crypto API support for SHA-1 and HMAC-SHA1
+ *
+ * Copyright (c) Alan Smithee.
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
+ * Copyright 2025 Google LLC
+ */
+#include <crypto/internal/hash.h>
+#include <crypto/sha1.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+const u8 sha1_zero_message_hash[SHA1_DIGEST_SIZE] = {
+	0xda, 0x39, 0xa3, 0xee, 0x5e, 0x6b, 0x4b, 0x0d,
+	0x32, 0x55, 0xbf, 0xef, 0x95, 0x60, 0x18, 0x90,
+	0xaf, 0xd8, 0x07, 0x09
+};
+EXPORT_SYMBOL_GPL(sha1_zero_message_hash);
+
+#define SHA1_CTX(desc) ((struct sha1_ctx *)shash_desc_ctx(desc))
+
+static int crypto_sha1_init(struct shash_desc *desc)
+{
+	sha1_init(SHA1_CTX(desc));
+	return 0;
+}
+
+static int crypto_sha1_update(struct shash_desc *desc,
+			      const u8 *data, unsigned int len)
+{
+	sha1_update(SHA1_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_sha1_final(struct shash_desc *desc, u8 *out)
+{
+	sha1_final(SHA1_CTX(desc), out);
+	return 0;
+}
+
+static int crypto_sha1_digest(struct shash_desc *desc,
+			      const u8 *data, unsigned int len, u8 *out)
+{
+	sha1(data, len, out);
+	return 0;
+}
+
+#define HMAC_SHA1_KEY(tfm) ((struct hmac_sha1_key *)crypto_shash_ctx(tfm))
+#define HMAC_SHA1_CTX(desc) ((struct hmac_sha1_ctx *)shash_desc_ctx(desc))
+
+static int crypto_hmac_sha1_setkey(struct crypto_shash *tfm,
+				   const u8 *raw_key, unsigned int keylen)
+{
+	hmac_sha1_preparekey(HMAC_SHA1_KEY(tfm), raw_key, keylen);
+	return 0;
+}
+
+static int crypto_hmac_sha1_init(struct shash_desc *desc)
+{
+	hmac_sha1_init(HMAC_SHA1_CTX(desc), HMAC_SHA1_KEY(desc->tfm));
+	return 0;
+}
+
+static int crypto_hmac_sha1_update(struct shash_desc *desc,
+				   const u8 *data, unsigned int len)
+{
+	hmac_sha1_update(HMAC_SHA1_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_hmac_sha1_final(struct shash_desc *desc, u8 *out)
+{
+	hmac_sha1_final(HMAC_SHA1_CTX(desc), out);
+	return 0;
+}
+
+static int crypto_hmac_sha1_digest(struct shash_desc *desc,
+				   const u8 *data, unsigned int len, u8 *out)
+{
+	hmac_sha1(HMAC_SHA1_KEY(desc->tfm), data, len, out);
+	return 0;
+}
+
+static struct shash_alg algs[] = {
+	{
+		.base.cra_name		= "sha1",
+		.base.cra_driver_name	= "sha1-lib",
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= SHA1_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA1_DIGEST_SIZE,
+		.init			= crypto_sha1_init,
+		.update			= crypto_sha1_update,
+		.final			= crypto_sha1_final,
+		.digest			= crypto_sha1_digest,
+		.descsize		= sizeof(struct sha1_ctx),
+	},
+	{
+		.base.cra_name		= "hmac(sha1)",
+		.base.cra_driver_name	= "hmac-sha1-lib",
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= SHA1_BLOCK_SIZE,
+		.base.cra_ctxsize	= sizeof(struct hmac_sha1_key),
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA1_DIGEST_SIZE,
+		.setkey			= crypto_hmac_sha1_setkey,
+		.init			= crypto_hmac_sha1_init,
+		.update			= crypto_hmac_sha1_update,
+		.final			= crypto_hmac_sha1_final,
+		.digest			= crypto_hmac_sha1_digest,
+		.descsize		= sizeof(struct hmac_sha1_ctx),
+	},
+};
+
+static int __init crypto_sha1_mod_init(void)
+{
+	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
+}
+module_init(crypto_sha1_mod_init);
+
+static void __exit crypto_sha1_mod_exit(void)
+{
+	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
+}
+module_exit(crypto_sha1_mod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Crypto API support for SHA-1 and HMAC-SHA1");
+
+MODULE_ALIAS_CRYPTO("sha1");
+MODULE_ALIAS_CRYPTO("sha1-lib");
+MODULE_ALIAS_CRYPTO("hmac(sha1)");
+MODULE_ALIAS_CRYPTO("hmac-sha1-lib");
diff --git a/crypto/sha1_generic.c b/crypto/sha1_generic.c
deleted file mode 100644
index 024e8043bab02..0000000000000
--- a/crypto/sha1_generic.c
+++ /dev/null
@@ -1,87 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Cryptographic API.
- *
- * SHA1 Secure Hash Algorithm.
- *
- * Derived from cryptoapi implementation, adapted for in-place
- * scatterlist interface.
- *
- * Copyright (c) Alan Smithee.
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
- */
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-
-const u8 sha1_zero_message_hash[SHA1_DIGEST_SIZE] = {
-	0xda, 0x39, 0xa3, 0xee, 0x5e, 0x6b, 0x4b, 0x0d,
-	0x32, 0x55, 0xbf, 0xef, 0x95, 0x60, 0x18, 0x90,
-	0xaf, 0xd8, 0x07, 0x09
-};
-EXPORT_SYMBOL_GPL(sha1_zero_message_hash);
-
-static void sha1_generic_block_fn(struct sha1_state *sst, u8 const *src,
-				  int blocks)
-{
-	u32 temp[SHA1_WORKSPACE_WORDS];
-
-	while (blocks--) {
-		sha1_transform(sst->state, src, temp);
-		src += SHA1_BLOCK_SIZE;
-	}
-	memzero_explicit(temp, sizeof(temp));
-}
-
-static int crypto_sha1_update(struct shash_desc *desc, const u8 *data,
-			      unsigned int len)
-{
-	return sha1_base_do_update_blocks(desc, data, len,
-					  sha1_generic_block_fn);
-}
-
-static int crypto_sha1_finup(struct shash_desc *desc, const u8 *data,
-			     unsigned int len, u8 *out)
-{
-	sha1_base_do_finup(desc, data, len, sha1_generic_block_fn);
-	return sha1_base_finish(desc, out);
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	crypto_sha1_update,
-	.finup		=	crypto_sha1_finup,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name=	"sha1-generic",
-		.cra_priority	=	100,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init sha1_generic_mod_init(void)
-{
-	return crypto_register_shash(&alg);
-}
-
-static void __exit sha1_generic_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(sha1_generic_mod_init);
-module_exit(sha1_generic_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA1 Secure Hash Algorithm");
-
-MODULE_ALIAS_CRYPTO("sha1");
-MODULE_ALIAS_CRYPTO("sha1-generic");
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 4e95567f7ed17..be78e39307692 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4235,33 +4235,37 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.aead = __VECS(hmac_md5_ecb_cipher_null_tv_template)
 		}
 	}, {
 		.alg = "authenc(hmac(sha1),cbc(aes))",
+		.generic_driver = "authenc(hmac-sha1-lib,cbc(aes-generic))",
 		.test = alg_test_aead,
 		.fips_allowed = 1,
 		.suite = {
 			.aead = __VECS(hmac_sha1_aes_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha1),cbc(des))",
+		.generic_driver = "authenc(hmac-sha1-lib,cbc(des-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha1_des_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha1),cbc(des3_ede))",
+		.generic_driver = "authenc(hmac-sha1-lib,cbc(des3_ede-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha1_des3_ede_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha1),ctr(aes))",
 		.test = alg_test_null,
 		.fips_allowed = 1,
 	}, {
 		.alg = "authenc(hmac(sha1),ecb(cipher_null))",
+		.generic_driver = "authenc(hmac-sha1-lib,ecb-cipher_null)",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha1_ecb_cipher_null_tv_temp)
 		}
 	}, {
@@ -5120,10 +5124,11 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(hmac_rmd160_tv_template)
 		}
 	}, {
 		.alg = "hmac(sha1)",
+		.generic_driver = "hmac-sha1-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(hmac_sha1_tv_template)
 		}
@@ -5460,10 +5465,11 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.akcipher = __VECS(rsa_tv_template)
 		}
 	}, {
 		.alg = "sha1",
+		.generic_driver = "sha1-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(sha1_tv_template)
 		}
diff --git a/drivers/crypto/img-hash.c b/drivers/crypto/img-hash.c
index f312eb075feca..a8f735390f0dd 100644
--- a/drivers/crypto/img-hash.c
+++ b/drivers/crypto/img-hash.c
@@ -703,11 +703,11 @@ static int img_hash_cra_md5_init(struct crypto_tfm *tfm)
 	return img_hash_cra_init(tfm, "md5-generic");
 }
 
 static int img_hash_cra_sha1_init(struct crypto_tfm *tfm)
 {
-	return img_hash_cra_init(tfm, "sha1-generic");
+	return img_hash_cra_init(tfm, "sha1-lib");
 }
 
 static int img_hash_cra_sha224_init(struct crypto_tfm *tfm)
 {
 	return img_hash_cra_init(tfm, "sha224-lib");
-- 
2.50.1


