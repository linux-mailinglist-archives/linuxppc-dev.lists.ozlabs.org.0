Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E319909176
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 19:29:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZE1pRZIl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W15rH1L1Zz3cYb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 03:29:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZE1pRZIl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W15n56RkWz3cYZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 03:27:05 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EHQwEW029727;
	Fri, 14 Jun 2024 17:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=nMhp8ksQP47hN
	oOLyKczGfyhfX0UNSuKW/1x8tc/LWo=; b=ZE1pRZIlhz8edJM2E6tLkv7sq+09V
	nLRyaMNCb6d3RHLcO3UnTua3iLZX1xcLWUP6vGvgnF5P+HmCAYFw953dSHvGlnII
	HOgHPqYTu0HwQGO1RjSwFADlqgAbWo86B3mayEslXb4ESGbqc5HQ30JowB0r4slR
	fkQTM8dApR5NauLB12WfNqTTH57Hngxb9+sIQ6nChjTzeN8lDRI/KuEChndBk5E+
	ATNx5kMNUtoS+D8MkvPcDacb5QYVswZpxYHsekgjA5/OqQzl3Cj0rIs7DL1B+Jok
	U8p/F7T2IW2sb0FsGooWK6qQ2hOnL+s7aSZnfrAH3RPapGiXEiaqJWJzQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yrryk05m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:26:58 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45EHQvFK029708;
	Fri, 14 Jun 2024 17:26:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yrryk05kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:26:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45EH0GEC020066;
	Fri, 14 Jun 2024 17:26:56 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn34nud3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:26:56 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45EHQolf30409400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:26:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80DC620040;
	Fri, 14 Jun 2024 17:26:50 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B378D20043;
	Fri, 14 Jun 2024 17:26:47 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.82.18])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jun 2024 17:26:47 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [V4 03/16] tools/perf: Add support to capture and parse raw instruction in powerpc using dso__data_read_offset utility
Date: Fri, 14 Jun 2024 22:56:18 +0530
Message-Id: <20240614172631.56803-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xwj9z1BnmB5dP9fXttT3RN-6pJyr9K12
X-Proofpoint-ORIG-GUID: -fMqKB81Jv7XvQj0ZoPR_epoGfPe9fBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406140119
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

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/disasm.c | 98 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index b5fe3a7508bb..f19496133bf0 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -1586,6 +1586,91 @@ static int symbol__disassemble_capstone(char *filename, struct symbol *sym,
 }
 #endif
 
+static int symbol__disassemble_dso(char *filename, struct symbol *sym,
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
@@ -1710,6 +1795,19 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
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
+		err = symbol__disassemble_dso(symfs_filename, sym, args);
+		if (err == 0)
+			goto out_remove_tmp;
+	}
+
 #ifdef HAVE_LIBCAPSTONE_SUPPORT
 	err = symbol__disassemble_capstone(symfs_filename, sym, args);
 	if (err == 0)
-- 
2.43.0

