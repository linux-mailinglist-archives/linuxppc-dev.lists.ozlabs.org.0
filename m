Return-Path: <linuxppc-dev+bounces-6878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B82EA5BA2F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 08:51:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBmDq6ZlMz3bn0;
	Tue, 11 Mar 2025 18:51:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741679515;
	cv=none; b=USStb0ZRQeWSdZeBmK8as/Zw6Yl4XXsNXvj5MCNbiCfEU8iENPWyAZ0tnNCacDrAEvGtHOmefFH0uS/fUacZDnVU9vix7zU7SkBedPNEhYbkCAOhvPSeRZxo6VQ9fqOPM70g381rXHV717epVr+kFuXDC4dZoH0O5OSgBfwrgZfu3H7eLIKUO4o7B9hjynnLGQzL/MhYtpuoLZY/v4QdggejR/A2b2nF8gD9owkCc7GRo7wkkqFD7nz0LZk/qCLGEOOzXkvB7ajvAjZRAHSpfJb7QuOAqWwKpbhfS914WRBvFjtEgAhYHcgu8owMf4+G9f8v1u9M7v0zVPPgcNjRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741679515; c=relaxed/relaxed;
	bh=rIHv27FelkoCdY23L+zoRCxdo2m98WIDi578UXcHqno=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4ih6kyZ3JvLrSC0UFESWp3Ob5qSj/PmbUcLAnrvT7N+jjH3EqPnoG7edZi28lbDsvwCgAlPXQSqCpZ9KTO4gY0mA1A7Taquewb2ehMIgcYhRtR8KaYw/QmxuwGNDDI+8Gv8jEmmBWAxoIlVopNt0G9qyjOA0lxJwU82413OLQP/JYhY4myfzxfq23UtboEgyvuvKgmzZiAus6Cqn2oOYNSbW8pV4sTdmpPwBkTE+fJn7Vwb6hOYFGCV9/zjaDAmFTE3+W13lWYngAv5qoKIlsZ0awDoFUv8jPdfLWQ/kia7zEjo4vsTKqdI76wTSl7af62wTz6u6Gyuy8pAXPN8VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBmDp1HVTz3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 18:51:53 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZBm7h0CXBz2RTR0;
	Tue, 11 Mar 2025 15:47:28 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 27B0F1402CD;
	Tue, 11 Mar 2025 15:51:48 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 11 Mar 2025 15:51:47 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: [PATCH v12 2/4] arch_topology: Support SMT control for OF based system
Date: Tue, 11 Mar 2025 15:51:41 +0800
Message-ID: <20250311075143.61078-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250311075143.61078-1-yangyicong@huawei.com>
References: <20250311075143.61078-1-yangyicong@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Yicong Yang <yangyicong@hisilicon.com>

On building the topology from the devicetree, we've already gotten the
SMT thread number of each core. Update the largest SMT thread number
and enable the SMT control by the end of topology parsing.

The framework's SMT control provides two interface to the users [1]
through /sys/devices/system/cpu/smt/control:
1) enable SMT by writing "on" and disable by "off"
2) enable SMT by writing max_thread_number or disable by writing 1

Both method support to completely disable/enable the SMT cores so both
work correctly for symmetric SMT platform and asymmetric platform with
non-SMT and one type SMT cores like:
core A: 1 thread
core B: X (X!=1) threads

Note that for a theoretically possible multiple SMT-X (X>1) core
platform the SMT control is also supported as expected but only
by writing the "on/off" method.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>
Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/base/arch_topology.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 3ebe77566788..d409d323ee64 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -11,6 +11,7 @@
 #include <linux/cleanup.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
+#include <linux/cpu_smt.h>
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/slab.h>
@@ -506,6 +507,10 @@ core_initcall(free_raw_capacity);
 #endif
 
 #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+
+/* Used to enable the SMT control */
+static unsigned int max_smt_thread_num = 1;
+
 /*
  * This function returns the logic cpu number of the node.
  * There are basically three kinds of return values:
@@ -565,6 +570,8 @@ static int __init parse_core(struct device_node *core, int package_id,
 		i++;
 	} while (1);
 
+	max_smt_thread_num = max_t(unsigned int, max_smt_thread_num, i);
+
 	cpu = get_cpu_for_node(core);
 	if (cpu >= 0) {
 		if (!leaf) {
@@ -677,6 +684,17 @@ static int __init parse_socket(struct device_node *socket)
 	if (!has_socket)
 		ret = parse_cluster(socket, 0, -1, 0);
 
+	/*
+	 * Reset the max_smt_thread_num to 1 on failure. Since on failure
+	 * we need to notify the framework the SMT is not supported, but
+	 * max_smt_thread_num can be initialized to the SMT thread number
+	 * of the cores which are successfully parsed.
+	 */
+	if (ret)
+		max_smt_thread_num = 1;
+
+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+
 	return ret;
 }
 
-- 
2.24.0


