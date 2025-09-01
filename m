Return-Path: <linuxppc-dev+bounces-11594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9670DB3EF61
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 22:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG0bq1Hr6z30Bd;
	Tue,  2 Sep 2025 06:20:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756758007;
	cv=none; b=f6RPvcqtv7Bkh7YacXoS0ahyHeNtVodzjrxuli1eBPYQnUzyFomWqHh1mi/T7FCQFdxDqeKJYnsTTysMFc2g6e/B6hiQar0FKSUPacbgyotbf0t07/rsxNLC0vInJoZteOh0q9m/pXMpvITGmMOzltSkjF59koZd/lPX6nT8uSQXIhqp+A0lSM8HZunMbBIKU5fcVbE7OGHN3xJ6ly/XvnaA9FVhP63yBU6DiDClg1dBPFk0T5fZTqTjfBuFtwyrzN3n0LKstbZrmX5VJi71SUtssLOgEB/ksnB3XNVpzq37yTlOywiDC0Zze8N/BhAZtHsLAPMjTMcM8LtZSdmDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756758007; c=relaxed/relaxed;
	bh=zawHBExVrVkRr6zchrF2uLNtWOiWbz0AAntBfqVKmTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnAZcdibXRkt7EBMlWprPIfkl5OMZJ5+JigDZWRTNDjOmuugHUy+9HpTPfPgC6xqdyKSEvhRayTwskEhFIGvFpBaGH3XzNWsUhczIXaaH/1M9Tm7UGz7wnfltNwnxqIhRAJwi3xnUWcw3O63ZLVMkoSKU072KiIQJl0TMqHP1G1edevYUlXOL4YhBs1HfdbUJnqLFq7PgEXgb7qtK17auAVobLoEeYU/px8vyNbJDiZLbiU2HwDXeRxxiVXaS4Q2WpWdfiJ8d51ivVWpyuj0MK831rqZ0TJgtgQh00V1uEoAFF28AT2vdZSE10+fd39OHqPKG8b+36p1MtXhglyCug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cIv556mj; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cIv556mj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cG0bp1y1Dz3055
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 06:20:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F40F8451B5;
	Mon,  1 Sep 2025 20:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E76C4CEF7;
	Mon,  1 Sep 2025 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758003;
	bh=JT5BiLSYDda9F7JFlPUyma7+VlywOSy3ji25SAsdSjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cIv556mj78srUYKhhiIsf5bRS5w3KmxqdTYYJ3t9pCTlMTQrWVdEk8o4UiDSI4da8
	 TwsnQcPkOLEGWnNN1i2BvzYxwKRZ2OL0Xta/6Ry1WG3dir2IyTPt2hQxAUf4ntRghe
	 Qe3qXPdw4iRHmCGfnZEdjb7cuzGd6mJy/wkpeWJB8sF6j3htHmWrVaTt4a9x6uB2BJ
	 8z++/1e0hOWXaqiyejBAk+ZC8jwyKDjZw3SRztPnBveuthxLs3GaAFdqU/wbcFpAj1
	 pOllmIj46N5FxKdsXbpS96eu3Mb7G6CjI/62ePYuW+7e0qpRcA4nQMVPFDzXmezuRQ
	 CxtulhW2ELojA==
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
Subject: [PATCH 3/6] lib/crypto: tests: Add Curve25519 benchmark
Date: Mon,  1 Sep 2025 13:18:12 -0700
Message-ID: <20250901201815.594177-4-ebiggers@kernel.org>
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

Add a benchmark to curve25519_kunit.  This brings it in line with the
other crypto KUnit tests and provides an easy way to measure
performance.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/curve25519_kunit.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/lib/crypto/tests/curve25519_kunit.c b/lib/crypto/tests/curve25519_kunit.c
index 585f7ad3ed5f7..2e1d781563648 100644
--- a/lib/crypto/tests/curve25519_kunit.c
+++ b/lib/crypto/tests/curve25519_kunit.c
@@ -3,10 +3,11 @@
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
 #include <crypto/curve25519.h>
 #include <kunit/test.h>
+#include <linux/timekeeping.h>
 
 struct curve25519_test_vector {
 	u8 private[CURVE25519_KEY_SIZE];
 	u8 public[CURVE25519_KEY_SIZE];
 	u8 result[CURVE25519_KEY_SIZE];
@@ -1317,13 +1318,43 @@ static void test_curve25519_basepoint(struct kunit *test)
 		KUNIT_EXPECT_MEMEQ_MSG(test, out, out2, CURVE25519_KEY_SIZE,
 				       "in=%*phN", CURVE25519_KEY_SIZE, in);
 	}
 }
 
+static void benchmark_curve25519(struct kunit *test)
+{
+	const u8 *private = curve25519_test_vectors[0].private;
+	const u8 *public = curve25519_test_vectors[0].public;
+	u8 out[CURVE25519_KEY_SIZE];
+	const size_t warmup_niter = 5000;
+	const size_t benchmark_niter = 1024;
+	bool ok = true;
+	u64 t;
+
+	if (!IS_ENABLED(CONFIG_CRYPTO_LIB_BENCHMARK))
+		kunit_skip(test, "not enabled");
+
+	/* Warm-up */
+	for (size_t i = 0; i < warmup_niter; i++)
+		ok &= curve25519(out, private, public);
+
+	/* Benchmark */
+	preempt_disable();
+	t = ktime_get_ns();
+	for (size_t i = 0; i < benchmark_niter; i++)
+		ok &= curve25519(out, private, public);
+	t = ktime_get_ns() - t;
+	preempt_enable();
+	KUNIT_EXPECT_TRUE(test, ok);
+	kunit_info(test, "%llu ops/s",
+		   div64_u64((u64)benchmark_niter * 1000000000, t ?: 1));
+}
+
 static struct kunit_case curve25519_test_cases[] = {
 	KUNIT_CASE(test_curve25519),
 	KUNIT_CASE(test_curve25519_basepoint),
+	KUNIT_CASE(benchmark_curve25519),
 	{},
 };
 
 static struct kunit_suite curve25519_test_suite = {
 	.name = "curve25519",
-- 
2.50.1


