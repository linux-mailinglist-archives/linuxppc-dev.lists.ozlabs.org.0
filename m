Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B965E70FB2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 18:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRGBC4hLVz3fNR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 02:00:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DLMr4i3/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRG5n1Mxlz3f7j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 01:57:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DLMr4i3/;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRG5n04gkz4x4X;
	Thu, 25 May 2023 01:57:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684943821;
	bh=7FwibG1XWdH1B4bC6IxPJl99Q4FEgoC9M1l3K1JPV6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DLMr4i3/uj6DYrnmLfrM1FkIWGkpP88pu+Q7bbXEH4HcB43Ouz1AgKZliu0D4vfuG
	 lTiVLvxHD4M2Jfrn6ad3DOxBVz6EIoNV4P+cFfc5TpToy/5tXOERx8IhJb4AjYGMUh
	 gFn/eDwknWZXEoyE0du4EgXyYmrpgQl+Im4+UBeeMSL1wJxUtj9mQMITk6V0YrRvfZ
	 qe7QNvjLRXj97h90E70ocknG9xr8DOkwjyLuif4g1WZkbZ9OhdDv97Qa/6cuMZxn45
	 l6BRdrKVuxbxW3mXw2cZgn/2ZsoyT+T9to7dTb6aBBD1TNOMS89W6G4ym6o9j6VUUN
	 REoLKpPFYiLTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/9] cpu/SMT: Create topology_smt_thread_allowed()
Date: Thu, 25 May 2023 01:56:26 +1000
Message-Id: <20230524155630.794584-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524155630.794584-1-mpe@ellerman.id.au>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A subsequent patch will enable partial SMT states, ie. when not all SMT
threads are brought online.

To support that, add an arch helper which checks whether a given CPU is
allowed to be brought online depending on how many SMT threads are
currently enabled.

Call the helper from cpu_smt_enable(), and cpu_smt_allowed() when SMT is
enabled, to check if the particular thread should be onlined. Notably,
also call it from cpu_smt_disable() if CPU_SMT_ENABLED, to allow
offlining some threads to move from a higher to lower number of threads
online.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/x86/include/asm/topology.h |  2 ++
 arch/x86/kernel/smpboot.c       | 15 +++++++++++++++
 kernel/cpu.c                    | 10 +++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 197ec2589f5d..c6245ea6e589 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -145,6 +145,7 @@ int topology_phys_to_logical_die(unsigned int die, unsigned int cpu);
 bool topology_is_primary_thread(unsigned int cpu);
 bool topology_smt_supported(void);
 bool topology_smt_threads_supported(unsigned int threads);
+bool topology_smt_thread_allowed(unsigned int cpu);
 #else
 #define topology_max_packages()			(1)
 static inline int
@@ -159,6 +160,7 @@ static inline int topology_max_smt_threads(void) { return 1; }
 static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
 static inline bool topology_smt_supported(void) { return false; }
 static inline bool topology_smt_threads_supported(unsigned int threads) { return false; }
+static inline bool topology_smt_thread_allowed(unsigned int cpu) { return false; }
 #endif
 
 static inline void arch_fix_phys_package_id(int num, u32 slot)
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index c7ba62beae3e..244b4df40600 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -298,6 +298,21 @@ bool topology_smt_threads_supported(unsigned int threads)
 	return threads == 1 || threads == smp_num_siblings;
 }
 
+/**
+ * topology_smt_thread_allowed - When enabling SMT check whether this particular
+ *				 CPU thread is allowed to be brought online.
+ * @cpu:	CPU to check
+ */
+bool topology_smt_thread_allowed(unsigned int cpu)
+{
+	/*
+	 * No extra logic s required here to support different thread values
+	 * because threads will always == 1 or smp_num_siblings because of
+	 * topology_smt_threads_supported().
+	 */
+	return true;
+}
+
 /**
  * topology_phys_to_logical_pkg - Map a physical package id to a logical
  *
diff --git a/kernel/cpu.c b/kernel/cpu.c
index a08dd8f93675..72b9a03a4fef 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -458,7 +458,7 @@ early_param("nosmt", smt_cmdline_disable);
 
 static inline bool cpu_smt_allowed(unsigned int cpu)
 {
-	if (cpu_smt_control == CPU_SMT_ENABLED)
+	if (cpu_smt_control == CPU_SMT_ENABLED && topology_smt_thread_allowed(cpu))
 		return true;
 
 	if (topology_is_primary_thread(cpu))
@@ -2273,6 +2273,12 @@ int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval)
 	for_each_online_cpu(cpu) {
 		if (topology_is_primary_thread(cpu))
 			continue;
+		/*
+		 * Disable can be called with CPU_SMT_ENABLED when changing
+		 * from a higher to lower number of SMT threads per core.
+		 */
+		if (ctrlval == CPU_SMT_ENABLED && topology_smt_thread_allowed(cpu))
+			continue;
 		ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
 		if (ret)
 			break;
@@ -2307,6 +2313,8 @@ int cpuhp_smt_enable(void)
 		/* Skip online CPUs and CPUs on offline nodes */
 		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
 			continue;
+		if (!topology_smt_thread_allowed(cpu))
+			continue;
 		ret = _cpu_up(cpu, 0, CPUHP_ONLINE);
 		if (ret)
 			break;
-- 
2.40.1

