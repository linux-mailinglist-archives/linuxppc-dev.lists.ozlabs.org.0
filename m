Return-Path: <linuxppc-dev+bounces-11778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33642B45413
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 12:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJBnM122sz3bpp;
	Fri,  5 Sep 2025 20:05:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757066758;
	cv=none; b=miZ8ZLT/sdJ2pt9l2jVsVx3gHM9UNWtmJj8CgxFMYc+lw1e2WAOA9nkxTO5EE3bx7tKq1HYvdYvnLI5oqxj7WKKNdWvvsgLWKl1Fkhiz5opexAMalM0RexdHmZJrUYes0xHVoh9DE7Nqpqp/9TP6aXRooAeWX0JHqI2n2hAYLWF0Mtxej7PccPaVfuDIx70TZC4J6BhqyUlQR1/uBuKOa2ZOfVzS3EHh3PD3qW26llZ6p7Iv1XFUdob4BXriBY9/0HAIyRYmgnXP3HLfP+6MA0cIJ1cdPkgQtfo8nq9iiDt60fUPb5emcT8Ky6m7AWvsLOJw/OkL8rYOR3Lj6opgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757066758; c=relaxed/relaxed;
	bh=DZRjwvYd2kR1+eHnoX/XoTY11O6bDfzKSNBqHcg6KTI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dC1VwWcH7NP4z5ovgHqFAhdE9d0xQOdC8PdRF1irXIAWK5KzTGDdxufl/+QdJVbY8S7oHzA7Wuq47o8OOi3p1ToapZC5s03MUBgCsXFiyduM2YUX3dnBnq5IgRA9XhdsbX8u1YNNKVBASjHfbPJuoKchDVVCT5pvr5X3Tb6//ogY9i6mTp8PVyiAewbK+Xqxq05jOepsk94D4ipVzbhLYFufhps5c4m96qMEKgjrQ2sgAQv0LtJCB7mNvj1VHlzaLumAWrfKLjqmLJyebXZs/kVAJYt1Ltn7wvbVO9ykSRccF3kjYtNZBjOSJtXoONSquf/gHanmm5Ud4vfTGbPkPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJBnL0rSMz3bp0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 20:05:58 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJBhn0xyXz6L5ly;
	Fri,  5 Sep 2025 18:02:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 03F6A1402CB;
	Fri,  5 Sep 2025 18:05:55 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 5 Sep
 2025 12:05:53 +0200
Date: Fri, 5 Sep 2025 11:05:51 +0100
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
Subject: Re: [PATCH v4 08/10] thermal: imx: Use scope-based cleanup helper
Message-ID: <20250905110551.00006588@huawei.com>
In-Reply-To: <20250903131733.57637-9-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
	<20250903131733.57637-9-zhangzihuan@kylinos.cn>
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

On Wed,  3 Sep 2025 21:17:31 +0800
Zihuan Zhang <zhangzihuan@kylinos.cn> wrote:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>

This radically changes the lifetime of the reference to policy.
If that is valid, then I'd expect a lot more description of why!

> ---
>  drivers/thermal/imx_thermal.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 38c993d1bcb3..cd1d9d419275 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -201,7 +201,6 @@ static struct thermal_soc_data thermal_imx7d_data = {
>  
>  struct imx_thermal_data {
>  	struct device *dev;
> -	struct cpufreq_policy *policy;
>  	struct thermal_zone_device *tz;
>  	struct thermal_cooling_device *cdev;
>  	struct regmap *tempmon;
> @@ -541,22 +540,20 @@ MODULE_DEVICE_TABLE(of, of_imx_thermal_match);
>  static int imx_thermal_register_legacy_cooling(struct imx_thermal_data *data)
>  {
>  	struct device_node *np;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
>  	int ret = 0;
>  
> -	data->policy = cpufreq_cpu_get(0);
> -	if (!data->policy) {
> +	if (!policy) {
>  		pr_debug("%s: CPUFreq policy not found\n", __func__);
>  		return -EPROBE_DEFER;
>  	}
>  
> -	np = of_get_cpu_node(data->policy->cpu, NULL);
> +	np = of_get_cpu_node(policy->cpu, NULL);
>  
>  	if (!np || !of_property_present(np, "#cooling-cells")) {
> -		data->cdev = cpufreq_cooling_register(data->policy);
> -		if (IS_ERR(data->cdev)) {
> +		data->cdev = cpufreq_cooling_register(policy);
> +		if (IS_ERR(data->cdev))
>  			ret = PTR_ERR(data->cdev);
> -			cpufreq_cpu_put(data->policy);
> -		}
>  	}
>  
>  	of_node_put(np);
> @@ -567,7 +564,6 @@ static int imx_thermal_register_legacy_cooling(struct imx_thermal_data *data)
>  static void imx_thermal_unregister_legacy_cooling(struct imx_thermal_data *data)
>  {
>  	cpufreq_cooling_unregister(data->cdev);
> -	cpufreq_cpu_put(data->policy);
>  }
>  
>  #else


