Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5406824CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 07:47:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5bFj209Lz3f6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:47:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oU1dfIiW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oU1dfIiW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5b5c3dgSz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 17:40:19 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V6TmM9026278;
	Tue, 31 Jan 2023 06:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IrDWb+LIqMomXyWioGCHO1JQjb7qQVYa+i8eUlWM6+U=;
 b=oU1dfIiW2+TXrYR53i4wA4qhANkOBQpnAgf1r87ngTvIfWRjh8vWQIkNlOpajV0o5fjt
 uDR4sTS6wpIvBArNtnnvYTQg+7HJ73SDmjxSL9J7jJ9Mh3z3tgZu6B81Fahp+ILOnWKK
 o12bPZVo7HZhJZEWwTgD+WzCF85w8UcU0m4Cisy6WNQUh8TJrOhIsOlVjeb8lrppxoMC
 I3szjA1ZzGEfjuNPX9sP4v55g6GVrjn3QgU3N4BNU+evU78XsFjNybV/VuKFReCvEgSM
 eWimcxGfObOvQytRUfIKw17TX6QxGKcHMPXGMJubFQ6vNLdiGqlMVaP+yy0cxQwb+kBy TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3news607k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:15 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30V6Tp4Q026425;
	Tue, 31 Jan 2023 06:40:14 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3news607j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:14 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UKDNUk014744;
	Tue, 31 Jan 2023 06:40:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ncvttu3ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:40:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30V6e9K446006686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 06:40:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61D222004F;
	Tue, 31 Jan 2023 06:40:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D69802004E;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 06:40:08 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C10DF6096E;
	Tue, 31 Jan 2023 17:40:04 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v5 14/25] powerpc/pseries: Move plpks.h to include directory
Date: Tue, 31 Jan 2023 17:39:17 +1100
Message-Id: <20230131063928.388035-15-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131063928.388035-1-ajd@linux.ibm.com>
References: <20230131063928.388035-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tGib7l7rAjlwFPLUn6r548fuqcjLNEGt
X-Proofpoint-ORIG-GUID: VzDQkcglbmXZfueq8a7iJwpXLo6tL5by
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301310059
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

Move plpks.h from platforms/pseries/ to include/asm/. This is necessary
for later patches to make use of the PLPKS from code in other subsystems.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

v3: New patch
---
 .../powerpc/{platforms/pseries => include/asm}/plpks.h | 10 +++++++---
 arch/powerpc/platforms/pseries/plpks.c                 |  3 +--
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename arch/powerpc/{platforms/pseries => include/asm}/plpks.h (89%)

diff --git a/arch/powerpc/platforms/pseries/plpks.h b/arch/powerpc/include/asm/plpks.h
similarity index 89%
rename from arch/powerpc/platforms/pseries/plpks.h
rename to arch/powerpc/include/asm/plpks.h
index 275ccd86bfb5..8295502ee93b 100644
--- a/arch/powerpc/platforms/pseries/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -6,8 +6,10 @@
  * Platform keystore for pseries LPAR(PLPKS).
  */
 
-#ifndef _PSERIES_PLPKS_H
-#define _PSERIES_PLPKS_H
+#ifndef _ASM_POWERPC_PLPKS_H
+#define _ASM_POWERPC_PLPKS_H
+
+#ifdef CONFIG_PSERIES_PLPKS
 
 #include <linux/types.h>
 #include <linux/list.h>
@@ -68,4 +70,6 @@ int plpks_read_fw_var(struct plpks_var *var);
  */
 int plpks_read_bootloader_var(struct plpks_var *var);
 
-#endif
+#endif // CONFIG_PSERIES_PLPKS
+
+#endif // _ASM_POWERPC_PLPKS_H
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index a01cf2ff140a..13e6daadb179 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -18,8 +18,7 @@
 #include <linux/types.h>
 #include <asm/hvcall.h>
 #include <asm/machdep.h>
-
-#include "plpks.h"
+#include <asm/plpks.h>
 
 #define PKS_FW_OWNER	     0x1
 #define PKS_BOOTLOADER_OWNER 0x2
-- 
2.39.1

