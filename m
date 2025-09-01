Return-Path: <linuxppc-dev+bounces-11596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3326B3EF69
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 22:20:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG0bt0vRPz306d;
	Tue,  2 Sep 2025 06:20:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756758010;
	cv=none; b=PQdFolwh6GZAwZ2jX3/E6cYyU2Hi5xQySNn4WRXzj97BomqIqsXoFSKZisbwJ+7m+OF2yMDgGh1s0/f2a+Q4odWkXijFRJhDJPZN4fR7tjB9mp7AjQ+A7aMKSBfeRSDli4VmmQISCvy1awf4TQukwy/4J0cWY3o0JY/ifqmFrmso+UQzBUQePzoVaCyHSbj62Tmu4f+H5DKKseltEFo+1kCbp+nbdMGzRFLOpvTKFa15QRpFFPSnI6Y3G2UwriRj6QhJb9K+WT7MEPG1MTXjDPn/9UagHt3imasNwJxuemmr4AwCONy84HZ6Znnh0TLpRyRyqclL7mll7OSG7ukkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756758010; c=relaxed/relaxed;
	bh=evWNLDxoIMakaSVwQ6RW7eiTaRyquDIws1xqtj7Wyhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJ95x6seZicif+X10jiSCqlM9y+E1oOTsqonHZNsyzxTYI/RGQ8Myt6ROY5VvFyJMzTInKz9NGCuEKfEW8r/GzjRlbGDkw9Kc58Rn9X+kBdLbiSiytwjOvBsZtYPbmhNofY43bEqHiOuly+2gRXKGZLVFkB3x4fxzClDICtzPuysIh1Nzlywr8t5tjfNkq7Pq5rP4CNhO8Tr3tKpqX5G+vMHHuVDRBg3bnJKrlRsU7fNCNOJfyqJ7S9uVA7RiOjLYJuP+ZFhic1uPZrROyBw1Dqop5kmYJvV3q3rM+HsK+y5XD4qPcM31ymzADsqNcy27U+CupXt1EPb3KOMOuT3GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GLje4ObU; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GLje4ObU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cG0bq0WQqz30BW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 06:20:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD95F601E9;
	Mon,  1 Sep 2025 20:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADC5C4CEF8;
	Mon,  1 Sep 2025 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758003;
	bh=B4da0sr/1oBe4AmbJczL0wIT7JYsT0YINmNYebZKB44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLje4ObURs0AGgQcFtcHhk6kCFuQNIYlyP3AEmiI73Sq7Aebso3Dz380GNUscTJB6
	 KZzZCGDWwcAPPug+EFZ2FzGj81KzB9UV6/Ln8lop6aB6oziE3tX0egzOHzW26/QFsR
	 IImlAUrPHz2ovBLNF0EaHih23PpyFmCJOVqrKSkw3lvct3gHeRjCW3EaR1zszkoqDB
	 7lVmqgoZYRH13bXXBKG3jr4qy314DlGwuvSeVTxVdr1F82fZ7T63ZBb68doQu00LRU
	 /jm2iANXWDd5Z9EsNepYkeoFPC6qK2u8B9KSGaRNlmfaPaPBKNLqKfAfqXY3l1BBBW
	 KlS7/CF3nMzWw==
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
Subject: [PATCH 2/6] lib/crypto: tests: Migrate Curve25519 self-test to KUnit
Date: Mon,  1 Sep 2025 13:18:11 -0700
Message-ID: <20250901201815.594177-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901201815.594177-1-ebiggers@kernel.org>
References: <20250901201815.594177-1-ebiggers@kernel.org>
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

Move the Curve25519 test from an ad-hoc self-test to a KUnit test.

Generally keep the same test logic for now, just translated to KUnit.
There's one exception, which is that I dropped the incomplete test of
curve25519_generic().  The approach I'm taking to cover the different
implementations with the KUnit tests is to just rely on booting kernels
in QEMU with different '-cpu' options, rather than try to make the tests
(incompletely) test multiple implementations on one CPU.  This way, both
the test and the library API are simpler.

This commit makes the file lib/crypto/curve25519.c no longer needed, as
its only purpose was to call the self-test.  However, keep it for now,
since a later commit will add code to it again.

Temporarily omit the default value of CRYPTO_SELFTESTS that the other
lib/crypto/ KUnit tests have.  It would cause a recursive kconfig
dependency, since the Curve25519 code is still entangled with CRYPTO.  A
later commit will fix that.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/curve25519.h                   |  2 -
 lib/crypto/Makefile                           |  1 -
 lib/crypto/curve25519.c                       |  3 -
 lib/crypto/tests/Kconfig                      |  9 +++
 lib/crypto/tests/Makefile                     |  1 +
 .../curve25519_kunit.c}                       | 71 +++++++++++--------
 6 files changed, 51 insertions(+), 36 deletions(-)
 rename lib/crypto/{curve25519-selftest.c => tests/curve25519_kunit.c} (97%)

diff --git a/include/crypto/curve25519.h b/include/crypto/curve25519.h
index ece6a9b5fafc8..4e6dc840b1592 100644
--- a/include/crypto/curve25519.h
+++ b/include/crypto/curve25519.h
@@ -26,12 +26,10 @@ void curve25519_arch(u8 out[CURVE25519_KEY_SIZE],
 		     const u8 point[CURVE25519_KEY_SIZE]);
 
 void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
 			  const u8 secret[CURVE25519_KEY_SIZE]);
 
-bool curve25519_selftest(void);
-
 static inline
 bool __must_check curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
 			     const u8 secret[CURVE25519_KEY_SIZE],
 			     const u8 basepoint[CURVE25519_KEY_SIZE])
 {
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index ad27c5bf99e11..6c3be971ace09 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -85,11 +85,10 @@ ifeq ($(call clang-min-version, 180000),)
 KASAN_SANITIZE_curve25519-hacl64.o := n
 endif
 
 obj-$(CONFIG_CRYPTO_LIB_CURVE25519)		+= libcurve25519.o
 libcurve25519-y					+= curve25519.o
-libcurve25519-$(CONFIG_CRYPTO_SELFTESTS)	+= curve25519-selftest.o
 
 obj-$(CONFIG_CRYPTO_LIB_DES)			+= libdes.o
 libdes-y					:= des.o
 
 ################################################################################
diff --git a/lib/crypto/curve25519.c b/lib/crypto/curve25519.c
index 6850b76a80c9e..25f16777865bf 100644
--- a/lib/crypto/curve25519.c
+++ b/lib/crypto/curve25519.c
@@ -13,13 +13,10 @@
 #include <linux/module.h>
 #include <linux/init.h>
 
 static int __init curve25519_init(void)
 {
-	if (IS_ENABLED(CONFIG_CRYPTO_SELFTESTS) &&
-	    WARN_ON(!curve25519_selftest()))
-		return -ENODEV;
 	return 0;
 }
 
 static void __exit curve25519_exit(void)
 {
diff --git a/lib/crypto/tests/Kconfig b/lib/crypto/tests/Kconfig
index fd341aa12f157..7e4e66f30a7a6 100644
--- a/lib/crypto/tests/Kconfig
+++ b/lib/crypto/tests/Kconfig
@@ -8,10 +8,19 @@ config CRYPTO_LIB_BLAKE2S_KUNIT_TEST
 	# No need to select CRYPTO_LIB_BLAKE2S here, as that option doesn't
 	# exist; the BLAKE2s code is always built-in for the /dev/random driver.
 	help
 	  KUnit tests for the BLAKE2s cryptographic hash function.
 
+config CRYPTO_LIB_CURVE25519_KUNIT_TEST
+	tristate "KUnit tests for Curve25519" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	select CRYPTO_LIB_BENCHMARK_VISIBLE
+	select CRYPTO_LIB_CURVE25519
+	help
+	  KUnit tests for Curve25519.
+
 config CRYPTO_LIB_MD5_KUNIT_TEST
 	tristate "KUnit tests for MD5" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
 	select CRYPTO_LIB_BENCHMARK_VISIBLE
diff --git a/lib/crypto/tests/Makefile b/lib/crypto/tests/Makefile
index be7de929af2cc..a71fad19922ba 100644
--- a/lib/crypto/tests/Makefile
+++ b/lib/crypto/tests/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 obj-$(CONFIG_CRYPTO_LIB_BLAKE2S_KUNIT_TEST) += blake2s_kunit.o
+obj-$(CONFIG_CRYPTO_LIB_CURVE25519_KUNIT_TEST) += curve25519_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_MD5_KUNIT_TEST) += md5_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_POLY1305_KUNIT_TEST) += poly1305_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA1_KUNIT_TEST) += sha1_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA256_KUNIT_TEST) += sha224_kunit.o sha256_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA512_KUNIT_TEST) += sha384_kunit.o sha512_kunit.o
diff --git a/lib/crypto/curve25519-selftest.c b/lib/crypto/tests/curve25519_kunit.c
similarity index 97%
rename from lib/crypto/curve25519-selftest.c
rename to lib/crypto/tests/curve25519_kunit.c
index c85e85381e788..585f7ad3ed5f7 100644
--- a/lib/crypto/curve25519-selftest.c
+++ b/lib/crypto/tests/curve25519_kunit.c
@@ -2,18 +2,19 @@
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
 #include <crypto/curve25519.h>
+#include <kunit/test.h>
 
 struct curve25519_test_vector {
 	u8 private[CURVE25519_KEY_SIZE];
 	u8 public[CURVE25519_KEY_SIZE];
 	u8 result[CURVE25519_KEY_SIZE];
 	bool valid;
 };
-static const struct curve25519_test_vector curve25519_test_vectors[] __initconst = {
+static const struct curve25519_test_vector curve25519_test_vectors[] = {
 	{
 		.private = { 0x77, 0x07, 0x6d, 0x0a, 0x73, 0x18, 0xa5, 0x7d,
 			     0x3c, 0x16, 0xc1, 0x72, 0x51, 0xb2, 0x66, 0x45,
 			     0xdf, 0x4c, 0x2f, 0x87, 0xeb, 0xc0, 0x99, 0x2a,
 			     0xb1, 0x77, 0xfb, 0xa5, 0x1d, 0xb9, 0x2c, 0x2a },
@@ -1278,44 +1279,54 @@ static const struct curve25519_test_vector curve25519_test_vectors[] __initconst
 			    0xd9, 0x8b, 0xb9, 0x1b, 0x3e, 0x0b, 0xe0, 0x35 },
 		.valid = true
 	}
 };
 
-bool __init curve25519_selftest(void)
+static void test_curve25519(struct kunit *test)
 {
-	bool success = true, ret, ret2;
-	size_t i = 0, j;
-	u8 in[CURVE25519_KEY_SIZE];
-	u8 out[CURVE25519_KEY_SIZE], out2[CURVE25519_KEY_SIZE],
-	   out3[CURVE25519_KEY_SIZE];
+	for (size_t i = 0; i < ARRAY_SIZE(curve25519_test_vectors); ++i) {
+		const struct curve25519_test_vector *vec =
+			&curve25519_test_vectors[i];
+		u8 out[CURVE25519_KEY_SIZE];
+		bool ret;
 
-	for (i = 0; i < ARRAY_SIZE(curve25519_test_vectors); ++i) {
 		memset(out, 0, CURVE25519_KEY_SIZE);
-		ret = curve25519(out, curve25519_test_vectors[i].private,
-				 curve25519_test_vectors[i].public);
-		if (ret != curve25519_test_vectors[i].valid ||
-		    memcmp(out, curve25519_test_vectors[i].result,
-			   CURVE25519_KEY_SIZE)) {
-			pr_err("curve25519 self-test %zu: FAIL\n", i + 1);
-			success = false;
-		}
+		ret = curve25519(out, vec->private, vec->public);
+		KUNIT_EXPECT_EQ_MSG(test, ret, vec->valid,
+				    "Wrong return value with test vector %zu\n",
+				    i);
+		KUNIT_EXPECT_MEMEQ_MSG(test, out, vec->result,
+				       CURVE25519_KEY_SIZE,
+				       "Wrong output with test vector %zu\n",
+				       i);
 	}
+}
+
+static void test_curve25519_basepoint(struct kunit *test)
+{
+	for (size_t i = 0; i < 5; ++i) {
+		u8 in[CURVE25519_KEY_SIZE];
+		u8 out[CURVE25519_KEY_SIZE];
+		u8 out2[CURVE25519_KEY_SIZE];
+		bool ret, ret2;
 
-	for (i = 0; i < 5; ++i) {
 		get_random_bytes(in, sizeof(in));
 		ret = curve25519_generate_public(out, in);
 		ret2 = curve25519(out2, in, (u8[CURVE25519_KEY_SIZE]){ 9 });
-		curve25519_generic(out3, in, (u8[CURVE25519_KEY_SIZE]){ 9 });
-		if (ret != ret2 ||
-		    memcmp(out, out2, CURVE25519_KEY_SIZE) ||
-		    memcmp(out, out3, CURVE25519_KEY_SIZE)) {
-			pr_err("curve25519 basepoint self-test %zu: FAIL: input - 0x",
-			       i + 1);
-			for (j = CURVE25519_KEY_SIZE; j-- > 0;)
-				printk(KERN_CONT "%02x", in[j]);
-			printk(KERN_CONT "\n");
-			success = false;
-		}
+		KUNIT_EXPECT_EQ_MSG(test, ret, ret2,
+				    "in=%*phN", CURVE25519_KEY_SIZE, in);
+		KUNIT_EXPECT_MEMEQ_MSG(test, out, out2, CURVE25519_KEY_SIZE,
+				       "in=%*phN", CURVE25519_KEY_SIZE, in);
 	}
-
-	return success;
 }
+
+static struct kunit_case curve25519_test_cases[] = {
+	KUNIT_CASE(test_curve25519),
+	KUNIT_CASE(test_curve25519_basepoint),
+	{},
+};
+
+static struct kunit_suite curve25519_test_suite = {
+	.name = "curve25519",
+	.test_cases = curve25519_test_cases,
+};
+kunit_test_suite(curve25519_test_suite);
-- 
2.50.1


