Return-Path: <linuxppc-dev+bounces-11788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A586B45771
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 14:14:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJFdj70D2z3c4Y;
	Fri,  5 Sep 2025 22:14:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:c205:3004:2154::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757057548;
	cv=none; b=ea6csI5u7TeZjRAqdf5AtfEu/ZST9b2oDN04MqXdF6LclCGIM6Wm+PTWI4Jpfy3zXoD9NwrKc2LIa8B/PJ2vzxA/jdhcayi4wsg6+GAihNGf/deQLLehLtRU28zrdc3lOHqclcWKZadliwdXa0B0AdeJqUMiq2gUknrUYJTPMRmKus6Qg9mbvStByVZVyhtHuV7DUEtl/9A7mgNFZVGmaVmGc5vkQvKfYYteeutwaQ0D+dBrJbvhF1tjYJP817xn1UdLaDuoA5BndfIHIW2sy0NCs1T6peOJMtpA5e+PuGnibGosLUekmp3suisePr9FdLZENavJ/lDUDot43l7qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757057548; c=relaxed/relaxed;
	bh=UMhp8J72yITKfzOtPi4DB3UD3FJrfEyrpQ4ZI8FSlps=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1dW34/Y0dTp5t6SfxjPK1/+R/aTDZt6rQNTGQaZbrTfJAUCIDeCLR/DZlImIKjW4oNLSPBJ8pSNoN9kjsvU32SH71lE/RnceH9+sSnkmVjHi+TuL094KP8M3mnWKez2xETUGRBK7aVVv/TeTMm/51BkjStRrol2Ls/StHYihoMIMP7scZSs8k83xrZoAXG55dbNjLQMq+8hNhKq67TDNrYkcr+6L+dH2ArgNEdsj2aRVkoXFcC6sFPmfHZWkGjMlNKFWsKzHDDkgtIqXRfsS7TyhcggnvELg/QO/TJYLXu9nF3F+pDIDH0rX0Qd6Mn+5IndmwAY6BXRidHnZGF36A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; dkim=pass (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=3H9p/Vkv; dkim-atps=neutral; spf=pass (client-ip=2a02:c205:3004:2154::1; helo=mail.andi.de1.cc; envelope-from=andreas@kemnade.info; receiver=lists.ozlabs.org) smtp.mailfrom=kemnade.info
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=3H9p/Vkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kemnade.info (client-ip=2a02:c205:3004:2154::1; helo=mail.andi.de1.cc; envelope-from=andreas@kemnade.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 2066 seconds by postgrey-1.37 at boromir; Fri, 05 Sep 2025 17:32:26 AEST
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ7NB2Fq1z3bWX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 17:32:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=UMhp8J72yITKfzOtPi4DB3UD3FJrfEyrpQ4ZI8FSlps=; b=3H9p/Vkvxt4XbLhqCSP9aF+To1
	PztEyON86OQi9PDNd1ceEUJxtwdxP8kfhfwhJsFQCpc05baWPVxWZGjg7opX2gYK2WIvJOe9zaGxI
	t1GjVNq312NK5FM6wxYvOK7xHeRcBlZ7DvQNdzrNE74gtjS6ycrbgz9Gz3oDC2fnJm/+BYHCrYZqe
	z3F+cmE+jwq5XWgZ+duo5Zpgb84hlUrrT5p8vOy3tqh9xZzhopHfUHuZpO6PnjBzxRCn0X20BnYgc
	3sDAk1C2TxIs6tj7Oexhrej49YHa7H2oqGuA9FmUUbjg3rqCJrtaGj5ZEtOjhNwA5eJUszaVWNk4z
	U2CnHU+A==;
Date: Fri, 5 Sep 2025 08:57:26 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn
 Guo <shawnguo@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Keerthy
 <j-keerthy@ti.com>, Ben Horgan <ben.horgan@arm.com>, zhenglifeng
 <zhenglifeng1@huawei.com>, Zhang Rui <rui.zhang@intel.com>, Len Brown
 <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit
 Gupta <sumitg@nvidia.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang
 <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/10] thermal/drivers/ti-soc-thermal: Use
 scope-based cleanup helper
Message-ID: <20250905085726.2bc6fcb4@akair>
In-Reply-To: <20250903131733.57637-10-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
	<20250903131733.57637-10-zhangzihuan@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Am Wed,  3 Sep 2025 21:17:32 +0800
schrieb Zihuan Zhang <zhangzihuan@kylinos.cn>:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> index 0cf0826b805a..37d06468913a 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> @@ -27,7 +27,6 @@
>  
>  /* common data structures */
>  struct ti_thermal_data {
> -	struct cpufreq_policy *policy;
>  	struct thermal_zone_device *ti_thermal;
>  	struct thermal_zone_device *pcb_tz;
>  	struct thermal_cooling_device *cool_dev;
> @@ -218,6 +217,7 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
>  {
>  	struct ti_thermal_data *data;
>  	struct device_node *np = bgp->dev->of_node;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
>  
this looks as it changes the lifecycle from the device lifetime to just
this function...

>  	/*
>  	 * We are assuming here that if one deploys the zone
> @@ -234,19 +234,17 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
>  	if (!data)
>  		return -EINVAL;
>  
> -	data->policy = cpufreq_cpu_get(0);
> -	if (!data->policy) {
> +	if (!policy) {
>  		pr_debug("%s: CPUFreq policy not found\n", __func__);
>  		return -EPROBE_DEFER;
>  	}
>  
>  	/* Register cooling device */
> -	data->cool_dev = cpufreq_cooling_register(data->policy);
> +	data->cool_dev = cpufreq_cooling_register(policy);

and it is passed on to something living beyond this function. I see no
_get(policy) in cpufreq_cooling_register().
Am I missing something?

Regards,
Andreas

