Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B4F49DB58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:22:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JksW24nJyz3cZN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:22:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WNB1uxto;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WNB1uxto; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksSv2MW3z306f
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:02 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R6BaAQ006113; 
 Thu, 27 Jan 2022 07:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=44Y9l6MIKXWSUJK+AI/MUwYqaXfMtBDECXVqAK3o5Xk=;
 b=WNB1uxto6iSg+/HAWK8KwhfO+SmQMRXsbbAwRpziPJ5jdwdhwk0DY2n/Pcei8Sculbn9
 sDUR1+qr/bEKt6BCuVQ8qiC5xeZjXH+wlFlwqbfG2YZnKYFW45o/dWSv7jnQ0DJPDa+V
 FRnbs5kM6YZhUpwXhEMW1SVKxRETvUeCL4F5siZG99QwjWacA4Yi+z3Xs6GHMmznUWYo
 OTa+pueg6crvWEX0AibA+km6y8TZgByWg1xbxWLQgPVcHj8yDxFjPsH8xU3A/ENP0Xb3
 FbsF5H3rpmX/YkE6F8GXMqO5versqtsF5AxDpSf725HwJxeqmLciERdWxFshwhIpy8Oz uQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dunwh1daj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:20:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R784Eo016044;
 Thu, 27 Jan 2022 07:20:56 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3dr9j9mn31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:20:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7KqmX30081348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:20:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6C8D42042;
 Thu, 27 Jan 2022 07:20:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF2CA42045;
 Thu, 27 Jan 2022 07:20:50 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:20:50 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 02/20] selftest/powerpc/pmu: Add support for perf sampling
 tests
Date: Thu, 27 Jan 2022 12:49:54 +0530
Message-Id: <20220127072012.662451-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d5aOacdUzSvsc8UPnv-8vyt_fJCOQalz
X-Proofpoint-ORIG-GUID: d5aOacdUzSvsc8UPnv-8vyt_fJCOQalz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270040
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Add support functions for enabling perf sampling test in
a new folder "sampling_tests" under "selftests/powerpc/pmu".
This includes support functions for allocating and processing
the mmap buffer. These functions are added/defined in
"sampling_tests/misc.*" files.

Also updates the corresponding Makefiles in "selftests/powerpc"
and "sampling_tests" folder.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/testing/selftests/powerpc/pmu/Makefile  |  11 +-
 .../powerpc/pmu/sampling_tests/Makefile       |  20 ++++
 .../powerpc/pmu/sampling_tests/misc.c         | 105 ++++++++++++++++++
 .../powerpc/pmu/sampling_tests/misc.h         |   9 ++
 4 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h

diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
index 904672fb78dd..edbd96d3b2ab 100644
--- a/tools/testing/selftests/powerpc/pmu/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/Makefile
@@ -8,7 +8,7 @@ EXTRA_SOURCES := ../harness.c event.c lib.c ../utils.c
 top_srcdir = ../../../../..
 include ../../lib.mk
 
-all: $(TEST_GEN_PROGS) ebb
+all: $(TEST_GEN_PROGS) ebb sampling_tests
 
 $(TEST_GEN_PROGS): $(EXTRA_SOURCES)
 
@@ -26,25 +26,32 @@ DEFAULT_RUN_TESTS := $(RUN_TESTS)
 override define RUN_TESTS
 	$(DEFAULT_RUN_TESTS)
 	TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
+	TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
 endef
 
 DEFAULT_EMIT_TESTS := $(EMIT_TESTS)
 override define EMIT_TESTS
 	$(DEFAULT_EMIT_TESTS)
 	TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
+	TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
 endef
 
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
 	TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
+	TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
 endef
 
 clean:
 	$(RM) $(TEST_GEN_PROGS) $(OUTPUT)/loop.o
 	TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
+	TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
 
 ebb:
 	TARGET=$@; BUILD_TARGET=$$OUTPUT/$$TARGET; mkdir -p $$BUILD_TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -k -C $$TARGET all
 
-.PHONY: all run_tests clean ebb
+sampling_tests:
+	TARGET=$@; BUILD_TARGET=$$OUTPUT/$$TARGET; mkdir -p $$BUILD_TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -k -C $$TARGET all
+
+.PHONY: all run_tests clean ebb sampling_tests
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
new file mode 100644
index 000000000000..eb00c9f931ec
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0
+include ../../../../../../scripts/Kbuild.include
+
+all: $(TEST_GEN_PROGS)
+
+noarg:
+	$(MAKE) -C ../../
+
+CFLAGS += -m64 -I../../../../../lib/
+
+# Toolchains may build PIE by default which breaks the assembly
+no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
+	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)
+
+LDFLAGS += $(no-pie-option)
+
+top_srcdir = ../../../../../..
+include ../../../lib.mk
+
+$(TEST_GEN_PROGS): ../../harness.c ../../utils.c ../event.c ../lib.c misc.c misc.h
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
new file mode 100644
index 000000000000..4779b107f43b
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
+ */
+
+#include <unistd.h>
+#include <sys/syscall.h>
+#include <string.h>
+#include <stdio.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <stdlib.h>
+#include <ctype.h>
+
+#include "misc.h"
+
+#define PAGE_SIZE               sysconf(_SC_PAGESIZE)
+
+/*
+ * Allocate mmap buffer of "mmap_pages" number of
+ * pages.
+ */
+void *event_sample_buf_mmap(int fd, int mmap_pages)
+{
+	size_t page_size = sysconf(_SC_PAGESIZE);
+	size_t mmap_size;
+	void *buff;
+
+	if (mmap_pages <= 0)
+		return NULL;
+
+	if (fd <= 0)
+		return NULL;
+
+	mmap_size =  page_size * (1 + mmap_pages);
+	buff = mmap(NULL, mmap_size,
+		PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+
+	if (buff == MAP_FAILED) {
+		perror("mmap() failed.");
+		return NULL;
+	}
+	return buff;
+}
+
+/*
+ * Post process the mmap buffer.
+ * - If sample_count != NULL then return count of total
+ *   number of samples present in the mmap buffer.
+ * - If sample_count == NULL then return the address
+ *   of first sample from the mmap buffer
+ */
+void *__event_read_samples(void *sample_buff, size_t *size, u64 *sample_count)
+{
+	size_t page_size = sysconf(_SC_PAGESIZE);
+	struct perf_event_header *header = sample_buff + page_size;
+	struct perf_event_mmap_page *metadata_page = sample_buff;
+	unsigned long data_head, data_tail;
+
+	/*
+	 * PERF_RECORD_SAMPLE:
+	 * struct {
+	 *     struct perf_event_header hdr;
+	 *     u64 data[];
+	 * };
+	 */
+
+	data_head = metadata_page->data_head;
+	/* sync memory before reading sample */
+	mb();
+	data_tail = metadata_page->data_tail;
+
+	/* Check for sample_count */
+	if (sample_count)
+		*sample_count = 0;
+
+	while (1) {
+		/*
+		 * Reads the mmap data buffer by moving
+		 * the data_tail to know the last read data.
+		 * data_head points to head in data buffer.
+		 * refer "struct perf_event_mmap_page" in
+		 * "include/uapi/linux/perf_event.h".
+		 */
+		if (data_head - data_tail < sizeof(header))
+			return NULL;
+
+		data_tail += sizeof(header);
+		if (header->type == PERF_RECORD_SAMPLE) {
+			*size = (header->size - sizeof(header));
+			if (!sample_count)
+				return sample_buff + page_size + data_tail;
+			data_tail += *size;
+			*sample_count += 1;
+		} else {
+			*size = (header->size - sizeof(header));
+			if ((metadata_page->data_tail + *size) > metadata_page->data_head)
+				data_tail = metadata_page->data_head;
+			else
+				data_tail += *size;
+		}
+		header = (struct perf_event_header *)((void *)header + header->size);
+	}
+	return NULL;
+}
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
new file mode 100644
index 000000000000..291f9adba817
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022, Athira Rajeev, IBM Corp.
+ */
+
+#include "../event.h"
+
+void *event_sample_buf_mmap(int fd, int mmap_pages);
+void *__event_read_samples(void *sample_buff, size_t *size, u64 *sample_count);
-- 
2.27.0

