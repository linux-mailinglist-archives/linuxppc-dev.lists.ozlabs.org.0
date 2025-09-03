Return-Path: <linuxppc-dev+bounces-11658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A978B41C9A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 13:04:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH09w1yhvz2yrV;
	Wed,  3 Sep 2025 21:04:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756897476;
	cv=none; b=F62/oraumhKP+g8kexMGV08SEV3J7P10z06DlEUz6SuvgMOZG2OublUyDTDm8ZHHhHYke8hr9Nr6icz56E71Qqra6ntLnfn8Tyzk7/ZNzIaED7KQN6wVrablt3HKi+xnUWYuCu/ElU8wjR/zWVi7uK4sPXQEShz6STPa6AfBnsgFiACQwH8DVP75xVUQC8mr722y4WOCobuNIzQY+/xIx/ZllFUEHzwMiQAowIZZEIaSXP6QUB2JqklZzLKzkFA2HJOOwRxZjYONzBv7qxNpAE/y+8ldV3do9hH1YMUKdXArflAUzq/9B2l76PTI7jvGCjRxJ15pqSkHj6EkUu2SCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756897476; c=relaxed/relaxed;
	bh=f1O3Bu8zIjXMBP7ybKWRLHRE3Uf8XyblsScAg5IUYCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxA0NaZZX5oHUCC8ZIWzP6Bj5tbYPNvdvuWL24lUCnWmgHAp8qeD39+9vRjl5KJMaf2RCzBQKxS00+daSoYedGuKxB+n+N8fS8WQbCzz2KVQS7V59nkzhEXQh8k3Q8cljTx3jvUZaJykRFoDO+NUIOD4UDg9lZ3nr2GmoDsdA7B8hv6ClOJiI4eQMlGxoBLVRx2vKPVLHpKwMD2N7u8kjEVFPJFghWAi4abjM8eQDoVS68xLe87efRKMeaVod9a8AzDK2UzqOYlBJio4mgB+89FKAO/TdsYKrKjiES8ViABLe32liMm+u9eOHOciAVNUKTVYYOhcFgG+THD4hs91KQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=psxDQFNq; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=psxDQFNq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH09t65Ydz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 21:04:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC3B644C04
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 11:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792C2C116B1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756897472;
	bh=cR6pggU98t/+Ukijic5qu6ZCN/k9GzBjkSxa8gGSKqE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=psxDQFNqUA0AxnW1agDCBjM86eBgZ74JT2Cd1rJz0r6c6YIg9L5yDWVB/dyKfbNqY
	 7ZLsa748GOiB7mhjhAd7ZfA8Kf0yz16s0PmWze8zgCN+oiV63DSrvCAm5l4CmHbQDL
	 oSTTmG5f6r+rVGC89dPywgVkBtO5/2saXzd0zWbC+lwxN43IbLc/N2JIFlZvmatvZL
	 wbA8HXmaSHcOjOr4RYxkDguj3NEv01VtIYQp0kZf52jVOP92S6DDJ4Ekq7SVZovP5I
	 yLR8QJOzVUwT5t4hf2flXG4hKNUFCxAwpJ3IHOkAiFFWl4mOkwRLbpmr6WQ2TSehUN
	 mmSq/SUEn6fUA==
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-74381e2079fso5220583a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 04:04:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcAe5u+hwNoUIj/LvtMBg3+u7f5F6tKnggEeA7Y4LkC+qkaQmMXuJrr4l8575xIRBwWXUzt7+uk10zuKs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyG/BNuJXYRs78wetgiDida55h/ExQeAkEKxzmoekhSAkPcnKaU
	c+Jx9iiQKEKnB/+HTvlIt0cgOSy0sjWuuCr3/FCseXVI5G9urzDlEyHRv2kHCYEDHZ1jGQOkkly
	wiFfuwvhdh93yCo9HqL6/balP3c5A9YU=
X-Google-Smtp-Source: AGHT+IGt8cths8yMLXGw+ylAbBkNMXTKhbmkwbSixaLVjPRLTHE/ydd0R+Ek9LJwycoLKhw9INB3N/62z1RFfHnhrtQ=
X-Received: by 2002:a05:6830:6d0e:b0:731:cac7:3636 with SMTP id
 46e09a7af769-74569d7940cmr8468523a34.6.1756897471467; Wed, 03 Sep 2025
 04:04:31 -0700 (PDT)
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
 <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn> <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
 <40706b1f-e23c-417b-b3e1-2dc839828588@kylinos.cn>
In-Reply-To: <40706b1f-e23c-417b-b3e1-2dc839828588@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 13:04:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g=riWtqaB=pGcxormmnaeFyRaeG1LZyEDBzpUGrH4kEA@mail.gmail.com>
X-Gm-Features: Ac12FXznI_bHraDGh_P16Ypv18F94Duvp6HYWc01eg81rI5FCsWpKSsYAvb2qr0
Message-ID: <CAJZ5v0g=riWtqaB=pGcxormmnaeFyRaeG1LZyEDBzpUGrH4kEA@mail.gmail.com>
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

On Wed, Sep 3, 2025 at 2:51=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.cn=
> wrote:
>
>
> =E5=9C=A8 2025/9/2 19:47, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Tue, Sep 2, 2025 at 12:33=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
> >>
> >> =E5=9C=A8 2025/9/1 23:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> >>> On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kyl=
inos.cn> wrote:
> >>>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >>>> annotation for policy references. This reduces the risk of reference
> >>>> counting mistakes and aligns the code with the latest kernel style.
> >>>>
> >>>> No functional change intended.
> >>>>
> >>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >>>> ---
> >>>>    drivers/cpufreq/intel_pstate.c | 8 +++-----
> >>>>    1 file changed, 3 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_=
pstate.c
> >>>> index f366d35c5840..4abc1ef2d2b0 100644
> >>>> --- a/drivers/cpufreq/intel_pstate.c
> >>>> +++ b/drivers/cpufreq/intel_pstate.c
> >>>> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(str=
uct cpufreq_policy *policy,
> >>>>
> >>>>    static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
> >>>>    {
> >>>> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> >>>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D=
 cpufreq_cpu_get(cpudata->cpu);
> >>>>
> >>>> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
> >>>>           if (!policy)
> >>>>                   return false;
> >>> The structure of the code is intentional here and there's no reason t=
o
> >>> change it.
> >>
> >> Got it. Thanks for clarifying.
> >>
> >> So for this case the current structure is intentional -
> > Note that I'm talking about this particular change only.  The other
> > change in the $subject patch is fine.
> >
> >> should I also avoid similar changes in other drivers?
> > That depends on who maintains them, which is why I wanted you to split
> > the patch into smaller changes in the first place.
> >
> > My personal view is that code formatting changes, which effectively is
> > what this particular one is, are pointless unless they make the code
> > much easier to follow.
>
>
> UnderStood, Thanks!

Although I think that it would be cleaner to move the code executed in
each step of the for_each_possible_cpu() loop to a separate function.

