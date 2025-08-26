Return-Path: <linuxppc-dev+bounces-11315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0CDB359E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 12:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB3RH0LShz3dS9;
	Tue, 26 Aug 2025 20:14:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756203242;
	cv=none; b=Kt4lsnZaocBsLeE77y/2uoyJtAIOQVEK1Sdg9cKv1SwQUnnsmhJgr2QADuPBdjoiaJPl51D/OtOSW/kDIl0pcPgs6gP4Kscto+pPh1KzGG8AZAnreL5m2uywAnaV0JEWi2Uxz4ClbMNc7dtTUKiQ2tyfkbBOHL/wMxmLKglZM86izaLK5m5NqHVHJ+9HSd3fzKDjf+rb/gKtWdb2EoJD9Xo1D0iY8w8QHmno8n4r6j5ifuZoezTuc9/Vr0oE5Ou4TsKnGs42VHYv1RHBuSJR+1J8OFgqPa6bGne9SkKu8bXMpVmqFqc8zX/Vui9SDfO5j4HEvcXv6GytkAcknlqySw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756203242; c=relaxed/relaxed;
	bh=za2zxrt2zji2QUURdpUEuG/5gEM/xMgnyO1q9m1EUJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T61AYXqloJEwXGP/25agvmV08YfVhPrjphFAcOVBdKqE+gQTMXdTPGJxVcfeI3y5pQjSQkwA3xAhd3fi7gh+UFc4MgxvicEyXdwBa0oP8IJqbKrvx1jJqjaEJj+jKpmYKMnww6R51WLVhqHmcGisjkRLx98GaL0wONv4tI+5wX/3XVsm0cSuZoWihYeb03PL+iKJQMYjMncLLIflor713IbPlA1s44zQs2Ajtuz7Gd0da7nqE6AGWBUx35ay+vfZxWxCRhveVbbGJf779QpWWo3x2mSSsMut5BcqF6P9IGlsVTVcE70JKZ4eYxadVBOTMd249XrPoC/p/FQ42An/VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZLtc+naJ; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZLtc+naJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB3RG00Tlz3dRQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 20:14:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=za2zxrt2zji2QUURdpUEuG/5gEM/xMgnyO1q9m1EUJE=; b=ZLtc+naJjT+TgN7VmDiS+QUrja
	DPcgOP5Bax7YDsTZZBwFkBVySxGNVLYYxTbZPJ4o5KOGsDC++aUM4Mar0DTkYFny5VA6o1IrdqGFo
	z/MOPCNtnKiSmPlQnfhYOlliKnLgHvyBHm09TThb/wApc7JC6/ugh0w3ZuQE3q9uHxLPUsqhLrX6p
	WHU7WHGW6VcpbOzo1aLO2KEKl2WR0zEbwPuraFqX3pbylMU2j+3kKR8M74acMu6tWd8DmAxqU8HSR
	8MSwHysQFFExHO0Jv4lpWScueQfjp5xX6eN4gS9DEVmyLJpXQsZpVsX2NMSUBFHYbL1UPefnCzVgE
	jGduk0JQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqgD-00000002C0g-2iQ1;
	Tue, 26 Aug 2025 10:13:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 06DE93002C5; Tue, 26 Aug 2025 12:13:29 +0200 (CEST)
Date: Tue, 26 Aug 2025 12:13:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
	Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v7 0/8] sched/fair: Get rid of sched_domains_curr_level
 hack for tl->cpumask()
Message-ID: <20250826101328.GV4067720@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <b64c820d-084a-40d9-bb4e-82986b9e6482@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b64c820d-084a-40d9-bb4e-82986b9e6482@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 03:35:03PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 8/26/25 9:43 AM, K Prateek Nayak wrote:
> > This version uses Peter's suggestion from [1] as if and incrementally
> > adds cleanup on top to the arch/ bits. I've tested the x86 side but the
> > PowerPC and the s390 bits are only build tested. Review and feedback is
> > greatly appreciated.
> > 
> > [1] https://lore.kernel.org/lkml/20250825091910.GT3245006@noisy.programming.kicks-ass.net/
> > 
> > Patches are prepared on top of tip:master at commit 4628e5bbca91 ("Merge
> > branch into tip/master: 'x86/tdx'")
> > ---
> > changelog v6..v7:
> > 
> > o Fix the s390 and ppc build errors (Intel test robot)
> > 
> > o Use Peter's diff as is and incrementally do the cleanup on top. The
> >    PowerPC part was slightly more extensive due to the lack of
> >    CONFIG_SCHED_MC in arch/powerpc/Kconfig.
> > 
> > v6: https://lore.kernel.org/lkml/20250825120244.11093-1-kprateek.nayak@amd.com/
> > ---
> > K Prateek Nayak (7):
> >    powerpc/smp: Rename cpu_corgroup_* to cpu_corgrp_*
> >    powerpc/smp: Export cpu_coregroup_mask()
> >    powerpc/smp: Introduce CONFIG_SCHED_MC to guard MC scheduling bits
> >    sched/topology: Unify tl_smt_mask() across core and all arch
> >    sched/topology: Unify tl_cls_mask() across core and x86
> >    sched/topology: Unify tl_mc_mask() across core and all arch
> >    sched/topology: Unify tl_pkg_mask() across core and all arch
> > 
> > Peter Zijlstra (1):
> >    sched/fair: Get rid of sched_domains_curr_level hack for tl->cpumask()
> > 
> Can the names be standardized to begin with tl_ ?
> 
> arch/powerpc/kernel/smp.c:			SDTL_INIT(smallcore_smt_mask, powerpc_smt_flags, SMT);
> arch/powerpc/kernel/smp.c:			SDTL_INIT(shared_cache_mask, powerpc_shared_cache_flags, CACHE);
> arch/s390/kernel/topology.c:	SDTL_INIT(cpu_book_mask, NULL, BOOK),
> arch/s390/kernel/topology.c:	SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
> kernel/sched/topology.c:	tl[i++] = SDTL_INIT(sd_numa_mask, NULL, NODE);
> kernel/sched/topology.c:		tl[i] = SDTL_INIT(sd_numa_mask, cpu_numa_flags, NUMA);

Already done :-) My version looks like the below.

I picked up v6 yesterday and this morning started poking at the robot
fail reported before seeing this v7 thing.

Current pile lives here for the robots:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=sched/core

I thought about doing a /cpu_*_flags/tl_*_flags/ patch as well, but
figured this was enough for now.

---
Subject: sched/fair: Get rid of sched_domains_curr_level hack for tl->cpumask()
From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 25 Aug 2025 12:02:44 +0000

Leon [1] and Vinicius [2] noted a topology_span_sane() warning during
their testing starting from v6.16-rc1. Debug that followed pointed to
the tl->mask() for the NODE domain being incorrectly resolved to that of
the highest NUMA domain.

tl->mask() for NODE is set to the sd_numa_mask() which depends on the
global "sched_domains_curr_level" hack. "sched_domains_curr_level" is
set to the "tl->numa_level" during tl traversal in build_sched_domains()
calling sd_init() but was not reset before topology_span_sane().

Since "tl->numa_level" still reflected the old value from
build_sched_domains(), topology_span_sane() for the NODE domain trips
when the span of the last NUMA domain overlaps.

Instead of replicating the "sched_domains_curr_level" hack, get rid of
it entirely and instead, pass the entire "sched_domain_topology_level"
object to tl->cpumask() function to prevent such mishap in the future.

sd_numa_mask() now directly references "tl->numa_level" instead of
relying on the global "sched_domains_curr_level" hack to index into
sched_domains_numa_masks[].

The original warning was reproducible on the following NUMA topology
reported by Leon:

    $ sudo numactl -H
    available: 5 nodes (0-4)
    node 0 cpus: 0 1
    node 0 size: 2927 MB
    node 0 free: 1603 MB
    node 1 cpus: 2 3
    node 1 size: 3023 MB
    node 1 free: 3008 MB
    node 2 cpus: 4 5
    node 2 size: 3023 MB
    node 2 free: 3007 MB
    node 3 cpus: 6 7
    node 3 size: 3023 MB
    node 3 free: 3002 MB
    node 4 cpus: 8 9
    node 4 size: 3022 MB
    node 4 free: 2718 MB
    node distances:
    node   0   1   2   3   4
      0:  10  39  38  37  36
      1:  39  10  38  37  36
      2:  38  38  10  37  36
      3:  37  37  37  10  36
      4:  36  36  36  36  10

The above topology can be mimicked using the following QEMU cmd that was
used to reproduce the warning and test the fix:

     sudo qemu-system-x86_64 -enable-kvm -cpu host \
     -m 20G -smp cpus=10,sockets=10 -machine q35 \
     -object memory-backend-ram,size=4G,id=m0 \
     -object memory-backend-ram,size=4G,id=m1 \
     -object memory-backend-ram,size=4G,id=m2 \
     -object memory-backend-ram,size=4G,id=m3 \
     -object memory-backend-ram,size=4G,id=m4 \
     -numa node,cpus=0-1,memdev=m0,nodeid=0 \
     -numa node,cpus=2-3,memdev=m1,nodeid=1 \
     -numa node,cpus=4-5,memdev=m2,nodeid=2 \
     -numa node,cpus=6-7,memdev=m3,nodeid=3 \
     -numa node,cpus=8-9,memdev=m4,nodeid=4 \
     -numa dist,src=0,dst=1,val=39 \
     -numa dist,src=0,dst=2,val=38 \
     -numa dist,src=0,dst=3,val=37 \
     -numa dist,src=0,dst=4,val=36 \
     -numa dist,src=1,dst=0,val=39 \
     -numa dist,src=1,dst=2,val=38 \
     -numa dist,src=1,dst=3,val=37 \
     -numa dist,src=1,dst=4,val=36 \
     -numa dist,src=2,dst=0,val=38 \
     -numa dist,src=2,dst=1,val=38 \
     -numa dist,src=2,dst=3,val=37 \
     -numa dist,src=2,dst=4,val=36 \
     -numa dist,src=3,dst=0,val=37 \
     -numa dist,src=3,dst=1,val=37 \
     -numa dist,src=3,dst=2,val=37 \
     -numa dist,src=3,dst=4,val=36 \
     -numa dist,src=4,dst=0,val=36 \
     -numa dist,src=4,dst=1,val=36 \
     -numa dist,src=4,dst=2,val=36 \
     -numa dist,src=4,dst=3,val=36 \
     ...

  [ prateek: Moved common functions to include/linux/sched/topology.h,
    reuse the common bits for s390 and ppc, commit message ]

Closes: https://lore.kernel.org/lkml/20250610110701.GA256154@unreal/ [1]
Fixes: ccf74128d66c ("sched/topology: Assert non-NUMA topology masks don't (partially) overlap") # ce29a7da84cd, f55dac1dafb3
Reported-by: Leon Romanovsky <leon@kernel.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lore.kernel.org/lkml/a3de98387abad28592e6ab591f3ff6107fe01dc1.1755893468.git.tim.c.chen@linux.intel.com/ [2]
---
 arch/powerpc/Kconfig                |    4 ++++
 arch/powerpc/include/asm/topology.h |    2 ++
 arch/powerpc/kernel/smp.c           |   27 +++++++++++----------------
 arch/s390/kernel/topology.c         |   20 +++++++-------------
 arch/x86/kernel/smpboot.c           |    8 ++++----
 include/linux/sched/topology.h      |   28 +++++++++++++++++++++++++++-
 include/linux/topology.h            |    2 +-
 kernel/sched/topology.c             |   28 ++++++++++------------------
 8 files changed, 66 insertions(+), 53 deletions(-)

--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -971,6 +971,10 @@ config SCHED_SMT
 	  when dealing with POWER5 cpus at a cost of slightly increased
 	  overhead in some places. If unsure say N here.
 
+config SCHED_MC
+	def_bool y
+	depends on PPC64 && SMP
+
 config PPC_DENORMALISATION
 	bool "PowerPC denormalisation exception handling"
 	depends on PPC_BOOK3S_64
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -134,6 +134,8 @@ static inline int cpu_to_coregroup_id(in
 #ifdef CONFIG_PPC64
 #include <asm/smp.h>
 
+struct cpumask *cpu_coregroup_mask(int cpu);
+
 #define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
 
 #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1028,19 +1028,19 @@ static int powerpc_shared_proc_flags(voi
  * We can't just pass cpu_l2_cache_mask() directly because
  * returns a non-const pointer and the compiler barfs on that.
  */
-static const struct cpumask *shared_cache_mask(int cpu)
+static const struct cpumask *tl_cache_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return per_cpu(cpu_l2_cache_map, cpu);
 }
 
 #ifdef CONFIG_SCHED_SMT
-static const struct cpumask *smallcore_smt_mask(int cpu)
+static const struct cpumask *tl_smallcore_smt_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return cpu_smallcore_mask(cpu);
 }
 #endif
 
-static struct cpumask *cpu_coregroup_mask(int cpu)
+struct cpumask *cpu_coregroup_mask(int cpu)
 {
 	return per_cpu(cpu_coregroup_map, cpu);
 }
@@ -1054,11 +1054,6 @@ static bool has_coregroup_support(void)
 	return coregroup_enabled;
 }
 
-static const struct cpumask *cpu_mc_mask(int cpu)
-{
-	return cpu_coregroup_mask(cpu);
-}
-
 static int __init init_big_cores(void)
 {
 	int cpu;
@@ -1448,7 +1443,7 @@ static bool update_mask_by_l2(int cpu, c
 		return false;
 	}
 
-	cpumask_and(*mask, cpu_online_mask, cpu_cpu_mask(cpu));
+	cpumask_and(*mask, cpu_online_mask, cpu_node_mask(cpu));
 
 	/* Update l2-cache mask with all the CPUs that are part of submask */
 	or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
@@ -1538,7 +1533,7 @@ static void update_coregroup_mask(int cp
 		return;
 	}
 
-	cpumask_and(*mask, cpu_online_mask, cpu_cpu_mask(cpu));
+	cpumask_and(*mask, cpu_online_mask, cpu_node_mask(cpu));
 
 	/* Update coregroup mask with all the CPUs that are part of submask */
 	or_cpumasks_related(cpu, cpu, submask_fn, cpu_coregroup_mask);
@@ -1601,7 +1596,7 @@ static void add_cpu_to_masks(int cpu)
 
 	/* If chip_id is -1; limit the cpu_core_mask to within PKG */
 	if (chip_id == -1)
-		cpumask_and(mask, mask, cpu_cpu_mask(cpu));
+		cpumask_and(mask, mask, cpu_node_mask(cpu));
 
 	for_each_cpu(i, mask) {
 		if (chip_id == cpu_to_chip_id(i)) {
@@ -1701,22 +1696,22 @@ static void __init build_sched_topology(
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
 		powerpc_topology[i++] =
-			SDTL_INIT(smallcore_smt_mask, powerpc_smt_flags, SMT);
+			SDTL_INIT(tl_smallcore_smt_mask, powerpc_smt_flags, SMT);
 	} else {
-		powerpc_topology[i++] = SDTL_INIT(cpu_smt_mask, powerpc_smt_flags, SMT);
+		powerpc_topology[i++] = SDTL_INIT(tl_smt_mask, powerpc_smt_flags, SMT);
 	}
 #endif
 	if (shared_caches) {
 		powerpc_topology[i++] =
-			SDTL_INIT(shared_cache_mask, powerpc_shared_cache_flags, CACHE);
+			SDTL_INIT(tl_cache_mask, powerpc_shared_cache_flags, CACHE);
 	}
 
 	if (has_coregroup_support()) {
 		powerpc_topology[i++] =
-			SDTL_INIT(cpu_mc_mask, powerpc_shared_proc_flags, MC);
+			SDTL_INIT(tl_mc_mask, powerpc_shared_proc_flags, MC);
 	}
 
-	powerpc_topology[i++] = SDTL_INIT(cpu_cpu_mask, powerpc_shared_proc_flags, PKG);
+	powerpc_topology[i++] = SDTL_INIT(tl_pkg_mask, powerpc_shared_proc_flags, PKG);
 
 	/* There must be one trailing NULL entry left.  */
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -509,33 +509,27 @@ int topology_cpu_init(struct cpu *cpu)
 	return rc;
 }
 
-static const struct cpumask *cpu_thread_mask(int cpu)
-{
-	return &cpu_topology[cpu].thread_mask;
-}
-
-
 const struct cpumask *cpu_coregroup_mask(int cpu)
 {
 	return &cpu_topology[cpu].core_mask;
 }
 
-static const struct cpumask *cpu_book_mask(int cpu)
+static const struct cpumask *tl_book_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return &cpu_topology[cpu].book_mask;
 }
 
-static const struct cpumask *cpu_drawer_mask(int cpu)
+static const struct cpumask *tl_drawer_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return &cpu_topology[cpu].drawer_mask;
 }
 
 static struct sched_domain_topology_level s390_topology[] = {
-	SDTL_INIT(cpu_thread_mask, cpu_smt_flags, SMT),
-	SDTL_INIT(cpu_coregroup_mask, cpu_core_flags, MC),
-	SDTL_INIT(cpu_book_mask, NULL, BOOK),
-	SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
-	SDTL_INIT(cpu_cpu_mask, NULL, PKG),
+	SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
+	SDTL_INIT(tl_mc_mask, cpu_core_flags, MC),
+	SDTL_INIT(tl_book_mask, NULL, BOOK),
+	SDTL_INIT(tl_drawer_mask, NULL, DRAWER),
+	SDTL_INIT(tl_pkg_mask, NULL, PKG),
 	{ NULL, },
 };
 
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -479,14 +479,14 @@ static int x86_cluster_flags(void)
 static bool x86_has_numa_in_package;
 
 static struct sched_domain_topology_level x86_topology[] = {
-	SDTL_INIT(cpu_smt_mask, cpu_smt_flags, SMT),
+	SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
 #ifdef CONFIG_SCHED_CLUSTER
-	SDTL_INIT(cpu_clustergroup_mask, x86_cluster_flags, CLS),
+	SDTL_INIT(tl_cls_mask, x86_cluster_flags, CLS),
 #endif
 #ifdef CONFIG_SCHED_MC
-	SDTL_INIT(cpu_coregroup_mask, x86_core_flags, MC),
+	SDTL_INIT(tl_mc_mask, x86_core_flags, MC),
 #endif
-	SDTL_INIT(cpu_cpu_mask, x86_sched_itmt_flags, PKG),
+	SDTL_INIT(tl_pkg_mask, x86_sched_itmt_flags, PKG),
 	{ NULL },
 };
 
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -30,11 +30,19 @@ struct sd_flag_debug {
 };
 extern const struct sd_flag_debug sd_flag_debug[];
 
+struct sched_domain_topology_level;
+
 #ifdef CONFIG_SCHED_SMT
 static inline int cpu_smt_flags(void)
 {
 	return SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
 }
+
+static inline const
+struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_smt_mask(cpu);
+}
 #endif
 
 #ifdef CONFIG_SCHED_CLUSTER
@@ -42,6 +50,12 @@ static inline int cpu_cluster_flags(void
 {
 	return SD_CLUSTER | SD_SHARE_LLC;
 }
+
+static inline const
+struct cpumask *tl_cls_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_clustergroup_mask(cpu);
+}
 #endif
 
 #ifdef CONFIG_SCHED_MC
@@ -49,8 +63,20 @@ static inline int cpu_core_flags(void)
 {
 	return SD_SHARE_LLC;
 }
+
+static inline const
+struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_coregroup_mask(cpu);
+}
 #endif
 
+static inline const
+struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_node_mask(cpu);
+}
+
 #ifdef CONFIG_NUMA
 static inline int cpu_numa_flags(void)
 {
@@ -172,7 +198,7 @@ bool cpus_equal_capacity(int this_cpu, i
 bool cpus_share_cache(int this_cpu, int that_cpu);
 bool cpus_share_resources(int this_cpu, int that_cpu);
 
-typedef const struct cpumask *(*sched_domain_mask_f)(int cpu);
+typedef const struct cpumask *(*sched_domain_mask_f)(struct sched_domain_topology_level *tl, int cpu);
 typedef int (*sched_domain_flags_f)(void);
 
 struct sd_data {
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -260,7 +260,7 @@ static inline bool topology_is_primary_t
 
 #endif
 
-static inline const struct cpumask *cpu_cpu_mask(int cpu)
+static inline const struct cpumask *cpu_node_mask(int cpu)
 {
 	return cpumask_of_node(cpu_to_node(cpu));
 }
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1591,7 +1591,6 @@ static void claim_allocations(int cpu, s
 enum numa_topology_type sched_numa_topology_type;
 
 static int			sched_domains_numa_levels;
-static int			sched_domains_curr_level;
 
 int				sched_max_numa_distance;
 static int			*sched_domains_numa_distance;
@@ -1632,14 +1631,7 @@ sd_init(struct sched_domain_topology_lev
 	int sd_id, sd_weight, sd_flags = 0;
 	struct cpumask *sd_span;
 
-#ifdef CONFIG_NUMA
-	/*
-	 * Ugly hack to pass state to sd_numa_mask()...
-	 */
-	sched_domains_curr_level = tl->numa_level;
-#endif
-
-	sd_weight = cpumask_weight(tl->mask(cpu));
+	sd_weight = cpumask_weight(tl->mask(tl, cpu));
 
 	if (tl->sd_flags)
 		sd_flags = (*tl->sd_flags)();
@@ -1677,7 +1669,7 @@ sd_init(struct sched_domain_topology_lev
 	};
 
 	sd_span = sched_domain_span(sd);
-	cpumask_and(sd_span, cpu_map, tl->mask(cpu));
+	cpumask_and(sd_span, cpu_map, tl->mask(tl, cpu));
 	sd_id = cpumask_first(sd_span);
 
 	sd->flags |= asym_cpu_capacity_classify(sd_span, cpu_map);
@@ -1737,17 +1729,17 @@ sd_init(struct sched_domain_topology_lev
  */
 static struct sched_domain_topology_level default_topology[] = {
 #ifdef CONFIG_SCHED_SMT
-	SDTL_INIT(cpu_smt_mask, cpu_smt_flags, SMT),
+	SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
 #endif
 
 #ifdef CONFIG_SCHED_CLUSTER
-	SDTL_INIT(cpu_clustergroup_mask, cpu_cluster_flags, CLS),
+	SDTL_INIT(tl_cls_mask, cpu_cluster_flags, CLS),
 #endif
 
 #ifdef CONFIG_SCHED_MC
-	SDTL_INIT(cpu_coregroup_mask, cpu_core_flags, MC),
+	SDTL_INIT(tl_mc_mask, cpu_core_flags, MC),
 #endif
-	SDTL_INIT(cpu_cpu_mask, NULL, PKG),
+	SDTL_INIT(tl_pkg_mask, NULL, PKG),
 	{ NULL, },
 };
 
@@ -1769,9 +1761,9 @@ void __init set_sched_topology(struct sc
 
 #ifdef CONFIG_NUMA
 
-static const struct cpumask *sd_numa_mask(int cpu)
+static const struct cpumask *sd_numa_mask(struct sched_domain_topology_level *tl, int cpu)
 {
-	return sched_domains_numa_masks[sched_domains_curr_level][cpu_to_node(cpu)];
+	return sched_domains_numa_masks[tl->numa_level][cpu_to_node(cpu)];
 }
 
 static void sched_numa_warn(const char *str)
@@ -2411,7 +2403,7 @@ static bool topology_span_sane(const str
 		 * breaks the linking done for an earlier span.
 		 */
 		for_each_cpu(cpu, cpu_map) {
-			const struct cpumask *tl_cpu_mask = tl->mask(cpu);
+			const struct cpumask *tl_cpu_mask = tl->mask(tl, cpu);
 			int id;
 
 			/* lowest bit set in this mask is used as a unique id */
@@ -2419,7 +2411,7 @@ static bool topology_span_sane(const str
 
 			if (cpumask_test_cpu(id, id_seen)) {
 				/* First CPU has already been seen, ensure identical spans */
-				if (!cpumask_equal(tl->mask(id), tl_cpu_mask))
+				if (!cpumask_equal(tl->mask(tl, id), tl_cpu_mask))
 					return false;
 			} else {
 				/* First CPU hasn't been seen before, ensure it's a completely new span */


