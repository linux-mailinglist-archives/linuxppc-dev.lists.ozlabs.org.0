Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C6143ADC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 11:24:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4824QJ6JmxzDqR0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 21:24:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anju@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4824H10ZFyzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 21:17:48 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LAHZPr124480
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 05:17:46 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xmgbq3p1k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 05:17:45 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Tue, 21 Jan 2020 10:17:44 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 Jan 2020 10:17:41 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00LAHefl37224614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 10:17:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DD9EA4067;
 Tue, 21 Jan 2020 10:17:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B16EA4064;
 Tue, 21 Jan 2020 10:17:39 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.62.176])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jan 2020 10:17:39 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 4/5] selftest/powerpc/pmc: Support to include interface
 test for Memory Counter PMUs
Date: Tue, 21 Jan 2020 15:47:27 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121101728.14858-1-anju@linux.vnet.ibm.com>
References: <20200121101728.14858-1-anju@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012110-0012-0000-0000-0000037F508F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012110-0013-0000-0000-000021BB901B
Message-Id: <20200121101728.14858-5-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_02:2020-01-21,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001210088
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
Cc: nasastry@in.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Patch to add support to include interface tests for
memory counter PMUs as part of selftest.
These PMUs are primarily used to understand socket/chip/core
resourage usage. In PowerNV envirnoment, the perf interface
registered to access these counters are called "In Memory Collection"
(IMC) and in PowerVM, the perf interface registered to access
these counters are called "hv_24x7".

New folder "mem_counters" added under selftest/powerpc/pmu.
This will include interface tests for both "imc" and "hv_24x7"
pmus. Patch adds base/common functioned needed.
To make blame easier, a place-holder test function added to
this patch. Subsequent patch will fill in the actual test
content.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 tools/testing/selftests/powerpc/pmu/Makefile  |  7 +-
 .../powerpc/pmu/mem_counters/Makefile         | 21 ++++
 .../pmu/mem_counters/imc_global_lock_test.c   | 21 ++++
 .../powerpc/pmu/mem_counters/mem_counters.c   | 99 +++++++++++++++++++
 .../powerpc/pmu/mem_counters/mem_counters.h   | 36 +++++++
 5 files changed, 182 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/mem_counters/Makefile
 create mode 100644 tools/testing/selftests/powerpc/pmu/mem_counters/imc_global_lock_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.h

diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
index 19046db995fe..e352eceac0a9 100644
--- a/tools/testing/selftests/powerpc/pmu/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/Makefile
@@ -8,7 +8,7 @@ EXTRA_SOURCES := ../harness.c event.c lib.c ../utils.c
 top_srcdir = ../../../../..
 include ../../lib.mk
 
-all: $(TEST_GEN_PROGS) ebb
+all: $(TEST_GEN_PROGS) ebb mem_counters
 
 $(TEST_GEN_PROGS): $(EXTRA_SOURCES)
 
@@ -43,4 +43,7 @@ clean:
 ebb:
 	TARGET=$@; BUILD_TARGET=$$OUTPUT/$$TARGET; mkdir -p $$BUILD_TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -k -C $$TARGET all
 
-.PHONY: all run_tests clean ebb
+mem_counters:
+	TARGET=$@; BUILD_TARGET=$$OUTPUT/$$TARGET; mkdir -p $$BUILD_TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -k -C $$TARGET all
+
+.PHONY: all run_tests clean ebb mem_counters
diff --git a/tools/testing/selftests/powerpc/pmu/mem_counters/Makefile b/tools/testing/selftests/powerpc/pmu/mem_counters/Makefile
new file mode 100644
index 000000000000..f39ebe30ab70
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/mem_counters/Makefile
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0
+include ../../../../../../scripts/Kbuild.include
+
+noarg:
+	$(MAKE) -C ../../
+
+CFLAGS += -m64
+
+# Toolchains may build PIE by default which breaks the assembly
+no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
+        $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)
+
+LDFLAGS += $(no-pie-option)
+
+TEST_GEN_PROGS := imc_global_lock_test
+
+top_srcdir = ../../../../../..
+include ../../../lib.mk
+
+$(TEST_GEN_PROGS): ../../harness.c ../../utils.c ../event.c ../lib.c ./mem_counters.c \
+			imc_global_lock_test.c
diff --git a/tools/testing/selftests/powerpc/pmu/mem_counters/imc_global_lock_test.c b/tools/testing/selftests/powerpc/pmu/mem_counters/imc_global_lock_test.c
new file mode 100644
index 000000000000..ea687ffc1990
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/mem_counters/imc_global_lock_test.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020, Madhavan Srinivasan, IBM Corp.
+ */
+
+#include "mem_counters.h"
+
+static int testcase(void)
+{
+	return 0;
+}
+
+static int imc_global_lock_test(void)
+{
+	return eat_cpu(testcase);
+}
+
+int main(void)
+{
+	return test_harness(imc_global_lock_test, "imc_global_lock_test");
+}
diff --git a/tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.c b/tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.c
new file mode 100644
index 000000000000..b0ee1319f018
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020, Madhavan Srinivasan, IBM Corp.
+ */
+
+#include "mem_counters.h"
+
+/*
+ * mem_counters.c will contain common/basic functions
+ * to support testcases for both In Memory Collection (IMC)
+ * and hv_24x7 counters.
+ */
+
+
+/*
+ * Since device type enum starts with 1,
+ * have the first entry in the array as a placeholder.
+ */
+const char mem_counters_dev_path[][30] = {
+	"",
+	"/sys/devices/thread_imc",
+	"/sys/devices/trace_imc",
+	"/sys/devices/core_imc",
+	"/sys/devices/hv_24x7",
+	"",
+};
+
+const char mem_counters_dev_type_path[][35] = {
+	"",
+	"/sys/devices/thread_imc/type",
+	"/sys/devices/trace_imc/type",
+	"/sys/devices/core_imc/type",
+	"/sys/devices/hv_24x7/type",
+	"",
+};
+
+
+static bool is_mem_counters_dev_registered(int dtype)
+{
+	if (!access(mem_counters_dev_path[dtype], F_OK))
+		return true;
+
+	return false;
+}
+
+bool is_mem_counters_device_enabled(int dtype)
+{
+	switch (dtype) {
+	case THREAD:
+		if (is_mem_counters_dev_registered(THREAD))
+			return true;
+	case TRACE:
+		if (is_mem_counters_dev_registered(TRACE))
+			return true;
+		break;
+	case CORE:
+		if (is_mem_counters_dev_registered(CORE))
+			return true;
+	case HV_24X7:
+		if (is_mem_counters_dev_registered(HV_24X7))
+			return true;
+	};
+
+	return false;
+}
+
+int get_mem_counters_pmu_type_val(int dtype)
+{
+	FILE *fp = NULL;
+	char buf[10];
+	int val;
+
+	fp = fopen(mem_counters_dev_type_path[dtype], "r");
+	if (!fp) {
+		perror("Failed to open\n");
+		return -1;
+	}
+
+	if (!fgets(buf, 10, fp)) {
+		perror("Failed to read\n");
+		return -1;
+	}
+
+	fclose(fp);
+	val = atoi(buf);
+	return val;
+}
+
+int setup_mem_counters_event(int dtype, struct event *e, u64 config, char *name)
+{
+	int val = get_mem_counters_pmu_type_val(dtype);
+
+	if (val > 0) {
+		event_init_opts(e, config, val, name);
+		return 0;
+	}
+
+	return -1;
+}
diff --git a/tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.h b/tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.h
new file mode 100644
index 000000000000..16456e5fc9de
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright 2020, Madhavan Srinivasan, IBM Corp.
+ */
+
+#ifndef _SELFTESTS_POWERPC_PMU_IMC_IMC_H
+#define _SELFTESTS_POWERPC_PMU_IMC_IMC_H
+
+#define _GNU_SOURCE
+#include <unistd.h>
+#include <sys/syscall.h>
+#include <string.h>
+#include <stdio.h>
+#include <stdbool.h>
+#include <error.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+#include <sys/prctl.h>
+
+#include "../event.h"
+#include "../lib.h"
+
+
+enum MEM_COUNTERS_DEV_TYPE{
+	THREAD = 0x1,
+	TRACE,
+	CORE,
+	HV_24X7,
+};
+
+extern bool is_mem_counters_device_enabled(int dtype);
+extern int get_mem_counters_pmu_type_val(int dtype);
+extern int setup_mem_counters_event(int dtype, struct event *e, u64 config, char *name);
+
+#endif /* _SELFTESTS_POWERPC_PMU_IMC_IMC_H */
-- 
2.20.1

