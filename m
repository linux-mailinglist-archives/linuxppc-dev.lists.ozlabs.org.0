Return-Path: <linuxppc-dev+bounces-11797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359BBB4590D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 15:32:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJHML6trFz3dKq;
	Fri,  5 Sep 2025 23:32:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757079134;
	cv=none; b=KxJLOtbYUOLOPSsqOcHlrudvFAYK/BfDRXDLZWaXrqVpfBKzK0KdY49SjrTYb/1SdJjVuLrgZM1UJFzAe7hmdoHGt+6ALthvYcNUwjV1XbChx7f3evNIFwueX75FnEHSmiHGwCxi0k9hB57atzgtMwnXDu5mpiOghqRZg4MhyDNm34wgi/3dvTPg6KqsMnYegfDiaiWkouowvFB3p9QVFNxfDdo7xG/ooWbalRkJMNP7lGGQpfQObSeKYPho4jKNouGegmWfLhTsnMvgQJLUDmUZWfErKUwM7TlCcnNqx7oDkYHKyMmBvc1GPsa1K/IkAecfeUW97tc/bvH+1NNqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757079134; c=relaxed/relaxed;
	bh=xhHz+TFr6n8MBsawIb4Oc3dwbFBJk4FHeDQHAJj5oGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ud6CpiKz/9R+XZ3iDaj1T7FRJ5r5LH9yQxC/T4KTFR7AD+NRk09I2qghFRTMvsxDUg9SvjWsLWG5OWW31Tn1GIYgnm0LJi6P3h+OL5XxnoXmDLrKaVZqw2Xm2sAHDoU50VNpwBZ98KFHRgMnFQ+gOjjoghSd2PQI2o6icxPwvXljEJE47iGYtUo2vj/o2b71rF/wsrDFLkZMTyXbvek8oyyVZLAmUGxz6Dvsia4WoBmVLO/x6lxUwzp54C+uBauT5tj8K/tLvQ0GA6AZa52XV8oS+eCBWxAh0zIuk+3aW/UeIdR4D/g08Vlzthn3kirjdO21qJ1XX8nRBvbQMIBJ5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YDLPRfxE; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YDLPRfxE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJHMK6dL4z3bqV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 23:32:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65C3B602A3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 13:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26707C2BC86
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757079131;
	bh=8jAcdpkwkSpwOdJxvwA2Vj7xEHXguZJ+MKwk0qNCAa4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YDLPRfxE+TA2Q55nxy+S45umyans+pDRvwbObVt0bW3hJ3GKjbxPrVlX07NomP+MM
	 gilJHDzfgmGFOcAFu0+loSilTzpkeDO9g9x8k2BAevsNOqWlkswrDpHfRJW58By2gZ
	 h5T2iOat+XnnhSD9UwBeQ3xYHCYi7jaP+GtkcpXBdqab/ccFdCeVstKHtgcieR/3QH
	 +KRTayLgDC1M/LhwjwPtXIccD6HoAsAvaea3u1dA7qTzCEzjxT3V+HO3EHQdCVNDFU
	 /St9BM0FbaHx4JdEUTHAM1R9DDj8M5cKZD+5HIpQks7AUiitM6xvVlMUYXsHzcS8lI
	 bWTNhY8srV4ig==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7457728474bso1141514a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Sep 2025 06:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuRj/3BLFPRWXOeyYCmUxzxgc2oAfw7ug4eDg74lqx5ptlmzYoFUCSQDHJUwSCZh6YzPrCNF1eJM/9K74=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0ptwFQZtv5+a3BtdofxSIGQARyaXalOYZVeQk8l3DL8qoUqCV
	VbD/SvMwhJuCexLOgl2KRtHRHie0oz2skfOApR/9oAGqkHrlwVTsgJZD2sQXNsdicaCDiAkQn0D
	M2gWtleFApkeBmXxd4r8NkqEVXm7oAeA=
X-Google-Smtp-Source: AGHT+IFnE56n2ZWY3m6GFquWJS3R+4zyRWG4mn/x7Tvk/fQPvR7/F7IjMN/5eFQpLDwVxaDdPh5JX7KANJsrFqH4mJc=
X-Received: by 2002:a05:6830:378e:b0:741:a5f0:bc82 with SMTP id
 46e09a7af769-74569e53d0dmr13231613a34.17.1757079130135; Fri, 05 Sep 2025
 06:32:10 -0700 (PDT)
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
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn> <20250905132413.1376220-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 15:31:58 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jdJZ2upvE4KzDnc59KpMX+oqYbq=ZW=SXfwvjBctMj3Q@mail.gmail.com>
X-Gm-Features: Ac12FXwR6ToJkYo5xTTss3xr-Ox8ITso59X_uvklZva98cFgnVHnG6meS0I7mt8
Message-ID: <CAJZ5v0jdJZ2upvE4KzDnc59KpMX+oqYbq=ZW=SXfwvjBctMj3Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] cpufreq: intel_pstate: Use scope-based cleanup helper
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
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

No, sorry.  I've already said that this isn't going to work:

https://lore.kernel.org/linux-pm/CAJZ5v0gN1T5woSF0tO=3DTbAh+2-sWzxFjWyDbB7w=
G2TFCOU01iQ@mail.gmail.com/

so why are you resending it?

And making changes to it in the process without saying what they are?

Please stop adding confusion.

> ---
>  drivers/cpufreq/intel_pstate.c | 59 +++++++++++++++++++---------------
>  1 file changed, 33 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..0b54e08f9447 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(struct c=
pufreq_policy *policy,
>
>  static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
>  {
> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpudata->cpu);
>
> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
>         if (!policy)
>                 return false;
>
> @@ -1695,41 +1694,49 @@ static ssize_t store_no_turbo(struct kobject *a, =
struct kobj_attribute *b,
>         return count;
>  }
>
> -static void update_qos_request(enum freq_qos_req_type type)
> +static bool intel_pstate_cpufreq_update_limits(int cpu, enum freq_qos_re=
q_type type)
>  {
>         struct freq_qos_request *req;
> -       struct cpufreq_policy *policy;
> -       int i;
> +       unsigned int freq, perf_pct;
> +       struct cpudata *data =3D all_cpu_data[cpu];
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>
> -       for_each_possible_cpu(i) {
> -               struct cpudata *cpu =3D all_cpu_data[i];
> -               unsigned int freq, perf_pct;
> +       if (!policy)
> +               return false;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> -                       continue;
> +       req =3D policy->driver_data;
>
> -               req =3D policy->driver_data;
> -               cpufreq_cpu_put(policy);
> +       if (!req)
> +               return false;
>
> -               if (!req)
> -                       continue;
> +       if (hwp_active)
> +               intel_pstate_get_hwp_cap(data);
>
> -               if (hwp_active)
> -                       intel_pstate_get_hwp_cap(cpu);
> +       if (type =3D=3D FREQ_QOS_MIN) {
> +               perf_pct =3D global.min_perf_pct;
> +       } else {
> +               req++;
> +               perf_pct =3D global.max_perf_pct;
> +       }
>
> -               if (type =3D=3D FREQ_QOS_MIN) {
> -                       perf_pct =3D global.min_perf_pct;
> -               } else {
> -                       req++;
> -                       perf_pct =3D global.max_perf_pct;
> -               }
> +       freq =3D DIV_ROUND_UP(data->pstate.turbo_freq * perf_pct, 100);
>
> -               freq =3D DIV_ROUND_UP(cpu->pstate.turbo_freq * perf_pct, =
100);
> +       if (freq_qos_update_request(req, freq) < 0)
> +               pr_warn("Failed to update freq constraint: CPU%d\n", cpu)=
;
>
> -               if (freq_qos_update_request(req, freq) < 0)
> -                       pr_warn("Failed to update freq constraint: CPU%d\=
n", i);
> +       return true;
> +}
> +
> +
> +static void update_qos_request(enum freq_qos_req_type type)
> +{
> +       int i;
> +
> +       for_each_possible_cpu(i) {
> +               if (!intel_pstate_cpufreq_update_limits(i, type))
> +                       continue;
>         }
> +
>  }
>
>  static ssize_t store_max_perf_pct(struct kobject *a, struct kobj_attribu=
te *b,
> --
> 2.25.1
>
>

