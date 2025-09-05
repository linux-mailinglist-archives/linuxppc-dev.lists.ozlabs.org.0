Return-Path: <linuxppc-dev+bounces-11774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF32B453C4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 11:50:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJBQz2dHyz3bV5;
	Fri,  5 Sep 2025 19:50:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757065803;
	cv=none; b=aYjTKc0vNQkyGyBA+R5s/oFq6F9WIsC321h5GBAyRqjKEODUXP7YI+H7hom+go/fRkPHVXw2btTlNAD9uqHxxYY8BA8qAeJfvGQjX/paI4gY2N1LQOsImVsK62xCeGYP8O2eIToDaZs+Y5F4h8kIJg8GA37qIa7IwjRx7MTcrv/Pz18M4o2pzHkO99Q7JBqy+zfZvYjz9f5tkUkdGOQdKX4QTkvOeZSE00bslsS/eOJhZN97sJ3dv1uC6gW9BotZARu7XkU5VnvQVHM805RP0RMunZKKvyEoE8YqEWcnMtahVMCpm43wJiKXhKS1rLFXz2/m2/xjWxcs0uaM9ctY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757065803; c=relaxed/relaxed;
	bh=Zabr4izodvM0NLvpzUp1pSHNTxcY22KRnJgx4e5O7ko=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cvhtJ3iTvv5QChzVea3W1o7z76HI4tu5mqLRTdJjrxvMx6puAEvoqMprG0jF8qTDoLaupEFJ27yVPIEepTha8udapKDxemvbP4LaJgAE6ajT+OeJcDaLzC0noY14AYjxWcbYVFM75BPmSl4CZkT4YGkRkvzKBQURHvrkFb/Q85UxgTBpLylAEzBR+DVdIWIhrpCW0OBSBwBJhhgWQgntJJI8wUhZSYO0eRsBaRJiSbQn6+fU5LbeS0xZun2hWdXdznfupian+i5ZA4vH68bxtqjrAgKeks9NB84iDhIBOcDC81U20GdVdYRWvA2jQwCtBe1+Cxy0Bq5yHi1703J8Tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJBQy34Fcz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 19:50:00 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJBPj4s43z6JBLl;
	Fri,  5 Sep 2025 17:48:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 172721402E9;
	Fri,  5 Sep 2025 17:49:56 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 5 Sep
 2025 11:49:54 +0200
Date: Fri, 5 Sep 2025 10:49:52 +0100
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
Subject: Re: [PATCH v4 04/10] cpufreq: powernv: Use scope-based cleanup
 helper
Message-ID: <20250905104952.00002f58@huawei.com>
In-Reply-To: <20250903131733.57637-5-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
	<20250903131733.57637-5-zhangzihuan@kylinos.cn>
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

On Wed,  3 Sep 2025 21:17:27 +0800
Zihuan Zhang <zhangzihuan@kylinos.cn> wrote:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
This one is a little more weak wrt to justification.  Kernel style
isn't to use __free() where there isn't a significant benefit.

Up to maintainer of the driver on this one so I'll not offer
a tag.

> ---
>  drivers/cpufreq/powernv-cpufreq.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 7d9a5f656de8..811fdbf398fa 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -892,15 +892,15 @@ static int powernv_cpufreq_reboot_notifier(struct notifier_block *nb,
>  				unsigned long action, void *unused)
>  {
>  	int cpu;
> -	struct cpufreq_policy *cpu_policy;
>  
>  	rebooting = true;
>  	for_each_online_cpu(cpu) {
> -		cpu_policy = cpufreq_cpu_get(cpu);
> +		struct cpufreq_policy *cpu_policy __free(put_cpufreq_policy) =
> +			cpufreq_cpu_get(cpu);
> +
>  		if (!cpu_policy)
>  			continue;
>  		powernv_cpufreq_target_index(cpu_policy, get_nominal_index());
> -		cpufreq_cpu_put(cpu_policy);
>  	}
>  
>  	return NOTIFY_DONE;
> @@ -913,7 +913,6 @@ static struct notifier_block powernv_cpufreq_reboot_nb = {
>  static void powernv_cpufreq_work_fn(struct work_struct *work)
>  {
>  	struct chip *chip = container_of(work, struct chip, throttle);
> -	struct cpufreq_policy *policy;
>  	unsigned int cpu;
>  	cpumask_t mask;
>  
> @@ -928,14 +927,14 @@ static void powernv_cpufreq_work_fn(struct work_struct *work)
>  	chip->restore = false;
>  	for_each_cpu(cpu, &mask) {
>  		int index;
> +		struct cpufreq_policy *policy __free(put_cpufreq_policy) =
> +			cpufreq_cpu_get(cpu);
>  
> -		policy = cpufreq_cpu_get(cpu);
>  		if (!policy)
>  			continue;
>  		index = cpufreq_table_find_index_c(policy, policy->cur, false);
>  		powernv_cpufreq_target_index(policy, index);
>  		cpumask_andnot(&mask, &mask, policy->cpus);
> -		cpufreq_cpu_put(policy);
>  	}
>  out:
>  	cpus_read_unlock();


