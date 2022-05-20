Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A681452F183
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:23:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4YTd4lZNz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 03:23:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qVcbF4OS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qVcbF4OS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4YRX7063z3bkN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 03:21:28 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KGhfkU018198;
 Fri, 20 May 2022 17:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=b6u9iCsaTl0YYGo/RGHHLHpcBpVaeCey+2VLOkxy3PA=;
 b=qVcbF4OSouy/bIvbh9Gr8ihPgeELEQu7YHWmWtIit03wgX/RXg5hs8t+IGzUvMDO+dT+
 nZEEDlV6o6B5T8qAgWXndtc44GbVBSRuNZFwfStXX4BgxFrA0O31qsRMPR8VyLN9Fek2
 mq4ZPVM85toJQWV0SI39hpGk1hbXTrYm7HxlG22msqkMsH1xjvzbpWyiKS0/XKfj4fN6
 +KOYXyc2ctNw/vb4/Keo+dXAIbkIFiB9UTw1LoiO8kW7DjaKVVdPCehDd4aflpQBXwC5
 lp6BH738ERPyDfHRquSFXNyyi2xgceC3p0aSQ8mlXyeOnNjFVrhNtzemd3H5oKT0pFQP VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6erx8m33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 17:21:22 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24KGpAdL006567;
 Fri, 20 May 2022 17:21:21 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6erx8m2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 17:21:21 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24KHCWRT025277;
 Fri, 20 May 2022 17:21:20 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3g3r2fn1mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 17:21:20 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24KHLJ8729688286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 17:21:19 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 063712805A;
 Fri, 20 May 2022 17:21:19 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6B3D28059;
 Fri, 20 May 2022 17:21:18 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 17:21:18 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH v1 3/4] powerpc/pseries: register pseries-wdt device with
 platform bus
Date: Fri, 20 May 2022 12:20:54 -0500
Message-Id: <20220520172055.32220-3-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220520172055.32220-1-cheloha@linux.ibm.com>
References: <20220520172055.32220-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H1bqiJK7GDPX7N7qF4LTIC7QbK9IKurk
X-Proofpoint-GUID: 19Mn6qhWV0qoKe4UgNmZSg8cIibqY43p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200107
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru,
 Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com,
 npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
 arch/powerpc/platforms/pseries/setup.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 955ff8aa1644..6e8b67ea2a33 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -14,6 +14,7 @@
 
 #include <linux/cpu.h>
 #include <linux/errno.h>
+#include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -169,6 +170,22 @@ static void __init fwnmi_init(void)
 #endif
 }
 
+/*
+ * Affix a device for the first timer to the platform bus if
+ * we have firmware support for the H_WATCHDOG hypercall.
+ */
+static struct platform_device *pseries_wdt_pdev;
+
+static __init int pseries_wdt_init(void)
+{
+	if (!firmware_has_feature(FW_FEATURE_WATCHDOG))
+		return 0;
+	pseries_wdt_pdev = platform_device_register_simple("pseries-wdt",
+							   0, NULL, 0);
+	return 0;
+}
+machine_subsys_initcall(pseries, pseries_wdt_init);
+
 static void pseries_8259_cascade(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-- 
2.27.0

