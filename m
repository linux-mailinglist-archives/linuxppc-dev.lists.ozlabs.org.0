Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E101C4604ED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 07:27:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1z6G5TQ2z3clD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 17:27:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e5XEUas/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=e5XEUas/; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1vnV3vgtz3035
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 14:57:18 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id m192so19103686qke.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 19:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SDTyIdtw+VkIq6/VMnx/z5eHXm57BIQ2yKpXxsxs04k=;
 b=e5XEUas/gm7+QVD5B6VoV08VmK9sM4FNRatOipHXDvG7i/0ZZyfdQBxei3v4tp/lKn
 OFaYHpH1JhE4my9vMxXCaB6e4ZDmo1/ny4tuXHPU/Evcx7yxRouCrRk6qjgoRW7DXXMr
 edv4I2LShXnUx4Da6GqKHBVc3Dp89nSBeKrvk/bGxyD8I2AFmswdomkePj4mLGjYJeld
 EV7SBc8o3j+JIqqKZEaFsBEZNOGAqa+Ns2ji7Emoy9WYwA+lKH3/D88E3nfK2S037EVc
 b2WrqT3fd/6mTp7Gidopu3E9jEMN1CzzUple1nNFIV0mAGmVFF09U4e+5Q0CDy3isLmo
 Ur1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SDTyIdtw+VkIq6/VMnx/z5eHXm57BIQ2yKpXxsxs04k=;
 b=1wSkCWj4WebPw/ztl8L6pzXUTQdCgQhfeF4fJpKUnxkbPpHOQ/GdGs0juIdUzZg0dk
 PGyeH9XgTmgt/hjJUTaiZQd3Y1+Hk5RPC6vYZFTSB2/6ZLGaZSDqmga6WI4DVInXYFaY
 BoeHFtr8XYqnOwWM9gFbO8uzCFB3LhdigB5d5kuwYWX5LV0KPawHboxM8Bi8WHtV611y
 SmIzrVpDLoSjbtxDt0nAXD9Zk8eQBlKCJKjgV8o3fCP7hEq17bYS+Z85bzNyZmhIFfs0
 evM7vCz7oMXEDGFqP9um0ppGNtl+1eWTEj8cTQdLf+PnugaKp9xoMLekYeLZkKSid/9z
 oY8A==
X-Gm-Message-State: AOAM530A3GkSFCDqgDf9gd8rMR6SGFz2fy0rDtkQBaqTbnv5Z/8KbFVu
 z5g3NpedyWeByhsJv6x65C0=
X-Google-Smtp-Source: ABdhPJy0Y2OLMxQ5fuFPsgsiMXl21GucV+S06h8GXLuabsitGxgIrc6I7CI4mbbJFzXfIh8UbrHfEg==
X-Received: by 2002:a37:6103:: with SMTP id v3mr22509293qkb.694.1638071835556; 
 Sat, 27 Nov 2021 19:57:15 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id 22sm6285999qtw.12.2021.11.27.19.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 19:57:15 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
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
 Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Jonathan Cameron <jic23@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
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
 Roy Pledge <Roy.Pledge@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Saeed Mahameed <saeedm@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>,
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
Subject: [PATCH 5/9] lib/cpumask: add cpumask_weight_{eq,gt,le}
Date: Sat, 27 Nov 2021 19:57:00 -0800
Message-Id: <20211128035704.270739-6-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Nov 2021 17:23:17 +1100
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

Add cpumask_weight_{eq,gt,le} and replace cpumask_weight() with one
of cpumask_weight_{empty,eq,gt,le} where appropriate. This allows
cpumask_weight_*() to return earlier depending on the condition.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/alpha/kernel/process.c              |  2 +-
 arch/ia64/kernel/setup.c                 |  2 +-
 arch/ia64/mm/tlb.c                       |  2 +-
 arch/mips/cavium-octeon/octeon-irq.c     |  4 +--
 arch/mips/kernel/crash.c                 |  2 +-
 arch/powerpc/kernel/smp.c                |  2 +-
 arch/powerpc/kernel/watchdog.c           |  4 +--
 arch/powerpc/xmon/xmon.c                 |  4 +--
 arch/s390/kernel/perf_cpum_cf.c          |  2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c   | 14 +++++------
 arch/x86/kernel/smpboot.c                |  4 +--
 arch/x86/mm/mmio-mod.c                   |  2 +-
 arch/x86/platform/uv/uv_nmi.c            |  2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c        |  2 +-
 drivers/cpufreq/scmi-cpufreq.c           |  2 +-
 drivers/firmware/psci/psci_checker.c     |  2 +-
 drivers/gpu/drm/i915/i915_pmu.c          |  2 +-
 drivers/hv/channel_mgmt.c                |  4 +--
 drivers/infiniband/hw/hfi1/affinity.c    | 13 +++++-----
 drivers/infiniband/hw/qib/qib_file_ops.c |  2 +-
 drivers/infiniband/hw/qib/qib_iba7322.c  |  2 +-
 drivers/infiniband/sw/siw/siw_main.c     |  3 +--
 drivers/irqchip/irq-bcm6345-l1.c         |  2 +-
 drivers/scsi/lpfc/lpfc_init.c            |  2 +-
 drivers/soc/fsl/qbman/qman_test_stash.c  |  2 +-
 include/linux/cpumask.h                  | 32 ++++++++++++++++++++++++
 kernel/irq/affinity.c                    |  2 +-
 kernel/padata.c                          |  2 +-
 kernel/rcu/tree_nocb.h                   |  4 +--
 kernel/rcu/tree_plugin.h                 |  2 +-
 kernel/sched/core.c                      | 10 ++++----
 kernel/sched/topology.c                  |  4 +--
 kernel/time/clockevents.c                |  2 +-
 kernel/time/clocksource.c                |  2 +-
 mm/vmstat.c                              |  4 +--
 35 files changed, 89 insertions(+), 59 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 5f8527081da9..0d4bc60828bf 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -125,7 +125,7 @@ common_shutdown_1(void *generic_ptr)
 	/* Wait for the secondaries to halt. */
 	set_cpu_present(boot_cpuid, false);
 	set_cpu_possible(boot_cpuid, false);
-	while (cpumask_weight(cpu_present_mask))
+	while (!cpumask_empty(cpu_present_mask))
 		barrier();
 #endif
 
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index 5010348fa21b..fd6301eafa9d 100644
--- a/arch/ia64/kernel/setup.c
+++ b/arch/ia64/kernel/setup.c
@@ -572,7 +572,7 @@ setup_arch (char **cmdline_p)
 #ifdef CONFIG_ACPI_HOTPLUG_CPU
 	prefill_possible_map();
 #endif
-	per_cpu_scan_finalize((cpumask_weight(&early_cpu_possible_map) == 0 ?
+	per_cpu_scan_finalize((cpumask_empty(&early_cpu_possible_map) ?
 		32 : cpumask_weight(&early_cpu_possible_map)),
 		additional_cpus > 0 ? additional_cpus : 0);
 #endif /* CONFIG_ACPI_NUMA */
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
index 81845ba04835..4c35004754db 100644
--- a/arch/mips/kernel/crash.c
+++ b/arch/mips/kernel/crash.c
@@ -72,7 +72,7 @@ static void crash_kexec_prepare_cpus(void)
 	 */
 	pr_emerg("Sending IPI to other cpus...\n");
 	msecs = 10000;
-	while ((cpumask_weight(&cpus_in_crash) < ncpus) && (--msecs > 0)) {
+	while (cpumask_weight_le(&cpus_in_crash, ncpus) && (--msecs > 0)) {
 		cpu_relax();
 		mdelay(1);
 	}
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index c23ee842c4c3..2eae302ea26b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1615,7 +1615,7 @@ void start_secondary(void *unused)
 		if (has_big_cores)
 			sibling_mask = cpu_smallcore_mask;
 
-		if (cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu)))
+		if (cpumask_weight_gt(mask, cpumask_weight(sibling_mask(cpu))))
 			shared_caches = true;
 	}
 
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 3fa6d240bade..9e9cba7cfb85 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -158,7 +158,7 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 		goto out;
 	if (cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
 		goto out;
-	if (cpumask_weight(&wd_smp_cpus_pending) == 0)
+	if (cpumask_empty(&wd_smp_cpus_pending))
 		goto out;
 
 	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
@@ -346,7 +346,7 @@ static void start_watchdog(void *arg)
 
 	wd_smp_lock(&flags);
 	cpumask_set_cpu(cpu, &wd_cpus_enabled);
-	if (cpumask_weight(&wd_cpus_enabled) == 1) {
+	if (cpumask_weight_eq(&wd_cpus_enabled, 1)) {
 		cpumask_set_cpu(cpu, &wd_smp_cpus_pending);
 		wd_smp_last_reset_tb = get_tb();
 	}
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 8b28ff9d98d1..2073be312fe9 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -469,7 +469,7 @@ static bool wait_for_other_cpus(int ncpus)
 
 	/* We wait for 2s, which is a metric "little while" */
 	for (timeout = 20000; timeout != 0; --timeout) {
-		if (cpumask_weight(&cpus_in_xmon) >= ncpus)
+		if (cpumask_weight_gt(&cpus_in_xmon, ncpus - 1))
 			return true;
 		udelay(100);
 		barrier();
@@ -1338,7 +1338,7 @@ static int cpu_cmd(void)
 			case 'S':
 			case 't':
 				cpumask_copy(&xmon_batch_cpus, &cpus_in_xmon);
-				if (cpumask_weight(&xmon_batch_cpus) <= 1) {
+				if (cpumask_weight_le(&xmon_batch_cpus, 2)) {
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
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 94e7e6b420e4..5fa730063af2 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -341,14 +341,14 @@ static int cpus_mon_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
 
 	/* Check whether cpus belong to parent ctrl group */
 	cpumask_andnot(tmpmask, newmask, &prgrp->cpu_mask);
-	if (cpumask_weight(tmpmask)) {
+	if (!cpumask_empty(tmpmask)) {
 		rdt_last_cmd_puts("Can only add CPUs to mongroup that belong to parent\n");
 		return -EINVAL;
 	}
 
 	/* Check whether cpus are dropped from this group */
 	cpumask_andnot(tmpmask, &rdtgrp->cpu_mask, newmask);
-	if (cpumask_weight(tmpmask)) {
+	if (!cpumask_empty(tmpmask)) {
 		/* Give any dropped cpus to parent rdtgroup */
 		cpumask_or(&prgrp->cpu_mask, &prgrp->cpu_mask, tmpmask);
 		update_closid_rmid(tmpmask, prgrp);
@@ -359,7 +359,7 @@ static int cpus_mon_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
 	 * and update per-cpu rmid
 	 */
 	cpumask_andnot(tmpmask, newmask, &rdtgrp->cpu_mask);
-	if (cpumask_weight(tmpmask)) {
+	if (!cpumask_empty(tmpmask)) {
 		head = &prgrp->mon.crdtgrp_list;
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list) {
 			if (crgrp == rdtgrp)
@@ -394,7 +394,7 @@ static int cpus_ctrl_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
 
 	/* Check whether cpus are dropped from this group */
 	cpumask_andnot(tmpmask, &rdtgrp->cpu_mask, newmask);
-	if (cpumask_weight(tmpmask)) {
+	if (!cpumask_empty(tmpmask)) {
 		/* Can't drop from default group */
 		if (rdtgrp == &rdtgroup_default) {
 			rdt_last_cmd_puts("Can't drop CPUs from default group\n");
@@ -413,12 +413,12 @@ static int cpus_ctrl_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
 	 * and update per-cpu closid/rmid.
 	 */
 	cpumask_andnot(tmpmask, newmask, &rdtgrp->cpu_mask);
-	if (cpumask_weight(tmpmask)) {
+	if (!cpumask_empty(tmpmask)) {
 		list_for_each_entry(r, &rdt_all_groups, rdtgroup_list) {
 			if (r == rdtgrp)
 				continue;
 			cpumask_and(tmpmask1, &r->cpu_mask, tmpmask);
-			if (cpumask_weight(tmpmask1))
+			if (!cpumask_empty(tmpmask1))
 				cpumask_rdtgrp_clear(r, tmpmask1);
 		}
 		update_closid_rmid(tmpmask, rdtgrp);
@@ -488,7 +488,7 @@ static ssize_t rdtgroup_cpus_write(struct kernfs_open_file *of,
 
 	/* check that user didn't specify any offline cpus */
 	cpumask_andnot(tmpmask, newmask, cpu_online_mask);
-	if (cpumask_weight(tmpmask)) {
+	if (!cpumask_empty(tmpmask)) {
 		ret = -EINVAL;
 		rdt_last_cmd_puts("Can only assign online CPUs\n");
 		goto unlock;
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ac2909f0cab3..394071898b50 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1594,7 +1594,7 @@ static void remove_siblinginfo(int cpu)
 		/*/
 		 * last thread sibling in this cpu core going down
 		 */
-		if (cpumask_weight(topology_sibling_cpumask(cpu)) == 1)
+		if (cpumask_weight_eq(topology_sibling_cpumask(cpu), 1))
 			cpu_data(sibling).booted_cores--;
 	}
 
@@ -1603,7 +1603,7 @@ static void remove_siblinginfo(int cpu)
 
 	for_each_cpu(sibling, topology_sibling_cpumask(cpu)) {
 		cpumask_clear_cpu(cpu, topology_sibling_cpumask(sibling));
-		if (cpumask_weight(topology_sibling_cpumask(sibling)) == 1)
+		if (cpumask_weight_eq(topology_sibling_cpumask(sibling), 1))
 			cpu_data(sibling).smt_active = false;
 	}
 
diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
index 933a2ebad471..c3317f0650d8 100644
--- a/arch/x86/mm/mmio-mod.c
+++ b/arch/x86/mm/mmio-mod.c
@@ -400,7 +400,7 @@ static void leave_uniprocessor(void)
 	int cpu;
 	int err;
 
-	if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
+	if (!cpumask_available(downed_cpus) || cpumask_empty(downed_cpus))
 		return;
 	pr_notice("Re-enabling CPUs...\n");
 	for_each_cpu(cpu, downed_cpus) {
diff --git a/arch/x86/platform/uv/uv_nmi.c b/arch/x86/platform/uv/uv_nmi.c
index 1e9ff28bc2e0..ea277fc08357 100644
--- a/arch/x86/platform/uv/uv_nmi.c
+++ b/arch/x86/platform/uv/uv_nmi.c
@@ -985,7 +985,7 @@ static int uv_handle_nmi(unsigned int reason, struct pt_regs *regs)
 
 	/* Clear global flags */
 	if (master) {
-		if (cpumask_weight(uv_nmi_cpu_mask))
+		if (!cpumask_empty(uv_nmi_cpu_mask))
 			uv_nmi_cleanup_mask();
 		atomic_set(&uv_nmi_cpus_in_nmi, -1);
 		atomic_set(&uv_nmi_cpu, -1);
diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 248135e5087e..60055ab190a9 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -475,7 +475,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	}
 
 	qcom_get_related_cpus(index, policy->cpus);
-	if (!cpumask_weight(policy->cpus)) {
+	if (cpumask_empty(policy->cpus)) {
 		dev_err(dev, "Domain-%d failed to get related CPUs\n", index);
 		ret = -ENOENT;
 		goto error;
diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 1e0cd4d165f0..919fa6e3f462 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -154,7 +154,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 	 * table and opp-shared.
 	 */
 	ret = dev_pm_opp_of_get_sharing_cpus(cpu_dev, priv->opp_shared_cpus);
-	if (ret || !cpumask_weight(priv->opp_shared_cpus)) {
+	if (ret || cpumask_empty(priv->opp_shared_cpus)) {
 		/*
 		 * Either opp-table is not set or no opp-shared was found.
 		 * Use the CPU mask from SCMI to designate CPUs sharing an OPP
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
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 0b488d49694c..962e8d6bf6ea 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1048,7 +1048,7 @@ static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
 	GEM_BUG_ON(!pmu->base.event_init);
 
 	/* Select the first online CPU as a designated reader. */
-	if (!cpumask_weight(&i915_pmu_cpumask))
+	if (cpumask_empty(&i915_pmu_cpumask))
 		cpumask_set_cpu(cpu, &i915_pmu_cpumask);
 
 	return 0;
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
index 98c813ba4304..7c5ca5c5306a 100644
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
@@ -667,7 +666,7 @@ int hfi1_dev_affinity_init(struct hfi1_devdata *dd)
 			 * engines, use the same CPU cores as general/control
 			 * context.
 			 */
-			if (cpumask_weight(&entry->def_intr.mask) == 0)
+			if (cpumask_empty(&entry->def_intr.mask))
 				cpumask_copy(&entry->def_intr.mask,
 					     &entry->general_intr_mask);
 		}
@@ -687,7 +686,7 @@ int hfi1_dev_affinity_init(struct hfi1_devdata *dd)
 		 * vectors, use the same CPU core as the general/control
 		 * context.
 		 */
-		if (cpumask_weight(&entry->comp_vect_mask) == 0)
+		if (cpumask_empty(&entry->comp_vect_mask))
 			cpumask_copy(&entry->comp_vect_mask,
 				     &entry->general_intr_mask);
 	}
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
index aa290928cf96..60717606fe98 100644
--- a/drivers/infiniband/hw/qib/qib_file_ops.c
+++ b/drivers/infiniband/hw/qib/qib_file_ops.c
@@ -1151,7 +1151,7 @@ static void assign_ctxt_affinity(struct file *fp, struct qib_devdata *dd)
 	 * reserve a processor for it on the local NUMA node.
 	 */
 	if ((weight >= qib_cpulist_count) &&
-		(cpumask_weight(local_mask) <= qib_cpulist_count)) {
+		(cpumask_weight_le(local_mask, qib_cpulist_count + 1))) {
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
diff --git a/drivers/infiniband/sw/siw/siw_main.c b/drivers/infiniband/sw/siw/siw_main.c
index e5c586913d0b..5d6220137a70 100644
--- a/drivers/infiniband/sw/siw/siw_main.c
+++ b/drivers/infiniband/sw/siw/siw_main.c
@@ -193,8 +193,7 @@ int siw_get_tx_cpu(struct siw_device *sdev)
 	else
 		tx_cpumask = siw_cpu_info.tx_valid_cpus[node];
 
-	num_cpus = cpumask_weight(tx_cpumask);
-	if (!num_cpus) {
+	if (cpumask_empty(tx_cpumask)) {
 		/* no CPU on this NUMA node */
 		tx_cpumask = cpu_online_mask;
 		num_cpus = cpumask_weight(tx_cpumask);
diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l1.c
index fd079215c17f..142a7431745f 100644
--- a/drivers/irqchip/irq-bcm6345-l1.c
+++ b/drivers/irqchip/irq-bcm6345-l1.c
@@ -315,7 +315,7 @@ static int __init bcm6345_l1_of_init(struct device_node *dn,
 			cpumask_set_cpu(idx, &intc->cpumask);
 	}
 
-	if (!cpumask_weight(&intc->cpumask)) {
+	if (cpumask_empty(&intc->cpumask)) {
 		ret = -ENODEV;
 		goto out_free;
 	}
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index ba17a8f740a9..3c9e31078f06 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -12626,7 +12626,7 @@ lpfc_cpuhp_get_eq(struct lpfc_hba *phba, unsigned int cpu,
 		 * gone offline yet, we need >1.
 		 */
 		cpumask_and(tmp, maskp, cpu_online_mask);
-		if (cpumask_weight(tmp) > 1)
+		if (cpumask_weight_gt(tmp, 1))
 			continue;
 
 		/* Now that we have an irq to shutdown, get the eq
diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index b7e8e5ec884c..7ef6c624bb59 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -561,7 +561,7 @@ int qman_test_stash(void)
 {
 	int err;
 
-	if (cpumask_weight(cpu_online_mask) < 2) {
+	if (cpumask_weight_le(cpu_online_mask, 2)) {
 		pr_info("%s(): skip - only 1 CPU\n", __func__);
 		return 0;
 	}
diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 64dae70d31f5..b5e50cf74785 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -575,6 +575,38 @@ static inline unsigned int cpumask_weight(const struct cpumask *srcp)
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
+static inline bool cpumask_weight_gt(const struct cpumask *srcp,
+					      unsigned int num)
+{
+	return bitmap_weight_gt(cpumask_bits(srcp), nr_cpumask_bits, num);
+}
+
+/**
+ * cpumask_weight_le - Check if # of bits in *srcp is less than a given number
+ * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
+ * @num: the number to check.
+ */
+static inline bool cpumask_weight_le(const struct cpumask *srcp,
+					      unsigned int num)
+{
+	return bitmap_weight_le(cpumask_bits(srcp), nr_cpumask_bits, num);
+}
+
 /**
  * cpumask_shift_right - *dstp = *srcp >> n
  * @dstp: the cpumask result
diff --git a/kernel/irq/affinity.c b/kernel/irq/affinity.c
index f7ff8919dc9b..18740faf0eb1 100644
--- a/kernel/irq/affinity.c
+++ b/kernel/irq/affinity.c
@@ -258,7 +258,7 @@ static int __irq_build_affinity_masks(unsigned int startvec,
 	nodemask_t nodemsk = NODE_MASK_NONE;
 	struct node_vectors *node_vectors;
 
-	if (!cpumask_weight(cpu_mask))
+	if (cpumask_empty(cpu_mask))
 		return 0;
 
 	nodes = get_nodes_in_cpumask(node_to_cpumask, cpu_mask, &nodemsk);
diff --git a/kernel/padata.c b/kernel/padata.c
index 18d3a5c699d8..e5819bb8bd1d 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -181,7 +181,7 @@ int padata_do_parallel(struct padata_shell *ps,
 		goto out;
 
 	if (!cpumask_test_cpu(*cb_cpu, pd->cpumask.cbcpu)) {
-		if (!cpumask_weight(pd->cpumask.cbcpu))
+		if (cpumask_empty(pd->cpumask.cbcpu))
 			goto out;
 
 		/* Select an alternate fallback CPU and notify the caller. */
diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
index 2461fe8d0c23..82473478e222 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -1135,7 +1135,7 @@ void __init rcu_init_nohz(void)
 	struct rcu_data *rdp;
 
 #if defined(CONFIG_NO_HZ_FULL)
-	if (tick_nohz_full_running && cpumask_weight(tick_nohz_full_mask))
+	if (tick_nohz_full_running && !cpumask_empty(tick_nohz_full_mask))
 		need_rcu_nocb_mask = true;
 #endif /* #if defined(CONFIG_NO_HZ_FULL) */
 
@@ -1319,7 +1319,7 @@ static void __init rcu_organize_nocb_kthreads(void)
  */
 void rcu_bind_current_to_nocb(void)
 {
-	if (cpumask_available(rcu_nocb_mask) && cpumask_weight(rcu_nocb_mask))
+	if (cpumask_available(rcu_nocb_mask) && !cpumask_empty(rcu_nocb_mask))
 		WARN_ON(sched_setaffinity(current->pid, rcu_nocb_mask));
 }
 EXPORT_SYMBOL_GPL(rcu_bind_current_to_nocb);
diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index 463735a3b657..2908495cc840 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -1215,7 +1215,7 @@ static void rcu_boost_kthread_setaffinity(struct rcu_node *rnp, int outgoingcpu)
 		    cpu != outgoingcpu)
 			cpumask_set_cpu(cpu, cm);
 	cpumask_and(cm, cm, housekeeping_cpumask(HK_FLAG_RCU));
-	if (cpumask_weight(cm) == 0)
+	if (cpumask_empty(cm))
 		cpumask_copy(cm, housekeeping_cpumask(HK_FLAG_RCU));
 	set_cpus_allowed_ptr(t, cm);
 	free_cpumask_var(cm);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index beaa8be6241e..c91912c0c005 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6003,7 +6003,7 @@ static void sched_core_cpu_starting(unsigned int cpu)
 	WARN_ON_ONCE(rq->core != rq);
 
 	/* if we're the first, we'll be our own leader */
-	if (cpumask_weight(smt_mask) == 1)
+	if (cpumask_weight_eq(smt_mask, 1))
 		goto unlock;
 
 	/* find the leader */
@@ -6044,7 +6044,7 @@ static void sched_core_cpu_deactivate(unsigned int cpu)
 	sched_core_lock(cpu, &flags);
 
 	/* if we're the last man standing, nothing to do */
-	if (cpumask_weight(smt_mask) == 1) {
+	if (cpumask_weight_eq(smt_mask, 1)) {
 		WARN_ON_ONCE(rq->core != rq);
 		goto unlock;
 	}
@@ -8715,7 +8715,7 @@ int cpuset_cpumask_can_shrink(const struct cpumask *cur,
 {
 	int ret = 1;
 
-	if (!cpumask_weight(cur))
+	if (cpumask_empty(cur))
 		return ret;
 
 	ret = dl_cpuset_cpumask_can_shrink(cur, trial);
@@ -9054,7 +9054,7 @@ int sched_cpu_activate(unsigned int cpu)
 	/*
 	 * When going up, increment the number of cores with SMT present.
 	 */
-	if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
+	if (cpumask_weight_eq(cpu_smt_mask(cpu), 2))
 		static_branch_inc_cpuslocked(&sched_smt_present);
 #endif
 	set_cpu_active(cpu, true);
@@ -9129,7 +9129,7 @@ int sched_cpu_deactivate(unsigned int cpu)
 	/*
 	 * When going down, decrement the number of cores with SMT present.
 	 */
-	if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
+	if (cpumask_weight_eq(cpu_smt_mask(cpu), 2))
 		static_branch_dec_cpuslocked(&sched_smt_present);
 
 	sched_core_cpu_deactivate(cpu);
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index d201a7052a29..79395571599f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -74,7 +74,7 @@ static int sched_domain_debug_one(struct sched_domain *sd, int cpu, int level,
 			break;
 		}
 
-		if (!cpumask_weight(sched_group_span(group))) {
+		if (cpumask_empty(sched_group_span(group))) {
 			printk(KERN_CONT "\n");
 			printk(KERN_ERR "ERROR: empty group\n");
 			break;
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
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index bf6a087e132f..8471b9378206 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -321,7 +321,7 @@ void clocksource_verify_percpu(struct clocksource *cs)
 	cpus_read_lock();
 	preempt_disable();
 	clocksource_verify_choose_cpus();
-	if (cpumask_weight(&cpus_chosen) == 0) {
+	if (cpumask_empty(&cpus_chosen)) {
 		preempt_enable();
 		cpus_read_unlock();
 		pr_warn("Not enough CPUs to check clocksource '%s'.\n", cs->name);
diff --git a/mm/vmstat.c b/mm/vmstat.c
index d701c335628c..295642e2c24c 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -2032,7 +2032,7 @@ static void __init init_cpu_node_state(void)
 	int node;
 
 	for_each_online_node(node) {
-		if (cpumask_weight(cpumask_of_node(node)) > 0)
+		if (!cpumask_empty(cpumask_of_node(node)))
 			node_set_state(node, N_CPU);
 	}
 }
@@ -2059,7 +2059,7 @@ static int vmstat_cpu_dead(unsigned int cpu)
 
 	refresh_zone_stat_thresholds();
 	node_cpus = cpumask_of_node(node);
-	if (cpumask_weight(node_cpus) > 0)
+	if (!cpumask_empty(node_cpus))
 		return 0;
 
 	node_clear_state(node, N_CPU);
-- 
2.25.1

