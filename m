Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024F78096C1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 00:48:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kW8IO0rs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmWDS3G9Dz3vhc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 10:48:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kW8IO0rs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmW1X39SVz3cT7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 10:38:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 860CEB82AC7;
	Thu,  7 Dec 2023 23:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C50FC433C8;
	Thu,  7 Dec 2023 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701992315;
	bh=9z/VDRgTOQ+grkqib4xtMWJ6wjMNVEH2RxbqB6HQCYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kW8IO0rsNO50cnxhVDUi67Lfps473oApvghiUaRUVYM/tsm51ovvwAT538P2dbO74
	 XZ1hcqN6VSoU3FZttz9sZQ2NDsezwk/YLMatbU3mGwvABgaSGHvkvWc4gA33CIZb0I
	 ChpWphzFeml8nllHu5fqDNg9lYUwDj3UoIqfZCDPY8sDMZ9s/VPvDu5dxfSjq7ZxXZ
	 LiwMuvEdLId2mnbEHtCF2Fk/G/juEehUGg5aF0+KekB5MfNJV/qMblsNcTGQ5btTSc
	 mmuU8z5uTUQKLxg/3ymt8gH6uck65BfeWCSj5e1kVA7wxMCKegiOOyLJvNhLgtpEao
	 k76fobcCg+G7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5B3C10DC3;
	Thu,  7 Dec 2023 23:38:35 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 07 Dec 2023 17:35:52 -0600
Subject: [PATCH v5 13/13] powerpc/selftests: Add test for papr-sysparm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231207-papr-sys_rtas-vs-lockdown-v5-13-2ce965636a58@linux.ibm.com>
References:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
In-Reply-To:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701992313; l=6039;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=ducrKfswVTVhi6LZ07K+mUoOfeocSLYQ9YCd2ZJkwbs=;
 b=A9Vm1H3dCb6pqz/U/ogt3qHypJ5vNOVn45csyDvmYAq6oiirLlpSfAI1MP8qWh16NrpQx/+D6
 tV1dJTVO/H9BoGeA1GKG2dECdzEFQfTIK2KHQWnhAo+AUUoFjB23dLr
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
 .../selftests/powerpc/papr_sysparm/papr_sysparm.c  | 165 +++++++++++++++++++++
 4 files changed, 179 insertions(+)

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
index 000000000000..9d4850c25aed
--- /dev/null
+++ b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
@@ -0,0 +1,165 @@
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
+	SKIP_IF_MSG(errno == EOPNOTSUPP, "operation not supported");
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

