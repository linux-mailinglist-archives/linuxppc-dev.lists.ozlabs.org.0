Return-Path: <linuxppc-dev+bounces-11271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5192BB3513E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 03:53:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9rKx5TxKz3cyM;
	Tue, 26 Aug 2025 11:53:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756168276;
	cv=none; b=V2T1GoIb+OR20IQ8nLpvZZ3OFkr6DB9EwZeUGk0YWmtvmrUgq6E1rXmQ17ri3e74AGuEa96Qn7R4wK/MZFwd27Y9TvAV8r2CXaboio6sGZOyEQjYQlYORigg9cGruS230SJ9246/EDDQ5+K72eqh5Q24TcqkwbU4wK/pbgMkaUCxf9WB+DpA31xqLdFCNYDxfe6AdxpjpdOvc83j61y04nEaRcUGQJfcp1xH4LE6L5GwSAvI/zNkADijzvjiJCvk1NK4A5xehAiZKci9Ptoz9dmjO9k/IWd6qluOnE1jeDpSiDOQhDDmAkyBOI9A9MYHtx/eeAuhxthFUY6ZNCb1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756168276; c=relaxed/relaxed;
	bh=wQanhxjQtnyGYgCicfZ6+xqUYVQii44/Bjyq+powAUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+SX5wjxxlj7zT3CsD9si8dgIn8hiXJQhVdw25Pha/jGxHSjpCrte8o8NAQ3esemkk5d9UI9IBeHgENDaoXXdvLbBelQ3og28Rh3LxFO8Vwn96TSwFCofzRd1eiT0V+1UEQlvWqt4fTrYFLZS1bT7+2s5UgjU6ywQcdc8nn8+ePOp1RAYRIZclUVsKIsV28mkil3Ok5BTFyNpK/CuTFUvKgSTtkk9rPYuhmxwsPPnwAIoe3oeHnB8BAxg9Xbnq5XUlCn6p8ZRs3GZVU9nxqGTlunZP3E28s5/MD7WX3S0qitJioP9SZ2BErXOVLeFeiYwz2T7LpItO5RmUAzAjEiuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9pVp14FQz3cnc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 10:31:12 +1000 (AEST)
X-UUID: cd72a7a4821311f0b29709d653e92f7d-20250826
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ceaaac63-66e7-4386-900f-99b09cee1dbd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:73c0f838f0cb681a0e66fa356d1f9674,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd72a7a4821311f0b29709d653e92f7d-20250826
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 266996130; Tue, 26 Aug 2025 08:30:01 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 2B004E008FA5;
	Tue, 26 Aug 2025 08:30:00 +0800 (CST)
X-ns-mid: postfix-68AD0007-5837181
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 830B3E008FA2;
	Tue, 26 Aug 2025 08:29:47 +0800 (CST)
Message-ID: <c19b9a8c-bb7d-4d71-89d0-eb98c70a9a85@kylinos.cn>
Date: Tue, 26 Aug 2025 08:29:46 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] cpufreq: use __free() for all cpufreq_cpu_get()
 references
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Markus Mayer
 <mmayer@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
 <aKxI8D5mgLRyydb3@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <aKxI8D5mgLRyydb3@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


=E5=9C=A8 2025/8/25 19:28, Gautam Menghani =E5=86=99=E9=81=93:
> On Mon, Aug 25, 2025 at 05:28:33PM +0800, Zihuan Zhang wrote:
>> This patch replaces all remaining uses of cpufreq_cpu_get() with
>> the __free(cpufreq_cpu_put) annotation.
>>
>> Motivation:
>> - Ensures automatic cleanup of policy references when they go out of s=
cope,
>>    reducing the risk of forgetting to call cpufreq_cpu_put() on early =
return
>>    or error paths.
>> - Brings the code in line with the latest kernel coding style and best
>>    practices for managing reference-counted objects.
>> - No functional changes are introduced; behavior remains the same,
>>    but reference counting is now safer and easier to maintain.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   arch/arm64/kernel/topology.c                  |  9 +++----
>>   arch/x86/kvm/x86.c                            | 10 ++++----
>>   drivers/acpi/processor_thermal.c              | 13 ++++------
>>   drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
>>   drivers/cpufreq/cppc_cpufreq.c                |  4 +---
>>   drivers/cpufreq/intel_pstate.c                |  3 +--
>>   drivers/cpufreq/longhaul.c                    |  3 +--
>>   drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
>>   drivers/cpufreq/powernv-cpufreq.c             |  6 ++---
>>   drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
>>   drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
>>   drivers/devfreq/governor_passive.c            | 19 ++++-----------
>>   drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
>>   drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
>>   drivers/powercap/dtpm_cpu.c                   | 24 ++++++-----------=
--
>>   drivers/thermal/imx_thermal.c                 |  7 ++----
>>   .../ti-soc-thermal/ti-thermal-common.c        |  5 +---
>>   kernel/power/energy_model.c                   |  7 ++----
>>   18 files changed, 40 insertions(+), 93 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology=
.c
>> index 5d07ee85bdae..e3cb6d54f35b 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
>>   		 */
>>   		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>>   		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMP=
LE_EXP_MS))) {
>> -			struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
>> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>   			int ref_cpu;
>>  =20
>> +			policy =3D cpufreq_cpu_get(cpu);
>>   			if (!policy)
>>   				return -EINVAL;
>>  =20
>>   			if (!cpumask_intersects(policy->related_cpus,
>> -						housekeeping_cpumask(HK_TYPE_TICK))) {
>> -				cpufreq_cpu_put(policy);
>> +						housekeeping_cpumask(HK_TYPE_TICK)))
>>   				return -EOPNOTSUPP;
>> -			}
>>  =20
>>   			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
>>   				if (ref_cpu =3D=3D start_cpu) {
>> @@ -329,8 +328,6 @@ int arch_freq_get_on_cpu(int cpu)
>>   					break;
>>   			}
>>  =20
>> -			cpufreq_cpu_put(policy);
>> -
>>   			if (ref_cpu >=3D nr_cpu_ids)
>>   				/* No alternative to pull info from */
>>   				return -EAGAIN;
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index a1c49bc681c4..2a825f4ec701 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -9492,16 +9492,14 @@ static void kvm_timer_init(void)
>>   		max_tsc_khz =3D tsc_khz;
>>  =20
>>   		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
>> -			struct cpufreq_policy *policy;
>> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>   			int cpu;
>>  =20
>>   			cpu =3D get_cpu();
>>   			policy =3D cpufreq_cpu_get(cpu);
>> -			if (policy) {
>> -				if (policy->cpuinfo.max_freq)
>> -					max_tsc_khz =3D policy->cpuinfo.max_freq;
>> -				cpufreq_cpu_put(policy);
>> -			}
>> +			if (policy && policy->cpuinfo.max_freq)
>> +				max_tsc_khz =3D policy->cpuinfo.max_freq;
>> +
>>   			put_cpu();
>>   		}
>>   		cpufreq_register_notifier(&kvmclock_cpufreq_notifier_block,
>> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor=
_thermal.c
>> index 1219adb11ab9..8367a81c4842 100644
>> --- a/drivers/acpi/processor_thermal.c
>> +++ b/drivers/acpi/processor_thermal.c
>> @@ -64,17 +64,14 @@ static int phys_package_first_cpu(int cpu)
>>  =20
>>   static int cpu_has_cpufreq(unsigned int cpu)
>>   {
>> -	struct cpufreq_policy *policy;
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>  =20
>>   	if (!acpi_processor_cpufreq_init)
>>   		return 0;
>>  =20
>>   	policy =3D cpufreq_cpu_get(cpu);
>> -	if (policy) {
>> -		cpufreq_cpu_put(policy);
>> -		return 1;
>> -	}
>> -	return 0;
>> +
>> +	return !!policy;
>>   }
>>  =20
>>   static int cpufreq_get_max_state(unsigned int cpu)
>> @@ -95,7 +92,7 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>>  =20
>>   static int cpufreq_set_cur_state(unsigned int cpu, int state)
>>   {
>> -	struct cpufreq_policy *policy;
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>   	struct acpi_processor *pr;
>>   	unsigned long max_freq;
>>   	int i, ret;
>> @@ -127,8 +124,6 @@ static int cpufreq_set_cur_state(unsigned int cpu,=
 int state)
>>   		max_freq =3D (policy->cpuinfo.max_freq *
>>   			    (100 - reduction_step(i) * cpufreq_thermal_reduction_pctg)) /=
 100;
>>  =20
>> -		cpufreq_cpu_put(policy);
>> -
>>   		ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
>>   		if (ret < 0) {
>>   			pr_warn("Failed to update thermal freq constraint: CPU%d (%d)\n",
>> diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/b=
rcmstb-avs-cpufreq.c
>> index 5940d262374f..71450cca8e9f 100644
>> --- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
>> +++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
>> @@ -480,7 +480,7 @@ static bool brcm_avs_is_firmware_loaded(struct pri=
vate_data *priv)
>>  =20
>>   static unsigned int brcm_avs_cpufreq_get(unsigned int cpu)
>>   {
>> -	struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq=
_cpu_get(cpu);
>>   	struct private_data *priv;
>>  =20
>>   	if (!policy)
>> @@ -488,8 +488,6 @@ static unsigned int brcm_avs_cpufreq_get(unsigned =
int cpu)
>>  =20
>>   	priv =3D policy->driver_data;
>>  =20
>> -	cpufreq_cpu_put(policy);
>> -
>>   	return brcm_avs_get_frequency(priv->base);
>>   }
>>  =20
>> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpu=
freq.c
>> index 4a17162a392d..7183754b1f31 100644
>> --- a/drivers/cpufreq/cppc_cpufreq.c
>> +++ b/drivers/cpufreq/cppc_cpufreq.c
>> @@ -726,7 +726,7 @@ static int cppc_get_perf_ctrs_sample(int cpu,
>>   static unsigned int cppc_cpufreq_get_rate(unsigned int cpu)
>>   {
>>   	struct cppc_perf_fb_ctrs fb_ctrs_t0 =3D {0}, fb_ctrs_t1 =3D {0};
>> -	struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq=
_cpu_get(cpu);
>>   	struct cppc_cpudata *cpu_data;
>>   	u64 delivered_perf;
>>   	int ret;
>> @@ -736,8 +736,6 @@ static unsigned int cppc_cpufreq_get_rate(unsigned=
 int cpu)
>>  =20
>>   	cpu_data =3D policy->driver_data;
>>  =20
>> -	cpufreq_cpu_put(policy);
>> -
>>   	ret =3D cppc_get_perf_ctrs_sample(cpu, &fb_ctrs_t0, &fb_ctrs_t1);
>>   	if (ret) {
>>   		if (ret =3D=3D -EFAULT)
>> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_ps=
tate.c
>> index f366d35c5840..fb962140af56 100644
>> --- a/drivers/cpufreq/intel_pstate.c
>> +++ b/drivers/cpufreq/intel_pstate.c
>> @@ -1698,7 +1698,7 @@ static ssize_t store_no_turbo(struct kobject *a,=
 struct kobj_attribute *b,
>>   static void update_qos_request(enum freq_qos_req_type type)
>>   {
>>   	struct freq_qos_request *req;
>> -	struct cpufreq_policy *policy;
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>   	int i;
>>  =20
>>   	for_each_possible_cpu(i) {
>> @@ -1710,7 +1710,6 @@ static void update_qos_request(enum freq_qos_req=
_type type)
>>   			continue;
>>  =20
>>   		req =3D policy->driver_data;
>> -		cpufreq_cpu_put(policy);
>>  =20
>>   		if (!req)
>>   			continue;
>> diff --git a/drivers/cpufreq/longhaul.c b/drivers/cpufreq/longhaul.c
>> index ba0e08c8486a..ae5596919671 100644
>> --- a/drivers/cpufreq/longhaul.c
>> +++ b/drivers/cpufreq/longhaul.c
>> @@ -950,7 +950,7 @@ static int __init longhaul_init(void)
>>  =20
>>   static void __exit longhaul_exit(void)
>>   {
>> -	struct cpufreq_policy *policy =3D cpufreq_cpu_get(0);
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq=
_cpu_get(0);
>>   	int i;
>>  =20
>>   	for (i =3D 0; i < numscales; i++) {
>> @@ -968,7 +968,6 @@ static void __exit longhaul_exit(void)
>>   		}
>>   	}
>>  =20
>> -	cpufreq_cpu_put(policy);
>>   	cpufreq_unregister_driver(&longhaul_driver);
>>   	kfree(longhaul_table);
>>   }
>> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/medi=
atek-cpufreq.c
>> index f3f02c4b6888..1fae060e16d9 100644
>> --- a/drivers/cpufreq/mediatek-cpufreq.c
>> +++ b/drivers/cpufreq/mediatek-cpufreq.c
>> @@ -320,7 +320,7 @@ static int mtk_cpufreq_opp_notifier(struct notifie=
r_block *nb,
>>   	struct dev_pm_opp *new_opp;
>>   	struct mtk_cpu_dvfs_info *info;
>>   	unsigned long freq, volt;
>> -	struct cpufreq_policy *policy;
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>   	int ret =3D 0;
>>  =20
>>   	info =3D container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
>> @@ -354,11 +354,9 @@ static int mtk_cpufreq_opp_notifier(struct notifi=
er_block *nb,
>>  =20
>>   			dev_pm_opp_put(new_opp);
>>   			policy =3D cpufreq_cpu_get(info->opp_cpu);
>> -			if (policy) {
>> +			if (policy)
>>   				cpufreq_driver_target(policy, freq / 1000,
>>   						      CPUFREQ_RELATION_L);
>> -				cpufreq_cpu_put(policy);
>> -			}
>>   		}
>>   	}
>>  =20
>> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/power=
nv-cpufreq.c
>> index 7d9a5f656de8..ea9d78bbeb38 100644
>> --- a/drivers/cpufreq/powernv-cpufreq.c
>> +++ b/drivers/cpufreq/powernv-cpufreq.c
>> @@ -892,7 +892,7 @@ static int powernv_cpufreq_reboot_notifier(struct =
notifier_block *nb,
>>   				unsigned long action, void *unused)
>>   {
>>   	int cpu;
>> -	struct cpufreq_policy *cpu_policy;
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
> There's a typo here. I got a compile error because of wrong variable na=
me.
>
> Thanks,
> Gautam

Sorry about that.

Although we did compile-test it, some configs are not enabled by default=20
so we missed this issue. I=E2=80=99ll fix it in the next version.

Thanks for catching this!




