Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65F52F35C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 20:40:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4bBg3LlLz3drt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 04:40:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j/mqjean;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j/mqjean; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4b7F0tzHz3bkJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 04:37:28 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KHTEt1025679;
 Fri, 20 May 2022 18:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lEPhqUEkVCpFL31vlocaJqHP12q5U1uRfMK2X6kp+cY=;
 b=j/mqjeanqu/GgTSh9V9O9RoTZWK3y1W7n8bi7pyIUOeT5+M8j+ZZnUN9d5mMG4t29qcS
 /++gxQY+E54iWh+BD45bAdqgoQ/x/9nER5laDEPODA1Rsc/Zihu75wK0ADTEtmVCmdLl
 y6dS8f+Ea5mylm5id8POYHsSImp195s9FfDD+r5sgyNOg7b2gXO5baPu05Gm7KScyHZB
 kVCLo2G1YybEVjkKYhFdwUKWqsfsEK8fM0u6zbdWBnbEBPGsQshaRh+GJKK+SrMWO7N6
 kYs5d9dJugIzlwLlmZywv78KQ/hpjfCbCkBpxSPqUKmhKagsDGen3+kiyIyRCrviHil+ SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6fe492sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:37:20 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24KIZjVc010522;
 Fri, 20 May 2022 18:37:19 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6fe492rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:37:19 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24KIGwDR022316;
 Fri, 20 May 2022 18:37:18 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3g242acpj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:37:18 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24KIbGjK12255726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 18:37:16 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F246BE04F;
 Fri, 20 May 2022 18:37:16 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DA81BE051;
 Fri, 20 May 2022 18:37:16 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 18:37:16 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH v1 4/4] watchdog/pseries-wdt: initial support for PAPR
 H_WATCHDOG timers
Date: Fri, 20 May 2022 13:35:52 -0500
Message-Id: <20220520183552.33426-5-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220520183552.33426-1-cheloha@linux.ibm.com>
References: <20220520183552.33426-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cPeixZ3eTftAp7C4WVM0svTbgNVOmJif
X-Proofpoint-ORIG-GUID: k_bvVyXx9kD9Kk1LcCbGomkt520eM7b_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_05,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200117
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
 drivers/watchdog/pseries-wdt.c                | 337 ++++++++++++++++++
 4 files changed, 358 insertions(+)
 create mode 100644 drivers/watchdog/pseries-wdt.c

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 223c99361a30..4ffe725e796c 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -425,6 +425,18 @@ pnx833x_wdt:
 
 -------------------------------------------------
 
+pseries-wdt:
+    action:
+	Action taken when watchdog expires: 1 (power off), 2 (restart),
+	3 (dump and restart). (default=2)
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
index c4e82a8d863f..06b412603f3e 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1932,6 +1932,14 @@ config MEN_A21_WDT
 
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
index f7da867e8782..f35660409f17 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -184,6 +184,7 @@ obj-$(CONFIG_BOOKE_WDT) += booke_wdt.o
 obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
 
 # PPC64 Architecture
+obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
 obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
 
 # S390 Architecture
diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
new file mode 100644
index 000000000000..f41bc4d3b7a2
--- /dev/null
+++ b/drivers/watchdog/pseries-wdt.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2022 International Business Machines, Inc.
+ */
+
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define DRV_NAME "pseries-wdt"
+
+/*
+ * The PAPR's MSB->LSB bit ordering is 0->63.  These macros simplify
+ * defining bitfields as described in the PAPR without needing to
+ * transpose values to the more C-like 63->0 ordering.
+ */
+#define SETFIELD(_v, _b, _e)	\
+	(((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
+#define GETFIELD(_v, _b, _e)	\
+	(((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
+
+/*
+ * H_WATCHDOG Hypercall Input
+ *
+ * R4: "flags":
+ *
+ *     A 64-bit value structured as follows:
+ *
+ *         Bits 0-46: Reserved (must be zero).
+ */
+#define PSERIES_WDTF_RESERVED	PPC_BITMASK(0, 46)
+
+/*
+ *         Bit 47: "leaveOtherWatchdogsRunningOnTimeout"
+ *
+ *             0  Stop outstanding watchdogs on timeout.
+ *             1  Leave outstanding watchdogs running on timeout.
+ */
+#define PSERIES_WDTF_LEAVE_OTHER	PPC_BIT(47)
+
+/*
+ *         Bits 48-55: "operation"
+ *
+ *             0x01  Start Watchdog
+ *             0x02  Stop Watchdog
+ *             0x03  Query Watchdog Capabilities
+ *             0x04  Query Watchdog LPM Requirement
+ */
+#define PSERIES_WDTF_OP(op)		SETFIELD((op), 48, 55)
+#define PSERIES_WDTF_OP_START		PSERIES_WDTF_OP(0x1)
+#define PSERIES_WDTF_OP_STOP		PSERIES_WDTF_OP(0x2)
+#define PSERIES_WDTF_OP_QUERY		PSERIES_WDTF_OP(0x3)
+#define PSERIES_WDTF_OP_QUERY_LPM	PSERIES_WDTF_OP(0x4)
+
+/*
+ *         Bits 56-63: "timeoutAction"
+ *
+ *             0x01  Hard poweroff
+ *             0x02  Hard restart
+ *             0x03  Dump restart
+ */
+#define PSERIES_WDTF_ACTION(ac)			SETFIELD(ac, 56, 63)
+#define PSERIES_WDTF_ACTION_HARD_POWEROFF	PSERIES_WDTF_ACTION(0x1)
+#define PSERIES_WDTF_ACTION_HARD_RESTART	PSERIES_WDTF_ACTION(0x2)
+#define PSERIES_WDTF_ACTION_DUMP_RESTART	PSERIES_WDTF_ACTION(0x3)
+
+/*
+ * R5: "watchdogNumber":
+ *
+ *     The target watchdog.  Watchdog numbers are 1-based.  The
+ *     maximum supported watchdog number may be obtained via the
+ *     "Query Watchdog Capabilities" operation.
+ *
+ *     This input is ignored for the "Query Watchdog Capabilities"
+ *     operation.
+ *
+ * R6: "timeoutInMs":
+ *
+ *     The timeout in milliseconds.  The minimum supported timeout may
+ *     be obtained via the "Query Watchdog Capabilities" operation.
+ *
+ *     This input is ignored for the "Stop Watchdog", "Query Watchdog
+ *     Capabilities", and "Query Watchdog LPM Requirement" operations.
+ */
+
+/*
+ * H_WATCHDOG Hypercall Output
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
+ *   value structured as follows:
+ *
+ *       Bits  0-15: The minimum supported timeout in milliseconds.
+ *       Bits 16-31: The number of watchdogs supported.
+ *       Bits 32-63: Reserved.
+ */
+#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	GETFIELD((cap), 0, 15)
+#define PSERIES_WDTQ_MAX_NUMBER(cap)	GETFIELD((cap), 16, 31)
+#define PSERIES_WDTQ_RESERVED		PPC_BITMASK(32, 63)
+
+/*
+ * - For the "Query Watchdog LPM Requirement" operation:
+ *
+ *       1  The given "watchdogNumber" must be stopped prior to
+ *          suspending.
+ *
+ *       2  The given "watchdogNumber" does not have to be stopped
+ *          prior to suspending.
+ */
+#define PSERIES_WDTQL_MUST_STOP		1
+#define PSERIES_WDTQL_NEED_NOT_STOP	2
+
+static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
+
+static int action_get(char *buf, const struct kernel_param *kp)
+{
+	int val;
+
+	switch (action) {
+	case PSERIES_WDTF_ACTION_HARD_POWEROFF:
+		val = 1;
+		break;
+	case PSERIES_WDTF_ACTION_HARD_RESTART:
+		val = 2;
+		break;
+	case PSERIES_WDTF_ACTION_DUMP_RESTART:
+		val = 3;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return sprintf(buf, "%d\n", val);
+}
+
+static int action_set(const char *val, const struct kernel_param *kp)
+{
+	int choice;
+
+	if (kstrtoint(val, 10, &choice))
+		return -EINVAL;
+	switch (choice) {
+	case 1:
+		action = PSERIES_WDTF_ACTION_HARD_POWEROFF;
+		return 0;
+	case 2:
+		action = PSERIES_WDTF_ACTION_HARD_RESTART;
+		return 0;
+	case 3:
+		action = PSERIES_WDTF_ACTION_DUMP_RESTART;
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static const struct kernel_param_ops action_ops = {
+	.get = action_get,
+	.set = action_set,
+};
+module_param_cb(action, &action_ops, NULL, 0444);
+MODULE_PARM_DESC(action, "Action taken when watchdog expires (default=2)");
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
+	unsigned long num;		/* Watchdog numbers are 1-based */
+};
+
+static int pseries_wdt_start(struct watchdog_device *wdd)
+{
+	struct device *dev = wdd->parent;
+	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
+	unsigned long flags, msecs;
+	long rc;
+
+	flags = action | PSERIES_WDTF_OP_START;
+	msecs = wdd->timeout * 1000UL;
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
+	struct device *dev = wdd->parent;
+	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
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
+	unsigned long cap, min_timeout_ms;
+	long rc;
+	struct pseries_wdt *pw;
+	int err;
+
+	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
+	if (rc != H_SUCCESS)
+		return rc == H_FUNCTION ? -ENODEV : -EIO;
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
+
+	pw->wd.parent = &pdev->dev;
+	pw->wd.info = &pseries_wdt_info;
+	pw->wd.ops = &pseries_wdt_ops;
+	min_timeout_ms = PSERIES_WDTQ_MIN_TIMEOUT(cap);
+	pw->wd.min_timeout = roundup(min_timeout_ms, 1000) / 1000;
+	pw->wd.max_timeout = UINT_MAX;
+	watchdog_init_timeout(&pw->wd, timeout, NULL);
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
+		.owner = THIS_MODULE,
+	},
+	.id_table = pseries_wdt_id,
+	.probe = pseries_wdt_probe,
+	.resume = pseries_wdt_resume,
+	.suspend = pseries_wdt_suspend,
+};
+module_platform_driver(pseries_wdt_driver);
+
+MODULE_AUTHOR("Alexey Kardashevskiy <aik@ozlabs.ru>");
+MODULE_AUTHOR("Scott Cheloha <cheloha@linux.ibm.com>");
+MODULE_DESCRIPTION("POWER Architecture Platform Watchdog Driver");
+MODULE_LICENSE("GPL");
-- 
2.27.0

