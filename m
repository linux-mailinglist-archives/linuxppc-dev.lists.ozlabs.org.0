Return-Path: <linuxppc-dev+bounces-10616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FADB1A80A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:46:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwj7x71hmz3c95;
	Tue,  5 Aug 2025 02:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754325869;
	cv=none; b=AkiEvG7VoDZVzFBcq4aV9AIHl4h2Fv/NbzXhWd0htwjx/M3kbcZHgTAYcgW5rCfzjKc4IrChj+5uHqxNtxE5va3w96em1SJ6Ey81R7hQUzUcOjCUfX19Gu3T9CxqWRhmJjpJjNGoS3Quwqw7/2eQlN3i3wQpmjJBOVAx50DaD0T/8AMTTDv3U6FmACu5rPGHOY/3R05sKJnbHy8XX4cZL1Sxl3BwbTV4wRYhAC4EcPjNiAgjsOe5oIuso4f7Fny/WHB3IpYpvNwVIn8eSJ9xeFVURYf4nbyEsbnK6/r1fFUkBK/tuEBZEx4vfyH2oRnk3CMHzNQxSdCqgZrl1evSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754325869; c=relaxed/relaxed;
	bh=tP1wITA3PfWSqAm5igcoQY6rjMQk/vlV9wElj1RPMuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NSGV+R/yxquakuNd253jzJGWuaJBMswETp9IAeao/FJQzxbCn5QsO1DH5MDK6CGf96gjbfsh7EzmiYyQ2K5elhItlXDlvhO4E4lDUiJtdSvLJAYF6Ku4Soq+5KuA/CQnUyu8NqCuLNmclW8OIV5e6H8eclqV7MxPuoXyQfhfoXsQFqbUH+wSLfjeyOEVvOIlFZtSag6b6syoy9o3HhE10/i1jvKs4Eah/DRhY6YATs1pS7ky1B9PZiOCgUDldIDlb7OPRb1Xo2Nb6CcPf9DUyvOM+Y8OQ9Pc8QLsuqCJxenGkEBfq587NXp0UK/VGdCspGOOo/u3ShkodEP9jTvfjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eht0h6wa; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eht0h6wa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwj7v2vlhz3c78
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:44:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC8E045E9D;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4D0C19425;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=HdxC+YrG0RYotBTATCCMvdXpeJF/VSAnm1GW7teMP8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eht0h6wavbG5fQnbmTMV1LmgGtMtTND4AiQx88qlrbrKMG7q+I2KV9TG5su1TUwJl
	 9JdYbIVDZVFNRpe+KxrQj3yYkr4jIKgX9AM48OY/X2HUTDt/yQMqghpZgo8dI+lUiY
	 sPFgdBPotx0O5vmB6rNUrXXCO7pIkGlxNLrZo/VrhZoavzwFsJfvHQQ5GRxGNORwYq
	 ll8Z8hIgRcmL2pG5t8gqltpIuUcpQJARO85MAZKd2YSKMLDdNiWDCDoVxzSQxjvD/J
	 I98kgiMNwgfmoVibR8Ga7ysDFMZhTXmoCPMBAlSUtMbpOVSZMmG3i0SdT9ZJxpw6vZ
	 nJ6HuuSPbsIvw==
From: Kees Cook <kees@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 17/17] KUnit: ffs: Validate all the __attribute_const__ annotations
Date: Mon,  4 Aug 2025 09:44:13 -0700
Message-Id: <20250804164417.1612371-17-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3872; i=kees@kernel.org; h=from:subject; bh=HdxC+YrG0RYotBTATCCMvdXpeJF/VSAnm1GW7teMP8Q=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHsc45wRtnf/oYkjVF1ejQumtl0UPxWm1daQdPSSrw bs5K8W2o5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCKRWxgZOjz/P/l/pMCzl0Hu 27r4n4VL9jtHtEl/uSCclF54euLlvwz/qxb+jO8s3m0ks3bJu3DRTzNP+l7bENDeHCloJ86woVy TAwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute_const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Validate all the __attibute_const__ annotations were found for all
architectures by reproducing the specific problem encountered in the
original bug report.

Build and run tested with everything I could reach with KUnit:

$ ./tools/testing/kunit/kunit.py run --arch=x86_64 ffs
$ ./tools/testing/kunit/kunit.py run --arch=i386 ffs
$ ./tools/testing/kunit/kunit.py run --arch=arm64 --make_options "CROSS_COMPILE=aarch64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=arm --make_options "CROSS_COMPILE=arm-linux-gnueabi-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=powerpc ffs
$ ./tools/testing/kunit/kunit.py run --arch=powerpc32 ffs
$ ./tools/testing/kunit/kunit.py run --arch=powerpcle ffs
$ ./tools/testing/kunit/kunit.py run --arch=m68k ffs
$ ./tools/testing/kunit/kunit.py run --arch=loongarch ffs
$ ./tools/testing/kunit/kunit.py run --arch=s390 --make_options "CROSS_COMPILE=s390x-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=riscv --make_options "CROSS_COMPILE=riscv64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=riscv32 --make_options "CROSS_COMPILE=riscv64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=sparc --make_options "CROSS_COMPILE=sparc64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=sparc64 --make_options "CROSS_COMPILE=sparc64-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=alpha --make_options "CROSS_COMPILE=alpha-linux-gnu-" ffs
$ ./tools/testing/kunit/kunit.py run --arch=sh --make_options "CROSS_COMPILE=sh4-linux-gnu-" ffs

Closes: https://github.com/KSPP/linux/issues/364
Signed-off-by: Kees Cook <kees@kernel.org>
---
 lib/tests/ffs_kunit.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/lib/tests/ffs_kunit.c b/lib/tests/ffs_kunit.c
index ed11456b116e..9a329cdc09c2 100644
--- a/lib/tests/ffs_kunit.c
+++ b/lib/tests/ffs_kunit.c
@@ -496,6 +496,46 @@ static void ffz_edge_cases_test(struct kunit *test)
 	}
 }
 
+/*
+ * To have useful build error output, split the tests into separate
+ * functions so it's clear which are missing __attribute_const__.
+ */
+#define CREATE_WRAPPER(func)						\
+static noinline bool build_test_##func(void)				\
+{									\
+	int init_##func = 32;						\
+	int result_##func = func(6);					\
+									\
+	/* Does the static initializer vanish after calling func? */	\
+	BUILD_BUG_ON(init_##func < 32);					\
+									\
+	/* "Consume" the results so optimizer doesn't drop them. */	\
+	barrier_data(&init_##func);					\
+	barrier_data(&result_##func);					\
+									\
+	return true;							\
+}
+CREATE_WRAPPER(ffs)
+CREATE_WRAPPER(fls)
+CREATE_WRAPPER(__ffs)
+CREATE_WRAPPER(__fls)
+CREATE_WRAPPER(ffz)
+#undef CREATE_WRAPPER
+
+/*
+ * Make sure that __attribute_const__ has be applied to all the
+ * functions. This is a regression test for:
+ * https://github.com/KSPP/linux/issues/364
+ */
+static void ffs_attribute_const_test(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, build_test_ffs());
+	KUNIT_EXPECT_TRUE(test, build_test_fls());
+	KUNIT_EXPECT_TRUE(test, build_test___ffs());
+	KUNIT_EXPECT_TRUE(test, build_test___fls());
+	KUNIT_EXPECT_TRUE(test, build_test_ffz());
+}
+
 /*
  * KUnit test case definitions
  */
-- 
2.34.1


