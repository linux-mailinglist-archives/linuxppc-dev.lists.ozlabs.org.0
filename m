Return-Path: <linuxppc-dev+bounces-11252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8EDB34002
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 14:50:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9Vxh20D9z3cht;
	Mon, 25 Aug 2025 22:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756114593;
	cv=none; b=WVRaAjM/a7x41BjRsHy/Na3xaRSc1gEsdtwaGs6Zvw9GiwhfXWRtLwGLK+6mKs9i+l5RozEWMh0cX9Zj32MGyp88OBMZ3ZIN2mDl5QjFR9EOXWAUTdcpg+GM7AvGlJbB55fHNDgjsuXDQCK8B2EE6pCYDodFKmBYcUzfbCFFIDN4a5HFqsedK+Fi1+iHC/pHC0O1GXXksLhkMOtI2expmq6lf4+MKtcVG/FLDyI/Hd+jQFjZAi+Mu/haEh1JGQoVXFeFUy01qlQpg5fCLD7GUJS/RlZSyT0ecbIkKzonKZN3X6wvjpQfSMWsgwo84Gm8rMdw5y5asio5BuiOVz5oQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756114593; c=relaxed/relaxed;
	bh=6+eNJHWIxMdsW1yLPD2pUnM5SrFArQJd+/4xBeHLdRc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LkZpuo7nueOP1Fb+NdLsETBDTcftlJOvyIzrKBBILxA4BhqYxNss6pZUAU66sfYYZ6P8SKWiCsWhWFCIBfro7T9NRElPqKLyi00mFI2eqiBWrvJZQF92tM0pC+llbHRgh1m3r4IoMLXvlq26qcDvwH6W7UMxnrnfzIPRov9wgurIM3pzS516XF1flso1bUW0bVfjMy/4xgP3Jp7Pp2otgPkkzvH/IwaXoWVJpWeLuf74TTH0/J8hAmy1W3wUtP2TFhWoY/orxqgLtofUPDqmQvpe6Yh3N5IArgznUNoBImrCdGUDkH83dYq/pTsa72ww8T0r+nofI1hhTHFAfoxKBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 366 seconds by postgrey-1.37 at boromir; Mon, 25 Aug 2025 19:36:31 AEST
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9QfR2X6lz3cft
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 19:36:30 +1000 (AEST)
X-UUID: f4718114819511f0b29709d653e92f7d-20250825
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:cb130e20-aecb-43b8-b030-6ef1cc18cdba,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:aeb4c23f173f4cd6117d234a0768e40a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:1,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f4718114819511f0b29709d653e92f7d-20250825
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1183095260; Mon, 25 Aug 2025 17:29:09 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 7CFD8E008FA5;
	Mon, 25 Aug 2025 17:29:09 +0800 (CST)
X-ns-mid: postfix-68AC2CE5-2011171159
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id EBA03E008FA4;
	Mon, 25 Aug 2025 17:28:56 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-pm@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v1] cpufreq: use __free() for all cpufreq_cpu_get() references
Date: Mon, 25 Aug 2025 17:28:33 +0800
Message-Id: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch replaces all remaining uses of cpufreq_cpu_get() with
the __free(cpufreq_cpu_put) annotation.

Motivation:
- Ensures automatic cleanup of policy references when they go out of scop=
e,
  reducing the risk of forgetting to call cpufreq_cpu_put() on early retu=
rn
  or error paths.
- Brings the code in line with the latest kernel coding style and best
  practices for managing reference-counted objects.
- No functional changes are introduced; behavior remains the same,
  but reference counting is now safer and easier to maintain.

Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 arch/arm64/kernel/topology.c                  |  9 +++----
 arch/x86/kvm/x86.c                            | 10 ++++----
 drivers/acpi/processor_thermal.c              | 13 ++++------
 drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
 drivers/cpufreq/cppc_cpufreq.c                |  4 +---
 drivers/cpufreq/intel_pstate.c                |  3 +--
 drivers/cpufreq/longhaul.c                    |  3 +--
 drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
 drivers/cpufreq/powernv-cpufreq.c             |  6 ++---
 drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
 drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
 drivers/devfreq/governor_passive.c            | 19 ++++-----------
 drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
 drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
 drivers/powercap/dtpm_cpu.c                   | 24 ++++++-------------
 drivers/thermal/imx_thermal.c                 |  7 ++----
 .../ti-soc-thermal/ti-thermal-common.c        |  5 +---
 kernel/power/energy_model.c                   |  7 ++----
 18 files changed, 40 insertions(+), 93 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 5d07ee85bdae..e3cb6d54f35b 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
 		 */
 		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
 		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_E=
XP_MS))) {
-			struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
+			struct cpufreq_policy *policy __free(put_cpufreq_policy);
 			int ref_cpu;
=20
+			policy =3D cpufreq_cpu_get(cpu);
 			if (!policy)
 				return -EINVAL;
=20
 			if (!cpumask_intersects(policy->related_cpus,
-						housekeeping_cpumask(HK_TYPE_TICK))) {
-				cpufreq_cpu_put(policy);
+						housekeeping_cpumask(HK_TYPE_TICK)))
 				return -EOPNOTSUPP;
-			}
=20
 			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
 				if (ref_cpu =3D=3D start_cpu) {
@@ -329,8 +328,6 @@ int arch_freq_get_on_cpu(int cpu)
 					break;
 			}
=20
-			cpufreq_cpu_put(policy);
-
 			if (ref_cpu >=3D nr_cpu_ids)
 				/* No alternative to pull info from */
 				return -EAGAIN;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a1c49bc681c4..2a825f4ec701 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9492,16 +9492,14 @@ static void kvm_timer_init(void)
 		max_tsc_khz =3D tsc_khz;
=20
 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
-			struct cpufreq_policy *policy;
+			struct cpufreq_policy *policy __free(put_cpufreq_policy);
 			int cpu;
=20
 			cpu =3D get_cpu();
 			policy =3D cpufreq_cpu_get(cpu);
-			if (policy) {
-				if (policy->cpuinfo.max_freq)
-					max_tsc_khz =3D policy->cpuinfo.max_freq;
-				cpufreq_cpu_put(policy);
-			}
+			if (policy && policy->cpuinfo.max_freq)
+				max_tsc_khz =3D policy->cpuinfo.max_freq;
+
 			put_cpu();
 		}
 		cpufreq_register_notifier(&kvmclock_cpufreq_notifier_block,
diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
index 1219adb11ab9..8367a81c4842 100644
--- a/drivers/acpi/processor_thermal.c
+++ b/drivers/acpi/processor_thermal.c
@@ -64,17 +64,14 @@ static int phys_package_first_cpu(int cpu)
=20
 static int cpu_has_cpufreq(unsigned int cpu)
 {
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
=20
 	if (!acpi_processor_cpufreq_init)
 		return 0;
=20
 	policy =3D cpufreq_cpu_get(cpu);
-	if (policy) {
-		cpufreq_cpu_put(policy);
-		return 1;
-	}
-	return 0;
+
+	return !!policy;
 }
=20
 static int cpufreq_get_max_state(unsigned int cpu)
@@ -95,7 +92,7 @@ static int cpufreq_get_cur_state(unsigned int cpu)
=20
 static int cpufreq_set_cur_state(unsigned int cpu, int state)
 {
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	struct acpi_processor *pr;
 	unsigned long max_freq;
 	int i, ret;
@@ -127,8 +124,6 @@ static int cpufreq_set_cur_state(unsigned int cpu, in=
t state)
 		max_freq =3D (policy->cpuinfo.max_freq *
 			    (100 - reduction_step(i) * cpufreq_thermal_reduction_pctg)) / 100=
;
=20
-		cpufreq_cpu_put(policy);
-
 		ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
 		if (ret < 0) {
 			pr_warn("Failed to update thermal freq constraint: CPU%d (%d)\n",
diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcm=
stb-avs-cpufreq.c
index 5940d262374f..71450cca8e9f 100644
--- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
+++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
@@ -480,7 +480,7 @@ static bool brcm_avs_is_firmware_loaded(struct privat=
e_data *priv)
=20
 static unsigned int brcm_avs_cpufreq_get(unsigned int cpu)
 {
-	struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
 	struct private_data *priv;
=20
 	if (!policy)
@@ -488,8 +488,6 @@ static unsigned int brcm_avs_cpufreq_get(unsigned int=
 cpu)
=20
 	priv =3D policy->driver_data;
=20
-	cpufreq_cpu_put(policy);
-
 	return brcm_avs_get_frequency(priv->base);
 }
=20
diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufre=
q.c
index 4a17162a392d..7183754b1f31 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -726,7 +726,7 @@ static int cppc_get_perf_ctrs_sample(int cpu,
 static unsigned int cppc_cpufreq_get_rate(unsigned int cpu)
 {
 	struct cppc_perf_fb_ctrs fb_ctrs_t0 =3D {0}, fb_ctrs_t1 =3D {0};
-	struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
 	struct cppc_cpudata *cpu_data;
 	u64 delivered_perf;
 	int ret;
@@ -736,8 +736,6 @@ static unsigned int cppc_cpufreq_get_rate(unsigned in=
t cpu)
=20
 	cpu_data =3D policy->driver_data;
=20
-	cpufreq_cpu_put(policy);
-
 	ret =3D cppc_get_perf_ctrs_sample(cpu, &fb_ctrs_t0, &fb_ctrs_t1);
 	if (ret) {
 		if (ret =3D=3D -EFAULT)
diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
index f366d35c5840..fb962140af56 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -1698,7 +1698,7 @@ static ssize_t store_no_turbo(struct kobject *a, st=
ruct kobj_attribute *b,
 static void update_qos_request(enum freq_qos_req_type type)
 {
 	struct freq_qos_request *req;
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	int i;
=20
 	for_each_possible_cpu(i) {
@@ -1710,7 +1710,6 @@ static void update_qos_request(enum freq_qos_req_ty=
pe type)
 			continue;
=20
 		req =3D policy->driver_data;
-		cpufreq_cpu_put(policy);
=20
 		if (!req)
 			continue;
diff --git a/drivers/cpufreq/longhaul.c b/drivers/cpufreq/longhaul.c
index ba0e08c8486a..ae5596919671 100644
--- a/drivers/cpufreq/longhaul.c
+++ b/drivers/cpufreq/longhaul.c
@@ -950,7 +950,7 @@ static int __init longhaul_init(void)
=20
 static void __exit longhaul_exit(void)
 {
-	struct cpufreq_policy *policy =3D cpufreq_cpu_get(0);
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(0);
 	int i;
=20
 	for (i =3D 0; i < numscales; i++) {
@@ -968,7 +968,6 @@ static void __exit longhaul_exit(void)
 		}
 	}
=20
-	cpufreq_cpu_put(policy);
 	cpufreq_unregister_driver(&longhaul_driver);
 	kfree(longhaul_table);
 }
diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediate=
k-cpufreq.c
index f3f02c4b6888..1fae060e16d9 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -320,7 +320,7 @@ static int mtk_cpufreq_opp_notifier(struct notifier_b=
lock *nb,
 	struct dev_pm_opp *new_opp;
 	struct mtk_cpu_dvfs_info *info;
 	unsigned long freq, volt;
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	int ret =3D 0;
=20
 	info =3D container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
@@ -354,11 +354,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_=
block *nb,
=20
 			dev_pm_opp_put(new_opp);
 			policy =3D cpufreq_cpu_get(info->opp_cpu);
-			if (policy) {
+			if (policy)
 				cpufreq_driver_target(policy, freq / 1000,
 						      CPUFREQ_RELATION_L);
-				cpufreq_cpu_put(policy);
-			}
 		}
 	}
=20
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-=
cpufreq.c
index 7d9a5f656de8..ea9d78bbeb38 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -892,7 +892,7 @@ static int powernv_cpufreq_reboot_notifier(struct not=
ifier_block *nb,
 				unsigned long action, void *unused)
 {
 	int cpu;
-	struct cpufreq_policy *cpu_policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
=20
 	rebooting =3D true;
 	for_each_online_cpu(cpu) {
@@ -900,7 +900,6 @@ static int powernv_cpufreq_reboot_notifier(struct not=
ifier_block *nb,
 		if (!cpu_policy)
 			continue;
 		powernv_cpufreq_target_index(cpu_policy, get_nominal_index());
-		cpufreq_cpu_put(cpu_policy);
 	}
=20
 	return NOTIFY_DONE;
@@ -913,7 +912,7 @@ static struct notifier_block powernv_cpufreq_reboot_n=
b =3D {
 static void powernv_cpufreq_work_fn(struct work_struct *work)
 {
 	struct chip *chip =3D container_of(work, struct chip, throttle);
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	unsigned int cpu;
 	cpumask_t mask;
=20
@@ -935,7 +934,6 @@ static void powernv_cpufreq_work_fn(struct work_struc=
t *work)
 		index =3D cpufreq_table_find_index_c(policy, policy->cur, false);
 		powernv_cpufreq_target_index(policy, index);
 		cpumask_andnot(&mask, &mask, policy->cpus);
-		cpufreq_cpu_put(policy);
 	}
 out:
 	cpus_read_unlock();
diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-=
cpufreq.c
index 76c888ed8d16..95f1568e9530 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -555,7 +555,7 @@ static int s5pv210_cpufreq_reboot_notifier_event(stru=
ct notifier_block *this,
 						 unsigned long event, void *ptr)
 {
 	int ret;
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
=20
 	policy =3D cpufreq_cpu_get(0);
 	if (!policy) {
@@ -564,7 +564,6 @@ static int s5pv210_cpufreq_reboot_notifier_event(stru=
ct notifier_block *this,
 	}
=20
 	ret =3D cpufreq_driver_target(policy, SLEEP_FREQ, 0);
-	cpufreq_cpu_put(policy);
=20
 	if (ret < 0)
 		return NOTIFY_BAD;
diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra18=
6-cpufreq.c
index cbabb726c664..4d71e262a729 100644
--- a/drivers/cpufreq/tegra186-cpufreq.c
+++ b/drivers/cpufreq/tegra186-cpufreq.c
@@ -105,7 +105,7 @@ static unsigned int tegra186_cpufreq_get(unsigned int=
 cpu)
 {
 	struct tegra186_cpufreq_data *data =3D cpufreq_get_driver_data();
 	struct tegra186_cpufreq_cluster *cluster;
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	unsigned int edvd_offset, cluster_id;
 	u32 ndiv;
=20
@@ -117,7 +117,6 @@ static unsigned int tegra186_cpufreq_get(unsigned int=
 cpu)
 	ndiv =3D readl(data->regs + edvd_offset) & EDVD_CORE_VOLT_FREQ_F_MASK;
 	cluster_id =3D data->cpus[policy->cpu].bpmp_cluster_id;
 	cluster =3D &data->clusters[cluster_id];
-	cpufreq_cpu_put(policy);
=20
 	return (cluster->ref_clk_khz * ndiv) / cluster->div;
 }
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governo=
r_passive.c
index 953cf9a1e9f7..cba58684ee06 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -80,7 +80,7 @@ static int get_target_freq_with_cpufreq(struct devfreq =
*devfreq,
 	struct devfreq_passive_data *p_data =3D
 				(struct devfreq_passive_data *)devfreq->data;
 	struct devfreq_cpu_data *parent_cpu_data;
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	unsigned long cpu, cpu_cur, cpu_min, cpu_max, cpu_percent;
 	unsigned long dev_min, dev_max;
 	unsigned long freq =3D 0;
@@ -94,10 +94,8 @@ static int get_target_freq_with_cpufreq(struct devfreq=
 *devfreq,
 		}
=20
 		parent_cpu_data =3D get_parent_cpu_data(p_data, policy);
-		if (!parent_cpu_data) {
-			cpufreq_cpu_put(policy);
+		if (!parent_cpu_data)
 			continue;
-		}
=20
 		/* Get target freq via required opps */
 		cpu_cur =3D parent_cpu_data->cur_freq * HZ_PER_KHZ;
@@ -106,7 +104,6 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
 					devfreq->opp_table, &cpu_cur);
 		if (freq) {
 			*target_freq =3D max(freq, *target_freq);
-			cpufreq_cpu_put(policy);
 			continue;
 		}
=20
@@ -121,7 +118,6 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
 		freq =3D dev_min + mult_frac(dev_max - dev_min, cpu_percent, 100);
=20
 		*target_freq =3D max(freq, *target_freq);
-		cpufreq_cpu_put(policy);
 	}
=20
 	return ret;
@@ -256,7 +252,7 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
 	struct device *dev =3D devfreq->dev.parent;
 	struct opp_table *opp_table =3D NULL;
 	struct devfreq_cpu_data *parent_cpu_data;
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	struct device *cpu_dev;
 	unsigned int cpu;
 	int ret;
@@ -280,16 +276,14 @@ static int cpufreq_passive_register_notifier(struct=
 devfreq *devfreq)
 		}
=20
 		parent_cpu_data =3D get_parent_cpu_data(p_data, policy);
-		if (parent_cpu_data) {
-			cpufreq_cpu_put(policy);
+		if (parent_cpu_data)
 			continue;
-		}
=20
 		parent_cpu_data =3D kzalloc(sizeof(*parent_cpu_data),
 						GFP_KERNEL);
 		if (!parent_cpu_data) {
 			ret =3D -ENOMEM;
-			goto err_put_policy;
+			goto err;
 		}
=20
 		cpu_dev =3D get_cpu_device(cpu);
@@ -314,7 +308,6 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
 		parent_cpu_data->max_freq =3D policy->cpuinfo.max_freq;
=20
 		list_add_tail(&parent_cpu_data->node, &p_data->cpu_data_list);
-		cpufreq_cpu_put(policy);
 	}
=20
 	mutex_lock(&devfreq->lock);
@@ -327,8 +320,6 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
=20
 err_free_cpu_data:
 	kfree(parent_cpu_data);
-err_put_policy:
-	cpufreq_cpu_put(policy);
 err:
=20
 	return ret;
diff --git a/drivers/gpu/drm/i915/gt/intel_llc.c b/drivers/gpu/drm/i915/g=
t/intel_llc.c
index 1d19c073ba2e..53cef2ab133d 100644
--- a/drivers/gpu/drm/i915/gt/intel_llc.c
+++ b/drivers/gpu/drm/i915/gt/intel_llc.c
@@ -29,13 +29,12 @@ static struct intel_gt *llc_to_gt(struct intel_llc *l=
lc)
=20
 static unsigned int cpu_max_MHz(void)
 {
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	unsigned int max_khz;
=20
 	policy =3D cpufreq_cpu_get(0);
 	if (policy) {
 		max_khz =3D policy->cpuinfo.max_freq;
-		cpufreq_cpu_put(policy);
 	} else {
 		/*
 		 * Default to measured freq if none found, PCU will ensure we
diff --git a/drivers/macintosh/windfarm_cpufreq_clamp.c b/drivers/macinto=
sh/windfarm_cpufreq_clamp.c
index 28d18ef22bbb..f05e2167481f 100644
--- a/drivers/macintosh/windfarm_cpufreq_clamp.c
+++ b/drivers/macintosh/windfarm_cpufreq_clamp.c
@@ -62,7 +62,7 @@ static const struct wf_control_ops clamp_ops =3D {
=20
 static int __init wf_cpufreq_clamp_init(void)
 {
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	struct wf_control *clamp;
 	struct device *dev;
 	int ret;
@@ -79,8 +79,6 @@ static int __init wf_cpufreq_clamp_init(void)
 	ret =3D freq_qos_add_request(&policy->constraints, &qos_req, FREQ_QOS_M=
AX,
 				   max_freq);
=20
-	cpufreq_cpu_put(policy);
-
 	if (ret < 0) {
 		pr_err("%s: Failed to add freq constraint (%d)\n", __func__,
 		       ret);
diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
index 99390ec1481f..65117569d0f3 100644
--- a/drivers/powercap/dtpm_cpu.c
+++ b/drivers/powercap/dtpm_cpu.c
@@ -144,19 +144,16 @@ static int update_pd_power_uw(struct dtpm *dtpm)
 static void pd_release(struct dtpm *dtpm)
 {
 	struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
=20
 	if (freq_qos_request_active(&dtpm_cpu->qos_req))
 		freq_qos_remove_request(&dtpm_cpu->qos_req);
=20
 	policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
-	if (policy) {
+	if (policy)
 		for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
 			per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL;
=20
-		cpufreq_cpu_put(policy);
-	}
-
 	kfree(dtpm_cpu);
 }
=20
@@ -192,7 +189,7 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
 static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
 {
 	struct dtpm_cpu *dtpm_cpu;
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	struct em_perf_state *table;
 	struct em_perf_domain *pd;
 	char name[CPUFREQ_NAME_LEN];
@@ -207,16 +204,12 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
 		return 0;
=20
 	pd =3D em_cpu_get(cpu);
-	if (!pd || em_is_artificial(pd)) {
-		ret =3D -EINVAL;
-		goto release_policy;
-	}
+	if (!pd || em_is_artificial(pd))
+		return -EINVAL;
=20
 	dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
-	if (!dtpm_cpu) {
-		ret =3D -ENOMEM;
-		goto release_policy;
-	}
+	if (!dtpm_cpu)
+		return -ENOMEM;
=20
 	dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
 	dtpm_cpu->cpu =3D cpu;
@@ -239,7 +232,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
 	if (ret < 0)
 		goto out_dtpm_unregister;
=20
-	cpufreq_cpu_put(policy);
 	return 0;
=20
 out_dtpm_unregister:
@@ -251,8 +243,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
 		per_cpu(dtpm_per_cpu, cpu) =3D NULL;
 	kfree(dtpm_cpu);
=20
-release_policy:
-	cpufreq_cpu_put(policy);
 	return ret;
 }
=20
diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.=
c
index 38c993d1bcb3..1478ccb99553 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -543,7 +543,7 @@ static int imx_thermal_register_legacy_cooling(struct=
 imx_thermal_data *data)
 	struct device_node *np;
 	int ret =3D 0;
=20
-	data->policy =3D cpufreq_cpu_get(0);
+	data->policy __free(put_cpufreq_policy) =3D cpufreq_cpu_get(0);
 	if (!data->policy) {
 		pr_debug("%s: CPUFreq policy not found\n", __func__);
 		return -EPROBE_DEFER;
@@ -553,10 +553,8 @@ static int imx_thermal_register_legacy_cooling(struc=
t imx_thermal_data *data)
=20
 	if (!np || !of_property_present(np, "#cooling-cells")) {
 		data->cdev =3D cpufreq_cooling_register(data->policy);
-		if (IS_ERR(data->cdev)) {
+		if (IS_ERR(data->cdev))
 			ret =3D PTR_ERR(data->cdev);
-			cpufreq_cpu_put(data->policy);
-		}
 	}
=20
 	of_node_put(np);
@@ -567,7 +565,6 @@ static int imx_thermal_register_legacy_cooling(struct=
 imx_thermal_data *data)
 static void imx_thermal_unregister_legacy_cooling(struct imx_thermal_dat=
a *data)
 {
 	cpufreq_cooling_unregister(data->cdev);
-	cpufreq_cpu_put(data->policy);
 }
=20
 #else
diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers=
/thermal/ti-soc-thermal/ti-thermal-common.c
index 0cf0826b805a..7ce023bf01b5 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -234,7 +234,7 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap=
 *bgp, int id)
 	if (!data)
 		return -EINVAL;
=20
-	data->policy =3D cpufreq_cpu_get(0);
+	data->policy __free(put_cpufreq_policy) =3D cpufreq_cpu_get(0);
 	if (!data->policy) {
 		pr_debug("%s: CPUFreq policy not found\n", __func__);
 		return -EPROBE_DEFER;
@@ -246,7 +246,6 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap=
 *bgp, int id)
 		int ret =3D PTR_ERR(data->cool_dev);
 		dev_err(bgp->dev, "Failed to register cpu cooling device %d\n",
 			ret);
-		cpufreq_cpu_put(data->policy);
=20
 		return ret;
 	}
@@ -263,8 +262,6 @@ int ti_thermal_unregister_cpu_cooling(struct ti_bandg=
ap *bgp, int id)
=20
 	if (!IS_ERR_OR_NULL(data)) {
 		cpufreq_cooling_unregister(data->cool_dev);
-		if (data->policy)
-			cpufreq_cpu_put(data->policy);
 	}
=20
 	return 0;
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index ea7995a25780..4f91112c10bd 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -451,7 +451,7 @@ static void
 em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_state =
*table)
 {
 	struct em_perf_domain *pd =3D dev->em_pd;
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy);
 	int found =3D 0;
 	int i, cpu;
=20
@@ -479,8 +479,6 @@ em_cpufreq_update_efficiencies(struct device *dev, st=
ruct em_perf_state *table)
 			found++;
 	}
=20
-	cpufreq_cpu_put(policy);
-
 	if (!found)
 		return;
=20
@@ -787,7 +785,7 @@ static void em_check_capacity_update(void)
=20
 	/* Check if CPUs capacity has changed than update EM */
 	for_each_possible_cpu(cpu) {
-		struct cpufreq_policy *policy;
+		struct cpufreq_policy *policy __free(put_cpufreq_policy);
 		struct em_perf_domain *pd;
 		struct device *dev;
=20
@@ -801,7 +799,6 @@ static void em_check_capacity_update(void)
 					      msecs_to_jiffies(1000));
 			break;
 		}
-		cpufreq_cpu_put(policy);
=20
 		dev =3D get_cpu_device(cpu);
 		pd =3D em_pd_get(dev);
--=20
2.25.1


