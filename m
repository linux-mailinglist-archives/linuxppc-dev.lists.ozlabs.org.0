Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 439DC8BB819
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 01:17:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWRXY6dj8z86wK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 09:17:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW9wv3ptcz3cg1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 23:03:59 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16001762;
	Fri,  3 May 2024 06:03:53 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 503FB3F881;
	Fri,  3 May 2024 06:03:25 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 28/29] kselftest/arm64: Add test case for POR_EL0 signal frame records
Date: Fri,  3 May 2024 14:01:46 +0100
Message-Id: <20240503130147.1154804-29-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240503130147.1154804-1-joey.gouly@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 04 May 2024 09:04:53 +1000
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, joey.gouly@arm.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ensure that we get signal context for POR_EL0 if and only if POE is present
on the system.

Copied from the TPIDR2 test.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
---
 .../testing/selftests/arm64/signal/.gitignore |  1 +
 .../arm64/signal/testcases/poe_siginfo.c      | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c

diff --git a/tools/testing/selftests/arm64/signal/.gitignore b/tools/testing/selftests/arm64/signal/.gitignore
index 1ce5b5eac386..b2f2bfd5c6aa 100644
--- a/tools/testing/selftests/arm64/signal/.gitignore
+++ b/tools/testing/selftests/arm64/signal/.gitignore
@@ -2,6 +2,7 @@
 mangle_*
 fake_sigreturn_*
 fpmr_*
+poe_*
 sme_*
 ssve_*
 sve_*
diff --git a/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c b/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
new file mode 100644
index 000000000000..d890029304c4
--- /dev/null
+++ b/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Arm Limited
+ *
+ * Verify that the POR_EL0 register context in signal frames is set up as
+ * expected.
+ */
+
+#include <signal.h>
+#include <ucontext.h>
+#include <sys/auxv.h>
+#include <sys/prctl.h>
+#include <unistd.h>
+#include <asm/sigcontext.h>
+
+#include "test_signals_utils.h"
+#include "testcases.h"
+
+static union {
+	ucontext_t uc;
+	char buf[1024 * 128];
+} context;
+
+#define SYS_POR_EL0 "S3_3_C10_C2_4"
+
+static uint64_t get_por_el0(void)
+{
+	uint64_t val;
+
+	asm volatile (
+		"mrs	%0, " SYS_POR_EL0 "\n"
+		: "=r"(val)
+		:
+		: "cc");
+
+	return val;
+}
+
+int poe_present(struct tdescr *td, siginfo_t *si, ucontext_t *uc)
+{
+	struct _aarch64_ctx *head = GET_BUF_RESV_HEAD(context);
+	struct poe_context *poe_ctx;
+	size_t offset;
+	bool in_sigframe;
+	bool have_poe;
+	__u64 orig_poe;
+
+	have_poe = getauxval(AT_HWCAP2) & HWCAP2_POE;
+	if (have_poe)
+		orig_poe = get_por_el0();
+
+	if (!get_current_context(td, &context.uc, sizeof(context)))
+		return 1;
+
+	poe_ctx = (struct poe_context *)
+		get_header(head, POE_MAGIC, td->live_sz, &offset);
+
+	in_sigframe = poe_ctx != NULL;
+
+	fprintf(stderr, "POR_EL0 sigframe %s on system %s POE\n",
+		in_sigframe ? "present" : "absent",
+		have_poe ? "with" : "without");
+
+	td->pass = (in_sigframe == have_poe);
+
+	/*
+	 * Check that the value we read back was the one present at
+	 * the time that the signal was triggered.
+	 */
+	if (have_poe && poe_ctx) {
+		if (poe_ctx->por_el0 != orig_poe) {
+			fprintf(stderr, "POR_EL0 in frame is %llx, was %llx\n",
+				poe_ctx->por_el0, orig_poe);
+			td->pass = false;
+		}
+	}
+
+	return 0;
+}
+
+struct tdescr tde = {
+	.name = "POR_EL0",
+	.descr = "Validate that POR_EL0 is present as expected",
+	.timeout = 3,
+	.run = poe_present,
+};
-- 
2.25.1

