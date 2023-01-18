Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7067134A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 06:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxZX60k6Pz3fDW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 16:47:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=naljAFFm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=naljAFFm;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxZV04wKFz2yPY;
	Wed, 18 Jan 2023 16:45:12 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I5g7kh022696;
	Wed, 18 Jan 2023 05:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ha+KUmv4kzoRspnEOyMEiNh+Vq5271Y9trmRev8ERPA=;
 b=naljAFFm3J1xvvxDq/g3pU7BVEFFLIgzmzkO0yPwS0YFbX3RbUseRS+noIXSRrvRrCRe
 rGGmOFMReR4TIgOkFJgqpLRmRA9kE8vfQMv55vncqePrbkDTVqpwIzlDc/gS+Q4b830x
 4sDOoeVg/5q70kzXBwZG7ujGBhFGxX5nICjPVBjTomJO849IE8JVzDk8T4i4FnqVSS38
 lvtsaM9pxruydQ3WXw4Wh7cRSxLg7+Hh/4kiNifJbySuEwFvf1sqYgKiF3I4joIJpQJb
 cjxx5kReRPukQCy9gaD5ZzneQzodL8C4yX4T3lPoT12+rrLqmLs6hY3LwH5nfXteHJCc xw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6aup01bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 05:45:05 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HD6s0d002145;
	Wed, 18 Jan 2023 05:45:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3n3m16kg19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 05:45:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I5ixkf22675906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 05:44:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1557220043;
	Wed, 18 Jan 2023 05:44:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2672A20040;
	Wed, 18 Jan 2023 05:44:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.55.224])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Jan 2023 05:44:56 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, mpe@ellerman.id.au,
        maddy@linux.ibm.com
Subject: [PATCH V2 2/3] skiboot: Update IMC code to use dt_find_by_name_substr for checking dt nodes
Date: Wed, 18 Jan 2023 11:14:51 +0530
Message-Id: <20230118054452.27242-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230118054452.27242-1-atrajeev@linux.vnet.ibm.com>
References: <20230118054452.27242-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o9xACjxfPBgoMbw3pcu5AY4aRfKhtznQ
X-Proofpoint-ORIG-GUID: o9xACjxfPBgoMbw3pcu5AY4aRfKhtznQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180047
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
by using dt_find_by_name_substr. Also, update the char array
to use correct node names with suffix "@"

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
v1 -> v2:
- Addressed review comment from Dan to update
  the utility funtion to search and compare
  upto "@". Renamed it as dt_find_by_name_substr.
  Hence used existing nest_pmus char array to
  update node names with "@" suffix

 hw/imc.c | 104 +++++++++++++++++++++++++++----------------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/hw/imc.c b/hw/imc.c
index 97e0809f..805e6cc1 100644
--- a/hw/imc.c
+++ b/hw/imc.c
@@ -50,57 +50,57 @@ static unsigned int *htm_scom_index;
  * nest_pmus[] is an array containing all the possible nest IMC PMU node names.
  */
 static char const *nest_pmus[] = {
-	"powerbus0",
-	"mcs0",
-	"mcs1",
-	"mcs2",
-	"mcs3",
-	"mcs4",
-	"mcs5",
-	"mcs6",
-	"mcs7",
-	"mba0",
-	"mba1",
-	"mba2",
-	"mba3",
-	"mba4",
-	"mba5",
-	"mba6",
-	"mba7",
-	"cen0",
-	"cen1",
-	"cen2",
-	"cen3",
-	"cen4",
-	"cen5",
-	"cen6",
-	"cen7",
-	"xlink0",
-	"xlink1",
-	"xlink2",
-	"mcd0",
-	"mcd1",
-	"phb0",
-	"phb1",
-	"phb2",
-	"phb3",
-	"phb4",
-	"phb5",
-	"nx",
-	"capp0",
-	"capp1",
-	"vas",
-	"int",
-	"alink0",
-	"alink1",
-	"alink2",
-	"alink3",
-	"nvlink0",
-	"nvlink1",
-	"nvlink2",
-	"nvlink3",
-	"nvlink4",
-	"nvlink5",
+	"powerbus0@",
+	"mcs0@",
+	"mcs1@",
+	"mcs2@",
+	"mcs3@",
+	"mcs4@",
+	"mcs5@",
+	"mcs6@",
+	"mcs7@",
+	"mba0@",
+	"mba1@",
+	"mba2@",
+	"mba3@",
+	"mba4@",
+	"mba5@",
+	"mba6@",
+	"mba7@",
+	"centaur0@",
+	"centaur1@",
+	"centaur2@",
+	"centaur3@",
+	"centaur4@",
+	"centaur5@",
+	"centaur6@",
+	"centaur7@",
+	"xlink0@",
+	"xlink1@",
+	"xlink2@",
+	"mcd0@",
+	"mcd1@",
+	"phb0@",
+	"phb1@",
+	"phb2@",
+	"phb3@",
+	"phb4@",
+	"phb5@",
+	"nx@",
+	"capp0@",
+	"capp1@",
+	"vas@",
+	"int@",
+	"alink0@",
+	"alink1@",
+	"alink2@",
+	"alink3@",
+	"nvlink0@",
+	"nvlink1@",
+	"nvlink2@",
+	"nvlink3@",
+	"nvlink4@",
+	"nvlink5@",
 	/* reserved bits : 51 - 63 */
 };
 
@@ -412,7 +412,7 @@ static void disable_unavailable_units(struct dt_node *dev)
 	for (i = 0; i < ARRAY_SIZE(nest_pmus); i++) {
 		if (!(PPC_BITMASK(i, i) & avl_vec)) {
 			/* Check if the device node exists */
-			target = dt_find_by_name(dev, nest_pmus[i]);
+			target = dt_find_by_name_substr(dev, nest_pmus[i]);
 			if (!target)
 				continue;
 			/* Remove the device node */
-- 
2.27.0

