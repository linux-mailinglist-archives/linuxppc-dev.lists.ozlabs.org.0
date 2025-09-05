Return-Path: <linuxppc-dev+bounces-11776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E49BFB453F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 12:01:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJBhR3zCYz3bsQ;
	Fri,  5 Sep 2025 20:01:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757066503;
	cv=none; b=M7U/AM59/bZXM7YD5UtNZRaeYUbCbCay5EqicVMYq76WTMhM3ZsWLlLe/SK4++6/MD5Q9OmZtmdfufj2i5+XoVhhB3kmNuTye03R3weIbtxCsVsC6G5FCWLujHISh5VmUJXIt2J34mVVCXsqCobWuCxLNdTpnw0kVOn1quPx0e3Ro7Ry4+f8GB9yFwiJjDOL07eg+uS/lBxHCN0A5pDAK4zEPMPbwJR5+SbizmjnksZH5crcUlVglUJfNUqTg3fnq40ePSB+ahSqJKVgwxM6t7R4Y6cFNFRlW20eaPilMa7Ha2rLrzz2ScIC5h37NEl+4jEeFVlgnnqaUbmPgMMAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757066503; c=relaxed/relaxed;
	bh=vDKXrL0Sd+jc7yUVi0cwM9FBHGodTSjdC989v4akiH0=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BzCdKd6ZVS9qC76hDeta4U8TROC1larYeMgmpZ21G8bA4lu+WO7IN47TSUQJWEp5vzw5x7l659hKu6FzZp0LK6WSblrRIerIlxU+50ezQ9EDEiX36WhXoTsLuUwpr8cI+bLDl3W24ywb9PSXfDleN/4oqMD1Sib+wTHTYc/8hoijg2c5y2oOswFhJkkeBtVCi/5IB9uk87fnzsix42/NYwrM3Dt9MzKCgeXxQnyat48QQs+74Xd4L/VvGOqyGHN0k9mqmfA5wOO8MCjbxvBfo/N0s/XIriDC2aAWhHpejAhw0xtEzKZf0m5x/2aI5PncWPIDDL7Mf+Rh7MuidP4g+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJBhQ238Bz2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 20:01:40 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJBg91Jm0z6JBRj;
	Fri,  5 Sep 2025 18:00:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8815E140145;
	Fri,  5 Sep 2025 18:01:35 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 5 Sep
 2025 12:01:33 +0200
Date: Fri, 5 Sep 2025 11:01:32 +0100
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
Subject: Re: [PATCH v4 05/10] PM / devfreq: Use scope-based cleanup helper
Message-ID: <20250905110132.00003987@huawei.com>
In-Reply-To: <20250903131733.57637-6-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
	<20250903131733.57637-6-zhangzihuan@kylinos.cn>
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
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed,  3 Sep 2025 21:17:28 +0800
Zihuan Zhang <zhangzihuan@kylinos.cn> wrote:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>

This falls into the mess of mixing gotos with cleanup.h usage.

The guidance in cleanup.h IIRC say don't do this.  It isn't (I think) buggy here
but it does make things harder to reason about and generally removes
the point of doing __free.  So I think if you are going to do this one
you need to do it fully which is a little more complex.
Need to deal with parent_cpu_data which isn't that hard.

If you mix the two, Linus may get grumpy!

> ---
>  drivers/devfreq/governor_passive.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
> index 953cf9a1e9f7..a035cf44bdb8 100644
> --- a/drivers/devfreq/governor_passive.c
> +++ b/drivers/devfreq/governor_passive.c

> @@ -256,7 +253,6 @@ static int cpufreq_passive_register_notifier(struct devfreq *devfreq)
>  	struct device *dev = devfreq->dev.parent;
>  	struct opp_table *opp_table = NULL;
>  	struct devfreq_cpu_data *parent_cpu_data;
> -	struct cpufreq_policy *policy;
>  	struct device *cpu_dev;
>  	unsigned int cpu;
>  	int ret;
> @@ -273,23 +269,23 @@ static int cpufreq_passive_register_notifier(struct devfreq *devfreq)
>  	}
>  
>  	for_each_possible_cpu(cpu) {
> -		policy = cpufreq_cpu_get(cpu);
> +		struct cpufreq_policy *policy __free(put_cpufreq_policy) =
> +			cpufreq_cpu_get(cpu);
> +
>  		if (!policy) {
>  			ret = -EPROBE_DEFER;
>  			goto err;
Return directly here (and after changes below, in all error paths.
>  		}
>  
>  		parent_cpu_data = get_parent_cpu_data(p_data, policy);
> -		if (parent_cpu_data) {
> -			cpufreq_cpu_put(policy);
> +		if (parent_cpu_data)
>  			continue;
This is the first use of parent_cpu_data. If it's set at this point
we don't use it at all.  So step 1. Rename this to split this
use from the one that follows.


> -		}
>  
>  		parent_cpu_data = kzalloc(sizeof(*parent_cpu_data),
>  						GFP_KERNEL);
This one needs to be
		struct devfreq_cpu_data *parent_cpu_data __free(kfree) =
			kzalloc(sizeof(*parent_cpu_data), GFP_KERNEL);

		
>  		if (!parent_cpu_data) {
>  			ret = -ENOMEM;
> -			goto err_put_policy;
> +			goto err;
>  		}
>  
>  		cpu_dev = get_cpu_device(cpu);
> @@ -314,7 +310,6 @@ static int cpufreq_passive_register_notifier(struct devfreq *devfreq)
>  		parent_cpu_data->max_freq = policy->cpuinfo.max_freq;
>  
>  		list_add_tail(&parent_cpu_data->node, &p_data->cpu_data_list);

then here we need to ensure we don't free parent_cpu_data. Hence

		list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
			      &p_data->cpu_data_list);

That that point we have passed ownership of the data to the list.

> -		cpufreq_cpu_put(policy);
>  	}
>  
>  	mutex_lock(&devfreq->lock);
> @@ -327,8 +322,6 @@ static int cpufreq_passive_register_notifier(struct devfreq *devfreq)
>  
>  err_free_cpu_data:
>  	kfree(parent_cpu_data);
And all this error block goes away.

> -err_put_policy:
> -	cpufreq_cpu_put(policy);
>  err:
>  
>  	return ret;


