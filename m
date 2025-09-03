Return-Path: <linuxppc-dev+bounces-11675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB27B42142
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:23:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH3GV4g2wz30Yb;
	Wed,  3 Sep 2025 23:23:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756905826;
	cv=none; b=Qx5iRHpci1tAD+8lPPaQ64YGmFKplzdKQyRnnnkw/I5hew7oP55zJcuul70vn57jhVazDQd56bJ3tR+i/Ym0Na+coFoodbs8p+yLTGyOM1qAQtAEc/Ee4wROgxorA31EelecNZ6JVEfIGEbNavNiPJxP4wGce4apGVQ7U+9wBqknJvFVFCnS6KVnqVM9gGgk/QDc2bysWRLnjsjE2yuG8qUVpZDL0B8/yPyXAbRbsjEKVz7TlKcVpXpu79MtVY/4UPu2WNxnRFy+HPOsdybZUkhSZqzy11Br1nqb9e4t+I3wF7wU/CF5N6WmVmHrn/fEq1azGoJKrksel8cvqOMK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756905826; c=relaxed/relaxed;
	bh=KCs8oZd35s7uPxgnx8pel5X2wUmSB89ledJAdHk0UJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iz02yaaetSWlt3kVRhlNIJRNmTp0Z9Gd7cLHs90LHUFPnUPNWRWpgQF24W6MCZWrTjNIHeQyT0fOgRiZUwnMNPF2PSU/CmuyEqkvr6dDY3jHhkWLlqSRuuSEJZPrT1bqBXBGbzQVvkeZU6yhqYeORu9XV89+dMDkpdEHrZCSkNlOPs3TZJOWmG3HPeEWj50T4OojW8nJc3Ogfb3/4ijvkC8XaLOFXM0xgLFeBL8lB7HiIkBhjxGDXfguSTHO3E+pwEeyor//Jh+6XmNBGJcBagIK2Y7Ks2kAYR2iYmRNaWkZr1qMlXBxB+Z3fUwvparGXFUoQOjKHY+LjuOLO0uw6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FPpEcytq; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FPpEcytq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH3GT5c1Xz30WT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:23:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68E3244C50
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 13:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F360C113CF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756905823;
	bh=MNOCIHc890ZPbX81TBDONhDZg01sJ8IBrTS7pqPoFeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FPpEcytq9aWkc1yFeTV1Dy+aeuNeBTemmC5rC27NFDjKUzH1CdxdIHWINCnqSpQyg
	 6MPLBsnw4Z3tl5OS0ltj5etYNac8uIjuz057aJvwNe7lsvbnOqQCUi7M0eY+x7Vomw
	 frmLXLUfAZ6jPOjoGriyx9qMonLn3SEcX8AaAM5ZthdTfJD2zjQ2JB4v7ZtP1YTj0j
	 fCyX+AMirTsv/3c/wKdQzNdS98pJ6I4a+2bvdurMP4V39HcMssOqRBF0XMA94wFTpD
	 KowDCNR2fY9SpRavGHLrK4UyT5J/cdzwLBNrLagEGm3KeNl0fk8EyVO2a1R5JfvG/D
	 2ScWj8Uimqryg==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-74382048b8cso4071045a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 06:23:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvx8iBFuwBuSyjE3XrpuusOjJkyywyRqcf71bUZ9JIEzjhU71rYEzvIN0T12JqSZrwK7ZAYEmcxCMXgC0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTg27xWku6f80Suv0McHJB/niYqnBfaZx+zI5eC0XIuW7CnhZ8
	kOZJ29ca3ypSZlcJwZig//68vZqH598hWeGhWgK9kcEbVEqjXdcQt9HOYKn1ePJfjMzxuCcCzUb
	qx4xKMvFjXtxoUFYWOPH+tbWYbY9cdjk=
X-Google-Smtp-Source: AGHT+IF/Rvddiz3lwXC8DDW9/+npOMEcse4CHEj2QqCzERRaclrypAQPOhyZw11rYQSZDwxHFmim9Y4Gnx4KJlOQneM=
X-Received: by 2002:a05:6830:411c:b0:73b:2617:87f1 with SMTP id
 46e09a7af769-74569edcb41mr7583799a34.28.1756905822245; Wed, 03 Sep 2025
 06:23:42 -0700 (PDT)
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
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn> <20250903131733.57637-3-zhangzihuan@kylinos.cn>
In-Reply-To: <20250903131733.57637-3-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 15:23:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j5O4Q72P-OLiR4RK4g8E5joi_gu_O4HZymh9hJvy551g@mail.gmail.com>
X-Gm-Features: Ac12FXyUy2bB6YBuDXd6gAvqnfWCJZTJ2jsW3Zhm6c3o2d27uMS2JyeGNtCLZcI
Message-ID: <CAJZ5v0j5O4Q72P-OLiR4RK4g8E5joi_gu_O4HZymh9hJvy551g@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] ACPI: processor: thermal: Use scope-based
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

On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
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
>  drivers/acpi/processor_thermal.c | 37 ++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..5043f17d27b7 100644
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
> @@ -93,9 +88,23 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>         return reduction_step(cpu);
>  }
>
> +static long long cpufreq_get_max_freq(unsigned int cpu)
> +{
> +       long long max_freq;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(cpu);
> +
> +       if (!policy)
> +               return -EINVAL;
> +
> +       max_freq =3D (policy->cpuinfo.max_freq *
> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction_pc=
tg)) / 100;
> +
> +       return max_freq;
> +}
> +
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
>         struct acpi_processor *pr;
>         unsigned long max_freq;
>         int i, ret;
> @@ -120,14 +129,10 @@ static int cpufreq_set_cur_state(unsigned int cpu, =
int state)
>                 if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> -                       return -EINVAL;
> -
> -               max_freq =3D (policy->cpuinfo.max_freq *
> -                           (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
> +               max_freq =3D cpufreq_get_max_freq(cpu);
>
> -               cpufreq_cpu_put(policy);
> +               if (max_freq =3D=3D -EINVAL)
> +                       return -EINVAL;

Please also move the code below to the new function so it does not
need to return a value.

>
>                 ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
>                 if (ret < 0) {
> --

