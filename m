Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6664E479D76
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 22:42:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGfTW1cvqz3cbg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 08:42:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HlMNMuUl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HlMNMuUl; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGf042LK2z2xtL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 08:20:36 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so7457483otl.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 13:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WiGS3vOK/v3O0DRzsnqINP2MiU5j/NpA/iskqvega7k=;
 b=HlMNMuUlRLXl3FqNn86I8HMu4WV/KumXU+SYAsh5OSyredjYqpIOYGrBMItLxHzICY
 RN3GxhpucVS2cEpQMiODoGYePr8Nq2sWHf9LcLO3Wt2YulTnoKg3c1cjdIq07nAW9GiJ
 uGFWERQJyQgWYyrbtTxNAnq3T1rixNekBD2ai9fTLLh9dBZWHb8c2GPqXlB932zfX3o+
 GuHX8YNBw2KAnZJZYEkpeiEnQZqfyuEgudpeOc4ta605tUeKYBdtF+JkgS/rSzrBBc6+
 ah74/2SyVrK6WwdV7QMD08hzgClZ8gGcpdeagLX+n8RBmOqtIeXoz2fiGHcFwqgruiTn
 mm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WiGS3vOK/v3O0DRzsnqINP2MiU5j/NpA/iskqvega7k=;
 b=mk2+lXmToEEh2R92JSVwy0EemNaj8ycdBt0YiLsB7wDQSUgVitUqAEXpZPPyMdiE1n
 8h+WxCFjaK9leDBtKbMTQ/BCzbJOwWGpojeNMpJzskgH9f0m+EL4yUp6OknJjqfs3FV0
 RRLj/RdGrPksn2MnohlX4Fj0tkPVjJxBD0n9VwEQ9pwY1i3/glpCui22siPY89qmUIEU
 gFN7nJNRSvtiWAXE6bKalL+jFd9NVncre7BOV5lOOq4+9JssvW5zRrmE3JnH9HUwXjSO
 Keu13fCgCqoAizzmDrrOxzaR9G5x32IPyPP5OqXz6gok/YEcV0AxtHAN/yeu6eL+Z7ex
 g34Q==
X-Gm-Message-State: AOAM53398PVpTXVFfbHx+dFn7C7mOKLsyLyIUw88eqtVWSMHjiZFVuzP
 yNqtKF0DMWGN+9gPEe+nGeE=
X-Google-Smtp-Source: ABdhPJwkbwteJnk73XW9/tIkjfN6zwjshhmi56ETknCa39Kzdv3ha1PxAhH7MlEZqAvyT17uV1w/Cw==
X-Received: by 2002:a05:6830:1358:: with SMTP id
 r24mr6673017otq.8.1639862433693; 
 Sat, 18 Dec 2021 13:20:33 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id t12sm2156587ood.22.2021.12.18.13.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:33 -0800 (PST)
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
Subject: [PATCH 05/17] all: replace cpumask_weight with cpumask_empty where
 appropriate
Date: Sat, 18 Dec 2021 13:20:01 -0800
Message-Id: <20211218212014.1315894-6-yury.norov@gmail.com>
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

In many cases, kernel code calls cpumask_weight() to check if any bit of
a given cpumask is set. We can do it more efficiently with cpumask_empty()
because cpumask_empty() stops traversing the cpumask as soon as it finds
first set bit, while cpumask_weight() counts all bits unconditionally.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/alpha/kernel/process.c            |  2 +-
 arch/ia64/kernel/setup.c               |  2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 14 +++++++-------
 arch/x86/mm/mmio-mod.c                 |  2 +-
 arch/x86/platform/uv/uv_nmi.c          |  2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c      |  2 +-
 drivers/cpufreq/scmi-cpufreq.c         |  2 +-
 drivers/gpu/drm/i915/i915_pmu.c        |  2 +-
 drivers/infiniband/hw/hfi1/affinity.c  |  4 ++--
 drivers/irqchip/irq-bcm6345-l1.c       |  2 +-
 kernel/irq/affinity.c                  |  2 +-
 kernel/padata.c                        |  2 +-
 kernel/rcu/tree_nocb.h                 |  4 ++--
 kernel/rcu/tree_plugin.h               |  2 +-
 kernel/sched/core.c                    |  2 +-
 kernel/sched/topology.c                |  2 +-
 kernel/time/clocksource.c              |  2 +-
 mm/vmstat.c                            |  4 ++--
 18 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index f4759e4ee4a9..a4415ad44982 100644
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
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index b57b3db9a6a7..e23ff03290b8 100644
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
index 05f3d7876e44..95a0c57ab5bb 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -482,7 +482,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
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
diff --git a/drivers/infiniband/hw/hfi1/affinity.c b/drivers/infiniband/hw/hfi1/affinity.c
index 98c813ba4304..38eee675369a 100644
--- a/drivers/infiniband/hw/hfi1/affinity.c
+++ b/drivers/infiniband/hw/hfi1/affinity.c
@@ -667,7 +667,7 @@ int hfi1_dev_affinity_init(struct hfi1_devdata *dd)
 			 * engines, use the same CPU cores as general/control
 			 * context.
 			 */
-			if (cpumask_weight(&entry->def_intr.mask) == 0)
+			if (cpumask_empty(&entry->def_intr.mask))
 				cpumask_copy(&entry->def_intr.mask,
 					     &entry->general_intr_mask);
 		}
@@ -687,7 +687,7 @@ int hfi1_dev_affinity_init(struct hfi1_devdata *dd)
 		 * vectors, use the same CPU core as the general/control
 		 * context.
 		 */
-		if (cpumask_weight(&entry->comp_vect_mask) == 0)
+		if (cpumask_empty(&entry->comp_vect_mask))
 			cpumask_copy(&entry->comp_vect_mask,
 				     &entry->general_intr_mask);
 	}
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
index 1e40519d1a05..bc038a451768 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -1169,7 +1169,7 @@ void __init rcu_init_nohz(void)
 	struct rcu_data *rdp;
 
 #if defined(CONFIG_NO_HZ_FULL)
-	if (tick_nohz_full_running && cpumask_weight(tick_nohz_full_mask))
+	if (tick_nohz_full_running && !cpumask_empty(tick_nohz_full_mask))
 		need_rcu_nocb_mask = true;
 #endif /* #if defined(CONFIG_NO_HZ_FULL) */
 
@@ -1353,7 +1353,7 @@ static void __init rcu_organize_nocb_kthreads(void)
  */
 void rcu_bind_current_to_nocb(void)
 {
-	if (cpumask_available(rcu_nocb_mask) && cpumask_weight(rcu_nocb_mask))
+	if (cpumask_available(rcu_nocb_mask) && !cpumask_empty(rcu_nocb_mask))
 		WARN_ON(sched_setaffinity(current->pid, rcu_nocb_mask));
 }
 EXPORT_SYMBOL_GPL(rcu_bind_current_to_nocb);
diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index 54ef0e8c8742..3857ff6cb6f7 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -1216,7 +1216,7 @@ static void rcu_boost_kthread_setaffinity(struct rcu_node *rnp, int outgoingcpu)
 		    cpu != outgoingcpu)
 			cpumask_set_cpu(cpu, cm);
 	cpumask_and(cm, cm, housekeeping_cpumask(HK_FLAG_RCU));
-	if (cpumask_weight(cm) == 0)
+	if (cpumask_empty(cm))
 		cpumask_copy(cm, housekeeping_cpumask(HK_FLAG_RCU));
 	set_cpus_allowed_ptr(t, cm);
 	mutex_unlock(&rnp->boost_kthread_mutex);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 83872f95a1ea..9b3ec14227e1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8715,7 +8715,7 @@ int cpuset_cpumask_can_shrink(const struct cpumask *cur,
 {
 	int ret = 1;
 
-	if (!cpumask_weight(cur))
+	if (cpumask_empty(cur))
 		return ret;
 
 	ret = dl_cpuset_cpumask_can_shrink(cur, trial);
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index d201a7052a29..8478e2a8cd65 100644
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
diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 95d7ca35bdf2..cee5da1e54c4 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -343,7 +343,7 @@ void clocksource_verify_percpu(struct clocksource *cs)
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
2.30.2

