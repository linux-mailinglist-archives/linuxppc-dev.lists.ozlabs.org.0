Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B9365ACF2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 04:17:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nlgz70H10z3c95
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 14:17:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ds9ahPwx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ds9ahPwx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nlgwt0HNlz2xkm;
	Mon,  2 Jan 2023 14:15:41 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 301KaQxi020862;
	Mon, 2 Jan 2023 03:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d+EiR0sD2epn58l5IbMc1wwMtk7xXxgCRWLeEGIABtc=;
 b=ds9ahPwxMfjHHY6ulaer71L+UZN9/JO29kFeJlsxnm8SA1uG75r6nqKM1xzwzQX52OHz
 9Y0mgw2ObYUvV6qHLPkob0Z3YFwIy5RJcTyw6TmrTvCMzP+s8EKm9bypoRbINejng+lw
 jnXaCcC0q1GcVwV0tYyR/85vnb4qjHT06gE+bAfm6jyZiUX1O06/6yuAADvJkqTG0qEg
 1bXcPKkPkvRsMrpmvYynXZcFFUPAhnKr3yflQ+DUFuyoLLRs0XR0Y+T4/n1o3w9x8S0n
 ZIcEEHb17YgHZpYMixRZkDZbwCnFRgCOck1DqgiVfcLlp6NCO6ktQfy1ShySAhq77aCK 7A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mtxhh8spn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 03:15:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3020euYf001913;
	Mon, 2 Jan 2023 03:15:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq69w2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 03:15:34 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3023FVsr22741488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jan 2023 03:15:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37C0820043;
	Mon,  2 Jan 2023 03:15:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90DFA20040;
	Mon,  2 Jan 2023 03:15:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.47.130])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Jan 2023 03:15:29 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, mpe@ellerman.id.au, maddy@linux.ibm.com
Subject: [PATCH 3/3] skiboot: Update IMC PMU node names for power10
Date: Mon,  2 Jan 2023 08:45:24 +0530
Message-Id: <20230102031524.73249-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230102031524.73249-1-atrajeev@linux.vnet.ibm.com>
References: <20230102031524.73249-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gNZ7Nm46Z4dDzPMGm2zRYPGJ9pPEq3Nf
X-Proofpoint-GUID: gNZ7Nm46Z4dDzPMGm2zRYPGJ9pPEq3Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-01_11,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 adultscore=0 mlxlogscore=974 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301020027
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
is available. Example, 101b means X-Link is configured. Patch implements
all these change to handle nest_pmus_p10.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 hw/imc.c | 195 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 185 insertions(+), 10 deletions(-)

diff --git a/hw/imc.c b/hw/imc.c
index 779e9634..d1adc5ef 100644
--- a/hw/imc.c
+++ b/hw/imc.c
@@ -55,7 +55,7 @@ static unsigned int *htm_scom_index;
  * imc_chip_avl_vector(in struct imc_chip_cb, look at include/imc.h).
  * nest_pmus[] is an array containing all the possible nest IMC PMU node names.
  */
-static struct nest_pmus_struct nest_pmus[] = {
+static struct nest_pmus_struct nest_pmus_p9[] = {
 	{ .name = "powerbus0@", .len = 10 },
 	{ .name = "mcs0@", .len = 5},
 	{ .name = "mcs1@", .len = 5},
@@ -110,6 +110,67 @@ static struct nest_pmus_struct nest_pmus[] = {
 	/* reserved bits : 51 - 63 */
 };
 
+static struct nest_pmus_struct nest_pmus_p10[] = {
+	{ .name = "pb@", .len = 3 },
+	{ .name = "mcs0@", .len = 5},
+	{ .name = "mcs1@", .len = 5},
+	{ .name = "mcs2@", .len = 5},
+	{ .name = "mcs3@", .len = 5},
+	{ .name = "mcs4@", .len = 5},
+	{ .name = "mcs5@", .len = 5},
+	{ .name = "mcs6@", .len = 5},
+	{ .name = "mcs7@", .len = 5},
+	{ .name = "pec0@", .len = 5},
+	{ .name = "pec1@", .len = 5},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "NA", .len = 0},
+	{ .name = "phb0@", .len = 5},
+	{ .name = "phb1@", .len = 5},
+	{ .name = "phb2@", .len = 5},
+	{ .name = "phb3@", .len = 5},
+	{ .name = "phb4@", .len = 5},
+	{ .name = "phb5@", .len = 5},
+	{ .name = "ocmb0@", .len = 6},
+	{ .name = "ocmb1@", .len = 6},
+	{ .name = "ocmb2@", .len = 6},
+	{ .name = "ocmb3@", .len = 6},
+	{ .name = "ocmb4@", .len = 6},
+	{ .name = "ocmb5@", .len = 6},
+	{ .name = "ocmb6@", .len = 6},
+	{ .name = "ocmb7@", .len = 6},
+	{ .name = "ocmb8@", .len = 6},
+	{ .name = "ocmb9@", .len = 6},
+	{ .name = "ocmb10@", .len = 6},
+	{ .name = "ocmb11@", .len = 6},
+	{ .name = "ocmb12@", .len = 6},
+	{ .name = "ocmb13@", .len = 6},
+	{ .name = "ocmb14@", .len = 6},
+	{ .name = "ocmb15@", .len = 6},
+	{ .name = "nx@", .len = 3},
+};
+
 /*
  * Due to Nest HW/OCC restriction, microcode will not support individual unit
  * events for these nest units mcs0, mcs1 ... mcs7 in the accumulation mode.
@@ -377,7 +438,7 @@ static void disable_unavailable_units(struct dt_node *dev)
 	uint64_t avl_vec;
 	struct imc_chip_cb *cb;
 	struct dt_node *target;
-	int i;
+	int i, j;
 	bool disable_all_nests = false;
 	struct proc_chip *chip;
 
@@ -415,14 +476,128 @@ static void disable_unavailable_units(struct dt_node *dev)
 			avl_vec = (0xffULL) << 56;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(nest_pmus); i++) {
-		if (!(PPC_BITMASK(i, i) & avl_vec)) {
-			/* Check if the device node exists */
-			target = dt_find_by_name_len(dev, nest_pmus[i].name, nest_pmus[i].len);
-			if (!target)
-				continue;
-			/* Remove the device node */
-			dt_free(target);
+	if (proc_gen == proc_gen_p9) {
+		for (i = 0; i < ARRAY_SIZE(nest_pmus_p9); i++) {
+			if (!(PPC_BITMASK(i, i) & avl_vec)) {
+				/* Check if the device node exists */
+				target = dt_find_by_name_len(dev, nest_pmus_p9[i].name, nest_pmus_p9[i].len);
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
+				target = dt_find_by_name_len(dev, nest_pmus_p10[i].name, nest_pmus_p10[i].len);
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
+					snprintf(phb, sizeof(phb), "phb%d_%d@", (i-35), j);
+					target = dt_find_by_name_len(dev, phb, 7);
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
+				target = dt_find_by_name_len(dev, nest_pmus_p10[i].name, nest_pmus_p10[i].len);
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
+				snprintf(al, sizeof(al), "alink%1d@",(7-i));
+				target = dt_find_by_name_len(dev, al, 7);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl, sizeof(otl),"otl%1d_0@",(7-i));
+				target = dt_find_by_name_len(dev, otl, 7);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_1@",(7-i));
+				target = dt_find_by_name_len(dev, otl, 7);
+				if (target)
+					dt_free(target);
+
+				break;
+			case 0x6: //alink configured and functional
+
+				snprintf(xl,sizeof(xl),"xlink%1d@",(7-i));
+				target = dt_find_by_name_len(dev, xl, 7);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_0@",(7-i));
+				target = dt_find_by_name_len(dev, otl, 7);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_1@",(7-i));
+				target = dt_find_by_name_len(dev, otl, 7);
+				if (target)
+					dt_free(target);
+				break;
+
+			case 0x7: //CAPI configured and functional
+				snprintf(al,sizeof(al),"alink%1d@",(7-i));
+				target = dt_find_by_name_len(dev, al, 7);
+				if (target)
+					dt_free(target);
+
+				snprintf(xl,sizeof(xl),"xlink%1d@",(7-i));
+				target = dt_find_by_name_len(dev, xl, 7);
+				if (target)
+					dt_free(target);
+				break;
+			default:
+				snprintf(xl,sizeof(xl),"xlink%1d@",(7-i));
+				target = dt_find_by_name_len(dev, xl, 7);
+				if (target)
+					dt_free(target);
+
+				snprintf(al,sizeof(al),"alink%1d@",(7-i));
+				target = dt_find_by_name_len(dev, al, 7);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_0@",(7-i));
+				target = dt_find_by_name_len(dev, otl, 7);
+				if (target)
+					dt_free(target);
+
+				snprintf(otl,sizeof(otl),"otl%1d_1@",(7-i));
+				target = dt_find_by_name_len(dev, otl, 7);
+				if (target)
+					dt_free(target);
+				break;
+			}
 		}
 	}
 
-- 
2.27.0

