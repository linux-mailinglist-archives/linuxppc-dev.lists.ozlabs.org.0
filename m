Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB34DE3AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 22:48:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKyL61lTzz3c1m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 08:47:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p8P6k4iR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=p8P6k4iR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKgqZ0Sn6z30CT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 21:54:01 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22I8Uh33023446; 
 Fri, 18 Mar 2022 10:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=t3uvsDIdKhsiwvX0gqMiuOC7GjUgy6HC7f0j4xg3EM8=;
 b=p8P6k4iRoTrNUq0XjloQLFbyjXanutjpbcdsvoq2xXQTHFT6S82/x0nxAOZ+taaSA9M1
 tC7Zn9H8qq4ZFxVePoUog6MSX43tIsBYsLaeCOC8zAxWQqGm3Eotrmr7rCHz+49ZoRnW
 FjYGPYOj8PRMn+6gKRotVjBeSLr8qXbvMGUWKlJVLby+jzXyTigi/r/aY8xcZrN2BuCU
 ORbLlz4xE/4TfVD7IKAXrogTm6mlQrgVQlkihyZaeJLn8VYWMcnnFKHrOrIAEJFJb+Im
 LLGz6kRmCf7rjORglLsLdosC1CAh5Mjw9vSI3lg/h9XIzZue3bQUXQ4TDPYrzfoT3kSj hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2b3a73d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 10:53:40 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22IArP9n010239;
 Fri, 18 Mar 2022 10:53:39 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2b3a72s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 10:53:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IAqqpc026968;
 Fri, 18 Mar 2022 10:53:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3euc6r4uc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 10:53:37 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IArYOu20447502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 10:53:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D1DB42042;
 Fri, 18 Mar 2022 10:53:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A55484203F;
 Fri, 18 Mar 2022 10:53:31 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown
 [9.43.86.72]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Mar 2022 10:53:31 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Date: Fri, 18 Mar 2022 16:21:40 +0530
Message-Id: <20220318105140.43914-4-sv@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220318105140.43914-1-sv@linux.ibm.com>
References: <20220318105140.43914-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Fx24Gj7hsZC2kGiRj7WKjt8Dh0XH53RG
X-Proofpoint-GUID: SEaYOOXrbhIX6xp6WVgslE39kc6lFypF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180055
X-Mailman-Approved-At: Sat, 19 Mar 2022 08:45:00 +1100
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 aik@ozlabs.ru, sv@linux.ibm.com, jpoimboe@redhat.com,
 naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds powerpc specific functions required for
'objtool mcount' to work, and enables mcount for ppc.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/Kconfig                          |  1 +
 tools/objtool/Makefile                        |  4 ++
 tools/objtool/arch/powerpc/Build              |  1 +
 tools/objtool/arch/powerpc/decode.c           | 51 +++++++++++++++++++
 .../arch/powerpc/include/arch/cfi_regs.h      | 37 ++++++++++++++
 tools/objtool/arch/powerpc/include/arch/elf.h |  8 +++
 tools/objtool/utils.c                         | 28 ++++++++--
 7 files changed, 125 insertions(+), 5 deletions(-)
 create mode 100644 tools/objtool/arch/powerpc/Build
 create mode 100644 tools/objtool/arch/powerpc/decode.c
 create mode 100644 tools/objtool/arch/powerpc/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/powerpc/include/arch/elf.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..5ddafd3ce210 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -225,6 +225,7 @@ config PPC
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
+	select HAVE_OBJTOOL_MCOUNT
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 8404cf696954..06a9fcb4a0a3 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -49,6 +49,10 @@ ifeq ($(SRCARCH),x86)
 	SUBCMD_MCOUNT := y
 endif
 
+ifeq ($(SRCARCH),powerpc)
+        SUBCMD_MCOUNT := y
+endif
+
 export SUBCMD_CHECK SUBCMD_ORC SUBCMD_MCOUNT
 export srctree OUTPUT CFLAGS SRCARCH AWK
 include $(srctree)/tools/build/Makefile.include
diff --git a/tools/objtool/arch/powerpc/Build b/tools/objtool/arch/powerpc/Build
new file mode 100644
index 000000000000..3ff1f00c6a47
--- /dev/null
+++ b/tools/objtool/arch/powerpc/Build
@@ -0,0 +1 @@
+objtool-y += decode.o
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
new file mode 100644
index 000000000000..58988f88b315
--- /dev/null
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include <objtool/check.h>
+#include <objtool/elf.h>
+#include <objtool/arch.h>
+#include <objtool/warn.h>
+#include <objtool/builtin.h>
+
+int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
+			    unsigned long offset, unsigned int maxlen,
+			    unsigned int *len, enum insn_type *type,
+			    unsigned long *immediate,
+			    struct list_head *ops_list)
+{
+	u32 insn;
+	unsigned int opcode;
+	u64 imm;
+
+	*immediate = imm = 0;
+	memcpy(&insn, sec->data->d_buf+offset, 4);
+	*len = 4;
+	*type = INSN_OTHER;
+
+	opcode = (insn >> 26);
+
+	switch (opcode) {
+	case 18: /* bl */
+		*type = INSN_CALL;
+		break;
+	}
+	*immediate = imm;
+	return 0;
+}
+
+unsigned long arch_dest_reloc_offset(int addend)
+{
+	return addend;
+}
+
+unsigned long arch_jump_destination(struct instruction *insn)
+{
+	return insn->offset +  insn->immediate;
+}
+
+const char *arch_nop_insn(int len)
+{
+	return NULL;
+}
diff --git a/tools/objtool/arch/powerpc/include/arch/cfi_regs.h b/tools/objtool/arch/powerpc/include/arch/cfi_regs.h
new file mode 100644
index 000000000000..1369176c8a94
--- /dev/null
+++ b/tools/objtool/arch/powerpc/include/arch/cfi_regs.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _OBJTOOL_CFI_REGS_H
+#define _OBJTOOL_CFI_REGS_H
+
+#define CFI_SP                  1
+#define CFI_TOC                 2
+#define CFI_R3                  3
+#define CFI_R4                  4
+#define CFI_R5                  5
+#define CFI_R6                  6
+#define CFI_R7                  7
+#define CFI_R8                  8
+#define CFI_R9                  9
+#define CFI_R10                 10
+#define CFI_R14                 14
+#define CFI_R15                 15
+#define CFI_R16                 16
+#define CFI_R17                 17
+#define CFI_R18                 18
+#define CFI_R19                 19
+#define CFI_R20                 20
+#define CFI_R21                 21
+#define CFI_R22                 22
+#define CFI_R23                 23
+#define CFI_R24                 24
+#define CFI_R25                 25
+#define CFI_R26                 26
+#define CFI_R27                 27
+#define CFI_R28                 28
+#define CFI_R29                 29
+#define CFI_R30                 30
+#define CFI_R31                 31
+#define CFI_LR                  32
+#define CFI_NUM_REGS            33
+
+#endif
diff --git a/tools/objtool/arch/powerpc/include/arch/elf.h b/tools/objtool/arch/powerpc/include/arch/elf.h
new file mode 100644
index 000000000000..3c8ebb7d2a6b
--- /dev/null
+++ b/tools/objtool/arch/powerpc/include/arch/elf.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _OBJTOOL_ARCH_ELF
+#define _OBJTOOL_ARCH_ELF
+
+#define R_NONE R_PPC_NONE
+
+#endif /* _OBJTOOL_ARCH_ELF */
diff --git a/tools/objtool/utils.c b/tools/objtool/utils.c
index d1fc6a123a6e..c9c14fa0dfd7 100644
--- a/tools/objtool/utils.c
+++ b/tools/objtool/utils.c
@@ -179,11 +179,29 @@ int create_mcount_loc_sections(struct objtool_file *file)
 		loc = (unsigned long *)sec->data->d_buf + idx;
 		memset(loc, 0, sizeof(unsigned long));
 
-		if (elf_add_reloc_to_insn(file->elf, sec,
-					  idx * sizeof(unsigned long),
-					  R_X86_64_64,
-					  insn->sec, insn->offset))
-			return -1;
+		if (file->elf->ehdr.e_machine == EM_X86_64) {
+			if (elf_add_reloc_to_insn(file->elf, sec,
+						  idx * sizeof(unsigned long),
+						  R_X86_64_64,
+						  insn->sec, insn->offset))
+				return -1;
+		}
+
+		if (file->elf->ehdr.e_machine == EM_PPC64) {
+			if (elf_add_reloc_to_insn(file->elf, sec,
+						  idx * sizeof(unsigned long),
+						  R_PPC64_ADDR64,
+						  insn->sec, insn->offset))
+				return -1;
+		}
+
+		if (file->elf->ehdr.e_machine == EM_PPC) {
+			if (elf_add_reloc_to_insn(file->elf, sec,
+						  idx * sizeof(unsigned long),
+						  R_PPC_ADDR32,
+						  insn->sec, insn->offset))
+				return -1;
+		}
 
 		idx++;
 	}
-- 
2.31.1

