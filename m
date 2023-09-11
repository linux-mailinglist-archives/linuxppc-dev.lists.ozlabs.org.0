Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AC79A2E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 07:38:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ddoUXFYQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkb9G2vY8z3cCr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 15:38:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ddoUXFYQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aboorvad@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkb7S4BS9z2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Sep 2023 15:36:52 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B5IDO8011185;
	Mon, 11 Sep 2023 05:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yOBGGkftmUVXsigCbpMtDoFnGqFkcfJLGVO8U9fKSms=;
 b=ddoUXFYQ5fTcScvkwvGSWNHPsjyl5dLtHncF95ZakORm9/Yj+h3G0eQInWDgi5Auauzb
 8g9b0Cj6Q2Gj834dFuxHQ1ujGwfyTgkxOOK6DQo1IMRmrmtYl7z6mcQyUbEwPR4+RyQo
 pLpM8f5LaRGgGGFfMZjJZzUdrV2j0BLVNehpZwSObMBkFtLHg8EBgXTBPp21QRix8Oz7
 yIHX/+qSnCbk7qo1xtQI2AyFQ57GL45wqh7/JBE0jSh1/7XUe43xn1MFGXxR05SAfCK2
 nCUtc43rXPZWsHwux4dnXb0NmV5WOQ3NXwo/xBQDhamCresqFEXtnkbvtkIZt8pbE6Q5 LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t1vmarehw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:36:36 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38B5PNFH032616;
	Mon, 11 Sep 2023 05:36:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t1vmareej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:36:34 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38B4ALoW012064;
	Mon, 11 Sep 2023 05:36:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t13dy8aem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:36:33 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38B5aVL562521708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Sep 2023 05:36:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6597120043;
	Mon, 11 Sep 2023 05:36:31 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 970DE20040;
	Mon, 11 Sep 2023 05:36:28 +0000 (GMT)
Received: from li-34d1fccc-27cd-11b2-a85c-c167793e56f7.ibm.com.com (unknown [9.171.42.194])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Sep 2023 05:36:28 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
To: aboorvad@linux.vnet.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        rmclure@linux.ibm.com, arnd@arndb.de, joel@jms.id.au, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
Subject: [RFC v3 1/2] powerpc/cpuidle: cpuidle wakeup latency based on IPI and timer events
Date: Mon, 11 Sep 2023 11:06:19 +0530
Message-Id: <20230911053620.87973-2-aboorvad@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230911053620.87973-1-aboorvad@linux.vnet.ibm.com>
References: <20230911053620.87973-1-aboorvad@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PLUT1YDpeMcFDNn2PSKZMJCMBr2QSlyW
X-Proofpoint-ORIG-GUID: l-yKBu74eaKsFSG7_FLkjB3UfaS3wb8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309110051
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
Cc: sshegde@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pratik R. Sampat <psampat@linux.ibm.com>

Introduce a mechanism to fire directed IPIs from a source CPU to a
specified target CPU and measure the time incurred on waking up the
target CPU in response.

Also, introduce a mechanism to queue a hrtimer on a specified CPU and
subsequently measure the time taken to wakeup the CPU.

Define a simple debugfs interface that allows for adjusting the
settings to trigger IPI and timer events on a designated CPU, and to
observe the resulting cpuidle wakeup latencies.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Signed-off-by: Pratik R. Sampat <psampat@linux.ibm.com>
Signed-off-by: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
---
 arch/powerpc/Kconfig.debug                 |  10 ++
 arch/powerpc/kernel/Makefile               |   1 +
 arch/powerpc/kernel/test_cpuidle_latency.c | 154 +++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 arch/powerpc/kernel/test_cpuidle_latency.c

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 2a54fadbeaf5..e175fc3028ac 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -391,3 +391,13 @@ config KASAN_SHADOW_OFFSET
 	default 0xe0000000 if PPC32
 	default 0xa80e000000000000 if PPC_BOOK3S_64
 	default 0xa8001c0000000000 if PPC_BOOK3E_64
+
+config CPUIDLE_LATENCY_SELFTEST
+	tristate "Cpuidle latency selftests"
+	depends on CPU_IDLE
+	help
+	  Provides a kernel module that run tests using the IPI and
+	  timers to measure cpuidle latency.
+
+	  Say M if you want these self tests to build as a module.
+	  Say N if you are unsure.
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 2919433be355..3c5a576bbcf2 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -94,6 +94,7 @@ obj-$(CONFIG_PPC_BARRIER_NOSPEC) += security.o
 obj-$(CONFIG_PPC64)		+= vdso64_wrapper.o
 obj-$(CONFIG_ALTIVEC)		+= vecemu.o
 obj-$(CONFIG_PPC_BOOK3S_IDLE)	+= idle_book3s.o
+obj-$(CONFIG_CPUIDLE_LATENCY_SELFTEST)  += test_cpuidle_latency.o
 procfs-y			:= proc_powerpc.o
 obj-$(CONFIG_PROC_FS)		+= $(procfs-y)
 rtaspci-$(CONFIG_PPC64)-$(CONFIG_PCI)	:= rtas_pci.o
diff --git a/arch/powerpc/kernel/test_cpuidle_latency.c b/arch/powerpc/kernel/test_cpuidle_latency.c
new file mode 100644
index 000000000000..c932222a8f76
--- /dev/null
+++ b/arch/powerpc/kernel/test_cpuidle_latency.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Module-based API test facility for cpuidle latency using IPIs and timers
+ */
+
+#include <linux/debugfs.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+/*
+ * IPI based wakeup latencies
+ * Measure time taken for a CPU to wakeup on a IPI sent from another CPU
+ * The latency measured also includes the latency of sending the IPI
+ */
+struct latency {
+	unsigned int src_cpu;
+	unsigned int dest_cpu;
+	ktime_t time_start;
+	ktime_t time_end;
+	u64 latency_ns;
+} ipi_wakeup;
+
+static void measure_latency(void *info)
+{
+	struct latency *v = (struct latency *)info;
+	ktime_t time_diff;
+
+	v->time_end = ktime_get();
+	time_diff = ktime_sub(v->time_end, v->time_start);
+	v->latency_ns = ktime_to_ns(time_diff);
+}
+
+void run_smp_call_function_test(unsigned int cpu)
+{
+	ipi_wakeup.src_cpu = smp_processor_id();
+	ipi_wakeup.dest_cpu = cpu;
+	ipi_wakeup.time_start = ktime_get();
+	smp_call_function_single(cpu, measure_latency, &ipi_wakeup, 1);
+}
+
+/*
+ * Timer based wakeup latencies
+ * Measure time taken for a CPU to wakeup on a timer being armed and fired
+ */
+struct timer_data {
+	unsigned int src_cpu;
+	u64 timeout;
+	ktime_t time_start;
+	ktime_t time_end;
+	struct hrtimer timer;
+	u64 timeout_diff_ns;
+} timer_wakeup;
+
+static enum hrtimer_restart hrtimer_callback(struct hrtimer *hrtimer)
+{
+	struct timer_data *w;
+	ktime_t time_diff;
+
+	w = container_of(hrtimer, struct timer_data, timer);
+	w->time_end = ktime_get();
+
+	time_diff = ktime_sub(w->time_end, w->time_start);
+	time_diff = ktime_sub(time_diff, ns_to_ktime(w->timeout));
+	w->timeout_diff_ns = ktime_to_ns(time_diff);
+	return HRTIMER_NORESTART;
+}
+
+static void run_timer_test(unsigned int ns)
+{
+	hrtimer_init(&timer_wakeup.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	timer_wakeup.timer.function = hrtimer_callback;
+	timer_wakeup.src_cpu = smp_processor_id();
+	timer_wakeup.timeout = ns;
+	timer_wakeup.time_start = ktime_get();
+
+	hrtimer_start(&timer_wakeup.timer, ns_to_ktime(ns),
+		      HRTIMER_MODE_REL_PINNED);
+}
+
+static struct dentry *dir;
+
+static int cpu_read_op(void *data, u64 *dest_cpu)
+{
+	*dest_cpu = ipi_wakeup.dest_cpu;
+	return 0;
+}
+
+/*
+ * Send a directed IPI from the current CPU (source) to the destination CPU and
+ * measure the latency on wakeup.
+ */
+static int cpu_write_op(void *data, u64 value)
+{
+	run_smp_call_function_test(value);
+	return 0;
+}
+DEFINE_SIMPLE_ATTRIBUTE(ipi_ops, cpu_read_op, cpu_write_op, "%llu\n");
+
+static int timeout_read_op(void *data, u64 *timeout)
+{
+	*timeout = timer_wakeup.timeout;
+	return 0;
+}
+
+/* Queue a hrtimer on a specified desitination CPU and measure the time taken to
+ * wakeup the CPU.
+ */
+static int timeout_write_op(void *data, u64 value)
+{
+	run_timer_test(value);
+	return 0;
+}
+DEFINE_SIMPLE_ATTRIBUTE(timeout_ops, timeout_read_op, timeout_write_op, "%llu\n");
+
+static int __init latency_init(void)
+{
+	struct dentry *temp;
+
+	dir = debugfs_create_dir("latency_test", arch_debugfs_dir);
+	if (!dir) {
+		pr_alert("latency_test: failed to create /sys/kernel/debug/powerpc/latency_test\n");
+		return -1;
+	}
+	temp = debugfs_create_file("ipi_cpu_dest", 0644, dir, NULL, &ipi_ops);
+	if (!temp) {
+		pr_alert("latency_test: failed to create /sys/kernel/debug/powerpc/ipi_cpu_dest\n");
+		return -1;
+	}
+	debugfs_create_u64("ipi_latency_ns", 0444, dir, &ipi_wakeup.latency_ns);
+	debugfs_create_u32("ipi_cpu_src", 0444, dir, &ipi_wakeup.src_cpu);
+
+	temp = debugfs_create_file("timeout_expected_ns", 0644, dir, NULL, &timeout_ops);
+	if (!temp) {
+		pr_alert("latency_test: failed to create /sys/kernel/debug/powerpc/timeout_expected_ns\n");
+		return -1;
+	}
+	debugfs_create_u64("timeout_diff_ns", 0444, dir, &timer_wakeup.timeout_diff_ns);
+	debugfs_create_u32("timeout_cpu_src", 0444, dir, &timer_wakeup.src_cpu);
+	pr_info("Latency Test module loaded\n");
+	return 0;
+}
+
+static void __exit latency_cleanup(void)
+{
+	pr_info("Cleaning up Latency Test module.\n");
+	debugfs_remove_recursive(dir);
+}
+
+module_init(latency_init);
+module_exit(latency_cleanup);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("IBM Corporation");
+MODULE_DESCRIPTION("Measuring idle latency for IPIs and Timers");
-- 
2.25.1

