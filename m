Return-Path: <linuxppc-dev+bounces-3210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C349E9C8C94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:12:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq2Cm4bS8z2xvh;
	Fri, 15 Nov 2024 01:12:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731593540;
	cv=none; b=ej90w+IFoGPoQuxujaFr8+8dfdJmPVc/y7PkomtS0JOHDcfPZubpvEb7MGCa39Baeowx5OOFecPFOHgciQioUQ1RNSVS9MtT1aHP+YDNy44w7s/te8W7r611nJY3lxqbLX7aroRyXj0F/MTJuEkCjBmdyyZOJ9ZP4SXDlwBqgh6x2Vf3aky8exXYvXgiVegg/F05+N0d1HCxyvCo5+jMrKAyIpCPGdRwS7uPcF+9k0oJTdhTyv9RSklJHP96UQBZnJLF4RXNfxPidlkz4rJVqkpADdU2BZi9CPrFDTdvnJlmFeXUGjXVMFbcAczTKHgqyOUUFykpgClgAgjIiwlsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731593540; c=relaxed/relaxed;
	bh=tPdVNFNydRkGjxrKLLidVYIO9BYOAKsV1uCBKmqE/m4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dA7F0YjaaVFI705B3GSyAfmAvyIl7ZcPRyWKrKZIPiC2A4ns+Kai7r9tG07TYjUn5WCeR3ps/PYDEJwSWQwdev9UdHeYn5mzRPEt+FSF+VWfErUI3lrNiBK3fMNkHRsm6Hb3bGKSd1ZlfkEzi0kYBIPCzn4YxzqvTt51TiOPPDRnIPJgNRfDuNJvlgidVoHw0i2slK5AX0tiVAqnhtpYiry0iwROfnjsoa98vIZFZtwPmXBQhU5U6GB9Hu1QmK9d0zLsGNMGRAzUVO0rHuB09qDbt9A/31Vy2M3E2rDBltZsN5/Pz9ceA8GG+7CearPl6WpmTkUjAPsaBrngRt5CNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq2Cj5RJTz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:12:15 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xq2B432T7z21l8v;
	Thu, 14 Nov 2024 22:10:52 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 2DDBF1A016C;
	Thu, 14 Nov 2024 22:12:08 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 14 Nov 2024 22:12:07 +0800
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
Subject: [PATCH v9 2/4] arch_topology: Support SMT control for OF based system
Date: Thu, 14 Nov 2024 22:11:25 +0800
Message-ID: <20241114141127.23232-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241114141127.23232-1-yangyicong@huawei.com>
References: <20241114141127.23232-1-yangyicong@huawei.com>
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
index 3ebe77566788..31e0291ee660 100644
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
+/* Maximum SMT thread number detected used to enable the SMT control */
+static unsigned int max_smt_thread_num;
+
 /*
  * This function returns the logic cpu number of the node.
  * There are basically three kinds of return values:
@@ -565,6 +570,17 @@ static int __init parse_core(struct device_node *core, int package_id,
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
@@ -677,6 +693,14 @@ static int __init parse_socket(struct device_node *socket)
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


