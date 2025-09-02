Return-Path: <linuxppc-dev+bounces-11617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C310B3FE38
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 13:47:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGPBD6fTvz2yrg;
	Tue,  2 Sep 2025 21:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756813668;
	cv=none; b=SVcXW3vbvsgYCfFTvgjzomDqTgD3UUuMguOpaIV3JMY8woUTwrVIcJVuu6WP/RMYlC/PEn/pC6LO2vaHgcz33irMAbQYTZgrgfOAzwpgs6f3M/+yyu2NTFAPqqjsUX+z1OPmJiJLkdVX9bGA2QinY08rPDb5oGP2o07NkSevuPtGnmf9B9nx8JwMPO37G6sDOrUc48utvLNO/gyPuenjAqE6wVJyLJFGRr1/3Ot4DnfDQ/X3XdvUziYBexulBRed0E9fjD2UwJ2deGA3S/vhTZCAWRgsltfmNl+AChP+6rY5xkYblRpLZvUqRfMNF7Mhkx9WsSjtaBUrtn8MP3R5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756813668; c=relaxed/relaxed;
	bh=xQ8t2bboIzd7cHm3OScP5qlwpTcm1FmAONHyDli97iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVTjXrDqGaX8JbFSKRouTLzFxe0vWG4P2Q2kCXjR3FcTKqYXjhGV8Av2QFIrNlq3pyadphWPywayfQOS12lMVaalBhWmHMZ99IYj2m+d8R4O1cJ/WgUkt1zFWzTzkf3UkflCa2bS8eUUmPH0eOloYQGDdDc3hmrFArR5j2k5tuVKGZ8F6rDTDD7Fm7oLZyDjmTVkHBUxoyXcO+fAkFlR31po2W0s/RGgONBRRNdNJ8nWXcXpwPrHOeRwvSTk5PLC/X0efLAqSY91mSRdRmOJMr53E4GlqaWpnMaVjA4H1mQfc4xz4WxlD3D1IKY8SoI82gfhbSxXvBiDacIIXwc6/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HPfsH/6Z; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HPfsH/6Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGPBC75njz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 21:47:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB4AF60212
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 11:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9C4C4CEED
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813665;
	bh=gAWv/p7BEF+KhNFGeotQ/1FrGNmecWyX1X5tGPHcCbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HPfsH/6ZQcNOGF26sYaQeEFwmNMIdemb3Sta1S24MP4Zqrzhp4xCYmME5rlpIalRH
	 wypS78addLryNXm+pxr8ZGRJ6CcNSwygSiD1yVSMsso71z9NbVxptxqSwM6eYw/hYg
	 E0n3a2RupUKViIi/xlJEoNXhZ7BEfE1ktdGaf5/LFZ2Ez9stJf6othwGdlk629boGF
	 /qfOkz7gPd4OTUDCeTkBwoG5jhFrt7JDvzdGAjA8tfRoviw73ahpeW1eDDr4LJyfaL
	 kf0/YFTRyn96EDkuB2SQEiQU90yOjmPyWIIFwn87EXpdsYgRoiI9E5Ci5ZKOtauLQA
	 Z0F2061pPrGmQ==
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-74381e207a0so3751726a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Sep 2025 04:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrTbDyB1t1jwVOTXrun48DYi2Q1bW90QpNqNRJo0oTnuOVHz86aut/Q8XdwDYBZCZ3YoJi3bFkl+9KrNk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxT+hr6cRP51JOD/NPjlcOIg9t5vXPHjEjm7BHqK0qrQA5jvnk2
	yjOx70kovoWL5CHVYvxlUUBSIVfdoSBTdTrylq57tpkwYqAUMoEZeRthHwQwz6BagukW2XczMbv
	Eh2tCZV1rKplru6FBn64n6YtAH7fHBc0=
X-Google-Smtp-Source: AGHT+IECJJHjGAnU1NUr4ozcxCWnRFCL9WRpq+BEhjBinEbwysmqVcNyjx+zeZUwmYMUKeDdT6dFc6CYWYPr3CoZ3wk=
X-Received: by 2002:a05:6830:3746:b0:743:8af2:1b0e with SMTP id
 46e09a7af769-74569e90f29mr6034860a34.19.1756813664724; Tue, 02 Sep 2025
 04:47:44 -0700 (PDT)
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
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
 <20250901085748.36795-4-zhangzihuan@kylinos.cn> <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
 <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn>
In-Reply-To: <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 2 Sep 2025 13:47:33 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
X-Gm-Features: Ac12FXxFwO1d3JYj5phS50T_U2DONG2wuxBfs8rK_GU-NaLU6wYAD3eFplzuixw
Message-ID: <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] cpufreq: intel_pstate: Use scope-based cleanup helper
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

On Tue, Sep 2, 2025 at 12:33=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
>
> =E5=9C=A8 2025/9/1 23:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
> >> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >> annotation for policy references. This reduces the risk of reference
> >> counting mistakes and aligns the code with the latest kernel style.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >> ---
> >>   drivers/cpufreq/intel_pstate.c | 8 +++-----
> >>   1 file changed, 3 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_ps=
tate.c
> >> index f366d35c5840..4abc1ef2d2b0 100644
> >> --- a/drivers/cpufreq/intel_pstate.c
> >> +++ b/drivers/cpufreq/intel_pstate.c
> >> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(struc=
t cpufreq_policy *policy,
> >>
> >>   static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
> >>   {
> >> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpudata->cpu);
> >>
> >> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
> >>          if (!policy)
> >>                  return false;
> > The structure of the code is intentional here and there's no reason to
> > change it.
>
>
> Got it. Thanks for clarifying.
>
> So for this case the current structure is intentional -

Note that I'm talking about this particular change only.  The other
change in the $subject patch is fine.

> should I also avoid similar changes in other drivers?

That depends on who maintains them, which is why I wanted you to split
the patch into smaller changes in the first place.

My personal view is that code formatting changes, which effectively is
what this particular one is, are pointless unless they make the code
much easier to follow.

