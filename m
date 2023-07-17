Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2664755A10
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 05:26:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XwHRUGWg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R46vF5C63z3bc7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 13:26:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XwHRUGWg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R46s12qlLz3bYc;
	Mon, 17 Jul 2023 13:24:53 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H3L5df032705;
	Mon, 17 Jul 2023 03:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=ZTI5qCssGP5NKnXrxQsFWXt6Jj7luDv3dhbB7DGQCFY=;
 b=XwHRUGWgJ6Z8keB1ReYEihZMCc89cjjqR22IsPlb6P/YnHoS6/yQhjFrzu7pwcuFj21N
 RocPt4/g6bz/ASIBSFMh92EM5wFRtVYZcX9TdlAaBZ2buUYvLJTcvqWmWqx7hivU6d7M
 sfV0Pgg/MqUqVCi4VQ+lDqAt9LOalp9fyp9LmJG2NDHZ9exC2jNndORKG6ewcE8x6GYL
 b/CH+f2nRAy/YMJITLY12FDU3MRq/WP31s3Y2pomMNPoXOtEEmVfGD8O0MRTO28dXxU9
 Nb5m6A+HXqtCWM2pQBlc7MVhLp6NEbueg6br2CrdXEi2XH8sZD8YBVRiF7grSQlFBNB6 xg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rvwnq81de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 03:24:44 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36H1uUT8016648;
	Mon, 17 Jul 2023 03:24:43 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ruk350qqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 03:24:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36H3OdVQ45351240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jul 2023 03:24:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A1C720043;
	Mon, 17 Jul 2023 03:24:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6921520040;
	Mon, 17 Jul 2023 03:24:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.121])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jul 2023 03:24:37 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, arbab@linux.ibm.com,
        mpe@ellerman.id.au, maddy@linux.ibm.com
Subject: [PATCH V5 2/3] skiboot: Update IMC code to use dt_find_by_name_before_addr for checking dt nodes
Date: Mon, 17 Jul 2023 08:54:30 +0530
Message-Id: <20230717032431.33778-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
References: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z51mXxWsjX5p12t91fpaUJE4qfKwuFal
X-Proofpoint-GUID: Z51mXxWsjX5p12t91fpaUJE4qfKwuFal
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_02,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170027
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

The nest IMC (In Memory Collection) Performance Monitoring
Unit(PMU) node names are saved in nest_pmus[] array in the
"hw/imc.c" IMC code. Not all the IMC PMUs listed in the device
tree may be available. Nest IMC PMU names along with their
bit values is represented in imc availability vector.
The nest_pmus[] array is used to remove the unavailable nodes
by checking this vector.

To check node availability, code was using "dt_find_by_substr".
But since the node names have format like: "name@offset",
dt_find_by_name doesn't return the expected result. Fix this
by using dt_find_by_name_before_addr. Also, update the char array
to use correct node names.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
v4 -> v5:
- Addressed review comment from Reza and renamed
  dt_find_by_name_substr to dt_find_by_name_before_addr

v3 -> v4:
- Addressed review comment from Mahesh and added his Reviewed-by
  for patch 1.

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

 hw/imc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/imc.c b/hw/imc.c
index cbd68edc..a8198321 100644
--- a/hw/imc.c
+++ b/hw/imc.c
@@ -66,14 +66,14 @@ static char const *nest_pmus[] = {
 	"mba5",
 	"mba6",
 	"mba7",
-	"cen0",
-	"cen1",
-	"cen2",
-	"cen3",
-	"cen4",
-	"cen5",
-	"cen6",
-	"cen7",
+	"centaur0",
+	"centaur1",
+	"centaur2",
+	"centaur3",
+	"centaur4",
+	"centaur5",
+	"centaur6",
+	"centaur7",
 	"xlink0",
 	"xlink1",
 	"xlink2",
@@ -411,7 +411,7 @@ static void disable_unavailable_units(struct dt_node *dev)
 	for (i = 0; i < ARRAY_SIZE(nest_pmus); i++) {
 		if (!(PPC_BITMASK(i, i) & avl_vec)) {
 			/* Check if the device node exists */
-			target = dt_find_by_name(dev, nest_pmus[i]);
+			target = dt_find_by_name_before_addr(dev, nest_pmus[i]);
 			if (!target)
 				continue;
 			/* Remove the device node */
-- 
2.39.3

