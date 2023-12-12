Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED680F428
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:13:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XC29t80J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqQDM3JvSz3vw0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 04:13:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XC29t80J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqPzd3QvVz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 04:02:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2287CB817DD;
	Tue, 12 Dec 2023 17:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9478C433BF;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702400520;
	bh=ZjDU1zHd8o1X4E/Czs9R/8+piBqkvEHxIcMKe4kapR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XC29t80JvVNVn47Pshkossl7hy91V5kdkHE3Wi3zitLXt9ikqIdsFNw7SC3rgh3Ys
	 Hot3epxbm0d5URKvyBSHlnAE44ZZS8JDW/xiJWtsR+0OFZto7vC8s5+7cjGC28682z
	 yy10SCIouGmsgFIYcTnyLkYv6NtbiFRdfF4ctbjUvgh/XdN/aNLk1ivyKw3Db2HbP0
	 gmLgnJjGC+z3iqZbcW/oroev1JlVJKDqb2PoT34jEtz9aBueDmK+jxEVaQdMRDSsGq
	 LK9MaBC/kKFaqDKc/RE9wGAtnbgNzywdwrINM4wwWiNbdTQgoVFicweujaKYapTMT/
	 bQcHZJTz34udQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97DCC4167B;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 12 Dec 2023 11:02:00 -0600
Subject: [PATCH v6 13/13] powerpc/selftests: Add test for papr-sysparm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231212-papr-sys_rtas-vs-lockdown-v6-13-e9eafd0c8c6c@linux.ibm.com>
References:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
In-Reply-To:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702400519; l=6919;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=U+AuzZbE8Hdy3+M7m+3GC4Pc3MlEhnZoOej5ShbLU8w=;
 b=ne82ZenGNQELevD3LP1tRq8StKOSXP8w8sPl68J+6mziKo0XCJ+tbG3vuWUzDRUytLs768fRl
 hoFjwLkDV76DErE0C+iVtgQJZfvBNJSxsv7Ng/x4cJlYYkI3XNJXnus
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Consistently testing system parameter access is a bit difficult by
nature -- the set of parameters available depends on the model and
system configuration, and updating a parameter should be considered a
destructive operation reserved for the admin.

So we validate some of the error paths and retrieve the SPLPAR
characteristics string, but not much else.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 tools/testing/selftests/powerpc/Makefile           |   1 +
 .../selftests/powerpc/papr_sysparm/.gitignore      |   1 +
 .../selftests/powerpc/papr_sysparm/Makefile        |  12 ++
 .../selftests/powerpc/papr_sysparm/papr_sysparm.c  | 196 +++++++++++++++++++++
 4 files changed, 210 insertions(+)

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 05fc68d446c2..c376151982c4 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -33,6 +33,7 @@ SUB_DIRS = alignment		\
 	   math		\
 	   papr_attributes	\
 	   papr_vpd		\
+	   papr_sysparm		\
 	   ptrace	\
 	   security	\
 	   mce
diff --git a/tools/testing/selftests/powerpc/papr_sysparm/.gitignore b/tools/testing/selftests/powerpc/papr_sysparm/.gitignore
new file mode 100644
index 000000000000..f2a69bf59d40
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_sysparm/.gitignore
@@ -0,0 +1 @@
+/papr_sysparm
diff --git a/tools/testing/selftests/powerpc/papr_sysparm/Makefile b/tools/testing/selftests/powerpc/papr_sysparm/Makefile
new file mode 100644
index 000000000000..7f79e437634a
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_sysparm/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+noarg:
+	$(MAKE) -C ../
+
+TEST_GEN_PROGS := papr_sysparm
+
+top_srcdir = ../../../../..
+include ../../lib.mk
+
+$(TEST_GEN_PROGS): ../harness.c ../utils.c
+
+$(OUTPUT)/papr_sysparm: CFLAGS += $(KHDR_INCLUDES)
diff --git a/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
new file mode 100644
index 000000000000..d5436de5b8ed
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+#include <asm/papr-sysparm.h>
+
+#include "utils.h"
+
+#define DEVPATH "/dev/papr-sysparm"
+
+static int open_close(void)
+{
+	const int devfd = open(DEVPATH, O_RDONLY);
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+	FAIL_IF(close(devfd) != 0);
+
+	return 0;
+}
+
+static int get_splpar(void)
+{
+	struct papr_sysparm_io_block sp = {
+		.parameter = 20, // SPLPAR characteristics
+	};
+	const int devfd = open(DEVPATH, O_RDONLY);
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+	FAIL_IF(ioctl(devfd, PAPR_SYSPARM_IOC_GET, &sp) != 0);
+	FAIL_IF(sp.length == 0);
+	FAIL_IF(sp.length > sizeof(sp.data));
+	FAIL_IF(close(devfd) != 0);
+
+	return 0;
+}
+
+static int get_bad_parameter(void)
+{
+	struct papr_sysparm_io_block sp = {
+		.parameter = UINT32_MAX, // there are only ~60 specified parameters
+	};
+	const int devfd = open(DEVPATH, O_RDONLY);
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	// Ensure expected error
+	FAIL_IF(ioctl(devfd, PAPR_SYSPARM_IOC_GET, &sp) != -1);
+	FAIL_IF(errno != EOPNOTSUPP);
+
+	// Ensure the buffer is unchanged
+	FAIL_IF(sp.length != 0);
+	for (size_t i = 0; i < ARRAY_SIZE(sp.data); ++i)
+		FAIL_IF(sp.data[i] != 0);
+
+	FAIL_IF(close(devfd) != 0);
+
+	return 0;
+}
+
+static int check_efault_common(unsigned long cmd)
+{
+	const int devfd = open(DEVPATH, O_RDWR);
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	// Ensure expected error
+	FAIL_IF(ioctl(devfd, cmd, NULL) != -1);
+	FAIL_IF(errno != EFAULT);
+
+	FAIL_IF(close(devfd) != 0);
+
+	return 0;
+}
+
+static int check_efault_get(void)
+{
+	return check_efault_common(PAPR_SYSPARM_IOC_GET);
+}
+
+static int check_efault_set(void)
+{
+	return check_efault_common(PAPR_SYSPARM_IOC_SET);
+}
+
+static int set_hmc0(void)
+{
+	struct papr_sysparm_io_block sp = {
+		.parameter = 0, // HMC0, not a settable parameter
+	};
+	const int devfd = open(DEVPATH, O_RDWR);
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	// Ensure expected error
+	FAIL_IF(ioctl(devfd, PAPR_SYSPARM_IOC_SET, &sp) != -1);
+	SKIP_IF_MSG(errno == EOPNOTSUPP, "operation not supported");
+	FAIL_IF(errno != EPERM);
+
+	FAIL_IF(close(devfd) != 0);
+
+	return 0;
+}
+
+static int set_with_ro_fd(void)
+{
+	struct papr_sysparm_io_block sp = {
+		.parameter = 0, // HMC0, not a settable parameter.
+	};
+	const int devfd = open(DEVPATH, O_RDONLY);
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	// Ensure expected error
+	FAIL_IF(ioctl(devfd, PAPR_SYSPARM_IOC_SET, &sp) != -1);
+	SKIP_IF_MSG(errno == EOPNOTSUPP, "operation not supported");
+
+	// HMC0 isn't a settable parameter and we would normally
+	// expect to get EPERM on attempts to modify it. However, when
+	// the file is open read-only, we expect the driver to prevent
+	// the attempt with a distinct error.
+	FAIL_IF(errno != EBADF);
+
+	FAIL_IF(close(devfd) != 0);
+
+	return 0;
+}
+
+struct sysparm_test {
+	int (*function)(void);
+	const char *description;
+};
+
+static const struct sysparm_test sysparm_tests[] = {
+	{
+		.function = open_close,
+		.description = "open and close " DEVPATH " without issuing commands",
+	},
+	{
+		.function = get_splpar,
+		.description = "retrieve SPLPAR characteristics",
+	},
+	{
+		.function = get_bad_parameter,
+		.description = "verify EOPNOTSUPP for known-bad parameter",
+	},
+	{
+		.function = check_efault_get,
+		.description = "PAPR_SYSPARM_IOC_GET returns EFAULT on bad address",
+	},
+	{
+		.function = check_efault_set,
+		.description = "PAPR_SYSPARM_IOC_SET returns EFAULT on bad address",
+	},
+	{
+		.function = set_hmc0,
+		.description = "ensure EPERM on attempt to update HMC0",
+	},
+	{
+		.function = set_with_ro_fd,
+		.description = "PAPR_IOC_SYSPARM_SET returns EACCESS on read-only fd",
+	},
+};
+
+int main(void)
+{
+	size_t fails = 0;
+
+	for (size_t i = 0; i < ARRAY_SIZE(sysparm_tests); ++i) {
+		const struct sysparm_test *t = &sysparm_tests[i];
+
+		if (test_harness(t->function, t->description))
+			++fails;
+	}
+
+	return fails == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
+}

-- 
2.41.0

