Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E29E891168
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 03:11:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JS8PamT5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5P5Z3k3dz3vdB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 13:10:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JS8PamT5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5P4q742Nz3d2W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 13:10:19 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42T23Jgc003604;
	Fri, 29 Mar 2024 02:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hlPoUAUpChzDupIH+C1v/GdIUaF7g6F8qQAiiYuKrns=;
 b=JS8PamT5MUl8r48I5fYujzJJlmjWuPcCV+mO8lPd5PFLCudkXUUdgfCAQUEHr60NQvUB
 a+lgDSnfm7q9fa6v3ar77dqUDRo338JMwyn+m1deaOdENvoDHb76vbG5mYTTdFRQgUZY
 38f+IFmyXdAO2+r00FBD/JKZSB7RnDeEodGXL2VdPq2Ny5iOTHvJCa4OI4IRZUgX1MyN
 UkPI0ZzWPPMnqa0aFqDsARYKNijR2UMcX37pAShsP9FzBIqQLNnD55ILlwq2e/XB98Rp
 PGp/X6MvMB0cyS+LAqOIbfk5JbNI2ZNRju2c73DU59qJQqjJ5RWQwBJrSKUSdaiobkUT DA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x5mgs00bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 02:10:12 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42T2ABrW013683;
	Fri, 29 Mar 2024 02:10:11 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x5mgs00bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 02:10:11 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42T21LGD016605;
	Fri, 29 Mar 2024 02:10:10 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x29duhmr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 02:10:10 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42T2A58826870480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Mar 2024 02:10:07 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BB9320040;
	Fri, 29 Mar 2024 02:10:05 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0E2820043;
	Fri, 29 Mar 2024 02:10:03 +0000 (GMT)
Received: from sunshine.hsd1.in.comcast.net (unknown [9.61.39.125])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Mar 2024 02:10:03 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] powerpc/pseries: fix max polling time in plpks_confirm_object_flushed() function
Date: Thu, 28 Mar 2024 22:09:53 -0400
Message-ID: <20240329020954.537236-1-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: m1EDiKm5yLPJrE94m4Y6fe1T4KufS9YR
X-Proofpoint-GUID: kSQrlDX6DQk0WI1xioNX0FLSwTG5fMKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_01,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403290016
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

usleep_range() function takes input time and range in usec. However,
currently it is assumed in msec in the function
plpks_confirm_object_flushed().

Fix the total polling time for the object flushing from 5msec to 5sec.

Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
---
v3:
No change

v2:
* Updated based on feedback from Michael Ellerman
        Replaced usleep_range with fsleep.
        Since there is no more need to specify range, sleep time is
reverted back to 10 msec.

 arch/powerpc/include/asm/plpks.h       | 5 ++---
 arch/powerpc/platforms/pseries/plpks.c | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

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
index febe18f251d0..bcfcd5acc5c2 100644
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
 
-- 
2.31.1

