Return-Path: <linuxppc-dev+bounces-10224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DD4B02DE9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8c4F8Vz3by8;
	Sun, 13 Jul 2025 09:26:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362800;
	cv=none; b=f8S9P0E3jde8kUBQLJ+JZ+YMSrA1QRAeyduGakKdwaV0lrmgCpL9Gj9YhKj2aTRoCfzeip9dRTYMrG4wAhE1Y8oz7HwTa1sprCyHvpf01D0QRb95BfSN4D1/GdmxW7B/r6nC8PlU1TrM7ldlpPndEoO/O+b5vbD24HVGuBzjMTd3tc94PfkIHAQr8TJjf561yItg7+EfqPFbYWL+TSybR+yuZDsqAkVIugSJjPmTWFp8JJWVVhnjg4c7PUIeTtNL1YdsxTa9TTAX+TXnnScnDFI3lkH1ATPNlIevFirSliA57VWsrfgeOk9S8F1zKkujXRw/XR456odn6Q8tOuyWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362800; c=relaxed/relaxed;
	bh=9TMsLZO1bpTAJZJK7qrcR2GqkeUprp3/YrV3Ia6Gi5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ar1f2qHgtxqiY1zah/g8JkyKvU3NH3vGt2OlXy3Gn++tHtcSXcjwVybT+fYhR5h1kjmikl04/1x8VVoOLWR3Bk5RTeSIf0pKl83TWwiz8clY6m4jHLgZxmvq3oZTcRbQLu0erboHoJJhc39/D2OMaINl4b5mt2H5fkF74eAN9zzbscTuGMoPbD/SVQify6Mfhuca3fTqyOE8WTopcwg1ZjVmN84YyGVmZaAij7y8ZH8Yztg8LWcwOdvayYn1AhLG77t53tRu/FMSn7hj9UzVvwlJZkNbzd98Nfo8ubdf/VPGDKgVroqTqUros25NuYNhU8DfDuX7NniTwl3jHe1s2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WtGAriuO; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WtGAriuO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8T1kv0z3bqM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE48461132;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5734BC4CEF5;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362789;
	bh=KDQk7Ir1m956D0f1p9m7xAyJlDKZMG/Uv5S3nHotAXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtGAriuOY7k91SmjWU1Jatz3UxR2BoHMvt2+41ewmLk75abevvy+rjaJDEKA9dayT
	 4HnruTxiMdXn9C2lbXUTYijPl6AGxeUiVHGzv2Mci1g3kf1n8j8iqK/Gw4UhDfA1OM
	 LEGQqPAvwRxD68ZByGUo/zfUhFtcAtZjF5EdvVBpUtFrWQZfMdAZzLC+bqW3uQZhM0
	 78Q9KCitYCnlEFnRK/ju2eh+jLK5DHwcHu4G++4VwfzzEeTmEfmKN7aI+ajzvGYgYp
	 L16hAYEY2uFqQu6UpZuTAuo837yuo7jq8gjxWFDQqb9fzhSIEx19EAKXI/j3/CqaeY
	 kvMR31cHKCF7g==
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
Subject: [PATCH 20/26] lib/digsig: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:11 -0700
Message-ID: <20250712232329.818226-21-ebiggers@kernel.org>
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

Use the SHA-1 library functions instead of crypto_shash.  This is
simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/Kconfig  |  3 +--
 lib/digsig.c | 46 ++++++----------------------------------------
 2 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index 37db228f70a99..670c19800c26c 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -561,12 +561,11 @@ config MPILIB
 	  which is used by IMA/EVM digital signature extension.
 
 config SIGNATURE
 	tristate
 	depends on KEYS
-	select CRYPTO
-	select CRYPTO_SHA1
+	select CRYPTO_LIB_SHA1
 	select MPILIB
 	help
 	  Digital signature verification. Currently only RSA is supported.
 	  Implementation is done using GnuPG MPI library
 
diff --git a/lib/digsig.c b/lib/digsig.c
index 04b5e55ed95f5..5ddcc52f76863 100644
--- a/lib/digsig.c
+++ b/lib/digsig.c
@@ -16,19 +16,15 @@
 
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/key.h>
-#include <linux/crypto.h>
-#include <crypto/hash.h>
 #include <crypto/sha1.h>
 #include <keys/user-type.h>
 #include <linux/mpi.h>
 #include <linux/digsig.h>
 
-static struct crypto_shash *shash;
-
 static const char *pkcs_1_v1_5_decode_emsa(const unsigned char *msg,
 						unsigned long  msglen,
 						unsigned long  modulus_bitlen,
 						unsigned long *outlen)
 {
@@ -197,16 +193,16 @@ static int digsig_verify_rsa(struct key *key,
  *
  */
 int digsig_verify(struct key *keyring, const char *sig, int siglen,
 						const char *data, int datalen)
 {
-	int err = -ENOMEM;
 	struct signature_hdr *sh = (struct signature_hdr *)sig;
-	struct shash_desc *desc = NULL;
+	struct sha1_ctx ctx;
 	unsigned char hash[SHA1_DIGEST_SIZE];
 	struct key *key;
 	char name[20];
+	int err;
 
 	if (siglen < sizeof(*sh) + 2)
 		return -EINVAL;
 
 	if (sh->algo != PUBKEY_ALGO_RSA)
@@ -229,51 +225,21 @@ int digsig_verify(struct key *keyring, const char *sig, int siglen,
 	if (IS_ERR(key)) {
 		pr_err("key not found, id: %s\n", name);
 		return PTR_ERR(key);
 	}
 
-	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(shash),
-		       GFP_KERNEL);
-	if (!desc)
-		goto err;
-
-	desc->tfm = shash;
-
-	crypto_shash_init(desc);
-	crypto_shash_update(desc, data, datalen);
-	crypto_shash_update(desc, sig, sizeof(*sh));
-	crypto_shash_final(desc, hash);
-
-	kfree(desc);
+	sha1_init(&ctx);
+	sha1_update(&ctx, data, datalen);
+	sha1_update(&ctx, sig, sizeof(*sh));
+	sha1_final(&ctx, hash);
 
 	/* pass signature mpis address */
 	err = digsig_verify_rsa(key, sig + sizeof(*sh), siglen - sizeof(*sh),
 			     hash, sizeof(hash));
 
-err:
 	key_put(key);
 
 	return err ? -EINVAL : 0;
 }
 EXPORT_SYMBOL_GPL(digsig_verify);
 
-static int __init digsig_init(void)
-{
-	shash = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(shash)) {
-		pr_err("shash allocation failed\n");
-		return  PTR_ERR(shash);
-	}
-
-	return 0;
-
-}
-
-static void __exit digsig_cleanup(void)
-{
-	crypto_free_shash(shash);
-}
-
-module_init(digsig_init);
-module_exit(digsig_cleanup);
-
 MODULE_LICENSE("GPL");
-- 
2.50.1


