Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE390755A15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 05:27:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k3pDLdIY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R46wW5Fwsz3c09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 13:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k3pDLdIY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R46s21WT6z30Q4;
	Mon, 17 Jul 2023 13:24:53 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H3GU58023671;
	Mon, 17 Jul 2023 03:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=AiZA/V9KzBkzXvLSGpeaG/UJsC6+892xbk6wt+z7GcY=;
 b=k3pDLdIYTDL9q6RQcY9SVp/4Ht7RpJzKI9DTl5ydXIdV7b6hl/dU4qAHOzYNsyFkLY7f
 RzZ97UV+nkJ1uc5RSO2RgjMdwNZNVV8cGkkoJfWdVSX49g6WyThcy+BnvDUEYy05g843
 kwI+Tcx+fGmWth3jGg2RFJfjlml7JtlJ9aL36hCjiuB/F7bGZGvGyl1y3aaqUvw1LMtx
 +8eHA21QSX0kKoa27WFVPtghI9KmxJ/qnUOAK0k5S99TOaUoFOvUZs+u1I0eHPgdWn2+
 41gx1n3hLY3Csl6pT+rcc1pkfAkAxG9USTRbf/fKMIE80cWKV82jv7LCVgKg6NZpXIUJ gQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rvwke0302-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 03:24:48 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36GH6Q0S005272;
	Mon, 17 Jul 2023 03:24:47 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv65x9du8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 03:24:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36H3OhWa46072466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jul 2023 03:24:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9455320043;
	Mon, 17 Jul 2023 03:24:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAC2B20040;
	Mon, 17 Jul 2023 03:24:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.121])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jul 2023 03:24:39 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, arbab@linux.ibm.com,
        mpe@ellerman.id.au, maddy@linux.ibm.com
Subject: [PATCH V5 3/3] skiboot: Update IMC PMU node names for power10
Date: Mon, 17 Jul 2023 08:54:31 +0530
Message-Id: <20230717032431.33778-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
References: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9zauiUhlKOX2Jb8moyTA4aiApF3B4llg
X-Proofpoint-ORIG-GUID: 9zauiUhlKOX2Jb8moyTA4aiApF3B4llg
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_02,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Unit(PMU) node names are saved as "struct nest_pmus_struct"
in the "hw/imc.c" IMC code. Not all the IMC PMUs listed in
the device tree may be available. Nest IMC PMU names along with
their bit values is represented in imc availability vector.
This struct is used to remove the unavailable nodes by checking
this vector.

For power10, the imc_chip_avl_vector ie, imc availability vector
( which is a part of the IMC control block structure ), has
change in mapping of units and bit positions. Hence rename the
existing nest_pmus array to nest_pmus_p9 and add entry for power10
as nest_pmus_p10.

Also the avl_vector has another change in bit positions 11:34. These
bit positions tells the availability of Xlink/Alink/CAPI. There
are total 8 links and three bit field combination says which link
is available. Patch implements all these change to handle
nest_pmus_p10.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
v4 -> v5:
- Addressed review comment from Reza and renamed
  dt_find_by_name_substr to dt_find_by_name_before_addr.
  Instead of using multiple variables for link name, reuse
  one variable.

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

 hw/imc.c | 196 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 186 insertions(+), 10 deletions(-)

diff --git a/hw/imc.c b/hw/imc.c
index a8198321..fd58058d 100644
--- a/hw/imc.c
+++ b/hw/imc.c
@@ -48,7 +48,7 @@ static unsigned int *htm_scom_index;
  * imc_chip_avl_vector(in struct imc_chip_cb, look at include/imc.h).
  * nest_pmus[] is an array containing all the possible nest IMC PMU node names.
  */
-static char const *nest_pmus[] = {
+static const char *nest_pmus_p9[] = {
 	"powerbus0",
 	"mcs0",
 	"mcs1",
@@ -103,6 +103,67 @@ static char const *nest_pmus[] = {
 	/* reserved bits : 51 - 63 */
 };
 
+static const char *nest_pmus_p10[] = {
+	"pb",
+	"mcs0",
+	"mcs1",
+	"mcs2",
+	"mcs3",
+	"mcs4",
+	"mcs5",
+	"mcs6",
+	"mcs7",
+	"pec0",
+	"pec1",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"NA",
+	"phb0",
+	"phb1",
+	"phb2",
+	"phb3",
+	"phb4",
+	"phb5",
+	"ocmb0",
+	"ocmb1",
+	"ocmb2",
+	"ocmb3",
+	"ocmb4",
+	"ocmb5",
+	"ocmb6",
+	"ocmb7",
+	"ocmb8",
+	"ocmb9",
+	"ocmb10",
+	"ocmb11",
+	"ocmb12",
+	"ocmb13",
+	"ocmb14",
+	"ocmb15",
+	"nx",
+};
+
 /*
  * Due to Nest HW/OCC restriction, microcode will not support individual unit
  * events for these nest units mcs0, mcs1 ... mcs7 in the accumulation mode.
@@ -370,7 +431,7 @@ static void disable_unavailable_units(struct dt_node *dev)
 	uint64_t avl_vec;
 	struct imc_chip_cb *cb;
 	struct dt_node *target;
-	int i;
+	int i, j;
 	bool disable_all_nests = false;
 	struct proc_chip *chip;
 
@@ -408,14 +469,129 @@ static void disable_unavailable_units(struct dt_node *dev)
 			avl_vec = (0xffULL) << 56;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(nest_pmus); i++) {
-		if (!(PPC_BITMASK(i, i) & avl_vec)) {
-			/* Check if the device node exists */
-			target = dt_find_by_name_before_addr(dev, nest_pmus[i]);
-			if (!target)
-				continue;
-			/* Remove the device node */
-			dt_free(target);
+	if (proc_gen == proc_gen_p9) {
+		for (i = 0; i < ARRAY_SIZE(nest_pmus_p9); i++) {
+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
+				/* Check if the device node exists */
+				target = dt_find_by_name_before_addr(dev, nest_pmus_p9[i]);
+				if (!target)
+					continue;
+				/* Remove the device node */
+				dt_free(target);
+			}
+		}
+	} else if (proc_gen == proc_gen_p10) {
+		int val;
+		char name[8];
+
+		for (i = 0; i < 11; i++) {
+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
+				/* Check if the device node exists */
+				target = dt_find_by_name_before_addr(dev, nest_pmus_p10[i]);
+				if (!target)
+					continue;
+				/* Remove the device node */
+				dt_free(target);
+			}
+		}
+
+		for (i = 35; i < 41; i++) {
+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
+				/* Check if the device node exists for phb */
+				for (j = 0; j < 3; j++) {
+					snprintf(name, sizeof(name), "phb%d_%d", (i-35), j);
+					target = dt_find_by_name_before_addr(dev, name);
+					if (!target)
+						continue;
+					/* Remove the device node */
+					dt_free(target);
+				}
+			}
+		}
+
+		for (i = 41; i < 58; i++) {
+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
+				/* Check if the device node exists */
+				target = dt_find_by_name_before_addr(dev, nest_pmus_p10[i]);
+				if (!target)
+					continue;
+				/* Remove the device node */
+				dt_free(target);
+			}
+		}
+
+		for (i = 0; i < 8; i++) {
+			val = ((avl_vec & (0x7ULL << (29 + (3 * i)))) >> (29 + (3 * i)));
+			switch (val) {
+			case 0x5: //xlink configured and functional
+
+				snprintf(name, sizeof(name), "alink%1d", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+
+				snprintf(name, sizeof(name), "otl%1d_0", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+
+				snprintf(name, sizeof(name), "otl%1d_1", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+
+				break;
+			case 0x6: //alink configured and functional
+
+				snprintf(name, sizeof(name), "xlink%1d", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+
+				snprintf(name, sizeof(name), "otl%1d_0", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+
+				snprintf(name, sizeof(name), "otl%1d_1", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+				break;
+
+			case 0x7: //CAPI configured and functional
+				snprintf(name, sizeof(name), "alink%1d", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+
+				snprintf(name, sizeof(name), "xlink%1d", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+				break;
+			default:
+				snprintf(name, sizeof(name), "xlink%1d", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+
+				snprintf(name, sizeof(name), "alink%1d", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+
+				snprintf(name, sizeof(name), "otl%1d_0", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+
+				snprintf(name, sizeof(name), "otl%1d_1", (7-i));
+				target = dt_find_by_name_before_addr(dev, name);
+				if (target)
+					dt_free(target);
+				break;
+			}
 		}
 	}
 
-- 
2.39.3

