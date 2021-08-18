Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B73F086F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 17:51:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqXSq6VQTz3cP2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 01:51:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fdHAF1Br;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=riteshh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fdHAF1Br; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqXS14Y46z3bWw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 01:50:57 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IFX2nd182121
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 11:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=y1l/gIc+iOlMZlP7SdePjlnpa12Kml7IrnOhP2mKkVE=;
 b=fdHAF1BrBtqiEU7c9Fb1mCLbId7Pu4DCfODvR8UaaJO9xWHQCIvDjPdHU9SHLzEu2PjD
 w/avgRgT9UTnyH0ybKrdXMsTNR+C4j/E/3V0NPK8Z1RjMXzSY6RXV/pcdFN8u5l6D2g1
 46gVp7n/WDYFiqIcyKxvfoxTKIIfQwmGwI6x/DMOdSPOptoQ9TDcIyC/ItVPETrSTrK2
 bd/eYaq27ZZPOr8dq/dLQ5Z6+vWb6jtYEX0uvKxy120rsEJ+gO3fyn3Joos6yPWinnTT
 Fsmx/tyTqLFJDcBpvU6U3IuK7QTlDgUJ9rzyNVPCod6HoihryTqXMOKBoJyNPcCPVhCy PQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agp1p8t5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 11:50:53 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IFmrpm012228
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 15:50:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3afwrhtkf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 15:50:51 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17IFlKkO34734492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 15:47:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74F7B5204E;
 Wed, 18 Aug 2021 15:50:47 +0000 (GMT)
Received: from localhost (unknown [9.77.196.84])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1649652051;
 Wed, 18 Aug 2021 15:50:46 +0000 (GMT)
From: Ritesh Harjani <riteshh@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] selftests/powerpc: Add memmove_64 test
Date: Wed, 18 Aug 2021 21:20:38 +0530
Message-Id: <c152ad80dc3a80cd362f6cbbccd626798ab0d5db.1629300331.git.riteshh@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OvlMrZgh3OVLehNl0Dvva0eI1_1E4w5t
X-Proofpoint-ORIG-GUID: OvlMrZgh3OVLehNl0Dvva0eI1_1E4w5t
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_05:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108180097
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Ritesh Harjani <riteshh@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While debugging an issue, we wanted to check whether the arch specific
kernel memmove implementation is correct. This selftest could help test that.

Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Suggested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Signed-off-by: Ritesh Harjani <riteshh@linux.ibm.com>
---
 tools/testing/selftests/powerpc/Makefile      |  1 +
 .../selftests/powerpc/memmoveloop/.gitignore  |  2 +
 .../selftests/powerpc/memmoveloop/Makefile    | 19 +++++++
 .../powerpc/memmoveloop/asm/asm-compat.h      |  0
 .../powerpc/memmoveloop/asm/export.h          |  4 ++
 .../powerpc/memmoveloop/asm/feature-fixups.h  |  0
 .../selftests/powerpc/memmoveloop/asm/kasan.h |  0
 .../powerpc/memmoveloop/asm/ppc_asm.h         | 39 +++++++++++++
 .../powerpc/memmoveloop/asm/processor.h       |  0
 .../selftests/powerpc/memmoveloop/mem_64.S    |  1 +
 .../selftests/powerpc/memmoveloop/memcpy_64.S |  1 +
 .../selftests/powerpc/memmoveloop/stubs.S     |  8 +++
 .../selftests/powerpc/memmoveloop/validate.c  | 56 +++++++++++++++++++
 13 files changed, 131 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/Makefile
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/asm-compat.h
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/export.h
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/feature-fixups.h
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/kasan.h
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/asm/processor.h
 create mode 120000 tools/testing/selftests/powerpc/memmoveloop/mem_64.S
 create mode 120000 tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/stubs.S
 create mode 100644 tools/testing/selftests/powerpc/memmoveloop/validate.c

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 0830e63818c1..d110b3e5cbcd 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -16,6 +16,7 @@ export CFLAGS
 SUB_DIRS = alignment		\
 	   benchmarks		\
 	   cache_shape		\
+	   memmoveloop		\
 	   copyloops		\
 	   dscr			\
 	   mm			\
diff --git a/tools/testing/selftests/powerpc/memmoveloop/.gitignore b/tools/testing/selftests/powerpc/memmoveloop/.gitignore
new file mode 100644
index 000000000000..56c1426013d5
--- /dev/null
+++ b/tools/testing/selftests/powerpc/memmoveloop/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+memmove_64
diff --git a/tools/testing/selftests/powerpc/memmoveloop/Makefile b/tools/testing/selftests/powerpc/memmoveloop/Makefile
new file mode 100644
index 000000000000..d58d8c100099
--- /dev/null
+++ b/tools/testing/selftests/powerpc/memmoveloop/Makefile
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+CFLAGS += -m64
+CFLAGS += -I$(CURDIR)
+CFLAGS += -D SELFTEST
+CFLAGS += -maltivec
+
+ASFLAGS = $(CFLAGS) -Wa,-mpower4
+
+TEST_GEN_PROGS := memmove_64
+EXTRA_SOURCES := validate.c ../harness.c stubs.S
+CPPFLAGS += -D TEST_MEMMOVE=test_memmove
+
+top_srcdir = ../../../../..
+include ../../lib.mk
+
+$(OUTPUT)/memmove_64: mem_64.S memcpy_64.S $(EXTRA_SOURCES)
+	$(CC) $(CPPFLAGS) $(CFLAGS) \
+		-D TEST_MEMMOVE=test_memmove \
+		-o $@ $^
diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/asm-compat.h b/tools/testing/selftests/powerpc/memmoveloop/asm/asm-compat.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/export.h b/tools/testing/selftests/powerpc/memmoveloop/asm/export.h
new file mode 100644
index 000000000000..e6b80d5fbd14
--- /dev/null
+++ b/tools/testing/selftests/powerpc/memmoveloop/asm/export.h
@@ -0,0 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#define EXPORT_SYMBOL(x)
+#define EXPORT_SYMBOL_GPL(x)
+#define EXPORT_SYMBOL_KASAN(x)
diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/feature-fixups.h b/tools/testing/selftests/powerpc/memmoveloop/asm/feature-fixups.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/kasan.h b/tools/testing/selftests/powerpc/memmoveloop/asm/kasan.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h b/tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h
new file mode 100644
index 000000000000..117005c56e19
--- /dev/null
+++ b/tools/testing/selftests/powerpc/memmoveloop/asm/ppc_asm.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SELFTESTS_POWERPC_PPC_ASM_H
+#define __SELFTESTS_POWERPC_PPC_ASM_H
+#include <ppc-asm.h>
+
+#define CONFIG_ALTIVEC
+
+#define r1	1
+
+#define R14 r14
+#define R15 r15
+#define R16 r16
+#define R17 r17
+#define R18 r18
+#define R19 r19
+#define R20 r20
+#define R21 r21
+#define R22 r22
+#define R29 r29
+#define R30 r30
+#define R31 r31
+
+#define STACKFRAMESIZE	256
+#define STK_REG(i)	(112 + ((i)-14)*8)
+
+#define _GLOBAL(A) FUNC_START(test_ ## A)
+#define _GLOBAL_TOC(A) _GLOBAL(A)
+#define _GLOBAL_TOC_KASAN(A) _GLOBAL(A)
+#define _GLOBAL_KASAN(A) _GLOBAL(A)
+
+#define PPC_MTOCRF(A, B)	mtocrf A, B
+
+#define BEGIN_FTR_SECTION
+#define FTR_SECTION_ELSE
+#define ALT_FTR_SECTION_END_IFCLR(x)
+#define ALT_FTR_SECTION_END(x, y)
+#define END_FTR_SECTION_IFCLR(x)
+
+#endif /* __SELFTESTS_POWERPC_PPC_ASM_H */
diff --git a/tools/testing/selftests/powerpc/memmoveloop/asm/processor.h b/tools/testing/selftests/powerpc/memmoveloop/asm/processor.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tools/testing/selftests/powerpc/memmoveloop/mem_64.S b/tools/testing/selftests/powerpc/memmoveloop/mem_64.S
new file mode 120000
index 000000000000..db254c9a5f5c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/memmoveloop/mem_64.S
@@ -0,0 +1 @@
+../../../../../arch/powerpc/lib/mem_64.S
\ No newline at end of file
diff --git a/tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S b/tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S
new file mode 120000
index 000000000000..cce33fb6f9d8
--- /dev/null
+++ b/tools/testing/selftests/powerpc/memmoveloop/memcpy_64.S
@@ -0,0 +1 @@
+../../../../../arch/powerpc/lib/memcpy_64.S
\ No newline at end of file
diff --git a/tools/testing/selftests/powerpc/memmoveloop/stubs.S b/tools/testing/selftests/powerpc/memmoveloop/stubs.S
new file mode 100644
index 000000000000..d9baa832fa49
--- /dev/null
+++ b/tools/testing/selftests/powerpc/memmoveloop/stubs.S
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/ppc_asm.h>
+
+FUNC_START(memcpy)
+	b test_memcpy
+
+FUNC_START(backwards_memcpy)
+	b test_backwards_memcpy
diff --git a/tools/testing/selftests/powerpc/memmoveloop/validate.c b/tools/testing/selftests/powerpc/memmoveloop/validate.c
new file mode 100644
index 000000000000..52f7d32bb3fe
--- /dev/null
+++ b/tools/testing/selftests/powerpc/memmoveloop/validate.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <malloc.h>
+#include <stdlib.h>
+#include <string.h>
+#include <assert.h>
+#include "utils.h"
+
+void *TEST_MEMMOVE(const void *s1, const void *s2, size_t n);
+
+#define BUF_LEN 65536
+#define MAX_OFFSET 512
+
+size_t max(size_t a, size_t b)
+{
+	if (a >= b) return a;
+	return b;
+}
+
+static int testcase_run(void)
+{
+	size_t i, src_off, dst_off, len;
+
+	char *usermap = memalign(BUF_LEN, BUF_LEN);
+	char *kernelmap = memalign(BUF_LEN, BUF_LEN);
+
+	assert(usermap != NULL);
+	assert(kernelmap != NULL);
+
+	memset(usermap, 0, BUF_LEN);
+	memset(kernelmap, 0, BUF_LEN);
+
+	for (i = 0; i < BUF_LEN; i++) {
+		usermap[i] = i & 0xff;
+		kernelmap[i] = i & 0xff;
+	}
+
+	for (src_off = 0; src_off < MAX_OFFSET; src_off++) {
+		for (dst_off = 0; dst_off < MAX_OFFSET; dst_off++) {
+			for (len = 1; len < MAX_OFFSET - max(src_off, dst_off); len++) {
+
+				memmove(usermap + dst_off, usermap + src_off, len);
+				TEST_MEMMOVE(kernelmap + dst_off, kernelmap + src_off, len);
+				if (memcmp(usermap, kernelmap, MAX_OFFSET) != 0) {
+					printf("memmove failed at %ld %ld %ld\n", src_off, dst_off, len);
+					abort();
+				}
+			}
+		}
+	}
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(testcase_run, "memmove");
+}
--
2.31.1

