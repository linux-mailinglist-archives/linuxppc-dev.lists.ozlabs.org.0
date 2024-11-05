Return-Path: <linuxppc-dev+bounces-2868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3EC9BC93D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 10:33:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjNS274cTz2yVd;
	Tue,  5 Nov 2024 20:33:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730799202;
	cv=none; b=P2CJdZAobjAXiWJ5rHMq6b9yYSzuq/2z+oQiqfFhD5h0LTjBbZfhQ7liK6nwHESO9Sx/iGdHK5//VVk+m6lvKKqikCRBpMZqXryYPT3lllEKLbJByI6CGl6wBASfWiwPiay3XSaiesZElNSAdzwLhFaBLTNFUBquKL51MKxJlPi2sdUhdk85ZiPdT4qCYalWO1PK1MSvOuTSOa9PwcdMwqbtUU3Im64NW163VBTq2AnqhoFF2WgsUo2wfQevxuuvXllMvGTBkEiDDxHFmwmN5rIS5yRVkYRMZvwiLyh62GH/Z7fH/hL5HuNWHs//iXWA4bnCRLJ1xEy+itSgtYP7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730799202; c=relaxed/relaxed;
	bh=eaOEdiM8vn2ERNOOG3NcZYUWze94S3D9lG0o1BiU8uE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KegYcP1CtGQ+2kgHt/fgDqmpPf2XdIJBwYOS5V3u0++C5jbCsEBaMXfW8X7qlfKMIM83pY68Z4pyVsVYM9LjS1IV9zjIIF2+Rp0CsBlJ3fFA9BqmXpcy9h7t9oAqlDANLBByr0WBMefd0hWFzAHHs9I/3vm/NkwUW+FLu9heo+vKvWlkcBtvtZrHa8jE1UHFlmdzJm8F3WvNIj5lG6k1P+gNfY07JUTOaGfB87TkKxBbluJfpmYV2hW6VEL5URt22Lrt8MPXKmA5rsz+tCRiMGSCU5f1FZ9wx73zMqQqtRygPvsAZ8Y87ppTtt3IJsTMj5b94rPMtF2KAXHQnGE03w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjNS01nSdz2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 20:33:17 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XjNPt0x2fz1SF2H;
	Tue,  5 Nov 2024 17:31:30 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 69BE6140361;
	Tue,  5 Nov 2024 17:33:10 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 5 Nov 2024 17:33:09 +0800
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
Subject: [PATCH v8 1/4] cpu/SMT: Provide a default topology_is_primary_thread()
Date: Tue, 5 Nov 2024 17:32:34 +0800
Message-ID: <20241105093237.63565-2-yangyicong@huawei.com>
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
index aef70336d624..3a7c18851016 100644
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
index 52f5850730b3..7131e47876d6 100644
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
+	 * The sibling cpumask of a offline CPU contains always the CPU
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


