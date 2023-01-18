Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD37671349
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 06:46:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxZVv0w38z3fBP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 16:45:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FRvjhkC1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FRvjhkC1;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxZTy6CmPz2yPY;
	Wed, 18 Jan 2023 16:45:10 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I3XHVV014166;
	Wed, 18 Jan 2023 05:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lzo+vFKUeyPZzJ8AQgo34q5Xnrq9SDrHgAysCEk8+IU=;
 b=FRvjhkC12vd835SGOVOm5DPcDENQv0S/HNBX3C9GQSQgypF7o5CNl3T/lwUCsUw3mEFE
 GeJD2JuuXjYjN54cbxCGrwf03oruugQiai2KXfgtfuDcRHObgY4GgXFQVspxKK7RTlVp
 jKE+TcQn/J8RjJSmdvnMvqlzjCHIPUm7R++5X5qyy0cDJ63zLW/kLlXG2WmSD2gMTN15
 OY9Yd+mQ/EDAtpfbNTSa5MdmlNlo3bFidzau5tJHTyKbtavEpTFMWTlZBb6iwXCEF7/i
 giNLykn7znns/C6koahUNmJwhFwp3YATZOQ3o8wsQFqq+qSDeNzPWZg4QX0PZ1NNb7B3 ew== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n68yca6mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 05:45:02 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HBVtGq027441;
	Wed, 18 Jan 2023 05:45:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3n3knfbghk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 05:45:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I5iuxG45023730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 05:44:56 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C265820043;
	Wed, 18 Jan 2023 05:44:56 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1C1220040;
	Wed, 18 Jan 2023 05:44:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.55.224])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Jan 2023 05:44:54 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, mpe@ellerman.id.au,
        maddy@linux.ibm.com
Subject: [PATCH V2 1/3] core/device: Add function to return child node using name at substring "@"
Date: Wed, 18 Jan 2023 11:14:50 +0530
Message-Id: <20230118054452.27242-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bUXzWAFa-x77dfO_s6HBXFnSXfU83s8Q
X-Proofpoint-ORIG-GUID: bUXzWAFa-x77dfO_s6HBXFnSXfU83s8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301180047
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
---
Changelog:
v1 -> v2:
- Addressed review comment from Dan to update
  the utility funtion to search and compare
  upto "@". Renamed it as dt_find_by_name_substr.
  
 core/device.c          | 18 ++++++++++++++++++
 core/test/run-device.c | 11 +++++++++++
 include/device.h       |  3 +++
 3 files changed, 32 insertions(+)

diff --git a/core/device.c b/core/device.c
index 2de37c74..df3a5775 100644
--- a/core/device.c
+++ b/core/device.c
@@ -395,6 +395,24 @@ struct dt_node *dt_find_by_name(struct dt_node *root, const char *name)
 }
 
 
+struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char *name)
+{
+	struct dt_node *child, *match;
+	char *pos;
+
+	list_for_each(&root->children, child, list) {
+		pos = strchr(child->name, '@');
+		if (!strncmp(child->name, name, pos - child->name))
+			return child;
+
+		match = dt_find_by_name_substr(child, name);
+		if (match)
+			return match;
+	}
+
+	return NULL;
+}
+
 struct dt_node *dt_new_check(struct dt_node *parent, const char *name)
 {
 	struct dt_node *node = dt_find_by_name(parent, name);
diff --git a/core/test/run-device.c b/core/test/run-device.c
index 4a12382b..0e463e58 100644
--- a/core/test/run-device.c
+++ b/core/test/run-device.c
@@ -466,6 +466,17 @@ int main(void)
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
2.27.0

