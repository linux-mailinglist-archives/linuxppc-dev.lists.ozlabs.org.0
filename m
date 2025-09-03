Return-Path: <linuxppc-dev+bounces-11679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943ECB42256
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:45:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH3ld0rNNz2yrl;
	Wed,  3 Sep 2025 23:45:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756907132;
	cv=none; b=av6dzp+CInZXS28ry71KGa6fcmOmMGaVmBbvRaAnLVqilb+S48j/wAk2D2+n6M4349pHotOmHLKmwXvrJw3JL/oz5bF+Pxkb9bQRLDgJlrTATsHjohFjoUptP1SXJ+PbwYnNzkdA24Kum4AbxDgHsjvZnq9tBl9C9/UVMSMxNvL2kxF9J5cikUu9OddLesFiSBnx2caUhuAcXNJXxtvQvRB+NJsZ1nbAwf04M+dsQkFHtKkJw9STQXpSrgYVtdminAeSZoY0skb+BeUtMIE6zQZWdlngeDbVfLGwIJg9Bki+sbVNu9+dN/XOz4DHieoTIR2jPAjQ3LV7lbVjm1NMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756907132; c=relaxed/relaxed;
	bh=9LvNkoiJNwvEbI5/GhvG6oLSTV72XAkWAFny+OqQS8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PM2A2ISlfMy213n09rlJ1iwQwPCdboZnIOhqdFId9VzDsd6evEC+AfBAp87pXJ7jwmZI9mNkGIjP7UwyrpSlHGccQ/V3FtBscUTwSrKZm/wYZiOQbuIMSvn/Y5IzFgwhmTlWVM3H1vlMgPq4hNTQ6ZPV9erpVpeWbtvBFqJtYc5WHdfzaA84JN+yTkGI6SBote8O5XuzTTiYhQjbfME8HwbrIlsXlzCjVvgzdJ8q0qvr5hB75Priy2vjdpFu1f6+9TDoHQKOtkeAXsseiEGVbHuBmO6WAjhIKIOND/sz03DEPi9P1hEsO3OF4tTjjI2IgXVB2KDve+j79RrAmDqHrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EtV1vxk9; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EtV1vxk9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH3lc284Fz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:45:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DCE76025D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 13:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2444C116C6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 13:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756907129;
	bh=6Bp49XvIiL/gpcZUSJHbjfPDkjkxFuVv8aVM1mwkppM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EtV1vxk9Knh7vuhM8x4HkCnMMQg77LBHWAZjfHt0hykdAtk0J7zkljpn1dRo8ALRy
	 nJBjQbGoGlt335lc6Yejbwt37hjTv6p8SfDTunaRiW2oQzHQJq0rlhZtQ1LRmN6+mL
	 IGnwxZAwUAyqQhCdqcZjg6unlXq+oHZaIHgAwNaLEtGxgemHO0ZOaXw9RabH2oRHjO
	 1NAsUX1pvy8xvLLbjRFOhcQ7OcGTcv3rYRTxHcZtSDX9/AS365g+6AYkmZe7Gug6n+
	 egQHkiSWI1KySu6kre/fm/A9KyjZ9fyn2Wecsk4AkYcdc4XAKirge13OlUIx7BdFSr
	 JLHu0DYRXsxWw==
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-74382048b8cso4085417a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 06:45:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiP1L8z2RNAMm6YXI3a5cJzmDsJQReLohTlp+Nd4P9av7GcVNrEpBn4FTTpSR4BESkEdJtj/lp4lnHfjY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQImohWvQvi8lAiHOedpYZWq5w85pO5Dlt2B/CYnuzUFasRLDR
	M77bNLiwmZZodAnhHfQwtpf7s2HA2xWIVFu4t72fbjv7ysx2TFdnxD3MfdAkKu7d9ME258iocul
	Ctq8KQFVBxz0h/jYWgNO2duyc4NNonp8=
X-Google-Smtp-Source: AGHT+IFj7tJ0lfFEWygwFa+BeDrtHlIidd3MSLvzw4pQoHyU3fN8psDlEaELWcEJ9+cmnisQYq8U5lt0bInRpr2lJAs=
X-Received: by 2002:a05:6830:6682:b0:745:9ba6:d32c with SMTP id
 46e09a7af769-7459ba6d61bmr1062886a34.2.1756907128976; Wed, 03 Sep 2025
 06:45:28 -0700 (PDT)
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
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn> <20250903131733.57637-8-zhangzihuan@kylinos.cn>
In-Reply-To: <20250903131733.57637-8-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 15:45:17 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
X-Gm-Features: Ac12FXwBQmIxy8zPXuaWqJJ1Bp0qaxbUEME_ozpvMpdmoYPanY06xkhRVAoy8ys
Message-ID: <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] powercap: dtpm_cpu: Use scope-based cleanup helper
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
>  drivers/powercap/dtpm_cpu.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> index 99390ec1481f..f76594185fa2 100644
> --- a/drivers/powercap/dtpm_cpu.c
> +++ b/drivers/powercap/dtpm_cpu.c
> @@ -144,19 +144,17 @@ static int update_pd_power_uw(struct dtpm *dtpm)
>  static void pd_release(struct dtpm *dtpm)
>  {
>         struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
> -       struct cpufreq_policy *policy;
>
>         if (freq_qos_request_active(&dtpm_cpu->qos_req))
>                 freq_qos_remove_request(&dtpm_cpu->qos_req);
>
> -       policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
> -       if (policy) {
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(dtpm_cpu->cpu);
> +
> +       if (policy)
>                 for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
>                         per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL;
>
> -               cpufreq_cpu_put(policy);
> -       }
> -
>         kfree(dtpm_cpu);
>  }
>
> @@ -192,7 +190,6 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
>  static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>  {
>         struct dtpm_cpu *dtpm_cpu;
> -       struct cpufreq_policy *policy;
>         struct em_perf_state *table;
>         struct em_perf_domain *pd;
>         char name[CPUFREQ_NAME_LEN];
> @@ -202,21 +199,19 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
>         if (dtpm_cpu)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(cpu);
> +
>         if (!policy)
>                 return 0;
>
>         pd =3D em_cpu_get(cpu);
> -       if (!pd || em_is_artificial(pd)) {
> -               ret =3D -EINVAL;
> -               goto release_policy;
> -       }
> +       if (!pd || em_is_artificial(pd))
> +               return -EINVAL;
>
>         dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
> -       if (!dtpm_cpu) {
> -               ret =3D -ENOMEM;
> -               goto release_policy;
> -       }
> +       if (!dtpm_cpu)
> +               return -ENOMEM;
>
>         dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
>         dtpm_cpu->cpu =3D cpu;
> @@ -239,7 +234,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
>         if (ret < 0)
>                 goto out_dtpm_unregister;

So this change kind of goes against another recommendation given in cleanup=
.h:

 * Lastly, given that the benefit of cleanup helpers is removal of
 * "goto", and that the "goto" statement can jump between scopes, the
 * expectation is that usage of "goto" and cleanup helpers is never
 * mixed in the same function. I.e. for a given routine, convert all
 * resources that need a "goto" cleanup to scope-based cleanup, or
 * convert none of them.

>
> -       cpufreq_cpu_put(policy);
>         return 0;
>
>  out_dtpm_unregister:
> @@ -251,8 +245,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
>                 per_cpu(dtpm_per_cpu, cpu) =3D NULL;
>         kfree(dtpm_cpu);
>
> -release_policy:
> -       cpufreq_cpu_put(policy);
>         return ret;
>  }
>
> --

