Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9159091C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 19:38:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fL6DHxqW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W162L0rcVz3cfK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 03:38:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fL6DHxqW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W15nr4CHPz3ckP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 03:27:44 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EDwlT1019636;
	Fri, 14 Jun 2024 17:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=wTGM3fuy9DfKH
	j82fga8z+3GL6iQAW7YvZE5k9EnBYc=; b=fL6DHxqWjjmTjKuv3XJE0ZGjA/++S
	bUUQtiSO63VWYv6PMbFkvOEZZLTLmEauw/UpKTVAvceadrqbjj7J29t8SxmXnWoF
	pohaXH/pQHpKrSLsLQSoPnkc29a1+oyUzRi1HbxtgZ/djrESVhlGLD6k08xAo4yh
	qbNU5NiVO8NvS020cB47zw0igpjFb1eYlWXd9/2tcGj2kE5CpxCGA5F7GcRaS5l8
	iGjr5FbVZdoH+gG52Tei5Pxp2XRh0cCVrz2DP6CkD7to/9E4HFlgxJg8L7uz2tWT
	nWNjiIlPAy9jEEW615BTI+XBW5mZoAzDFQznTKah14cgfr6L343xg9INg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yrq7crhjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:27:35 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45EHRYVF018431;
	Fri, 14 Jun 2024 17:27:34 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yrq7crhjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:27:34 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45EGTMEe027220;
	Fri, 14 Jun 2024 17:27:34 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn211km2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:27:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45EHRSaY52363656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:27:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CC4520040;
	Fri, 14 Jun 2024 17:27:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EA5B20043;
	Fri, 14 Jun 2024 17:27:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.82.18])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jun 2024 17:27:25 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [V4 15/16] tools/perf: Add support for global_die to capture name of variable in case of register defined variable
Date: Fri, 14 Jun 2024 22:56:30 +0530
Message-Id: <20240614172631.56803-16-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QILXzG-jlZz5FvSuCAhvOkoc1qrdybmY
X-Proofpoint-ORIG-GUID: OmC7VuhYxUQxvthvbxP_baoPLpNuJTaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 mlxscore=0 spamscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

In case of register defined variable (found using
find_data_type_global_reg), if the type of variable happens to be base
type (example, long unsigned int), perf report captures it as:

    12.85%  long unsigned int  long unsigned int +0 (no field)

The above data type is actually referring to samples captured while
accessing "r1" which represents current stack pointer in powerpc.
register void *__stack_pointer asm("r1");

The dwarf debug contains this as:

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

To make it more clear to the user, capture the DW_AT_name of the
variable and save it as part of Dwarf_Global. Dwarf_Global is used so
that it can be used and retrieved while presenting the result.

Update "dso__findnew_data_type" function to set "var_name" if
variable name is set as part of Dwarf_Global. Updated
"hist_entry__typeoff_snprintf" to print var_name if it is set.
With the changes, along with "long unsigned int" report also says the
variable name as current_stack_pointer

Snippet of result:

    12.85%  long unsigned int  long unsigned int +0 (current_stack_pointer)
     4.68%  struct paca_struct  struct paca_struct +2312 (__current)
     4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/annotate-data.c | 30 ++++++++++++++++++++++++------
 tools/perf/util/dwarf-aux.c     |  1 +
 tools/perf/util/dwarf-aux.h     |  1 +
 tools/perf/util/sort.c          |  7 +++++--
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 82232f2d8e16..2bce522304f4 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -268,23 +268,32 @@ static void delete_members(struct annotated_member *member)
 }
 
 static struct annotated_data_type *dso__findnew_data_type(struct dso *dso,
-							  Dwarf_Die *type_die)
+							  Dwarf_Die *type_die, Dwarf_Global *global_die)
 {
 	struct annotated_data_type *result = NULL;
 	struct annotated_data_type key;
 	struct rb_node *node;
 	struct strbuf sb;
+	struct strbuf sb_var_name;
 	char *type_name;
+	char *var_name;
 	Dwarf_Word size;
 
 	strbuf_init(&sb, 32);
+	strbuf_init(&sb_var_name, 32);
 	if (die_get_typename_from_type(type_die, &sb) < 0)
 		strbuf_add(&sb, "(unknown type)", 14);
+	if (global_die->name) {
+		strbuf_addstr(&sb_var_name, global_die->name);
+		var_name = strbuf_detach(&sb_var_name, NULL);
+	}
 	type_name = strbuf_detach(&sb, NULL);
 	dwarf_aggregate_size(type_die, &size);
 
 	/* Check existing nodes in dso->data_types tree */
 	key.self.type_name = type_name;
+	if (global_die->name)
+		key.self.var_name = var_name;
 	key.self.size = size;
 	node = rb_find(&key, dso__data_types(dso), data_type_cmp);
 	if (node) {
@@ -301,6 +310,8 @@ static struct annotated_data_type *dso__findnew_data_type(struct dso *dso,
 	}
 
 	result->self.type_name = type_name;
+	if (global_die->name)
+		result->self.var_name = var_name;
 	result->self.size = size;
 	INIT_LIST_HEAD(&result->self.children);
 
@@ -1178,7 +1189,7 @@ static int find_data_type_block(struct data_loc_info *dloc,
  * cu_die and match with reg to identify data type die.
  */
 static int find_data_type_global_reg(struct data_loc_info *dloc, int reg, Dwarf_Die *cu_die,
-		Dwarf_Die *type_die)
+		Dwarf_Die *type_die, Dwarf_Global *global_die)
 {
 	Dwarf_Die vr_die;
 	int ret = -1;
@@ -1190,8 +1201,11 @@ static int find_data_type_global_reg(struct data_loc_info *dloc, int reg, Dwarf_
 			if (dwarf_offdie(dloc->di->dbg, var_types->die_off, &vr_die)) {
 				if (die_get_real_type(&vr_die, type_die) == NULL) {
 					dloc->type_offset = 0;
+					global_die->name = var_types->name;
 					dwarf_offdie(dloc->di->dbg, var_types->die_off, type_die);
 				}
+				global_die->die_offset = (long)dwarf_dieoffset(type_die);
+				global_die->cu_offset = (long)dwarf_dieoffset(cu_die);
 				pr_debug_type_name(type_die, TSR_KIND_TYPE);
 				ret = 0;
 				pr_debug_dtp("found by CU for %s (die:%#lx)\n",
@@ -1205,7 +1219,8 @@ static int find_data_type_global_reg(struct data_loc_info *dloc, int reg, Dwarf_
 }
 
 /* The result will be saved in @type_die */
-static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
+static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die,
+		Dwarf_Global *global_die)
 {
 	struct annotated_op_loc *loc = dloc->op;
 	Dwarf_Die cu_die, var_die;
@@ -1219,6 +1234,8 @@ static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
 	u64 pc;
 	char buf[64];
 
+	memset(global_die, 0, sizeof(Dwarf_Global));
+
 	if (dloc->op->multi_regs)
 		snprintf(buf, sizeof(buf), "reg%d, reg%d", dloc->op->reg1, dloc->op->reg2);
 	else if (dloc->op->reg1 == DWARF_REG_PC)
@@ -1252,7 +1269,7 @@ static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
 		     dwarf_diename(&cu_die), (long)dwarf_dieoffset(&cu_die));
 
 	if (loc->reg_type == DWARF_REG_GLOBAL) {
-		ret = find_data_type_global_reg(dloc, reg, &cu_die, type_die);
+		ret = find_data_type_global_reg(dloc, reg, &cu_die, type_die, global_die);
 		if (!ret)
 			goto out;
 	}
@@ -1388,6 +1405,7 @@ struct annotated_data_type *find_data_type(struct data_loc_info *dloc)
 	struct annotated_data_type *result = NULL;
 	struct dso *dso = map__dso(dloc->ms->map);
 	Dwarf_Die type_die;
+	Dwarf_Global global_die;
 
 	dloc->di = debuginfo__new(dso__long_name(dso));
 	if (dloc->di == NULL) {
@@ -1403,10 +1421,10 @@ struct annotated_data_type *find_data_type(struct data_loc_info *dloc)
 
 	dloc->fbreg = -1;
 
-	if (find_data_type_die(dloc, &type_die) < 0)
+	if (find_data_type_die(dloc, &type_die, &global_die) < 0)
 		goto out;
 
-	result = dso__findnew_data_type(dso, &type_die);
+	result = dso__findnew_data_type(dso, &type_die, &global_die);
 
 out:
 	debuginfo__delete(dloc->di);
diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.c
index 44ef968a7ad3..9e61ff326651 100644
--- a/tools/perf/util/dwarf-aux.c
+++ b/tools/perf/util/dwarf-aux.c
@@ -1610,6 +1610,7 @@ static int __die_collect_vars_cb(Dwarf_Die *die_mem, void *arg)
 	vt->reg = reg_from_dwarf_op(ops);
 	vt->offset = offset_from_dwarf_op(ops);
 	vt->next = *var_types;
+	vt->name = dwarf_diename(die_mem);
 	*var_types = vt;
 
 	return DIE_FIND_CB_SIBLING;
diff --git a/tools/perf/util/dwarf-aux.h b/tools/perf/util/dwarf-aux.h
index 24446412b869..406a5b1e269b 100644
--- a/tools/perf/util/dwarf-aux.h
+++ b/tools/perf/util/dwarf-aux.h
@@ -146,6 +146,7 @@ struct die_var_type {
 	u64 addr;
 	int reg;
 	int offset;
+	const char *name;
 };
 
 /* Return type info of a member at offset */
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index cd39ea972193..535ca19a23fd 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -2305,9 +2305,12 @@ static int hist_entry__typeoff_snprintf(struct hist_entry *he, char *bf,
 	char buf[4096];
 
 	buf[0] = '\0';
-	if (list_empty(&he_type->self.children))
+	if (list_empty(&he_type->self.children)) {
 		snprintf(buf, sizeof(buf), "no field");
-	else
+		if (he_type->self.var_name)
+			strcpy(buf, he_type->self.var_name);
+
+	} else
 		fill_member_name(buf, sizeof(buf), &he_type->self,
 				 he->mem_type_off, true);
 	buf[4095] = '\0';
-- 
2.43.0

