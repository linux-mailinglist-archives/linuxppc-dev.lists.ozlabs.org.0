Return-Path: <linuxppc-dev+bounces-11888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05088B497A3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 19:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLF4D56VLz2ykc;
	Tue,  9 Sep 2025 03:55:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757354156;
	cv=none; b=dv+q3wtYpAZdT/CPoGuBA8UVeCvjYXXCJZ/h3rezmNIusTScjDQUlpFGY+QRnI6jVJz8Fz9FQPLlGjYwhHbT7hJT3DM4wgq650MUp8Q70TmOGhgOpBFw6ULIK5vyuRwypAtJnC0K4TKQ+XRtFFDwDtHowPYDyUX1xqIW+oFzVUot/ZWIS+oE5ZFUrjSs4isoD7zeCc/fu2pi/ph+CC6r8oBpeKX1oKEdXtuHbGE+//8zUwBBxfg1a0SFb16SM2JIkgWM0bXAE+6qa6jdaeyyhK3L4pJtDI2DNHNsVVfjzUhFeQ2ZNM4LpWFn9wRcwS34h1OJ4F5QANlXUtZ+LTGrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757354156; c=relaxed/relaxed;
	bh=4d4ELijWFysTvUoj4E+6DA+dwY8T61+/8XaBDrbjhpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccwzqyOCy8o3LdbQDzzn0/+W2xniFEtriESI6+zfOq6y4Juq/IjxXIJFLvhgrGjCbHId3eY5tUFZxmgQVLZMZQK6Dupm+7ekP+SUknKFUDAaXRuf5ux5pyq4fl38ePYyF//oPFT1uLkagd0uD19THiuYdy07A4VqFEe3cqmcE4uz2xpdLN0WVCxK86JscMgzeqCQ4nv81Ny+hD++t4R6lsK0z8NuvNZGm45ZA5Fv04WX3ozYl/Q4m+CUBCh/6CRUg1vLr2dvJZQgK5pz0T5FQ2WnRO6PRFTt9Ii3/z3AhIbWOCTXhxn2Bf+TvuBmZoUxqU9VVmENYgLPIfzjxhVfeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dLkL6IyG; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dLkL6IyG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLF4C55gnz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 03:55:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B05D44A96
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 17:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A25C4CEFC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757354153;
	bh=z211wSU9k+wQQZV8T70JLX0guTp2A3fKrmuOqpzLycw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dLkL6IyGSzVs97Dn2zc5CR0vuYMwwXdjTpXsdcSc7FK6RgMbAehryO6P2g4tfH2wN
	 xVBncyAAs5yAarohKHABq0i5Gv00ASROSKqjSXO2bVQIWMZS9y0Z6t8i2QjWyeaXHY
	 06vK7d/zNLUQBtGYZnKUW9wqcNaLQdz5WQ1ZdOvVxNGq2KhsDve7cqUBFLg4XWlAfS
	 1647C2TbbdfyBkW/71duf/CJg8w2awwvmiYvSPPP5P/UaZlhFVCmHjvHYRgw8KF36f
	 SMqJDZsbwXeNxg83fl2u3O848CM+s/zcBNmqLkBc6+GxW6RUrToKpOd2AZIpqy6uFk
	 f4ItmibaFkVhQ==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-31d8778ce02so2659662fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Sep 2025 10:55:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXekL0E5oVOZZSsaN6ip4mODw5kVy6aV1pvp6Z17OQmmTjtj25TxV6UnFoz3S/uDGUeiLZsf7WueeZvKFA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YztXGuxXrKiG1/4YdzhlrkWA83PLfTQuLd84kn0GamuSRqtw7ny
	yCn0M+69wG/VC7Az2L3zHmIxFL4tcPHmkeiBm5lS7cQoSrEWGhSMooy4Y+PrXYOE+8ei3nfFTQ8
	ItdKJITzpzqgq92a2MN08oHp2tdfdj6w=
X-Google-Smtp-Source: AGHT+IFczhoCSnnG5YLUZfh7wkMCNzRn78TlsoAFyrDZq9bCKjUOefg3nxoG74Oz37mTKBW6389SIILJkVhhZvHpYYM=
X-Received: by 2002:a05:6808:68d3:10b0:43b:503e:6ecb with SMTP id
 5614622812f47-43b503ec4f4mr623073b6e.13.1757354152690; Mon, 08 Sep 2025
 10:55:52 -0700 (PDT)
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
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn> <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Sep 2025 19:55:41 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gsH1PoGNUpxNE7oEBxJ3dBHBLrkeRE0h-DsF25NFKqQA@mail.gmail.com>
X-Gm-Features: Ac12FXxYXLTfmPsZZpVrMXtRDtGdwPa34ts6sBOi7tLf54i6Za0SxLIO-pbCGrE
Message-ID: <CAJZ5v0gsH1PoGNUpxNE7oEBxJ3dBHBLrkeRE0h-DsF25NFKqQA@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
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

On Fri, Sep 5, 2025 at 3:24=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/acpi/processor_thermal.c | 52 +++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..460713d1414a 100644
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
> -
>         if (!acpi_processor_cpufreq_init)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);
> -       if (policy) {
> -               cpufreq_cpu_put(policy);
> -               return 1;
> -       }
> -       return 0;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
> +
> +       return policy !=3D NULL;
>  }
>
>  static int cpufreq_get_max_state(unsigned int cpu)
> @@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>         return reduction_step(cpu);
>  }
>
> +static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acpi_p=
rocessor *pr)
> +{
> +       unsigned long max_freq;
> +       int ret;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
> +
> +       if (!policy)
> +               return false;
> +
> +       max_freq =3D (policy->cpuinfo.max_freq *
> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction_pc=
tg)) / 100;
> +
> +       ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
> +       if (ret < 0) {
> +               pr_warn("Failed to update thermal freq constraint: CPU%d =
(%d)\n",
> +         pr->id, ret);
> +       }
> +
> +       return true;
> +}
> +
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
>         struct acpi_processor *pr;
> -       unsigned long max_freq;
> -       int i, ret;
> +       int i;
>
>         if (!cpu_has_cpufreq(cpu))
>                 return 0;
> @@ -120,20 +134,8 @@ static int cpufreq_set_cur_state(unsigned int cpu, i=
nt state)
>                 if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> +               if (!cpufreq_update_thermal_limit(i, pr))
>                         return -EINVAL;
> -
> -               max_freq =3D (policy->cpuinfo.max_freq *
> -                           (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
> -
> -               cpufreq_cpu_put(policy);
> -
> -               ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
> -               if (ret < 0) {
> -                       pr_warn("Failed to update thermal freq constraint=
: CPU%d (%d)\n",
> -                               pr->id, ret);
> -               }
>         }
>         return 0;
>  }
> --

Applied as 6.18 material under a new subject, with some minor edits in
the changelog, and with some minor whitespace breakage fixed.

Thanks!

