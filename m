Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8C7A0B2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 19:02:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p732H/4x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmkCV0K94z3dL5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 03:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p732H/4x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmk9Y367Xz3c5P;
	Fri, 15 Sep 2023 03:01:05 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EGnL4H011956;
	Thu, 14 Sep 2023 17:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=DvhystFN0P5RkXgeLydQ03WEeatxgnZvkHnCdnt19Uw=;
 b=p732H/4x9ntDc3Tnds6ZTwPDBx7vkt86HITr+nGrPevaOK37TWsg5jBA5Rq0Vu2BrvJa
 qqpdmE4EnSIBpSYOF9pnxpnGQ4xVuJ85utGLXxNPfYaFDjHSVEnNpj8NzwnPSYzOh4VO
 iPzsodfQTGGDk67W2/X+ILmnoiRjdyvl3oJuqZ9XGJJbnQTaSAZ9ZiJ7BJ+QqqOmDZa8
 udtJZysNwmjHUgbilkQBIELv7awuYcJBkizuz8P7jbXE0TknOpFl2BGywGb5ZAgyZVNu
 TTC4y9zvfT5UmGjRuWqebVVb1GL+OADGeStbY7HpcQcJqRxMfyu1BvX1wS6+XTLLauF4 mA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t461808r5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:00:59 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38EEfC7Z011959;
	Thu, 14 Sep 2023 16:32:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t15r2bsng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 16:32:20 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38EGWHns44433860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 16:32:17 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFAAC20040;
	Thu, 14 Sep 2023 16:32:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7B4520043;
	Thu, 14 Sep 2023 16:32:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.35.47])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Sep 2023 16:32:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, dan@danny.cz, arbab@linux.ibm.com,
        mpe@ellerman.id.au, maddy@linux.ibm.com
Subject: [PATCH 3/3] skiboot: Update IMC PMU node names for power10
Date: Thu, 14 Sep 2023 22:02:06 +0530
Message-Id: <20230914163206.97811-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230914163206.97811-1-atrajeev@linux.vnet.ibm.com>
References: <20230914163206.97811-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yIfcgYRj18Ha7vDvcRabLfh0dlp9WLM7
X-Proofpoint-GUID: yIfcgYRj18Ha7vDvcRabLfh0dlp9WLM7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140143
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
v5 -> v6:
- Addressed review comment from Reza by using PPC_BIT
  instead of PPC_BITMASK

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

 hw/imc.c | 196 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 186 insertions(+), 10 deletions(-)

diff --git a/hw/imc.c b/hw/imc.c
index 73f25dae8..9f59348ad 100644
--- a/hw/imc.c
+++ b/hw/imc.c
@@ -49,7 +49,7 @@ static unsigned int *htm_scom_index;
  * imc_chip_avl_vector(in struct imc_chip_cb, look at include/imc.h).
  * nest_pmus[] is an array containing all the possible nest IMC PMU node names.
  */
-static char const *nest_pmus[] = {
+static const char *nest_pmus_p9[] = {
 	"powerbus0",
 	"mcs0",
 	"mcs1",
@@ -104,6 +104,67 @@ static char const *nest_pmus[] = {
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
@@ -371,7 +432,7 @@ static void disable_unavailable_units(struct dt_node *dev)
 	uint64_t avl_vec;
 	struct imc_chip_cb *cb;
 	struct dt_node *target;
-	int i;
+	int i, j;
 	bool disable_all_nests = false;
 	struct proc_chip *chip;
 
@@ -409,14 +470,129 @@ static void disable_unavailable_units(struct dt_node *dev)
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
+			if (!(PPC_BIT(i) & avl_vec)) {
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
+			if (!(PPC_BIT(i) & avl_vec)) {
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
+			if (!(PPC_BIT(i) & avl_vec)) {
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
+			if (!(PPC_BIT(i) & avl_vec)) {
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
2.31.1

