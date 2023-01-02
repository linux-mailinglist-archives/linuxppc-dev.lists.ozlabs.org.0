Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FEE65ACF0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 04:16:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nlgxv542jz3bcN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 14:16:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GrAxshiW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GrAxshiW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nlgwt0LJKz3bTD;
	Mon,  2 Jan 2023 14:15:41 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 301KpqFd020981;
	Mon, 2 Jan 2023 03:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=USIB5SHNBptFooRrc9W/n8uafVw0YmkhWDnkt3kEMwI=;
 b=GrAxshiWWPA1ggU8NZT4nlhBQBWQzIPfZu0ppNJkadVAG5m2IosOIzYwJyU91sjAILpl
 FWKGAOlAZ8GmmtSttxkYnekOFok7m5ks22eqwbLWD9xVVaLAlB86v81lNoH+gsu4BvHe
 eGHFfGhDd7gbPnjposHoDSJPrHdfxMaG5BSTK808XNSdk82waM0zuzAibyhXGI6J0diH
 KmS66rMYwb8/dKoJAn1fOiN51Bo9hTyOPB5h0pMiIXIMlvfNV2H/4d7iKXa4O33IAili
 Elxx27LFNuSH0B4u+WVdhpzZgvUP47g63uIOpnr1TxBfkKKRmG8EgCCAN/Ft48a+jtul DA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mtxhh8sp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 03:15:35 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3020htD7020202;
	Mon, 2 Jan 2023 03:15:33 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq69whd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 03:15:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3023FTua36045182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jan 2023 03:15:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4080320043;
	Mon,  2 Jan 2023 03:15:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AC4220040;
	Mon,  2 Jan 2023 03:15:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.47.130])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Jan 2023 03:15:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, mpe@ellerman.id.au, maddy@linux.ibm.com
Subject: [PATCH 2/3] skiboot: Update IMC code to use dt_find_by_name_len for checking dt nodes
Date: Mon,  2 Jan 2023 08:45:23 +0530
Message-Id: <20230102031524.73249-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230102031524.73249-1-atrajeev@linux.vnet.ibm.com>
References: <20230102031524.73249-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ICZys5mFLcAccwdlDrhX54iE2ZYCL6Hz
X-Proofpoint-GUID: ICZys5mFLcAccwdlDrhX54iE2ZYCL6Hz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-01_11,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
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
Unit(PMU) node names are saved in nest_pmus[] array in the
"hw/imc.c" IMC code. Not all the IMC PMUs listed in the device
tree may be available. Nest IMC PMU names along with their
bit values is represented in imc availability vector.
The nest_pmus[] array is used to remove the unavailable nodes
by checking this vector.

To check node availability, code was using "dt_find_by_name".
But since the node names have format like: "name@offset",
dt_find_by_name doesn't return the expected result. Fix this
by using dt_find_by_name_len. Also, instead of using char array,
use a new "struct nest_pmus_struct" which saves the name as well
as length parameter for dt_find_by_name_len.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 hw/imc.c | 112 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 59 insertions(+), 53 deletions(-)

diff --git a/hw/imc.c b/hw/imc.c
index 97e0809f..779e9634 100644
--- a/hw/imc.c
+++ b/hw/imc.c
@@ -37,6 +37,12 @@
 static uint64_t TRACE_IMC_ADDR;
 static uint64_t CORE_IMC_EVENT_MASK_ADDR;
 static uint64_t trace_scom_val;
+
+struct nest_pmus_struct {
+	const char *name;
+	int len;
+};
+
 /*
  * Initialise these with the pdbar and htm scom port address array
  * at run time, based on the processor version.
@@ -49,58 +55,58 @@ static unsigned int *htm_scom_index;
  * imc_chip_avl_vector(in struct imc_chip_cb, look at include/imc.h).
  * nest_pmus[] is an array containing all the possible nest IMC PMU node names.
  */
-static char const *nest_pmus[] = {
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
+static struct nest_pmus_struct nest_pmus[] = {
+	{ .name = "powerbus0@", .len = 10 },
+	{ .name = "mcs0@", .len = 5},
+	{ .name = "mcs1@", .len = 5},
+	{ .name = "mcs2@", .len = 5},
+	{ .name = "mcs3@", .len = 5},
+	{ .name = "mcs4@", .len = 5},
+	{ .name = "mcs5@", .len = 5},
+	{ .name = "mcs6@", .len = 5},
+	{ .name = "mcs7@", .len = 5},
+	{ .name = "mba0@", .len = 5},
+	{ .name = "mba1@", .len = 5},
+	{ .name = "mba2@", .len = 5},
+	{ .name = "mba3@", .len = 5},
+	{ .name = "mba4@", .len = 5},
+	{ .name = "mba5@", .len = 5},
+	{ .name = "mba6@", .len = 5},
+	{ .name = "mba7@", .len = 5},
+	{ .name = "centaur0@", .len = 9},
+	{ .name = "centaur1@", .len = 9},
+	{ .name = "centaur2@", .len = 9},
+	{ .name = "centaur3@", .len = 9},
+	{ .name = "centaur4@", .len = 9},
+	{ .name = "centaur5@", .len = 9},
+	{ .name = "centaur6@", .len = 9},
+	{ .name = "centaur7@", .len = 9},
+	{ .name = "xlink0@", .len = 7},
+	{ .name = "xlink1@", .len = 7},
+	{ .name = "xlink2@", .len = 7},
+	{ .name = "mcd0@", .len = 5},
+	{ .name = "mcd1@", .len = 5},
+	{ .name = "phb0@", .len = 5},
+	{ .name = "phb1@", .len = 5},
+	{ .name = "phb2@", .len = 5},
+	{ .name = "phb3@", .len = 5},
+	{ .name = "phb4@", .len = 5},
+	{ .name = "phb5@", .len = 5},
+	{ .name = "nx@", .len = 3},
+	{ .name = "capp0@", .len = 6},
+	{ .name = "capp1@", .len = 6},
+	{ .name = "vas@", .len = 4},
+	{ .name = "int@", .len = 4},
+	{ .name = "alink0@", .len = 7},
+	{ .name = "alink1@", .len = 7},
+	{ .name = "alink2@", .len = 7},
+	{ .name = "alink3@", .len = 7},
+	{ .name = "nvlink0@", .len = 8},
+	{ .name = "nvlink1@", .len = 8},
+	{ .name = "nvlink2@", .len = 8},
+	{ .name = "nvlink3@", .len = 8},
+	{ .name = "nvlink4@", .len = 8},
+	{ .name = "nvlink5@", .len = 8},
 	/* reserved bits : 51 - 63 */
 };
 
@@ -412,7 +418,7 @@ static void disable_unavailable_units(struct dt_node *dev)
 	for (i = 0; i < ARRAY_SIZE(nest_pmus); i++) {
 		if (!(PPC_BITMASK(i, i) & avl_vec)) {
 			/* Check if the device node exists */
-			target = dt_find_by_name(dev, nest_pmus[i]);
+			target = dt_find_by_name_len(dev, nest_pmus[i].name, nest_pmus[i].len);
 			if (!target)
 				continue;
 			/* Remove the device node */
-- 
2.27.0

