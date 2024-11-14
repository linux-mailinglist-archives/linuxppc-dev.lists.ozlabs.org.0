Return-Path: <linuxppc-dev+bounces-3208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB099C8C90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:12:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq2Cl5Sq9z2yxL;
	Fri, 15 Nov 2024 01:12:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731593539;
	cv=none; b=WsuaUZg8QUuNILPSf/9l0TQQBJloucf+FJkBOnlw+DU1nqPsTKeRdy46he5oAbVq7BaJ79DSymawLx0aoB6DQNLKAMUMFCk8EtEjXhzYYeie4i79aLTWQJI9N0hhU/TYlTy1TOk3+GCzMyQkoqnW2X9yVrTvomreJAnffXRDbiJQUVmyvFP9T6aSwCZ71uoCcbWelWpaELe/rIdhKe8/A4T4AVbXlz7do/1Wh7tiqrTiV431/mcvZAYh2DKRErXnHwWJB0NO4nPRVNFl2u941WSrgo00WXfOldluj3AhOvtVk51tG7i/LnkImFke5aBXX9fx0o94o+e9NJLYKWnLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731593539; c=relaxed/relaxed;
	bh=Tp6HHXvFzZMIMq2zkDy+IUSxS8v5sPP/mOnIb7odT7k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WX+B8JLpOzQHfRs9kqOH9htyc1Xr23pkAYHQSDtYmTBQ+XKx8mp4Vm/R24oL2lolDbiE4FiCbkfuIWahdDDBthZVBZLQMdPaPJ7D0peE7TrUAHcmdZheapdN2LzuuzJIwbV8fNgW+Z7LfN1NLNHbveharCKyYq65zcATZWe4Bk1mNcIF5wABrup6KSTx7hXnTiKxRHkG77c9htc38e8FcNueVHyBCZii7AlcM4EmAESbUF/XxURPlqXF3O2drGbWOqqL/tT4hllH0FKxA3fRA1iZlDfDHBQzaVO20yFp+9qKoQ5+mORd7PaBa1m0aHTqTb5gxF5QglK7UbCZhvoamg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq2Cj5Vbrz2ysh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:12:16 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xq2Cl0r0Jz1yqBN;
	Thu, 14 Nov 2024 22:12:19 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 5570318002B;
	Thu, 14 Nov 2024 22:12:07 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 14 Nov 2024 22:12:06 +0800
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
Subject: [PATCH v9 1/4] cpu/SMT: Provide a default topology_is_primary_thread()
Date: Thu, 14 Nov 2024 22:11:24 +0800
Message-ID: <20241114141127.23232-2-yangyicong@huawei.com>
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
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Yicong Yang <yangyicong@hisilicon.com>

Currently if architectures want to support HOTPLUG_SMT they need to
provide a topology_is_primary_thread() telling the framework which
thread in the SMT cannot offline. However arm64 doesn't have a
restriction on which thread in the SMT cannot offline, a simplest
choice is that just make 1st thread as the "primary" thread. So
just make this as the default implementation in the framework and
let architectures like x86 that have special primary thread to
override this function (which they've already done).

There's no need to provide a stub function if !CONFIG_SMP or
!CONFIG_HOTPLUG_SMP. In such case the testing CPU is already
the 1st CPU in the SMT so it's always the primary thread.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/powerpc/include/asm/topology.h |  1 +
 arch/x86/include/asm/topology.h     |  2 +-
 include/linux/topology.h            | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 16bacfe8c7a2..da15b5efe807 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -152,6 +152,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
 {
 	return cpu == cpu_first_thread_sibling(cpu);
 }
+#define topology_is_primary_thread topology_is_primary_thread
 
 static inline bool topology_smt_thread_allowed(unsigned int cpu)
 {
diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 92f3664dd933..d84d9b6d8678 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -219,11 +219,11 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
 {
 	return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
 }
+#define topology_is_primary_thread topology_is_primary_thread
 
 #else /* CONFIG_SMP */
 static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
 static inline int topology_max_smt_threads(void) { return 1; }
-static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
 static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
 #endif /* !CONFIG_SMP */
 
diff --git a/include/linux/topology.h b/include/linux/topology.h
index 52f5850730b3..b8e860276518 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -240,6 +240,26 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
 }
 #endif
 
+#ifndef topology_is_primary_thread
+
+#define topology_is_primary_thread topology_is_primary_thread
+
+static inline bool topology_is_primary_thread(unsigned int cpu)
+{
+	/*
+	 * On SMT hotplug the primary thread of the SMT won't be disabled.
+	 * Architectures do have a special primary thread (e.g. x86) need
+	 * to override this function. Otherwise just make the first thread
+	 * in the SMT as the primary thread.
+	 *
+	 * The sibling cpumask of an offline CPU contains always the CPU
+	 * itself.
+	 */
+	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
+}
+
+#endif
+
 static inline const struct cpumask *cpu_cpu_mask(int cpu)
 {
 	return cpumask_of_node(cpu_to_node(cpu));
-- 
2.24.0


