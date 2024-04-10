Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A028A030D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 00:14:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Iq72dBmA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFHF861mjz3vbh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 08:14:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Iq72dBmA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.5; helo=m16.mail.163.com; envelope-from=sensor1010@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF3rb1lHfz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 23:41:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0k9vD
	y3IhLXKl1/oPUacgobANip3sPaFSxC+sZynpEs=; b=Iq72dBmA27lcU+nCiBTiJ
	zRkACXIYwe+9VHpKiNizbk3ppnXB8hp20uIQdyhzgscR19FZTocSHrlOtBpEwNBm
	t5fAP8wxxkw2dEPQydho9TgBntIngUQXmg8W/hfFgbqG915+RzHy3mfuDjJsyZsj
	P32dDGH1FZj2W9yPJjx2bs=
Received: from localhost.localdomain (unknown [101.86.11.106])
	by gzga-smtp-mta-g1-5 (Coremail) with SMTP id _____wDnLyFjkhZmXX3aAg--.54775S4;
	Wed, 10 Apr 2024 21:21:55 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ray.huang@amd.com,
	marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	mmayer@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	srinivas.pandruvada@linux.intel.com,
	lenb@kernel.org,
	khilman@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH] cpufreq: Covert to exit callback returning void
Date: Wed, 10 Apr 2024 06:21:31 -0700
Message-Id: <20240410132132.3526-1-sensor1010@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnLyFjkhZmXX3aAg--.54775S4
X-Coremail-Antispam: 1Uf129KBjvAXoWfXw47Cw45Gr1fZr45GFWfKrg_yoW8uw18Xo
	WfXFyrG3W8Gryxtw1DAa1xtFZrZanFk3Z5Jws8XFs0gasFyF17XrZrtr45JF1fWay5KrWx
	Z3Wjgwn3Ar4xGr1Un29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRC89MUUUUU
X-Originating-IP: [101.86.11.106]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiSBe8q2XAk1gLbQAAsA
X-Mailman-Approved-At: Thu, 11 Apr 2024 08:13:29 +1000
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
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, asahi@lists.linux.dev, Lizhe <sensor1010@163.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For the exit() callback function returning an int type value.
this leads many driver authors mistakenly believing that error
handling can be performed by returning an error code. However.
the returned value is ignore, and to improve this situation.
it is proposed to modify the return type of the exit() callback
function to void

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/cpufreq/acpi-cpufreq.c         | 4 +---
 drivers/cpufreq/amd-pstate.c           | 7 ++-----
 drivers/cpufreq/apple-soc-cpufreq.c    | 4 +---
 drivers/cpufreq/bmips-cpufreq.c        | 4 +---
 drivers/cpufreq/cppc_cpufreq.c         | 3 +--
 drivers/cpufreq/cpufreq-dt.c           | 3 +--
 drivers/cpufreq/e_powersaver.c         | 3 +--
 drivers/cpufreq/intel_pstate.c         | 4 +---
 drivers/cpufreq/mediatek-cpufreq-hw.c  | 4 +---
 drivers/cpufreq/mediatek-cpufreq.c     | 4 +---
 drivers/cpufreq/omap-cpufreq.c         | 3 +--
 drivers/cpufreq/pasemi-cpufreq.c       | 6 ++----
 drivers/cpufreq/powernow-k6.c          | 3 +--
 drivers/cpufreq/powernow-k7.c          | 3 +--
 drivers/cpufreq/powernow-k8.c          | 4 +---
 drivers/cpufreq/powernv-cpufreq.c      | 4 +---
 drivers/cpufreq/ppc_cbe_cpufreq.c      | 3 +--
 drivers/cpufreq/qcom-cpufreq-hw.c      | 4 +---
 drivers/cpufreq/qoriq-cpufreq.c        | 4 +---
 drivers/cpufreq/scmi-cpufreq.c         | 4 +---
 drivers/cpufreq/scpi-cpufreq.c         | 4 +---
 drivers/cpufreq/sh-cpufreq.c           | 4 +---
 drivers/cpufreq/sparc-us2e-cpufreq.c   | 3 +--
 drivers/cpufreq/sparc-us3-cpufreq.c    | 3 +--
 drivers/cpufreq/speedstep-centrino.c   | 4 +---
 drivers/cpufreq/tegra194-cpufreq.c     | 4 +---
 drivers/cpufreq/vexpress-spc-cpufreq.c | 3 +--
 27 files changed, 29 insertions(+), 74 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 37f1cdf46d29..33f18140e9a4 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -906,7 +906,7 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return result;
 }
 
-static int acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct acpi_cpufreq_data *data = policy->driver_data;
 
@@ -919,8 +919,6 @@ static int acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 	free_cpumask_var(data->freqdomain_cpus);
 	kfree(policy->freq_table);
 	kfree(data);
-
-	return 0;
 }
 
 static int acpi_cpufreq_resume(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 2015c9fcc3c9..60b3d20d5939 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -919,7 +919,7 @@ static int amd_pstate_cpu_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int amd_pstate_cpu_exit(struct cpufreq_policy *policy)
+static void amd_pstate_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct amd_cpudata *cpudata = policy->driver_data;
 
@@ -927,8 +927,6 @@ static int amd_pstate_cpu_exit(struct cpufreq_policy *policy)
 	freq_qos_remove_request(&cpudata->req[0]);
 	policy->fast_switch_possible = false;
 	kfree(cpudata);
-
-	return 0;
 }
 
 static int amd_pstate_cpu_resume(struct cpufreq_policy *policy)
@@ -1376,10 +1374,9 @@ static int amd_pstate_epp_cpu_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int amd_pstate_epp_cpu_exit(struct cpufreq_policy *policy)
+static void amd_pstate_epp_cpu_exit(struct cpufreq_policy *policy)
 {
 	pr_debug("CPU %d exiting\n", policy->cpu);
-	return 0;
 }
 
 static void amd_pstate_epp_update_limit(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 021f423705e1..af34c22fa273 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -305,7 +305,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
+static void apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct apple_cpu_priv *priv = policy->driver_data;
 
@@ -313,8 +313,6 @@ static int apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
 	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
 	iounmap(priv->reg_base);
 	kfree(priv);
-
-	return 0;
 }
 
 static struct cpufreq_driver apple_soc_cpufreq_driver = {
diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
index 39221a9a187a..17a4c174553d 100644
--- a/drivers/cpufreq/bmips-cpufreq.c
+++ b/drivers/cpufreq/bmips-cpufreq.c
@@ -121,11 +121,9 @@ static int bmips_cpufreq_target_index(struct cpufreq_policy *policy,
 	return 0;
 }
 
-static int bmips_cpufreq_exit(struct cpufreq_policy *policy)
+static void bmips_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	kfree(policy->freq_table);
-
-	return 0;
 }
 
 static int bmips_cpufreq_init(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 64420d9cfd1e..dccb9c1f087d 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -688,7 +688,7 @@ static int cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct cppc_cpudata *cpu_data = policy->driver_data;
 	struct cppc_perf_caps *caps = &cpu_data->perf_caps;
@@ -705,7 +705,6 @@ static int cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 			 caps->lowest_perf, cpu, ret);
 
 	cppc_cpufreq_put_cpu_data(policy);
-	return 0;
 }
 
 static inline u64 get_delta(u64 t1, u64 t0)
diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
index 2d83bbc65dd0..eaf02579ea74 100644
--- a/drivers/cpufreq/cpufreq-dt.c
+++ b/drivers/cpufreq/cpufreq-dt.c
@@ -166,10 +166,9 @@ static int cpufreq_offline(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int cpufreq_exit(struct cpufreq_policy *policy)
+static void cpufreq_exit(struct cpufreq_policy *policy)
 {
 	clk_put(policy->clk);
-	return 0;
 }
 
 static struct cpufreq_driver dt_cpufreq_driver = {
diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersaver.c
index ab93bce8ae77..6e958b09e1b5 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -360,14 +360,13 @@ static int eps_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int eps_cpu_exit(struct cpufreq_policy *policy)
+static void eps_cpu_exit(struct cpufreq_policy *policy)
 {
 	unsigned int cpu = policy->cpu;
 
 	/* Bye */
 	kfree(eps_cpu[cpu]);
 	eps_cpu[cpu] = NULL;
-	return 0;
 }
 
 static struct cpufreq_driver eps_driver = {
diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index dbbf299f4219..aa435d24c20e 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -2731,13 +2731,11 @@ static int intel_pstate_cpu_offline(struct cpufreq_policy *policy)
 	return intel_cpufreq_cpu_offline(policy);
 }
 
-static int intel_pstate_cpu_exit(struct cpufreq_policy *policy)
+static void intel_pstate_cpu_exit(struct cpufreq_policy *policy)
 {
 	pr_debug("CPU %d exiting\n", policy->cpu);
 
 	policy->fast_switch_possible = false;
-
-	return 0;
 }
 
 static int __intel_pstate_cpu_init(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 8d097dcddda4..8925e096d5b9 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -260,7 +260,7 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
+static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct mtk_cpufreq_data *data = policy->driver_data;
 	struct resource *res = data->res;
@@ -270,8 +270,6 @@ static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
 	iounmap(base);
 	release_mem_region(res->start, resource_size(res));
-
-	return 0;
 }
 
 static void mtk_cpufreq_register_em(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index a0a61919bc4c..aba34fb7948e 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -599,13 +599,11 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int mtk_cpufreq_exit(struct cpufreq_policy *policy)
+static void mtk_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct mtk_cpu_dvfs_info *info = policy->driver_data;
 
 	dev_pm_opp_free_cpufreq_table(info->cpu_dev, &policy->freq_table);
-
-	return 0;
 }
 
 static struct cpufreq_driver mtk_cpufreq_driver = {
diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index 895690856665..3458d5cc9b7f 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -135,11 +135,10 @@ static int omap_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int omap_cpu_exit(struct cpufreq_policy *policy)
+static void omap_cpu_exit(struct cpufreq_policy *policy)
 {
 	freq_table_free();
 	clk_put(policy->clk);
-	return 0;
 }
 
 static struct cpufreq_driver omap_driver = {
diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index 039a66bbe1be..ee925b53b6b9 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -204,21 +204,19 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return err;
 }
 
-static int pas_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void pas_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	/*
 	 * We don't support CPU hotplug. Don't unmap after the system
 	 * has already made it to a running state.
 	 */
 	if (system_state >= SYSTEM_RUNNING)
-		return 0;
+		return;
 
 	if (sdcasr_mapbase)
 		iounmap(sdcasr_mapbase);
 	if (sdcpwr_mapbase)
 		iounmap(sdcpwr_mapbase);
-
-	return 0;
 }
 
 static int pas_cpufreq_target(struct cpufreq_policy *policy,
diff --git a/drivers/cpufreq/powernow-k6.c b/drivers/cpufreq/powernow-k6.c
index 41eefef95d87..156bec6c5420 100644
--- a/drivers/cpufreq/powernow-k6.c
+++ b/drivers/cpufreq/powernow-k6.c
@@ -219,7 +219,7 @@ static int powernow_k6_cpu_init(struct cpufreq_policy *policy)
 }
 
 
-static int powernow_k6_cpu_exit(struct cpufreq_policy *policy)
+static void powernow_k6_cpu_exit(struct cpufreq_policy *policy)
 {
 	unsigned int i;
 
@@ -237,7 +237,6 @@ static int powernow_k6_cpu_exit(struct cpufreq_policy *policy)
 			break;
 		}
 	}
-	return 0;
 }
 
 static unsigned int powernow_k6_get(unsigned int cpu)
diff --git a/drivers/cpufreq/powernow-k7.c b/drivers/cpufreq/powernow-k7.c
index 5d515fc34836..4271446c8725 100644
--- a/drivers/cpufreq/powernow-k7.c
+++ b/drivers/cpufreq/powernow-k7.c
@@ -644,7 +644,7 @@ static int powernow_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int powernow_cpu_exit(struct cpufreq_policy *policy)
+static void powernow_cpu_exit(struct cpufreq_policy *policy)
 {
 #ifdef CONFIG_X86_POWERNOW_K7_ACPI
 	if (acpi_processor_perf) {
@@ -655,7 +655,6 @@ static int powernow_cpu_exit(struct cpufreq_policy *policy)
 #endif
 
 	kfree(powernow_table);
-	return 0;
 }
 
 static struct cpufreq_driver powernow_driver = {
diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index b10f7a1b77f1..5e663c3a6736 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1089,7 +1089,7 @@ static int powernowk8_cpu_init(struct cpufreq_policy *pol)
 	return -ENODEV;
 }
 
-static int powernowk8_cpu_exit(struct cpufreq_policy *pol)
+static void powernowk8_cpu_exit(struct cpufreq_policy *pol)
 {
 	struct powernow_k8_data *data = per_cpu(powernow_data, pol->cpu);
 	int cpu;
@@ -1104,8 +1104,6 @@ static int powernowk8_cpu_exit(struct cpufreq_policy *pol)
 	/* pol->cpus will be empty here, use related_cpus instead. */
 	for_each_cpu(cpu, pol->related_cpus)
 		per_cpu(powernow_data, cpu) = NULL;
-
-	return 0;
 }
 
 static void query_values_on_cpu(void *_err)
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index fddbd1ea1635..50c62929f7ca 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -874,7 +874,7 @@ static int powernv_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int powernv_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void powernv_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct powernv_smp_call_data freq_data;
 	struct global_pstate_info *gpstates = policy->driver_data;
@@ -886,8 +886,6 @@ static int powernv_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 		del_timer_sync(&gpstates->timer);
 
 	kfree(policy->driver_data);
-
-	return 0;
 }
 
 static int powernv_cpufreq_reboot_notifier(struct notifier_block *nb,
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.c b/drivers/cpufreq/ppc_cbe_cpufreq.c
index 88afc49941b7..5ee4c7bfdcc5 100644
--- a/drivers/cpufreq/ppc_cbe_cpufreq.c
+++ b/drivers/cpufreq/ppc_cbe_cpufreq.c
@@ -113,10 +113,9 @@ static int cbe_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int cbe_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void cbe_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	cbe_cpufreq_pmi_policy_exit(policy);
-	return 0;
 }
 
 static int cbe_cpufreq_target(struct cpufreq_policy *policy,
diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 70b0f21968a0..bb818111162d 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -573,7 +573,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	return qcom_cpufreq_hw_lmh_init(policy, index);
 }
 
-static int qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
+static void qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct device *cpu_dev = get_cpu_device(policy->cpu);
 	struct qcom_cpufreq_data *data = policy->driver_data;
@@ -583,8 +583,6 @@ static int qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 	qcom_cpufreq_hw_lmh_exit(data);
 	kfree(policy->freq_table);
 	kfree(data);
-
-	return 0;
 }
 
 static void qcom_cpufreq_ready(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
index 0aecaecbb0e6..3519bf34d397 100644
--- a/drivers/cpufreq/qoriq-cpufreq.c
+++ b/drivers/cpufreq/qoriq-cpufreq.c
@@ -225,7 +225,7 @@ static int qoriq_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return -ENODEV;
 }
 
-static int qoriq_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void qoriq_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct cpu_data *data = policy->driver_data;
 
@@ -233,8 +233,6 @@ static int qoriq_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 	kfree(data->table);
 	kfree(data);
 	policy->driver_data = NULL;
-
-	return 0;
 }
 
 static int qoriq_cpufreq_target(struct cpufreq_policy *policy,
diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 3b4f6bfb2f4c..bf5f17f0dfb1 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -308,7 +308,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int scmi_cpufreq_exit(struct cpufreq_policy *policy)
+static void scmi_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct scmi_data *priv = policy->driver_data;
 
@@ -316,8 +316,6 @@ static int scmi_cpufreq_exit(struct cpufreq_policy *policy)
 	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
 	free_cpumask_var(priv->opp_shared_cpus);
 	kfree(priv);
-
-	return 0;
 }
 
 static void scmi_cpufreq_register_em(struct cpufreq_policy *policy)
diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index d33be56983ed..8d73e6e8be2a 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -167,7 +167,7 @@ static int scpi_cpufreq_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
-static int scpi_cpufreq_exit(struct cpufreq_policy *policy)
+static void scpi_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct scpi_data *priv = policy->driver_data;
 
@@ -175,8 +175,6 @@ static int scpi_cpufreq_exit(struct cpufreq_policy *policy)
 	dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
 	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
 	kfree(priv);
-
-	return 0;
 }
 
 static struct cpufreq_driver scpi_cpufreq_driver = {
diff --git a/drivers/cpufreq/sh-cpufreq.c b/drivers/cpufreq/sh-cpufreq.c
index b8704232c27b..aa74036d0420 100644
--- a/drivers/cpufreq/sh-cpufreq.c
+++ b/drivers/cpufreq/sh-cpufreq.c
@@ -135,14 +135,12 @@ static int sh_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int sh_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void sh_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	unsigned int cpu = policy->cpu;
 	struct clk *cpuclk = &per_cpu(sh_cpuclk, cpu);
 
 	clk_put(cpuclk);
-
-	return 0;
 }
 
 static struct cpufreq_driver sh_cpufreq_driver = {
diff --git a/drivers/cpufreq/sparc-us2e-cpufreq.c b/drivers/cpufreq/sparc-us2e-cpufreq.c
index 2783d3d55fce..8a0cd5312a59 100644
--- a/drivers/cpufreq/sparc-us2e-cpufreq.c
+++ b/drivers/cpufreq/sparc-us2e-cpufreq.c
@@ -296,10 +296,9 @@ static int us2e_freq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int us2e_freq_cpu_exit(struct cpufreq_policy *policy)
+static void us2e_freq_cpu_exit(struct cpufreq_policy *policy)
 {
 	us2e_freq_target(policy, 0);
-	return 0;
 }
 
 static struct cpufreq_driver cpufreq_us2e_driver = {
diff --git a/drivers/cpufreq/sparc-us3-cpufreq.c b/drivers/cpufreq/sparc-us3-cpufreq.c
index 6c3657679a88..b50f9d13e6d2 100644
--- a/drivers/cpufreq/sparc-us3-cpufreq.c
+++ b/drivers/cpufreq/sparc-us3-cpufreq.c
@@ -140,10 +140,9 @@ static int us3_freq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int us3_freq_cpu_exit(struct cpufreq_policy *policy)
+static void us3_freq_cpu_exit(struct cpufreq_policy *policy)
 {
 	us3_freq_target(policy, 0);
-	return 0;
 }
 
 static struct cpufreq_driver cpufreq_us3_driver = {
diff --git a/drivers/cpufreq/speedstep-centrino.c b/drivers/cpufreq/speedstep-centrino.c
index 75b10ecdb60f..28e65bcf7242 100644
--- a/drivers/cpufreq/speedstep-centrino.c
+++ b/drivers/cpufreq/speedstep-centrino.c
@@ -400,7 +400,7 @@ static int centrino_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int centrino_cpu_exit(struct cpufreq_policy *policy)
+static void centrino_cpu_exit(struct cpufreq_policy *policy)
 {
 	unsigned int cpu = policy->cpu;
 
@@ -408,8 +408,6 @@ static int centrino_cpu_exit(struct cpufreq_policy *policy)
 		return -ENODEV;
 
 	per_cpu(centrino_model, cpu) = NULL;
-
-	return 0;
 }
 
 /**
diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
index 59865ea455a8..07ea7ed61b68 100644
--- a/drivers/cpufreq/tegra194-cpufreq.c
+++ b/drivers/cpufreq/tegra194-cpufreq.c
@@ -551,14 +551,12 @@ static int tegra194_cpufreq_offline(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int tegra194_cpufreq_exit(struct cpufreq_policy *policy)
+static void tegra194_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct device *cpu_dev = get_cpu_device(policy->cpu);
 
 	dev_pm_opp_remove_all_dynamic(cpu_dev);
 	dev_pm_opp_of_cpumask_remove_table(policy->related_cpus);
-
-	return 0;
 }
 
 static int tegra194_cpufreq_set_target(struct cpufreq_policy *policy,
diff --git a/drivers/cpufreq/vexpress-spc-cpufreq.c b/drivers/cpufreq/vexpress-spc-cpufreq.c
index 9ac4ea50b874..b2a42cdb9582 100644
--- a/drivers/cpufreq/vexpress-spc-cpufreq.c
+++ b/drivers/cpufreq/vexpress-spc-cpufreq.c
@@ -447,7 +447,7 @@ static int ve_spc_cpufreq_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int ve_spc_cpufreq_exit(struct cpufreq_policy *policy)
+static void ve_spc_cpufreq_exit(struct cpufreq_policy *policy)
 {
 	struct device *cpu_dev;
 
@@ -459,7 +459,6 @@ static int ve_spc_cpufreq_exit(struct cpufreq_policy *policy)
 	}
 
 	put_cluster_clk_and_freq_table(cpu_dev, policy->related_cpus);
-	return 0;
 }
 
 static struct cpufreq_driver ve_spc_cpufreq_driver = {
-- 
2.25.1

