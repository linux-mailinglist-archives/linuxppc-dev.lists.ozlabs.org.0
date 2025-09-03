Return-Path: <linuxppc-dev+bounces-11659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F32B41CB4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 13:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH0FY3rnxz2yrV;
	Wed,  3 Sep 2025 21:07:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756897665;
	cv=none; b=Q5ilr1abBeLvPILZ3pQDXYZ0qCg/TE5Ztz9hhanm2G2cwPLSgUFS+fwE4ZryiMK05kF6VH4Lu7mU2UKYChBMdXxN2di5iZlW7pJh/by+TNas57GsdiTOj5tn21v5u7CT0K0HLT+LvMqXy7xKkTm5Y2Z5xwloiUOTzzZWJmS4CzwGCCoQMnEavTa7VulheWAuvU9bhWdlaaw8Han/y/HDofd8s5jmUwM3nDU9ovhQuApShdclxUtmb8FHaFwTqOqJQ+AkRbNbeOG6evKn38axFwkN1Yc7rw6by8UF2Xlh4d9g6aNWbDacgwwStWrFcAZS4ix2uyfTFThPRcT3zYx8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756897665; c=relaxed/relaxed;
	bh=iUEMWCyjNLMY3SgVq129UUhKf5B+UoA3qi5w2xxKRwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5lzRkYWpJ5zUyoN1k5kmo51gGbV83lr6oWdTCS3YE4ENPJE1IMrVgV2qRwKIkexAGL6B5FIvBJ1C/k2LEe+SS7HE0pJRI/NOizv8wLYhAOiDh3b7aU5qMVefrRjrEM3t7uNhQmNdiLYUtexCa+VUIr/7wyJgKYqKVJLJLY8xB4Ey/eGQvewmSlo2zAtjzsZSJRLUQXwmMIT910Wp0ZgJ7eL6Jn2gp6Syd6GfPs6Cs9rp+sriq3B9P7gFrtzkpc4VJDn10jotD8UcaU6Zeuyp4YGxfb7obnk34y/ZdgvIZmGbzxOuT4I3Ut9iD80kTTC5jja/azL6hu+CaWh+yq8aQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fqEv+pAy; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fqEv+pAy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH0FX4RkWz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 21:07:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C12646023F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 11:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75383C4CEFB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756897661;
	bh=I5jJC5YsqDheZourzIns4HynVHdhk9fmj1JJIPP/qj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fqEv+pAyAzyDrwpa5ycGv/vldrUVHpTuiDwGvEU2O6hGAiipiQXkldusw4kvuf6Ta
	 cyV691K7HV2CSSp8RoFgEXQf84IwuC16kmYKwmqprM4hACuabw/Z49bNoigh1mbEVi
	 lfVSk0I2yERql792+nQOshGycv64BeF9PB3eQ5nWjt+fGlrVe/cR9xNBoxCPamJrks
	 yVsq4p2oAGuZ5xkOC8mK0WErUxsBMrB2HOYx2elO7r0rSGI9RKr76w6rqsVHTkCBqv
	 Yq7iI8uXw1FkSRxTENbSKEf2moleyaF/1d2WgigF4GfkMeRbER5SxoiWsyCxL1V2R/
	 ofS+YYpOUUEJQ==
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-74381e207a0so4580572a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 04:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVS7f7s5MuEsTzEH2utgsvX6E8+tFaB4uxJ60EmbonoJeGvoG/L7QNygiGyf2AG7DPsroT+qDfl6gwR/V0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx423Il+XTjbpDPSK3T6aPFWiauYbXxnQaYc2WaWQL75sL3DM6l
	fm1kX+lkHLiy5l7OgO0417AfFMgAJPX9h/TiDxVGIXPnC5wFZNcKPSF14AUBKyokHAS90Vw42x/
	Ay2OXVXSQb913Aa0SfJBgP01o6uvEpw4=
X-Google-Smtp-Source: AGHT+IFm2i7E3heNFR05VvLVwsYMlRgIplk+0JGJpDoA3hxcK7mnkmts5Dorpw2CJryu3vWJY1lQqzZJZSMnb+GSebY=
X-Received: by 2002:a05:6830:2642:b0:745:508c:455c with SMTP id
 46e09a7af769-74569dc34b9mr7242918a34.8.1756897660735; Wed, 03 Sep 2025
 04:07:40 -0700 (PDT)
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
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn> <20250901085748.36795-3-zhangzihuan@kylinos.cn>
In-Reply-To: <20250901085748.36795-3-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 13:07:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jxHQ3fBk_fSwg7QYsePvUyh=FDteyO+8F8oGfUwX2E9A@mail.gmail.com>
X-Gm-Features: Ac12FXxXhqpwDXjodHxvBBGUiHE126LWfl3UmWuK-7WK82DNR_r2zpKQkeauJig
Message-ID: <CAJZ5v0jxHQ3fBk_fSwg7QYsePvUyh=FDteyO+8F8oGfUwX2E9A@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] ACPI: processor: thermal: Use scope-based
 cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Ben Horgan <ben.horgan@arm.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/acpi/processor_thermal.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..3c8b57df9619 100644
> --- a/drivers/acpi/processor_thermal.c
> +++ b/drivers/acpi/processor_thermal.c
> @@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
>         return 0;
>  }
>
> -static int cpu_has_cpufreq(unsigned int cpu)
> +static bool cpu_has_cpufreq(unsigned int cpu)
>  {
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>
>         if (!acpi_processor_cpufreq_init)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);
> -       if (policy) {
> -               cpufreq_cpu_put(policy);
> -               return 1;
> -       }
> -       return 0;
> +       return !!policy;
>  }
>
>  static int cpufreq_get_max_state(unsigned int cpu)
> @@ -95,7 +90,6 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
>         struct acpi_processor *pr;
>         unsigned long max_freq;
>         int i, ret;
> @@ -111,6 +105,9 @@ static int cpufreq_set_cur_state(unsigned int cpu, in=
t state)
>          * frequency.
>          */
>         for_each_online_cpu(i) {

I would still prefer the code below to be moved to a separate function
that would be called in each step of the for_each_online_cpu() loop.

> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D
> +                       cpufreq_cpu_get(i);
> +
>                 if (topology_physical_package_id(i) !=3D
>                     topology_physical_package_id(cpu))
>                         continue;
> @@ -120,15 +117,12 @@ static int cpufreq_set_cur_state(unsigned int cpu, =
int state)
>                 if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(i);
>                 if (!policy)
>                         return -EINVAL;
>
>                 max_freq =3D (policy->cpuinfo.max_freq *
>                             (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
>
> -               cpufreq_cpu_put(policy);
> -
>                 ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
>                 if (ret < 0) {
>                         pr_warn("Failed to update thermal freq constraint=
: CPU%d (%d)\n",
> --
> 2.25.1
>
>

