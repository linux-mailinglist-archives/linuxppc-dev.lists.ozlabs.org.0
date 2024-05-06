Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B928BCDE1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 14:26:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3LdgPiA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY0yW5p9cz3fps
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 22:26:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3LdgPiA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY0rW6w5Sz3c4r
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 22:21:31 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446B4FnX014509;
	Mon, 6 May 2024 12:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0Nn3bWvynJWro2iLFEALu91KWiH53m7FTZBeOTU5hAM=;
 b=R3LdgPiANP3nHi4kD2F0Jn5rKghRFRTTAjOkZsIrQgDe1mpTC2mzLH15l8j5T5v1+8AO
 vcMGP/ncApIIsrEEVeEQxxVFnkY9K3mes5+wAW0k49lM1UaGDohXr2LRsgixpc8ffPIl
 nSmHU7cXmwl1lupPABtrgRWL7r5nvj+bmH7RO2g06FujAk3CuJWhOiR6yUn8mAj0aAvf
 JNgGhidUX5dsf+ttqRopa/vxVON087I9r9R/17aFYB3l263b2+hsqlkNzntAnEKqJR/J
 X08qD4UyF413SCtB6y1f3TLlXT3Qo5eCGLNCf4C5xe6Z3/s3Dc8Gi+nppZzW3frpBEOd sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxx0eg68p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:21:23 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 446CLMcF004451;
	Mon, 6 May 2024 12:21:22 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxx0eg678-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:21:22 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4468tY1F010624;
	Mon, 6 May 2024 12:19:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xx0bnyts6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:36 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 446CJUhL50070004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2024 12:19:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E7832004D;
	Mon,  6 May 2024 12:19:30 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 669842004B;
	Mon,  6 May 2024 12:19:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.103.211])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 May 2024 12:19:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V2 4/9] tools/perf: Add support to capture and parse raw instruction in objdump
Date: Mon,  6 May 2024 17:49:01 +0530
Message-Id: <20240506121906.76639-5-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9kBmwt75xGKLrLEfGYpgi1JzI1MQhIV7
X-Proofpoint-GUID: G0wHARXoC0jYWNJuIqZ-YWXW1Bg9e9u7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_07,2024-05-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405060085
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support to capture and parse raw instruction in objdump.
Currently, the perf tool infrastructure uses "--no-show-raw-insn" option
with "objdump" while disassemble. Example from powerpc with this option
for an instruction address is:

Snippet from:
objdump  --start-address=<address> --stop-address=<address>  -d --no-show-raw-insn -C <vmlinux>

c0000000010224b4:	lwz     r10,0(r9)

This line "lwz r10,0(r9)" is parsed to extract instruction name,
registers names and offset. Also to find whether there is a memory
reference in the operands, "memory_ref_char" field of objdump is used.
For x86, "(" is used as memory_ref_char to tackle instructions of the
form "mov  (%rax), %rcx".

In case of powerpc, not all instructions using "(" are the only memory
instructions. Example, above instruction can also be of extended form (X
form) "lwzx r10,0,r19". Inorder to easy identify the instruction category
and extract the source/target registers, patch adds support to use raw
instruction. With raw instruction, macros are added to extract opcode
and register fields.

"struct ins_operands" and "struct ins" is updated to carry opcode and
raw instruction binary code (raw_insn). Function "disasm_line__parse"
is updated to fill the raw instruction hex value and opcode in newly
added fields. There is no changes in existing code paths, which parses
the disassembled code. The architecture using the instruction name and
present approach is not altered. Since this approach targets powerpc,
the macro implementation is added for powerpc as of now.

Example:
representation using --show-raw-insn in objdump gives result:

38 01 81 e8     ld      r4,312(r1)

Here "38 01 81 e8" is the raw instruction representation. In powerpc,
this translates to instruction form: "ld RT,DS(RA)" and binary code
as:
_____________________________________
| 58 |  RT  |  RA |      DS       | |
-------------------------------------
0    6     11    16              30 31

Function "disasm_line__parse" is updated to capture:

line:    38 01 81 e8     ld      r4,312(r1)
opcode and raw instruction "38 01 81 e8"
Raw instruction is used later to extract the reg/offset fields.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/include/linux/string.h              |  2 +
 tools/lib/string.c                        | 13 +++++++
 tools/perf/arch/powerpc/util/dwarf-regs.c | 19 ++++++++++
 tools/perf/util/disasm.c                  | 46 +++++++++++++++++++----
 tools/perf/util/disasm.h                  |  6 +++
 tools/perf/util/include/dwarf-regs.h      |  9 +++++
 6 files changed, 88 insertions(+), 7 deletions(-)

diff --git a/tools/include/linux/string.h b/tools/include/linux/string.h
index db5c99318c79..0acb1fc14e19 100644
--- a/tools/include/linux/string.h
+++ b/tools/include/linux/string.h
@@ -46,5 +46,7 @@ extern char * __must_check skip_spaces(const char *);
 
 extern char *strim(char *);
 
+extern void remove_spaces(char *s);
+
 extern void *memchr_inv(const void *start, int c, size_t bytes);
 #endif /* _TOOLS_LINUX_STRING_H_ */
diff --git a/tools/lib/string.c b/tools/lib/string.c
index 8b6892f959ab..21d273e69951 100644
--- a/tools/lib/string.c
+++ b/tools/lib/string.c
@@ -153,6 +153,19 @@ char *strim(char *s)
 	return skip_spaces(s);
 }
 
+/*
+ * remove_spaces - Removes whitespaces from @s
+ */
+void remove_spaces(char *s)
+{
+	char *d = s;
+	do {
+		while (*d == ' ') {
+			++d;
+		}
+	} while ((*s++ = *d++));
+}
+
 /**
  * strreplace - Replace all occurrences of character in string.
  * @s: The string to operate on.
diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
index 0c4f4caf53ac..e60a71fd846e 100644
--- a/tools/perf/arch/powerpc/util/dwarf-regs.c
+++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
@@ -98,3 +98,22 @@ int regs_query_register_offset(const char *name)
 			return roff->ptregs_offset;
 	return -EINVAL;
 }
+
+#define	PPC_OP(op)	(((op) >> 26) & 0x3F)
+#define PPC_RA(a)	(((a) >> 16) & 0x1f)
+#define PPC_RT(t)	(((t) >> 21) & 0x1f)
+
+int get_opcode_insn(unsigned int raw_insn)
+{
+	return PPC_OP(raw_insn);
+}
+
+int get_source_reg(unsigned int raw_insn)
+{
+	return PPC_RA(raw_insn);
+}
+
+int get_target_reg(unsigned int raw_insn)
+{
+	return PPC_RT(raw_insn);
+}
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 2de66a092cab..85692f73e78f 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -43,7 +43,7 @@ static int call__scnprintf(struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name);
 
 static void ins__sort(struct arch *arch);
-static int disasm_line__parse(char *line, const char **namep, char **rawp);
+static int disasm_line__parse(char *line, const char **namep, char **rawp, int *opcode, int *rawp_insn);
 
 static __attribute__((constructor)) void symbol__init_regexpr(void)
 {
@@ -512,7 +512,7 @@ static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_s
 	if (ops->locked.ops == NULL)
 		return 0;
 
-	if (disasm_line__parse(ops->raw, &ops->locked.ins.name, &ops->locked.ops->raw) < 0)
+	if (disasm_line__parse(ops->raw, &ops->locked.ins.name, &ops->locked.ops->raw, &ops->locked.ins.opcode, &ops->locked.ops->raw_insn) < 0)
 		goto out_free_ops;
 
 	ops->locked.ins.ops = ins__find(arch, ops->locked.ins.name);
@@ -815,11 +815,38 @@ static void disasm_line__init_ins(struct disasm_line *dl, struct arch *arch, str
 		dl->ins.ops = NULL;
 }
 
-static int disasm_line__parse(char *line, const char **namep, char **rawp)
+int __weak get_opcode_insn(unsigned int raw_insn __maybe_unused)
 {
-	char tmp, *name = skip_spaces(line);
+	return -1;
+}
+
+int __weak get_source_reg(unsigned int raw_insn __maybe_unused)
+{
+	return -1;
+}
+
+int __weak get_target_reg(unsigned int raw_insn __maybe_unused)
+{
+	return -1;
+}
+
+/*
+ * Parses the objdump result captured with --show-raw-insn.
+ * Example, objdump line from powerpc:
+ * line:    38 01 81 e8     ld      r4,312(r1)
+ * namep : ld
+ * rawp  : "ld r4,312(r1)"
+ * opcode: fetched from arch specific get_opcode_insn
+ * rawp_insn: e8810138
+ *
+ * rawp_insn is used later to extract the reg/offset fields
+ */
+static int disasm_line__parse(char *line, const char **namep, char **rawp, int *opcode, int *rawp_insn)
+{
+	char tmp, *tmp_opcode, *name_opcode = skip_spaces(line);
+	char *name = skip_spaces(name_opcode + 11);
 
-	if (name[0] == '\0')
+	if (name_opcode[0] == '\0')
 		return -1;
 
 	*rawp = name + 1;
@@ -829,13 +856,18 @@ static int disasm_line__parse(char *line, const char **namep, char **rawp)
 
 	tmp = (*rawp)[0];
 	(*rawp)[0] = '\0';
+	tmp_opcode = strdup(name_opcode);
+	tmp_opcode[11] = '\0';
+	remove_spaces(tmp_opcode);
 	*namep = strdup(name);
+	*opcode = get_opcode_insn(be32_to_cpu(strtol(tmp_opcode, NULL, 16)));
 
 	if (*namep == NULL)
 		goto out;
 
 	(*rawp)[0] = tmp;
 	*rawp = strim(*rawp);
+	*rawp_insn = be32_to_cpu(strtol(tmp_opcode, NULL, 16));
 
 	return 0;
 
@@ -896,7 +928,7 @@ struct disasm_line *disasm_line__new(struct annotate_args *args)
 		goto out_delete;
 
 	if (args->offset != -1) {
-		if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
+		if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw, &dl->ins.opcode, &dl->ops.raw_insn) < 0)
 			goto out_free_line;
 
 		disasm_line__init_ins(dl, args->arch, &args->ms);
@@ -1726,7 +1758,7 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
 		 map__rip_2objdump(map, sym->start),
 		 map__rip_2objdump(map, sym->end),
 		 opts->show_linenr ? "-l" : "",
-		 opts->show_asm_raw ? "" : "--no-show-raw-insn",
+		 opts->show_asm_raw ? "" : "--show-raw-insn",
 		 opts->annotate_src ? "-S" : "",
 		 opts->prefix ? "--prefix " : "",
 		 opts->prefix ? '"' : ' ',
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 718177fa4775..5c1520010ca7 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -43,14 +43,18 @@ struct arch {
 
 struct ins {
 	const char     *name;
+	int	opcode;
 	struct ins_ops *ops;
 };
 
 struct ins_operands {
 	char	*raw;
+	int	raw_insn;
 	struct {
 		char	*raw;
 		char	*name;
+		int	opcode;
+		int	raw_insn;
 		struct symbol *sym;
 		u64	addr;
 		s64	offset;
@@ -62,6 +66,8 @@ struct ins_operands {
 		struct {
 			char	*raw;
 			char	*name;
+			int	opcode;
+			int	raw_insn;
 			u64	addr;
 			bool	multi_regs;
 		} source;
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 01fb25a1150a..2a4e1e16e52c 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -31,6 +31,15 @@ static inline int get_dwarf_regnum(const char *name __maybe_unused,
 }
 #endif
 
+/*
+ * get_opcode_insn - Return opcode from raw instruction
+ * get_source_reg - Return source reg from raw instruction
+ * get_target_reg - Return target reg from raw instruction
+ */
+int get_opcode_insn(unsigned int raw_insn);
+int get_source_reg(unsigned int raw_insn);
+int get_target_reg(unsigned int raw_insn);
+
 #ifdef HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
 /*
  * Arch should support fetching the offset of a register in pt_regs
-- 
2.43.0

