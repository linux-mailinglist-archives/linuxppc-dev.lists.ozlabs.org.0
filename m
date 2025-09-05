Return-Path: <linuxppc-dev+bounces-11775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A67B453D0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 11:55:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJBXg5c9lz3bxl;
	Fri,  5 Sep 2025 19:54:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757066099;
	cv=none; b=G8FMSLvDFJ5c8pbdXtO5Qv3VpYVcoOQ4kdtCHqlfBWJX8ty2RgnRwpkLsYQgmA9D2xKg/2YvCPfL81NL3CwGzPQlhb2SgC/DkDWGPjXeBvHstz2nvk1jqVrTxJ3AcbPjHljVcNtsvsj2D4SxCav32vPVoSTIs+SVNS4YMlGGtDLIuJEZdygbBtLyGx0lpgU4hKh3VmdWBGYEYU8DEXqqEgeSosNqenBkEOsTfsHZONL6u9Qpz4N7NPOjVLcGrtncS0OcD4gfrJLyyosa99CVz6gwIQZgNuiG+Zv4tOcEAsZvGONkIR3+LOzI0JV/JWNYfNm7I19jdWbA0avLcLbXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757066099; c=relaxed/relaxed;
	bh=tfqcFl+HFKzT0Enb40sxo3AyDq2g5ZpWrpQBxkg0uxk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9Ca0zEhoCRB/nLltQDXiEpRsCdzfCCKDSMv2/v7ztYjQB9XPPqv86Hckz8QC8xUtic8GWBJ3+ruUly7yebWLjhooFfN/RvHh1SHx706idnX+feHKWzNw/riNR2oXC9UWiFXkHPzqpY4tXSQ38+ZtwThc4V0UAedci5AOsVuwll3qlZ6XJfFWQ9bXB8IPg0GzGmn4PL7wPwWHCY8K0DEG53XCy6Nh1J8MP/COoonpOcWSAUBwlB+tCjskf2FS4ddOVD3qwzYX/b2/OhNyhMBmf7lZURU39feed2fr/krFT0RH3cHCMSgtn273DPu8Yh12TDwGVKOXAqm9Kx2TWuAhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJBXf6fRbz30RT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 19:54:58 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJB5B08w6z6L5Vh;
	Fri,  5 Sep 2025 17:34:38 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id CEA161402CB;
	Fri,  5 Sep 2025 17:38:31 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 5 Sep
 2025 11:38:29 +0200
Date: Fri, 5 Sep 2025 10:38:28 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
CC: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham
	<myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, "Jani Nikula"
	<jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, "David Airlie" <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, Eduardo
 Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Ben Horgan
	<ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui
	<rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, Lukasz Luba
	<lukasz.luba@arm.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
	<festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, "Sumit Gupta"
	<sumitg@nvidia.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep
 Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
	<linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<imx@lists.linux.dev>, <linux-omap@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/10] arm64: topology: Use scope-based cleanup
 helper
Message-ID: <20250905103828.0000726c@huawei.com>
In-Reply-To: <20250903131733.57637-2-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
	<20250903131733.57637-2-zhangzihuan@kylinos.cn>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed,  3 Sep 2025 21:17:24 +0800
Zihuan Zhang <zhangzihuan@kylinos.cn> wrote:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
Diff is being slightly annoying in not quite showing enough context
to see that it is fine to release this at the end of scope.
What you have done looks correct to me but there is a further
potential cleanup

	for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
		if (ref_cpu == start_cpu) {
			/* Prevent verifying same CPU twice */
			ref_cpu = nr_cpu_ids;
			break;
//here, might as well return -EAGAIN as only thing in this block
//and now no advantage in sharing the exit path with the one that
//says we never matched the next condition.
		}
		if (!idle_cpu(ref_cpu))
			break;
		}

Either way I'm fine with this.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/kernel/topology.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 5d07ee85bdae..0eebd3492669 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
>  		 */
>  		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>  		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
> -			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> +			struct cpufreq_policy *policy __free(put_cpufreq_policy) =
> +				cpufreq_cpu_get(cpu);
>  			int ref_cpu;
>  
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


