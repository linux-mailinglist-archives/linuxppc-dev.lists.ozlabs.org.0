Return-Path: <linuxppc-dev+bounces-9931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEEEAEE3A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:11:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1t5RrVz3bmy;
	Tue,  1 Jul 2025 02:09:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299777;
	cv=none; b=bL1vPiue9wr/dOnpDOMQGoMPKm7sqLKpZYpCFaEBfA0Enm4LuFl+mCHqT7NnOSufb1Pe0upNVr+PvOd74fM5jz7IvQn6ZDHVq9XKqcw64/2hpnMCnsb0SuezbNz3Uf6dTkFBiobq9tXehxzA+zFAJ5DOlX740rZ9ug4NeWBaOfxLv2lJhSJWpdFODuQQyJWYqcV7x/7bM2hpxXallER9DYqHHsqum74dhhnrUPztS3nbdC+hgn49qfxrLidoVkJthrTRQNX8WD5XHg/iiW23Vo29KbtdwwkBJ6MCJoj91BgExEjVwgDPdsV3hPQ0uvq5YbdFd0nl3KNKA5QEOWVHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299777; c=relaxed/relaxed;
	bh=GI+baXLMItSjgcBMZ7twd6x6pbRFh6QmlEtpG5t/zdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tv8H2tPO63SBhDOTjmk+AwAPFnMI7kxQe+klEfXTIvjmH4YmeoP238JZt3vdY60oTy0v8SipxiCOXL8DfdVuCqaV3t3w1RKVCFLH8oTwCWxMTcNbqESV2FvXp5dISSV9IVNiowARL1RedT4XxvNCfPI08xDJo/QSs3J8QrL2edXXMInUi2cRGFSpsdMmmONO1K0yQ2m35G1OG1Ed2yOYmuq7hGE8AOFQm+UW6oNQrF9C0HAzITlJQ+dCDLN58zwqYBn+dyodOkXQeb83B+yfPjvOyaO24yeHyeS4ANRF89Y+cN6t6yMyr6LfaYlgooiTVJzHUuJyNxiSRIvxs43cww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVQBIRMj; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hVQBIRMj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1l5N8Tz3bsq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 049505C5D4C;
	Mon, 30 Jun 2025 16:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA14C4CEF3;
	Mon, 30 Jun 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299765;
	bh=IkX8c809Bkwa5YKNS0n0XaW5ZPy/jAKfSUJXB4aJ5O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hVQBIRMj89xj2I1q9MVzVBAjICgLzgrDPQGlkMEPYi6HkkfGwSqIKdUNwVzeBw43u
	 pLMZD2xvvsNNH+fstFXvgHc0S/K+L2xVKEbMCCPCufoZ0/heTewIkqVByYK1ZWhTw0
	 Hy2bV8iB2xINx5piSLStSpNhwTM8MqnEaLYJw7KNKk6zF0ZAJp4VPXHfuIPzb8qigv
	 gq/sjjO5QScDsTz4EmKmYti8u4FJjxfBDkmAGV/fHoJ21l17GLfNAP/9dbDQMNXKoT
	 xIgK7YllgkWIiNyIBpu/iZEwvbi6yxZxIbsudqsZ7UWS67uj446XOxPtm5262mi0PL
	 /HoSYTOI/uH3w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 10/14] crypto: sha256 - Use same state format as legacy drivers
Date: Mon, 30 Jun 2025 09:06:41 -0700
Message-ID: <20250630160645.3198-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Make the export and import functions for the sha224, sha256,
hmac(sha224), and hmac(sha256) shash algorithms use the same format as
the padlock-sha and nx-sha256 drivers, as required by Herbert.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha256.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/crypto/sha256.c b/crypto/sha256.c
index d81166cbba953..052806559f06c 100644
--- a/crypto/sha256.c
+++ b/crypto/sha256.c
@@ -11,10 +11,47 @@
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+/*
+ * Export and import functions.  crypto_shash wants a particular format that
+ * matches that used by some legacy drivers.  It currently is the same as the
+ * library SHA context, except the value in bytecount must be block-aligned and
+ * the remainder must be stored in an extra u8 appended to the struct.
+ */
+
+#define SHA256_SHASH_STATE_SIZE 105
+static_assert(offsetof(struct __sha256_ctx, state) == 0);
+static_assert(offsetof(struct __sha256_ctx, bytecount) == 32);
+static_assert(offsetof(struct __sha256_ctx, buf) == 40);
+static_assert(sizeof(struct __sha256_ctx) + 1 == SHA256_SHASH_STATE_SIZE);
+
+static int __crypto_sha256_export(const struct __sha256_ctx *ctx0, void *out)
+{
+	struct __sha256_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount % SHA256_BLOCK_SIZE;
+	ctx.bytecount -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
+	return 0;
+}
+
+static int __crypto_sha256_import(struct __sha256_ctx *ctx, const void *in)
+{
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount += *p;
+	return 0;
+}
+
 /* SHA-224 */
 
 const u8 sha224_zero_message_hash[SHA224_DIGEST_SIZE] = {
 	0xd1, 0x4a, 0x02, 0x8c, 0x2a, 0x3a, 0x2b, 0xc9, 0x47,
 	0x61, 0x02, 0xbb, 0x28, 0x82, 0x34, 0xc4, 0x15, 0xa2,
@@ -49,10 +86,20 @@ static int crypto_sha224_digest(struct shash_desc *desc,
 {
 	sha224(data, len, out);
 	return 0;
 }
 
+static int crypto_sha224_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&SHA224_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha224_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha256_import(&SHA224_CTX(desc)->ctx, in);
+}
+
 /* SHA-256 */
 
 const u8 sha256_zero_message_hash[SHA256_DIGEST_SIZE] = {
 	0xe3, 0xb0, 0xc4, 0x42, 0x98, 0xfc, 0x1c, 0x14,
 	0x9a, 0xfb, 0xf4, 0xc8, 0x99, 0x6f, 0xb9, 0x24,
@@ -87,10 +134,20 @@ static int crypto_sha256_digest(struct shash_desc *desc,
 {
 	sha256(data, len, out);
 	return 0;
 }
 
+static int crypto_sha256_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&SHA256_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha256_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha256_import(&SHA256_CTX(desc)->ctx, in);
+}
+
 /* HMAC-SHA224 */
 
 #define HMAC_SHA224_KEY(tfm) ((struct hmac_sha224_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA224_CTX(desc) ((struct hmac_sha224_ctx *)shash_desc_ctx(desc))
 
@@ -126,10 +183,23 @@ static int crypto_hmac_sha224_digest(struct shash_desc *desc,
 {
 	hmac_sha224(HMAC_SHA224_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha224_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&HMAC_SHA224_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha224_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha224_ctx *ctx = HMAC_SHA224_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA224_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha256_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* HMAC-SHA256 */
 
 #define HMAC_SHA256_KEY(tfm) ((struct hmac_sha256_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA256_CTX(desc) ((struct hmac_sha256_ctx *)shash_desc_ctx(desc))
 
@@ -165,10 +235,23 @@ static int crypto_hmac_sha256_digest(struct shash_desc *desc,
 {
 	hmac_sha256(HMAC_SHA256_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha256_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&HMAC_SHA256_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha256_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha256_ctx *ctx = HMAC_SHA256_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA256_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha256_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* Algorithm definitions */
 
 static struct shash_alg algs[] = {
 	{
 		.base.cra_name		= "sha224",
@@ -179,11 +262,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA224_DIGEST_SIZE,
 		.init			= crypto_sha224_init,
 		.update			= crypto_sha224_update,
 		.final			= crypto_sha224_final,
 		.digest			= crypto_sha224_digest,
+		.export			= crypto_sha224_export,
+		.import			= crypto_sha224_import,
 		.descsize		= sizeof(struct sha224_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "sha256",
 		.base.cra_driver_name	= "sha256-lib",
 		.base.cra_priority	= 300,
@@ -192,11 +278,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA256_DIGEST_SIZE,
 		.init			= crypto_sha256_init,
 		.update			= crypto_sha256_update,
 		.final			= crypto_sha256_final,
 		.digest			= crypto_sha256_digest,
+		.export			= crypto_sha256_export,
+		.import			= crypto_sha256_import,
 		.descsize		= sizeof(struct sha256_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha224)",
 		.base.cra_driver_name	= "hmac-sha224-lib",
 		.base.cra_priority	= 300,
@@ -207,11 +296,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha224_setkey,
 		.init			= crypto_hmac_sha224_init,
 		.update			= crypto_hmac_sha224_update,
 		.final			= crypto_hmac_sha224_final,
 		.digest			= crypto_hmac_sha224_digest,
+		.export			= crypto_hmac_sha224_export,
+		.import			= crypto_hmac_sha224_import,
 		.descsize		= sizeof(struct hmac_sha224_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha256)",
 		.base.cra_driver_name	= "hmac-sha256-lib",
 		.base.cra_priority	= 300,
@@ -222,11 +314,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha256_setkey,
 		.init			= crypto_hmac_sha256_init,
 		.update			= crypto_hmac_sha256_update,
 		.final			= crypto_hmac_sha256_final,
 		.digest			= crypto_hmac_sha256_digest,
+		.export			= crypto_hmac_sha256_export,
+		.import			= crypto_hmac_sha256_import,
 		.descsize		= sizeof(struct hmac_sha256_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 };
 
 static int __init crypto_sha256_mod_init(void)
 {
-- 
2.50.0


