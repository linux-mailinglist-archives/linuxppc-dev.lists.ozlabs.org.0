Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE7F7BC0E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 23:04:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UhNTLFs3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2LXK1pXNz3vgC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 08:04:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UhNTLFs3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2LSW6W5Qz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 08:01:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94116614EC;
	Fri,  6 Oct 2023 21:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0370C43391;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626071;
	bh=Fbq3d5SfOCCfGirHcaJp6imDPaQZA/Wd12BpsFjKol4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UhNTLFs30Bp4gPJ7VUSodBa/h7liC7SV11uFLncP4o0gmlivgmXqYxgwhAz3n8syF
	 Bly0gjHYwC305MroKmyTeXeRTGFK1WsEL7Hvpof0AteZxbHSPyIALhQ0PKf1OoQr9v
	 B3wUo5Kjb/A8vS39lTlnLujemmGdA0vwkqEDliOLWz43hDsf6MgGwYWFsWTG0xV8nN
	 WVyDTqeRyThke7IjmD0C9+uUp6DH4A47oVPcb5zHP2FO3JZorf+Ni968p8tj4hQVgq
	 35E0fWA+YCGb0vztVUk94wOZ1xezVe5Bqxoj2ytIsBug/++PM0fo+x1EGa6dVv1lZH
	 7dx8BU2pHaDtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF80E9411C;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 06 Oct 2023 16:01:10 -0500
Subject: [PATCH 7/7] powerpc/selftests: add test for papr-sysparm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231006-papr-sys_rtas-vs-lockdown-v1-7-3a36bfb66e2e@linux.ibm.com>
References:  <20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com>
In-Reply-To:  <20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696626070; l=5975;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=Gud1aDPXi5gwBA6uWmnVHj9xhhAyFG01m+C6FGtJFX0=;
 b=3xi5ojVc7POFvTnRMdVDfbXDz87HRoAe94uP/2/0Torsq3ZeQKUN79xlpDfkz5mePvXcCja/t
 WQOAqZ0iNamAm2hyuB9q6E3ep5jyLIR7pQp7h20zLX8oTS1Y/TuDRbq
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

