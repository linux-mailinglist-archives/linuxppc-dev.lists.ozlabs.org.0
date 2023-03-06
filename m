Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8E56AB516
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 04:40:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVPVF3x1sz3cJv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 14:40:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OFs87k8V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OFs87k8V;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVPTH69XFz3c9N;
	Mon,  6 Mar 2023 14:39:31 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3260U0B8005322;
	Mon, 6 Mar 2023 03:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=M/CH+Z/9B5RPiAbj63QXBSg1Nii+I0PsizyVLxqbvjI=;
 b=OFs87k8V3ku/4E/gtc6TyRi083BIlkdfs2rj4cloM3tUtPKp/Bo0yP1zBdnp9A8jiZ3j
 nYRdtGFNwUZrCH2rR0mjQiQDDjGUyb0ktezXamzm56qZAa2tiRFwETKPYFauomn1nJLR
 okC8rZ3LSEDCRxCTw9Vxrtg9bfx099e5DH26np/0vyvhZQh+qftThgM+OPfbNh769yCm
 DRSoZO7dYeNYvIwkViaO0C/CqtWfZAKtdWOtg9AfCtvK7THHxhM/Fe9YMPKW33D/I9yR
 ///OIJlyeKz+i7H3oh1Qf219mOygpwddQ2vRZ4NWpG8ElXHu3fKJ7bU/hOUmIJkWGv2A Tw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p50n3qjm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 03:39:21 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32626AEo015386;
	Mon, 6 Mar 2023 03:39:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3p419k9pwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 03:39:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3263dGJo54788504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Mar 2023 03:39:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00BA620049;
	Mon,  6 Mar 2023 03:39:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7874420040;
	Mon,  6 Mar 2023 03:39:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.99.34])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Mar 2023 03:39:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, mpe@ellerman.id.au,
        maddy@linux.ibm.com
Subject: [PATCH V4 1/3] core/device: Add function to return child node using name at substring "@"
Date: Mon,  6 Mar 2023 09:09:11 +0530
Message-Id: <20230306033913.80524-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bF8iv2qZcVdch32MKIZ9q787i8JM7vFY
X-Proofpoint-GUID: bF8iv2qZcVdch32MKIZ9q787i8JM7vFY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-05_12,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060028
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
Cc: kjain@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a function dt_find_by_name_substr() that returns the child node if
it matches till first occurence at "@" of a given name, otherwise NULL.
This is helpful for cases with node name like: "name@addr". In
scenarios where nodes are added with "name@addr" format and if the
value of "addr" is not known, that node can't be matched with node
name or addr. Hence matching with substring as node name will return
the expected result. Patch adds dt_find_by_name_substr() function
and testcase for the same in core/test/run-device.c

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
Changelog:
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

 core/device.c          | 31 +++++++++++++++++++++++++++++++
 core/test/run-device.c | 15 +++++++++++++++
 include/device.h       |  3 +++
 3 files changed, 49 insertions(+)

diff --git a/core/device.c b/core/device.c
index b102dd97..6b457ec4 100644
--- a/core/device.c
+++ b/core/device.c
@@ -395,6 +395,37 @@ struct dt_node *dt_find_by_name(struct dt_node *root, const char *name)
 }
 
 
+struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char *name)
+{
+	struct dt_node *child, *match;
+	char *node, *child_node = NULL;
+
+	node = strdup(name);
+	if (!node)
+		return NULL;
+	node = strtok(node, "@");
+	list_for_each(&root->children, child, list) {
+		child_node = strdup(child->name);
+		if (!child_node)
+			goto err;
+		child_node = strtok(child_node, "@");
+		if (!strcmp(child_node, node)) {
+			free(child_node);
+			free(node);
+			return child;
+		}
+
+		match = dt_find_by_name_substr(child, name);
+		if (match)
+			return match;
+	}
+
+	free(child_node);
+err:
+	free(node);
+	return NULL;
+}
+
 struct dt_node *dt_new_check(struct dt_node *parent, const char *name)
 {
 	struct dt_node *node = dt_find_by_name(parent, name);
diff --git a/core/test/run-device.c b/core/test/run-device.c
index 4a12382b..6997452e 100644
--- a/core/test/run-device.c
+++ b/core/test/run-device.c
@@ -466,6 +466,21 @@ int main(void)
 	new_prop_ph = dt_prop_get_u32(ut2, "something");
 	assert(!(new_prop_ph == ev1_ph));
 	dt_free(subtree);
+
+	/* Test dt_find_by_name_substr */
+	root = dt_new_root("");
+	addr1 = dt_new_addr(root, "node", 0x1);
+	addr2 = dt_new_addr(root, "node0_1", 0x2);
+	assert(dt_find_by_name(root, "node@1") == addr1);
+	assert(dt_find_by_name(root, "node0_1@2") == addr2);
+	assert(dt_find_by_name_substr(root, "node@1") == addr1);
+	assert(dt_find_by_name_substr(root, "node0_1@2") == addr2);
+	assert(dt_find_by_name_substr(root, "node0_") == NULL);
+	assert(dt_find_by_name_substr(root, "node0_1") == addr2);
+	assert(dt_find_by_name_substr(root, "node0@") == NULL);
+	assert(dt_find_by_name_substr(root, "node0_@") == NULL);
+	dt_free(root);
+
 	return 0;
 }
 
diff --git a/include/device.h b/include/device.h
index 93fb90ff..b6a1a813 100644
--- a/include/device.h
+++ b/include/device.h
@@ -184,6 +184,9 @@ struct dt_node *dt_find_by_path(struct dt_node *root, const char *path);
 /* Find a child node by name */
 struct dt_node *dt_find_by_name(struct dt_node *root, const char *name);
 
+/* Find a child node by name and substring */
+struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char *name);
+
 /* Find a node by phandle */
 struct dt_node *dt_find_by_phandle(struct dt_node *root, u32 phandle);
 
-- 
2.31.1

