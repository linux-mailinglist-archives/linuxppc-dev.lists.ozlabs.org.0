Return-Path: <linuxppc-dev+bounces-11887-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B65B49779
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 19:44:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLDpn1Jsgz2ySm;
	Tue,  9 Sep 2025 03:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757353457;
	cv=none; b=ntQeSMPX8n8EhgbxOD1zNKVt2zxJPIAWQVt6yzI8+CmNnTAM5Z6WJwZQebHYSDpRBbxPBQYCLTv2UEqOL4Zqr8wZyeUkzFTu+YcnWMhsNYGqQsbp8mNq7nLwUAM2xdjuUIzK6fpLhMWhVeOq1J16wKy4+SjEuDwSCpYRBnLR838Ssbu8piNNHFwns5coZtaZ+VjMLmsg6cdCOMV8ha1OagphEg49o1RFn48+Ho54H+cq5Jic4TUu9vLXGY7DZUFW3EiSfrXQm3ILYzgxmJw3ihZ94b1ev+hwjlm0aeNgsK5MW/R5YFuOCTL4Zmap8p3lpiUuWq0uU5iqnk3IDTa80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757353457; c=relaxed/relaxed;
	bh=wxirNakCW5Y4uygUagvcPttDkjZ9p6EjGq3aHiHAB2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDA62CE9+F5ZntcpiRSzvJEEH7or3Q/3RLqIparh4xMDC9K8gHUCjDBUyoJErPYGpR6OLCafBcm9ZD2KOTRTgfWwhU7igxkFsHbvQBpPDmHNVfZBv8wvF/E30w0hGzclufg32HuKmbBMb/ma7PMT1QeS/0I1Toj8og4MCMjy1hk9pkF1ebUnMnUMyPtrcCmhTVikn243TI9FXT3aCo9lmW4w8PSaX/gSMTNnhw21jlxkp5IIw7a5AI5hjDswzU9+iXQgYQwDFaYFqqig6TUOrYM6HOuZrQWqcnDfWeiGFEEctOqbygCslQ/mbu2LASJLjzgH3IynXkgZR9J3abxZ9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZwMfmhap; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZwMfmhap;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLDpm2GLPz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 03:44:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 345E6601EE
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 17:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF217C4CEFF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757353453;
	bh=pxv4SKGaeo+/iwpYsHET1lGXi6vy1Me0WnNKi9ZjTC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZwMfmhapoldvlFOiIwZqWN68UI9FDn5DoJ/kGkFvNIKt/vRabP5Mn+uMhSJqLi76b
	 rYpyj5EGPnVZZNGXEOp13TH7G3kyO7lDDYhnq4wTxDMgDRsdjezuEsBzKYGQzvNxgg
	 opfm0sATzEU688RwQzya4Fhzw5jKShM4BbvFXG2bQITTOc3xs5xYH/suVG7xWhj0Ug
	 42WOBJKgOXwZCmmmTCgYmwH+aUqZAex0bSNVhUWalaLAVTnOea4myoJvZzrsJjevNI
	 q9o36ppFB435akVqY7Al0qE22NTiU8EYViUNs4e+GKjbn3umZrdc05g0eaHWkP4GcU
	 mlBgghbxNO8vA==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6218ef6bbd7so355639eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Sep 2025 10:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUz2tCEVWv9rFcnsn5S2mjURGZzLAHVEKw7Rx2LblZbNtidKTgtdiMB+WMiHLp6pBx48WDftk7nW79NEk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXp5MOeHSIYLanZdTeeWMPM2sshDhFhRYjCQ8wTDvS54Ssqnxu
	cViOiGn0Nsm/Dt6SvLWsOrAeuKeMv2DEMjP59YK5uGY90DwDdsPt58y6NR2HR+FP8YhYikz06T2
	eByD9WY7xEc2vA3dSErC07H0K7XLl+cg=
X-Google-Smtp-Source: AGHT+IEmLNooDlmw6mUZRYEbyTwg6KsbFI0N3/Ra3KC+hBAS5x57Hk+ruqmJHv0ou2jqI/XILrzNZEQVMGT+C7Z3Oeg=
X-Received: by 2002:a05:6808:198f:b0:439:b82f:ce with SMTP id
 5614622812f47-43b29b4d9d1mr3597972b6e.31.1757353453065; Mon, 08 Sep 2025
 10:44:13 -0700 (PDT)
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
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
 <20250905132413.1376220-3-zhangzihuan@kylinos.cn> <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
 <6683fb5a-64f4-433e-a22b-153b01dfa572@kylinos.cn>
In-Reply-To: <6683fb5a-64f4-433e-a22b-153b01dfa572@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Sep 2025 19:44:01 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h9pYXi4Op4zAA+Q7QZz5gkJg+83eKUCqM-YKh76CVLKg@mail.gmail.com>
X-Gm-Features: Ac12FXxUqqlT9sudI62ao99U1pS-dgaUtp-l-yYYj3dQjoUJWeYTt-vc3mF_8T8
Message-ID: <CAJZ5v0h9pYXi4Op4zAA+Q7QZz5gkJg+83eKUCqM-YKh76CVLKg@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
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

On Mon, Sep 8, 2025 at 11:16=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
>
> =E5=9C=A8 2025/9/6 04:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Fri, Sep 5, 2025 at 3:24=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
> >> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >> annotation for policy references. This reduces the risk of reference
> >> counting mistakes and aligns the code with the latest kernel style.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >> ---
> >>   drivers/acpi/processor_thermal.c | 52 +++++++++++++++++-------------=
--
> >>   1 file changed, 27 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor=
_thermal.c
> >> index 1219adb11ab9..460713d1414a 100644
> >> --- a/drivers/acpi/processor_thermal.c
> >> +++ b/drivers/acpi/processor_thermal.c
> >> @@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
> >>          return 0;
> >>   }
> >>
> >> -static int cpu_has_cpufreq(unsigned int cpu)
> >> +static bool cpu_has_cpufreq(unsigned int cpu)
> >>   {
> >> -       struct cpufreq_policy *policy;
> >> -
> >>          if (!acpi_processor_cpufreq_init)
> >>                  return 0;
> >>
> >> -       policy =3D cpufreq_cpu_get(cpu);
> >> -       if (policy) {
> >> -               cpufreq_cpu_put(policy);
> >> -               return 1;
> >> -       }
> >> -       return 0;
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
> >> +
> >> +       return policy !=3D NULL;
> >>   }
> >>
> >>   static int cpufreq_get_max_state(unsigned int cpu)
> > The changes above are fine and can be sent as a separate patch.
> >
> >> @@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
> >>          return reduction_step(cpu);
> >>   }
> >>
> >> +static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acp=
i_processor *pr)
> >> +{
> >> +       unsigned long max_freq;
> >> +       int ret;
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
> >> +
> >> +       if (!policy)
> >> +               return false;
> >> +
> >> +       max_freq =3D (policy->cpuinfo.max_freq *
> >> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction=
_pctg)) / 100;
> >> +
> >> +       ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
> >> +       if (ret < 0) {
> >> +               pr_warn("Failed to update thermal freq constraint: CPU=
%d (%d)\n",
> >> +         pr->id, ret);
> >> +       }
> > But this silently fixes a bug in the original code which needs to be
> > documented with a Fixes: tag (and it would be better to fix the bug
> > separately before the using the __free()-based cleanup TBH) and
> > introduces some whitespace breakage.
>
> Thanks!
>
>   I=E2=80=99ll follow your advice and handle the Fixes tag and whitespace=
 issues.

Actually, no need to resend.

The current code is correct as it registers and unregisters the freq
QoS request from cpufreq policy notifiers, so the policy is guaranteed
to be there when cpufreq_set_cur_state() runs.

