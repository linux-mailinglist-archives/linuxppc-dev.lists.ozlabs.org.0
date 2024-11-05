Return-Path: <linuxppc-dev+bounces-2870-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3089BC940
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 10:33:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjNSW6M3jz2ydW;
	Tue,  5 Nov 2024 20:33:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730799227;
	cv=none; b=R+ElbNxAdSY8TSY39n59XdbMiKctewtUCBwQ5jgLAs7LfGHQoDwKqUZVb8uWkAT6eIGKiqDLVOVVRnc1kikwJ59kP1PFiBZX7hrvw5eEA0lQA2Dw3lDan5NtKkasqBY8uC+5OkqDbfgsbHXH0K0sE1hwXn/KQCnQfMVT2gDepVEYeMrhGpMGkkOnpKZPjBs3BOp3RH1yNl/IYQ4PzAIEuvMM2QwxMWhjyEzbPwtIhIwoDWgBtFeVXqChpiTlgpKZRJOaucvTSPFycrDkv2gXzPhuuLXyO9u/M/ndDtRGyEvV2fT9bAX4g/Erw39/dMQLqc3BvXVc0Xc9+zTpa20yTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730799227; c=relaxed/relaxed;
	bh=uYynWeIqGbf3qbAfwEFwOheYS274s3APdK2N0xWvl/8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFWZedQTRjHlqqzDkh+1sGtgeazxV5qyA4E9napWCMwiphSQycoWPvjsRubTHPtB7pW2S576/zBDQTAJW0rDwJpWeJnet6MmBAAb6DQe6m53eiSM5txrQulQWlieKSzcdIDnOMbFtAJ4rZEjXwkqRMLsUGd28H40mmWQ5sdbdM7tStDaulZ6hRo+pC5ypZr+trmVz6Kcy/RUJ3H2nxjeH2N3hSEHQU2KJtlUDGnbn8FawVcATQPPqteJ44NkfwpnvxrSLbQ/hnqzTjha1F6wkTr5OLq1Ubm7vAA3cl5P6CkwNTar+949g+bxCAKBG/rFnadrI6Nr/eTOX2HUIFMqtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjNSV2crzz2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 20:33:46 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XjNP825WLz10Pf8;
	Tue,  5 Nov 2024 17:30:52 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 2AFE914038F;
	Tue,  5 Nov 2024 17:33:11 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 5 Nov 2024 17:33:10 +0800
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
	<guohanjun@huawei.com>
Subject: [PATCH v8 2/4] arch_topology: Support SMT control for OF based system
Date: Tue, 5 Nov 2024 17:32:35 +0800
Message-ID: <20241105093237.63565-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241105093237.63565-1-yangyicong@huawei.com>
References: <20241105093237.63565-1-yangyicong@huawei.com>
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
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Yicong Yang <yangyicong@hisilicon.com>

On building the topology from the devicetree, we've already
gotten the SMT thread number of each core. Update the largest
SMT thread number and enable the SMT control by the end of
topology parsing.

The core's SMT control provides two interface to the users [1]:
1) enable/disable SMT by writing on/off
2) enable/disable SMT by writing thread number 1/max_thread_number

If a system have more than one SMT thread number the 2) may
not handle it well, since there're multiple thread numbers in the
system and 2) only accept 1/max_thread_number. So issue a warning
to notify the users if such system detected.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/base/arch_topology.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 75fcb75d5515..e2c8e6d92414 100644
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
@@ -502,6 +503,10 @@ core_initcall(free_raw_capacity);
 #endif
 
 #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+
+/* Maximum SMT thread number detected used to enable the SMT control */
+static unsigned int max_smt_thread_num;
+
 /*
  * This function returns the logic cpu number of the node.
  * There are basically three kinds of return values:
@@ -561,6 +566,17 @@ static int __init parse_core(struct device_node *core, int package_id,
 		i++;
 	} while (1);
 
+	/*
+	 * If max_smt_thread_num has been initialized and doesn't match
+	 * the thread number of this entry, then the system has
+	 * heterogeneous SMT topology.
+	 */
+	if (max_smt_thread_num && max_smt_thread_num != i)
+		pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
+
+	if (max_smt_thread_num < i)
+		max_smt_thread_num = i;
+
 	cpu = get_cpu_for_node(core);
 	if (cpu >= 0) {
 		if (!leaf) {
@@ -673,6 +689,14 @@ static int __init parse_socket(struct device_node *socket)
 	if (!has_socket)
 		ret = parse_cluster(socket, 0, -1, 0);
 
+	/*
+	 * Notify the CPU framework of the SMT support. A thread number of 1
+	 * can be handled by the framework so we don't need to check
+	 * max_smt_thread_num to see we support SMT or not.
+	 */
+	if (max_smt_thread_num)
+		cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+
 	return ret;
 }
 
-- 
2.24.0


