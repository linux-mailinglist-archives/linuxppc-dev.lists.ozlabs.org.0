Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623C92988F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 16:57:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YhJogu96;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WH9N207Dgz3cWW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 00:57:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YhJogu96;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WH96826Dxz30TB
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2024 00:45:36 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 467E9KHg020782;
	Sun, 7 Jul 2024 14:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=NNIitYQTof7bC
	wCLyIhNecMswqmFUBkEihBmAGWubdo=; b=YhJogu963haui53unGsQn5L6pfPgR
	Bst/lgn85GT0lbwClyvjXCxM7rPXEu9QvJPcMh8MoF7c4ahMe7qPur7A162sUqXG
	EBndvqQZEgpBcGqAXOtGwuvIuOtjLmA6NlD7yFClxmkrRyoCWjcEy/HScw9eydmQ
	T2UJQei6NeTWY3CNpdGtU4FKTOXBsDVX6VrWeqAU6+NR5PsTp6eD+WySsR1UShNy
	wuNtkqMOJabHUdLlkBLUvlG+SIjfCHI5hYj6lANlr853i/tRoAxJ3jhCe5B1OSGn
	LaySeSBbjlbr9nfkWqR1LbkroKcrSDDbONCZjfwkp8+Tt46C6TVQnDP2w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 407jpygxpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 14:45:28 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 467EjR4C002412;
	Sun, 7 Jul 2024 14:45:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 407jpygxp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 14:45:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 467CfCgb014004;
	Sun, 7 Jul 2024 14:45:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 407jy2t4y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 14:45:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 467EjL9I34144974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Jul 2024 14:45:23 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 261DB20049;
	Sun,  7 Jul 2024 14:45:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4441020040;
	Sun,  7 Jul 2024 14:45:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.1.68])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  7 Jul 2024 14:45:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V6 17/18] tools/perf: Update data_type_cmp and sort__typeoff_sort function to include var_name in comparison
Date: Sun,  7 Jul 2024 20:14:18 +0530
Message-Id: <20240707144419.92510-18-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
References: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9uZ9EDYUqagtjEvMB1b-uZIGhygarK4n
X-Proofpoint-GUID: 9i3K7glssPLN__BEcUO3xmP5RKrd4Djs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-07_06,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407070117
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

Currently data_type_cmp() only compares size and type name.
But in cases where the type name of two data type entries
is same, but var_name is different, the comparison can't distinguish
two different types.

Consider there is a "long unsigned int" with var_name as "X" and there
is global variable "long unsigned int". Currently since
data_type_cmp uses only type_name for comparison ( "long unsigned int"),
it won't distinguish these as separate entries. Update the
functions "data_type_cmp" as well as "sort__typeoff_sort" to
compare variable names after type name if it exists.

Also updated "hist_entry__typeoff_snprintf" to print var_name if
it is set. With the changes,

     11.42%  long unsigned int  long unsigned int +0 (current_stack_pointer)
     4.68%  struct paca_struct  struct paca_struct +2312 (__current)
     4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)
     2.69%  struct paca_struct  struct paca_struct +2808 (canary)
     2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
     2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
     1.43%  long unsigned int  long unsigned int +0 (no field)

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/annotate-data.c | 24 ++++++++++++++++++++++--
 tools/perf/util/sort.c          | 23 +++++++++++++++++++++--
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 8d05f3dbddf6..759c6a22e719 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -167,7 +167,7 @@ static void exit_type_state(struct type_state *state)
 }
 
 /*
- * Compare type name and size to maintain them in a tree.
+ * Compare type name, var_name  and size to maintain them in a tree.
  * I'm not sure if DWARF would have information of a single type in many
  * different places (compilation units).  If not, it could compare the
  * offset of the type entry in the .debug_info section.
@@ -176,12 +176,32 @@ static int data_type_cmp(const void *_key, const struct rb_node *node)
 {
 	const struct annotated_data_type *key = _key;
 	struct annotated_data_type *type;
+	int64_t ret = 0;
 
 	type = rb_entry(node, struct annotated_data_type, node);
 
 	if (key->self.size != type->self.size)
 		return key->self.size - type->self.size;
-	return strcmp(key->self.type_name, type->self.type_name);
+
+	ret = strcmp(key->self.type_name, type->self.type_name);
+	if (ret) {
+		return ret;
+	}
+
+	/*
+	 * Compare var_name if it exists for key and type.
+	 * If both nodes doesn't have var_name, but one of
+	 * them has, return non-zero. This is to indicate nodes
+	 * are not the same if one has var_name, but other doesn't.
+	 */
+	if (key->self.var_name && type->self.var_name) {
+		ret = strcmp(key->self.var_name, type->self.var_name);
+		if (ret)
+			return ret;
+	} else if (key->self.var_name || type->self.var_name)
+		return 1;
+
+	return ret;
 }
 
 static bool data_type_less(struct rb_node *node_a, const struct rb_node *node_b)
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index cd39ea972193..c6d885060ee7 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -2267,9 +2267,25 @@ sort__typeoff_sort(struct hist_entry *left, struct hist_entry *right)
 		right_type = right->mem_type;
 	}
 
+	/*
+	 * Compare type_name first. Next, ompare var_name if it exists
+	 * for left and right hist_entry. If both entries doesn't have
+	 * var_name, but one of them has, return non-zero. This is to
+	 * indicate entries are not the same if one has var_name, but the
+	 * other doesn't.
+	 * If type_name and var_name is same, use mem_type_off field.
+	 */
 	ret = strcmp(left_type->self.type_name, right_type->self.type_name);
 	if (ret)
 		return ret;
+
+	if (left_type->self.var_name && right_type->self.var_name) {
+		ret = strcmp(left_type->self.var_name, right_type->self.var_name);
+		if (ret)
+			return ret;
+	} else if (right_type->self.var_name || left_type->self.var_name)
+		return 1;
+
 	return left->mem_type_off - right->mem_type_off;
 }
 
@@ -2305,9 +2321,12 @@ static int hist_entry__typeoff_snprintf(struct hist_entry *he, char *bf,
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

