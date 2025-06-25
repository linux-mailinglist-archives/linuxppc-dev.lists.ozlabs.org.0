Return-Path: <linuxppc-dev+bounces-9718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD5AE7817
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:13:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJQ1tLqz3bcj;
	Wed, 25 Jun 2025 17:10:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835446;
	cv=none; b=loFuZPLTHitQloUzVSba6bNgqgwuI/YvLFDEzJ0SGKiiY+Ff9u+M5U8VyYJ5/ADTQTSIqGdvkF/uybUk6NVQIc2GjJdJeYS4jd8g7WH+kTekXsizbcyb4Cvxx5KXb4KUMgvtDs7ddMrpKpI2M+DX+B7gbzuwnSkJoxrKXCpYOkiJ3/unhMMmmRrpfPW5QUq78L5lgaBs5GVhfRpXAxQ4xOSv0/acbdnrNHJ1c2F/koqKN2XpaOGqevtu7Vp7dYkWfkh6h8KYBPjExeUXT9QclSqyHYtffCzRGLaNlbAtwpxh4Js4Rs4uz+YJpHfbOhGbRqlAfQbYcGkMMgQWgw6EPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835446; c=relaxed/relaxed;
	bh=ZGW101pc6nDtTvTYZEPyz6G4ceHENe58HRLxCGUQN3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MqmB6hsYuit+S42v68gLOVRomg2WuykrlZTAnnZbSoYxRztUVV2R50oIuLaA088hp3t16qMRMc+tybYx2yk60AMnwGEjyaBY9Rc7xsN0LgJpqYUgSw8otYo0hR5hdLB9Zw5p1fTsF51nOO0u4Ybh885N8yf1yXJ4r7/e78lNneMNsVqnk/GyR+1nk8mpQdVXDc3xqMD0iHHUTIqgmdAM8zwrjxiheybtsggFupRtUrlfa1ri9uY8YizOF7BTBxt11/aW8lGZXPaxPPNbETXRwn8t7IpMk3wP2S8QRxRYeaeqFxqZLOkOWfjSO8wcoUZjErACOyA5VeD4Y/1m7NDHEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ip1C0Zuj; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ip1C0Zuj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJD6kK8z30BG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C45DCA51209;
	Wed, 25 Jun 2025 07:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A8AC4CEF2;
	Wed, 25 Jun 2025 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835433;
	bh=sCHERaTxMMEUVGvqsW2R5+cc6BxvVMNaraj7BT1Upjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ip1C0Zujy+3rYPyuUJNLV/DeMRYonEAZjpTSUGpf/ukCS/amd/zb+GEamwZaastwU
	 vHJsWkZ1ZhxfyNNtmdTe5T6OwDX1/qE6Wbm7NIcBPZYvdEmJbS3FkwTOPIiTeZNpv7
	 VaoMfroBttxuMOghaObIaUSOP+u/w25NQCFWUjrJ6k709y/RwzPjmuJdt3nUKk1fln
	 ChqhJn3t9V2tnfXBfEenoN/GCh1Z7OhOwx1NFNAS+KV4GxvlfDZVMKwm3DjTjqb9ST
	 MMah4mWSbtlkSJBqBjMlwPvAPinBUmf89F7XRUkvIe3nda1x2voNwvM1IQPgAjv1mM
	 yxBt9X6CQBzgg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 13/18] crypto: sha256 - Wrap library and add HMAC support
Date: Wed, 25 Jun 2025 00:08:14 -0700
Message-ID: <20250625070819.1496119-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
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

Like I did for crypto/sha512.c, rework crypto/sha256.c to simply wrap
the normal library functions instead of accessing the low-level arch-
optimized and generic block functions directly.  Also add support for
HMAC-SHA224 and HMAC-SHA256, again just wrapping the library functions.

Since the replacement crypto_shash algorithms are implemented using the
(potentially arch-optimized) library functions, give them driver names
ending with "-lib" rather than "-generic".  Update crypto/testmgr.c and
a couple odd drivers to take this change in driver name into account.

Besides the above cases which are accounted for, there are no known
cases where the driver names were being depended on.  There is
potential for confusion for people manually checking /proc/crypto (e.g.
https://lore.kernel.org/r/9e33c893-2466-4d4e-afb1-966334e451a2@linux.ibm.com/),
but really people just need to get used to the driver name not being
meaningful for the software algorithms.  Historically, the optimized
code was disabled by default, so there was some purpose to checking
whether it was enabled or not.  However, this is now fixed for all SHA-2
algorithms, and the library code just always does the right thing.  E.g.
if the CPU supports SHA-256 instructions, they are used.

This change does also mean that the generic partial block handling code
in crypto/shash.c, which got added in 6.16, no longer gets used.  But
that's fine; the library has to implement the partial block handling
anyway, and it's better to do it in the library since the block size and
other properties of the algorithm are all fixed at compile time there,
resulting in more streamlined code.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Kconfig                        |   4 +-
 crypto/sha256.c                       | 286 ++++++++++++--------------
 crypto/testmgr.c                      |  12 ++
 drivers/crypto/img-hash.c             |   4 +-
 drivers/crypto/starfive/jh7110-hash.c |   8 +-
 5 files changed, 148 insertions(+), 166 deletions(-)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index cb40a9b469722..3ea1397214e02 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -990,13 +990,13 @@ config CRYPTO_SHA1
 
 config CRYPTO_SHA256
 	tristate "SHA-224 and SHA-256"
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SHA256
-	select CRYPTO_LIB_SHA256_GENERIC
 	help
-	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180, ISO/IEC 10118-3)
+	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180, ISO/IEC
+	  10118-3), including HMAC support.
 
 	  This is required for IPsec AH (XFRM_AH) and IPsec ESP (XFRM_ESP).
 	  Used by the btrfs filesystem, Ceph, NFS, and SMB.
 
 config CRYPTO_SHA512
diff --git a/crypto/sha256.c b/crypto/sha256.c
index 15c57fba256b7..d81166cbba953 100644
--- a/crypto/sha256.c
+++ b/crypto/sha256.c
@@ -1,283 +1,253 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Crypto API wrapper for the SHA-256 and SHA-224 library functions
+ * Crypto API support for SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256
  *
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
+ * Copyright 2025 Google LLC
  */
 #include <crypto/internal/hash.h>
-#include <crypto/internal/sha2.h>
+#include <crypto/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+/* SHA-224 */
+
 const u8 sha224_zero_message_hash[SHA224_DIGEST_SIZE] = {
 	0xd1, 0x4a, 0x02, 0x8c, 0x2a, 0x3a, 0x2b, 0xc9, 0x47,
 	0x61, 0x02, 0xbb, 0x28, 0x82, 0x34, 0xc4, 0x15, 0xa2,
 	0xb0, 0x1f, 0x82, 0x8e, 0xa6, 0x2a, 0xc5, 0xb3, 0xe4,
 	0x2f
 };
 EXPORT_SYMBOL_GPL(sha224_zero_message_hash);
 
+#define SHA224_CTX(desc) ((struct sha224_ctx *)shash_desc_ctx(desc))
+
+static int crypto_sha224_init(struct shash_desc *desc)
+{
+	sha224_init(SHA224_CTX(desc));
+	return 0;
+}
+
+static int crypto_sha224_update(struct shash_desc *desc,
+				const u8 *data, unsigned int len)
+{
+	sha224_update(SHA224_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_sha224_final(struct shash_desc *desc, u8 *out)
+{
+	sha224_final(SHA224_CTX(desc), out);
+	return 0;
+}
+
+static int crypto_sha224_digest(struct shash_desc *desc,
+				const u8 *data, unsigned int len, u8 *out)
+{
+	sha224(data, len, out);
+	return 0;
+}
+
+/* SHA-256 */
+
 const u8 sha256_zero_message_hash[SHA256_DIGEST_SIZE] = {
 	0xe3, 0xb0, 0xc4, 0x42, 0x98, 0xfc, 0x1c, 0x14,
 	0x9a, 0xfb, 0xf4, 0xc8, 0x99, 0x6f, 0xb9, 0x24,
 	0x27, 0xae, 0x41, 0xe4, 0x64, 0x9b, 0x93, 0x4c,
 	0xa4, 0x95, 0x99, 0x1b, 0x78, 0x52, 0xb8, 0x55
 };
 EXPORT_SYMBOL_GPL(sha256_zero_message_hash);
 
+#define SHA256_CTX(desc) ((struct sha256_ctx *)shash_desc_ctx(desc))
+
 static int crypto_sha256_init(struct shash_desc *desc)
 {
-	sha256_block_init(shash_desc_ctx(desc));
+	sha256_init(SHA256_CTX(desc));
 	return 0;
 }
 
-static inline int crypto_sha256_update(struct shash_desc *desc, const u8 *data,
-				       unsigned int len, bool force_generic)
+static int crypto_sha256_update(struct shash_desc *desc,
+				const u8 *data, unsigned int len)
 {
-	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
-	int remain = len % SHA256_BLOCK_SIZE;
-
-	sctx->count += len - remain;
-	sha256_choose_blocks(sctx->state, data, len / SHA256_BLOCK_SIZE,
-			     force_generic, !force_generic);
-	return remain;
+	sha256_update(SHA256_CTX(desc), data, len);
+	return 0;
 }
 
-static int crypto_sha256_update_generic(struct shash_desc *desc, const u8 *data,
-					unsigned int len)
+static int crypto_sha256_final(struct shash_desc *desc, u8 *out)
 {
-	return crypto_sha256_update(desc, data, len, true);
+	sha256_final(SHA256_CTX(desc), out);
+	return 0;
 }
 
-static int crypto_sha256_update_lib(struct shash_desc *desc, const u8 *data,
-				    unsigned int len)
+static int crypto_sha256_digest(struct shash_desc *desc,
+				const u8 *data, unsigned int len, u8 *out)
 {
-	sha256_update(shash_desc_ctx(desc), data, len);
+	sha256(data, len, out);
 	return 0;
 }
 
-static int crypto_sha256_update_arch(struct shash_desc *desc, const u8 *data,
-				     unsigned int len)
-{
-	return crypto_sha256_update(desc, data, len, false);
-}
+/* HMAC-SHA224 */
 
-static int crypto_sha256_final_lib(struct shash_desc *desc, u8 *out)
-{
-	sha256_final(shash_desc_ctx(desc), out);
-	return 0;
-}
+#define HMAC_SHA224_KEY(tfm) ((struct hmac_sha224_key *)crypto_shash_ctx(tfm))
+#define HMAC_SHA224_CTX(desc) ((struct hmac_sha224_ctx *)shash_desc_ctx(desc))
 
-static __always_inline int crypto_sha256_finup(struct shash_desc *desc,
-					       const u8 *data,
-					       unsigned int len, u8 *out,
-					       bool force_generic)
+static int crypto_hmac_sha224_setkey(struct crypto_shash *tfm,
+				     const u8 *raw_key, unsigned int keylen)
 {
-	struct crypto_sha256_state *sctx = shash_desc_ctx(desc);
-	unsigned int remain = len;
-	u8 *buf;
-
-	if (len >= SHA256_BLOCK_SIZE)
-		remain = crypto_sha256_update(desc, data, len, force_generic);
-	sctx->count += remain;
-	buf = memcpy(sctx + 1, data + len - remain, remain);
-	sha256_finup(sctx, buf, remain, out,
-		     crypto_shash_digestsize(desc->tfm), force_generic,
-		     !force_generic);
+	hmac_sha224_preparekey(HMAC_SHA224_KEY(tfm), raw_key, keylen);
 	return 0;
 }
 
-static int crypto_sha256_finup_generic(struct shash_desc *desc, const u8 *data,
-				       unsigned int len, u8 *out)
+static int crypto_hmac_sha224_init(struct shash_desc *desc)
 {
-	return crypto_sha256_finup(desc, data, len, out, true);
+	hmac_sha224_init(HMAC_SHA224_CTX(desc), HMAC_SHA224_KEY(desc->tfm));
+	return 0;
 }
 
-static int crypto_sha256_finup_arch(struct shash_desc *desc, const u8 *data,
-				    unsigned int len, u8 *out)
+static int crypto_hmac_sha224_update(struct shash_desc *desc,
+				     const u8 *data, unsigned int len)
 {
-	return crypto_sha256_finup(desc, data, len, out, false);
+	hmac_sha224_update(HMAC_SHA224_CTX(desc), data, len);
+	return 0;
 }
 
-static int crypto_sha256_digest_generic(struct shash_desc *desc, const u8 *data,
-					unsigned int len, u8 *out)
+static int crypto_hmac_sha224_final(struct shash_desc *desc, u8 *out)
 {
-	crypto_sha256_init(desc);
-	return crypto_sha256_finup_generic(desc, data, len, out);
+	hmac_sha224_final(HMAC_SHA224_CTX(desc), out);
+	return 0;
 }
 
-static int crypto_sha256_digest_lib(struct shash_desc *desc, const u8 *data,
-				    unsigned int len, u8 *out)
+static int crypto_hmac_sha224_digest(struct shash_desc *desc,
+				     const u8 *data, unsigned int len,
+				     u8 *out)
 {
-	sha256(data, len, out);
+	hmac_sha224(HMAC_SHA224_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
-static int crypto_sha256_digest_arch(struct shash_desc *desc, const u8 *data,
-				     unsigned int len, u8 *out)
+/* HMAC-SHA256 */
+
+#define HMAC_SHA256_KEY(tfm) ((struct hmac_sha256_key *)crypto_shash_ctx(tfm))
+#define HMAC_SHA256_CTX(desc) ((struct hmac_sha256_ctx *)shash_desc_ctx(desc))
+
+static int crypto_hmac_sha256_setkey(struct crypto_shash *tfm,
+				     const u8 *raw_key, unsigned int keylen)
 {
-	crypto_sha256_init(desc);
-	return crypto_sha256_finup_arch(desc, data, len, out);
+	hmac_sha256_preparekey(HMAC_SHA256_KEY(tfm), raw_key, keylen);
+	return 0;
 }
 
-static int crypto_sha224_init(struct shash_desc *desc)
+static int crypto_hmac_sha256_init(struct shash_desc *desc)
 {
-	sha224_block_init(shash_desc_ctx(desc));
+	hmac_sha256_init(HMAC_SHA256_CTX(desc), HMAC_SHA256_KEY(desc->tfm));
 	return 0;
 }
 
-static int crypto_sha224_final_lib(struct shash_desc *desc, u8 *out)
+static int crypto_hmac_sha256_update(struct shash_desc *desc,
+				     const u8 *data, unsigned int len)
 {
-	sha224_final(shash_desc_ctx(desc), out);
+	hmac_sha256_update(HMAC_SHA256_CTX(desc), data, len);
 	return 0;
 }
 
-static int crypto_sha256_import_lib(struct shash_desc *desc, const void *in)
+static int crypto_hmac_sha256_final(struct shash_desc *desc, u8 *out)
 {
-	struct __sha256_ctx *sctx = shash_desc_ctx(desc);
-	const u8 *p = in;
-
-	memcpy(sctx, p, sizeof(*sctx));
-	p += sizeof(*sctx);
-	sctx->bytecount += *p;
+	hmac_sha256_final(HMAC_SHA256_CTX(desc), out);
 	return 0;
 }
 
-static int crypto_sha256_export_lib(struct shash_desc *desc, void *out)
+static int crypto_hmac_sha256_digest(struct shash_desc *desc,
+				     const u8 *data, unsigned int len,
+				     u8 *out)
 {
-	struct __sha256_ctx *sctx0 = shash_desc_ctx(desc);
-	struct __sha256_ctx sctx = *sctx0;
-	unsigned int partial;
-	u8 *p = out;
-
-	partial = sctx.bytecount % SHA256_BLOCK_SIZE;
-	sctx.bytecount -= partial;
-	memcpy(p, &sctx, sizeof(sctx));
-	p += sizeof(sctx);
-	*p = partial;
+	hmac_sha256(HMAC_SHA256_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+/* Algorithm definitions */
+
 static struct shash_alg algs[] = {
-	{
-		.base.cra_name		= "sha256",
-		.base.cra_driver_name	= "sha256-generic",
-		.base.cra_priority	= 100,
-		.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					  CRYPTO_AHASH_ALG_FINUP_MAX,
-		.base.cra_blocksize	= SHA256_BLOCK_SIZE,
-		.base.cra_module	= THIS_MODULE,
-		.digestsize		= SHA256_DIGEST_SIZE,
-		.init			= crypto_sha256_init,
-		.update			= crypto_sha256_update_generic,
-		.finup			= crypto_sha256_finup_generic,
-		.digest			= crypto_sha256_digest_generic,
-		.descsize		= sizeof(struct crypto_sha256_state),
-	},
 	{
 		.base.cra_name		= "sha224",
-		.base.cra_driver_name	= "sha224-generic",
-		.base.cra_priority	= 100,
-		.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					  CRYPTO_AHASH_ALG_FINUP_MAX,
+		.base.cra_driver_name	= "sha224-lib",
+		.base.cra_priority	= 300,
 		.base.cra_blocksize	= SHA224_BLOCK_SIZE,
 		.base.cra_module	= THIS_MODULE,
 		.digestsize		= SHA224_DIGEST_SIZE,
 		.init			= crypto_sha224_init,
-		.update			= crypto_sha256_update_generic,
-		.finup			= crypto_sha256_finup_generic,
-		.descsize		= sizeof(struct crypto_sha256_state),
+		.update			= crypto_sha224_update,
+		.final			= crypto_sha224_final,
+		.digest			= crypto_sha224_digest,
+		.descsize		= sizeof(struct sha224_ctx),
 	},
 	{
 		.base.cra_name		= "sha256",
 		.base.cra_driver_name	= "sha256-lib",
+		.base.cra_priority	= 300,
 		.base.cra_blocksize	= SHA256_BLOCK_SIZE,
 		.base.cra_module	= THIS_MODULE,
 		.digestsize		= SHA256_DIGEST_SIZE,
 		.init			= crypto_sha256_init,
-		.update			= crypto_sha256_update_lib,
-		.final			= crypto_sha256_final_lib,
-		.digest			= crypto_sha256_digest_lib,
+		.update			= crypto_sha256_update,
+		.final			= crypto_sha256_final,
+		.digest			= crypto_sha256_digest,
 		.descsize		= sizeof(struct sha256_ctx),
-		.statesize		= sizeof(struct crypto_sha256_state) +
-					  SHA256_BLOCK_SIZE + 1,
-		.import			= crypto_sha256_import_lib,
-		.export			= crypto_sha256_export_lib,
 	},
 	{
-		.base.cra_name		= "sha224",
-		.base.cra_driver_name	= "sha224-lib",
+		.base.cra_name		= "hmac(sha224)",
+		.base.cra_driver_name	= "hmac-sha224-lib",
+		.base.cra_priority	= 300,
 		.base.cra_blocksize	= SHA224_BLOCK_SIZE,
+		.base.cra_ctxsize	= sizeof(struct hmac_sha224_key),
 		.base.cra_module	= THIS_MODULE,
 		.digestsize		= SHA224_DIGEST_SIZE,
-		.init			= crypto_sha224_init,
-		.update			= crypto_sha256_update_lib,
-		.final			= crypto_sha224_final_lib,
-		.descsize		= sizeof(struct sha224_ctx),
-		.statesize		= sizeof(struct crypto_sha256_state) +
-					  SHA256_BLOCK_SIZE + 1,
-		.import			= crypto_sha256_import_lib,
-		.export			= crypto_sha256_export_lib,
+		.setkey			= crypto_hmac_sha224_setkey,
+		.init			= crypto_hmac_sha224_init,
+		.update			= crypto_hmac_sha224_update,
+		.final			= crypto_hmac_sha224_final,
+		.digest			= crypto_hmac_sha224_digest,
+		.descsize		= sizeof(struct hmac_sha224_ctx),
 	},
 	{
-		.base.cra_name		= "sha256",
-		.base.cra_driver_name	= "sha256-" __stringify(ARCH),
+		.base.cra_name		= "hmac(sha256)",
+		.base.cra_driver_name	= "hmac-sha256-lib",
 		.base.cra_priority	= 300,
-		.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					  CRYPTO_AHASH_ALG_FINUP_MAX,
 		.base.cra_blocksize	= SHA256_BLOCK_SIZE,
+		.base.cra_ctxsize	= sizeof(struct hmac_sha256_key),
 		.base.cra_module	= THIS_MODULE,
 		.digestsize		= SHA256_DIGEST_SIZE,
-		.init			= crypto_sha256_init,
-		.update			= crypto_sha256_update_arch,
-		.finup			= crypto_sha256_finup_arch,
-		.digest			= crypto_sha256_digest_arch,
-		.descsize		= sizeof(struct crypto_sha256_state),
-	},
-	{
-		.base.cra_name		= "sha224",
-		.base.cra_driver_name	= "sha224-" __stringify(ARCH),
-		.base.cra_priority	= 300,
-		.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					  CRYPTO_AHASH_ALG_FINUP_MAX,
-		.base.cra_blocksize	= SHA224_BLOCK_SIZE,
-		.base.cra_module	= THIS_MODULE,
-		.digestsize		= SHA224_DIGEST_SIZE,
-		.init			= crypto_sha224_init,
-		.update			= crypto_sha256_update_arch,
-		.finup			= crypto_sha256_finup_arch,
-		.descsize		= sizeof(struct crypto_sha256_state),
+		.setkey			= crypto_hmac_sha256_setkey,
+		.init			= crypto_hmac_sha256_init,
+		.update			= crypto_hmac_sha256_update,
+		.final			= crypto_hmac_sha256_final,
+		.digest			= crypto_hmac_sha256_digest,
+		.descsize		= sizeof(struct hmac_sha256_ctx),
 	},
 };
 
-static unsigned int num_algs;
-
 static int __init crypto_sha256_mod_init(void)
 {
-	/* register the arch flavours only if they differ from generic */
-	num_algs = ARRAY_SIZE(algs);
-	BUILD_BUG_ON(ARRAY_SIZE(algs) <= 2);
-	if (!sha256_is_arch_optimized())
-		num_algs -= 2;
 	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
 }
 module_init(crypto_sha256_mod_init);
 
 static void __exit crypto_sha256_mod_exit(void)
 {
-	crypto_unregister_shashes(algs, num_algs);
+	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
 }
 module_exit(crypto_sha256_mod_exit);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Crypto API wrapper for the SHA-256 and SHA-224 library functions");
+MODULE_DESCRIPTION("Crypto API support for SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256");
 
-MODULE_ALIAS_CRYPTO("sha256");
-MODULE_ALIAS_CRYPTO("sha256-generic");
-MODULE_ALIAS_CRYPTO("sha256-" __stringify(ARCH));
 MODULE_ALIAS_CRYPTO("sha224");
-MODULE_ALIAS_CRYPTO("sha224-generic");
-MODULE_ALIAS_CRYPTO("sha224-" __stringify(ARCH));
+MODULE_ALIAS_CRYPTO("sha224-lib");
+MODULE_ALIAS_CRYPTO("sha256");
+MODULE_ALIAS_CRYPTO("sha256-lib");
+MODULE_ALIAS_CRYPTO("hmac(sha224)");
+MODULE_ALIAS_CRYPTO("hmac-sha224-lib");
+MODULE_ALIAS_CRYPTO("hmac(sha256)");
+MODULE_ALIAS_CRYPTO("hmac-sha256-lib");
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 9d8b11ea4af7f..4e95567f7ed17 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4268,45 +4268,51 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "authenc(hmac(sha1),rfc3686(ctr(aes)))",
 		.test = alg_test_null,
 		.fips_allowed = 1,
 	}, {
 		.alg = "authenc(hmac(sha224),cbc(des))",
+		.generic_driver = "authenc(hmac-sha224-lib,cbc(des-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha224_des_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha224),cbc(des3_ede))",
+		.generic_driver = "authenc(hmac-sha224-lib,cbc(des3_ede-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha224_des3_ede_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha256),cbc(aes))",
+		.generic_driver = "authenc(hmac-sha256-lib,cbc(aes-generic))",
 		.test = alg_test_aead,
 		.fips_allowed = 1,
 		.suite = {
 			.aead = __VECS(hmac_sha256_aes_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha256),cbc(des))",
+		.generic_driver = "authenc(hmac-sha256-lib,cbc(des-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha256_des_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha256),cbc(des3_ede))",
+		.generic_driver = "authenc(hmac-sha256-lib,cbc(des3_ede-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha256_des3_ede_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha256),ctr(aes))",
 		.test = alg_test_null,
 		.fips_allowed = 1,
 	}, {
 		.alg = "authenc(hmac(sha256),cts(cbc(aes)))",
+		.generic_driver = "authenc(hmac-sha256-lib,cts(cbc(aes-generic)))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(krb5_test_aes128_cts_hmac_sha256_128)
 		}
 	}, {
@@ -5013,17 +5019,19 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.sig = __VECS(ecrdsa_tv_template)
 		}
 	}, {
 		.alg = "essiv(authenc(hmac(sha256),cbc(aes)),sha256)",
+		.generic_driver = "essiv(authenc(hmac-sha256-lib,cbc(aes-generic)),sha256-lib)",
 		.test = alg_test_aead,
 		.fips_allowed = 1,
 		.suite = {
 			.aead = __VECS(essiv_hmac_sha256_aes_cbc_tv_temp)
 		}
 	}, {
 		.alg = "essiv(cbc(aes),sha256)",
+		.generic_driver = "essiv(cbc(aes-generic),sha256-lib)",
 		.test = alg_test_skcipher,
 		.fips_allowed = 1,
 		.suite = {
 			.cipher = __VECS(essiv_aes_cbc_tv_template)
 		}
@@ -5119,17 +5127,19 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(hmac_sha1_tv_template)
 		}
 	}, {
 		.alg = "hmac(sha224)",
+		.generic_driver = "hmac-sha224-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(hmac_sha224_tv_template)
 		}
 	}, {
 		.alg = "hmac(sha256)",
+		.generic_driver = "hmac-sha256-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(hmac_sha256_tv_template)
 		}
@@ -5457,17 +5467,19 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(sha1_tv_template)
 		}
 	}, {
 		.alg = "sha224",
+		.generic_driver = "sha224-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(sha224_tv_template)
 		}
 	}, {
 		.alg = "sha256",
+		.generic_driver = "sha256-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(sha256_tv_template)
 		}
diff --git a/drivers/crypto/img-hash.c b/drivers/crypto/img-hash.c
index e050f5ff5efb6..f312eb075feca 100644
--- a/drivers/crypto/img-hash.c
+++ b/drivers/crypto/img-hash.c
@@ -708,16 +708,16 @@ static int img_hash_cra_sha1_init(struct crypto_tfm *tfm)
 	return img_hash_cra_init(tfm, "sha1-generic");
 }
 
 static int img_hash_cra_sha224_init(struct crypto_tfm *tfm)
 {
-	return img_hash_cra_init(tfm, "sha224-generic");
+	return img_hash_cra_init(tfm, "sha224-lib");
 }
 
 static int img_hash_cra_sha256_init(struct crypto_tfm *tfm)
 {
-	return img_hash_cra_init(tfm, "sha256-generic");
+	return img_hash_cra_init(tfm, "sha256-lib");
 }
 
 static void img_hash_cra_exit(struct crypto_tfm *tfm)
 {
 	struct img_hash_ctx *tctx = crypto_tfm_ctx(tfm);
diff --git a/drivers/crypto/starfive/jh7110-hash.c b/drivers/crypto/starfive/jh7110-hash.c
index 4abbff07412ff..6cfe0238f615f 100644
--- a/drivers/crypto/starfive/jh7110-hash.c
+++ b/drivers/crypto/starfive/jh7110-hash.c
@@ -491,17 +491,17 @@ static int starfive_hash_setkey(struct crypto_ahash *hash,
 	return starfive_hash_long_setkey(ctx, key, keylen, alg_name);
 }
 
 static int starfive_sha224_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "sha224-generic",
+	return starfive_hash_init_tfm(hash, "sha224-lib",
 				      STARFIVE_HASH_SHA224, 0);
 }
 
 static int starfive_sha256_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "sha256-generic",
+	return starfive_hash_init_tfm(hash, "sha256-lib",
 				      STARFIVE_HASH_SHA256, 0);
 }
 
 static int starfive_sha384_init_tfm(struct crypto_ahash *hash)
 {
@@ -521,17 +521,17 @@ static int starfive_sm3_init_tfm(struct crypto_ahash *hash)
 				      STARFIVE_HASH_SM3, 0);
 }
 
 static int starfive_hmac_sha224_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "hmac(sha224-generic)",
+	return starfive_hash_init_tfm(hash, "hmac-sha224-lib",
 				      STARFIVE_HASH_SHA224, 1);
 }
 
 static int starfive_hmac_sha256_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "hmac(sha256-generic)",
+	return starfive_hash_init_tfm(hash, "hmac-sha256-lib",
 				      STARFIVE_HASH_SHA256, 1);
 }
 
 static int starfive_hmac_sha384_init_tfm(struct crypto_ahash *hash)
 {
-- 
2.50.0


