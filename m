Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B94B975EE7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 10:56:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nyYhMUWB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8Ysy4qqKz30XZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 18:56:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nyYhMUWB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8Ys212qSz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 18:55:18 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4R8Ys12lcPz4wy0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 18:55:17 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4R8Ys12hKrz4wbv; Mon, 24 Jul 2023 18:55:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nyYhMUWB;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4R8Ys1018Lz4wZw;
	Mon, 24 Jul 2023 18:55:16 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36O8YILD028173;
	Mon, 24 Jul 2023 08:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=7pxheQilt4UUS6vM/K8xXQzB/p4U8xc5x7di4eRdT1Q=;
 b=nyYhMUWB5804mKPSDP+qn8f9hyj4A2I2fD3SEkLNRJ11OlRCi0B/HgAIw3PIPpXS575O
 Npz901eAxcvM4qUeGnhzDJPxYz5/6JsmN76fwQHL4qhpnL/rG5gVS/YC4JOHRUTmLDq+
 qZCnUC9BASEwq9wNY7HDwOjtWJK6Ds6aGqfyDHltZBjxXHtLkDQKrmvoK7eT5YdNNvee
 71IrowjVhhEQkEeSYVztMOd8AEP3PUectT3Qm8wWg9Rwi4TlagyumX7BM2ba3ss0RRI8
 q4pgl5arj5VXscMlFtHq5WLUDBc/+Uia3XJimCDqz+tdU6Ahg9g/Vxn5ch8zGXtYOB+M Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1nk31b0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 08:55:13 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36O8YKpo028430;
	Mon, 24 Jul 2023 08:55:13 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1nk31ayv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 08:55:13 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36O7f4QF026227;
	Mon, 24 Jul 2023 08:55:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0serj3yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 08:55:12 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36O8t97S62390572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 08:55:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5336820040;
	Mon, 24 Jul 2023 08:55:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE95920043;
	Mon, 24 Jul 2023 08:55:07 +0000 (GMT)
Received: from [9.109.248.226] (unknown [9.109.248.226])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 08:55:07 +0000 (GMT)
Subject: [PATCH v7 1/2] powerpc/rtas: Rename rtas_error_rc to
 rtas_generic_errno
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Mon, 24 Jul 2023 14:25:06 +0530
Message-ID: <169018889869.2762525.12537634512378621566.stgit@jupiter>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LhWJmFKNelR2BXP7uws1dd1wf6ARPOPr
X-Proofpoint-GUID: yT18kbSbcdtQl3PMY5ak_gL_r_sbD9Wq
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_06,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxlogscore=869 clxscore=1011 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307240075
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_generic_errno() function will convert the generic rtas return codes
into errno. Also, #define descriptive names for rtas return codes and use
it instead of numeric values.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---

- Until v6 there was only one patch with subject "PCI hotplug: rpaphp:
  Error out on busy status from get-sensor-state". Starting from v7, adding
  this new patch to introduce rtas_generic_errno() to handle generic rtas
  error codes.
  https://lore.kernel.org/all/20220429162545.GA79541@bhelgaas/
---
 arch/powerpc/include/asm/rtas.h |   10 +++++++
 arch/powerpc/kernel/rtas.c      |   53 ++++++++++++++++++++-------------------
 2 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 3abe15ac79db1..5572a0a2f6e18 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -202,7 +202,9 @@ typedef struct {
 #define RTAS_USER_REGION_SIZE (64 * 1024)
 
 /* RTAS return status codes */
-#define RTAS_BUSY		-2    /* RTAS Busy */
+#define RTAS_HARDWARE_ERROR	(-1)  /* Hardware Error */
+#define RTAS_BUSY		(-2)  /* RTAS Busy */
+#define RTAS_INVALID_PARAMETER	(-3)  /* Invalid indicator/domain/sensor etc. */
 #define RTAS_EXTENDED_DELAY_MIN	9900
 #define RTAS_EXTENDED_DELAY_MAX	9905
 
@@ -212,6 +214,11 @@ typedef struct {
 #define RTAS_THREADS_ACTIVE     -9005 /* Multiple processor threads active */
 #define RTAS_OUTSTANDING_COPROC -9006 /* Outstanding coprocessor operations */
 
+/* statuses specific to get-sensor-state */
+#define RTAS_SLOT_UNISOLATED		(-9000)
+#define RTAS_SLOT_NOT_UNISOLATED	(-9001)
+#define RTAS_SLOT_NOT_USABLE		(-9002)
+
 /* RTAS event classes */
 #define RTAS_INTERNAL_ERROR		0x80000000 /* set bit 0 */
 #define RTAS_EPOW_WARNING		0x40000000 /* set bit 1 */
@@ -425,6 +432,7 @@ extern int rtas_set_indicator(int indicator, int index, int new_value);
 extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
 extern void rtas_progress(char *s, unsigned short hex);
 int rtas_ibm_suspend_me(int *fw_status);
+int rtas_generic_errno(int rtas_rc);
 
 struct rtc_time;
 extern time64_t rtas_get_boot_time(void);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c087eeee320ff..80b6099e8ce20 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1330,33 +1330,34 @@ bool __ref rtas_busy_delay(int status)
 }
 EXPORT_SYMBOL_GPL(rtas_busy_delay);
 
-static int rtas_error_rc(int rtas_rc)
+int rtas_generic_errno(int rtas_rc)
 {
 	int rc;
 
 	switch (rtas_rc) {
-		case -1: 		/* Hardware Error */
-			rc = -EIO;
-			break;
-		case -3:		/* Bad indicator/domain/etc */
-			rc = -EINVAL;
-			break;
-		case -9000:		/* Isolation error */
-			rc = -EFAULT;
-			break;
-		case -9001:		/* Outstanding TCE/PTE */
-			rc = -EEXIST;
-			break;
-		case -9002:		/* No usable slot */
-			rc = -ENODEV;
-			break;
-		default:
-			pr_err("%s: unexpected error %d\n", __func__, rtas_rc);
-			rc = -ERANGE;
-			break;
+	case RTAS_HARDWARE_ERROR:	/* Hardware Error */
+		rc = -EIO;
+		break;
+	case RTAS_INVALID_PARAMETER:	/* Bad indicator/domain/etc */
+		rc = -EINVAL;
+		break;
+	case RTAS_SLOT_UNISOLATED:	/* Isolation error */
+		rc = -EFAULT;
+		break;
+	case RTAS_SLOT_NOT_UNISOLATED:	/* Outstanding TCE/PTE */
+		rc = -EEXIST;
+		break;
+	case RTAS_SLOT_NOT_USABLE:	/* No usable slot */
+		rc = -ENODEV;
+		break;
+	default:
+		pr_err("%s: unexpected error %d\n", __func__, rtas_rc);
+		rc = -ERANGE;
+		break;
 	}
 	return rc;
 }
+EXPORT_SYMBOL(rtas_generic_errno);
 
 int rtas_get_power_level(int powerdomain, int *level)
 {
@@ -1370,7 +1371,7 @@ int rtas_get_power_level(int powerdomain, int *level)
 		udelay(1);
 
 	if (rc < 0)
-		return rtas_error_rc(rc);
+		return rtas_generic_errno(rc);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(rtas_get_power_level);
@@ -1388,7 +1389,7 @@ int rtas_set_power_level(int powerdomain, int level, int *setlevel)
 	} while (rtas_busy_delay(rc));
 
 	if (rc < 0)
-		return rtas_error_rc(rc);
+		return rtas_generic_errno(rc);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(rtas_set_power_level);
@@ -1406,7 +1407,7 @@ int rtas_get_sensor(int sensor, int index, int *state)
 	} while (rtas_busy_delay(rc));
 
 	if (rc < 0)
-		return rtas_error_rc(rc);
+		return rtas_generic_errno(rc);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(rtas_get_sensor);
@@ -1424,7 +1425,7 @@ int rtas_get_sensor_fast(int sensor, int index, int *state)
 				    rc <= RTAS_EXTENDED_DELAY_MAX));
 
 	if (rc < 0)
-		return rtas_error_rc(rc);
+		return rtas_generic_errno(rc);
 	return rc;
 }
 
@@ -1466,7 +1467,7 @@ int rtas_set_indicator(int indicator, int index, int new_value)
 	} while (rtas_busy_delay(rc));
 
 	if (rc < 0)
-		return rtas_error_rc(rc);
+		return rtas_generic_errno(rc);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(rtas_set_indicator);
@@ -1488,7 +1489,7 @@ int rtas_set_indicator_fast(int indicator, int index, int new_value)
 				    rc <= RTAS_EXTENDED_DELAY_MAX));
 
 	if (rc < 0)
-		return rtas_error_rc(rc);
+		return rtas_generic_errno(rc);
 
 	return rc;
 }


