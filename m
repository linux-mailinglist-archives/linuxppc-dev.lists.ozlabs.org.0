Return-Path: <linuxppc-dev+bounces-11840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53CB47793
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 23:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cK64L6nYYz3cyg;
	Sun,  7 Sep 2025 07:37:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757194626;
	cv=none; b=LUroEIOQbs7LEsalD5rm6unsXGYCgDWH6030WHdlnb5L9iWWlbdW0if7eTILo3pfLxLppwQRUMHR6GK2CAk0pjsloUFGJRd+cs/nMJGNw09ucsmWjtTlkrUPqZIOsrdK32OvAn/O/OzPN9yNPumkfpJ+p/0kzIOIzZyEaj8/h8y+LVYHzRhWcsfmwGq1AAelpD3msfEJA9E5sH4XCsa2DJR7LXLxGFoQvwW3n3/t7XWjTcj2bU+eKowuRDcx8mzm+92OA8AgLJwq9bRE9fq6tDxyGPs3GlopLOaea2GAVfA6oW/aHkmQKANr+qXXaQJysq1k+NDRCoDB13Pdw4d/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757194626; c=relaxed/relaxed;
	bh=RkCfNQSMCduwcUT3pMyREmC3tJV9XQ6M4+jKDSwW4KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c096je1l5STAHUpcBOqmKQ73beA7QLq7pgFwvVZorh6+8TxOMJtcveCPP4sXDe/nTLE55/N6u7SPHmJEnkEFQ0FO7GDH3qgclj+jB3P4V2F/NIQ7MkcR/ciwgFcfgcm8nfU/xi3UdrSl82ahzEsLsk2tQiAjvYM4qcM15zIwLPwKFHxRJLVKOjwC758XBNKxvA6NGouys8SsXSjTN4Q4mg+lZdnD0ATcexuivmW0HjV1u41ioED/HwEgntvMRBn1yypXYF5w4ghLbxRcFyTZHoM7xT3Cv0opBahqUkC860hfk1HcwLvORPrQrEFvkisrGwYEUOlCxN+hfkxEg9A72w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vC0Kr4aV; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vC0Kr4aV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cK64K52ygz3cn9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 07:37:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ACA04523C;
	Sat,  6 Sep 2025 21:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9174EC4CEF5;
	Sat,  6 Sep 2025 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194625;
	bh=CQJ4knDhIHFMSRh4/nbpAJJmql9MOH99GJgLFyWdS58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vC0Kr4aV2MDmbVpnymLdTPEZrGi3BkuR7l6W7PpSF5Hy0JlNrPuytbWgARqDEFWa4
	 ksLj7ObBc4HIiTFQnpZraghc+4ZAxZ7ioXuydpWTZ4MELVghPd1RD7aXGCEXCeaOW1
	 87lHedKJzwLvy+1jTtDOo8Q2kz37c7gTztVpg1RWvKqgWwEevXx4sJ2+upJpJHZY21
	 91QIKZ38fMjYyYaN9kYVmNqvpfM9y0gmOPzDzCCtqlbTDpSpjNvuyV5+kz2arf0ZSP
	 HiDCrFyj6R3DHGrZyUbp9crRNTK2/izTBCE0rBrWam6dUR+XIEPQqJFToXJz3e6yqz
	 BuxmwJBc/SW1Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 09/12] lib/crypto: curve25519: Move a couple functions out-of-line
Date: Sat,  6 Sep 2025 14:35:20 -0700
Message-ID: <20250906213523.84915-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move curve25519() and curve25519_generate_public() from curve25519.h to
curve25519.c.  There's no good reason for them to be inline.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/curve25519.h | 28 +++-------------------------
 lib/crypto/curve25519.c     | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/include/crypto/curve25519.h b/include/crypto/curve25519.h
index 4e6dc840b1592..78aa5f28c847f 100644
--- a/include/crypto/curve25519.h
+++ b/include/crypto/curve25519.h
@@ -4,11 +4,10 @@
  */
 
 #ifndef CURVE25519_H
 #define CURVE25519_H
 
-#include <crypto/algapi.h> // For crypto_memneq.
 #include <linux/types.h>
 #include <linux/random.h>
 
 enum curve25519_lengths {
 	CURVE25519_KEY_SIZE = 32
@@ -26,37 +25,16 @@ void curve25519_arch(u8 out[CURVE25519_KEY_SIZE],
 		     const u8 point[CURVE25519_KEY_SIZE]);
 
 void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
 			  const u8 secret[CURVE25519_KEY_SIZE]);
 
-static inline
 bool __must_check curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
 			     const u8 secret[CURVE25519_KEY_SIZE],
-			     const u8 basepoint[CURVE25519_KEY_SIZE])
-{
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
-		curve25519_arch(mypublic, secret, basepoint);
-	else
-		curve25519_generic(mypublic, secret, basepoint);
-	return crypto_memneq(mypublic, curve25519_null_point,
-			     CURVE25519_KEY_SIZE);
-}
+			     const u8 basepoint[CURVE25519_KEY_SIZE]);
 
-static inline bool
-__must_check curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
-					const u8 secret[CURVE25519_KEY_SIZE])
-{
-	if (unlikely(!crypto_memneq(secret, curve25519_null_point,
-				    CURVE25519_KEY_SIZE)))
-		return false;
-
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
-		curve25519_base_arch(pub, secret);
-	else
-		curve25519_generic(pub, secret, curve25519_base_point);
-	return crypto_memneq(pub, curve25519_null_point, CURVE25519_KEY_SIZE);
-}
+bool __must_check curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
+					     const u8 secret[CURVE25519_KEY_SIZE]);
 
 static inline void curve25519_clamp_secret(u8 secret[CURVE25519_KEY_SIZE])
 {
 	secret[0] &= 248;
 	secret[31] = (secret[31] & 127) | 64;
diff --git a/lib/crypto/curve25519.c b/lib/crypto/curve25519.c
index 25f16777865bf..1b786389d714a 100644
--- a/lib/crypto/curve25519.c
+++ b/lib/crypto/curve25519.c
@@ -8,12 +8,44 @@
  *
  * Information: https://cr.yp.to/ecdh.html
  */
 
 #include <crypto/curve25519.h>
-#include <linux/module.h>
+#include <crypto/utils.h>
+#include <linux/export.h>
 #include <linux/init.h>
+#include <linux/module.h>
+
+bool __must_check
+curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
+	   const u8 secret[CURVE25519_KEY_SIZE],
+	   const u8 basepoint[CURVE25519_KEY_SIZE])
+{
+	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
+		curve25519_arch(mypublic, secret, basepoint);
+	else
+		curve25519_generic(mypublic, secret, basepoint);
+	return crypto_memneq(mypublic, curve25519_null_point,
+			     CURVE25519_KEY_SIZE);
+}
+EXPORT_SYMBOL(curve25519);
+
+bool __must_check
+curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
+			   const u8 secret[CURVE25519_KEY_SIZE])
+{
+	if (unlikely(!crypto_memneq(secret, curve25519_null_point,
+				    CURVE25519_KEY_SIZE)))
+		return false;
+
+	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
+		curve25519_base_arch(pub, secret);
+	else
+		curve25519_generic(pub, secret, curve25519_base_point);
+	return crypto_memneq(pub, curve25519_null_point, CURVE25519_KEY_SIZE);
+}
+EXPORT_SYMBOL(curve25519_generate_public);
 
 static int __init curve25519_init(void)
 {
 	return 0;
 }
-- 
2.50.1


