Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1446AB51D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 04:42:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVPXq2fj8z3cKj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 14:42:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U4vzdiQg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U4vzdiQg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVPTJ6x9Cz3c8F;
	Mon,  6 Mar 2023 14:39:32 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3261wWx4011817;
	Mon, 6 Mar 2023 03:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=1NF3jUIvNbuKy0o88eKY31IJk46l/dAE7De4vVg4/BA=;
 b=U4vzdiQgFPuLMOgANII541scySXtd0LAnnX+09/pwhxQnll8+130U+g7xe8S505u778d
 PFMnRNwJbMyWQ34uUCAq7fsFpO1LN6OdO5Kp0iEtkKuYQfuX3WkNn7CWYGRq6kqdikQQ
 fRUPC6FbYcA5+lyRMkU24WOmrZ4QbUXc1g8uj1/GNqdsj9bDK6Q5OxdmioIwpP+GOc4z
 PqtZkTW26PtDGFrhtXD4+1im6I5OHx6p/QQ+u1gd2peCLDzef8yx+5cfZkNhgVMDCVAd
 Xqn0CozqnmZ3s19wPTpRs28BdAJ9uZHlcEu1253dNQP9QwSB+FXaBTphAbFlWPKWB0Q4 yQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4uae4bmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 03:39:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 325KMKZN007531;
	Mon, 6 Mar 2023 03:39:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p4188a4k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 03:39:23 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3263dJiP51708222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Mar 2023 03:39:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9767220043;
	Mon,  6 Mar 2023 03:39:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17CDF20040;
	Mon,  6 Mar 2023 03:39:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.99.34])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Mar 2023 03:39:17 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, mpe@ellerman.id.au,
        maddy@linux.ibm.com
Subject: [PATCH V4 3/3] skiboot: Update IMC PMU node names for power10
Date: Mon,  6 Mar 2023 09:09:13 +0530
Message-Id: <20230306033913.80524-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230306033913.80524-1-atrajeev@linux.vnet.ibm.com>
References: <20230306033913.80524-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EMd5vORms02YBTYZpNQp77jvjcW9auOl
X-Proofpoint-ORIG-GUID: EMd5vORms02YBTYZpNQp77jvjcW9auOl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-05_12,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060028
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

 hw/imc.c | 195 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 185 insertions(+), 10 deletions(-)

diff --git a/hw/imc.c b/hw/imc.c
index 55f53cce..3e14b508 100644
--- a/hw/imc.c
+++ b/hw/imc.c
@@ -48,7 +48,7 @@ static unsigned int *htm_scom_index;
  * imc_chip_avl_vector(in struct imc_chip_cb, look at include/imc.h).
  * nest_pmus[] is an array containing all the possible nest IMC PMU node names.
  */
-static char const *nest_pmus[] = {
+static char const *nest_pmus_p9[] = {
 	"powerbus0",
 	"mcs0",
 	"mcs1",
@@ -103,6 +103,67 @@ static char const *nest_pmus[] = {
 	/* reserved bits : 51 - 63 */
 };
 
+static char const *nest_pmus_p10[] = {
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
 
@@ -408,14 +469,128 @@ static void disable_unavailable_units(struct dt_node *dev)
 			avl_vec = (0xffULL) << 56;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(nest_pmus); i++) {
-		if (!(PPC_BITMASK(i, i) & avl_vec)) {
-			/* Check if the device node exists */
-			target = dt_find_by_name_substr(dev, nest_pmus[i]);
-			if (!target)
-				continue;
-			/* Remove the device node */
-			dt_free(target);
+	if (proc_gen == proc_gen_p9) {
+		for (i = 0; i < ARRAY_SIZE(nest_pmus_p9); i++) {
+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
+				/* Check if the device node exists */
+				target = dt_find_by_name_substr(dev, nest_pmus_p9[i]);
+				if (!target)
+					continue;
+				/* Remove the device node */
+				dt_free(target);
+			}
+		}
+	} else if (proc_gen == proc_gen_p10) {
+		int val;
+		char al[8], xl[8], otl[8], phb[8];
+		for (i = 0; i < 11; i++) {
+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
+				/* Check if the device node exists */
+				target = dt_find_by_name_substr(dev, nest_pmus_p10[i]);
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
+					snprintf(phb, sizeof(phb), "phb%d_%d", (i-35), j);
+					target = dt_find_by_name_substr(dev, phb);
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
+				target = dt_find_by_name_substr(dev, nest_pmus_p10[i]);
+				if (!target)
+					continue;
+				/* Remove the device node */
+				dt_free(target);
+			}
+		}
+
+		for (i=0; i<8; i++) {
+			val = ((avl_vec & (0x7ULL << (29 + (3 * i)))) >> (29 + (3 * i)));
+			switch (val) {
+			case 0x5: //xlink configured and functional
+
+				snprintf(al, sizeof(al), "alink%1d",(7-i));
+				target = dt_find_by_name_substr(dev, al);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl, sizeof(otl),"otl%1d_0",(7-i));
+				target = dt_find_by_name_substr(dev, otl);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_1",(7-i));
+				target = dt_find_by_name_substr(dev, otl);
+				if (target)
+					dt_free(target);
+
+				break;
+			case 0x6: //alink configured and functional
+
+				snprintf(xl,sizeof(xl),"xlink%1d",(7-i));
+				target = dt_find_by_name_substr(dev, xl);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_0",(7-i));
+				target = dt_find_by_name_substr(dev, otl);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_1",(7-i));
+				target = dt_find_by_name_substr(dev, otl);
+				if (target)
+					dt_free(target);
+				break;
+
+			case 0x7: //CAPI configured and functional
+				snprintf(al,sizeof(al),"alink%1d",(7-i));
+				target = dt_find_by_name_substr(dev, al);
+				if (target)
+					dt_free(target);
+
+				snprintf(xl,sizeof(xl),"xlink%1d",(7-i));
+				target = dt_find_by_name_substr(dev, xl);
+				if (target)
+					dt_free(target);
+				break;
+			default:
+				snprintf(xl,sizeof(xl),"xlink%1d",(7-i));
+				target = dt_find_by_name_substr(dev, xl);
+				if (target)
+					dt_free(target);
+
+				snprintf(al,sizeof(al),"alink%1d",(7-i));
+				target = dt_find_by_name_substr(dev, al);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_0",(7-i));
+				target = dt_find_by_name_substr(dev, otl);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_1",(7-i));
+				target = dt_find_by_name_substr(dev, otl);
+				if (target)
+					dt_free(target);
+				break;
+			}
 		}
 	}
 
-- 
2.31.1

