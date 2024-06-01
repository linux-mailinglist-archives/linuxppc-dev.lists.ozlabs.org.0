Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E94268D6E50
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 08:13:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MIGCVOMy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrqS81Jg6z30Vk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 16:13:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MIGCVOMy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrqNJ0Y8nz30VT
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 16:10:23 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4515w85K016118;
	Sat, 1 Jun 2024 06:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=fmDWkjP29X4qjwbxOjoDd8n8JMCLqTcq3nXqGNRrDo4=;
 b=MIGCVOMyJ/t9cy+uAU4QbGiHmFC+GaeR3Gnpb5tgpg2co5ZYR1kVANsjgE4jNJZ8nYmS
 NPB5pVwDv21M5ylkWdBOtZhC9XGwVol4ZSsVrDfJd5GqcYoTaUdKY8O/UStwmmgl7gR1
 TOo5JH+uYavA3gwnbQIUFMslIcpGGV/Ai0qWR9tsl2TFkJ9TZRnUmKxaes0XS7CAsReB
 O6Ev6x44Ac7M4Hje2fut/F+vw5e/08Gsr5XuIq3D6Hu99H0yLtgPitQR9i7Bjva37fmA
 qGJzJrmfGxo68fNDXIV6fwPeFisqySVrR5rVWvpBkTM2DBZfhbLBnExJAE03La1zQsMp NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwxsr0kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:15 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4516AES0003408;
	Sat, 1 Jun 2024 06:10:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwxsr0kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:14 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4514JLeF002533;
	Sat, 1 Jun 2024 06:10:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yfv1k8k1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:14 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4516A8PN54722998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Jun 2024 06:10:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2804020040;
	Sat,  1 Jun 2024 06:10:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1782B20043;
	Sat,  1 Jun 2024 06:10:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.41.43])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Jun 2024 06:10:04 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V3 05/14] tools/perf: Add disasm_line__parse to parse raw instruction for powerpc
Date: Sat,  1 Jun 2024 11:39:32 +0530
Message-Id: <20240601060941.13692-6-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WJti3HRQbNBMBPc2PJHUye1CAS8fOjyb
X-Proofpoint-GUID: mrXyzbg74spdTCSPwa0f-JnzWVkVBytp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-01_01,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406010045
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

Currently, the perf tool infrastructure disasm_line__parse function to
parse disassembled line.

Example snippet from objdump:
objdump  --start-address=<address> --stop-address=<address>  -d --no-show-raw-insn -C <vmlinux>

c0000000010224b4:	lwz     r10,0(r9)

This line "lwz r10,0(r9)" is parsed to extract instruction name,
registers names and offset. In powerpc, the approach for data type
profiling uses raw instruction instead of result from objdump to identify
the instruction category and extract the source/target registers.

Example: 38 01 81 e8     ld      r4,312(r1)

Here "38 01 81 e8" is the raw instruction representation. Add function
"disasm_line__parse_powerpc" to handle parsing of raw instruction. Also
update "struct ins" and "struct ins_operands" to save "opcode" and
binary code. With the change, function captures:

line -> "38 01 81 e8     ld      r4,312(r1)"
opcode and raw instruction "38 01 81 e8"

Raw instruction is used later to extract the reg/offset fields. Macros
are added to extract opcode and register fields. "struct ins_operands"
and "struct ins" is updated to carry opcode and raw instruction binary
code (raw_insn). Function "disasm_line__parse_powerpc fills the raw
instruction hex value and opcode in newly added fields. There is no
changes in existing code paths, which parses the disassembled code.
The architecture using the instruction name and present approach is
not altered. Since this approach targets powerpc, the macro
implementation is added for powerpc as of now.

Since the disasm_line__parse is used in other cases (perf annotate) and
not only data tye profiling, the powerpc callback includes changes to
work with binary code as well as mneumonic representation. Also in case
if the DSO read fails and libcapstone is not supported, the approach
fallback to use objdump as option. Hence as option, patch has changes to
ensure objdump option also works well.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/include/linux/string.h                  |  2 +
 tools/lib/string.c                            | 13 ++++
 .../perf/arch/powerpc/annotate/instructions.c |  1 +
 tools/perf/arch/powerpc/util/dwarf-regs.c     |  9 +++
 tools/perf/util/disasm.c                      | 63 ++++++++++++++++++-
 tools/perf/util/disasm.h                      |  7 +++
 6 files changed, 94 insertions(+), 1 deletion(-)

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
index 8b6892f959ab..3126d2cff716 100644
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
+
+	do {
+		while (*d == ' ')
+			++d;
+	} while ((*s++ = *d++));
+}
+
 /**
  * strreplace - Replace all occurrences of character in string.
  * @s: The string to operate on.
diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index a3f423c27cae..d57fd023ef9c 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -55,6 +55,7 @@ static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 		arch->initialized = true;
 		arch->associate_instruction_ops = powerpc__associate_instruction_ops;
 		arch->objdump.comment_char      = '#';
+		annotate_opts.show_asm_raw = true;
 	}
 
 	return 0;
diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
index 0c4f4caf53ac..430623ca5612 100644
--- a/tools/perf/arch/powerpc/util/dwarf-regs.c
+++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
@@ -98,3 +98,12 @@ int regs_query_register_offset(const char *name)
 			return roff->ptregs_offset;
 	return -EINVAL;
 }
+
+#define PPC_OP(op)	(((op) >> 26) & 0x3F)
+#define PPC_RA(a)	(((a) >> 16) & 0x1f)
+#define PPC_RT(t)	(((t) >> 21) & 0x1f)
+#define PPC_RB(b)	(((b) >> 11) & 0x1f)
+#define PPC_D(D)	((D) & 0xfffe)
+#define PPC_DS(DS)	((DS) & 0xfffc)
+#define OP_LD	58
+#define OP_STD	62
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 3cd187f08193..61f0f1656f82 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -45,6 +45,7 @@ static int call__scnprintf(struct ins *ins, char *bf, size_t size,
 
 static void ins__sort(struct arch *arch);
 static int disasm_line__parse(char *line, const char **namep, char **rawp);
+static int disasm_line__parse_powerpc(struct disasm_line *dl);
 
 static __attribute__((constructor)) void symbol__init_regexpr(void)
 {
@@ -844,6 +845,63 @@ static int disasm_line__parse(char *line, const char **namep, char **rawp)
 	return -1;
 }
 
+/*
+ * Parses the result captured from symbol__disassemble_*
+ * Example, line read from DSO file in powerpc:
+ * line:    38 01 81 e8
+ * opcode: fetched from arch specific get_opcode_insn
+ * rawp_insn: e8810138
+ *
+ * rawp_insn is used later to extract the reg/offset fields
+ */
+#define	PPC_OP(op)	(((op) >> 26) & 0x3F)
+
+static int disasm_line__parse_powerpc(struct disasm_line *dl)
+{
+	char *line = dl->al.line;
+	const char **namep = &dl->ins.name;
+	char **rawp = &dl->ops.raw;
+	char tmp, *tmp_opcode, *name_opcode = skip_spaces(line);
+	char *name = skip_spaces(name_opcode + 11);
+	int objdump = 0;
+
+	if (strlen(line) > 11)
+		objdump = 1;
+
+	if (name_opcode[0] == '\0')
+		return -1;
+
+	if (objdump) {
+		*rawp = name + 1;
+		while ((*rawp)[0] != '\0' && !isspace((*rawp)[0]))
+			++*rawp;
+		tmp = (*rawp)[0];
+		(*rawp)[0] = '\0';
+
+		*namep = strdup(name);
+		if (*namep == NULL)
+			return -1;
+
+		(*rawp)[0] = tmp;
+		*rawp = strim(*rawp);
+	} else
+		*namep = "";
+
+	tmp_opcode = strdup(name_opcode);
+	tmp_opcode[11] = '\0';
+	remove_spaces(tmp_opcode);
+
+	dl->ins.opcode = PPC_OP(strtol(tmp_opcode, NULL, 16));
+	if (objdump)
+		dl->ins.opcode = PPC_OP(be32_to_cpu(strtol(tmp_opcode, NULL, 16)));
+	dl->ops.opcode = dl->ins.opcode;
+
+	dl->ops.raw_insn = strtol(tmp_opcode, NULL, 16);
+	if (objdump)
+		dl->ops.raw_insn = be32_to_cpu(strtol(tmp_opcode, NULL, 16));
+	return 0;
+}
+
 static void annotation_line__init(struct annotation_line *al,
 				  struct annotate_args *args,
 				  int nr)
@@ -897,7 +955,10 @@ struct disasm_line *disasm_line__new(struct annotate_args *args)
 		goto out_delete;
 
 	if (args->offset != -1) {
-		if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
+		if (arch__is(args->arch, "powerpc")) {
+			if (disasm_line__parse_powerpc(dl) < 0)
+				goto out_free_line;
+		} else if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
 			goto out_free_line;
 
 		disasm_line__init_ins(dl, args->arch, &args->ms);
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 718177fa4775..a391e1bb81f7 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -43,14 +43,19 @@ struct arch {
 
 struct ins {
 	const char     *name;
+	int	opcode;
 	struct ins_ops *ops;
 };
 
 struct ins_operands {
 	char	*raw;
+	int	raw_insn;
+	int	opcode;
 	struct {
 		char	*raw;
 		char	*name;
+		int	opcode;
+		int	raw_insn;
 		struct symbol *sym;
 		u64	addr;
 		s64	offset;
@@ -62,6 +67,8 @@ struct ins_operands {
 		struct {
 			char	*raw;
 			char	*name;
+			int	opcode;
+			int	raw_insn;
 			u64	addr;
 			bool	multi_regs;
 		} source;
-- 
2.43.0

