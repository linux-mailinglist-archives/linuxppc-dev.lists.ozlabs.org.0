Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC718C8F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:26:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kH141ZRZzDrgN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 19:26:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kGvH1blFzDrWY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:21:15 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K82iBe088601
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:21:12 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8af9vqp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:21:12 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 20 Mar 2020 08:21:09 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 08:21:08 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02K8L6so18153598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 08:21:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4EB911C04C;
 Fri, 20 Mar 2020 08:21:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B58411C054;
 Fri, 20 Mar 2020 08:21:01 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.87.168])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 08:21:00 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH 2/4] powerpc selftest: reuse ppc-opcode macros to avoid
 redundancy
Date: Fri, 20 Mar 2020 13:48:35 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200320081837.1016820-1-bala24@linux.ibm.com>
References: <20200320081837.1016820-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032008-0016-0000-0000-000002F458D2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032008-0017-0000-0000-00003357E689
Message-Id: <20200320081837.1016820-3-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_01:2020-03-19,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=442
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200035
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
 .../selftests/powerpc/stringloops/Makefile    | 15 ++++++--
 .../powerpc/stringloops/asm/asm-const.h       |  1 +
 .../powerpc/stringloops/asm/ppc-opcode.h      | 36 +------------------
 3 files changed, 14 insertions(+), 38 deletions(-)
 create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/asm-const.h
 mode change 100644 => 120000 tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h

diff --git a/tools/testing/selftests/powerpc/stringloops/Makefile b/tools/testing/selftests/powerpc/stringloops/Makefile
index 7fc0623d85c3..43eb14bfbe3a 100644
--- a/tools/testing/selftests/powerpc/stringloops/Makefile
+++ b/tools/testing/selftests/powerpc/stringloops/Makefile
@@ -6,10 +6,19 @@ EXTRA_SOURCES := ../harness.c
 
 build_32bit = $(shell if ($(CC) $(CFLAGS) -m32 -o /dev/null memcmp.c >/dev/null 2>&1) then echo "1"; fi)
 
-TEST_GEN_PROGS := memcmp_64 strlen
+TEST_GEN_PROGS := memcmp_64 memcmp harness memcmp64 strlen
 
-$(OUTPUT)/memcmp_64: memcmp.c
-$(OUTPUT)/memcmp_64: CFLAGS += -m64 -maltivec
+$(OUTPUT)/memcmp64: memcmp_64.o memcmp.o ../harness.o
+	$(CC) $(CFLAGS) -m64 -maltivec memcmp.o memcmp_64.o ../harness.o -o memcmp_64
+
+$(OUTPUT)/memcmp_64: memcmp_64.S
+	$(CC) $(CFLAGS) -m64 -maltivec -D__ASSEMBLY__ -o memcmp_64.o -c memcmp_64.S
+
+$(OUTPUT)/memcmp: memcmp.c
+	$(CC) $(CFLAGS) -m64 -maltivec -o memcmp.o -c memcmp.c
+
+$(OUTPUT)/harness: $(EXTRA_SOURCES)
+	$(CC) $(CFLAGS) -m64 -maltivec -o ../harness.o -c $(EXTRA_SOURCES)
 
 ifeq ($(build_32bit),1)
 $(OUTPUT)/memcmp_32: memcmp.c
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

