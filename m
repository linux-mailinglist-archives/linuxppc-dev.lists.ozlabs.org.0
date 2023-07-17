Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7AF755A0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 05:25:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CkqpaiL2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R46t73z2Wz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 13:25:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CkqpaiL2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R46s12Zrhz30Q4;
	Mon, 17 Jul 2023 13:24:52 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H3EvBO005927;
	Mon, 17 Jul 2023 03:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=7SdYHfHY5+0UE0Es+kMq1MP3tq5/4c1+//wcsbcIA4U=;
 b=CkqpaiL2BidxDqZXNbPQJWpWymIy9P2RKNahZUxei4/hJmVhbzzDvbRp2YISqDIeygts
 q2ySIf+PD4iN1d6uZPQXp+96WI8Eqw5mqCRLaxnbZrspdnMWg7p5gLGcRTM10aoJoKqg
 OVILsKtalC/FAAogze1KcqEvBgdm1vA9PvbTMtaC9BUdpfzvPGtbtge5kORzMqYxLs8x
 /i8mnJYLa4KktpHfZC+RAZAXF91AoZIHd21NtJl5INP3kwEpk2awx9ccPBzGYFM7tW0U
 6vXRIHCXDclwS3BOeHF+yHh+YZL6Cs3/xLfDcoEggmUR30uZcvpc3HZCqO8sH9oBDzZM hQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rvwjkg4d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 03:24:43 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36H2chtb001832;
	Mon, 17 Jul 2023 03:24:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3rujqdrr2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 03:24:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36H3Oboi9896456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jul 2023 03:24:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1836E20043;
	Mon, 17 Jul 2023 03:24:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1622620040;
	Mon, 17 Jul 2023 03:24:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.121])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jul 2023 03:24:34 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, arbab@linux.ibm.com,
        mpe@ellerman.id.au, maddy@linux.ibm.com
Subject: [PATCH V5 1/3] core/device: Add function to return child node using name at substring "@"
Date: Mon, 17 Jul 2023 08:54:29 +0530
Message-Id: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r4sBUXzxgIQnsaIW0Mas94cYhWDaf-65
X-Proofpoint-ORIG-GUID: r4sBUXzxgIQnsaIW0Mas94cYhWDaf-65
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_02,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1011 mlxscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307170027
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

 core/device.c          | 31 +++++++++++++++++++++++++++++++
 core/test/run-device.c | 14 ++++++++++++++
 include/device.h       |  3 +++
 3 files changed, 48 insertions(+)

diff --git a/core/device.c b/core/device.c
index b102dd97..a61a72b0 100644
--- a/core/device.c
+++ b/core/device.c
@@ -395,6 +395,37 @@ struct dt_node *dt_find_by_name(struct dt_node *root, const char *name)
 }
 
 
+struct dt_node *dt_find_by_name_before_addr(struct dt_node *root, const char *name)
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
+		match = dt_find_by_name_before_addr(child, name);
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
index 4a12382b..f1cb79bf 100644
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
+	assert(dt_find_by_name_before_addr(root, "node@1") == addr1);
+	assert(dt_find_by_name_before_addr(root, "node0_") == NULL);
+	assert(dt_find_by_name_before_addr(root, "node0_1") == addr2);
+	assert(dt_find_by_name_before_addr(root, "node0@") == NULL);
+	assert(dt_find_by_name_before_addr(root, "node0_@") == NULL);
+	dt_free(root);
+
 	return 0;
 }
 
diff --git a/include/device.h b/include/device.h
index 93fb90ff..f2402cc4 100644
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
2.39.3

