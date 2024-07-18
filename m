Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB97934A5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 10:49:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JWzjcWJH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPmh661tzz3cW5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 18:49:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JWzjcWJH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPmbS73ylz3dLL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 18:45:24 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I60YuN029780;
	Thu, 18 Jul 2024 08:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	FtNQ+g1njWffdMa62Ouwmz6d1jl8i/hRcaKFaWXAL48=; b=JWzjcWJHMqRM8kZn
	somMl63S5sLBIJDn1pA23xIE6Tpcj2kgUaIKNBWEhJ0aQloY8PJvNs4A/q63l8aS
	Jao8Kk0crfdmJwvi706nzv9WzKdvzdZlKceVOSTR7gRG+qEok4wqdjz4gqGRzfgm
	glsalVGVELfB6MiT+geOkMCVVQmTZKl5VIo8h4LPfYb6Ncgf02CWSQbZYJ/a98z3
	6dJEK+GAy7TPRSOMAp0XrwAQL/tq2sfyphaOMsU7Zra763ClxMAJg8uwXRx45qx2
	qbwNqRlsFjz0/c/rfHCyDZn1n2zGiegkWqX8sspFkGdYeHxWKn6+Dj+FMWFR+sXX
	Ql2kHg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40eev9agbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:16 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46I8jFZg018140;
	Thu, 18 Jul 2024 08:45:15 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40eev9agbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46I5BNTa029249;
	Thu, 18 Jul 2024 08:45:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40dwkj8r9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46I8j8jp37880198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jul 2024 08:45:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C14A20043;
	Thu, 18 Jul 2024 08:45:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E18D2004B;
	Thu, 18 Jul 2024 08:45:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.69.1])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jul 2024 08:45:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V8 05/15] tools/perf: Add support to capture and parse raw instruction in powerpc using dso__data_read_offset utility
Date: Thu, 18 Jul 2024 14:13:48 +0530
Message-Id: <20240718084358.72242-6-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jlVS_-irD4QspJG4RtDV1kHq70Ra11s2
X-Proofpoint-GUID: 7_hytOB4u_PGHFwirYlauvc-cjb5C0XF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_04,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407180054
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support to capture and parse raw instruction in powerpc.
Currently, the perf tool infrastructure uses two ways to disassemble
and understand the instruction. One is objdump and other option is
via libcapstone.

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
instruction for powerpc. Approach used is to read the raw instruction
directly from the DSO file using "dso__data_read_offset" utility which
is already implemented in perf infrastructure in "util/dso.c".

Example:

38 01 81 e8     ld      r4,312(r1)

Here "38 01 81 e8" is the raw instruction representation. In powerpc,
this translates to instruction form: "ld RT,DS(RA)" and binary code
as:

   | 58 |  RT  |  RA |      DS       | |
   -------------------------------------
   0    6     11    16              30 31

Function "symbol__disassemble_dso" is updated to read raw instruction
directly from DSO using dso__data_read_offset utility. In case of
above example, this captures:
line:    38 01 81 e8

The above works well when perf report is invoked with only sort keys for
data type ie type and typeoff. Because there is no instruction level
annotation needed if only data type information is requested for. For
annotating sample, along with type and typeoff sort key, "sym" sort key
is also needed. And by default invoking just "perf report" uses sort key
"sym" that displays the symbol information.

With approach changes in powerpc which first reads DSO for raw
instruction, "perf annotate" and "perf report" + a key breaks since
it doesn't do the instruction level disassembly.

Snippet of result from perf report:

Samples: 1K of event 'mem-loads', 4000 Hz, Event count (approx.): 937238
do_work  /usr/bin/pmlogger [Percent: local period]
Percent│        ea230010
       │        3a550010
       │        3a600000

       │        38f60001
       │        39490008
       │        42400438
 51.44 │        81290008
       │        7d485378

Here, raw instruction is displayed in the output instead of human
readable annotated form.

One way to get the appropriate data is to specify "--objdump path", by
which code annotation will be done. But the default behaviour will be
changed. To fix this breakage, check if "sym" sort key is set. If so
fallback and use the libcapstone/objdump way of disassmbling the sample.

With the changes and "perf report"

Samples: 1K of event 'mem-loads', 4000 Hz, Event count (approx.): 937238
do_work  /usr/bin/pmlogger [Percent: local period]
Percent│        ld        r17,16(r3)
       │        addi      r18,r21,16
       │        li        r19,0

       │ 8b0:   rldicl    r10,r10,63,33
       │        addi      r10,r10,1
       │        mtctr     r10
       │      ↓ b         8e4
       │ 8c0:   addi      r7,r22,1
       │        addi      r10,r9,8
       │      ↓ bdz       d00
 51.44 │        lwz       r9,8(r9)
       │        mr        r8,r10
       │        cmpw      r20,r9

Reviewed-and-tested-by: Kajol Jain <kjain@linux.ibm.com>
Reviewed-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/disasm.c | 101 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index a53591a6111e..646290b043b2 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -25,6 +25,7 @@
 #include "srcline.h"
 #include "symbol.h"
 #include "util.h"
+#include "sort.h"
 
 static regex_t	 file_lineno;
 
@@ -1634,6 +1635,91 @@ static int symbol__disassemble_capstone(char *filename, struct symbol *sym,
 }
 #endif
 
+static int symbol__disassemble_raw(char *filename, struct symbol *sym,
+					struct annotate_args *args)
+{
+	struct annotation *notes = symbol__annotation(sym);
+	struct map *map = args->ms.map;
+	struct dso *dso = map__dso(map);
+	u64 start = map__rip_2objdump(map, sym->start);
+	u64 end = map__rip_2objdump(map, sym->end);
+	u64 len = end - start;
+	u64 offset;
+	int i, count;
+	u8 *buf = NULL;
+	char disasm_buf[512];
+	struct disasm_line *dl;
+	u32 *line;
+
+	/* Return if objdump is specified explicitly */
+	if (args->options->objdump_path)
+		return -1;
+
+	pr_debug("Reading raw instruction from : %s using dso__data_read_offset\n", filename);
+
+	buf = malloc(len);
+	if (buf == NULL)
+		goto err;
+
+	count = dso__data_read_offset(dso, NULL, sym->start, buf, len);
+
+	line = (u32 *)buf;
+
+	if ((u64)count != len)
+		goto err;
+
+	/* add the function address and name */
+	scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
+		  start, sym->name);
+
+	args->offset = -1;
+	args->line = disasm_buf;
+	args->line_nr = 0;
+	args->fileloc = NULL;
+	args->ms.sym = sym;
+
+	dl = disasm_line__new(args);
+	if (dl == NULL)
+		goto err;
+
+	annotation_line__add(&dl->al, &notes->src->source);
+
+	/* Each raw instruction is 4 byte */
+	count = len/4;
+
+	for (i = 0, offset = 0; i < count; i++) {
+		args->offset = offset;
+		sprintf(args->line, "%x", line[i]);
+		dl = disasm_line__new(args);
+		if (dl == NULL)
+			goto err;
+
+		annotation_line__add(&dl->al, &notes->src->source);
+		offset += 4;
+	}
+
+	/* It failed in the middle */
+	if (offset != len) {
+		struct list_head *list = &notes->src->source;
+
+		/* Discard all lines and fallback to objdump */
+		while (!list_empty(list)) {
+			dl = list_first_entry(list, struct disasm_line, al.node);
+
+			list_del_init(&dl->al.node);
+			disasm_line__free(dl);
+		}
+		count = -1;
+	}
+
+out:
+	free(buf);
+	return count < 0 ? count : 0;
+
+err:
+	count = -1;
+	goto out;
+}
 /*
  * Possibly create a new version of line with tabs expanded. Returns the
  * existing or new line, storage is updated if a new line is allocated. If
@@ -1758,6 +1844,21 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
 		strcpy(symfs_filename, tmp);
 	}
 
+	/*
+	 * For powerpc data type profiling, use the dso__data_read_offset
+	 * to read raw instruction directly and interpret the binary code
+	 * to understand instructions and register fields. For sort keys as
+	 * type and typeoff, disassemble to mnemonic notation is
+	 * not required in case of powerpc.
+	 */
+	if (arch__is(args->arch, "powerpc")) {
+		if (sort_order && !strstr(sort_order, "sym")) {
+			err = symbol__disassemble_raw(symfs_filename, sym, args);
+			if (err == 0)
+				goto out_remove_tmp;
+		}
+	}
+
 #ifdef HAVE_LIBCAPSTONE_SUPPORT
 	err = symbol__disassemble_capstone(symfs_filename, sym, args);
 	if (err == 0)
-- 
2.43.0

