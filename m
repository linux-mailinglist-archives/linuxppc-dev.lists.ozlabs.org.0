Return-Path: <linuxppc-dev+bounces-11809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA160B463CA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 21:40:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJRWq551Jz2xcC;
	Sat,  6 Sep 2025 05:40:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757101207;
	cv=none; b=BpLXhzNKe6wOSzQLYZ8kV2wDuK2rgj5tbvkiLarTUFE6sMycVcnIEzqZlPot1l/fuSNE8itntfbhKJGhKeQVBm9o7rKTkIwkQX1gqGcjuHPSzwvdV7xly7gyQ5sfktZIiCdaltj5hFUsIRg7UM0CZ5GzJjxzmBuoShZlEpgYGeBvozWgJ3Hr4VqQZBgGovzn35GdwBEehsXfQHdSA7J71MmhIF4X7jQU939+OPek/cTQ1ctS3gQwqnHWerDcIElnajtzJ5BLRGbuVleTj3alpKlgHX6F/xdX5vch1TK8Xfiz5wiEnPBv896B7DRBK7lT/BHS5MYgT+mMwOdQzti6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757101207; c=relaxed/relaxed;
	bh=mHVpcKB7Cb/uEraG7GIWsCqlkcZPuKQD5lJglnay43Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOMDgcR+8klVQmbWYbRdCRj/qpOM7Il1RyuceTuZ3jDGo0hJfWZ0J3+TDoUfXgeIgp86U7S1/jRnHJE8NaTCNdd5fT4v6e/VxSAsCooDtqYfgsCFUqRKmHNPOhheVbwj0rX4y8acxX2G/kdQgzovvfcOWR3R3Rpids7oObFtRTUhghSW/i8aLefrJeTl7ilrr9vWtw3B+YIwyPJE87jn6gyxGAWCR27xGDEk9JLHT1p1Hvqzj/wUtQs43jHazHUblIVErv29zUj+do0dvI9bMGOj3PkxJ4KYIteg1QogArZ9nH+eMSCwf7/5blvhB8n9KLYX2H5BPLmtn8jGr6dvWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZqXRFlbg; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZqXRFlbg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJRWp53MFz2xWQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 05:40:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DEDA602A4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 19:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5AAC4CEFD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 19:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757101204;
	bh=EW5E1DsoS/eP0Xpaway7kFwsFpD+pL719m9UghXWG4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZqXRFlbgP5QwPcBxU6eNLL/08iwuclbpMhHj5f112VJ0D0CRs+uAOZZt9/eSU+oYH
	 FOKxLZNfYfeCUuY691CYi9oaDczKB9oJxUx3sRU+YTC0hMmU7aj7i6icx+GswFUP2R
	 IFwTEwP7LFbGxUg/I7SAjo0DENXd43ZHbeobRhQywFakWAs9/enQGWBOfoAuIelFBb
	 wogoGak56kUdv1oV5wP9PLMDQRhAVNRB8Qk4NYGffSXcIWD99Y+pR+l0VNOqodu/Yf
	 429lN+Si30NngrGAeTbmA/uuc+3zujKhmh+809qGxXm2EsqsYlM68fd6X/hgvyGAM6
	 l4P6r3BqgQXRw==
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-746d5474a53so739913a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Sep 2025 12:40:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOuvAxdbKlG06PMc9lyfD24jrIhnc6HQHlrGweh2Vq4jzanl0fqWtYFtz4yR1JMY8f9n0LyE4RwfkPl/0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9SRVcSgPPvZOIwE8RfJCP36+PGCkNWuUe4ut+7AktlBNgkxO0
	rvPLxGXnAEx7lnGBgeD4AQtf99S9hfBQ6Ul0MqnIzxh0kD2jNZDz5dTPWsx6aMICKo86mozRK09
	pj6YZyIpEPyvEaj6o1yj5WA6q+NBVrwE=
X-Google-Smtp-Source: AGHT+IEWhcvcPUmMTXw08ZtZH4mqK1uKC0R7GjcFC8PVlsyyD61c2ek06n5Ch8ecLJvX8w2zR6AjPrAE5CMEF+OJ57Q=
X-Received: by 2002:a05:6830:700a:b0:74b:f9de:34dd with SMTP id
 46e09a7af769-74bf9de3edfmr235939a34.15.1757101203180; Fri, 05 Sep 2025
 12:40:03 -0700 (PDT)
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
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn> <20250905132413.1376220-5-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-5-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 21:39:52 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jvskvxgUhxKJLN89A+s7Mruz1_tewHZfKgC7sUGLi9cw@mail.gmail.com>
X-Gm-Features: Ac12FXws29Av_URAHgjbe1keBVsNp0-87UjpP4EeoBVUVvSgtWfWbkUI32D7vRk
Message-ID: <CAJZ5v0jvskvxgUhxKJLN89A+s7Mruz1_tewHZfKgC7sUGLi9cw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] PM / devfreq: Use scope-based cleanup helper
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
>  drivers/devfreq/governor_passive.c | 60 +++++++++++-------------------
>  1 file changed, 22 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governo=
r_passive.c
> index 953cf9a1e9f7..5afaea39377e 100644
> --- a/drivers/devfreq/governor_passive.c
> +++ b/drivers/devfreq/governor_passive.c
> @@ -80,24 +80,23 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
>         struct devfreq_passive_data *p_data =3D
>                                 (struct devfreq_passive_data *)devfreq->d=
ata;
>         struct devfreq_cpu_data *parent_cpu_data;
> -       struct cpufreq_policy *policy;
>         unsigned long cpu, cpu_cur, cpu_min, cpu_max, cpu_percent;
>         unsigned long dev_min, dev_max;
>         unsigned long freq =3D 0;
>         int ret =3D 0;
>
>         for_each_online_cpu(cpu) {

I'd rather move the code in this loop to a separate function in the
first place and then do a __free()-based simplification of it.  I'd
suggest doing each step in a separate patch to avoid mistakes.

> -               policy =3D cpufreq_cpu_get(cpu);
> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D
> +                       cpufreq_cpu_get(cpu);
> +
>                 if (!policy) {
>                         ret =3D -EINVAL;
>                         continue;
>                 }
>
>                 parent_cpu_data =3D get_parent_cpu_data(p_data, policy);
> -               if (!parent_cpu_data) {
> -                       cpufreq_cpu_put(policy);
> +               if (!parent_cpu_data)
>                         continue;
> -               }
>
>                 /* Get target freq via required opps */
>                 cpu_cur =3D parent_cpu_data->cur_freq * HZ_PER_KHZ;
> @@ -106,7 +105,6 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
>                                         devfreq->opp_table, &cpu_cur);
>                 if (freq) {
>                         *target_freq =3D max(freq, *target_freq);
> -                       cpufreq_cpu_put(policy);
>                         continue;
>                 }
>
> @@ -121,7 +119,6 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
>                 freq =3D dev_min + mult_frac(dev_max - dev_min, cpu_perce=
nt, 100);
>
>                 *target_freq =3D max(freq, *target_freq);
> -               cpufreq_cpu_put(policy);
>         }
>
>         return ret;
> @@ -255,8 +252,6 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
>                         =3D (struct devfreq_passive_data *)devfreq->data;
>         struct device *dev =3D devfreq->dev.parent;
>         struct opp_table *opp_table =3D NULL;
> -       struct devfreq_cpu_data *parent_cpu_data;
> -       struct cpufreq_policy *policy;
>         struct device *cpu_dev;
>         unsigned int cpu;
>         int ret;
> @@ -273,37 +268,34 @@ static int cpufreq_passive_register_notifier(struct=
 devfreq *devfreq)
>         }
>
>         for_each_possible_cpu(cpu) {

And analogously here.  I'd use separate two patches for updating this code.

> -               policy =3D cpufreq_cpu_get(cpu);
> -               if (!policy) {
> -                       ret =3D -EPROBE_DEFER;
> -                       goto err;
> -               }
> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D
> +                       cpufreq_cpu_get(cpu);
>
> -               parent_cpu_data =3D get_parent_cpu_data(p_data, policy);
> -               if (parent_cpu_data) {
> -                       cpufreq_cpu_put(policy);
> +               if (!policy)
> +                       return -EPROBE_DEFER;
> +
> +               struct devfreq_cpu_data *initial_parent_cpu_data =3D
> +                       get_parent_cpu_data(p_data, policy);
> +
> +               if (initial_parent_cpu_data)
>                         continue;
> -               }
>
> -               parent_cpu_data =3D kzalloc(sizeof(*parent_cpu_data),
> -                                               GFP_KERNEL);
> -               if (!parent_cpu_data) {
> -                       ret =3D -ENOMEM;
> -                       goto err_put_policy;
> -               }
> +               struct devfreq_cpu_data *parent_cpu_data __free(kfree) =
=3D
> +                       kzalloc(sizeof(*parent_cpu_data), GFP_KERNEL);
> +
> +               if (!parent_cpu_data)
> +                       return -ENOMEM;
>
>                 cpu_dev =3D get_cpu_device(cpu);
>                 if (!cpu_dev) {
>                         dev_err(dev, "failed to get cpu device\n");
> -                       ret =3D -ENODEV;
> -                       goto err_free_cpu_data;
> +                       return -ENODEV;
>                 }
>
>                 opp_table =3D dev_pm_opp_get_opp_table(cpu_dev);
>                 if (IS_ERR(opp_table)) {
>                         dev_err(dev, "failed to get opp_table of cpu%d\n"=
, cpu);
> -                       ret =3D PTR_ERR(opp_table);
> -                       goto err_free_cpu_data;
> +                       return PTR_ERR(opp_table);
>                 }
>
>                 parent_cpu_data->dev =3D cpu_dev;
> @@ -313,8 +305,8 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
>                 parent_cpu_data->min_freq =3D policy->cpuinfo.min_freq;
>                 parent_cpu_data->max_freq =3D policy->cpuinfo.max_freq;
>
> -               list_add_tail(&parent_cpu_data->node, &p_data->cpu_data_l=
ist);
> -               cpufreq_cpu_put(policy);
> +               list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
> +                       &p_data->cpu_data_list);
>         }
>
>         mutex_lock(&devfreq->lock);
> @@ -324,14 +316,6 @@ static int cpufreq_passive_register_notifier(struct =
devfreq *devfreq)
>                 dev_err(dev, "failed to update the frequency\n");
>
>         return ret;
> -
> -err_free_cpu_data:
> -       kfree(parent_cpu_data);
> -err_put_policy:
> -       cpufreq_cpu_put(policy);
> -err:
> -
> -       return ret;
>  }
>
>  static int devfreq_passive_notifier_call(struct notifier_block *nb,
> --

