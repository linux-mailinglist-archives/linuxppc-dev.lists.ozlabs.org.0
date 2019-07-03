Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3205EA45
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:20:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f7CS282KzDqSs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 03:20:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f6sZ2jyhzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:04:34 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63H2R0U185810
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 3 Jul 2019 13:04:32 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tgy97asxe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 13:04:32 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 3 Jul 2019 18:04:30 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:04:27 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x63H4EMF27787682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:04:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74C9BAE053;
 Wed,  3 Jul 2019 17:04:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE922AE055;
 Wed,  3 Jul 2019 17:04:23 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.84.138])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:04:23 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 7/9] powerpc/pseries: Provide vcpu dispatch statistics
Date: Wed,  3 Jul 2019 22:34:00 +0530
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070317-0028-0000-0000-000003800C72
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0029-0000-0000-000024404C47
Message-Id: <0f204575e0d6dbc752e171dda7a369684f6fd7c9.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030207
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mingming Cao <mingming.cao@ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For Shared Processor LPARs, the POWER Hypervisor maintains a relatively
static mapping of the LPAR processors (vcpus) to physical processor
chips (representing the "home" node) and tries to always dispatch vcpus
on their associated physical processor chip. However, under certain
scenarios, vcpus may be dispatched on a different processor chip (away
from its home node). The actual physical processor number on which a
certain vcpu is dispatched is available to the guest in the
'processor_id' field of each DTL entry.

The guest can discover the home node of each vcpu through the
H_HOME_NODE_ASSOCIATIVITY(flags=1) hcall. The guest can also discover
the associativity of physical processors, as represented in the DTL
entry, through the H_HOME_NODE_ASSOCIATIVITY(flags=2) hcall.

These can then be compared to determine if the vcpu was dispatched on
its home node or not. If the vcpu was not dispatched on the home node,
it is possible to determine if the vcpu was dispatched in a different
chip, socket or drawer.

Introduce a procfs file /proc/powerpc/vcpudispatch_stats that can be
used to obtain these statistics. Writing '1' to this file enables
collecting the statistics, while writing '0' disables the statistics.
The statistics themselves are available by reading the procfs file. By
default, the DTLB log for each vcpu is processed 50 times a second so as
not to miss any entries. This processing frequency can be changed
through /proc/powerpc/vcpudispatch_stats_freq.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/topology.h   |   6 +
 arch/powerpc/mm/numa.c                |  16 +
 arch/powerpc/platforms/pseries/lpar.c | 525 +++++++++++++++++++++++++-
 3 files changed, 545 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index f85e2b01c3df..2f7e1ea5089e 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -35,6 +35,7 @@ static inline int pcibus_to_node(struct pci_bus *bus)
 				 cpu_all_mask :				\
 				 cpumask_of_node(pcibus_to_node(bus)))
 
+extern int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
 extern int __node_distance(int, int);
 #define node_distance(a, b) __node_distance(a, b)
 
@@ -84,6 +85,11 @@ static inline int numa_update_cpu_topology(bool cpus_locked)
 
 static inline void update_numa_cpu_lookup_table(unsigned int cpu, int node) {}
 
+static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+{
+	return 0;
+}
+
 #endif /* CONFIG_NUMA */
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 77f673717362..946dda2470a8 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -163,6 +163,22 @@ static void unmap_cpu_from_node(unsigned long cpu)
 }
 #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
 
+int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+{
+	int dist = 0;
+
+	int i, index;
+
+	for (i = 0; i < distance_ref_points_depth; i++) {
+		index = be32_to_cpu(distance_ref_points[i]);
+		if (cpu1_assoc[index] == cpu2_assoc[index])
+			break;
+		dist++;
+	}
+
+	return dist;
+}
+
 /* must hold reference to node during call */
 static const __be32 *of_get_associativity(struct device_node *dev)
 {
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 1e105a3a9f83..951a3d755190 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -17,6 +17,10 @@
 #include <linux/jump_label.h>
 #include <linux/delay.h>
 #include <linux/stop_machine.h>
+#include <linux/spinlock.h>
+#include <linux/cpuhotplug.h>
+#include <linux/workqueue.h>
+#include <linux/proc_fs.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
@@ -52,6 +56,12 @@ EXPORT_SYMBOL(plpar_hcall);
 EXPORT_SYMBOL(plpar_hcall9);
 EXPORT_SYMBOL(plpar_hcall_norets);
 
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+static u8 dtl_mask = DTL_LOG_PREEMPT;
+#else
+static u8 dtl_mask;
+#endif
+
 void alloc_dtl_buffers(void)
 {
 	int cpu;
@@ -60,11 +70,15 @@ void alloc_dtl_buffers(void)
 
 	for_each_possible_cpu(cpu) {
 		pp = paca_ptrs[cpu];
+		if (pp->dispatch_log)
+			continue;
 		dtl = kmem_cache_alloc(dtl_cache, GFP_KERNEL);
 		if (!dtl) {
 			pr_warn("Failed to allocate dispatch trace log for cpu %d\n",
 				cpu);
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 			pr_warn("Stolen time statistics will be unreliable\n");
+#endif
 			break;
 		}
 
@@ -84,7 +98,7 @@ void register_dtl_buffer(int cpu)
 
 	pp = paca_ptrs[cpu];
 	dtl = pp->dispatch_log;
-	if (dtl) {
+	if (dtl && dtl_mask) {
 		pp->dtl_ridx = 0;
 		pp->dtl_curr = dtl;
 		lppaca_of(cpu).dtl_idx = 0;
@@ -95,12 +109,519 @@ void register_dtl_buffer(int cpu)
 		if (ret)
 			pr_err("WARNING: DTL registration of cpu %d (hw %d) "
 			       "failed with %ld\n", cpu, hwcpu, ret);
-		lppaca_of(cpu).dtl_enable_mask = DTL_LOG_PREEMPT;
+		lppaca_of(cpu).dtl_enable_mask = dtl_mask;
 	}
 }
 
 #ifdef CONFIG_PPC_SPLPAR
+struct dtl_worker {
+	struct delayed_work work;
+	int cpu;
+};
+
+struct vcpu_dispatch_data {
+	int last_disp_cpu;
+
+	int total_disp;
+
+	int same_cpu_disp;
+	int same_chip_disp;
+	int diff_chip_disp;
+	int far_chip_disp;
+
+	int numa_home_disp;
+	int numa_remote_disp;
+	int numa_far_disp;
+};
+
+/*
+ * This represents the number of cpus in the hypervisor. Since there is no
+ * architected way to discover the number of processors in the host, we
+ * provision for dealing with NR_CPUS. This is currently 2048 by default, and
+ * is sufficient for our purposes. This will need to be tweaked if
+ * CONFIG_NR_CPUS is changed.
+ */
+#define NR_CPUS_H	NR_CPUS
+
 DEFINE_RWLOCK(dtl_access_lock);
+static DEFINE_PER_CPU(struct vcpu_dispatch_data, vcpu_disp_data);
+static DEFINE_PER_CPU(u64, dtl_entry_ridx);
+static DEFINE_PER_CPU(struct dtl_worker, dtl_workers);
+static enum cpuhp_state dtl_worker_state;
+static DEFINE_MUTEX(dtl_enable_mutex);
+static int vcpudispatch_stats_on __read_mostly;
+static int vcpudispatch_stats_freq = 50;
+static __be32 *vcpu_associativity, *pcpu_associativity;
+
+
+static void free_dtl_buffers(void)
+{
+#ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+	int cpu;
+	struct paca_struct *pp;
+
+	for_each_possible_cpu(cpu) {
+		pp = paca_ptrs[cpu];
+		if (!pp->dispatch_log)
+			continue;
+		kmem_cache_free(dtl_cache, pp->dispatch_log);
+		pp->dtl_ridx = 0;
+		pp->dispatch_log = 0;
+		pp->dispatch_log_end = 0;
+		pp->dtl_curr = 0;
+	}
+#endif
+}
+
+static int init_cpu_associativity(void)
+{
+	vcpu_associativity = kcalloc(num_possible_cpus() / threads_per_core,
+			VPHN_ASSOC_BUFSIZE * sizeof(__be32), GFP_KERNEL);
+	pcpu_associativity = kcalloc(NR_CPUS_H / threads_per_core,
+			VPHN_ASSOC_BUFSIZE * sizeof(__be32), GFP_KERNEL);
+
+	if (!vcpu_associativity || !pcpu_associativity) {
+		pr_err("error allocating memory for associativity information\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void destroy_cpu_associativity(void)
+{
+	kfree(vcpu_associativity);
+	kfree(pcpu_associativity);
+	vcpu_associativity = pcpu_associativity = 0;
+}
+
+static __be32 *__get_cpu_associativity(int cpu, __be32 *cpu_assoc, int flag)
+{
+	__be32 *assoc;
+	int rc = 0;
+
+	assoc = &cpu_assoc[(int)(cpu / threads_per_core) * VPHN_ASSOC_BUFSIZE];
+	if (!assoc[0]) {
+		rc = hcall_vphn(cpu, flag, &assoc[0]);
+		if (rc)
+			return NULL;
+	}
+
+	return assoc;
+}
+
+static __be32 *get_pcpu_associativity(int cpu)
+{
+	return __get_cpu_associativity(cpu, pcpu_associativity, VPHN_FLAG_PCPU);
+}
+
+static __be32 *get_vcpu_associativity(int cpu)
+{
+	return __get_cpu_associativity(cpu, vcpu_associativity, VPHN_FLAG_VCPU);
+}
+
+static int cpu_relative_dispatch_distance(int last_disp_cpu, int cur_disp_cpu)
+{
+	__be32 *last_disp_cpu_assoc, *cur_disp_cpu_assoc;
+
+	if (last_disp_cpu >= NR_CPUS_H || cur_disp_cpu >= NR_CPUS_H)
+		return -EINVAL;
+
+	last_disp_cpu_assoc = get_pcpu_associativity(last_disp_cpu);
+	cur_disp_cpu_assoc = get_pcpu_associativity(cur_disp_cpu);
+
+	if (!last_disp_cpu_assoc || !cur_disp_cpu_assoc)
+		return -EIO;
+
+	return cpu_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
+}
+
+static int cpu_home_node_dispatch_distance(int disp_cpu)
+{
+	__be32 *disp_cpu_assoc, *vcpu_assoc;
+	int vcpu_id = smp_processor_id();
+
+	if (disp_cpu >= NR_CPUS_H) {
+		pr_debug_ratelimited("vcpu dispatch cpu %d > %d\n",
+						disp_cpu, NR_CPUS_H);
+		return -EINVAL;
+	}
+
+	disp_cpu_assoc = get_pcpu_associativity(disp_cpu);
+	vcpu_assoc = get_vcpu_associativity(vcpu_id);
+
+	if (!disp_cpu_assoc || !vcpu_assoc)
+		return -EIO;
+
+	return cpu_distance(disp_cpu_assoc, vcpu_assoc);
+}
+
+static void update_vcpu_disp_stat(int disp_cpu)
+{
+	struct vcpu_dispatch_data *disp;
+	int distance;
+
+	disp = this_cpu_ptr(&vcpu_disp_data);
+	if (disp->last_disp_cpu == -1) {
+		disp->last_disp_cpu = disp_cpu;
+		return;
+	}
+
+	disp->total_disp++;
+
+	if (disp->last_disp_cpu == disp_cpu ||
+		(cpu_first_thread_sibling(disp->last_disp_cpu) ==
+					cpu_first_thread_sibling(disp_cpu)))
+		disp->same_cpu_disp++;
+	else {
+		distance = cpu_relative_dispatch_distance(disp->last_disp_cpu,
+								disp_cpu);
+		if (distance < 0)
+			pr_debug_ratelimited("vcpudispatch_stats: cpu %d: error determining associativity\n",
+					smp_processor_id());
+		else {
+			switch (distance) {
+			case 0:
+				disp->same_chip_disp++;
+				break;
+			case 1:
+				disp->diff_chip_disp++;
+				break;
+			case 2:
+				disp->far_chip_disp++;
+				break;
+			default:
+				pr_debug_ratelimited("vcpudispatch_stats: cpu %d (%d -> %d): unexpected relative dispatch distance %d\n",
+						 smp_processor_id(),
+						 disp->last_disp_cpu,
+						 disp_cpu,
+						 distance);
+			}
+		}
+	}
+
+	distance = cpu_home_node_dispatch_distance(disp_cpu);
+	if (distance < 0)
+		pr_debug_ratelimited("vcpudispatch_stats: cpu %d: error determining associativity\n",
+				smp_processor_id());
+	else {
+		switch (distance) {
+		case 0:
+			disp->numa_home_disp++;
+			break;
+		case 1:
+			disp->numa_remote_disp++;
+			break;
+		case 2:
+			disp->numa_far_disp++;
+			break;
+		default:
+			pr_debug_ratelimited("vcpudispatch_stats: cpu %d on %d: unexpected numa dispatch distance %d\n",
+						 smp_processor_id(),
+						 disp_cpu,
+						 distance);
+		}
+	}
+
+	disp->last_disp_cpu = disp_cpu;
+}
+
+static void process_dtl_buffer(struct work_struct *work)
+{
+	struct dtl_entry dtle;
+	u64 i = __this_cpu_read(dtl_entry_ridx);
+	struct dtl_entry *dtl = local_paca->dispatch_log + (i % N_DISPATCH_LOG);
+	struct dtl_entry *dtl_end = local_paca->dispatch_log_end;
+	struct lppaca *vpa = local_paca->lppaca_ptr;
+	struct dtl_worker *d = container_of(work, struct dtl_worker, work.work);
+
+	if (!local_paca->dispatch_log)
+		return;
+
+	/* if we have been migrated away, we cancel ourself */
+	if (d->cpu != smp_processor_id()) {
+		pr_debug("vcpudispatch_stats: cpu %d worker migrated -- canceling worker\n",
+						smp_processor_id());
+		return;
+	}
+
+	if (i == be64_to_cpu(vpa->dtl_idx))
+		goto out;
+
+	while (i < be64_to_cpu(vpa->dtl_idx)) {
+		dtle = *dtl;
+		barrier();
+		if (i + N_DISPATCH_LOG < be64_to_cpu(vpa->dtl_idx)) {
+			/* buffer has overflowed */
+			pr_debug_ratelimited("vcpudispatch_stats: cpu %d lost %lld DTL samples\n",
+				d->cpu,
+				be64_to_cpu(vpa->dtl_idx) - N_DISPATCH_LOG - i);
+			i = be64_to_cpu(vpa->dtl_idx) - N_DISPATCH_LOG;
+			dtl = local_paca->dispatch_log + (i % N_DISPATCH_LOG);
+			continue;
+		}
+		update_vcpu_disp_stat(be16_to_cpu(dtle.processor_id));
+		++i;
+		++dtl;
+		if (dtl == dtl_end)
+			dtl = local_paca->dispatch_log;
+	}
+
+	__this_cpu_write(dtl_entry_ridx, i);
+
+out:
+	schedule_delayed_work_on(d->cpu, to_delayed_work(work),
+					HZ / vcpudispatch_stats_freq);
+}
+
+static int dtl_worker_online(unsigned int cpu)
+{
+	struct dtl_worker *d = &per_cpu(dtl_workers, cpu);
+
+	memset(d, 0, sizeof(*d));
+	INIT_DELAYED_WORK(&d->work, process_dtl_buffer);
+	d->cpu = cpu;
+
+#ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+	per_cpu(dtl_entry_ridx, cpu) = 0;
+	register_dtl_buffer(cpu);
+#else
+	per_cpu(dtl_entry_ridx, cpu) = be64_to_cpu(lppaca_of(cpu).dtl_idx);
+#endif
+
+	schedule_delayed_work_on(cpu, &d->work, HZ / vcpudispatch_stats_freq);
+	return 0;
+}
+
+static int dtl_worker_offline(unsigned int cpu)
+{
+	struct dtl_worker *d = &per_cpu(dtl_workers, cpu);
+
+	cancel_delayed_work_sync(&d->work);
+
+#ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+	unregister_dtl(get_hard_smp_processor_id(cpu));
+#endif
+
+	return 0;
+}
+
+static void set_global_dtl_mask(u8 mask)
+{
+	int cpu;
+
+	dtl_mask = mask;
+	for_each_present_cpu(cpu)
+		lppaca_of(cpu).dtl_enable_mask = dtl_mask;
+}
+
+static void reset_global_dtl_mask(void)
+{
+	int cpu;
+
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+	dtl_mask = DTL_LOG_PREEMPT;
+#else
+	dtl_mask = 0;
+#endif
+	for_each_present_cpu(cpu)
+		lppaca_of(cpu).dtl_enable_mask = dtl_mask;
+}
+
+static int dtl_worker_enable(void)
+{
+	int rc = 0, state;
+
+	if (!write_trylock(&dtl_access_lock)) {
+		rc = -EBUSY;
+		goto out;
+	}
+
+	set_global_dtl_mask(DTL_LOG_ALL);
+
+	/* Setup dtl buffers and register those */
+	alloc_dtl_buffers();
+
+	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "powerpc/dtl:online",
+					dtl_worker_online, dtl_worker_offline);
+	if (state < 0) {
+		pr_err("vcpudispatch_stats: unable to setup workqueue for DTL processing\n");
+		free_dtl_buffers();
+		reset_global_dtl_mask();
+		write_unlock(&dtl_access_lock);
+		rc = -EINVAL;
+		goto out;
+	}
+	dtl_worker_state = state;
+
+out:
+	return rc;
+}
+
+static void dtl_worker_disable(void)
+{
+	cpuhp_remove_state(dtl_worker_state);
+	free_dtl_buffers();
+	reset_global_dtl_mask();
+	write_unlock(&dtl_access_lock);
+}
+
+static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
+		size_t count, loff_t *ppos)
+{
+	struct vcpu_dispatch_data *disp;
+	int rc, cmd, cpu;
+	char buf[16];
+
+	if (count > 15)
+		return -EINVAL;
+
+	if (copy_from_user(buf, p, count))
+		return -EFAULT;
+
+	buf[count] = 0;
+	rc = kstrtoint(buf, 0, &cmd);
+	if (rc || cmd < 0 || cmd > 1) {
+		pr_err("vcpudispatch_stats: please use 0 to disable or 1 to enable dispatch statistics\n");
+		return rc ? rc : -EINVAL;
+	}
+
+	mutex_lock(&dtl_enable_mutex);
+
+	if ((cmd == 0 && !vcpudispatch_stats_on) ||
+			(cmd == 1 && vcpudispatch_stats_on))
+		goto out;
+
+	if (cmd) {
+		rc = init_cpu_associativity();
+		if (rc)
+			goto out;
+
+		for_each_possible_cpu(cpu) {
+			disp = per_cpu_ptr(&vcpu_disp_data, cpu);
+			memset(disp, 0, sizeof(*disp));
+			disp->last_disp_cpu = -1;
+		}
+
+		rc = dtl_worker_enable();
+		if (rc) {
+			destroy_cpu_associativity();
+			goto out;
+		}
+	} else {
+		dtl_worker_disable();
+		destroy_cpu_associativity();
+	}
+
+	vcpudispatch_stats_on = cmd;
+
+out:
+	mutex_unlock(&dtl_enable_mutex);
+	if (rc)
+		return rc;
+	return count;
+}
+
+static int vcpudispatch_stats_display(struct seq_file *p, void *v)
+{
+	int cpu;
+	struct vcpu_dispatch_data *disp;
+
+	if (!vcpudispatch_stats_on) {
+		seq_puts(p, "off\n");
+		return 0;
+	}
+
+	for_each_online_cpu(cpu) {
+		disp = per_cpu_ptr(&vcpu_disp_data, cpu);
+		seq_printf(p, "cpu%d", cpu);
+		seq_put_decimal_ull(p, " ", disp->total_disp);
+		seq_put_decimal_ull(p, " ", disp->same_cpu_disp);
+		seq_put_decimal_ull(p, " ", disp->same_chip_disp);
+		seq_put_decimal_ull(p, " ", disp->diff_chip_disp);
+		seq_put_decimal_ull(p, " ", disp->far_chip_disp);
+		seq_put_decimal_ull(p, " ", disp->numa_home_disp);
+		seq_put_decimal_ull(p, " ", disp->numa_remote_disp);
+		seq_put_decimal_ull(p, " ", disp->numa_far_disp);
+		seq_puts(p, "\n");
+	}
+
+	return 0;
+}
+
+static int vcpudispatch_stats_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, vcpudispatch_stats_display, NULL);
+}
+
+static const struct file_operations vcpudispatch_stats_proc_ops = {
+	.open		= vcpudispatch_stats_open,
+	.read		= seq_read,
+	.write		= vcpudispatch_stats_write,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static ssize_t vcpudispatch_stats_freq_write(struct file *file,
+		const char __user *p, size_t count, loff_t *ppos)
+{
+	int rc, freq;
+	char buf[16];
+
+	if (count > 15)
+		return -EINVAL;
+
+	if (copy_from_user(buf, p, count))
+		return -EFAULT;
+
+	buf[count] = 0;
+	rc = kstrtoint(buf, 0, &freq);
+	if (rc || freq < 1 || freq > HZ) {
+		pr_err("vcpudispatch_stats_freq: please specify a frequency between 1 and %d\n",
+				HZ);
+		return rc ? rc : -EINVAL;
+	}
+
+	vcpudispatch_stats_freq = freq;
+
+	return count;
+}
+
+static int vcpudispatch_stats_freq_display(struct seq_file *p, void *v)
+{
+	seq_printf(p, "%d\n", vcpudispatch_stats_freq);
+	return 0;
+}
+
+static int vcpudispatch_stats_freq_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, vcpudispatch_stats_freq_display, NULL);
+}
+
+static const struct file_operations vcpudispatch_stats_freq_proc_ops = {
+	.open		= vcpudispatch_stats_freq_open,
+	.read		= seq_read,
+	.write		= vcpudispatch_stats_freq_write,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static int __init vcpudispatch_stats_procfs_init(void)
+{
+	if (!lppaca_shared_proc(get_lppaca()))
+		return 0;
+
+	if (!proc_create("powerpc/vcpudispatch_stats", 0600, NULL,
+					&vcpudispatch_stats_proc_ops))
+		pr_err("vcpudispatch_stats: error creating procfs file\n");
+	else if (!proc_create("powerpc/vcpudispatch_stats_freq", 0600, NULL,
+					&vcpudispatch_stats_freq_proc_ops))
+		pr_err("vcpudispatch_stats_freq: error creating procfs file\n");
+
+	return 0;
+}
+
+machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
 #endif /* CONFIG_PPC_SPLPAR */
 
 void vpa_init(int cpu)
-- 
2.22.0

