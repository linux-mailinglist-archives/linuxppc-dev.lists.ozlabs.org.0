Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D0F65ACF3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 04:18:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nlh0L0CV3z3c6X
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 14:18:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FGIObstr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FGIObstr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nlgwt1HhLz3bby;
	Mon,  2 Jan 2023 14:15:41 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 301K50vg010839;
	Mon, 2 Jan 2023 03:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZEZhGpd5OcmRlBRT0DIEjW5bp2R/P1usVwTeGOofwKc=;
 b=FGIObstrbGCjVAf618YDKfwRj07tvbs0ZxWQUe16coWx6H28sPQtia9MnIHaC7MWwCws
 adMlW99YQXRRDF+I7k0qLrSFKg7V1exy8ZGnYWtfc5FqYrqN9lwCLn3Qr05qMX5lsb8w
 F8cvsZ6GUetkeAcu4YNy1I+jFBUQp3LmrH3b9y0B5nie4ZUj6/kv1jqLTvplaz512HvR
 fnRCBrc9zl1f88pcXagsUdCozaPYJLh9ZRGYa9RluPN0Lnml6u9fM3bPXn+wXJWfTM+z
 H0KoaGMPhUaGdyh51S/mB+3mjt/3O5Izhvk/BTvzHPhQvP1N1J2SJLYRHvMS7nnEXQhE YQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mty830d3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 03:15:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3020AtUD001428;
	Mon, 2 Jan 2023 03:15:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mtcbf9w6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 03:15:31 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3023FRtf46072316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jan 2023 03:15:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37F0D20043;
	Mon,  2 Jan 2023 03:15:27 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A857F20040;
	Mon,  2 Jan 2023 03:15:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.47.130])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Jan 2023 03:15:25 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, mpe@ellerman.id.au, maddy@linux.ibm.com
Subject: [PATCH 1/3] core/device: Add function to return child node using name and length
Date: Mon,  2 Jan 2023 08:45:22 +0530
Message-Id: <20230102031524.73249-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6fSssP0TDO0lnqTs1kAIsWYfjDsvqdwE
X-Proofpoint-ORIG-GUID: 6fSssP0TDO0lnqTs1kAIsWYfjDsvqdwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-01_11,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020027
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

Add a function dt_find_by_name_len() that returns the child node if
it matches the first "n" characters of a given name, otherwise NULL.
This is helpful for cases with node name like: "name@addr". In
scenarios where nodes are added with "name@addr" format and if the
value of "addr" is not known, that node can't be matched with node
name or addr. Hence matching with substring as node name will return
the expected result. Patch adds dt_find_by_name_len() function
and testcase for the same in core/test/run-device.c

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 core/device.c          | 20 ++++++++++++++++++++
 core/test/run-device.c | 11 +++++++++++
 include/device.h       |  4 ++++
 3 files changed, 35 insertions(+)

diff --git a/core/device.c b/core/device.c
index 2de37c74..72c54e85 100644
--- a/core/device.c
+++ b/core/device.c
@@ -395,6 +395,26 @@ struct dt_node *dt_find_by_name(struct dt_node *root, const char *name)
 }
 
 
+struct dt_node *dt_find_by_name_len(struct dt_node *root,
+					const char *name, int len)
+{
+	struct dt_node *child, *match;
+
+	if (len <= 0)
+		return NULL;
+
+	list_for_each(&root->children, child, list) {
+		if (!strncmp(child->name, name, len))
+			return child;
+
+		match = dt_find_by_name_len(child, name, len);
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
index 4a12382b..8c552103 100644
--- a/core/test/run-device.c
+++ b/core/test/run-device.c
@@ -466,6 +466,17 @@ int main(void)
 	new_prop_ph = dt_prop_get_u32(ut2, "something");
 	assert(!(new_prop_ph == ev1_ph));
 	dt_free(subtree);
+
+	/* Test dt_find_by_name_len */
+	root = dt_new_root("");
+	addr1 = dt_new_addr(root, "node", 0x1);
+	addr2 = dt_new_addr(root, "node0_1", 0x2);
+	assert(dt_find_by_name(root, "node@1") == addr1);
+	assert(dt_find_by_name(root, "node0_1@2") == addr2);
+	assert(dt_find_by_name_len(root, "node@", 5) == addr1);
+	assert(dt_find_by_name_len(root, "node0_1@", 8) == addr2);
+	dt_free(root);
+
 	return 0;
 }
 
diff --git a/include/device.h b/include/device.h
index 93fb90ff..f5e0fb79 100644
--- a/include/device.h
+++ b/include/device.h
@@ -184,6 +184,10 @@ struct dt_node *dt_find_by_path(struct dt_node *root, const char *path);
 /* Find a child node by name */
 struct dt_node *dt_find_by_name(struct dt_node *root, const char *name);
 
+/* Find a child node by name and len */
+struct dt_node *dt_find_by_name_len(struct dt_node *root,
+                                        const char *name, int len);
+
 /* Find a node by phandle */
 struct dt_node *dt_find_by_phandle(struct dt_node *root, u32 phandle);
 
-- 
2.27.0

