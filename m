Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14F479D7B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 22:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGfXS2C5Dz3drB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 08:45:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eGpZJJOz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eGpZJJOz; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGf0J16llz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 08:20:48 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so7439086otv.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 13:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gcT6GwgJH1ROGJ+vpdu6rOoNWFNGzSHG/2agvouTvug=;
 b=eGpZJJOzTrDCTc9NoGZCXwVE7UT1bqZPyCl/EqRVByDV4v1GL9hSgc3Nb0pbiL3faJ
 8lBsW7B3HboUVQC8QGXGuvujwEJfGQgP4uq7jvInwdir51juHA+a757tNhXeFQSnTfYL
 9/n528aRas/64Qi+jjAy4z6NRwzsnJ761HZOMvWIrekzNuCJ4nsjfqHQIo7UvYl/RIsY
 9mTnsxVfLNeext5C/CAxe72k9gwR25i5RtUPJLmw/Iu32Dm7U0kDLRRo7YCLKpVn4Vg2
 9VRNrSmtJozCyJeHEGP2Gd0+d2INVTjD2+uzN8YRBNRV7RJ1+uJfKgkYVfdx5h37R0QJ
 l3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gcT6GwgJH1ROGJ+vpdu6rOoNWFNGzSHG/2agvouTvug=;
 b=hq/KpEVVTefAnxC4TmmhPzf6waX+2PaMeeBYFcfjjU7NSEf3WJ/a0tg9xkI1DfOGby
 H6/pT4HoVwrgmy1T+dBcbpaWf4B6/r8QIal/8sf5ZxiHTlvPmhgQ+3G4ldpxeXOErjG4
 iVpxlnEokaoXTTfior/+e/urQlkG8IErOodiKjPfct8fuFigMCuGQ8iM6H6LCtkfkIb6
 oboZGjYpX2FB3JrywQ7vtZt44tGz/HRm+9dBoTF0i2eT3LlOkrBAK/QAJeHHbtPNTOtE
 qUWnPSdX7gJifTLDsZZhlrqiHaZ/i0M71fvSzkunFEEkteiKoCwa+hop1X9k9QuhR9/d
 asDA==
X-Gm-Message-State: AOAM532E5lkT/zLW9sQxlXTPJ1HBt5cbkWbQi+ZW8GUZ11UOztoHslUO
 wRWD2BetHYaEtD0oCnk3FmQ=
X-Google-Smtp-Source: ABdhPJzEvWFUuhkbE5jeMvQXMggFzWfARXzc9vqhes5CUF9nVRJCpnEfHW+oI8/maKy/6ms17tgm/A==
X-Received: by 2002:a9d:390:: with SMTP id f16mr6759364otf.325.1639862446026; 
 Sat, 18 Dec 2021 13:20:46 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id v12sm2321579ote.9.2021.12.18.13.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:45 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@ACULAB.COM>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Marcin Wojtas <mw@semihalf.com>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Russell King <linux@armlinux.org.uk>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/17] lib/cpumask: add cpumask_weight_{eq,gt,ge,lt,le}
Date: Sat, 18 Dec 2021 13:20:05 -0800
Message-Id: <20211218212014.1315894-10-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Dec 2021 08:39:01 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel code calls cpumask_weight() to compare the weight of cpumask with
a given number. We can do it more efficiently with cpumask_weight_{eq, ...}
because conditional cpumask_weight may stop traversing the cpumask earlier,
as soon as condition is met.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/ia64/mm/tlb.c                       |  2 +-
 arch/mips/cavium-octeon/octeon-irq.c     |  4 +-
 arch/mips/kernel/crash.c                 |  2 +-
 arch/powerpc/kernel/smp.c                |  2 +-
 arch/powerpc/kernel/watchdog.c           |  2 +-
 arch/powerpc/xmon/xmon.c                 |  4 +-
 arch/s390/kernel/perf_cpum_cf.c          |  2 +-
 arch/x86/kernel/smpboot.c                |  4 +-
 drivers/firmware/psci/psci_checker.c     |  2 +-
 drivers/hv/channel_mgmt.c                |  4 +-
 drivers/infiniband/hw/hfi1/affinity.c    |  9 ++---
 drivers/infiniband/hw/qib/qib_file_ops.c |  2 +-
 drivers/infiniband/hw/qib/qib_iba7322.c  |  2 +-
 drivers/scsi/lpfc/lpfc_init.c            |  2 +-
 drivers/soc/fsl/qbman/qman_test_stash.c  |  2 +-
 include/linux/cpumask.h                  | 50 ++++++++++++++++++++++++
 kernel/sched/core.c                      |  8 ++--
 kernel/sched/topology.c                  |  2 +-
 kernel/time/clockevents.c                |  2 +-
 19 files changed, 78 insertions(+), 29 deletions(-)

diff --git a/arch/ia64/mm/tlb.c b/arch/ia64/mm/tlb.c
index 135b5135cace..a5bce13ab047 100644
--- a/arch/ia64/mm/tlb.c
+++ b/arch/ia64/mm/tlb.c
@@ -332,7 +332,7 @@ __flush_tlb_range (struct vm_area_struct *vma, unsigned long start,
 
 	preempt_disable();
 #ifdef CONFIG_SMP
-	if (mm != current->active_mm || cpumask_weight(mm_cpumask(mm)) != 1) {
+	if (mm != current->active_mm || !cpumask_weight_eq(mm_cpumask(mm), 1)) {
 		ia64_global_tlb_purge(mm, start, end, nbits);
 		preempt_enable();
 		return;
diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index 844f882096e6..914871f15fb7 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -763,7 +763,7 @@ static void octeon_irq_cpu_offline_ciu(struct irq_data *data)
 	if (!cpumask_test_cpu(cpu, mask))
 		return;
 
-	if (cpumask_weight(mask) > 1) {
+	if (cpumask_weight_gt(mask, 1)) {
 		/*
 		 * It has multi CPU affinity, just remove this CPU
 		 * from the affinity set.
@@ -795,7 +795,7 @@ static int octeon_irq_ciu_set_affinity(struct irq_data *data,
 	 * This removes the need to do locking in the .ack/.eoi
 	 * functions.
 	 */
-	if (cpumask_weight(dest) != 1)
+	if (!cpumask_weight_eq(dest, 1))
 		return -EINVAL;
 
 	if (!enable_one)
diff --git a/arch/mips/kernel/crash.c b/arch/mips/kernel/crash.c
index 81845ba04835..5b690d52491f 100644
--- a/arch/mips/kernel/crash.c
+++ b/arch/mips/kernel/crash.c
@@ -72,7 +72,7 @@ static void crash_kexec_prepare_cpus(void)
 	 */
 	pr_emerg("Sending IPI to other cpus...\n");
 	msecs = 10000;
-	while ((cpumask_weight(&cpus_in_crash) < ncpus) && (--msecs > 0)) {
+	while (cpumask_weight_lt(&cpus_in_crash, ncpus) && (--msecs > 0)) {
 		cpu_relax();
 		mdelay(1);
 	}
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index c338f9d8ab37..00da2064ddf3 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1655,7 +1655,7 @@ void start_secondary(void *unused)
 		if (has_big_cores)
 			sibling_mask = cpu_smallcore_mask;
 
-		if (cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu)))
+		if (cpumask_weight_gt(mask, cpumask_weight(sibling_mask(cpu))))
 			shared_caches = true;
 	}
 
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index bfc27496fe7e..62937a077de7 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -483,7 +483,7 @@ static void start_watchdog(void *arg)
 
 	wd_smp_lock(&flags);
 	cpumask_set_cpu(cpu, &wd_cpus_enabled);
-	if (cpumask_weight(&wd_cpus_enabled) == 1) {
+	if (cpumask_weight_eq(&wd_cpus_enabled, 1)) {
 		cpumask_set_cpu(cpu, &wd_smp_cpus_pending);
 		wd_smp_last_reset_tb = get_tb();
 	}
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f9ae0b398260..b9e9d0b20a7b 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -469,7 +469,7 @@ static bool wait_for_other_cpus(int ncpus)
 
 	/* We wait for 2s, which is a metric "little while" */
 	for (timeout = 20000; timeout != 0; --timeout) {
-		if (cpumask_weight(&cpus_in_xmon) >= ncpus)
+		if (cpumask_weight_ge(&cpus_in_xmon, ncpus))
 			return true;
 		udelay(100);
 		barrier();
@@ -1338,7 +1338,7 @@ static int cpu_cmd(void)
 			case 'S':
 			case 't':
 				cpumask_copy(&xmon_batch_cpus, &cpus_in_xmon);
-				if (cpumask_weight(&xmon_batch_cpus) <= 1) {
+				if (cpumask_weight_le(&xmon_batch_cpus, 1)) {
 					printf("There are no other cpus in xmon\n");
 					break;
 				}
diff --git a/arch/s390/kernel/perf_cpum_cf.c b/arch/s390/kernel/perf_cpum_cf.c
index ee8707abdb6a..4d217f7f5ccf 100644
--- a/arch/s390/kernel/perf_cpum_cf.c
+++ b/arch/s390/kernel/perf_cpum_cf.c
@@ -975,7 +975,7 @@ static int cfset_all_start(struct cfset_request *req)
 		return -ENOMEM;
 	cpumask_and(mask, &req->mask, cpu_online_mask);
 	on_each_cpu_mask(mask, cfset_ioctl_on, &p, 1);
-	if (atomic_read(&p.cpus_ack) != cpumask_weight(mask)) {
+	if (!cpumask_weight_eq(mask, atomic_read(&p.cpus_ack))) {
 		on_each_cpu_mask(mask, cfset_ioctl_off, &p, 1);
 		rc = -EIO;
 		debug_sprintf_event(cf_dbg, 4, "%s CPUs missing", __func__);
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 617012f4619f..e851e9945eb5 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1608,7 +1608,7 @@ static void remove_siblinginfo(int cpu)
 		/*/
 		 * last thread sibling in this cpu core going down
 		 */
-		if (cpumask_weight(topology_sibling_cpumask(cpu)) == 1)
+		if (cpumask_weight_eq(topology_sibling_cpumask(cpu), 1))
 			cpu_data(sibling).booted_cores--;
 	}
 
@@ -1617,7 +1617,7 @@ static void remove_siblinginfo(int cpu)
 
 	for_each_cpu(sibling, topology_sibling_cpumask(cpu)) {
 		cpumask_clear_cpu(cpu, topology_sibling_cpumask(sibling));
-		if (cpumask_weight(topology_sibling_cpumask(sibling)) == 1)
+		if (cpumask_weight_eq(topology_sibling_cpumask(sibling), 1))
 			cpu_data(sibling).smt_active = false;
 	}
 
diff --git a/drivers/firmware/psci/psci_checker.c b/drivers/firmware/psci/psci_checker.c
index 116eb465cdb4..90c9473832a9 100644
--- a/drivers/firmware/psci/psci_checker.c
+++ b/drivers/firmware/psci/psci_checker.c
@@ -90,7 +90,7 @@ static unsigned int down_and_up_cpus(const struct cpumask *cpus,
 		 * cpu_down() checks the number of online CPUs before the TOS
 		 * resident CPU.
 		 */
-		if (cpumask_weight(offlined_cpus) + 1 == nb_available_cpus) {
+		if (cpumask_weight_eq(offlined_cpus, nb_available_cpus - 1)) {
 			if (ret != -EBUSY) {
 				pr_err("Unexpected return code %d while trying "
 				       "to power down last online CPU %d\n",
diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index 2829575fd9b7..da297220230d 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -762,8 +762,8 @@ static void init_vp_index(struct vmbus_channel *channel)
 		}
 		alloced_mask = &hv_context.hv_numa_map[numa_node];
 
-		if (cpumask_weight(alloced_mask) ==
-		    cpumask_weight(cpumask_of_node(numa_node))) {
+		if (cpumask_weight_eq(alloced_mask,
+			    cpumask_weight(cpumask_of_node(numa_node)))) {
 			/*
 			 * We have cycled through all the CPUs in the node;
 			 * reset the alloced map.
diff --git a/drivers/infiniband/hw/hfi1/affinity.c b/drivers/infiniband/hw/hfi1/affinity.c
index 38eee675369a..7c5ca5c5306a 100644
--- a/drivers/infiniband/hw/hfi1/affinity.c
+++ b/drivers/infiniband/hw/hfi1/affinity.c
@@ -507,7 +507,7 @@ static int _dev_comp_vect_cpu_mask_init(struct hfi1_devdata *dd,
 	 * available CPUs divide it by the number of devices in the
 	 * local NUMA node.
 	 */
-	if (cpumask_weight(&entry->comp_vect_mask) == 1) {
+	if (cpumask_weight_eq(&entry->comp_vect_mask, 1)) {
 		possible_cpus_comp_vect = 1;
 		dd_dev_warn(dd,
 			    "Number of kernel receive queues is too large for completion vector affinity to be effective\n");
@@ -593,7 +593,7 @@ int hfi1_dev_affinity_init(struct hfi1_devdata *dd)
 {
 	struct hfi1_affinity_node *entry;
 	const struct cpumask *local_mask;
-	int curr_cpu, possible, i, ret;
+	int curr_cpu, i, ret;
 	bool new_entry = false;
 
 	local_mask = cpumask_of_node(dd->node);
@@ -626,10 +626,9 @@ int hfi1_dev_affinity_init(struct hfi1_devdata *dd)
 			    local_mask);
 
 		/* fill in the receive list */
-		possible = cpumask_weight(&entry->def_intr.mask);
 		curr_cpu = cpumask_first(&entry->def_intr.mask);
 
-		if (possible == 1) {
+		if (cpumask_weight_eq(&entry->def_intr.mask, 1)) {
 			/* only one CPU, everyone will use it */
 			cpumask_set_cpu(curr_cpu, &entry->rcv_intr.mask);
 			cpumask_set_cpu(curr_cpu, &entry->general_intr_mask);
@@ -1017,7 +1016,7 @@ int hfi1_get_proc_affinity(int node)
 		cpu = cpumask_first(proc_mask);
 		cpumask_set_cpu(cpu, &set->used);
 		goto done;
-	} else if (current->nr_cpus_allowed < cpumask_weight(&set->mask)) {
+	} else if (cpumask_weight_gt(&set->mask, current->nr_cpus_allowed)) {
 		hfi1_cdbg(PROC, "PID %u %s affinity set to CPU set(s) %*pbl",
 			  current->pid, current->comm,
 			  cpumask_pr_args(proc_mask));
diff --git a/drivers/infiniband/hw/qib/qib_file_ops.c b/drivers/infiniband/hw/qib/qib_file_ops.c
index aa290928cf96..add89bc21b0a 100644
--- a/drivers/infiniband/hw/qib/qib_file_ops.c
+++ b/drivers/infiniband/hw/qib/qib_file_ops.c
@@ -1151,7 +1151,7 @@ static void assign_ctxt_affinity(struct file *fp, struct qib_devdata *dd)
 	 * reserve a processor for it on the local NUMA node.
 	 */
 	if ((weight >= qib_cpulist_count) &&
-		(cpumask_weight(local_mask) <= qib_cpulist_count)) {
+		(cpumask_weight_le(local_mask, qib_cpulist_count))) {
 		for_each_cpu(local_cpu, local_mask)
 			if (!test_and_set_bit(local_cpu, qib_cpulist)) {
 				fd->rec_cpu_num = local_cpu;
diff --git a/drivers/infiniband/hw/qib/qib_iba7322.c b/drivers/infiniband/hw/qib/qib_iba7322.c
index ab98b6a3ae1e..636a080b2952 100644
--- a/drivers/infiniband/hw/qib/qib_iba7322.c
+++ b/drivers/infiniband/hw/qib/qib_iba7322.c
@@ -3405,7 +3405,7 @@ static void qib_setup_7322_interrupt(struct qib_devdata *dd, int clearpend)
 	local_mask = cpumask_of_pcibus(dd->pcidev->bus);
 	firstcpu = cpumask_first(local_mask);
 	if (firstcpu >= nr_cpu_ids ||
-			cpumask_weight(local_mask) == num_online_cpus()) {
+			cpumask_weight_eq(local_mask, num_online_cpus())) {
 		local_mask = topology_core_cpumask(0);
 		firstcpu = cpumask_first(local_mask);
 	}
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index a56f01f659f8..325e9004dacd 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -12643,7 +12643,7 @@ lpfc_cpuhp_get_eq(struct lpfc_hba *phba, unsigned int cpu,
 		 * gone offline yet, we need >1.
 		 */
 		cpumask_and(tmp, maskp, cpu_online_mask);
-		if (cpumask_weight(tmp) > 1)
+		if (cpumask_weight_gt(tmp, 1))
 			continue;
 
 		/* Now that we have an irq to shutdown, get the eq
diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index b7e8e5ec884c..28b08568a349 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -561,7 +561,7 @@ int qman_test_stash(void)
 {
 	int err;
 
-	if (cpumask_weight(cpu_online_mask) < 2) {
+	if (cpumask_weight_lt(cpu_online_mask, 2)) {
 		pr_info("%s(): skip - only 1 CPU\n", __func__);
 		return 0;
 	}
diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 64dae70d31f5..1906e3225737 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -575,6 +575,56 @@ static inline unsigned int cpumask_weight(const struct cpumask *srcp)
 	return bitmap_weight(cpumask_bits(srcp), nr_cpumask_bits);
 }
 
+/**
+ * cpumask_weight_eq - Check if # of bits in *srcp is equal to a given number
+ * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
+ * @num: the number to check.
+ */
+static inline bool cpumask_weight_eq(const struct cpumask *srcp, unsigned int num)
+{
+	return bitmap_weight_eq(cpumask_bits(srcp), nr_cpumask_bits, num);
+}
+
+/**
+ * cpumask_weight_gt - Check if # of bits in *srcp is greater than a given number
+ * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
+ * @num: the number to check.
+ */
+static inline bool cpumask_weight_gt(const struct cpumask *srcp, int num)
+{
+	return bitmap_weight_gt(cpumask_bits(srcp), nr_cpumask_bits, num);
+}
+
+/**
+ * cpumask_weight_ge - Check if # of bits in *srcp is greater than or equal to a given number
+ * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
+ * @num: the number to check.
+ */
+static inline bool cpumask_weight_ge(const struct cpumask *srcp, int num)
+{
+	return bitmap_weight_ge(cpumask_bits(srcp), nr_cpumask_bits, num);
+}
+
+/**
+ * cpumask_weight_lt - Check if # of bits in *srcp is less than a given number
+ * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
+ * @num: the number to check.
+ */
+static inline bool cpumask_weight_lt(const struct cpumask *srcp, int num)
+{
+	return bitmap_weight_lt(cpumask_bits(srcp), nr_cpumask_bits, num);
+}
+
+/**
+ * cpumask_weight_le - Check if # of bits in *srcp is less than or equal to a given number
+ * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
+ * @num: the number to check.
+ */
+static inline bool cpumask_weight_le(const struct cpumask *srcp, int num)
+{
+	return bitmap_weight_le(cpumask_bits(srcp), nr_cpumask_bits, num);
+}
+
 /**
  * cpumask_shift_right - *dstp = *srcp >> n
  * @dstp: the cpumask result
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9b3ec14227e1..60f7d04a05f8 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6006,7 +6006,7 @@ static void sched_core_cpu_starting(unsigned int cpu)
 	WARN_ON_ONCE(rq->core != rq);
 
 	/* if we're the first, we'll be our own leader */
-	if (cpumask_weight(smt_mask) == 1)
+	if (cpumask_weight_eq(smt_mask, 1))
 		goto unlock;
 
 	/* find the leader */
@@ -6047,7 +6047,7 @@ static void sched_core_cpu_deactivate(unsigned int cpu)
 	sched_core_lock(cpu, &flags);
 
 	/* if we're the last man standing, nothing to do */
-	if (cpumask_weight(smt_mask) == 1) {
+	if (cpumask_weight_eq(smt_mask, 1)) {
 		WARN_ON_ONCE(rq->core != rq);
 		goto unlock;
 	}
@@ -9053,7 +9053,7 @@ int sched_cpu_activate(unsigned int cpu)
 	/*
 	 * When going up, increment the number of cores with SMT present.
 	 */
-	if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
+	if (cpumask_weight_eq(cpu_smt_mask(cpu), 2))
 		static_branch_inc_cpuslocked(&sched_smt_present);
 #endif
 	set_cpu_active(cpu, true);
@@ -9128,7 +9128,7 @@ int sched_cpu_deactivate(unsigned int cpu)
 	/*
 	 * When going down, decrement the number of cores with SMT present.
 	 */
-	if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
+	if (cpumask_weight_eq(cpu_smt_mask(cpu), 2))
 		static_branch_dec_cpuslocked(&sched_smt_present);
 
 	sched_core_cpu_deactivate(cpu);
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 8478e2a8cd65..79395571599f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -169,7 +169,7 @@ static const unsigned int SD_DEGENERATE_GROUPS_MASK =
 
 static int sd_degenerate(struct sched_domain *sd)
 {
-	if (cpumask_weight(sched_domain_span(sd)) == 1)
+	if (cpumask_weight_eq(sched_domain_span(sd), 1))
 		return 1;
 
 	/* Following flags need at least 2 groups */
diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
index 003ccf338d20..32d6629a55b2 100644
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -648,7 +648,7 @@ void tick_cleanup_dead_cpu(int cpu)
 	 */
 	list_for_each_entry_safe(dev, tmp, &clockevent_devices, list) {
 		if (cpumask_test_cpu(cpu, dev->cpumask) &&
-		    cpumask_weight(dev->cpumask) == 1 &&
+		    cpumask_weight_eq(dev->cpumask, 1) &&
 		    !tick_is_broadcast_device(dev)) {
 			BUG_ON(!clockevent_state_detached(dev));
 			list_del(&dev->list);
-- 
2.30.2

