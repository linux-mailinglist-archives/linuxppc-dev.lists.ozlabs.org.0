Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3888BCDD5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 14:25:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XGzBaggW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY0wy52qXz3fVC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 22:25:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XGzBaggW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY0pk22Tbz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 22:19:58 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446BlEVF011184;
	Mon, 6 May 2024 12:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XaIvg3taXF68ek0OaAJ9nmQVZuVqNS5etVkdAVQM2WQ=;
 b=XGzBaggWeYs3pliFs+my6MVExV51C4UalvPrrpwAxNkTZvft7mqLAStUnnu3K/aDK+ic
 uRiQopuvw8Li0Z2N22lZ3MebtNABJxh1Cksrih2Ai0gzfVvBrsXOc+Nd07HkEG0lbh4Q
 TYexoaizu+5cZWBdBTOU+xxYPli26Jc9NIpY3l/Z2qyv6RO6cwZH8Gq0Xr/TA2BUGUbV
 6HU7loCE0ZUjC080HfCK/hHcPSUH3ojI3Jn31fV5ynQfAj1D+RQXig4ka+85poBUh0A1
 5MviHBPZsbZLta85QI1y0A8IoF3K66VeD2UFeMuCfmWbtrxJVgqGtNBt8xo47/yjBC0m HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxxmt82yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:50 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 446CJo92005730;
	Mon, 6 May 2024 12:19:50 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxxmt82ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:50 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 446C7Zxu028617;
	Mon, 6 May 2024 12:19:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xwyqyyy68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:48 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 446CJhwE38863322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2024 12:19:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E9A12004B;
	Mon,  6 May 2024 12:19:43 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9056420040;
	Mon,  6 May 2024 12:19:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.103.211])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 May 2024 12:19:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V2 8/9] tools/perf: Add support to find global register variables using find_data_type_global_reg
Date: Mon,  6 May 2024 17:49:05 +0530
Message-Id: <20240506121906.76639-9-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nnTHVa2sMr69XQ6Hk8pqmpYq-BfVcRxB
X-Proofpoint-GUID: l34jEA8ezFTHWpBRJzaf4iPfieHGYKVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_07,2024-05-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

There are cases where define a global register variable and associate it
with a specified register. Example, in powerpc, two registers are
defined to represent variable:
1. r13: represents local_paca
register struct paca_struct *local_paca asm("r13");

2. r1: represents stack_pointer
register void *__stack_pointer asm("r1");

These regs are present in dwarf debug as DW_OP_reg as part of variables
in the cu_die (compile unit). These are not present in die search done
in the list of nested scopes since these are global register variables.

Example for local_paca represented by r13:

<<>>
 <1><18dc6b4>: Abbrev Number: 128 (DW_TAG_variable)
    <18dc6b6>   DW_AT_name        : (indirect string, offset: 0x3861): local_paca
    <18dc6ba>   DW_AT_decl_file   : 48
    <18dc6bb>   DW_AT_decl_line   : 36
    <18dc6bc>   DW_AT_decl_column : 30
    <18dc6bd>   DW_AT_type        : <0x18dc6c3>
    <18dc6c1>   DW_AT_external    : 1
    <18dc6c1>   DW_AT_location    : 1 byte block: 5d    (DW_OP_reg13 (r13))

 <1><18dc6c3>: Abbrev Number: 3 (DW_TAG_pointer_type)
    <18dc6c4>   DW_AT_byte_size   : 8
    <18dc6c4>   DW_AT_type        : <0x18dc353>

Where  DW_AT_type : <0x18dc6c3> further points to :

 <1><18dc6c3>: Abbrev Number: 3 (DW_TAG_pointer_type)
    <18dc6c4>   DW_AT_byte_size   : 8
    <18dc6c4>   DW_AT_type        : <0x18dc353>

which belongs to:

 <1><18dc353>: Abbrev Number: 67 (DW_TAG_structure_type)
    <18dc354>   DW_AT_name        : (indirect string, offset: 0x56cd): paca_struct
    <18dc358>   DW_AT_byte_size   : 2944
    <18dc35a>   DW_AT_alignment   : 128
    <18dc35b>   DW_AT_decl_file   : 48
    <18dc35c>   DW_AT_decl_line   : 61
    <18dc35d>   DW_AT_decl_column : 8
    <18dc35d>   DW_AT_sibling     : <0x18dc6b4>
<<>>

Similar is case with "r1".

<<>>
 <1><18dd772>: Abbrev Number: 129 (DW_TAG_variable)
    <18dd774>   DW_AT_name        : (indirect string, offset: 0x11ba): current_stack_pointer
    <18dd778>   DW_AT_decl_file   : 51
    <18dd779>   DW_AT_decl_line   : 1468
    <18dd77b>   DW_AT_decl_column : 24
    <18dd77c>   DW_AT_type        : <0x18da5cd>
    <18dd780>   DW_AT_external    : 1
    <18dd780>   DW_AT_location    : 1 byte block: 51    (DW_OP_reg1 (r1))

 where 18da5cd is:

 <1><18da5cd>: Abbrev Number: 47 (DW_TAG_base_type)
    <18da5ce>   DW_AT_byte_size   : 8
    <18da5cf>   DW_AT_encoding    : 7   (unsigned)
    <18da5d0>   DW_AT_name        : (indirect string, offset: 0x55c7): long unsigned int
<<>>

To identify data type for these two special cases, iterate over
variables in the CU die (Compile Unit) and match it with the register.
If the variable is a base type, ie die_get_real_type will return NULL
here, set offset to zero. With the changes, data type for "paca_struct"
and "long unsigned int" for r1 is identified.

Snippet from ./perf report -s type,type_off

    12.85%  long unsigned int  long unsigned int +0 (no field)
     4.68%  struct paca_struct  struct paca_struct +2312 (__current)
     4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/annotate-data.c      | 40 ++++++++++++++++++++++++++++
 tools/perf/util/annotate.c           |  8 ++++++
 tools/perf/util/annotate.h           |  1 +
 tools/perf/util/include/dwarf-regs.h |  1 +
 4 files changed, 50 insertions(+)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index e22ba35c93b2..ab2168c4ef41 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -1169,6 +1169,40 @@ static int find_data_type_block(struct data_loc_info *dloc,
 	return ret;
 }
 
+/*
+ * Handle cases where define a global register variable and
+ * associate it with a specified register. These regs are
+ * present in dwarf debug as DW_OP_reg as part of variables
+ * in the cu_die (compile unit). Iterate over variables in the
+ * cu_die and match with reg to identify data type die.
+ */
+static int find_data_type_global_reg(struct data_loc_info *dloc, int reg, Dwarf_Die *cu_die,
+		Dwarf_Die *type_die)
+{
+	Dwarf_Die vr_die;
+	int ret = -1;
+	struct die_var_type *var_types = NULL;
+
+	die_collect_vars(cu_die, &var_types);
+	while (var_types) {
+		if (var_types->reg == reg) {
+			if (dwarf_offdie(dloc->di->dbg, var_types->die_off, &vr_die)) {
+				if (die_get_real_type(&vr_die, type_die) == NULL) {
+					dloc->type_offset = 0;
+					dwarf_offdie(dloc->di->dbg, var_types->die_off, type_die);
+				}
+				pr_debug_type_name(type_die, TSR_KIND_TYPE);
+				ret = 0;
+				pr_debug_dtp("found by CU for %s (die:%#lx)\n",
+						dwarf_diename(type_die), (long)dwarf_dieoffset(type_die));
+			}
+			break;
+		}
+		var_types = var_types->next;
+	}
+	return ret;
+}
+
 /* The result will be saved in @type_die */
 static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
 {
@@ -1216,6 +1250,12 @@ static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
 	pr_debug_dtp("CU for %s (die:%#lx)\n",
 		     dwarf_diename(&cu_die), (long)dwarf_dieoffset(&cu_die));
 
+	if (loc->reg_type == DWARF_REG_GLOBAL) {
+		ret = find_data_type_global_reg(dloc, reg, &cu_die, type_die);
+		if (!ret)
+			goto out;
+	}
+
 	if (reg == DWARF_REG_PC) {
 		if (get_global_var_type(&cu_die, dloc, dloc->ip, dloc->var_addr,
 					&offset, type_die)) {
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 48739c7ffdc7..2b0b5279f86d 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2426,6 +2426,14 @@ struct annotated_data_type *hist_entry__get_data_type(struct hist_entry *he)
 			op_loc->reg1 = DWARF_REG_PC;
 		}
 
+		/* Global reg variable 13 and 1
+		 * assign to DWARF_REG_GLOBAL
+		 */
+		if (arch__is(arch, "powerpc")) {
+			if ((op_loc->reg1 == 13) || (op_loc->reg1 == 1))
+				op_loc->reg_type = DWARF_REG_GLOBAL;
+		}
+
 		mem_type = find_data_type(&dloc);
 
 		if (mem_type == NULL && is_stack_canary(arch, op_loc)) {
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index d5c821c22f79..43ae75d8356b 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -472,6 +472,7 @@ struct annotated_op_loc {
 	bool mem_ref;
 	bool multi_regs;
 	bool imm;
+	int reg_type;
 };
 
 enum annotated_insn_ops {
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index d691245dd703..adcce167d9ca 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -5,6 +5,7 @@
 
 #define DWARF_REG_PC  0xd3af9c /* random number */
 #define DWARF_REG_FB  0xd3affb /* random number */
+#define DWARF_REG_GLOBAL 0xd3affc /* random number */
 
 #ifdef HAVE_DWARF_SUPPORT
 const char *get_arch_regstr(unsigned int n);
-- 
2.43.0

