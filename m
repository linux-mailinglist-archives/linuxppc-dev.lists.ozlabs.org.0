Return-Path: <linuxppc-dev+bounces-11810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 386EAB463E6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 21:47:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJRgl6dYKz2xns;
	Sat,  6 Sep 2025 05:46:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757101619;
	cv=none; b=kcbnc9iAZork46tQ45wZ5gAQ+b9MSZ26oWGe/psY0xD1KUeMHEckFl7gduB2Y1yH18zQl2WCzVNj+E1FTKE4jhkzvQaBarQJrVFgJrzyv6RbzkS81DUrzBaeb71tmZEUXXmInX0qjP66W1YmUjjC7RtQzdGCxMLZVvZhPIOx7j1XopjWN/QT1GVUCqgcDYTWqVplHfqWlzfqpP2LAb+D1svryv5UwkFBkNKDyJlLNgONc03MWvt8ve1DrlmpWM1duV+tuiNdejU7iZVD1FmsrXSNbE3HN0nmH5YTeOMvkSEjsKhWjq63huaRDD3TMm6fEduf1OcSbYYyxZT6+B1ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757101619; c=relaxed/relaxed;
	bh=WtPxATsEFobK/hegi1Hzd9WvYZN2goxvoyMyFG5Binw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHl73WL77aAeOE531buaE14S5T5hxQT7k1DA/C3xYtLdwDA/bKbMKviSIPwp+kZAM4KR2imRIKXkUYm1kXx9o4hun+zOVwj4uJbppXXwRZFv7Sy6W+c4KpxoHTExc28VTiCilUTQL0NrAySqRif7J/U2cvT7teEyiPM4p5epjDc0ev1clDpyxgJ3q0URbTPUMMm1Ty/VLVdgX+BsZ2kTebiyuqdFSndZr5X7VTzekSDeObizf5pQOV8YnPjPNYlibZKvK3priX56fwG1VpWzxxnJNeZrfSfOT7QNs4EduOpsHkEGG7dCr6GPPry5RHIB/+2ur+XXH43YCqTgoz5Xdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G9qmJFw1; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G9qmJFw1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJRgk6f8xz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 05:46:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80B7F44E90
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 19:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62182C116C6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757101616;
	bh=H8MVjkz4o17difHvr2cD8D+8FZU1fUcKjhpmn4rwijw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G9qmJFw1HIMkEhpfwD6F7o3JbvpRO1V95WZ/oUz3+r2CZmbDws6CbBgur6Wekx+qi
	 ldlGPU37Uj/fIsJfq8C0T5mwgtAEI7Vqo36+np24YoWw6Q+UqAD0c8vsYKdD1WmilJ
	 I5H7EyGxJaGj6hrAng2kuUlTjEtq88UjwDYdjemQkTgF2roSvOtH1g1Vers9Vmn/8H
	 hFTpK0+yBM6BJf93iSTpneRiwZTgqB03L5VCqcDIKq1c7x0wnA4m2OtzWFieeGFXd2
	 UYnynJnuCo/OhHIYLgJZetquSD940EGwlIBAqodji7zBapVVl2I0pI39J7QYdGVk0c
	 YFNdRZkp+5nBw==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-61e45eb42ccso872039eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Sep 2025 12:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbt5g2IIysOe0jSFNb3586NoEBPg4IajPYIpCzCYXbyuxXnekcBR3ucOKj7yplS71c16ebxZc70zwG3RU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzogR+mh/NU9DrKiRz7gkuCW3a0QgXGJjPcHpVEBfKgEQhsw+Do
	BG2KE/YuodZV1RZVkdAYzF4cmf4vFcivVyhCQ9wMRiyDDnJ0H1snR5PuECVtuC2wmWt4+T0FA+i
	/ygzyL9rut+4yRWKfJRiHfPrS3zHe74g=
X-Google-Smtp-Source: AGHT+IEKuvslbgpS+jFT9kCZO9ZHrI6mBjYptsMiCaePE1pyVsHfodMLw3nmAqVy7Bw/fuUlRNZZYUO91WEjIayPMsY=
X-Received: by 2002:a05:6820:548:b0:621:71c3:eab8 with SMTP id
 006d021491bc7-62171c3ecffmr1197889eaf.3.1757101615563; Fri, 05 Sep 2025
 12:46:55 -0700 (PDT)
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
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn> <20250905132413.1376220-7-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-7-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 21:46:43 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0izu1_xVe_pGeJiXZqEXLxg_o30NkEjMiwzDgeU4mOGmA@mail.gmail.com>
X-Gm-Features: Ac12FXylOWQRbtZy4tXGis9fcvrx9xAWhEYFwKXiKvA-TbpGOjwSaXBXEfvwt6M
Message-ID: <CAJZ5v0izu1_xVe_pGeJiXZqEXLxg_o30NkEjMiwzDgeU4mOGmA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] PM: EM: Use scope-based cleanup helper
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

On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
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
>  kernel/power/energy_model.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> index ea7995a25780..5ec63b3e7d85 100644
> --- a/kernel/power/energy_model.c
> +++ b/kernel/power/energy_model.c
> @@ -451,7 +451,6 @@ static void
>  em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_state =
*table)
>  {
>         struct em_perf_domain *pd =3D dev->em_pd;
> -       struct cpufreq_policy *policy;
>         int found =3D 0;
>         int i, cpu;
>
> @@ -465,7 +464,7 @@ em_cpufreq_update_efficiencies(struct device *dev, st=
ruct em_perf_state *table)
>                 return;
>         }
>
> -       policy =3D cpufreq_cpu_get(cpu);
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>         if (!policy) {
>                 dev_warn(dev, "EM: Access to CPUFreq policy failed\n");
>                 return;
> @@ -479,8 +478,6 @@ em_cpufreq_update_efficiencies(struct device *dev, st=
ruct em_perf_state *table)
>                         found++;
>         }
>
> -       cpufreq_cpu_put(policy);
> -
>         if (!found)
>                 return;
>

The above changes are fine now and can be a separate patch.

> @@ -787,21 +784,19 @@ static void em_check_capacity_update(void)
>
>         /* Check if CPUs capacity has changed than update EM */
>         for_each_possible_cpu(cpu) {

But I'd prefer the code in this loop to be moved into a separate
function, in a separate patch, before the __free()-based
simplification of it.

> -               struct cpufreq_policy *policy;
>                 struct em_perf_domain *pd;
>                 struct device *dev;
>
>                 if (cpumask_test_cpu(cpu, cpu_done_mask))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(cpu);
> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D cpufreq_cpu_get(cpu);
>                 if (!policy) {
>                         pr_debug("Accessing cpu%d policy failed\n", cpu);
>                         schedule_delayed_work(&em_update_work,
>                                               msecs_to_jiffies(1000));
>                         break;
>                 }
> -               cpufreq_cpu_put(policy);
>
>                 dev =3D get_cpu_device(cpu);
>                 pd =3D em_pd_get(dev);
> --

