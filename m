Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612F47A0AEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 18:40:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JPThUwgR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmjjM1XSRz3dDP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 02:40:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JPThUwgR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmjhR3Z8bz3c3h;
	Fri, 15 Sep 2023 02:39:19 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EGOlgG021808;
	Thu, 14 Sep 2023 16:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=tUDze2RzJqcfgkE8mSArhlujveD4Z8kNxtXeffh7iJs=;
 b=JPThUwgR9qC/95tiJhzyrm9LmM2ecSb9hMM8rQ/X9KH71KIW5OrU5r6u5qh89UTLsR5X
 xmr6FaYQUHTZ/C8HGTLSDp3mVDEfHcV0NtzHnXG6oDHR2ndPAesJmM7LVsMvOt/WtflF
 8J3/ZuCMP7vzHd8oreIWvhIvvDgIY1klS2JNmpWtr2YQdtOPV3o1xNZq+bODaUirRQW5
 c0bHBLJtKbBog7fP85Z7c7cCIgXxztxxmc58FHJ57ADISOOq07ghc01xpwvEsi7A/zwo
 9859133VBOP13TVc/PxgH4MSZkrQJsVUMQJ8xKG3tjjDLcW66+kCcQpcdCO8TGh7uHdM FA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t45ns0e5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 16:39:06 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38EFUsBA022744;
	Thu, 14 Sep 2023 16:32:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t141p4abc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 16:32:15 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38EGWCZJ65536346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 16:32:12 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B5B72004B;
	Thu, 14 Sep 2023 16:32:12 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B44020040;
	Thu, 14 Sep 2023 16:32:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.35.47])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Sep 2023 16:32:10 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, arbab@linux.ibm.com,
        mpe@ellerman.id.au, maddy@linux.ibm.com
Subject: [PATCH 1/3] core/device: Add function to return child node using name at substring "@"
Date: Thu, 14 Sep 2023 22:02:04 +0530
Message-Id: <20230914163206.97811-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BaJprrm-FGJEVIAuUSYQrcIsL-uhmGt8
X-Proofpoint-GUID: BaJprrm-FGJEVIAuUSYQrcIsL-uhmGt8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309140143
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
Cc: kjain@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a function dt_find_by_name_before_addr() that returns the child node if
it matches till first occurrence at "@" of a given name, otherwise NULL.
This is helpful for cases with node name like: "name@addr". In
scenarios where nodes are added with "name@addr" format and if the
value of "addr" is not known, that node can't be matched with node
name or addr. Hence matching with substring as node name will return
the expected result. Patch adds dt_find_by_name_before_addr() function
and testcase for the same in core/test/run-device.c

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
Changelog:
v5 -> v6:
- Addressed review comment from Reza. Instead of using new
  variable for "node", use the node "name" as-is since the
  utility is to check the name before addr. Updated the
  test/run-device.c accordingly

v4 -> v5:
- Addressed review comment from Reza and renamed
  dt_find_by_name_substr to dt_find_by_name_before_addr

v3 -> v4:
- Addressed review comment from Mahesh and added his Reviewed-by.

v2 -> v3:
- After review comments from Mahesh, fixed the code
  to consider string upto "@" for both input node name
  as well as child node name. V2 version was comparing
  input node name and child node name upto string length
  of child name. But this will return wrong node if input
  name is larger than child name. Because it will match
  as substring for child name.
  https://lists.ozlabs.org/pipermail/skiboot/2023-January/018596.html

v1 -> v2:
- Addressed review comment from Dan to update
  the utility funtion to search and compare
  upto "@". Renamed it as dt_find_by_name_substr.

 core/device.c          | 25 +++++++++++++++++++++++++
 core/test/run-device.c | 14 ++++++++++++++
 include/device.h       |  3 +++
 3 files changed, 42 insertions(+)

diff --git a/core/device.c b/core/device.c
index 2de37c741..c22b6b3c3 100644
--- a/core/device.c
+++ b/core/device.c
@@ -395,6 +395,31 @@ struct dt_node *dt_find_by_name(struct dt_node *root, const char *name)
 }
 
 
+struct dt_node *dt_find_by_name_before_addr(struct dt_node *root, const char *name)
+{
+	struct dt_node *child, *match;
+	char *child_node = NULL;
+
+	list_for_each(&root->children, child, list) {
+		child_node = strdup(child->name);
+		if (!child_node)
+			goto err;
+		child_node = strtok(child_node, "@");
+		if (!strcmp(child_node, name)) {
+			free(child_node);
+			return child;
+		}
+
+		match = dt_find_by_name_before_addr(child, name);
+		if (match)
+			return match;
+	}
+
+	free(child_node);
+err:
+	return NULL;
+}
+
 struct dt_node *dt_new_check(struct dt_node *parent, const char *name)
 {
 	struct dt_node *node = dt_find_by_name(parent, name);
diff --git a/core/test/run-device.c b/core/test/run-device.c
index 4a12382bb..fb7a7d2c0 100644
--- a/core/test/run-device.c
+++ b/core/test/run-device.c
@@ -466,6 +466,20 @@ int main(void)
 	new_prop_ph = dt_prop_get_u32(ut2, "something");
 	assert(!(new_prop_ph == ev1_ph));
 	dt_free(subtree);
+
+	/* Test dt_find_by_name_before_addr */
+	root = dt_new_root("");
+	addr1 = dt_new_addr(root, "node", 0x1);
+	addr2 = dt_new_addr(root, "node0_1", 0x2);
+	assert(dt_find_by_name(root, "node@1") == addr1);
+	assert(dt_find_by_name(root, "node0_1@2") == addr2);
+	assert(dt_find_by_name_before_addr(root, "node") == addr1);
+	assert(dt_find_by_name_before_addr(root, "node0_") == NULL);
+	assert(dt_find_by_name_before_addr(root, "node0_1") == addr2);
+	assert(dt_find_by_name_before_addr(root, "node0") == NULL);
+	assert(dt_find_by_name_before_addr(root, "node0_") == NULL);
+	dt_free(root);
+
 	return 0;
 }
 
diff --git a/include/device.h b/include/device.h
index 93fb90ff4..f2402cc4d 100644
--- a/include/device.h
+++ b/include/device.h
@@ -184,6 +184,9 @@ struct dt_node *dt_find_by_path(struct dt_node *root, const char *path);
 /* Find a child node by name */
 struct dt_node *dt_find_by_name(struct dt_node *root, const char *name);
 
+/* Find a child node by name and substring */
+struct dt_node *dt_find_by_name_before_addr(struct dt_node *root, const char *name);
+
 /* Find a node by phandle */
 struct dt_node *dt_find_by_phandle(struct dt_node *root, u32 phandle);
 
-- 
2.31.1

