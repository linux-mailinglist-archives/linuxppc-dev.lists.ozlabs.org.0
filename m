Return-Path: <linuxppc-dev+bounces-2794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E379BA891
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 23:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhTqz1Rxbz2y8q;
	Mon,  4 Nov 2024 09:32:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730673151;
	cv=none; b=dOPUjZxhbOALjgLT8pH3DhUY2J90JqOOx5nMVwCpZfe3lBXrdVXAFf5Pw59QlwArBv13a5dgayxHATgdvEOzUljN5xMBdXOEoFjVEUcuyJyQuECekv7zykJr+Gl+HxoAbrlQ+2lXiq3n/SA/6kFZVintHz7kfrSWOhzYzUaZENbeuu3f7C2yahqQYJUDzDmXPaMmjHfIxHhykwP+S8C2GnjyU3MiU8PmDb56jd3VHS6RSlD8hpKHnTWVcCMJzdjpQYLrYCqFMpYpcjWAk1JiSM2EiIQpEZf7Sjc5eSD5kTglDdjBY8zrtapeqMOc2BGpbQNdWewheVZqHfBzRmoOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730673151; c=relaxed/relaxed;
	bh=t5Y0QqOSqKhVyDS/Dxio6XA90bc6k/m0aGaSN9hstAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tzo0EwAbdEunbXT3lCXMVp4K8TmFlzotq8QqPRSBfXqnERtcOI8JKewmc81ChCy2BULyA9XDwr/57FYrRLH+TG+4QyyhFRNaGEk/oCfwnXalWq/ycowAg3qganCr0B82ZhY+e13vZKznCvFFQxPI81oMprWt+J2BUuex1GvBpTjKe5MwRh9JYmnEBCSx5phBBOteXhbZM5sSWxinDt2CxWcOeyvVKgkabg4VP+wyu/c8Frq0IEgFvfAJBCdNVGzkILUmG0ekQgA0n/BtaUWTNFx3Z8swIJTlveXaJriomFfGWDw2CsAFBd+AwY3avO9IHRh2jHyEW8HE4JpypiaNDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLEXF5On; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FLEXF5On;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhTqy03Cgz2yGs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 09:32:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3520BA41F26;
	Sun,  3 Nov 2024 22:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3C1C4CED6;
	Sun,  3 Nov 2024 22:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730673146;
	bh=tFO0F6yNPt11cX0x9fLuUHzrKqGkpHig/cPtPasc7Zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLEXF5OnjtoHBLz2W1SudB1KfgQeNbVamfWQca0Lr3ls4Ajd6zui8pPZphDG8wGHi
	 LMeOxQgpUfQZBOrr9Xxbh82UmIw4KF07FJGWQHV31qEzfhzAW4QITRvihj6T8dNJwD
	 7VM4SISyDF+9nWY8v1TcdePZO8vlrUSxuR0C2sAycL5JfMzno08WrlDBIWB428LYwV
	 H74oQ1WRR+qGqF2fzD79IPcenVru6oQPFG/aiSVpU1viylHUP1PVVW0SlpHWBah85+
	 GLRmjZ4czJdS+k2WUI0O0AY7XjAnn6mserV11No6DhCIo1gKixC/7dgNgepAp/Vyod
	 VKf8STCElVs0g==
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
	x86@kernel.org
Subject: [PATCH v3 04/18] crypto: crc32 - don't unnecessarily register arch algorithms
Date: Sun,  3 Nov 2024 14:31:40 -0800
Message-ID: <20241103223154.136127-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Instead of registering the crc32-$arch and crc32c-$arch algorithms if
the arch-specific code was built, only register them when that code was
built *and* is not falling back to the base implementation at runtime.

This avoids confusing users like btrfs which checks the shash driver
name to determine whether it is crc32c-generic.

(It would also make sense to change btrfs to test the crc32_optimization
flags itself, so that it doesn't have to use the weird hack of parsing
the driver name.  This change still makes sense either way though.)

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/crc32_generic.c  | 8 ++++++--
 crypto/crc32c_generic.c | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
index cc064ea8240e..783a30b27398 100644
--- a/crypto/crc32_generic.c
+++ b/crypto/crc32_generic.c
@@ -155,19 +155,23 @@ static struct shash_alg algs[] = {{
 	.base.cra_ctxsize	= sizeof(u32),
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_init		= crc32_cra_init,
 }};
 
+static int num_algs;
+
 static int __init crc32_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+	num_algs = 1 + ((crc32_optimizations() & CRC32_LE_OPTIMIZATION) != 0);
+
+	return crypto_register_shashes(algs, num_algs);
 }
 
 static void __exit crc32_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+	crypto_unregister_shashes(algs, num_algs);
 }
 
 subsys_initcall(crc32_mod_init);
 module_exit(crc32_mod_fini);
 
diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
index 04b03d825cf4..985da981d6e2 100644
--- a/crypto/crc32c_generic.c
+++ b/crypto/crc32c_generic.c
@@ -195,19 +195,23 @@ static struct shash_alg algs[] = {{
 	.base.cra_ctxsize	= sizeof(struct chksum_ctx),
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_init		= crc32c_cra_init,
 }};
 
+static int num_algs;
+
 static int __init crc32c_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+	num_algs = 1 + ((crc32_optimizations() & CRC32C_OPTIMIZATION) != 0);
+
+	return crypto_register_shashes(algs, num_algs);
 }
 
 static void __exit crc32c_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+	crypto_unregister_shashes(algs, num_algs);
 }
 
 subsys_initcall(crc32c_mod_init);
 module_exit(crc32c_mod_fini);
 
-- 
2.47.0


