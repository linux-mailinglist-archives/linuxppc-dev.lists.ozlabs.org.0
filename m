Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF32C7C8F6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 23:39:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ClvUHqS/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6fyp5JRsz3vhy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 08:38:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ClvUHqS/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6fqH28Xyz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 08:32:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73B7B621FB;
	Fri, 13 Oct 2023 21:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F2C1C433AB;
	Fri, 13 Oct 2023 21:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697232741;
	bh=NqLn1HzlIqC83VJ9LsyJ+WAWE/A8xgNkZy7sTUzTd4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ClvUHqS/85ke//vjGPirbpJ948WTlz/hPwxuds8CJgdw8i2k0Vrh7SHXuGllHPiTB
	 CezRw5Q0nbBMYPJ0unGWa8cNSVVdPlBM+DJuIcnN9nWqz/Z9sV86X55+Pa/zZcSlud
	 cBsq3lEeQwA9P/BNdH4AvvYR55gCGT46StrPi5z/EVaE9vPQax7dZIuREYMKePc+Ku
	 0x5R4lkwhQKrIKo56zcXLYGc5mvCEe3rm88nhWdmbon8gGm2r0RfnB00DMSFzGTzuX
	 oJ+jvPe4zkUAi5NRzYV/+legw4gRJXzmbav1qG3YDIKalMyuv1G4y7FaxPIzaBu8Ac
	 L6Sci4vYdxihw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D502CDB482;
	Fri, 13 Oct 2023 21:32:21 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 13 Oct 2023 16:32:14 -0500
Subject: [PATCH v2 7/7] powerpc/selftests: add test for papr-sysparm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231013-papr-sys_rtas-vs-lockdown-v2-7-ead01ce01722@linux.ibm.com>
References:  <20231013-papr-sys_rtas-vs-lockdown-v2-0-ead01ce01722@linux.ibm.com>
In-Reply-To:  <20231013-papr-sys_rtas-vs-lockdown-v2-0-ead01ce01722@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697232739; l=5975;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=EyKsLg5PlqamjBFZY7FoxQ1n1iuFYypDgQInBUtVOl0=;
 b=w4Htru5nKYcge98GU3TLoyLwedlfA/JHysf/K7W2AnTxpIScNqGemcEdN4KEvrKNTlDU+Q2m+
 BGxsGda6ZN6DOeidzzPEWGIVbtREBMKwuqMROKQ5hus3rmpRSGhZkn3
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
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
 .../selftests/powerpc/papr_sysparm/papr_sysparm.c  | 164 +++++++++++++++++++++
 4 files changed, 178 insertions(+)

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 7de972612786..2f3fa91a1f52 100644
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
index 000000000000..fc25c03e8bc7
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
@@ -0,0 +1,164 @@
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
+	const int devfd = open(DEVPATH, O_RDONLY);
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
+	const int devfd = open(DEVPATH, O_RDONLY);
+
+	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,
+		    DEVPATH " not present");
+
+	FAIL_IF(devfd < 0);
+
+	// Ensure expected error
+	FAIL_IF(ioctl(devfd, PAPR_SYSPARM_IOC_SET, &sp) != -1);
+	FAIL_IF(errno != EPERM);
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

