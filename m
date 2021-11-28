Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 310B44604EF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 07:28:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1z7p0tFRz2xKT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 17:28:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bPBj2ccc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bPBj2ccc; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1vnZ3Q4qz305F
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 14:57:22 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id l8so12924720qtk.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 19:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cYNeCTG1IpFr1qhO1fWQE0woxSyg/ct2/HrR8cdWCnk=;
 b=bPBj2cccyzLVMyUjDRiFML7IeaQcYuQVmbnCKMz47HZgbWIG89WDJJnadvc1FoDSIg
 GmOTgeaG16ZqgJHhLslg0qix5GujNcrKfmYA4WobRspOykPvjKgRTB9WLdq8kbLdLtq7
 i/G9/c7ft8xWODGjhvUYdsBC9k6pp3DTCNe9BolIDsDgalXNvKsJ7YTe/F6LDUOu4Q6M
 Qaxf9Jcg9b1v6eXVrRHfNtfDEaJtC7Vb5a8xLc+QCTdGCEj/VoJn2QhSkK4iF+HrFsOw
 v+Zxv4xIw/QZIrdbk63WqFEMXoBtXnKodpp3aPe9PkKmlI7e0Z+lGjfLK4pNF/37tOze
 LWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cYNeCTG1IpFr1qhO1fWQE0woxSyg/ct2/HrR8cdWCnk=;
 b=3uvHUuE/qYYPXDL/B49Blm8JZ3WMPn32K/QTMrmjB3lvVPtGchDSFoNDEAODEKkTmw
 obR4At2diYpcwGDSMuzDKbuGQBAV8wcbHOnog8nFazakkhfL2Or2wne2Z8IPwa07hHWY
 UA+APh0bO9OhCpLhaFTmZcMy+wtkEVbuhzBw4JTiBsLDn0Z4py1bmqAdhMUVJCypPDTE
 GPErU74fHgpbUrxGpeEzAZlKaZJLFwu3vafILYa8H541GRt8FGJ3TBYWaMbx9vR/AFLe
 fuyCRoC0Ti9b7equpDOepIm3o8Ihbj40bf02KLR+mtCLENbJ5Cz0Oik39xMPGE5xQ3x+
 Ro+g==
X-Gm-Message-State: AOAM531hLvGPRwaaj9ue/lbE+MlLKyrjuTgKzEc1xtdpXzNGmabvvHEF
 sw/AOd8XyL3SVJ8vX+l6ZU4=
X-Google-Smtp-Source: ABdhPJz1+NjazYmKW0e0OMXvT/Uq7fTPmftKVrTSAloxkHaE0UXJhfsgRslAvuaTxNXO1L3D0gYStg==
X-Received: by 2002:a05:622a:1896:: with SMTP id
 v22mr26275902qtc.496.1638071840026; 
 Sat, 27 Nov 2021 19:57:20 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id o9sm6782196qtk.81.2021.11.27.19.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 19:57:19 -0800 (PST)
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
Subject: [PATCH 7/9] lib/cpumask: add num_{possible, present, active}_cpus_{eq,
 gt, le}
Date: Sat, 27 Nov 2021 19:57:02 -0800
Message-Id: <20211128035704.270739-8-yury.norov@gmail.com>
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

Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
with one of new functions where appropriate. This allows num_*_cpus_*()
to return earlier depending on the condition.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/arc/kernel/smp.c                         |  2 +-
 arch/arm/kernel/machine_kexec.c               |  2 +-
 arch/arm/mach-exynos/exynos.c                 |  2 +-
 arch/arm/mm/cache-b15-rac.c                   |  2 +-
 arch/arm64/kernel/smp.c                       |  2 +-
 arch/arm64/mm/context.c                       |  2 +-
 arch/csky/mm/asid.c                           |  2 +-
 arch/csky/mm/context.c                        |  2 +-
 arch/ia64/mm/tlb.c                            |  6 ++---
 arch/mips/kernel/i8253.c                      |  2 +-
 arch/mips/kernel/perf_event_mipsxx.c          |  4 ++--
 arch/mips/kernel/rtlx-cmp.c                   |  2 +-
 arch/mips/kernel/smp.c                        |  4 ++--
 arch/mips/kernel/vpe-cmp.c                    |  2 +-
 .../loongson2ef/common/cs5536/cs5536_mfgpt.c  |  2 +-
 arch/mips/mm/context.c                        |  2 +-
 arch/mips/mm/tlbex.c                          |  2 +-
 arch/nios2/kernel/cpuinfo.c                   |  2 +-
 arch/powerpc/platforms/85xx/smp.c             |  2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |  4 ++--
 arch/powerpc/sysdev/mpic.c                    |  2 +-
 arch/powerpc/xmon/xmon.c                      |  6 ++---
 arch/riscv/kvm/vmid.c                         |  2 +-
 arch/sparc/kernel/mdesc.c                     |  6 ++---
 arch/x86/events/amd/core.c                    |  2 +-
 arch/x86/kernel/alternative.c                 |  8 +++----
 arch/x86/kernel/apic/apic.c                   |  4 ++--
 arch/x86/kernel/apic/apic_flat_64.c           |  2 +-
 arch/x86/kernel/apic/probe_32.c               |  2 +-
 arch/x86/kernel/cpu/mce/dev-mcelog.c          |  2 +-
 arch/x86/kernel/hpet.c                        |  2 +-
 arch/x86/kernel/i8253.c                       |  2 +-
 arch/x86/kernel/kvm.c                         |  2 +-
 arch/x86/kernel/kvmclock.c                    |  2 +-
 arch/x86/kernel/tsc.c                         |  2 +-
 arch/x86/xen/smp_pv.c                         |  2 +-
 arch/x86/xen/spinlock.c                       |  2 +-
 drivers/clk/samsung/clk-exynos4.c             |  2 +-
 drivers/clocksource/ingenic-timer.c           |  3 +--
 drivers/cpufreq/pcc-cpufreq.c                 |  2 +-
 drivers/dma/mv_xor.c                          |  5 ++--
 drivers/gpu/drm/i810/i810_drv.c               |  2 +-
 drivers/irqchip/irq-gic.c                     |  2 +-
 drivers/net/caif/caif_virtio.c                |  2 +-
 .../cavium/liquidio/cn23xx_vf_device.c        |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c |  2 +-
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  2 +-
 drivers/net/wireless/ath/ath9k/hw.c           |  2 +-
 drivers/net/wireless/marvell/mwifiex/main.c   |  4 ++--
 drivers/net/wireless/st/cw1200/queue.c        |  3 +--
 drivers/nvdimm/region.c                       |  2 +-
 drivers/nvme/host/pci.c                       |  2 +-
 drivers/perf/arm_pmu.c                        |  2 +-
 .../intel/speed_select_if/isst_if_common.c    |  6 ++---
 drivers/soc/bcm/brcmstb/biuctrl.c             |  2 +-
 drivers/soc/fsl/dpio/dpio-service.c           |  4 ++--
 drivers/spi/spi-dw-bt1.c                      |  2 +-
 drivers/virt/acrn/hsm.c                       |  2 +-
 fs/xfs/xfs_sysfs.c                            |  2 +-
 include/linux/cpumask.h                       | 23 +++++++++++++++++++
 include/linux/kdb.h                           |  2 +-
 kernel/debug/kdb/kdb_bt.c                     |  2 +-
 kernel/printk/printk.c                        |  2 +-
 kernel/reboot.c                               |  4 ++--
 kernel/time/clockevents.c                     |  2 +-
 mm/percpu.c                                   |  6 ++---
 mm/slab.c                                     |  2 +-
 67 files changed, 110 insertions(+), 90 deletions(-)

diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 78e6d069b1c1..d4f2765755c9 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	 * if platform didn't set the present map already, do it now
 	 * boot cpu is set to present already by init/main.c
 	 */
-	if (num_present_cpus() <= 1)
+	if (num_present_cpus_le(2))
 		init_cpu_present(cpu_possible_mask);
 }
 
diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
index f567032a09c0..8875e2ee0083 100644
--- a/arch/arm/kernel/machine_kexec.c
+++ b/arch/arm/kernel/machine_kexec.c
@@ -44,7 +44,7 @@ int machine_kexec_prepare(struct kimage *image)
 	 * and implements CPU hotplug for the current HW. If not, we won't be
 	 * able to kexec reliably, so fail the prepare operation.
 	 */
-	if (num_possible_cpus() > 1 && platform_can_secondary_boot() &&
+	if (num_possible_cpus_gt(1) && platform_can_secondary_boot() &&
 	    !platform_can_cpu_hotplug())
 		return -EINVAL;
 
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 8b48326be9fd..ba658402ac1e 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -120,7 +120,7 @@ void exynos_set_delayed_reset_assertion(bool enable)
 	if (of_machine_is_compatible("samsung,exynos4")) {
 		unsigned int tmp, core_id;
 
-		for (core_id = 0; core_id < num_possible_cpus(); core_id++) {
+		for (core_id = 0; num_possible_cpus_gt(core_id); core_id++) {
 			tmp = pmu_raw_readl(EXYNOS_ARM_CORE_OPTION(core_id));
 			if (enable)
 				tmp |= S5P_USE_DELAYED_RESET_ASSERTION;
diff --git a/arch/arm/mm/cache-b15-rac.c b/arch/arm/mm/cache-b15-rac.c
index bdc07030997b..202c3a6cf98b 100644
--- a/arch/arm/mm/cache-b15-rac.c
+++ b/arch/arm/mm/cache-b15-rac.c
@@ -296,7 +296,7 @@ static int __init b15_rac_init(void)
 	if (!dn)
 		return -ENODEV;
 
-	if (WARN(num_possible_cpus() > 4, "RAC only supports 4 CPUs\n"))
+	if (WARN(num_possible_cpus_gt(4), "RAC only supports 4 CPUs\n"))
 		goto out;
 
 	b15_rac_base = of_iomap(dn, 0);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 27df5c1e6baa..bd1280e5081b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1099,7 +1099,7 @@ static bool have_cpu_die(void)
 
 bool cpus_are_stuck_in_kernel(void)
 {
-	bool smp_spin_tables = (num_possible_cpus() > 1 && !have_cpu_die());
+	bool smp_spin_tables = (num_possible_cpus_gt(1) && !have_cpu_die());
 
 	return !!cpus_stuck_in_kernel || smp_spin_tables ||
 		is_protected_kvm_enabled();
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index cd72576ae2b7..702248dc105e 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -384,7 +384,7 @@ static int asids_update_limit(void)
 	 * Expect allocation after rollover to fail if we don't have at least
 	 * one more ASID than CPUs. ASID #0 is reserved for init_mm.
 	 */
-	WARN_ON(num_available_asids - 1 <= num_possible_cpus());
+	WARN_ON(num_possible_cpus_gt(num_available_asids - 2));
 	pr_info("ASID allocator initialised with %lu entries\n",
 		num_available_asids);
 
diff --git a/arch/csky/mm/asid.c b/arch/csky/mm/asid.c
index b2e914745c1d..4dd6eb62a9e0 100644
--- a/arch/csky/mm/asid.c
+++ b/arch/csky/mm/asid.c
@@ -176,7 +176,7 @@ int asid_allocator_init(struct asid_info *info,
 	 * Expect allocation after rollover to fail if we don't have at least
 	 * one more ASID than CPUs. ASID #0 is always reserved.
 	 */
-	WARN_ON(NUM_CTXT_ASIDS(info) - 1 <= num_possible_cpus());
+	WARN_ON(num_possible_cpus_gt(NUM_CTXT_ASIDS(info) - 2));
 	atomic64_set(&info->generation, ASID_FIRST_VERSION(info));
 	info->map = kcalloc(BITS_TO_LONGS(NUM_CTXT_ASIDS(info)),
 			    sizeof(*info->map), GFP_KERNEL);
diff --git a/arch/csky/mm/context.c b/arch/csky/mm/context.c
index 0d95bdd93846..c12312215bde 100644
--- a/arch/csky/mm/context.c
+++ b/arch/csky/mm/context.c
@@ -28,7 +28,7 @@ static void asid_flush_cpu_ctxt(void)
 
 static int asids_init(void)
 {
-	BUG_ON(((1 << CONFIG_CPU_ASID_BITS) - 1) <= num_possible_cpus());
+	BUG_ON(num_possible_cpus_gt((1 << CONFIG_CPU_ASID_BITS) - 2));
 
 	if (asid_allocator_init(&asid_info, CONFIG_CPU_ASID_BITS, 1,
 				asid_flush_cpu_ctxt))
diff --git a/arch/ia64/mm/tlb.c b/arch/ia64/mm/tlb.c
index a5bce13ab047..44f623f5dc5e 100644
--- a/arch/ia64/mm/tlb.c
+++ b/arch/ia64/mm/tlb.c
@@ -202,7 +202,7 @@ setup_ptcg_sem(int max_purges, int nptcg_from)
 		goto resetsema;
 	}
 	if (kp_override) {
-		need_ptcg_sem = num_possible_cpus() > nptcg;
+		need_ptcg_sem = num_possible_cpus_gt(nptcg);
 		return;
 	}
 
@@ -221,7 +221,7 @@ setup_ptcg_sem(int max_purges, int nptcg_from)
 	}
 	if (palo_override) {
 		if (nptcg != PALO_MAX_TLB_PURGES)
-			need_ptcg_sem = (num_possible_cpus() > nptcg);
+			need_ptcg_sem = num_possible_cpus_gt(nptcg);
 		return;
 	}
 
@@ -238,7 +238,7 @@ setup_ptcg_sem(int max_purges, int nptcg_from)
 		need_ptcg_sem = 0;
 		return;
 	} else
-		need_ptcg_sem = (num_possible_cpus() > nptcg);
+		need_ptcg_sem = num_possible_cpus_gt(nptcg);
 
 resetsema:
 	spinaphore_init(&ptcg_sem, max_purges);
diff --git a/arch/mips/kernel/i8253.c b/arch/mips/kernel/i8253.c
index ca21210e06b5..89a63538be4a 100644
--- a/arch/mips/kernel/i8253.c
+++ b/arch/mips/kernel/i8253.c
@@ -29,7 +29,7 @@ void __init setup_pit_timer(void)
 
 static int __init init_pit_clocksource(void)
 {
-	if (num_possible_cpus() > 1 || /* PIT does not scale! */
+	if (num_possible_cpus_gt(1) || /* PIT does not scale! */
 	    !clockevent_state_periodic(&i8253_clockevent))
 		return 0;
 
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 1641d274fe37..4b6458899b05 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -135,7 +135,7 @@ static DEFINE_RWLOCK(pmuint_rwlock);
 /* Copied from op_model_mipsxx.c */
 static unsigned int vpe_shift(void)
 {
-	if (num_possible_cpus() > 1)
+	if (num_possible_cpus_gt(1))
 		return 1;
 
 	return 0;
@@ -704,7 +704,7 @@ static unsigned int mipspmu_perf_event_encode(const struct mips_perf_event *pev)
  * event_id.
  */
 #ifdef CONFIG_MIPS_MT_SMP
-	if (num_possible_cpus() > 1)
+	if (num_possible_cpus_gt(1))
 		return ((unsigned int)pev->range << 24) |
 			(pev->cntr_mask & 0xffff00) |
 			(pev->event_id & 0xff);
diff --git a/arch/mips/kernel/rtlx-cmp.c b/arch/mips/kernel/rtlx-cmp.c
index d26dcc4b46e7..e4bb83bc46c6 100644
--- a/arch/mips/kernel/rtlx-cmp.c
+++ b/arch/mips/kernel/rtlx-cmp.c
@@ -54,7 +54,7 @@ int __init rtlx_module_init(void)
 		return -ENODEV;
 	}
 
-	if (num_possible_cpus() - aprp_cpu_index() < 1) {
+	if (num_possible_cpus_le(aprp_cpu_index() + 1)) {
 		pr_warn("No TCs reserved for AP/SP, not initializing RTLX.\n"
 			"Pass maxcpus=<n> argument as kernel argument\n");
 
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index d542fb7af3ba..6a0bbf249528 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -248,7 +248,7 @@ int mips_smp_ipi_allocate(const struct cpumask *mask)
 	 * setup, if we're running with only a single CPU.
 	 */
 	if (!ipidomain) {
-		BUG_ON(num_present_cpus() > 1);
+		BUG_ON(num_present_cpus_gt(1));
 		return 0;
 	}
 
@@ -314,7 +314,7 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 
 static int __init mips_smp_ipi_init(void)
 {
-	if (num_possible_cpus() == 1)
+	if (num_possible_cpus_eq(1))
 		return 0;
 
 	mips_smp_ipi_allocate(cpu_possible_mask);
diff --git a/arch/mips/kernel/vpe-cmp.c b/arch/mips/kernel/vpe-cmp.c
index e673603e11e5..c1dc00cda666 100644
--- a/arch/mips/kernel/vpe-cmp.c
+++ b/arch/mips/kernel/vpe-cmp.c
@@ -98,7 +98,7 @@ int __init vpe_module_init(void)
 		return -ENODEV;
 	}
 
-	if (num_possible_cpus() - aprp_cpu_index() < 1) {
+	if (num_possible_cpus_le(aprp_cpu_index() + 1)) {
 		pr_warn("No VPEs reserved for AP/SP, not initialize VPE loader\n"
 			"Pass maxcpus=<n> argument as kernel argument\n");
 		return -ENODEV;
diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c b/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
index f21a540a1dd2..37166fa866c4 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
@@ -194,7 +194,7 @@ static struct clocksource clocksource_mfgpt = {
 
 int __init init_mfgpt_clocksource(void)
 {
-	if (num_possible_cpus() > 1)	/* MFGPT does not scale! */
+	if (num_possible_cpus_gt(1))	/* MFGPT does not scale! */
 		return 0;
 
 	return clocksource_register_hz(&clocksource_mfgpt, MFGPT_TICK_RATE);
diff --git a/arch/mips/mm/context.c b/arch/mips/mm/context.c
index b25564090939..bf508e38d30a 100644
--- a/arch/mips/mm/context.c
+++ b/arch/mips/mm/context.c
@@ -274,7 +274,7 @@ static int mmid_init(void)
 	 * one more MMID than CPUs.
 	 */
 	num_mmids = asid_first_version(0);
-	WARN_ON(num_mmids <= num_possible_cpus());
+	WARN_ON(num_possible_cpus_gt(num_mmids - 1));
 
 	atomic64_set(&mmid_version, asid_first_version(0));
 	mmid_map = kcalloc(BITS_TO_LONGS(num_mmids), sizeof(*mmid_map),
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index bede66b072a7..92dae5cfa0a4 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -363,7 +363,7 @@ static struct work_registers build_get_work_registers(u32 **p)
 		return r;
 	}
 
-	if (num_possible_cpus() > 1) {
+	if (num_possible_cpus_gt(1)) {
 		/* Get smp_processor_id */
 		UASM_i_CPUID_MFC0(p, K0, SMP_CPUID_REG);
 		UASM_i_SRL_SAFE(p, K0, K0, SMP_CPUID_REGSHIFT);
diff --git a/arch/nios2/kernel/cpuinfo.c b/arch/nios2/kernel/cpuinfo.c
index 203870c4b86d..7bdc511eba60 100644
--- a/arch/nios2/kernel/cpuinfo.c
+++ b/arch/nios2/kernel/cpuinfo.c
@@ -172,7 +172,7 @@ static void *cpuinfo_start(struct seq_file *m, loff_t *pos)
 {
 	unsigned long i = *pos;
 
-	return i < num_possible_cpus() ? (void *) (i + 1) : NULL;
+	return num_possible_cpus_gt(i) ? (void *) (i + 1) : NULL;
 }
 
 static void *cpuinfo_next(struct seq_file *m, void *v, loff_t *pos)
diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 83f4a6389a28..15573310fab4 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -280,7 +280,7 @@ static int smp_85xx_kick_cpu(int nr)
 	int primary = nr;
 #endif
 
-	WARN_ON(nr < 0 || nr >= num_possible_cpus());
+	WARN_ON(nr < 0 || num_possible_cpus_le(nr + 1));
 
 	pr_debug("kick CPU #%d\n", nr);
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 5ab44600c8d3..b0d66de92309 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -365,7 +365,7 @@ static int dlpar_offline_cpu(struct device_node *dn)
 			cpu_maps_update_begin();
 			break;
 		}
-		if (cpu == num_possible_cpus()) {
+		if (num_possible_cpus_eq(cpu)) {
 			pr_warn("Could not find cpu to offline with physical id 0x%x\n",
 				thread);
 		}
@@ -408,7 +408,7 @@ static int dlpar_online_cpu(struct device_node *dn)
 
 			break;
 		}
-		if (cpu == num_possible_cpus())
+		if (num_possible_cpus_eq(cpu))
 			printk(KERN_WARNING "Could not find cpu to online "
 			       "with physical id 0x%x\n", thread);
 	}
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 995fb2ada507..ded5007f2af9 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1440,7 +1440,7 @@ struct mpic * __init mpic_alloc(struct device_node *node,
 	 * The MPIC driver will crash if there are more cores than we
 	 * can initialize, so we may as well catch that problem here.
 	 */
-	BUG_ON(num_possible_cpus() > MPIC_MAX_CPUS);
+	BUG_ON(num_possible_cpus_gt(MPIC_MAX_CPUS));
 
 	/* Map the per-CPU registers */
 	for_each_possible_cpu(i) {
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 2073be312fe9..938346f9af7d 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2747,7 +2747,7 @@ static void dump_all_pacas(void)
 {
 	int cpu;
 
-	if (num_possible_cpus() == 0) {
+	if (num_possible_cpus_eq(0)) {
 		printf("No possible cpus, use 'dp #' to dump individual cpus\n");
 		return;
 	}
@@ -2809,7 +2809,7 @@ static void dump_all_xives(void)
 {
 	int cpu;
 
-	if (num_possible_cpus() == 0) {
+	if (num_possible_cpus_eq(0)) {
 		printf("No possible cpus, use 'dx #' to dump individual cpus\n");
 		return;
 	}
@@ -3692,7 +3692,7 @@ symbol_lookup(void)
 		    ptr >= (void __percpu *)__per_cpu_start &&
 		    ptr < (void __percpu *)__per_cpu_end)
 		{
-			if (scanhex(&cpu) && cpu < num_possible_cpus()) {
+			if (scanhex(&cpu) && num_possible_cpus_gt(cpu)) {
 				addr = (unsigned long)per_cpu_ptr(ptr, cpu);
 			} else {
 				cpu = raw_smp_processor_id();
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 2c6253b293bc..6e176baedf65 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -36,7 +36,7 @@ void kvm_riscv_stage2_vmid_detect(void)
 	__kvm_riscv_hfence_gvma_all();
 
 	/* We don't use VMID bits if they are not sufficient */
-	if ((1UL << vmid_bits) < num_possible_cpus())
+	if (num_possible_cpus_gt(1UL << vmid_bits))
 		vmid_bits = 0;
 }
 
diff --git a/arch/sparc/kernel/mdesc.c b/arch/sparc/kernel/mdesc.c
index 30f171b7b00c..b779c6607ff3 100644
--- a/arch/sparc/kernel/mdesc.c
+++ b/arch/sparc/kernel/mdesc.c
@@ -885,7 +885,7 @@ static void __mark_core_id(struct mdesc_handle *hp, u64 node,
 {
 	const u64 *id = mdesc_get_property(hp, node, "id", NULL);
 
-	if (*id < num_possible_cpus())
+	if (num_possible_cpus_gt(*id))
 		cpu_data(*id).core_id = core_id;
 }
 
@@ -894,7 +894,7 @@ static void __mark_max_cache_id(struct mdesc_handle *hp, u64 node,
 {
 	const u64 *id = mdesc_get_property(hp, node, "id", NULL);
 
-	if (*id < num_possible_cpus()) {
+	if (num_possible_cpus_gt(*id)) {
 		cpu_data(*id).max_cache_id = max_cache_id;
 
 		/**
@@ -986,7 +986,7 @@ static void set_sock_ids_by_socket(struct mdesc_handle *hp, u64 mp)
 				continue;
 
 			id = mdesc_get_property(hp, t, "id", NULL);
-			if (*id < num_possible_cpus())
+			if (num_possible_cpus_gt(*id))
 				cpu_data(*id).sock_id = idx;
 		}
 		idx++;
diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index 9687a8aef01c..d69ed09a85b0 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -1007,7 +1007,7 @@ __init int amd_pmu_init(void)
 	if (ret)
 		return ret;
 
-	if (num_possible_cpus() == 1) {
+	if (num_possible_cpus_eq(1)) {
 		/*
 		 * No point in allocating data structures to serialize
 		 * against other CPUs, when there is only the one CPU.
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 23fb4d51a5da..55fd70fdb213 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -574,7 +574,7 @@ void __init_or_module alternatives_smp_module_add(struct module *mod,
 	if (!uniproc_patched)
 		goto unlock;
 
-	if (num_possible_cpus() == 1)
+	if (num_possible_cpus_eq(1))
 		/* Don't bother remembering, we'll never have to undo it. */
 		goto smp_unlock;
 
@@ -620,7 +620,7 @@ void alternatives_enable_smp(void)
 	struct smp_alt_module *mod;
 
 	/* Why bother if there are no other CPUs? */
-	BUG_ON(num_possible_cpus() == 1);
+	BUG_ON(num_possible_cpus_eq(1));
 
 	mutex_lock(&text_mutex);
 
@@ -833,14 +833,14 @@ void __init alternative_instructions(void)
 
 #ifdef CONFIG_SMP
 	/* Patch to UP if other cpus not imminent. */
-	if (!noreplace_smp && (num_present_cpus() == 1 || setup_max_cpus <= 1)) {
+	if (!noreplace_smp && (num_present_cpus_eq(1) || setup_max_cpus <= 1)) {
 		uniproc_patched = true;
 		alternatives_smp_module_add(NULL, "core kernel",
 					    __smp_locks, __smp_locks_end,
 					    _text, _etext);
 	}
 
-	if (!uniproc_patched || num_possible_cpus() == 1) {
+	if (!uniproc_patched || num_possible_cpus_eq(1)) {
 		free_init_pages("SMP alternatives",
 				(unsigned long)__smp_locks,
 				(unsigned long)__smp_locks_end);
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index b70344bf6600..9a3d0748ca86 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1020,7 +1020,7 @@ void __init setup_boot_APIC_clock(void)
 	if (disable_apic_timer) {
 		pr_info("Disabling APIC timer\n");
 		/* No broadcast on UP ! */
-		if (num_possible_cpus() > 1) {
+		if (num_possible_cpus_gt(1)) {
 			lapic_clockevent.mult = 1;
 			setup_APIC_timer();
 		}
@@ -1029,7 +1029,7 @@ void __init setup_boot_APIC_clock(void)
 
 	if (calibrate_APIC_clock()) {
 		/* No broadcast on UP ! */
-		if (num_possible_cpus() > 1)
+		if (num_possible_cpus_gt(1))
 			setup_APIC_timer();
 		return;
 	}
diff --git a/arch/x86/kernel/apic/apic_flat_64.c b/arch/x86/kernel/apic/apic_flat_64.c
index 8f72b4351c9f..3dfd4c5d30dc 100644
--- a/arch/x86/kernel/apic/apic_flat_64.c
+++ b/arch/x86/kernel/apic/apic_flat_64.c
@@ -189,7 +189,7 @@ static void physflat_init_apic_ldr(void)
 
 static int physflat_probe(void)
 {
-	if (apic == &apic_physflat || num_possible_cpus() > 8 ||
+	if (apic == &apic_physflat || num_possible_cpus_gt(8) ||
 	    jailhouse_paravirt())
 		return 1;
 
diff --git a/arch/x86/kernel/apic/probe_32.c b/arch/x86/kernel/apic/probe_32.c
index a61f642b1b90..b65c1572aaf5 100644
--- a/arch/x86/kernel/apic/probe_32.c
+++ b/arch/x86/kernel/apic/probe_32.c
@@ -138,7 +138,7 @@ void __init default_setup_apic_routing(void)
 {
 	int version = boot_cpu_apic_version;
 
-	if (num_possible_cpus() > 8) {
+	if (num_possible_cpus_gt(8)) {
 		switch (boot_cpu_data.x86_vendor) {
 		case X86_VENDOR_INTEL:
 			if (!APIC_XAPIC(version)) {
diff --git a/arch/x86/kernel/cpu/mce/dev-mcelog.c b/arch/x86/kernel/cpu/mce/dev-mcelog.c
index 100fbeebdc72..34e44b0d9546 100644
--- a/arch/x86/kernel/cpu/mce/dev-mcelog.c
+++ b/arch/x86/kernel/cpu/mce/dev-mcelog.c
@@ -310,7 +310,7 @@ static ssize_t mce_chrdev_write(struct file *filp, const char __user *ubuf,
 	if (copy_from_user(&m, ubuf, usize))
 		return -EFAULT;
 
-	if (m.extcpu >= num_possible_cpus() || !cpu_online(m.extcpu))
+	if (num_possible_cpus_le(m.extcpu + 1) || !cpu_online(m.extcpu))
 		return -EINVAL;
 
 	/*
diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 882213df3713..e432e6248599 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -737,7 +737,7 @@ static void __init hpet_select_clockevents(void)
 		hc->irq = irq;
 		hc->mode = HPET_MODE_CLOCKEVT;
 
-		if (++hpet_base.nr_clockevents == num_possible_cpus())
+		if (num_possible_cpus_eq(++hpet_base.nr_clockevents))
 			break;
 	}
 
diff --git a/arch/x86/kernel/i8253.c b/arch/x86/kernel/i8253.c
index 2b7999a1a50a..e6e30a7bc80f 100644
--- a/arch/x86/kernel/i8253.c
+++ b/arch/x86/kernel/i8253.c
@@ -57,7 +57,7 @@ static int __init init_pit_clocksource(void)
 	  * - when HPET is enabled
 	  * - when local APIC timer is active (PIT is switched off)
 	  */
-	if (num_possible_cpus() > 1 || is_hpet_enabled() ||
+	if (num_possible_cpus_gt(1) || is_hpet_enabled() ||
 	    !clockevent_state_periodic(&i8253_clockevent))
 		return 0;
 
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 59abbdad7729..375226dcf29e 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -1057,7 +1057,7 @@ void __init kvm_spinlock_init(void)
 		goto out;
 	}
 
-	if (num_possible_cpus() == 1) {
+	if (num_possible_cpus_eq(1)) {
 		pr_info("PV spinlocks disabled, single CPU\n");
 		goto out;
 	}
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 462dd8e9b03d..12c1fb1dfd07 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -205,7 +205,7 @@ static void __init kvmclock_init_mem(void)
 	struct page *p;
 	int r;
 
-	if (HVC_BOOT_ARRAY_SIZE >= num_possible_cpus())
+	if (num_possible_cpus_le(HVC_BOOT_ARRAY_SIZE + 1))
 		return;
 
 	ncpus = num_possible_cpus() - HVC_BOOT_ARRAY_SIZE;
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 2e076a459a0c..2245c9721d4a 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1223,7 +1223,7 @@ int unsynchronized_tsc(void)
 	 */
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
 		/* assume multi socket systems are not synchronized: */
-		if (num_possible_cpus() > 1)
+		if (num_possible_cpus_gt(1))
 			return 1;
 	}
 
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 6a8f3b53ab83..b32ca28292ae 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -254,7 +254,7 @@ static void __init xen_pv_smp_prepare_cpus(unsigned int max_cpus)
 	cpumask_copy(xen_cpu_initialized_map, cpumask_of(0));
 
 	/* Restrict the possible_map according to max_cpus. */
-	while ((num_possible_cpus() > 1) && (num_possible_cpus() > max_cpus)) {
+	while (num_possible_cpus_gt(max(1, max_cpus))) {
 		for (cpu = nr_cpu_ids - 1; !cpu_possible(cpu); cpu--)
 			continue;
 		set_cpu_possible(cpu, false);
diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 043c73dfd2c9..58caaa9aec3e 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -125,7 +125,7 @@ PV_CALLEE_SAVE_REGS_THUNK(xen_vcpu_stolen);
 void __init xen_init_spinlocks(void)
 {
 	/*  Don't need to use pvqspinlock code if there is only 1 vCPU. */
-	if (num_possible_cpus() == 1 || nopvspin)
+	if (num_possible_cpus_eq(1) || nopvspin)
 		xen_pvspin = false;
 
 	if (!xen_pvspin) {
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 22009cb53428..64d7de6b885c 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1178,7 +1178,7 @@ static void __init exynos4x12_core_down_clock(void)
 		PWR_CTRL1_USE_CORE1_WFE | PWR_CTRL1_USE_CORE0_WFE |
 		PWR_CTRL1_USE_CORE1_WFI | PWR_CTRL1_USE_CORE0_WFI);
 	/* On Exynos4412 enable it also on core 2 and 3 */
-	if (num_possible_cpus() == 4)
+	if (num_possible_cpus_eq(4))
 		tmp |= PWR_CTRL1_USE_CORE3_WFE | PWR_CTRL1_USE_CORE2_WFE |
 		       PWR_CTRL1_USE_CORE3_WFI | PWR_CTRL1_USE_CORE2_WFI;
 	writel_relaxed(tmp, reg_base + PWR_CTRL1);
diff --git a/drivers/clocksource/ingenic-timer.c b/drivers/clocksource/ingenic-timer.c
index 24ed0f1f089b..c4a34d26357c 100644
--- a/drivers/clocksource/ingenic-timer.c
+++ b/drivers/clocksource/ingenic-timer.c
@@ -302,8 +302,7 @@ static int __init ingenic_tcu_init(struct device_node *np)
 			     (u32 *)&tcu->pwm_channels_mask);
 
 	/* Verify that we have at least num_possible_cpus() + 1 free channels */
-	if (hweight8(tcu->pwm_channels_mask) >
-			soc_info->num_channels - num_possible_cpus() + 1) {
+	if (num_possible_cpus_gt(soc_info->num_channels + 1 - hweight8(tcu->pwm_channels_mask))) {
 		pr_crit("%s: Invalid PWM channel mask: 0x%02lx\n", __func__,
 			tcu->pwm_channels_mask);
 		ret = -EINVAL;
diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
index 9f3fc7a073d0..8bf76eaa9e1e 100644
--- a/drivers/cpufreq/pcc-cpufreq.c
+++ b/drivers/cpufreq/pcc-cpufreq.c
@@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
 		return ret;
 	}
 
-	if (num_present_cpus() > 4) {
+	if (num_present_cpus_gt(4)) {
 		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
 		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
 		       __func__);
diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 23b232b57518..f99177e72158 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1293,7 +1293,7 @@ static int mv_xor_probe(struct platform_device *pdev)
 	struct mv_xor_device *xordev;
 	struct mv_xor_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct resource *res;
-	unsigned int max_engines, max_channels;
+	unsigned int max_channels;
 	int i, ret;
 
 	dev_notice(&pdev->dev, "Marvell shared XOR driver\n");
@@ -1362,7 +1362,6 @@ static int mv_xor_probe(struct platform_device *pdev)
 	 * separate engines when possible.  For dual-CPU Armada 3700
 	 * SoC with single XOR engine allow using its both channels.
 	 */
-	max_engines = num_present_cpus();
 	if (xordev->xor_type == XOR_ARMADA_37XX)
 		max_channels =	num_present_cpus();
 	else
@@ -1370,7 +1369,7 @@ static int mv_xor_probe(struct platform_device *pdev)
 				     MV_XOR_MAX_CHANNELS,
 				     DIV_ROUND_UP(num_present_cpus(), 2));
 
-	if (mv_xor_engine_count >= max_engines)
+	if (num_present_cpus_le(mv_xor_engine_count + 1))
 		return 0;
 
 	if (pdev->dev.of_node) {
diff --git a/drivers/gpu/drm/i810/i810_drv.c b/drivers/gpu/drm/i810/i810_drv.c
index 0e53a066d4db..c70745fa4166 100644
--- a/drivers/gpu/drm/i810/i810_drv.c
+++ b/drivers/gpu/drm/i810/i810_drv.c
@@ -80,7 +80,7 @@ static struct pci_driver i810_pci_driver = {
 
 static int __init i810_init(void)
 {
-	if (num_possible_cpus() > 1) {
+	if (num_possible_cpus_gt(1)) {
 		pr_err("drm/i810 does not support SMP\n");
 		return -EINVAL;
 	}
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index b8bb46c65a97..4e319e4ba9dc 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -430,7 +430,7 @@ static u8 gic_get_cpumask(struct gic_chip_data *gic)
 			break;
 	}
 
-	if (!mask && num_possible_cpus() > 1)
+	if (!mask && num_possible_cpus_gt(1))
 		pr_crit("GIC CPU mask not found - kernel will fail to boot.\n");
 
 	return mask;
diff --git a/drivers/net/caif/caif_virtio.c b/drivers/net/caif/caif_virtio.c
index 91230894692d..c7aa3f6dc635 100644
--- a/drivers/net/caif/caif_virtio.c
+++ b/drivers/net/caif/caif_virtio.c
@@ -537,7 +537,7 @@ static netdev_tx_t cfv_netdev_tx(struct sk_buff *skb, struct net_device *netdev)
 	 *
 	 * Flow-on is triggered when sufficient buffers are freed
 	 */
-	if (unlikely(cfv->vq_tx->num_free <= num_present_cpus())) {
+	if (unlikely(num_present_cpus_gt(cfv->vq_tx->num_free - 1))) {
 		flow_off = true;
 		cfv->stats.tx_full_ring++;
 	}
diff --git a/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c b/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c
index fda49404968c..79d5ded30b65 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c
@@ -649,7 +649,7 @@ int cn23xx_setup_octeon_vf_device(struct octeon_device *oct)
 			 rings_per_vf);
 		oct->sriov_info.rings_per_vf = rings_per_vf;
 	} else {
-		if (rings_per_vf > num_present_cpus()) {
+		if (num_present_cpus_le(rings_per_vf)) {
 			dev_warn(&oct->pci_dev->dev,
 				 "PF configured rings_per_vf:%d greater than num_cpu:%d. Using rings_per_vf:%d equal to num cpus\n",
 				 rings_per_vf,
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
index 22a463e15678..7d97939413d2 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
@@ -1239,7 +1239,7 @@ static int hns_nic_init_affinity_mask(int q_num, int ring_idx,
 	 * The cpu mask set by ring index according to the ring flag
 	 * which indicate the ring is tx or rx.
 	 */
-	if (q_num == num_possible_cpus()) {
+	if (num_possible_cpus_eq(q_num)) {
 		if (is_tx_ring(ring))
 			cpu = ring_idx;
 		else
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index a48e804c46f2..34ad59fd51d6 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -3315,7 +3315,7 @@ static int mvpp2_setup_txqs(struct mvpp2_port *port)
 			goto err_cleanup;
 
 		/* Assign this queue to a CPU */
-		if (queue < num_possible_cpus())
+		if (num_possible_cpus_gt(queue))
 			netif_set_xps_queue(port->dev, cpumask_of(queue), queue);
 	}
 
diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
index 172081ffe477..33d3cddc6c7b 100644
--- a/drivers/net/wireless/ath/ath9k/hw.c
+++ b/drivers/net/wireless/ath/ath9k/hw.c
@@ -429,7 +429,7 @@ static void ath9k_hw_init_config(struct ath_hw *ah)
 	 * This issue is not present on PCI-Express devices or pre-AR5416
 	 * devices (legacy, 802.11abg).
 	 */
-	if (num_possible_cpus() > 1)
+	if (num_possible_cpus_gt(1))
 		ah->config.serialize_regmode = SER_REG_MODE_AUTO;
 
 	if (NR_CPUS > 1 && ah->config.serialize_regmode == SER_REG_MODE_AUTO) {
diff --git a/drivers/net/wireless/marvell/mwifiex/main.c b/drivers/net/wireless/marvell/mwifiex/main.c
index 19b996c6a260..6ce0236a3203 100644
--- a/drivers/net/wireless/marvell/mwifiex/main.c
+++ b/drivers/net/wireless/marvell/mwifiex/main.c
@@ -1536,7 +1536,7 @@ mwifiex_reinit_sw(struct mwifiex_adapter *adapter)
 	adapter->cmd_wait_q.status = 0;
 	adapter->scan_wait_q_woken = false;
 
-	if ((num_possible_cpus() > 1) || adapter->iface_type == MWIFIEX_USB)
+	if (num_possible_cpus_gt(1) || adapter->iface_type == MWIFIEX_USB)
 		adapter->rx_work_enabled = true;
 
 	adapter->workqueue =
@@ -1691,7 +1691,7 @@ mwifiex_add_card(void *card, struct completion *fw_done,
 	adapter->cmd_wait_q.status = 0;
 	adapter->scan_wait_q_woken = false;
 
-	if ((num_possible_cpus() > 1) || adapter->iface_type == MWIFIEX_USB)
+	if (num_possible_cpus_gt(1) || adapter->iface_type == MWIFIEX_USB)
 		adapter->rx_work_enabled = true;
 
 	adapter->workqueue =
diff --git a/drivers/net/wireless/st/cw1200/queue.c b/drivers/net/wireless/st/cw1200/queue.c
index 12952b1c29df..4d47a1e26d55 100644
--- a/drivers/net/wireless/st/cw1200/queue.c
+++ b/drivers/net/wireless/st/cw1200/queue.c
@@ -312,8 +312,7 @@ int cw1200_queue_put(struct cw1200_queue *queue,
 		 * Leave extra queue slots so we don't overflow.
 		 */
 		if (queue->overfull == false &&
-		    queue->num_queued >=
-		    (queue->capacity - (num_present_cpus() - 1))) {
+		    num_present_cpus_gt(queue->capacity - queue->num_queued)) {
 			queue->overfull = true;
 			__cw1200_queue_lock(queue);
 			mod_timer(&queue->gc, jiffies);
diff --git a/drivers/nvdimm/region.c b/drivers/nvdimm/region.c
index e0c34120df37..474f1ed5d9b9 100644
--- a/drivers/nvdimm/region.c
+++ b/drivers/nvdimm/region.c
@@ -17,7 +17,7 @@ static int nd_region_probe(struct device *dev)
 	struct nd_region *nd_region = to_nd_region(dev);
 
 	if (nd_region->num_lanes > num_online_cpus()
-			&& nd_region->num_lanes < num_possible_cpus()
+			&& num_possible_cpus_gt(nd_region->num_lanes)
 			&& !test_and_set_bit(0, &once)) {
 		dev_dbg(dev, "online cpus (%d) < concurrent i/o lanes (%d) < possible cpus (%d)\n",
 				num_online_cpus(), nd_region->num_lanes,
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index ca2ee806d74b..34958f775ad8 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -79,7 +79,7 @@ static int io_queue_count_set(const char *val, const struct kernel_param *kp)
 	int ret;
 
 	ret = kstrtouint(val, 10, &n);
-	if (ret != 0 || n > num_possible_cpus())
+	if (ret != 0 || num_possible_cpus_le(n))
 		return -EINVAL;
 	return param_set_uint(val, kp);
 }
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index a31b302b0ade..5f43a7bde55d 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -637,7 +637,7 @@ int armpmu_request_irq(int irq, int cpu)
 
 		err = irq_force_affinity(irq, cpumask_of(cpu));
 
-		if (err && num_possible_cpus() > 1) {
+		if (err && num_possible_cpus_gt(1)) {
 			pr_warn("unable to set irq affinity (irq=%d, cpu=%u)\n",
 				irq, cpu);
 			goto err_out;
diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index c9a85eb2e860..c25902969475 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -297,7 +297,7 @@ static struct pci_dev *_isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn
 	int i, bus_number;
 
 	if (bus_no < 0 || bus_no > 1 || cpu < 0 || cpu >= nr_cpu_ids ||
-	    cpu >= num_possible_cpus())
+	    num_possible_cpus_le(cpu + 1))
 		return NULL;
 
 	bus_number = isst_cpu_info[cpu].bus_info[bus_no];
@@ -362,7 +362,7 @@ struct pci_dev *isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn)
 	struct pci_dev *pci_dev;
 
 	if (bus_no < 0 || bus_no > 1 || cpu < 0 || cpu >= nr_cpu_ids ||
-	    cpu >= num_possible_cpus())
+	    num_possible_cpus_le(cpu + 1))
 		return NULL;
 
 	pci_dev = isst_cpu_info[cpu].pci_dev[bus_no];
@@ -442,7 +442,7 @@ static long isst_if_proc_phyid_req(u8 *cmd_ptr, int *write_only, int resume)
 
 	cpu_map = (struct isst_if_cpu_map *)cmd_ptr;
 	if (cpu_map->logical_cpu >= nr_cpu_ids ||
-	    cpu_map->logical_cpu >= num_possible_cpus())
+	    num_possible_cpus_le(cpu_map->logical_cpu + 1))
 		return -EINVAL;
 
 	*write_only = 0;
diff --git a/drivers/soc/bcm/brcmstb/biuctrl.c b/drivers/soc/bcm/brcmstb/biuctrl.c
index 2c975d79fe8e..6a75cbe836a4 100644
--- a/drivers/soc/bcm/brcmstb/biuctrl.c
+++ b/drivers/soc/bcm/brcmstb/biuctrl.c
@@ -181,7 +181,7 @@ static void __init a72_b53_rac_enable_all(struct device_node *np)
 	if (IS_ENABLED(CONFIG_CACHE_B15_RAC))
 		return;
 
-	if (WARN(num_possible_cpus() > 4, "RAC only supports 4 CPUs\n"))
+	if (WARN(num_possible_cpus_gt(4), "RAC only supports 4 CPUs\n"))
 		return;
 
 	pref_dist = cbc_readl(RAC_CONFIG1_REG);
diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
index 1d2b27e3ea63..b38c519f2294 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -60,7 +60,7 @@ static inline struct dpaa2_io *service_select_by_cpu(struct dpaa2_io *d,
 	if (d)
 		return d;
 
-	if (cpu != DPAA2_IO_ANY_CPU && cpu >= num_possible_cpus())
+	if (cpu != DPAA2_IO_ANY_CPU && num_possible_cpus_le(cpu + 1))
 		return NULL;
 
 	/*
@@ -140,7 +140,7 @@ struct dpaa2_io *dpaa2_io_create(const struct dpaa2_io_desc *desc,
 		return NULL;
 
 	/* check if CPU is out of range (-1 means any cpu) */
-	if (desc->cpu != DPAA2_IO_ANY_CPU && desc->cpu >= num_possible_cpus()) {
+	if (desc->cpu != DPAA2_IO_ANY_CPU && num_possible_cpus_le(desc->cpu + 1)) {
 		kfree(obj);
 		return NULL;
 	}
diff --git a/drivers/spi/spi-dw-bt1.c b/drivers/spi/spi-dw-bt1.c
index c06553416123..ab6b6a32a0d6 100644
--- a/drivers/spi/spi-dw-bt1.c
+++ b/drivers/spi/spi-dw-bt1.c
@@ -241,7 +241,7 @@ static int dw_spi_bt1_sys_init(struct platform_device *pdev,
 	 * though, but still tends to be not fast enough at low CPU
 	 * frequencies.
 	 */
-	if (num_possible_cpus() > 1)
+	if (num_possible_cpus_gt(1))
 		dws->max_mem_freq = 10000000U;
 	else
 		dws->max_mem_freq = 20000000U;
diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
index 5419794fccf1..50cd69012dcf 100644
--- a/drivers/virt/acrn/hsm.c
+++ b/drivers/virt/acrn/hsm.c
@@ -431,7 +431,7 @@ static ssize_t remove_cpu_store(struct device *dev,
 	if (kstrtoull(buf, 0, &cpu) < 0)
 		return -EINVAL;
 
-	if (cpu >= num_possible_cpus() || cpu == 0 || !cpu_is_hotpluggable(cpu))
+	if (num_possible_cpus_le(cpu + 1) || cpu == 0 || !cpu_is_hotpluggable(cpu))
 		return -EINVAL;
 
 	if (cpu_online(cpu))
diff --git a/fs/xfs/xfs_sysfs.c b/fs/xfs/xfs_sysfs.c
index 8608f804388f..5580d60ec962 100644
--- a/fs/xfs/xfs_sysfs.c
+++ b/fs/xfs/xfs_sysfs.c
@@ -211,7 +211,7 @@ pwork_threads_store(
 	if (ret)
 		return ret;
 
-	if (val < -1 || val > num_possible_cpus())
+	if (val < -1 || num_possible_cpus_le(val))
 		return -EINVAL;
 
 	xfs_globals.pwork_threads = val;
diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index b5e50cf74785..ea0699fa4d4c 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -945,8 +945,19 @@ static inline unsigned int num_online_cpus(void)
 	return atomic_read(&__num_online_cpus);
 }
 #define num_possible_cpus()	cpumask_weight(cpu_possible_mask)
+#define num_possible_cpus_eq(n)	cpumask_weight_eq(cpu_possible_mask, (n))
+#define num_possible_cpus_gt(n)	cpumask_weight_gt(cpu_possible_mask, (n))
+#define num_possible_cpus_le(n)	cpumask_weight_le(cpu_possible_mask, (n))
+
 #define num_present_cpus()	cpumask_weight(cpu_present_mask)
+#define num_present_cpus_eq(n)	cpumask_weight_eq(cpu_present_mask, (n))
+#define num_present_cpus_gt(n)	cpumask_weight_gt(cpu_present_mask, (n))
+#define num_present_cpus_le(n)	cpumask_weight_le(cpu_present_mask, (n))
+
 #define num_active_cpus()	cpumask_weight(cpu_active_mask)
+#define num_active_cpus_eq(n)	cpumask_weight_eq(cpu_active_mask, (n))
+#define num_active_cpus_gt(n)	cpumask_weight_gt(cpu_active_mask, (n))
+#define num_active_cpus_le(n)	cpumask_weight_le(cpu_active_mask, (n))
 
 static inline bool cpu_online(unsigned int cpu)
 {
@@ -976,9 +987,21 @@ static inline bool cpu_dying(unsigned int cpu)
 #else
 
 #define num_online_cpus()	1U
+
 #define num_possible_cpus()	1U
+#define num_possible_cpus_eq(n)	(1U == (n))
+#define num_possible_cpus_gt(n)	(1U > (n))
+#define num_possible_cpus_le(n)	(1U < (n))
+
 #define num_present_cpus()	1U
+#define num_present_cpus_eq(n)	(1U == (n))
+#define num_present_cpus_gt(n)	(1U > (n))
+#define num_present_cpus_le(n)	(1U < (n))
+
 #define num_active_cpus()	1U
+#define num_active_cpus_eq(n)	(1U == (n))
+#define num_active_cpus_gt(n)	(1U > (n))
+#define num_active_cpus_le(n)	(1U < (n))
 
 static inline bool cpu_online(unsigned int cpu)
 {
diff --git a/include/linux/kdb.h b/include/linux/kdb.h
index ea0f5e580fac..48269d32b038 100644
--- a/include/linux/kdb.h
+++ b/include/linux/kdb.h
@@ -191,7 +191,7 @@ static inline
 int kdb_process_cpu(const struct task_struct *p)
 {
 	unsigned int cpu = task_cpu(p);
-	if (cpu > num_possible_cpus())
+	if (num_possible_cpus_le(cpu))
 		cpu = 0;
 	return cpu;
 }
diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 10b454554ab0..b6435a41a537 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -108,7 +108,7 @@ kdb_bt_cpu(unsigned long cpu)
 {
 	struct task_struct *kdb_tsk;
 
-	if (cpu >= num_possible_cpus() || !cpu_online(cpu)) {
+	if (num_possible_cpus_le(cpu + 1) || !cpu_online(cpu)) {
 		kdb_printf("WARNING: no process for cpu %ld\n", cpu);
 		return;
 	}
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index cbc35d586afb..08e6df52eb4d 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1005,7 +1005,7 @@ static void __init log_buf_add_cpu(void)
 	 * set_cpu_possible() after setup_arch() but just in
 	 * case lets ensure this is valid.
 	 */
-	if (num_possible_cpus() == 1)
+	if (num_possible_cpus_eq(1))
 		return;
 
 	cpu_extra = (num_possible_cpus() - 1) * __LOG_CPU_MAX_BUF_LEN;
diff --git a/kernel/reboot.c b/kernel/reboot.c
index 6bcc5d6a6572..f21c2c20505d 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -639,7 +639,7 @@ static int __init reboot_setup(char *str)
 			if (isdigit(str[0])) {
 				int cpu = simple_strtoul(str, NULL, 0);
 
-				if (cpu >= num_possible_cpus()) {
+				if (num_possible_cpus_le(cpu + 1)) {
 					pr_err("Ignoring the CPU number in reboot= option. "
 					"CPU %d exceeds possible cpu number %d\n",
 					cpu, num_possible_cpus());
@@ -844,7 +844,7 @@ static ssize_t cpu_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (rc)
 		return rc;
 
-	if (cpunum >= num_possible_cpus())
+	if (num_possible_cpus_le(cpunum + 1))
 		return -ERANGE;
 
 	reboot_default = 0;
diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
index 32d6629a55b2..c1fdfa4084c3 100644
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -448,7 +448,7 @@ void clockevents_register_device(struct clock_event_device *dev)
 	clockevent_set_state(dev, CLOCK_EVT_STATE_DETACHED);
 
 	if (!dev->cpumask) {
-		WARN_ON(num_possible_cpus() > 1);
+		WARN_ON(num_possible_cpus_gt(1));
 		dev->cpumask = cpumask_of(smp_processor_id());
 	}
 
diff --git a/mm/percpu.c b/mm/percpu.c
index 293009cc03ef..76e846b3d48e 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -2936,7 +2936,7 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
 		 * greater-than comparison ensures upa==1 always
 		 * passes the following check.
 		 */
-		if (wasted > num_possible_cpus() / 3)
+		if (num_possible_cpus_le(wasted * 3))
 			continue;
 
 		/* and then don't consume more memory */
@@ -3193,7 +3193,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
 
 	/* allocate pages */
 	j = 0;
-	for (unit = 0; unit < num_possible_cpus(); unit++) {
+	for (unit = 0; num_possible_cpus_gt(unit); unit++) {
 		unsigned int cpu = ai->groups[0].cpu_map[unit];
 		for (i = 0; i < unit_pages; i++) {
 			void *ptr;
@@ -3215,7 +3215,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
 	vm.size = num_possible_cpus() * ai->unit_size;
 	vm_area_register_early(&vm, PAGE_SIZE);
 
-	for (unit = 0; unit < num_possible_cpus(); unit++) {
+	for (unit = 0; num_possible_cpus_gt(unit); unit++) {
 		unsigned long unit_addr =
 			(unsigned long)vm.addr + unit * ai->unit_size;
 
diff --git a/mm/slab.c b/mm/slab.c
index ca4822f6b2b6..3cf2ee629b23 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -3929,7 +3929,7 @@ static int enable_cpucache(struct kmem_cache *cachep, gfp_t gfp)
 	 * to a larger limit. Thus disabled by default.
 	 */
 	shared = 0;
-	if (cachep->size <= PAGE_SIZE && num_possible_cpus() > 1)
+	if (cachep->size <= PAGE_SIZE && num_possible_cpus_gt(1))
 		shared = 8;
 
 #if DEBUG
-- 
2.25.1

