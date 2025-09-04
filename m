Return-Path: <linuxppc-dev+bounces-11736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB04B43CDD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 15:17:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHg510w6Kz2xnM;
	Thu,  4 Sep 2025 23:17:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756991861;
	cv=none; b=Uy6zSXSUsTG7HhSapqyAGFOiiQ+f3nmxLeyYtKmYUiV5045sJqqDY5Z/xnAwFywLVd0ji4WBJNr4mC6RoHD5XaeMSkApKR2fDSZzQ/ah3KI/bM4aeDHJmEwEFM0rLbHZ9vdmdW6kEqHRLIfn39jy5fFdzCzpPFbepT4FyK6dc/hOJb1AaLpgPHDg8FGOZ/nzX6/bcn/gwqXZ37VaEBe4DE3am0yR65HRU9CzHHEnBAfcCQ/1SX32nMWZSOybvgAw3kxu+T46fmJGB33L7W5RXjc3/GtlMljw/MYThCkS9g2lACSvAABGNqDBgfykfHpBQLfk5iVrOzMD+b+kM4dm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756991861; c=relaxed/relaxed;
	bh=67l47YskJlJP8yhiZ3Hn8G5grVZLLDVvWpMgz14yWcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLHD0gdpadW9RrHwRI8CDNqn0aTrRwCGUCa4+S/2PRZ6D0n7d5wr2qe9LcM6tezPwvjiEJw6EGyAtRYbjmUdcRoa4/iIjlHFZ86KviGyezFcFgD9/9AI/Aqy2+0ugu9zuY36iGghsIm4iRewpou4ut+9nyyqJttHcgBasM8mUs6yMzIuPpD3wI5I/kP5IRiO0xgfCORikeSWN+6uj+q2AgNVAQenDB40AhAQtZpxTiwRYUsDsBbn+0M00Dx+dyBbc36+TqsepSjxYNYM3fLnJ/ieAdTVDNlsIf2CMsf4yNs1c0Wz9fX2SDl8AcjSmVi+f2tfe2mYL4Eet2CftPdgNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rSeeYMQC; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rSeeYMQC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHg4z6XwVz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 23:17:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4152842BAB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 13:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B3AC4CEFC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756991858;
	bh=J37h8zaAlmHnvnALjyhUgHlYpkvFqaV8s8bqNB0XjFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rSeeYMQC35U85BwNUUpTccZq+hmNBZVbOybxyuurDfaGkCAOruDMl/BJ+6V3r+u6h
	 58CWTnMu+bkN110RdLUvsucq93Jc3d5+kS4frgCgo3FVx3GWK1mqvcgH10uQaLNdrC
	 SjzoQa4PZZYmq/Cxf5GId4h0wwWgehrTcd3/KL9uaLs131Bk/JxcPE98Jb6fe/jKYz
	 z9ZzUD2u+kcZHrqVDT3DoVuv24+ayotdgqIP+Ft/7HhGElCcWzJX7QOvWcqV7tq8AE
	 Dyj7Rt7r/bwUN6zrO9NKAoaO0vQbLGPtbHKeSIOKcrHhUaGW45oySjjKxi6/1oZJq4
	 26vW+iK8JHIJQ==
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-74381e207a0so830745a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Sep 2025 06:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvjGLCrt3R+Hrh0W3BP8fAGI6myvQ6S9TLnMwwCkkuF/MMya5Ni+WPqPSh3HksXCfMY01nEHSwQ3tpNLs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzrmQx8CGDUf+W2qrTkomPHpCpPJs3VAPpMIQFM4GOXGR0duUJg
	9G01lf/WRwpHBOuQV+QOLYz/urxAzFjL/Ab8vBWOpuQTrIwzXomWgXs2zxcMCv7D3O0nJjIWvkC
	DUqJunxW4uy8016zBh5gkWzxU2vNZQH4=
X-Google-Smtp-Source: AGHT+IEjDfW+3hJPUPYu26F2xz+pxJ+KiqPGjYP79H7T0/I1zIoWql1eDpgpdg2oH+VBSzMp/G1t2kU5l5bZBE+Bi2g=
X-Received: by 2002:a05:6830:4901:b0:73e:8c8b:749 with SMTP id
 46e09a7af769-74569c6739fmr14127345a34.0.1756991857138; Thu, 04 Sep 2025
 06:17:37 -0700 (PDT)
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
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-8-zhangzihuan@kylinos.cn> <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
 <52e322e5-2dd4-488c-a98e-3a4018f0c323@kylinos.cn>
In-Reply-To: <52e322e5-2dd4-488c-a98e-3a4018f0c323@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 4 Sep 2025 15:17:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g__9g_dfA3=4GVi351f4CKBegKkW9nU81j+Qu=2Hfg1Q@mail.gmail.com>
X-Gm-Features: Ac12FXwmEGaidQr8PE8Gnv5hzk4SwGXFsXwEgV1BR4I0F2oh9v2_Dsc7pRXgYnA
Message-ID: <CAJZ5v0g__9g_dfA3=4GVi351f4CKBegKkW9nU81j+Qu=2Hfg1Q@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] powercap: dtpm_cpu: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
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

On Thu, Sep 4, 2025 at 12:38=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
>
> =E5=9C=A8 2025/9/3 21:45, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
> >> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >> annotation for policy references. This reduces the risk of reference
> >> counting mistakes and aligns the code with the latest kernel style.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >> ---
> >>   drivers/powercap/dtpm_cpu.c | 30 +++++++++++-------------------
> >>   1 file changed, 11 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> >> index 99390ec1481f..f76594185fa2 100644
> >> --- a/drivers/powercap/dtpm_cpu.c
> >> +++ b/drivers/powercap/dtpm_cpu.c
> >> @@ -144,19 +144,17 @@ static int update_pd_power_uw(struct dtpm *dtpm)
> >>   static void pd_release(struct dtpm *dtpm)
> >>   {
> >>          struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
> >> -       struct cpufreq_policy *policy;
> >>
> >>          if (freq_qos_request_active(&dtpm_cpu->qos_req))
> >>                  freq_qos_remove_request(&dtpm_cpu->qos_req);
> >>
> >> -       policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
> >> -       if (policy) {
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> >> +               cpufreq_cpu_get(dtpm_cpu->cpu);
> >> +
> >> +       if (policy)
> >>                  for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
> >>                          per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL=
;
> >>
> >> -               cpufreq_cpu_put(policy);
> >> -       }
> >> -
> >>          kfree(dtpm_cpu);
> >>   }
> >>
> >> @@ -192,7 +190,6 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
> >>   static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
> >>   {
> >>          struct dtpm_cpu *dtpm_cpu;
> >> -       struct cpufreq_policy *policy;
> >>          struct em_perf_state *table;
> >>          struct em_perf_domain *pd;
> >>          char name[CPUFREQ_NAME_LEN];
> >> @@ -202,21 +199,19 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm=
 *parent)
> >>          if (dtpm_cpu)
> >>                  return 0;
> >>
> >> -       policy =3D cpufreq_cpu_get(cpu);
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> >> +               cpufreq_cpu_get(cpu);
> >> +
> >>          if (!policy)
> >>                  return 0;
> >>
> >>          pd =3D em_cpu_get(cpu);
> >> -       if (!pd || em_is_artificial(pd)) {
> >> -               ret =3D -EINVAL;
> >> -               goto release_policy;
> >> -       }
> >> +       if (!pd || em_is_artificial(pd))
> >> +               return -EINVAL;
> >>
> >>          dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
> >> -       if (!dtpm_cpu) {
> >> -               ret =3D -ENOMEM;
> >> -               goto release_policy;
> >> -       }
> >> +       if (!dtpm_cpu)
> >> +               return -ENOMEM;
> >>
> >>          dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
> >>          dtpm_cpu->cpu =3D cpu;
> >> @@ -239,7 +234,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *=
parent)
> >>          if (ret < 0)
> >>                  goto out_dtpm_unregister;
> > So this change kind of goes against another recommendation given in cle=
anup.h:
> >
> >   * Lastly, given that the benefit of cleanup helpers is removal of
> >   * "goto", and that the "goto" statement can jump between scopes, the
> >   * expectation is that usage of "goto" and cleanup helpers is never
> >   * mixed in the same function. I.e. for a given routine, convert all
> >   * resources that need a "goto" cleanup to scope-based cleanup, or
> >   * convert none of them.
>
>
> Should I replace all the memory allocation cleanups here with `__free`?
> That would allow us to drop all the `goto`s, but since this function has
> quite a few of them, I=E2=80=99m concerned it might introduce new issues.=
 What=E2=80=99s
> your recommendation?

Frankly, don't use __free() in this code at all, at least for the time bein=
g.

There is a problem with dropping the reference to policy at the end of
__dtpm_cpu_setup() because that policy may be subsequently indirectly
used in set_pd_power_limit() which calls
freq_qos_update_request(&dtpm_cpu->qos_req, freq) and
dtpm_cpu->qos_req->qos is policy->constraints, so using it will cause
policy->constraints to be dereferenced in freq_qos_apply() which will
crash and burn if the policy goes away in the meantime.  So AFAICS
__dtpm_cpu_setup() shouldn't call cpufreq_cpu_put() at all and the
policy should be released in pd_release() without acquiring a new
reference to it.

You may as well try to fix this if you have free cycles.

