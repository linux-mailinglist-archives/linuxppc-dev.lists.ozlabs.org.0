Return-Path: <linuxppc-dev+bounces-11773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 105AEB453BB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 11:48:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJBPM6tTjz3bxC;
	Fri,  5 Sep 2025 19:48:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757065719;
	cv=none; b=l2apX+ccCsK11xQK8Li+vmabShN1r9P2dN3fMyuAKN3+M1xVGIA6RtfYkOQSbQp+Xsz8Q5kUGVGp6XnBW83VmpSrBns8RIpFvXIOGl3JtjUlZo6OT/i1i0AjaFxuxD8516Udp0r2DKaGwOtG0Qx7NS5WaH/PzRIq0ap0nFLLuohew2eY++1uUrSfqpWW+eZUbN6f6htNeYdKsLWPoyfnP55Za4HhxHuJsMkcpA29rwOZmM4kK4rYe2IlQi96Cuv76mAGNqmNWXiGGX9hym5JrxPRB9+yviRGN9GoN5sErXWKbqv16uzuGleSDf8M7VGFCsSmDAt3Jc4zMHLPKVNG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757065719; c=relaxed/relaxed;
	bh=Bvlp9QpXI8QOMlTWbQnnIVGa+KEAXDjT4IoqDRRRoZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6LV1So9SMP4BYfSMwpp0JfwVgwQP2cGuThjPXhdO2WYwE5LnNSNK3EGOtP4/YNCXaTOKBsVKijP4m3ejJtONplKLFZxjk2i8qy5fzYp/KwZwhg6aJy0xMg+KKwqIDrv8knAOIfzZKz31qawqgyZEHU9VxW/Hlm5RZZfzXGf31vdPyUB7/tXZKkCG7R7Qai5rXlQSDbBllzK6szmlf/O4XoocTtk7Wy7rM6g9PduNB8YECf1k41i1WGcNxzJWerhbTB9zg8h7bmTgjygixLVAXp2QJU2H0onIo7nyEgEk6ma8Vw+Gv9m0cnA7W9t4/LAXRXn5BI47Wu4rBipKGZZAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=maFSgfUy; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=maFSgfUy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJBPM0Y4pz3bx1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 19:48:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDC9244D29
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 09:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1ACC116B1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757065716;
	bh=60j1mYXfx8imU4XQiFjnOOvCwt0U79tykqDPzODIpZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=maFSgfUyMQwnqV1XKC3DkrSxo3c4Gr1bocEJUa0cLC/fCnWL7VKM4c2Bo9v1SmE4u
	 yVQjdnUaUzl/q7oOdXDTBWOziVgkW3OUauQ8yDbUzkhD+Ea/pnt8pUGe+qn8Hxy6DP
	 errowBQd2WgD8DTePq4VnEhBOJnbeJmsXbrCagkdiWyhFzq39BzhmUenO0511YEV7n
	 jg+iBtIvamrBFBb9f8DY9bEXpN3pl+sA7SKU5wB9iLK+S2xWlmrKw+vsNDCdZOVn3Y
	 RFDI8L2baCVkbbjmpaN5vYKIn9ynTjCxTDJPLLx6OTo4NvTKH9jSoNhMTydU60UEnS
	 1fR3EU3FDmD7Q==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-61ff35a56d3so739190eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Sep 2025 02:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMiRY++KoAgJZxaFVDyZ0YnX/FRm47iXY4cK1NxFaBG0sh8kawYGQgT3sHa9AjqZ01SiFQNCyGTPllb5Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywabj5Lo3RkBDErA/w565oJLqkqEzaRgy8SyIznb6IgCbzHueWz
	rGgLZmkXZ0wGR6afvRcn8lsA75QPrDGOOFOqXqknecqIDyafM+6V/jsp795XIHi2x5TLogLIrXs
	kogzm+dcxxILwppl48ejJwnXOUowQjVw=
X-Google-Smtp-Source: AGHT+IHkVwjUQLo7sTj2SxSH10cahTF1EYNw9jM6xcyVmF8yMApnd+1WPw0MFaTQWrdPzjCgm5hFMvaNgP7dcxRbczQ=
X-Received: by 2002:a05:6820:1b96:b0:61e:154c:5b01 with SMTP id
 006d021491bc7-61e3374776emr14360839eaf.6.1757065715741; Fri, 05 Sep 2025
 02:48:35 -0700 (PDT)
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
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn> <20250903131733.57637-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250903131733.57637-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 11:48:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gN1T5woSF0tO=TbAh+2-sWzxFjWyDbB7wG2TFCOU01iQ@mail.gmail.com>
X-Gm-Features: Ac12FXwjp9ef-jXM-6Nr2o91cs1h2j3e0FpihiJghXWzXAbogv1aACVXGXzJKyM
Message-ID: <CAJZ5v0gN1T5woSF0tO=TbAh+2-sWzxFjWyDbB7wG2TFCOU01iQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] cpufreq: intel_pstate: Use scope-based cleanup helper
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
>  drivers/cpufreq/intel_pstate.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..925efb1e65be 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1209,6 +1209,17 @@ static bool hybrid_clear_max_perf_cpu(void)
>         return ret;
>  }
>
> +static struct freq_qos_request *intel_pstate_cpufreq_get_req(int cpu)
> +{
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(cpu);
> +
> +       if (!policy)
> +               return NULL;
> +
> +       return policy->driver_data;
> +}
> +
>  static void __intel_pstate_get_hwp_cap(struct cpudata *cpu)
>  {
>         u64 cap;
> @@ -1698,19 +1709,13 @@ static ssize_t store_no_turbo(struct kobject *a, =
struct kobj_attribute *b,
>  static void update_qos_request(enum freq_qos_req_type type)
>  {
>         struct freq_qos_request *req;
> -       struct cpufreq_policy *policy;
>         int i;
>
>         for_each_possible_cpu(i) {
>                 struct cpudata *cpu =3D all_cpu_data[i];
>                 unsigned int freq, perf_pct;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> -                       continue;
> -
> -               req =3D policy->driver_data;
> -               cpufreq_cpu_put(policy);
> +               req =3D intel_pstate_cpufreq_get_req(i);
>
>                 if (!req)
>                         continue;
> --

This change would have been fine if the modified code had been
correct.  Unfortunately, this is not the case because below req is
passed to freq_qos_update_request() which accesses the policy object
indirectly through it, so the policy object should be
reference-counted until freq_qos_update_request() completes.

I will send a fix for this shortly (it is better to fix it before
rearranging the code to allow the fix to be backported more easily)
along with my version of the change in question.

Thanks!

