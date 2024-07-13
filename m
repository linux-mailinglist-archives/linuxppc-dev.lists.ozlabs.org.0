Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA593069D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 19:09:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LDduelYz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLw124VLrz2ysY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 03:09:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LDduelYz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLvkf3cJhz3dCt
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 02:56:42 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46DGRk4m012543;
	Sat, 13 Jul 2024 16:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=UufMI/lXr+ET7
	atl3bYeuWCOYir9l35fK4Z7FLTI41U=; b=LDduelYz0q4iMkyqs8h97qtLRMIY2
	gvb4t6Ftocu5hNOPF5inSW0TAzg16oXybfW8QSpN3GiKDrhmcqE1S44nt+WfLBwO
	o4+SgRVjMcjMVFCXyZqJfodPqWIL0/qbBtkfuXPlaJaR3ExaM8FeeyHeFqE/vD/P
	ilHJ4+9GQJ7NX5hDn2nkhTMcktLhoMyNQnv9/2qgnFCdC2Iur4Sr2pCR3rBMekO8
	lWhGefogjEPBQ/SDo9Kf3gtMDN9wq/luk7z9+UVWPIRrrkKboevtVIoAv4h+Tvrr
	15RV4eUhgHIGs/FKBcW9QuU/fKKj2FOEP5dPnuoCz4ZRYmsfKViVyKMKQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40brr1gbdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:33 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46DGuXnB018398;
	Sat, 13 Jul 2024 16:56:33 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40brr1gbdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46DFLObD010251;
	Sat, 13 Jul 2024 16:56:32 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40bqxks5t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:32 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46DGuQRF56623612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Jul 2024 16:56:28 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C58D420040;
	Sat, 13 Jul 2024 16:56:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D40BA2004B;
	Sat, 13 Jul 2024 16:56:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.49.134])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 13 Jul 2024 16:56:23 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V7 16/18] tools/perf: Add support for global_die to capture name of variable in case of register defined variable
Date: Sat, 13 Jul 2024 22:25:27 +0530
Message-Id: <20240713165529.59298-17-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240713165529.59298-1-atrajeev@linux.vnet.ibm.com>
References: <20240713165529.59298-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nVtAhAtA5T-p5L0uBwiZXirMTeqctga9
X-Proofpoint-GUID: Pz-NKPfLrmct5-5-4eESPwD4U36pIVnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407130127
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
variable name is set as part of Dwarf_Global.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/annotate-data.c | 30 ++++++++++++++++++++++++------
 tools/perf/util/dwarf-aux.c     |  1 +
 tools/perf/util/dwarf-aux.h     |  1 +
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index a5b4429ede57..8d05f3dbddf6 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -268,28 +268,37 @@ static void delete_members(struct annotated_member *member)
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
+	char *var_name = NULL;
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
+	key.self.var_name = var_name;
 	key.self.size = size;
 	node = rb_find(&key, dso__data_types(dso), data_type_cmp);
 	if (node) {
 		result = rb_entry(node, struct annotated_data_type, node);
 		free(type_name);
+		free(var_name);
 		return result;
 	}
 
@@ -297,10 +306,12 @@ static struct annotated_data_type *dso__findnew_data_type(struct dso *dso,
 	result = zalloc(sizeof(*result));
 	if (result == NULL) {
 		free(type_name);
+		free(var_name);
 		return NULL;
 	}
 
 	result->self.type_name = type_name;
+	result->self.var_name = var_name;
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
@@ -1191,8 +1202,11 @@ static int find_data_type_global_reg(struct data_loc_info *dloc, int reg, Dwarf_
 		if (dwarf_offdie(dloc->di->dbg, var_types->die_off, &vr_die)) {
 			if (die_get_real_type(&vr_die, type_die) == NULL) {
 				dloc->type_offset = 0;
+				global_die->name = var_types->name;
 				dwarf_offdie(dloc->di->dbg, var_types->die_off, type_die);
 			}
+			global_die->die_offset = (long)dwarf_dieoffset(type_die);
+			global_die->cu_offset = (long)dwarf_dieoffset(cu_die);
 			pr_debug_type_name(type_die, TSR_KIND_TYPE);
 			ret = 0;
 			pr_debug_dtp("found by CU for %s (die:%#lx)\n",
@@ -1207,7 +1221,8 @@ static int find_data_type_global_reg(struct data_loc_info *dloc, int reg, Dwarf_
 }
 
 /* The result will be saved in @type_die */
-static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
+static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die,
+		Dwarf_Global *global_die)
 {
 	struct annotated_op_loc *loc = dloc->op;
 	Dwarf_Die cu_die, var_die;
@@ -1221,6 +1236,8 @@ static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
 	u64 pc;
 	char buf[64];
 
+	memset(global_die, 0, sizeof(Dwarf_Global));
+
 	if (dloc->op->multi_regs)
 		snprintf(buf, sizeof(buf), "reg%d, reg%d", dloc->op->reg1, dloc->op->reg2);
 	else if (dloc->op->reg1 == DWARF_REG_PC)
@@ -1254,7 +1271,7 @@ static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
 		     dwarf_diename(&cu_die), (long)dwarf_dieoffset(&cu_die));
 
 	if (loc->reg_type == DWARF_REG_GLOBAL) {
-		ret = find_data_type_global_reg(dloc, reg, &cu_die, type_die);
+		ret = find_data_type_global_reg(dloc, reg, &cu_die, type_die, global_die);
 		if (!ret)
 			goto out;
 	}
@@ -1390,6 +1407,7 @@ struct annotated_data_type *find_data_type(struct data_loc_info *dloc)
 	struct annotated_data_type *result = NULL;
 	struct dso *dso = map__dso(dloc->ms->map);
 	Dwarf_Die type_die;
+	Dwarf_Global global_die;
 
 	dloc->di = debuginfo__new(dso__long_name(dso));
 	if (dloc->di == NULL) {
@@ -1405,10 +1423,10 @@ struct annotated_data_type *find_data_type(struct data_loc_info *dloc)
 
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
-- 
2.43.0

