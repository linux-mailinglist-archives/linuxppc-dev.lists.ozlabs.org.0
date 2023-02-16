Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759E698E56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 09:11:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHSM614BCz3f82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 19:11:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jc9kqj47;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jc9kqj47;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHSJy02cSz3bgq;
	Thu, 16 Feb 2023 19:09:21 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31G81XYr020417;
	Thu, 16 Feb 2023 08:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=Cu/p2EC9qcEfVlJfjqj+ouM4wOuuRReXl5mcUDwL/m4=;
 b=jc9kqj47PRAni3x+Wkjg7W0M1ksFfWxSCKa+BddYzCNrfnFcreVEMXDwxnmBBjdQrwc9
 5sDy6d6z3XeHIO6dhR20yfPHPBWOFPHR35pS3/aYsDxgV8AqsqBnNcJtarO8Az+Wi+rZ
 7Oe1lr4DvzRzHM97M/0i494wHqKNivzCFEbcJYw9lP02HhBf+MbyYnW/vr60i6BUZ0yT
 Ivd9ZthAVnpkXNgCRCDO3YlZGXFZicTueeFyrBrjDGw/FTiR7IgVBuL1WNW15pk+8W8C
 HzYF2O025EZWKLt0A2uk24m1Q2zqhlF6IrSlvdxPGCgYleBFcSJeasIQpv/CnsTCiGmd JQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsgkxr5e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 08:09:14 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31G62olk010856;
	Thu, 16 Feb 2023 08:09:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6xchg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 08:09:12 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31G899G250725244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 08:09:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 425A42004B;
	Thu, 16 Feb 2023 08:09:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9BE120043;
	Thu, 16 Feb 2023 08:09:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.95.24])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Feb 2023 08:09:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, mpe@ellerman.id.au,
        maddy@linux.ibm.com
Subject: [PATCH V3 2/3] skiboot: Update IMC code to use dt_find_by_name_substr for checking dt nodes
Date: Thu, 16 Feb 2023 13:38:58 +0530
Message-Id: <20230216080859.19161-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230216080859.19161-1-atrajeev@linux.vnet.ibm.com>
References: <20230216080859.19161-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qd94p0PDn9NEte8noPi3iAtDxBTiQj3L
X-Proofpoint-ORIG-GUID: Qd94p0PDn9NEte8noPi3iAtDxBTiQj3L
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_06,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160068
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
to use correct node names.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
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
index 97e0809f..72fbe92a 100644
--- a/hw/imc.c
+++ b/hw/imc.c
@@ -67,14 +67,14 @@ static char const *nest_pmus[] = {
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

