Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D191D716
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 06:38:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JiWqL7GW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCCwL20hZz3cXK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 14:38:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JiWqL7GW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCCrS2fvLz3dCV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 14:35:04 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4614TqXk024679;
	Mon, 1 Jul 2024 04:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=VKJlBgKeWtjTy
	/gYvEgFGJjzR8rN/E4OlojdeFFBtrM=; b=JiWqL7GWLQfV0OAJlInXEukxoPdR2
	U1p/S65mpaITBrj3KUMp5/2PLNEzmMXuBt8JxpLGpEeu3S3MvrkhJA6t4oU14ou8
	+YVzYHriWtqu2W0FUuL3dxiPVmbenkoCtQFXfrGUJar2se172hO5ZxtJQ/66U+R0
	RwTaM9sYNHj+bwr0RDFOsi3Xvp9pCNxqVKtAdpaleB+rnGMM7rG2s19MyfAN6SMA
	mbNtT6zN/XZmArGeTQG2iI+k3u/Nc4lmbLm4ppmaRj5TFR3Wwlgs70Aq1LNhODQV
	duaNPYrtw6SU2eEd0JakoT2hln5afuu8HiaR0zsQjdWi1nc1nXe+UZRiQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403nfc00md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:34:56 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4614YtAO002577;
	Mon, 1 Jul 2024 04:34:55 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403nfc00mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:34:55 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46115CEP009515;
	Mon, 1 Jul 2024 04:34:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 402xtmd410-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:34:54 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4614Yn0K55247288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 04:34:51 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45E682004B;
	Mon,  1 Jul 2024 04:34:49 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73A3520040;
	Mon,  1 Jul 2024 04:34:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.21.126])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 04:34:46 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V5 04/17] tools/perf: Add disasm_line__parse to parse raw instruction for powerpc
Date: Mon,  1 Jul 2024 10:04:17 +0530
Message-Id: <20240701043430.66666-5-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240701043430.66666-1-atrajeev@linux.vnet.ibm.com>
References: <20240701043430.66666-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cIB6cRw50uZSkyAvI1ncGR1y2hBFKoqP
X-Proofpoint-GUID: RfP8eYviKe5hocX_46OTQxKG54ip9lSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_03,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010030
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
"disasm_line__parse_powerpc" to handle parsing of raw instruction.
Also update "struct disasm_line" to save the binary code/
With the change, function captures:

line -> "38 01 81 e8     ld      r4,312(r1)"
raw instruction "38 01 81 e8"

Raw instruction is used later to extract the reg/offset fields. Macros
are added to extract opcode and register fields. "struct disasm_line"
is updated to carry union of "bytes" and "raw_insn" of 32 bit to carry raw
code (raw). Function "disasm_line__parse_powerpc fills the raw
instruction hex value and can use macros to get opcode. There is no
changes in existing code paths, which parses the disassembled code.
The size of raw instruction depends on architecture. In case of powerpc,
the parsing the disasm line needs to handle cases for reading binary code
directly from DSO as well as parsing the objdump result. Hence adding
the logic into separate function instead of updating "disasm_line__parse".
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
 tools/perf/util/annotate.h                    |  5 +-
 tools/perf/util/disasm.c                      | 59 ++++++++++++++++++-
 6 files changed, 87 insertions(+), 2 deletions(-)

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
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index d5c821c22f79..9ba772f46270 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -113,7 +113,10 @@ struct annotation_line {
 struct disasm_line {
 	struct ins		 ins;
 	struct ins_operands	 ops;
-
+	union {
+		u8 bytes[4];
+		u32 raw_insn;
+	} raw;
 	/* This needs to be at the end. */
 	struct annotation_line	 al;
 };
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index d2723ba024bf..ddb861a0b043 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -44,6 +44,7 @@ static int call__scnprintf(struct ins *ins, char *bf, size_t size,
 
 static void ins__sort(struct arch *arch);
 static int disasm_line__parse(char *line, const char **namep, char **rawp);
+static int disasm_line__parse_powerpc(struct disasm_line *dl);
 
 static __attribute__((constructor)) void symbol__init_regexpr(void)
 {
@@ -845,6 +846,59 @@ static int disasm_line__parse(char *line, const char **namep, char **rawp)
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
+	char tmp, *tmp_raw_insn, *name_raw_insn = skip_spaces(line);
+	char *name = skip_spaces(name_raw_insn + 11);
+	int objdump = 0;
+
+	if (strlen(line) > 11)
+		objdump = 1;
+
+	if (name_raw_insn[0] == '\0')
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
+	tmp_raw_insn = strdup(name_raw_insn);
+	tmp_raw_insn[11] = '\0';
+	remove_spaces(tmp_raw_insn);
+
+	sscanf(tmp_raw_insn, "%x", &dl->raw.raw_insn);
+	if (objdump)
+		dl->raw.raw_insn = be32_to_cpu(dl->raw.raw_insn);
+
+	return 0;
+}
+
 static void annotation_line__init(struct annotation_line *al,
 				  struct annotate_args *args,
 				  int nr)
@@ -898,7 +952,10 @@ struct disasm_line *disasm_line__new(struct annotate_args *args)
 		goto out_delete;
 
 	if (args->offset != -1) {
-		if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
+		if (arch__is(args->arch, "powerpc")) {
+			if (disasm_line__parse_powerpc(dl) < 0)
+				goto out_free_line;
+		} else if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
 			goto out_free_line;
 
 		disasm_line__init_ins(dl, args->arch, &args->ms);
-- 
2.43.0

