Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4048D6E70
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 08:20:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nbu7sFZu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vrqbh6yBbz30Vg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 16:20:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nbu7sFZu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrqVX66g7z30VM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 16:15:48 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4515eDhj031165;
	Sat, 1 Jun 2024 06:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=TYEBzrW07N/ogzV9Qw4w6v26sSbMMehVo778VYvCLw8=;
 b=nbu7sFZunFufatp1LA1ZhTLeauEVKjSzmYCGgyVy00Hksf1H894W/FtWQhw8GLaINDnZ
 4Yy0OlruRePjFNIUzQNmxc19ljFfyqeLCj5sT/e3Tf5ePW1XeyY+0/un5deKIEYNAzx7
 /p8rIQf3I8bz0+IN/0TPbfDNVW+bhFBAPICMF4orIBZEgSmZGC0AJW3uj4+EtE0p2Kcd
 2mqN1MEJg6jAYsOwyohqPMaFBHcqbbm3+j4yBwwGx/zp+s7GOEmoJ9k5Lo6h9o+JhgLi
 BatSCmTO2E3cfiY67FukX8utYh9SmNF1yAcyQR9sJ3LvENHq3lbUGhMFD8TkN0bbik5I GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwgy02v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:15:40 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4516Fe22029417;
	Sat, 1 Jun 2024 06:15:40 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwgy02uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:15:40 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4514JCSe002487;
	Sat, 1 Jun 2024 06:10:39 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yfv1k8k3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4516AXRr28443118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Jun 2024 06:10:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CF602004F;
	Sat,  1 Jun 2024 06:10:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99A2B20040;
	Sat,  1 Jun 2024 06:10:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.41.43])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Jun 2024 06:10:30 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V3 12/14] tools/perf: Add support to find global register variables using find_data_type_global_reg
Date: Sat,  1 Jun 2024 11:39:39 +0530
Message-Id: <20240601060941.13692-13-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YnLTkwPlHASFDXP9MwvgOVdoMJY1iae3
X-Proofpoint-ORIG-GUID: TV7vwEdfwX3HaOkaX7etqGHEWQxotae5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-01_01,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406010046
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
index 734acdd8c4b7..82232f2d8e16 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -1170,6 +1170,40 @@ static int find_data_type_block(struct data_loc_info *dloc,
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
@@ -1217,6 +1251,12 @@ static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
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
index 2b8cc759ae35..ddb36dddb8cc 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2431,6 +2431,14 @@ struct annotated_data_type *hist_entry__get_data_type(struct hist_entry *he)
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
index 7ea39362ecaf..a873c906a86b 100644
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

