Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAC58A9179
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 05:13:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FIbxscmP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKjXV0fJzz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 13:13:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FIbxscmP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKjWh024yz3brZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 13:12:47 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43I2t8Ae027178;
	Thu, 18 Apr 2024 03:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=zHHAVreIF78vL18/Zw4ZqyCZKOpJi+bpCDlh2/uX4Ow=;
 b=FIbxscmPP1grGa/Ki4e6SVzdKkUv4gHH/plBpXVsqxW/xf0X6YHdl+tvnPFN9wLDmv+d
 OktxQ+YYulU+6pXLnv+2zBkYULVklss+mz4t6LwGS2wRp55wGr/9BTzRnzMWAguueNMe
 sRbg/TW4TMDfzbsfNg4n/HIgKfhB74IgMysJT6eX8MqvghmEapZell+u1KU1sBilee60
 mIQAV5fVCGnQdL+JMb/YTcBULgTm8PvJh9x9ujwakGh9ruxMyvi4zxIfEm72XiJm1PVt
 EJ5q0kKKEBszsmyxIs9/2MN4pxbAxB3lhc3mlFInnTw2UNENKMdKpJZJUITZE8vPuLWB 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xju5cr0yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 03:12:41 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43I3CeCB026627;
	Thu, 18 Apr 2024 03:12:40 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xju5cr0yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 03:12:40 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43I15rRi016016;
	Thu, 18 Apr 2024 03:12:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5vmg743-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 03:12:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43I3CYFb36831604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Apr 2024 03:12:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3604320040;
	Thu, 18 Apr 2024 03:12:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7551B20049;
	Thu, 18 Apr 2024 03:12:32 +0000 (GMT)
Received: from sunshine.ibmuc.com (unknown [9.61.83.211])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Apr 2024 03:12:32 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4] powerpc/pseries: make max polling consistent for longer H_CALLs
Date: Wed, 17 Apr 2024 23:12:30 -0400
Message-ID: <20240418031230.170954-1-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3hldoZ9GmQ5AFyatyant2j5emwqfmlUi
X-Proofpoint-GUID: YoaMAAtZ4VLGWZdH_g9k7Qo5laIUVSHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_02,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404180021
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Greg Joyce <gjoyce@linux.vnet.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, plpks_confirm_object_flushed() function polls for 5msec in
total instead of 5sec.

Keep max polling time consistent for all the H_CALLs, which take longer
than expected, to be 5sec. Also, make use of fsleep() everywhere to
insert delay.

Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
---
v4:
 * As per Andrew's feedback, squashed Patch 2 with Patch 1.
Now it is single patch.

v3:
 * Addition to Patch 1 timeout patch based on Andrew's feedback.

v2:
* Updated based on feedback from Michael Ellerman
        Replaced usleep_range with fsleep.
        Since there is no more need to specify range, sleep time is
reverted back to 10 msec.

 arch/powerpc/include/asm/plpks.h       |  5 ++---
 arch/powerpc/platforms/pseries/plpks.c | 10 +++++-----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 23b77027c916..7a84069759b0 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -44,9 +44,8 @@
 #define PLPKS_MAX_DATA_SIZE		4000
 
 // Timeouts for PLPKS operations
-#define PLPKS_MAX_TIMEOUT		5000 // msec
-#define PLPKS_FLUSH_SLEEP		10 // msec
-#define PLPKS_FLUSH_SLEEP_RANGE		400
+#define PLPKS_MAX_TIMEOUT		(5 * USEC_PER_SEC)
+#define PLPKS_FLUSH_SLEEP		10000 // usec
 
 struct plpks_var {
 	char *component;
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index febe18f251d0..4a595493d28a 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -415,8 +415,7 @@ static int plpks_confirm_object_flushed(struct label *label,
 			break;
 		}
 
-		usleep_range(PLPKS_FLUSH_SLEEP,
-			     PLPKS_FLUSH_SLEEP + PLPKS_FLUSH_SLEEP_RANGE);
+		fsleep(PLPKS_FLUSH_SLEEP);
 		timeout = timeout + PLPKS_FLUSH_SLEEP;
 	} while (timeout < PLPKS_MAX_TIMEOUT);
 
@@ -464,9 +463,10 @@ int plpks_signed_update_var(struct plpks_var *var, u64 flags)
 
 		continuetoken = retbuf[0];
 		if (pseries_status_to_err(rc) == -EBUSY) {
-			int delay_ms = get_longbusy_msecs(rc);
-			mdelay(delay_ms);
-			timeout += delay_ms;
+			int delay_us = get_longbusy_msecs(rc) * 1000;
+
+			fsleep(delay_us);
+			timeout += delay_us;
 		}
 		rc = pseries_status_to_err(rc);
 	} while (rc == -EBUSY && timeout < PLPKS_MAX_TIMEOUT);
-- 
2.31.1

