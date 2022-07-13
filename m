Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C634573DD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 22:27:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljq1G1XVHz3f46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 06:27:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JSJw8gP0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JSJw8gP0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjpyG4p50z3c4t
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 06:24:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DKCtQJ020518;
	Wed, 13 Jul 2022 20:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OU2f9MTfSM9H2vWAsHugDXnCBex5P0f4aROZiGZ6vqc=;
 b=JSJw8gP0Yi56L8CkcvIDMEFwPiFfwq3RmOrbjU9mpt5pTFwMuanQNa7YL+V22OcMPVX8
 5kBWfkEfbMBmPMdJ0bce3x1+LyMqVEK8V/y+V5MR5kgCpak8ahI67YUaPuAdreLwLX8K
 RVLrN0gPOEeKEYgKzx6OpUL5yk6WzwO+COk+E6PozSF6ve1iNZfTq5sNlckvUy4sCR85
 UuzvNvnhnaci+sKihX+PtCfsjrgq0fRVLyFeoY16GvsHtEnCjDTxLN1WKCMQb0nf11kO
 Ik7t3pgzd+B0+e62Q6Xm/OAva+xVStrPI+01vbk/E57dnHYgY7aaqrWEFEHu1ArMf26l 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha4w188g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 20:24:46 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DKJJVe021775;
	Wed, 13 Jul 2022 20:24:46 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha4w188fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 20:24:46 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DJZfWi013247;
	Wed, 13 Jul 2022 20:24:45 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma01wdc.us.ibm.com with ESMTP id 3h71a9ebrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 20:24:45 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26DKOigZ31981910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Jul 2022 20:24:44 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92DB36A04D;
	Wed, 13 Jul 2022 20:24:44 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 753776A047;
	Wed, 13 Jul 2022 20:24:44 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 13 Jul 2022 20:24:44 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH v3 4/4] watchdog/pseries-wdt: initial support for H_WATCHDOG-based watchdog timers
Date: Wed, 13 Jul 2022 15:23:35 -0500
Message-Id: <20220713202335.1217647-5-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220713202335.1217647-1-cheloha@linux.ibm.com>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sH--akDn2-klbgh3F2-kvuF_VUbW0Ana
X-Proofpoint-GUID: a0Tfhzt_dZKFu53Hr8NEFWAzPFP5a5oE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_07,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
guest control of one or more virtual watchdog timers.  The timers have
millisecond granularity.  The guest is terminated when a timer
expires.

This patch adds a watchdog driver for these timers, "pseries-wdt".

pseries_wdt_probe() currently assumes the existence of only one
platform device and always assigns it watchdogNumber 1.  If we ever
expose more than one timer to userspace we will need to devise a way
to assign a distinct watchdogNumber to each platform device at device
registration time.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 .../watchdog/watchdog-parameters.rst          |  12 +
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/pseries-wdt.c                | 239 ++++++++++++++++++
 4 files changed, 260 insertions(+)
 create mode 100644 drivers/watchdog/pseries-wdt.c

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 223c99361a30..29153eed6689 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -425,6 +425,18 @@ pnx833x_wdt:
 
 -------------------------------------------------
 
+pseries-wdt:
+    action:
+	Action taken when watchdog expires: 0 (power off), 1 (restart),
+	2 (dump and restart). (default=1)
+    timeout:
+	Initial watchdog timeout in seconds. (default=60)
+    nowayout:
+	Watchdog cannot be stopped once started.
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
 rc32434_wdt:
     timeout:
 	Watchdog timeout value, in seconds (default=20)
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 32fd37698932..a2429604a4ab 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1962,6 +1962,14 @@ config MEN_A21_WDT
 
 # PPC64 Architecture
 
+config PSERIES_WDT
+	tristate "POWER Architecture Platform Watchdog Timer"
+	depends on PPC_PSERIES
+	select WATCHDOG_CORE
+	help
+	  Driver for virtual watchdog timers provided by PAPR
+	  hypervisors (e.g. PowerVM, KVM).
+
 config WATCHDOG_RTAS
 	tristate "RTAS watchdog"
 	depends on PPC_RTAS
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index c324e9d820e9..cdeb119e6e61 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -187,6 +187,7 @@ obj-$(CONFIG_BOOKE_WDT) += booke_wdt.o
 obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
 
 # PPC64 Architecture
+obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
 obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
 
 # S390 Architecture
diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
new file mode 100644
index 000000000000..7f53b5293409
--- /dev/null
+++ b/drivers/watchdog/pseries-wdt.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2022 International Business Machines, Inc.
+ */
+
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/time64.h>
+#include <linux/watchdog.h>
+
+#define DRV_NAME "pseries-wdt"
+
+/*
+ * H_WATCHDOG Input
+ *
+ * R4: "flags":
+ *
+ *         Bits 48-55: "operation"
+ */
+#define PSERIES_WDTF_OP_START	0x100UL		/* start timer */
+#define PSERIES_WDTF_OP_STOP	0x200UL		/* stop timer */
+#define PSERIES_WDTF_OP_QUERY	0x300UL		/* query timer capabilities */
+
+/*
+ *         Bits 56-63: "timeoutAction" (for "Start Watchdog" only)
+ */
+#define PSERIES_WDTF_ACTION_HARD_POWEROFF	0x1UL	/* poweroff */
+#define PSERIES_WDTF_ACTION_HARD_RESTART	0x2UL	/* restart */
+#define PSERIES_WDTF_ACTION_DUMP_RESTART	0x3UL	/* dump + restart */
+
+/*
+ * H_WATCHDOG Output
+ *
+ * R3: Return code
+ *
+ *     H_SUCCESS    The operation completed.
+ *
+ *     H_BUSY	    The hypervisor is too busy; retry the operation.
+ *
+ *     H_PARAMETER  The given "flags" are somehow invalid.  Either the
+ *                  "operation" or "timeoutAction" is invalid, or a
+ *                  reserved bit is set.
+ *
+ *     H_P2         The given "watchdogNumber" is zero or exceeds the
+ *                  supported maximum value.
+ *
+ *     H_P3         The given "timeoutInMs" is below the supported
+ *                  minimum value.
+ *
+ *     H_NOOP       The given "watchdogNumber" is already stopped.
+ *
+ *     H_HARDWARE   The operation failed for ineffable reasons.
+ *
+ *     H_FUNCTION   The H_WATCHDOG hypercall is not supported by this
+ *                  hypervisor.
+ *
+ * R4:
+ *
+ * - For the "Query Watchdog Capabilities" operation, a 64-bit
+ *   structure:
+ */
+#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	(((cap) >> 48) & 0xffff)
+#define PSERIES_WDTQ_MAX_NUMBER(cap)	(((cap) >> 32) & 0xffff)
+
+static const unsigned long pseries_wdt_action[] = {
+	[0] = PSERIES_WDTF_ACTION_HARD_POWEROFF,
+	[1] = PSERIES_WDTF_ACTION_HARD_RESTART,
+	[2] = PSERIES_WDTF_ACTION_DUMP_RESTART,
+};
+
+#define WATCHDOG_ACTION 1
+static unsigned int action = WATCHDOG_ACTION;
+module_param(action, uint, 0444);
+MODULE_PARM_DESC(action, "Action taken when watchdog expires (default="
+		 __MODULE_STRING(WATCHDOG_ACTION) ")");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0444);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+#define WATCHDOG_TIMEOUT 60
+static unsigned int timeout = WATCHDOG_TIMEOUT;
+module_param(timeout, uint, 0444);
+MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default="
+		 __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
+
+struct pseries_wdt {
+	struct watchdog_device wd;
+	unsigned long action;
+	unsigned long num;		/* Watchdog numbers are 1-based */
+};
+
+static int pseries_wdt_start(struct watchdog_device *wdd)
+{
+	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
+	struct device *dev = wdd->parent;
+	unsigned long flags, msecs;
+	long rc;
+
+	flags = pw->action | PSERIES_WDTF_OP_START;
+	msecs = wdd->timeout * MSEC_PER_SEC;
+	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
+	if (rc != H_SUCCESS) {
+		dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
+			 rc, pw->num);
+		return -EIO;
+	}
+	return 0;
+}
+
+static int pseries_wdt_stop(struct watchdog_device *wdd)
+{
+	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
+	struct device *dev = wdd->parent;
+	long rc;
+
+	rc = plpar_hcall_norets(H_WATCHDOG, PSERIES_WDTF_OP_STOP, pw->num);
+	if (rc != H_SUCCESS && rc != H_NOOP) {
+		dev_crit(dev, "H_WATCHDOG: %ld: failed to stop timer %lu",
+			 rc, pw->num);
+		return -EIO;
+	}
+	return 0;
+}
+
+static struct watchdog_info pseries_wdt_info = {
+	.identity = DRV_NAME,
+	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT
+	    | WDIOF_PRETIMEOUT,
+};
+
+static const struct watchdog_ops pseries_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = pseries_wdt_start,
+	.stop = pseries_wdt_stop,
+};
+
+static int pseries_wdt_probe(struct platform_device *pdev)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
+	struct pseries_wdt *pw;
+	unsigned long cap;
+	long msecs, rc;
+	int err;
+
+	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
+	if (rc == H_FUNCTION)
+		return -ENODEV;
+	if (rc != H_SUCCESS)
+		return -EIO;
+	cap = ret[0];
+
+	pw = devm_kzalloc(&pdev->dev, sizeof(*pw), GFP_KERNEL);
+	if (!pw)
+		return -ENOMEM;
+
+	/*
+	 * Assume watchdogNumber 1 for now.  If we ever support
+	 * multiple timers we will need to devise a way to choose a
+	 * distinct watchdogNumber for each platform device at device
+	 * registration time.
+	 */
+	pw->num = 1;
+	if (PSERIES_WDTQ_MAX_NUMBER(cap) < pw->num)
+		return -ENODEV;
+
+	if (action >= ARRAY_SIZE(pseries_wdt_action))
+		return -EINVAL;
+	pw->action = pseries_wdt_action[action];
+
+	pw->wd.parent = &pdev->dev;
+	pw->wd.info = &pseries_wdt_info;
+	pw->wd.ops = &pseries_wdt_ops;
+	msecs = PSERIES_WDTQ_MIN_TIMEOUT(cap);
+	pw->wd.min_timeout = DIV_ROUND_UP(msecs, MSEC_PER_SEC);
+	pw->wd.max_timeout = UINT_MAX / 1000;	/* from linux/watchdog.h */
+	pw->wd.timeout = timeout;
+	if (watchdog_init_timeout(&pw->wd, 0, NULL))
+		return -EINVAL;
+	watchdog_set_nowayout(&pw->wd, nowayout);
+	watchdog_stop_on_reboot(&pw->wd);
+	watchdog_stop_on_unregister(&pw->wd);
+	watchdog_set_drvdata(&pw->wd, pw);
+
+	err = devm_watchdog_register_device(&pdev->dev, &pw->wd);
+	if (err)
+		return err;
+
+	platform_set_drvdata(pdev, &pw->wd);
+
+	return 0;
+}
+
+static int pseries_wdt_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct watchdog_device *wd = platform_get_drvdata(pdev);
+
+	if (watchdog_active(wd))
+		return pseries_wdt_stop(wd);
+	return 0;
+}
+
+static int pseries_wdt_resume(struct platform_device *pdev)
+{
+	struct watchdog_device *wd = platform_get_drvdata(pdev);
+
+	if (watchdog_active(wd))
+		return pseries_wdt_start(wd);
+	return 0;
+}
+
+static const struct platform_device_id pseries_wdt_id[] = {
+	{ .name = "pseries-wdt" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, pseries_wdt_id);
+
+static struct platform_driver pseries_wdt_driver = {
+	.driver = {
+		.name = DRV_NAME,
+	},
+	.id_table = pseries_wdt_id,
+	.probe = pseries_wdt_probe,
+	.resume = pseries_wdt_resume,
+	.suspend = pseries_wdt_suspend,
+};
+module_platform_driver(pseries_wdt_driver);
+
+MODULE_AUTHOR("Alexey Kardashevskiy");
+MODULE_AUTHOR("Scott Cheloha");
+MODULE_DESCRIPTION("POWER Architecture Platform Watchdog Driver");
+MODULE_LICENSE("GPL");
-- 
2.27.0

