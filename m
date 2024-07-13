Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D89306A0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 19:09:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IHH8UyQ/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLw1s1Zzkz3cgW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 03:09:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IHH8UyQ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLvkl3Llwz3cXs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 02:56:47 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46DGR40x026544;
	Sat, 13 Jul 2024 16:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=ci+xLOYncSmJy
	aMAhUZvwOs9b5ECPE68dAlCJeSPwuQ=; b=IHH8UyQ/MrG6aKqqaWVnr6LPFqrOL
	VNWSmsEyF10/+9ItaaWltDog8esv/3AcHRtxlpIYq7bNmStXj7+SyqwWBkIhKHIB
	DUwlFAIvAQognDnwLMKHw//GU5K1cGQIbWdvjvYvlDVAfYZzZjt9kjz+iG6XWMoR
	pTnX2EdLYGUmmOSHvOQ3JkhTYeZh7a+H6o3wXNvi57IbLvy1O/PKnYSuOou2o0w4
	vnzIZWQkMHUqXqYQqzXZDtDvVZ/eX0lp+5gbiUmkzSCJx6dCML7xHHS2JEhTCzXl
	femna18MjS5LKmjN5VHHrLc28f2mv6zVYDLx6/yJIGkqLAqr3y7yeQZYg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40bv8fg346-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:36 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46DGuabU002094;
	Sat, 13 Jul 2024 16:56:36 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40bv8fg342-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:36 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46DDneFp011368;
	Sat, 13 Jul 2024 16:56:35 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 40bpec1fr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46DGuUTN48365826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Jul 2024 16:56:32 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E358720040;
	Sat, 13 Jul 2024 16:56:29 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2058920043;
	Sat, 13 Jul 2024 16:56:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.49.134])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 13 Jul 2024 16:56:26 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V7 17/18] tools/perf: Update data_type_cmp and sort__typeoff_sort function to include var_name in comparison
Date: Sat, 13 Jul 2024 22:25:28 +0530
Message-Id: <20240713165529.59298-18-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240713165529.59298-1-atrajeev@linux.vnet.ibm.com>
References: <20240713165529.59298-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c4eEETZd6dkGbtG27bWJMfdToVwKdhiB
X-Proofpoint-GUID: t-n62G_J7rEK980inkD2cU5TsP2v6RJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407130127
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
compare variable names after type name if it exists. Inorder to
use cmp_null, make the cmp_null from sort.c as not static.

Also updated "hist_entry__typeoff_snprintf" to print var_name if
it is set. With the changes,

     11.42%  long unsigned int  long unsigned int +0 (current_stack_pointer)
     4.68%  struct paca_struct  struct paca_struct +2312 (__current)
     4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)
     2.69%  struct paca_struct  struct paca_struct +2808 (canary)
     2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
     2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
     1.43%  long unsigned int  long unsigned int +0 (no field)

Using ./perf report -s type,typeoff -H:

    17.65%     struct paca_struct
        4.68%     struct paca_struct +2312 (__current)
        4.57%     struct paca_struct +2354 (irq_soft_mask)
        2.69%     struct paca_struct +2808 (canary)
        2.68%     struct paca_struct +8 (paca_index)
        2.24%     struct paca_struct +48 (data_offset)
        0.55%     struct paca_struct +2816 (mmiowb_state.nesting_count)
        0.18%     struct paca_struct +2818 (mmiowb_state.mmiowb_pending)
        0.03%     struct paca_struct +2352 (hsrr_valid)
        0.02%     struct paca_struct +2356 (irq_work_pending)
        0.00%     struct paca_struct +0 (lppaca_ptr)
    12.85%     long unsigned int
       11.42%     long unsigned int +0 (current_stack_pointer)
        1.43%     long unsigned int +0 (no field)

With perf report -s type:

     17.65%  struct paca_struct
     12.85%  long unsigned int
      1.69%  struct task_struct
      1.51%  struct rq

with perf report -s typeoff

    11.42%  long unsigned int +0 (current_stack_pointer)
     4.68%  struct paca_struct +2312 (__current)
     4.57%  struct paca_struct +2354 (irq_soft_mask)
     2.69%  struct paca_struct +2808 (canary)
     2.68%  struct paca_struct +8 (paca_index)
     2.24%  struct paca_struct +48 (data_offset)
     1.43%  long unsigned int +0 (no field)

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/annotate-data.c | 23 +++++++++++++++++++++--
 tools/perf/util/sort.c          | 25 ++++++++++++++++++++++---
 tools/perf/util/sort.h          |  1 +
 3 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 8d05f3dbddf6..ea69c8d3d856 100644
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
@@ -176,12 +176,31 @@ static int data_type_cmp(const void *_key, const struct rb_node *node)
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
+	if (ret)
+		return ret;
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
+	} else if (!key->self.var_name != !type->self.var_name)
+		return cmp_null(key->self.var_name, type->self.var_name);
+
+	return ret;
 }
 
 static bool data_type_less(struct rb_node *node_a, const struct rb_node *node_b)
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index cd39ea972193..25761d01dbd0 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -95,7 +95,7 @@ static int repsep_snprintf(char *bf, size_t size, const char *fmt, ...)
 	return n;
 }
 
-static int64_t cmp_null(const void *l, const void *r)
+int64_t cmp_null(const void *l, const void *r)
 {
 	if (!l && !r)
 		return 0;
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
+	} else if (!left_type->self.var_name != !right_type->self.var_name)
+		return cmp_null(left_type->self.var_name, right_type->self.var_name);
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
diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
index 0bd0ee3ae76b..41346d2b940e 100644
--- a/tools/perf/util/sort.h
+++ b/tools/perf/util/sort.h
@@ -151,4 +151,5 @@ sort__dcacheline_cmp(struct hist_entry *left, struct hist_entry *right);
 int64_t
 _sort__sym_cmp(struct symbol *sym_l, struct symbol *sym_r);
 char *hist_entry__srcline(struct hist_entry *he);
+int64_t cmp_null(const void *l, const void *r);
 #endif	/* __PERF_SORT_H */
-- 
2.43.0

