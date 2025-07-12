Return-Path: <linuxppc-dev+bounces-10206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9279AB02DA4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:27:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8N1CtGz3bkb;
	Sun, 13 Jul 2025 09:26:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362788;
	cv=none; b=ln0rPJy6c0ICsWcKzSNdmQn+oW6y5ua/5vo2X5Ljtrv6VfcKIqxRWY5X2+ebkc9gSnFl8GEwxHascJW12kwMZ7xMxQ+FqhLZu6QAj+IHWdcU19EMR2+EfJvA6/JxZoSHne5sY89/lXJJym2UDIDVqeEKanwfrncBI9VJueGI5aBzZ1y3A2BXyEBj9kpJ+KdYrs7U52E3OuiPQrbSIRGKgfEWlmVWzbayuKOFf5gcnz8kNyLq3luOwuoK1EXm3xbLnE4bA7MAsWLkf/j4N6rKSLkWi9DSHnpC+Zi402cBIPVpl2fQpyYN2CiEZXiAz8cqbzT/YSuFLQAkBHmiF99JKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362788; c=relaxed/relaxed;
	bh=1abNJfl1xsUHUqVZktCpcmgxptnywOe0C82GJUxJZGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVnZBk9JFzvh0xAoknpZWFXhpPWCEvHLGK+rye1YA+L+xNqs5arY477p+yXJYeVCuCjLmdwDRA/CsG3ichlF+cV8UVCwM/bPZE6eXHlI66YQj+cTvHas862RQXOjrKin5AAU/Q8qDlNVwSvHsvHfzkCsk1DjYZjXaXsVfs0E8uJQcmFrHmy8nIzC5OfZzc0O/ANgn1mk5Xm2ix8j47Tej+qQVmA5qhXFNA70DgP2LJ7b5zSHRhdPfdthD+tQ80UrcR+e8ujsS0XCDgN4Aw1w4wgjQN/RObU+3+oL5I9A2eKiHU4D8VQJdL0ZPO8PdPI4zy9jDXoZ7fUBTgs97bSvig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8YbndeO; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8YbndeO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8K6J86z3bV6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 684675C5567;
	Sat, 12 Jul 2025 23:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA18C4CEF5;
	Sat, 12 Jul 2025 23:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362783;
	bh=n359i41djwWU+CGbW44dWKxffZV+egIZKibwbQ46oIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K8YbndeO+dMZGy3v3A29yW4ag3kUQJAE3I0HlAMkkp1SkG9D5Q8ojJFLySi0YHm/Q
	 DRNs3LUUmZe7vOScPcD8GdnNrJN4Iynsvd5PuxN51Ri5Zz/OD9JnoVqZDgBIspgBZJ
	 uLEJF8hZ5RNCal9KNkWNmPI/OT8wlhEAjp4pxLD5WSJQEWvDhJKpiwtoPs7t2CPqZl
	 fxjRCRMHRBzbHPJ4jp1LbQppuQU8wI8Wq3MjL2iMdrvaTQU8yofE9FK0aqLGCan2iw
	 ufT012XOOlulVEJ5QKifmXRld5x5wGSlbRCejtvEMqX6JadX77XNhU3+YbvUfUuJlB
	 CLnVb3YUz8dmA==
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
Subject: [PATCH 06/26] crypto: sha1 - Use same state format as legacy drivers
Date: Sat, 12 Jul 2025 16:22:57 -0700
Message-ID: <20250712232329.818226-7-ebiggers@kernel.org>
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

Same as sha256 and sha512: Use the state format that the generic partial
block handling code produces, as requested by Herbert, even though this
is applicable only to legacy drivers.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha1.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/crypto/sha1.c b/crypto/sha1.c
index 00e273b0401db..ecef4bf2d9c00 100644
--- a/crypto/sha1.c
+++ b/crypto/sha1.c
@@ -10,10 +10,47 @@
 #include <crypto/internal/hash.h>
 #include <crypto/sha1.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+/*
+ * Export and import functions.  crypto_shash wants a particular format that
+ * matches that used by some legacy drivers.  It currently is the same as the
+ * library SHA context, except the value in bytecount must be block-aligned and
+ * the remainder must be stored in an extra u8 appended to the struct.
+ */
+
+#define SHA1_SHASH_STATE_SIZE (sizeof(struct sha1_ctx) + 1)
+static_assert(sizeof(struct sha1_ctx) == sizeof(struct sha1_state));
+static_assert(offsetof(struct sha1_ctx, state) == offsetof(struct sha1_state, state));
+static_assert(offsetof(struct sha1_ctx, bytecount) == offsetof(struct sha1_state, count));
+static_assert(offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer));
+
+static int __crypto_sha1_export(const struct sha1_ctx *ctx0, void *out)
+{
+	struct sha1_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount % SHA1_BLOCK_SIZE;
+	ctx.bytecount -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
+	return 0;
+}
+
+static int __crypto_sha1_import(struct sha1_ctx *ctx, const void *in)
+{
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount += *p;
+	return 0;
+}
+
 const u8 sha1_zero_message_hash[SHA1_DIGEST_SIZE] = {
 	0xda, 0x39, 0xa3, 0xee, 0x5e, 0x6b, 0x4b, 0x0d,
 	0x32, 0x55, 0xbf, 0xef, 0x95, 0x60, 0x18, 0x90,
 	0xaf, 0xd8, 0x07, 0x09
 };
@@ -45,10 +82,20 @@ static int crypto_sha1_digest(struct shash_desc *desc,
 {
 	sha1(data, len, out);
 	return 0;
 }
 
+static int crypto_sha1_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha1_export(SHA1_CTX(desc), out);
+}
+
+static int crypto_sha1_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha1_import(SHA1_CTX(desc), in);
+}
+
 #define HMAC_SHA1_KEY(tfm) ((struct hmac_sha1_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA1_CTX(desc) ((struct hmac_sha1_ctx *)shash_desc_ctx(desc))
 
 static int crypto_hmac_sha1_setkey(struct crypto_shash *tfm,
 				   const u8 *raw_key, unsigned int keylen)
@@ -81,10 +128,23 @@ static int crypto_hmac_sha1_digest(struct shash_desc *desc,
 {
 	hmac_sha1(HMAC_SHA1_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha1_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha1_export(&HMAC_SHA1_CTX(desc)->sha_ctx, out);
+}
+
+static int crypto_hmac_sha1_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha1_ctx *ctx = HMAC_SHA1_CTX(desc);
+
+	ctx->ostate = HMAC_SHA1_KEY(desc->tfm)->ostate;
+	return __crypto_sha1_import(&ctx->sha_ctx, in);
+}
+
 static struct shash_alg algs[] = {
 	{
 		.base.cra_name		= "sha1",
 		.base.cra_driver_name	= "sha1-lib",
 		.base.cra_priority	= 300,
@@ -93,11 +153,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA1_DIGEST_SIZE,
 		.init			= crypto_sha1_init,
 		.update			= crypto_sha1_update,
 		.final			= crypto_sha1_final,
 		.digest			= crypto_sha1_digest,
+		.export			= crypto_sha1_export,
+		.import			= crypto_sha1_import,
 		.descsize		= sizeof(struct sha1_ctx),
+		.statesize		= SHA1_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha1)",
 		.base.cra_driver_name	= "hmac-sha1-lib",
 		.base.cra_priority	= 300,
@@ -108,11 +171,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha1_setkey,
 		.init			= crypto_hmac_sha1_init,
 		.update			= crypto_hmac_sha1_update,
 		.final			= crypto_hmac_sha1_final,
 		.digest			= crypto_hmac_sha1_digest,
+		.export			= crypto_hmac_sha1_export,
+		.import			= crypto_hmac_sha1_import,
 		.descsize		= sizeof(struct hmac_sha1_ctx),
+		.statesize		= SHA1_SHASH_STATE_SIZE,
 	},
 };
 
 static int __init crypto_sha1_mod_init(void)
 {
-- 
2.50.1


