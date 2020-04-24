Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 187351B6EF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 09:27:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497m2X2jnszDqSP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 17:27:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497lfY1rvqzDr9y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 17:09:41 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O62tQL098379; Fri, 24 Apr 2020 03:09:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrj7nksg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 03:09:33 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03O6xGl4101141;
 Fri, 24 Apr 2020 03:09:33 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrj7nkrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 03:09:33 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03O77AwY004432;
 Fri, 24 Apr 2020 07:09:31 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 30fs658u07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 07:09:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03O79Sa512714432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 07:09:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2737A404D;
 Fri, 24 Apr 2020 07:09:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 081DBA4057;
 Fri, 24 Apr 2020 07:09:27 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.95.110])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 07:09:26 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH v2 7/7] powerpc/selftest: reuse ppc-opcode macros to avoid
 redundancy
Date: Fri, 24 Apr 2020 12:38:53 +0530
Message-Id: <20200424070853.443969-8-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200424070853.443969-1-bala24@linux.ibm.com>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_01:2020-04-23,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=857 phishscore=0 suspectscore=1 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240040
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoid redefining macros to encode ppc instructions instead reuse it from
ppc-opcode.h, Makefile changes are necessary to compile memcmp_64.S with
__ASSEMBLY__ defined from selftests.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 .../selftests/powerpc/stringloops/Makefile    | 34 ++++++++++++++----
 .../powerpc/stringloops/asm/asm-const.h       |  1 +
 .../powerpc/stringloops/asm/ppc-opcode.h      | 36 +------------------
 3 files changed, 29 insertions(+), 42 deletions(-)
 create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/asm-const.h
 mode change 100644 => 120000 tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h

diff --git a/tools/testing/selftests/powerpc/stringloops/Makefile b/tools/testing/selftests/powerpc/stringloops/Makefile
index 7fc0623d85c3..efe76c5a5b94 100644
--- a/tools/testing/selftests/powerpc/stringloops/Makefile
+++ b/tools/testing/selftests/powerpc/stringloops/Makefile
@@ -1,26 +1,44 @@
 # SPDX-License-Identifier: GPL-2.0
 # The loops are all 64-bit code
-CFLAGS += -I$(CURDIR)
+GIT_VERSION = $(shell git describe --always --long --dirty || echo "unknown")
+CFLAGS += -DGIT_VERSION='"$(GIT_VERSION)"' -I$(CURDIR) -I$(CURDIR)/../include
 
 EXTRA_SOURCES := ../harness.c
 
 build_32bit = $(shell if ($(CC) $(CFLAGS) -m32 -o /dev/null memcmp.c >/dev/null 2>&1) then echo "1"; fi)
 
+ifneq ($(build_32bit),1)
 TEST_GEN_PROGS := memcmp_64 strlen
+TEST_GEN_FILES := memcmp.o memcmp_64.o memcmp_64
+MEMCMP := $(OUTPUT)/memcmp.o
+MEMCMP_64 := $(OUTPUT)/memcmp_64.o
+HARNESS :=  $(OUTPUT)/../harness.o
+CFLAGS += -m64 -maltivec
 
-$(OUTPUT)/memcmp_64: memcmp.c
-$(OUTPUT)/memcmp_64: CFLAGS += -m64 -maltivec
+OVERRIDE_TARGETS := 1
+include ../../lib.mk
 
-ifeq ($(build_32bit),1)
+$(OUTPUT)/memcmp_64: $(MEMCMP_64) $(MEMCMP) $(HARNESS)
+	$(CC) $(CFLAGS) memcmp.o memcmp_64.o ../harness.o -o memcmp_64
+
+$(MEMCMP_64): memcmp_64.S
+	$(CC) $(CFLAGS) -D__ASSEMBLY__ -o memcmp_64.o -c memcmp_64.S
+
+$(MEMCMP): memcmp.c
+	$(CC) $(CFLAGS) -o memcmp.o -c memcmp.c
+
+$(HARNESS): $(EXTRA_SOURCES)
+	$(CC) $(CFLAGS) -DGIT_VERSION='"$(GIT_VERSION)"' -o ../harness.o -c $(EXTRA_SOURCES)
+else
 $(OUTPUT)/memcmp_32: memcmp.c
 $(OUTPUT)/memcmp_32: CFLAGS += -m32
 
 TEST_GEN_PROGS += memcmp_32
 endif
 
-$(OUTPUT)/strlen: strlen.c string.c
-
-ifeq ($(build_32bit),1)
+ifneq ($(build_32bit),1)
+$(OUTPUT)/strlen: string.c
+else
 $(OUTPUT)/strlen_32: strlen.c
 $(OUTPUT)/strlen_32: CFLAGS += -m32
 
@@ -30,6 +48,8 @@ endif
 ASFLAGS = $(CFLAGS)
 
 top_srcdir = ../../../../..
+ifeq ($(build_32bit),1)
 include ../../lib.mk
+endif
 
 $(TEST_GEN_PROGS): $(EXTRA_SOURCES)
diff --git a/tools/testing/selftests/powerpc/stringloops/asm/asm-const.h b/tools/testing/selftests/powerpc/stringloops/asm/asm-const.h
new file mode 120000
index 000000000000..18d8be13e67f
--- /dev/null
+++ b/tools/testing/selftests/powerpc/stringloops/asm/asm-const.h
@@ -0,0 +1 @@
+../../../../../../arch/powerpc/include/asm/asm-const.h
\ No newline at end of file
diff --git a/tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h b/tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h
deleted file mode 100644
index 3edd1a1d9128..000000000000
--- a/tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2009 Freescale Semiconductor, Inc.
- *
- * provides masks and opcode images for use by code generation, emulation
- * and for instructions that older assemblers might not know about
- */
-#ifndef _ASM_POWERPC_PPC_OPCODE_H
-#define _ASM_POWERPC_PPC_OPCODE_H
-
-
-#  define stringify_in_c(...)	__VA_ARGS__
-#  define ASM_CONST(x)		x
-
-
-#define PPC_INST_VCMPEQUD_RC		0x100000c7
-#define PPC_INST_VCMPEQUB_RC		0x10000006
-
-#define __PPC_RC21     (0x1 << 10)
-
-/* macros to insert fields into opcodes */
-#define ___PPC_RA(a)	(((a) & 0x1f) << 16)
-#define ___PPC_RB(b)	(((b) & 0x1f) << 11)
-#define ___PPC_RS(s)	(((s) & 0x1f) << 21)
-#define ___PPC_RT(t)	___PPC_RS(t)
-
-#define VCMPEQUD_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_INST_VCMPEQUD_RC | \
-			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
-			      ___PPC_RB(vrb) | __PPC_RC21)
-
-#define VCMPEQUB_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_INST_VCMPEQUB_RC | \
-			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
-			      ___PPC_RB(vrb) | __PPC_RC21)
-
-#endif /* _ASM_POWERPC_PPC_OPCODE_H */
diff --git a/tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h b/tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h
new file mode 120000
index 000000000000..f9b1f27ac335
--- /dev/null
+++ b/tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h
@@ -0,0 +1 @@
+../../../../../../arch/powerpc/include/asm/ppc-opcode.h
\ No newline at end of file
-- 
2.24.1

