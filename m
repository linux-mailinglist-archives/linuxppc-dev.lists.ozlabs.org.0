Return-Path: <linuxppc-dev+bounces-11838-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD6FB47790
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 23:37:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cK64K3SY3z3cml;
	Sun,  7 Sep 2025 07:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757194625;
	cv=none; b=KH3r+tExhSBq7LYreRxVW6rQBewIBXuWcctrKla+oyTCgHygg7sVZO6xtGGvmR5mbWtfsXJflyZbrbqfz2LZjsFABotEQ1w/M/Ud/hOn3YegJ62SfF3OfgtHmDdZ1qy4qq0WE/Ear+4X/NxYTh2lUC7pwBMMhOV/55Zcj3VNSXmHHpLLWbIK78+ljm0z8bL8rwEI4yuLKmUuqzJtvBzurcz82gx+jDVGXRmFvW1z3SPT8T6rCyREBuDTA5tsEDcn94EYOmy45Z+M8UNrbO8rbD6bQYWDhn12G+HmoSZyfK0p1DwmYpAdAk/n+tdb/08Du87avhvZUP5vzwJ127BGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757194625; c=relaxed/relaxed;
	bh=5D2lRv4S/c3/2kAUiurZoygLljKx4iZPPJttVCBSEyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OhFi3hy/qEPdPQTuP1nyDFofN/sR/JBXnLuAeWDOVkkw9xD7RXK8BQRA3uutgnDzBA27aEWFp/BYmjkMz/KYD8ULo7CpO6eGDpDvorjY0FCPfKK5+7NdX8hVZ25HT3UCFz45iTcJ1tcuqihF80zLw856WznKkBErGRkxr6dUePZzVre3MFC3ICYAOdRn1PIf3JuOCde9BdryMK/VHtit351DMdwOdzow3VMFas+Oh0/wcEz1cDdXajmq2Hlq1a0xdrh9TXNG3SKKiibpO3hIDjGq37u2IADxbMmChVx+4OnM0QW9N/VisyZPQKqD3/+YinwnQhuAeKGEOLQZprktpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sSDDKlH/; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sSDDKlH/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cK64J2KJ1z3cgN
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 07:37:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0CAF4524B;
	Sat,  6 Sep 2025 21:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58D1C116C6;
	Sat,  6 Sep 2025 21:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194622;
	bh=qeA+FP+PuaUpGik41riGWKZvCqoBTBbqU4Qqt/+2lG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sSDDKlH/aH65brYyaH5eBFlhDKmJZ9sraOxMyF3g1tjGf0AUnwE2PqNycmNg7456t
	 Cgs+Ilqe++W3YiJ0x3GHjzzcUy8UCEujV8fmDjtEhgHoAfKHfg2MKi2KwOPy8Bk3Us
	 ly1sTOgXXBnnxbx1Dgo2Bsbfv0XD2FpzUqCOyTLqR2Ttfs/iKOZtSTx+B+pyxG5Uck
	 GjMuxWSxjJFq8z8kTc9ysuDFITtk1ooji8IR7Ioh56stV2/r4ofr4XjurivZTcaUBZ
	 jVYl1l8Npy8cdu1aPrhHGBSOUV9gW3xomyGZbSIBVSq6cWBUvHqXxw23C0lQshZe+L
	 sOD1bi7zn7Dig==
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
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 06/12] crypto: curve25519 - Remove unused kpp support
Date: Sat,  6 Sep 2025 14:35:17 -0700
Message-ID: <20250906213523.84915-7-ebiggers@kernel.org>
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

Curve25519 has both a library API and a crypto_kpp API.  However, the
crypto_kpp API for Curve25519 had no users outside crypto/testmgr.c.
I.e., no non-test code ever passed "curve25519" to crypto_alloc_kpp().

Remove this unused code.  We'll instead focus on the Curve25519 library
API (<crypto/curve25519.h>), which is a simpler and easier-to-use API
and is the API that is actually being used.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/m68k/configs/amiga_defconfig    |  1 -
 arch/m68k/configs/apollo_defconfig   |  1 -
 arch/m68k/configs/atari_defconfig    |  1 -
 arch/m68k/configs/bvme6000_defconfig |  1 -
 arch/m68k/configs/hp300_defconfig    |  1 -
 arch/m68k/configs/mac_defconfig      |  1 -
 arch/m68k/configs/multi_defconfig    |  1 -
 arch/m68k/configs/mvme147_defconfig  |  1 -
 arch/m68k/configs/mvme16x_defconfig  |  1 -
 arch/m68k/configs/q40_defconfig      |  1 -
 arch/m68k/configs/sun3_defconfig     |  1 -
 arch/m68k/configs/sun3x_defconfig    |  1 -
 arch/s390/configs/debug_defconfig    |  1 -
 arch/s390/configs/defconfig          |  1 -
 crypto/Kconfig                       |  8 ---
 crypto/Makefile                      |  1 -
 crypto/curve25519-generic.c          | 91 ----------------------------
 17 files changed, 114 deletions(-)
 delete mode 100644 crypto/curve25519-generic.c

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 5171bb183967b..24e7314ae4d3c 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -558,11 +558,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 16f343ae48c67..4f13c2fa2097e 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -515,11 +515,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index c08788728ea96..95ef2c838141d 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -535,11 +535,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 962497e7c53fd..d0aca54485f2d 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -507,11 +507,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index ec28650189e40..faa5ec07cf9e5 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -517,11 +517,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 0afb3ad180dee..313a52341dafa 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -534,11 +534,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index b311e953995d6..44cc3461f5695 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -621,11 +621,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index f4e6224f137f9..0394fd631679e 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -507,11 +507,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 498e167222f18..d8ad11b7054c4 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -508,11 +508,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 8c6b1eef85342..bdc090d0c0ad0 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -524,11 +524,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index c34648f299efb..05324e30c65f5 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -505,11 +505,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 73810d14660f2..a1a3fb24fb7b0 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -505,11 +505,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_RSA=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 5e616bc988ac3..1c54348b812da 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -759,11 +759,10 @@ CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index 094599cdaf4d9..90a9dad7f8015 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -743,11 +743,10 @@ CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_DH=m
 CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_ECDSA=m
 CONFIG_CRYPTO_ECRDSA=m
-CONFIG_CRYPTO_CURVE25519=m
 CONFIG_CRYPTO_AES_TI=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 09e8fb6ee0813..a04595f9d0ca4 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -342,18 +342,10 @@ config CRYPTO_ECRDSA
 	  RFC 7091, ISO/IEC 14888-3)
 
 	  One of the Russian cryptographic standard algorithms (called GOST
 	  algorithms). Only signature verification is implemented.
 
-config CRYPTO_CURVE25519
-	tristate "Curve25519"
-	select CRYPTO_KPP
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_LIB_CURVE25519_INTERNAL
-	help
-	  Curve25519 elliptic curve (RFC7748)
-
 endmenu
 
 menu "Block ciphers"
 
 config CRYPTO_AES
diff --git a/crypto/Makefile b/crypto/Makefile
index 6c5d59369dacc..e430e6e99b6a2 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -180,11 +180,10 @@ obj-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 obj-$(CONFIG_CRYPTO_ECC) += ecc.o
 obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
-obj-$(CONFIG_CRYPTO_CURVE25519) += curve25519-generic.o
 
 ecdh_generic-y += ecdh.o
 ecdh_generic-y += ecdh_helper.o
 obj-$(CONFIG_CRYPTO_ECDH) += ecdh_generic.o
 
diff --git a/crypto/curve25519-generic.c b/crypto/curve25519-generic.c
deleted file mode 100644
index f3e56e73c66ca..0000000000000
--- a/crypto/curve25519-generic.c
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-
-#include <crypto/curve25519.h>
-#include <crypto/internal/kpp.h>
-#include <crypto/kpp.h>
-#include <linux/module.h>
-#include <linux/scatterlist.h>
-
-static int curve25519_set_secret(struct crypto_kpp *tfm, const void *buf,
-				 unsigned int len)
-{
-	u8 *secret = kpp_tfm_ctx(tfm);
-
-	if (!len)
-		curve25519_generate_secret(secret);
-	else if (len == CURVE25519_KEY_SIZE &&
-		 crypto_memneq(buf, curve25519_null_point, CURVE25519_KEY_SIZE))
-		memcpy(secret, buf, CURVE25519_KEY_SIZE);
-	else
-		return -EINVAL;
-	return 0;
-}
-
-static int curve25519_compute_value(struct kpp_request *req)
-{
-	struct crypto_kpp *tfm = crypto_kpp_reqtfm(req);
-	const u8 *secret = kpp_tfm_ctx(tfm);
-	u8 public_key[CURVE25519_KEY_SIZE];
-	u8 buf[CURVE25519_KEY_SIZE];
-	int copied, nbytes;
-	u8 const *bp;
-
-	if (req->src) {
-		copied = sg_copy_to_buffer(req->src,
-					   sg_nents_for_len(req->src,
-							    CURVE25519_KEY_SIZE),
-					   public_key, CURVE25519_KEY_SIZE);
-		if (copied != CURVE25519_KEY_SIZE)
-			return -EINVAL;
-		bp = public_key;
-	} else {
-		bp = curve25519_base_point;
-	}
-
-	curve25519_generic(buf, secret, bp);
-
-	/* might want less than we've got */
-	nbytes = min_t(size_t, CURVE25519_KEY_SIZE, req->dst_len);
-	copied = sg_copy_from_buffer(req->dst, sg_nents_for_len(req->dst,
-								nbytes),
-				     buf, nbytes);
-	if (copied != nbytes)
-		return -EINVAL;
-	return 0;
-}
-
-static unsigned int curve25519_max_size(struct crypto_kpp *tfm)
-{
-	return CURVE25519_KEY_SIZE;
-}
-
-static struct kpp_alg curve25519_alg = {
-	.base.cra_name		= "curve25519",
-	.base.cra_driver_name	= "curve25519-generic",
-	.base.cra_priority	= 100,
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_ctxsize	= CURVE25519_KEY_SIZE,
-
-	.set_secret		= curve25519_set_secret,
-	.generate_public_key	= curve25519_compute_value,
-	.compute_shared_secret	= curve25519_compute_value,
-	.max_size		= curve25519_max_size,
-};
-
-static int __init curve25519_init(void)
-{
-	return crypto_register_kpp(&curve25519_alg);
-}
-
-static void __exit curve25519_exit(void)
-{
-	crypto_unregister_kpp(&curve25519_alg);
-}
-
-module_init(curve25519_init);
-module_exit(curve25519_exit);
-
-MODULE_ALIAS_CRYPTO("curve25519");
-MODULE_ALIAS_CRYPTO("curve25519-generic");
-MODULE_DESCRIPTION("Curve25519 elliptic curve (RFC7748)");
-MODULE_LICENSE("GPL");
-- 
2.50.1


