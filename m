Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 233FD6713BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxbDL09T6z3fJs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 17:18:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U1uIFzXO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U1uIFzXO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxb4C1ycfz3bbD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:11:22 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I5JVE0004401;
	Wed, 18 Jan 2023 06:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ln+dZlD7U92AgJCI5tK8AzpQIQLLs4y6SElYrlmd4Ks=;
 b=U1uIFzXOc+AHr/x+T6JMUhih5q/3Kui3Wzx4VcGWnhat0btjLQrx036kmcDfnaf3Ll9+
 O2x72Mj+k3DetIwCxqPrK3MWbC+AkCtV7W7zdv47yjSt+6mKcJ6AqgLmucCYAwgt4aSl
 OQtTRxeDbpFxQw6OHCb47Z+qFEXbMYzfQKzRjYu0tSlyj8HDc8SjKZSD0X5mAUpbfSB2
 ixku9xmINy1ywCsQxPJCBaYaG0ZX8P7z/MylU8WSsdhh7BAnb0iUHHW5NC9N4RniUw6R
 p3XHL1S0jE+VR0CJGLZWAq8XP7SLnYDya1zqxkT7oz27po5xr0RfaMZjn5KQ1ChjzWD9 2g== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6agxrwks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:18 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HMHJgI006209;
	Wed, 18 Jan 2023 06:11:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfmtkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:15 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I6BDxX47907198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 06:11:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56EF720049;
	Wed, 18 Jan 2023 06:11:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF79420040;
	Wed, 18 Jan 2023 06:11:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Jan 2023 06:11:12 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 581F760953;
	Wed, 18 Jan 2023 17:11:08 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v3 11/24] powerpc/pseries: Move plpks.h to include directory
Date: Wed, 18 Jan 2023 17:10:36 +1100
Message-Id: <20230118061049.1006141-12-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061049.1006141-1-ajd@linux.ibm.com>
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GG9VMumpyr3RQkf8Chvc7O0GuDJT0EGg
X-Proofpoint-ORIG-GUID: GG9VMumpyr3RQkf8Chvc7O0GuDJT0EGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180051
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, gcwilson@linux.ibm.com
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
index 4edd1585e245..955117f81e50 100644
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
2.39.0

