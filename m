Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D04573DCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 22:26:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljq0V0lWLz3dyL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 06:26:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MArOSpF9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MArOSpF9;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljpy7386Sz3cBR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 06:24:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DIEKXp025077;
	Wed, 13 Jul 2022 20:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=i4PQNUt9c4esJFbyqMm3YKFV5dhJ3IG/d0MB+yIiNNo=;
 b=MArOSpF9rG7m+Tqs5qoqWLnlyeEpcrG1sB9tX0IwKGm4zffaBB0Y+HQ06FDVpUjqYZ1b
 rMcryGgXxTy0yklXEPL3PKC7kUKS/ZenEi4VgnVu0m3cu6ap7smLRd8g7/5W4Eh2YMhM
 59az4qc6d4/qMoC/AT4FmCO6R0iA0hFD1rc4JDNQ12lbwfXcGHNrvZEvZETZK82Pnq3j
 NbfN4Y/FTp6UISkTY3KFU25oBx+h1XGmcT+V4QtVw9D+iBaKejJWmV4sJ36zOSfdizgK
 ldhi3F734yj7GSbEr1uPeMkpznl8BvXWQuNNGC5xljXsIXJrR5Kvhc3nMUZ6Q8XNiRsA CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha1cx5hx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 20:24:39 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DKFwlW018354;
	Wed, 13 Jul 2022 20:24:39 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha1cx5hwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 20:24:39 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DJZimi013257;
	Wed, 13 Jul 2022 20:24:38 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma01wdc.us.ibm.com with ESMTP id 3h71a9ebqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 20:24:38 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26DKObju30867872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Jul 2022 20:24:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 392EF78070;
	Wed, 13 Jul 2022 20:24:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D66778064;
	Wed, 13 Jul 2022 20:24:37 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 13 Jul 2022 20:24:36 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH v3 3/4] powerpc/pseries: register pseries-wdt device with platform bus
Date: Wed, 13 Jul 2022 15:23:34 -0500
Message-Id: <20220713202335.1217647-4-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220713202335.1217647-1-cheloha@linux.ibm.com>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -wbGm6Wg-K_OEfaCWyUd_vIfh08ekm1s
X-Proofpoint-ORIG-GUID: 3wLfZRI5fyoy_rij19lifn7dvk__sOtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_07,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130073
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru, Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
guest control of one or more virtual watchdog timers.

These timers do not conform to PowerPC device conventions.  They are
not affixed to any extant bus, nor do they have full representation in
the device tree.

As a workaround we represent them as platform devices.

This patch registers a single platform device, "pseries-wdt", with the
platform bus if the FW_FEATURE_WATCHDOG flag is set.

A driver for this device, "pseries-wdt", will be introduced in a
subsequent patch.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/setup.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index ee4f1db49515..dd9d3f500cff 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -14,6 +14,7 @@
 
 #include <linux/cpu.h>
 #include <linux/errno.h>
+#include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -169,6 +170,18 @@ static void __init fwnmi_init(void)
 #endif
 }
 
+/*
+ * Affix a device for the first timer to the platform bus if
+ * we have firmware support for the H_WATCHDOG hypercall.
+ */
+static __init int pseries_wdt_init(void)
+{
+	if (firmware_has_feature(FW_FEATURE_WATCHDOG))
+		platform_device_register_simple("pseries-wdt", 0, NULL, 0);
+	return 0;
+}
+machine_subsys_initcall(pseries, pseries_wdt_init);
+
 static void pseries_8259_cascade(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-- 
2.27.0

