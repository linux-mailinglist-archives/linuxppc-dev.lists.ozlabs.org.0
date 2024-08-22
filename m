Return-Path: <linuxppc-dev+bounces-390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D803195B9DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:15:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYj0Fc9z2ynf;
	Fri, 23 Aug 2024 01:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339641;
	cv=none; b=NYa7PImMBBTZZFR0nNQm5VpTJTGXbHC8J9vO9LPxz2Be1MWioPplYN5hsI6RM5SIgza5jHKmNTnEykzbeaBP4f+MTzXwkilxvae90a/jutVsopzxpsmZvp3bIVnSehfDBl/VJYRJLQJBf5ZumqPqtzkNg0lNgvm6T2Qmc7vxsLX6s9L8BZMe7uYrlLKe9qeNt8RoVnL2Sx42iTxWwcGLsIWfU42i5NAwORTxuuNIok1MK3qtJFcazc+0Kj9CN45JGzuO4mAZ32Xt9WMEQAHhzR5RMJeYriFXuDWy0q4ziG4ySQeywU7FnoWgRU6Jr9NIRGdkiDsmmRsXcahiWbml4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339641; c=relaxed/relaxed;
	bh=0v2110ndxTNPQPfCkNdnXDwPtBR9iCN3D470MJVMX2Y=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=NxywkdEvTdLMkzdmM6Z3KeolrPweTkz78EHgKjP2C1tGPisH/QVGC5Y9ehfgHpnAi4Oe18iEHNb+7JqGX1TG2/9nl4bYhDkgMWTsA9Hth6hmnG8xMIjVx2oT6OzitHD69gXfLxifsc5VTdfnhvLIoZOJFAPwTahUCKExEuqFsg+Ij6ZdVS0M/BI3P+SJujkf+pGTPAS+6UmSokTWqNgLqZ0EXrIVqTGdn4n8DETXunth7Fim3oUTQilCC5O6XoHc+GjHzUdHAMD7hoAzN2aNIhN9UUCKEiYwBazJazqGIb9iI2a8GJmfhSxEkjLA7/6OVI1zQ0MTA12T2hlZen+YqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRYh4Yhyz2yhg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:14:00 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C52391691;
	Thu, 22 Aug 2024 08:13:55 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A68193F58B;
	Thu, 22 Aug 2024 08:13:25 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 29/30] kselftest/arm64: Add test case for POR_EL0 signal frame records
Date: Thu, 22 Aug 2024 16:11:12 +0100
Message-Id: <20240822151113.1479789-30-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that we get signal context for POR_EL0 if and only if POE is present
on the system.

Copied from the TPIDR2 test.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
Acked-by: Shuah Khan <skhan@linuxfoundation.org>
---
 .../testing/selftests/arm64/signal/.gitignore |  1 +
 .../arm64/signal/testcases/poe_siginfo.c      | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c

diff --git tools/testing/selftests/arm64/signal/.gitignore tools/testing/selftests/arm64/signal/.gitignore
index 1ce5b5eac386..b2f2bfd5c6aa 100644
--- tools/testing/selftests/arm64/signal/.gitignore
+++ tools/testing/selftests/arm64/signal/.gitignore
@@ -2,6 +2,7 @@
 mangle_*
 fake_sigreturn_*
 fpmr_*
+poe_*
 sme_*
 ssve_*
 sve_*
diff --git tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
new file mode 100644
index 000000000000..36bd9940ee05
--- /dev/null
+++ tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
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
+	asm volatile(
+		"mrs	%0, " SYS_POR_EL0 "\n"
+		: "=r"(val)
+		:
+		: );
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


