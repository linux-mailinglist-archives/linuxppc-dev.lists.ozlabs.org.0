Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D0E9950
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 10:39:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4733M24mPBzF3w8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 20:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4733Jx4jb1zF3j0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 20:37:35 +1100 (AEDT)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F2C7BA0BD3193CAEC5F1;
 Wed, 30 Oct 2019 17:37:28 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Wed, 30 Oct 2019 17:37:23 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
 <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
 <mattst88@gmail.com>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <mpe@ellerman.id.au>, <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
 <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <davem@davemloft.net>, <ralf@linux-mips.org>, <paul.burton@mips.com>,
 <jhogan@kernel.org>, <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>
Subject: [PATCH v7] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Wed, 30 Oct 2019 17:34:28 +0800
Message-ID: <1572428068-180880-1-git-send-email-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
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
Cc: linux-sh@vger.kernel.org, peterz@infradead.org, linux-pci@vger.kernel.org,
 dave.hansen@linux.intel.com, linux-mips@vger.kernel.org,
 mwb@linux.vnet.ibm.com, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, rppt@linux.ibm.com,
 linux-acpi@vger.kernel.org, dledford@redhat.com, jeffrey.t.kirsher@intel.com,
 naveen.n.rao@linux.vnet.ibm.com, lenb@kernel.org, len.brown@intel.com,
 anshuman.khandual@arm.com, gregkh@linuxfoundation.org, cai@lca.pw,
 luto@kernel.org, bhelgaas@google.com, tglx@linutronix.de, mhocko@kernel.org,
 linux-arm-kernel@lists.infradead.org, axboe@kernel.dk, robin.murphy@arm.com,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, tbogendoerfer@suse.de,
 linux-alpha@vger.kernel.org, rafael@kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When passing the return value of dev_to_node() to cpumask_of_node()
without checking if the device's node id is NUMA_NO_NODE, there is
global-out-of-bounds detected by KASAN.

From the discussion [1], NUMA_NO_NODE really means no node affinity,
which also means all cpus should be usable. So the cpumask_of_node()
should always return all cpus online when user passes the node id as
NUMA_NO_NODE, just like similar semantic that page allocator handles
NUMA_NO_NODE.

But we cannot really copy the page allocator logic. Simply because the
page allocator doesn't enforce the near node affinity. It just picks it
up as a preferred node but then it is free to fallback to any other numa
node. This is not the case here and node_to_cpumask_map will only restrict
to the particular node's cpus which would have really non deterministic
behavior depending on where the code is executed. So in fact we really
want to return cpu_online_mask for NUMA_NO_NODE.

Also there is a debugging version of node_to_cpumask_map() for x86 and
arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().

[1] https://lkml.org/lkml/2019/9/11/66
Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
Suggested-by: Michal Hocko <mhocko@kernel.org>
Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: Paul Burton <paul.burton@mips.com> # MIPS bits
---
V7: replace -1 with NUMA_NO_NODE for mips ip27 as suggested by Paul.
V6: Drop the cpu_all_mask -> cpu_online_mask change for it seems a
    little controversial, may need deeper investigation, and rebased
    on the latest linux-next.
V5: Drop unsigned "fix" change for x86/arm64, and change comment log
    according to Michal's comment.
V4: Have all these changes in a single patch.
V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
    for NUMA_NO_NODE case, and change the commit log to better justify
    the change.
V2: make the node id checking change to other arches too.
---
 arch/arm64/include/asm/numa.h                    | 3 +++
 arch/arm64/mm/numa.c                             | 3 +++
 arch/mips/include/asm/mach-ip27/topology.h       | 2 +-
 arch/mips/include/asm/mach-loongson64/topology.h | 4 +++-
 arch/s390/include/asm/topology.h                 | 3 +++
 arch/x86/include/asm/topology.h                  | 3 +++
 arch/x86/mm/numa.c                               | 3 +++
 7 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/numa.h b/arch/arm64/include/asm/numa.h
index 626ad01..c8a4b31 100644
--- a/arch/arm64/include/asm/numa.h
+++ b/arch/arm64/include/asm/numa.h
@@ -25,6 +25,9 @@ const struct cpumask *cpumask_of_node(int node);
 /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
 static inline const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	return node_to_cpumask_map[node];
 }
 #endif
diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 4decf16..5ae7eea 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -46,6 +46,9 @@ EXPORT_SYMBOL(node_to_cpumask_map);
  */
 const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	if (WARN_ON(node >= nr_node_ids))
 		return cpu_none_mask;
 
diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
index 965f079..db293cf 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -15,7 +15,7 @@ struct cpuinfo_ip27 {
 extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
 
 #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
-#define cpumask_of_node(node)	((node) == -1 ?				\
+#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
 				 cpu_all_mask :				\
 				 &hub_data(node)->h_cpus)
 struct pci_bus;
diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
index 7ff819a..e78daa6 100644
--- a/arch/mips/include/asm/mach-loongson64/topology.h
+++ b/arch/mips/include/asm/mach-loongson64/topology.h
@@ -5,7 +5,9 @@
 #ifdef CONFIG_NUMA
 
 #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
-#define cpumask_of_node(node)	(&__node_data[(node)]->cpumask)
+#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
+				 cpu_online_mask :			\
+				 &__node_data[(node)]->cpumask)
 
 struct pci_bus;
 extern int pcibus_to_node(struct pci_bus *);
diff --git a/arch/s390/include/asm/topology.h b/arch/s390/include/asm/topology.h
index cca406f..1bd2e73 100644
--- a/arch/s390/include/asm/topology.h
+++ b/arch/s390/include/asm/topology.h
@@ -78,6 +78,9 @@ static inline int cpu_to_node(int cpu)
 #define cpumask_of_node cpumask_of_node
 static inline const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	return &node_to_cpumask_map[node];
 }
 
diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 4b14d23..7fa82e1 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -69,6 +69,9 @@ extern const struct cpumask *cpumask_of_node(int node);
 /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
 static inline const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	return node_to_cpumask_map[node];
 }
 #endif
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 4123100e..9859acb 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -861,6 +861,9 @@ void numa_remove_cpu(int cpu)
  */
 const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	if ((unsigned)node >= nr_node_ids) {
 		printk(KERN_WARNING
 			"cpumask_of_node(%d): (unsigned)node >= nr_node_ids(%u)\n",
-- 
2.8.1

