Return-Path: <linuxppc-dev+bounces-11250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3518CB33DFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 13:30:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9T9R5lRZz3cfH;
	Mon, 25 Aug 2025 21:30:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756121403;
	cv=none; b=AmxyQcPt3/qJKDEmUo7VxtqlaNAezOK2IAWKogAgYaYgUfz4Gpi2n1aJEfuseVXUqCg5FgBtyRleGNWxOVNRozu9AcJ160NSYzRKtKv1otH7BOR+VXs8rCiAPwvCNBBFUWrY0J2kiOW5+DzHZfev8atUD1kNiWGg7S+moO1MUaqdI3s1uxUWEccDYwz+4x27TAiQkmxgB4njxAsua7kGTnoTzMbXceaKE8n2vyJzjuxiKp7OSNvEGCD3XHOZuJuJOesLuhsT/ALQC4Vg43HRwvaTZ4Xj6mt85dbxSLzpb1wrdUenWuZuc2tY+RhtpYBTk3aTxPnIlW53gTOgiCvf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756121403; c=relaxed/relaxed;
	bh=pZVH01D2Gd/ZuxBDWHvMdhmbI57qiNXppeatopYJClM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6wEZgeTYiyrKoXxIAuofDHHcicYCN1izQ/45SX36PVVbHwRaDMxRFhyAjqmDHNqVYVFfnHqTmIM7LMPiNYzg3/Rd+AGhnSanEIXS6HdyNXfyQV9qe5BRXYvd6jBmqlTdRL60qgPjIdeFjzMoHu/f5NBfKhpe4KQVBKZan9uPEatQi0V2WiA0K55yTa6rXTDCbSxq7WOEk0psz4bvcmKKJOxp4VU5weMpraeWsH5+K+IA3CW42dpliWdhnN8uucvxaHif7in2Pq8Mz4eKUmrZXGehT0E541w5LNb3byJSP2cwHHCLKAbSZkwT1gbWUMHbXv2Kc6xuUiuHvMWnJpDWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WFeXTt5t; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WFeXTt5t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9T9Q5G02z3blc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 21:30:01 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PAuFQ1016927;
	Mon, 25 Aug 2025 11:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=pZVH01D2Gd/ZuxBDWHvMdhmbI57qiN
	XppeatopYJClM=; b=WFeXTt5tlq7bvmFwDwurN2gxIAJS4Sbtzub9xJRMuUUCWG
	dnN+VgZwrU+C7OAoBOS7dQLtS9avFToeFD88Xjc+lW70Zit8RLPH2JZHPbK7MHxb
	v0D+pVyzXtrwYQl3kI+QLZ7QQLNBqOFnM1k0uGpSZ1+CyNFOS702oVm2UXUhr26g
	QqYmWP5K4me05w/KlbcV8jlyClHMpN0GwiL9exsIxxhhvb59HKuryvQ6LoqGJJOX
	azP5+JccDMK8pigXUHrrcngDK4tPx7KmxBkljdhf7EI3Ims4+KAlu4PkVvsOtnHJ
	SJYiHaa74A1UrHZh5hhabVWUJ/85+yELHuGX+z6g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5av8jkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:29:07 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57PBJCuS013823;
	Mon, 25 Aug 2025 11:29:06 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5av8jkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:29:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57PB3VZR002512;
	Mon, 25 Aug 2025 11:29:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6m5am6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:29:05 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57PBT3gH52166968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 11:29:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 971AE20043;
	Mon, 25 Aug 2025 11:29:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C97EF20040;
	Mon, 25 Aug 2025 11:28:50 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.98.110.17])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 25 Aug 2025 11:28:50 +0000 (GMT)
Date: Mon, 25 Aug 2025 16:58:48 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        zhenglifeng <zhenglifeng1@huawei.com>,
        "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
        Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Beata Michalska <beata.michalska@arm.com>,
        Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Sumit Gupta <sumitg@nvidia.com>,
        Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
        x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] cpufreq: use __free() for all cpufreq_cpu_get()
 references
Message-ID: <aKxI8D5mgLRyydb3@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
References: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
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
In-Reply-To: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0HsQaFGcKHYEMjGxfTSlUJWF6XneJCL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX/4+yCBHiZkyj
 BezOHO0JD1p7OO2PV8xmQ1v5shFYKr21Uw1c2F4fW4uXyPCsxOE6ILKOy08exTWUNA73a36dDQc
 c4y6wbPoU5LvDYQlXlcAhPLqk3LFWCLZ3dICMLqR2WHDlet2Ldgi5be5Hduqsg6kr8/WbswzYXj
 eL+wfLc/Jeqecx6jg74QDQFlvafBQN6LUG8LrX8tqwzhzd9GgzIeu7kk/N0P/CWyJHwlrc5PIUz
 Z4q/fYjm6PpSFTkG5SI7ARvGOK+wODTfBZnnKDnPI4C3Bn1Qhf3Y6EvQDrYoSo6dxKELAUhByqt
 uCcp7lr/HsMOwiulBYsJ81MWSKnZa8+YC9DKTxtqevYNdz87q6XWFXB9AUbfcQ36nGSAmLoiq7W
 P4ME2Djp
X-Proofpoint-ORIG-GUID: gtLwqruV6tGzAQkR_fGqnCUDyXx-v5l-
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68ac4903 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=I94fdbTdu9Vpa8W20_wA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 25, 2025 at 05:28:33PM +0800, Zihuan Zhang wrote:
> This patch replaces all remaining uses of cpufreq_cpu_get() with
> the __free(cpufreq_cpu_put) annotation.
> 
> Motivation:
> - Ensures automatic cleanup of policy references when they go out of scope,
>   reducing the risk of forgetting to call cpufreq_cpu_put() on early return
>   or error paths.
> - Brings the code in line with the latest kernel coding style and best
>   practices for managing reference-counted objects.
> - No functional changes are introduced; behavior remains the same,
>   but reference counting is now safer and easier to maintain.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  arch/arm64/kernel/topology.c                  |  9 +++----
>  arch/x86/kvm/x86.c                            | 10 ++++----
>  drivers/acpi/processor_thermal.c              | 13 ++++------
>  drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
>  drivers/cpufreq/cppc_cpufreq.c                |  4 +---
>  drivers/cpufreq/intel_pstate.c                |  3 +--
>  drivers/cpufreq/longhaul.c                    |  3 +--
>  drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
>  drivers/cpufreq/powernv-cpufreq.c             |  6 ++---
>  drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
>  drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
>  drivers/devfreq/governor_passive.c            | 19 ++++-----------
>  drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
>  drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
>  drivers/powercap/dtpm_cpu.c                   | 24 ++++++-------------
>  drivers/thermal/imx_thermal.c                 |  7 ++----
>  .../ti-soc-thermal/ti-thermal-common.c        |  5 +---
>  kernel/power/energy_model.c                   |  7 ++----
>  18 files changed, 40 insertions(+), 93 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 5d07ee85bdae..e3cb6d54f35b 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
>  		 */
>  		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>  		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
> -			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  			int ref_cpu;
>  
> +			policy = cpufreq_cpu_get(cpu);
>  			if (!policy)
>  				return -EINVAL;
>  
>  			if (!cpumask_intersects(policy->related_cpus,
> -						housekeeping_cpumask(HK_TYPE_TICK))) {
> -				cpufreq_cpu_put(policy);
> +						housekeeping_cpumask(HK_TYPE_TICK)))
>  				return -EOPNOTSUPP;
> -			}
>  
>  			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
>  				if (ref_cpu == start_cpu) {
> @@ -329,8 +328,6 @@ int arch_freq_get_on_cpu(int cpu)
>  					break;
>  			}
>  
> -			cpufreq_cpu_put(policy);
> -
>  			if (ref_cpu >= nr_cpu_ids)
>  				/* No alternative to pull info from */
>  				return -EAGAIN;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index a1c49bc681c4..2a825f4ec701 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9492,16 +9492,14 @@ static void kvm_timer_init(void)
>  		max_tsc_khz = tsc_khz;
>  
>  		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
> -			struct cpufreq_policy *policy;
> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  			int cpu;
>  
>  			cpu = get_cpu();
>  			policy = cpufreq_cpu_get(cpu);
> -			if (policy) {
> -				if (policy->cpuinfo.max_freq)
> -					max_tsc_khz = policy->cpuinfo.max_freq;
> -				cpufreq_cpu_put(policy);
> -			}
> +			if (policy && policy->cpuinfo.max_freq)
> +				max_tsc_khz = policy->cpuinfo.max_freq;
> +
>  			put_cpu();
>  		}
>  		cpufreq_register_notifier(&kvmclock_cpufreq_notifier_block,
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_thermal.c
> index 1219adb11ab9..8367a81c4842 100644
> --- a/drivers/acpi/processor_thermal.c
> +++ b/drivers/acpi/processor_thermal.c
> @@ -64,17 +64,14 @@ static int phys_package_first_cpu(int cpu)
>  
>  static int cpu_has_cpufreq(unsigned int cpu)
>  {
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  
>  	if (!acpi_processor_cpufreq_init)
>  		return 0;
>  
>  	policy = cpufreq_cpu_get(cpu);
> -	if (policy) {
> -		cpufreq_cpu_put(policy);
> -		return 1;
> -	}
> -	return 0;
> +
> +	return !!policy;
>  }
>  
>  static int cpufreq_get_max_state(unsigned int cpu)
> @@ -95,7 +92,7 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>  
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	struct acpi_processor *pr;
>  	unsigned long max_freq;
>  	int i, ret;
> @@ -127,8 +124,6 @@ static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  		max_freq = (policy->cpuinfo.max_freq *
>  			    (100 - reduction_step(i) * cpufreq_thermal_reduction_pctg)) / 100;
>  
> -		cpufreq_cpu_put(policy);
> -
>  		ret = freq_qos_update_request(&pr->thermal_req, max_freq);
>  		if (ret < 0) {
>  			pr_warn("Failed to update thermal freq constraint: CPU%d (%d)\n",
> diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> index 5940d262374f..71450cca8e9f 100644
> --- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
> +++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> @@ -480,7 +480,7 @@ static bool brcm_avs_is_firmware_loaded(struct private_data *priv)
>  
>  static unsigned int brcm_avs_cpufreq_get(unsigned int cpu)
>  {
> -	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(cpu);
>  	struct private_data *priv;
>  
>  	if (!policy)
> @@ -488,8 +488,6 @@ static unsigned int brcm_avs_cpufreq_get(unsigned int cpu)
>  
>  	priv = policy->driver_data;
>  
> -	cpufreq_cpu_put(policy);
> -
>  	return brcm_avs_get_frequency(priv->base);
>  }
>  
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index 4a17162a392d..7183754b1f31 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -726,7 +726,7 @@ static int cppc_get_perf_ctrs_sample(int cpu,
>  static unsigned int cppc_cpufreq_get_rate(unsigned int cpu)
>  {
>  	struct cppc_perf_fb_ctrs fb_ctrs_t0 = {0}, fb_ctrs_t1 = {0};
> -	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(cpu);
>  	struct cppc_cpudata *cpu_data;
>  	u64 delivered_perf;
>  	int ret;
> @@ -736,8 +736,6 @@ static unsigned int cppc_cpufreq_get_rate(unsigned int cpu)
>  
>  	cpu_data = policy->driver_data;
>  
> -	cpufreq_cpu_put(policy);
> -
>  	ret = cppc_get_perf_ctrs_sample(cpu, &fb_ctrs_t0, &fb_ctrs_t1);
>  	if (ret) {
>  		if (ret == -EFAULT)
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index f366d35c5840..fb962140af56 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1698,7 +1698,7 @@ static ssize_t store_no_turbo(struct kobject *a, struct kobj_attribute *b,
>  static void update_qos_request(enum freq_qos_req_type type)
>  {
>  	struct freq_qos_request *req;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	int i;
>  
>  	for_each_possible_cpu(i) {
> @@ -1710,7 +1710,6 @@ static void update_qos_request(enum freq_qos_req_type type)
>  			continue;
>  
>  		req = policy->driver_data;
> -		cpufreq_cpu_put(policy);
>  
>  		if (!req)
>  			continue;
> diff --git a/drivers/cpufreq/longhaul.c b/drivers/cpufreq/longhaul.c
> index ba0e08c8486a..ae5596919671 100644
> --- a/drivers/cpufreq/longhaul.c
> +++ b/drivers/cpufreq/longhaul.c
> @@ -950,7 +950,7 @@ static int __init longhaul_init(void)
>  
>  static void __exit longhaul_exit(void)
>  {
> -	struct cpufreq_policy *policy = cpufreq_cpu_get(0);
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
>  	int i;
>  
>  	for (i = 0; i < numscales; i++) {
> @@ -968,7 +968,6 @@ static void __exit longhaul_exit(void)
>  		}
>  	}
>  
> -	cpufreq_cpu_put(policy);
>  	cpufreq_unregister_driver(&longhaul_driver);
>  	kfree(longhaul_table);
>  }
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index f3f02c4b6888..1fae060e16d9 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -320,7 +320,7 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  	struct dev_pm_opp *new_opp;
>  	struct mtk_cpu_dvfs_info *info;
>  	unsigned long freq, volt;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	int ret = 0;
>  
>  	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> @@ -354,11 +354,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  
>  			dev_pm_opp_put(new_opp);
>  			policy = cpufreq_cpu_get(info->opp_cpu);
> -			if (policy) {
> +			if (policy)
>  				cpufreq_driver_target(policy, freq / 1000,
>  						      CPUFREQ_RELATION_L);
> -				cpufreq_cpu_put(policy);
> -			}
>  		}
>  	}
>  
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 7d9a5f656de8..ea9d78bbeb38 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -892,7 +892,7 @@ static int powernv_cpufreq_reboot_notifier(struct notifier_block *nb,
>  				unsigned long action, void *unused)
>  {
>  	int cpu;
> -	struct cpufreq_policy *cpu_policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);

There's a typo here. I got a compile error because of wrong variable name.

Thanks,
Gautam

