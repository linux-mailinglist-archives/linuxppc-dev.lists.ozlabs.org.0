Return-Path: <linuxppc-dev+bounces-11841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AA2B47794
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 23:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cK64M32l4z3d2w;
	Sun,  7 Sep 2025 07:37:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757194627;
	cv=none; b=lvoXsYp69amxQ8n7Ufzsln6wrSEiyiE+xVp8mBtv6mDXcoz42rrEf6qHuP0HO3m2kt5bIxOZqG4awswax6+OAVNYcxVKwy6xp1bdPHXHzCS5ad6WOX4QT6JXxgKLH+EIjZaaM2dbOghLPXqYYdZTnZkHbXPR+bVmr/6RAF2soAXu1RuHTQWcyqhra+lpGgbgNVR7nGP5EP4J470wQ9Xucrr+tWtuoyYmMrCcWXX/O6meBabAYY4TBGi2TN0Lx3/t3zOAWzkpVpugVA4tz6W6hkaLU2wea2eoPLzMugIp3V9q0uz83L+vOTB1kRB1Do2cDRsSCyrFmTEyjtQE1E8f8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757194627; c=relaxed/relaxed;
	bh=SCb89IgsLwOFhpz4MbAPn0pNdnEI/VMM8b0yUQaEIW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8paFzg/6olg5evdgi9eHkefP0zbO9LOvHS8tyfpO6G/BnBRWnU3CXDMY2KQtT3LzOQRRs26etfVpUHmMJGuu2Bu6hKczBYdCoJKjd7vR4oq0PpnGZM4nIaTL42x0/Z+UcLBgBnRUpB9Ck9t4jjPz73qw6dR0SRmBH7A1P8+tpOLy/SRVxTXVk1xoCRRXWUUuFaggK1DAP19InGfFGEwHEQkNqUf7fLcyZ0Al+YcYmsv0QFoMGmrQMVrOR7xBdnAKYOy4I7eLvm/ZL45n1bB+GKtDeTysxWfpx08vI9psljLlOILU23XJqUGzbgalpja7no8ZPKabnfHGqksY67hmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HnoS8wHm; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HnoS8wHm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cK64L0Dvjz3cnk
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 07:37:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A9E645243;
	Sat,  6 Sep 2025 21:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC403C4CEF9;
	Sat,  6 Sep 2025 21:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194624;
	bh=qgC3ZMySIzbT7snif3jifRd6wEGhkdEbMg6+X/hdkEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HnoS8wHmNnAGXmjtE/Ly7bQ7EaKSHOs35JkeDWyFwsdG9Ef0wGj/vRGGJi9LdHgEG
	 6554LkhwPyJSQdav86Ah8LR1Az7qGvnT8pakFGsdrktTJPFodmNAYNDA7mplknq9hY
	 OW/gW6f8vnby4h7cHEhDMspXJQB2bekl39gTwXoKOksiJVJQ+fLpNSmlq3qGP4RllR
	 mruhQRhcwQXyF50nfeUOnWCxZ05ApEJuyYd5Ns1efTg6CeAPdnoat3/ddkoslV6bvx
	 BmzBRNBrkqfhfamYYWCtEEgKPMzOAiRgIM6VVp721vi9qCEbm0FQHrHW2VfmKizDAJ
	 oKm6HcxZ1EZYA==
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
Subject: [PATCH v2 08/12] lib/crypto: tests: Add Curve25519 benchmark
Date: Sat,  6 Sep 2025 14:35:19 -0700
Message-ID: <20250906213523.84915-9-ebiggers@kernel.org>
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

Add a benchmark to curve25519_kunit.  This brings it in line with the
other crypto KUnit tests and provides an easy way to measure
performance.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/curve25519_kunit.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/lib/crypto/tests/curve25519_kunit.c b/lib/crypto/tests/curve25519_kunit.c
index 0d1c46ca74018..355ad79a210d1 100644
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
@@ -1314,13 +1315,43 @@ static void test_curve25519_basepoint(struct kunit *test)
 		KUNIT_EXPECT_MEMEQ_MSG(test, out, out2, CURVE25519_KEY_SIZE,
 				       "in=%*phN", CURVE25519_KEY_SIZE, in);
 	}
 }
 
+static void benchmark_curve25519(struct kunit *test)
+{
+	const u8 *private = curve25519_test_vectors[0].private;
+	const u8 *public = curve25519_test_vectors[0].public;
+	const size_t warmup_niter = 5000;
+	const size_t benchmark_niter = 1024;
+	u8 out[CURVE25519_KEY_SIZE];
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
+		   div64_u64((u64)benchmark_niter * NSEC_PER_SEC, t ?: 1));
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


