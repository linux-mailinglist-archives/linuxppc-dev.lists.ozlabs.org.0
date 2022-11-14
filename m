Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BC66287FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 19:13:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9y9N4vV3z3fKB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 05:13:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HkD8gixg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HkD8gixg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9xtN5C6Mz3cbV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 05:00:28 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 2AEHkjxe024378;
	Mon, 14 Nov 2022 18:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9P+Sz7ic94YAd9TUHeka12DoZaOl6QHYXkMP+msHQLs=;
 b=HkD8gixgrHGMQwewMrEi/qi2xHLPZTHBxJU5LjRcU/nbW5NGW7C8NgJ51jD0wsD6UQkv
 4+iUJLvCPsN3JPLB1i+GEmemKlJBoFH+sqlXyVfgbHCSAmHtetqk1lPIo9vh56TD4CDm
 wK762aX4vUlvqxuKPbAMX0zTauML/onVeBf01pYHRWdkkl+q1Nr0BcCX5VjIzZ5mAcvR
 FDW2L2hWW+unUst3qis9rMdzNyzDYqQUQZ+NJ7ua7W/vHM8UqplXINI7GGhbeoXe+TsM
 28OMeuKnr4RZLsivO6UvN+kfcVrc0yEByMDX7zsPJw3nagkhGWV2GMfTgkcb5ccvFTzE 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kutcbgc2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 18:00:17 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AEHo4LB004391;
	Mon, 14 Nov 2022 18:00:16 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kutcbgbxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 18:00:16 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEHpcUr009567;
	Mon, 14 Nov 2022 18:00:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3kt348txym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 18:00:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AEI0A2766584890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Nov 2022 18:00:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C87911C04A;
	Mon, 14 Nov 2022 18:00:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0949211C050;
	Mon, 14 Nov 2022 18:00:05 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.116.246])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 14 Nov 2022 18:00:04 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 15/16] objtool/powerpc: Enable objtool to be built on ppc
Date: Mon, 14 Nov 2022 23:27:53 +0530
Message-Id: <20221114175754.1131267-16-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221114175754.1131267-1-sv@linux.ibm.com>
References: <20221114175754.1131267-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fBNpd0w5BcI4_9_itBRPN5qlGzRIE0x7
X-Proofpoint-GUID: aO9Hhrn9VAXMFl8iA-5jcuMQS8jA3ThU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_13,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211140125
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds [stub] implementations for required functions, inorder
to enable objtool build on powerpc.

Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
[Christophe Leroy: powerpc: Add missing asm/asm.h for objtool,
Use local variables for type and imm in arch_decode_instruction(),
Adapt len for prefixed instructions.]
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/asm.h                |  7 ++
 tools/objtool/arch/powerpc/Build              |  2 +
 tools/objtool/arch/powerpc/decode.c           | 85 +++++++++++++++++++
 .../arch/powerpc/include/arch/cfi_regs.h      | 11 +++
 tools/objtool/arch/powerpc/include/arch/elf.h |  8 ++
 .../arch/powerpc/include/arch/special.h       | 21 +++++
 tools/objtool/arch/powerpc/special.c          | 19 +++++
 8 files changed, 154 insertions(+)
 create mode 100644 arch/powerpc/include/asm/asm.h
 create mode 100644 tools/objtool/arch/powerpc/Build
 create mode 100644 tools/objtool/arch/powerpc/decode.c
 create mode 100644 tools/objtool/arch/powerpc/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/powerpc/include/arch/elf.h
 create mode 100644 tools/objtool/arch/powerpc/include/arch/special.h
 create mode 100644 tools/objtool/arch/powerpc/special.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2ca5418457ed..82e3e5e175ae 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -239,6 +239,7 @@ config PPC
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
+	select HAVE_OBJTOOL			if PPC32 || MPROFILE_KERNEL
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
diff --git a/arch/powerpc/include/asm/asm.h b/arch/powerpc/include/asm/asm.h
new file mode 100644
index 000000000000..86f46b604e9a
--- /dev/null
+++ b/arch/powerpc/include/asm/asm.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_ASM_H
+#define _ASM_POWERPC_ASM_H
+
+#define _ASM_PTR	" .long "
+
+#endif /* _ASM_POWERPC_ASM_H */
diff --git a/tools/objtool/arch/powerpc/Build b/tools/objtool/arch/powerpc/Build
new file mode 100644
index 000000000000..d24d5636a5b8
--- /dev/null
+++ b/tools/objtool/arch/powerpc/Build
@@ -0,0 +1,2 @@
+objtool-y += decode.o
+objtool-y += special.o
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
new file mode 100644
index 000000000000..dcd0975cad6b
--- /dev/null
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <objtool/check.h>
+#include <objtool/elf.h>
+#include <objtool/arch.h>
+#include <objtool/warn.h>
+#include <objtool/builtin.h>
+#include <objtool/endianness.h>
+
+unsigned long arch_dest_reloc_offset(int addend)
+{
+	return addend;
+}
+
+bool arch_callee_saved_reg(unsigned char reg)
+{
+	return false;
+}
+
+int arch_decode_hint_reg(u8 sp_reg, int *base)
+{
+	exit(-1);
+}
+
+const char *arch_nop_insn(int len)
+{
+	exit(-1);
+}
+
+const char *arch_ret_insn(int len)
+{
+	exit(-1);
+}
+
+int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
+			    unsigned long offset, unsigned int maxlen,
+			    unsigned int *len, enum insn_type *type,
+			    unsigned long *immediate,
+			    struct list_head *ops_list)
+{
+	unsigned int opcode;
+	enum insn_type typ;
+	unsigned long imm;
+	u32 insn;
+
+	insn = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
+	opcode = insn >> 26;
+	typ = INSN_OTHER;
+	imm = 0;
+
+	if (opcode == 1)
+		*len = 8;
+	else
+		*len = 4;
+
+	*type = typ;
+	*immediate = imm;
+
+	return 0;
+}
+
+unsigned long arch_jump_destination(struct instruction *insn)
+{
+	return insn->offset + insn->immediate;
+}
+
+void arch_initial_func_cfi_state(struct cfi_init_state *state)
+{
+	int i;
+
+	for (i = 0; i < CFI_NUM_REGS; i++) {
+		state->regs[i].base = CFI_UNDEFINED;
+		state->regs[i].offset = 0;
+	}
+
+	/* initial CFA (call frame address) */
+	state->cfa.base = CFI_SP;
+	state->cfa.offset = 0;
+
+	/* initial LR (return address) */
+	state->regs[CFI_RA].base = CFI_CFA;
+	state->regs[CFI_RA].offset = 0;
+}
diff --git a/tools/objtool/arch/powerpc/include/arch/cfi_regs.h b/tools/objtool/arch/powerpc/include/arch/cfi_regs.h
new file mode 100644
index 000000000000..59638ebeafc8
--- /dev/null
+++ b/tools/objtool/arch/powerpc/include/arch/cfi_regs.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _OBJTOOL_CFI_REGS_H
+#define _OBJTOOL_CFI_REGS_H
+
+#define CFI_BP 1
+#define CFI_SP CFI_BP
+#define CFI_RA 32
+#define CFI_NUM_REGS 33
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
diff --git a/tools/objtool/arch/powerpc/include/arch/special.h b/tools/objtool/arch/powerpc/include/arch/special.h
new file mode 100644
index 000000000000..ffef9ada7133
--- /dev/null
+++ b/tools/objtool/arch/powerpc/include/arch/special.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _PPC_ARCH_SPECIAL_H
+#define _PPC_ARCH_SPECIAL_H
+
+#define EX_ENTRY_SIZE 8
+#define EX_ORIG_OFFSET 0
+#define EX_NEW_OFFSET 4
+
+#define JUMP_ENTRY_SIZE 16
+#define JUMP_ORIG_OFFSET 0
+#define JUMP_NEW_OFFSET 4
+#define JUMP_KEY_OFFSET 8
+
+#define ALT_ENTRY_SIZE 12
+#define ALT_ORIG_OFFSET 0
+#define ALT_NEW_OFFSET 4
+#define ALT_FEATURE_OFFSET 8
+#define ALT_ORIG_LEN_OFFSET 10
+#define ALT_NEW_LEN_OFFSET 11
+
+#endif /* _PPC_ARCH_SPECIAL_H */
diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
new file mode 100644
index 000000000000..d33868147196
--- /dev/null
+++ b/tools/objtool/arch/powerpc/special.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <string.h>
+#include <stdlib.h>
+#include <objtool/special.h>
+#include <objtool/builtin.h>
+
+
+bool arch_support_alt_relocation(struct special_alt *special_alt,
+				 struct instruction *insn,
+				 struct reloc *reloc)
+{
+	exit(-1);
+}
+
+struct reloc *arch_find_switch_table(struct objtool_file *file,
+				    struct instruction *insn)
+{
+	exit(-1);
+}
-- 
2.31.1

