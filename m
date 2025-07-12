Return-Path: <linuxppc-dev+bounces-10217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F2B02DD5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8Y2ZLBz3bnJ;
	Sun, 13 Jul 2025 09:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362797;
	cv=none; b=l3KIZE4y/2DIpkANWkP2k6ZP7GOkWzQBS/g7XfsmaydLA1t5bQbC/2NOF64NBfagEafiHKFNdCBQ9nDVWhgSJnep7RxeyyWMu4yRD+fZVyShtoxkLbMKWVqagy+3Istm3Nv+zDC4FayaOYR9LXNfKV/9Hp9HP58It4Pa4XecwXJz8ewi/om6sjajecoTIVZiEONh8KASNXSwMERV01VLlGwQ/U+ulApts2Lg80hiYwv13cCQA1dWKCjr8fPHOLatOexOwzc31sbR9lOPWOJupgehv7+CAi1K4/6SloA2HbF0FgkQgO1cJdjiS8jeIorBFiepEIVFT4UWOqFRjnTQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362797; c=relaxed/relaxed;
	bh=FOQYeR1Imky+uHgb1aIFEcLF55/W66IY68Lpn9DOSc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AipAlxEGTGtett8259DDehQUtg/Eyeq5zkq7A1yLoofJZSy/QPPc8lsGHdifvmafaoeTFYzCPahsnY/DbTw4lvQXe27yAeb1cr5gNu+n53nfPIyvDyCQhXZSHASK6fLyR35S/TlHOwnvDzEoSDxEppaMUZZW+70R8hM4LxGK/dc8PG8DkVTcTm2ZuUjgoJU6T1aldrgA+5/D3OdfTqOoOEYGAcLhtV68lTTzi1oQiG1JnNqfVE8jPft8dLA1PkfV/m2fgBpvS6VvhdCPyNGxxl9hpP7hKIoqtBSLcquS/XdCxMYuEYzUyKMlVa9QjOitFHxUM8l4pEgYZEPIaUeWlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yxndy/Iv; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yxndy/Iv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8P599Rz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8132A5479A;
	Sat, 12 Jul 2025 23:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D6EC4CEF8;
	Sat, 12 Jul 2025 23:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362787;
	bh=SgVXlLx3zUAsItbZlZ/zxXFpPKAtVke822Qe2qamSSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yxndy/IvzWQWbnUBanLC+u/ucTDuAYy1aNSJJAU+8jT6By1Yjj55SBXvhvlCNFg8f
	 SSB/HGy8c08shz70GBPTJUmHm2K1xOOz9Edp95QUJXtDsDU/DSP6yr/Pqi+XhzTm8m
	 RJ74HNLpE5gvL0EEE5JEPfAkiODQR5wBJREtlYGT4tpkkL70Pp5sSHZ0c3Uu+GT3xH
	 i9G0dQntawA946l/N9LEsyjdsG9KqnL/rqHTgoaZkNL/MA4nt1D0UmRo2H/0xvfe1I
	 6LpPC7PxtGTQj3VyBwGC1FCxsI/m3zd6UmUb4iFaliNUr3VAEWgoMUHBM29ibV1OeH
	 bIRg/MvNWEtFw==
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
Subject: [PATCH 15/26] lib/crypto: tests: Add KUnit tests for SHA-1 and HMAC-SHA1
Date: Sat, 12 Jul 2025 16:23:06 -0700
Message-ID: <20250712232329.818226-16-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a KUnit test suite for the SHA-1 library functions, including the
corresponding HMAC support.  The core test logic is in the
previously-added hash-test-template.h.  This commit just adds the actual
KUnit suite, and it adds the generated test vectors to the tree so that
gen-hash-testvecs.py won't have to be run at build time.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/Kconfig         |  10 ++
 lib/crypto/tests/Makefile        |   1 +
 lib/crypto/tests/sha1-testvecs.h | 212 +++++++++++++++++++++++++++++++
 lib/crypto/tests/sha1_kunit.c    |  39 ++++++
 4 files changed, 262 insertions(+)
 create mode 100644 lib/crypto/tests/sha1-testvecs.h
 create mode 100644 lib/crypto/tests/sha1_kunit.c

diff --git a/lib/crypto/tests/Kconfig b/lib/crypto/tests/Kconfig
index 65f462754419d..de7e8babb6afc 100644
--- a/lib/crypto/tests/Kconfig
+++ b/lib/crypto/tests/Kconfig
@@ -7,10 +7,20 @@ config CRYPTO_LIB_POLY1305_KUNIT_TEST
 	select CRYPTO_LIB_BENCHMARK_VISIBLE
 	select CRYPTO_LIB_POLY1305
 	help
 	  KUnit tests for the Poly1305 library functions.
 
+config CRYPTO_LIB_SHA1_KUNIT_TEST
+	tristate "KUnit tests for SHA-1" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
+	select CRYPTO_LIB_BENCHMARK_VISIBLE
+	select CRYPTO_LIB_SHA1
+	help
+	  KUnit tests for the SHA-1 cryptographic hash function and its
+	  corresponding HMAC.
+
 # Option is named *_SHA256_KUNIT_TEST, though both SHA-224 and SHA-256 tests are
 # included, for consistency with the naming used elsewhere (e.g. CRYPTO_SHA256).
 config CRYPTO_LIB_SHA256_KUNIT_TEST
 	tristate "KUnit tests for SHA-224 and SHA-256" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/crypto/tests/Makefile b/lib/crypto/tests/Makefile
index d33f6d85ecaa8..8601dccd6fdda 100644
--- a/lib/crypto/tests/Makefile
+++ b/lib/crypto/tests/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 obj-$(CONFIG_CRYPTO_LIB_POLY1305_KUNIT_TEST) += poly1305_kunit.o
+obj-$(CONFIG_CRYPTO_LIB_SHA1_KUNIT_TEST) += sha1_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA256_KUNIT_TEST) += sha224_kunit.o sha256_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA512_KUNIT_TEST) += sha384_kunit.o sha512_kunit.o
diff --git a/lib/crypto/tests/sha1-testvecs.h b/lib/crypto/tests/sha1-testvecs.h
new file mode 100644
index 0000000000000..f5d050122e84f
--- /dev/null
+++ b/lib/crypto/tests/sha1-testvecs.h
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* This file was generated by: ./scripts/crypto/gen-hash-testvecs.py sha1 */
+
+static const struct {
+	size_t data_len;
+	u8 digest[SHA1_DIGEST_SIZE];
+} hash_testvecs[] = {
+	{
+		.data_len = 0,
+		.digest = {
+			0xda, 0x39, 0xa3, 0xee, 0x5e, 0x6b, 0x4b, 0x0d,
+			0x32, 0x55, 0xbf, 0xef, 0x95, 0x60, 0x18, 0x90,
+			0xaf, 0xd8, 0x07, 0x09,
+		},
+	},
+	{
+		.data_len = 1,
+		.digest = {
+			0x0a, 0xd0, 0x52, 0xdd, 0x9f, 0x32, 0x40, 0x55,
+			0x21, 0xe4, 0x3c, 0x6e, 0xbd, 0xc5, 0x2f, 0x5a,
+			0x02, 0x54, 0x93, 0xb2,
+		},
+	},
+	{
+		.data_len = 2,
+		.digest = {
+			0x13, 0x83, 0x82, 0x03, 0x23, 0xff, 0x46, 0xd6,
+			0x12, 0x7f, 0xad, 0x05, 0x2b, 0xc3, 0x4a, 0x42,
+			0x49, 0x6a, 0xf8, 0x84,
+		},
+	},
+	{
+		.data_len = 3,
+		.digest = {
+			0xe4, 0xdf, 0x7b, 0xdc, 0xe8, 0x6e, 0x81, 0x97,
+			0x1e, 0x0f, 0xe8, 0x8b, 0x76, 0xa8, 0x59, 0x04,
+			0xae, 0x92, 0x1a, 0x7c,
+		},
+	},
+	{
+		.data_len = 16,
+		.digest = {
+			0x8c, 0x1c, 0x30, 0xd8, 0xbc, 0xc4, 0xc3, 0xf5,
+			0xf8, 0x83, 0x0d, 0x1e, 0x04, 0x5d, 0x29, 0xb5,
+			0x68, 0x89, 0xc1, 0xe9,
+		},
+	},
+	{
+		.data_len = 32,
+		.digest = {
+			0x6c, 0x1d, 0x72, 0x31, 0xa5, 0x03, 0x4f, 0xdc,
+			0xff, 0x2d, 0x06, 0x3e, 0x24, 0x26, 0x34, 0x8d,
+			0x60, 0xa4, 0x67, 0x16,
+		},
+	},
+	{
+		.data_len = 48,
+		.digest = {
+			0x37, 0x53, 0x33, 0xfa, 0xd0, 0x21, 0xad, 0xe7,
+			0xa5, 0x43, 0xf1, 0x94, 0x64, 0x11, 0x47, 0x9c,
+			0x72, 0xb5, 0x78, 0xb4,
+		},
+	},
+	{
+		.data_len = 49,
+		.digest = {
+			0x51, 0x5c, 0xd8, 0x5a, 0xa9, 0xde, 0x7b, 0x2a,
+			0xa2, 0xff, 0x70, 0x09, 0x56, 0x88, 0x40, 0x2b,
+			0x50, 0x93, 0x82, 0x47,
+		},
+	},
+	{
+		.data_len = 63,
+		.digest = {
+			0xbc, 0x9c, 0xab, 0x93, 0x06, 0xd5, 0xdb, 0xac,
+			0x2c, 0x33, 0x15, 0x83, 0x56, 0xf6, 0x91, 0x20,
+			0x09, 0xc7, 0xb2, 0x6b,
+		},
+	},
+	{
+		.data_len = 64,
+		.digest = {
+			0x26, 0x90, 0x3b, 0x47, 0xe1, 0x92, 0x42, 0xd0,
+			0x85, 0x63, 0x2e, 0x6b, 0x68, 0xa4, 0xc4, 0x4c,
+			0xe6, 0xf4, 0xb0, 0x52,
+		},
+	},
+	{
+		.data_len = 65,
+		.digest = {
+			0x55, 0x6f, 0x87, 0xdc, 0x34, 0x3d, 0xe2, 0x4f,
+			0xc3, 0x81, 0xa4, 0x82, 0x79, 0x84, 0x64, 0x01,
+			0x55, 0xa0, 0x1e, 0x36,
+		},
+	},
+	{
+		.data_len = 127,
+		.digest = {
+			0xb7, 0xd5, 0x5f, 0xa4, 0xef, 0xbf, 0x4f, 0x96,
+			0x01, 0xc1, 0x06, 0xe3, 0x75, 0xa8, 0x90, 0x92,
+			0x4c, 0x5f, 0xf1, 0x21,
+		},
+	},
+	{
+		.data_len = 128,
+		.digest = {
+			0x70, 0x0c, 0xea, 0xa4, 0x93, 0xd0, 0x56, 0xf0,
+			0x6f, 0xbb, 0x53, 0x42, 0x5b, 0xe3, 0xf2, 0xb0,
+			0x30, 0x66, 0x8e, 0x75,
+		},
+	},
+	{
+		.data_len = 129,
+		.digest = {
+			0x15, 0x01, 0xbc, 0xb0, 0xee, 0xd8, 0xeb, 0xa8,
+			0x7d, 0xd9, 0x4d, 0x50, 0x2e, 0x41, 0x30, 0xba,
+			0x41, 0xaa, 0x7b, 0x02,
+		},
+	},
+	{
+		.data_len = 256,
+		.digest = {
+			0x98, 0x05, 0x52, 0xf5, 0x0f, 0xf0, 0xd3, 0x97,
+			0x15, 0x8c, 0xa3, 0x9a, 0x2b, 0x4d, 0x67, 0x57,
+			0x29, 0xa0, 0xac, 0x61,
+		},
+	},
+	{
+		.data_len = 511,
+		.digest = {
+			0x1f, 0x47, 0xf0, 0xcc, 0xd7, 0xda, 0xa5, 0x3b,
+			0x39, 0xb4, 0x5b, 0xa8, 0x33, 0xd4, 0xca, 0x2f,
+			0xdd, 0xf2, 0x39, 0x89,
+		},
+	},
+	{
+		.data_len = 513,
+		.digest = {
+			0xb9, 0x75, 0xe6, 0x57, 0x42, 0x7f, 0x8b, 0x0a,
+			0xcc, 0x53, 0x10, 0x69, 0x45, 0xac, 0xfd, 0x11,
+			0xf7, 0x1f, 0x4e, 0x6f,
+		},
+	},
+	{
+		.data_len = 1000,
+		.digest = {
+			0x63, 0x66, 0xcb, 0x44, 0xc1, 0x2c, 0xa2, 0x06,
+			0x5d, 0xb9, 0x8e, 0x31, 0xcb, 0x4f, 0x4e, 0x49,
+			0xe0, 0xfb, 0x3c, 0x4e,
+		},
+	},
+	{
+		.data_len = 3333,
+		.digest = {
+			0x35, 0xbc, 0x74, 0xfb, 0x31, 0x9c, 0xd4, 0xdd,
+			0xe8, 0x87, 0xa7, 0x56, 0x3b, 0x08, 0xe5, 0x49,
+			0xe1, 0xe9, 0xc9, 0xa8,
+		},
+	},
+	{
+		.data_len = 4096,
+		.digest = {
+			0x43, 0x00, 0xea, 0xcd, 0x4e, 0x7c, 0xe9, 0xe4,
+			0x32, 0xce, 0x25, 0xa8, 0xcd, 0x20, 0xa8, 0xaa,
+			0x7b, 0x63, 0x2c, 0x3c,
+		},
+	},
+	{
+		.data_len = 4128,
+		.digest = {
+			0xd0, 0x67, 0x26, 0x0e, 0x22, 0x72, 0xaa, 0x63,
+			0xfc, 0x34, 0x55, 0x07, 0xab, 0xc8, 0x64, 0xb6,
+			0xc4, 0xea, 0xd5, 0x7c,
+		},
+	},
+	{
+		.data_len = 4160,
+		.digest = {
+			0x6b, 0xc9, 0x5e, 0xb9, 0x41, 0x19, 0x50, 0x35,
+			0xf1, 0x39, 0xfe, 0xd9, 0x72, 0x6d, 0xd0, 0x55,
+			0xb8, 0x1f, 0x1a, 0x95,
+		},
+	},
+	{
+		.data_len = 4224,
+		.digest = {
+			0x70, 0x5d, 0x10, 0x2e, 0x4e, 0x44, 0xc9, 0x80,
+			0x8f, 0xba, 0x13, 0xbc, 0xd0, 0x77, 0x78, 0xc7,
+			0x84, 0xe3, 0x24, 0x43,
+		},
+	},
+	{
+		.data_len = 16384,
+		.digest = {
+			0xa8, 0x82, 0xca, 0x08, 0xb4, 0x84, 0x09, 0x13,
+			0xc0, 0x9c, 0x26, 0x18, 0xcf, 0x0f, 0xf3, 0x08,
+			0xff, 0xa1, 0xe4, 0x5d,
+		},
+	},
+};
+
+static const u8 hash_testvec_consolidated[SHA1_DIGEST_SIZE] = {
+	0xe1, 0x72, 0xa5, 0x3c, 0xda, 0xf2, 0xe5, 0x56,
+	0xb8, 0xb5, 0x35, 0x6e, 0xce, 0xc8, 0x37, 0x57,
+	0x31, 0xb4, 0x05, 0xdd,
+};
+
+static const u8 hmac_testvec_consolidated[SHA1_DIGEST_SIZE] = {
+	0x9d, 0xe5, 0xb1, 0x43, 0x97, 0x95, 0x16, 0x52,
+	0xa0, 0x7a, 0xc0, 0xe2, 0xc1, 0x60, 0x64, 0x7c,
+	0x24, 0xf9, 0x34, 0xd7,
+};
diff --git a/lib/crypto/tests/sha1_kunit.c b/lib/crypto/tests/sha1_kunit.c
new file mode 100644
index 0000000000000..24ba8d5669c8f
--- /dev/null
+++ b/lib/crypto/tests/sha1_kunit.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2025 Google LLC
+ */
+#include <crypto/sha1.h>
+#include "sha1-testvecs.h"
+
+#define HASH sha1
+#define HASH_CTX sha1_ctx
+#define HASH_SIZE SHA1_DIGEST_SIZE
+#define HASH_INIT sha1_init
+#define HASH_UPDATE sha1_update
+#define HASH_FINAL sha1_final
+#define HMAC_KEY hmac_sha1_key
+#define HMAC_CTX hmac_sha1_ctx
+#define HMAC_PREPAREKEY hmac_sha1_preparekey
+#define HMAC_INIT hmac_sha1_init
+#define HMAC_UPDATE hmac_sha1_update
+#define HMAC_FINAL hmac_sha1_final
+#define HMAC hmac_sha1
+#define HMAC_USINGRAWKEY hmac_sha1_usingrawkey
+#include "hash-test-template.h"
+
+static struct kunit_case hash_test_cases[] = {
+	HASH_KUNIT_CASES,
+	KUNIT_CASE(benchmark_hash),
+	{},
+};
+
+static struct kunit_suite hash_test_suite = {
+	.name = "sha1",
+	.test_cases = hash_test_cases,
+	.suite_init = hash_suite_init,
+	.suite_exit = hash_suite_exit,
+};
+kunit_test_suite(hash_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests and benchmark for SHA-1 and HMAC-SHA1");
+MODULE_LICENSE("GPL");
-- 
2.50.1


