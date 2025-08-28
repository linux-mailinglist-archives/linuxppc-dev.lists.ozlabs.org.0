Return-Path: <linuxppc-dev+bounces-11415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E985FB3987E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 11:40:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCGbR3Jp8z2xnk;
	Thu, 28 Aug 2025 19:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756374019;
	cv=none; b=LKKokrq/HULkDn41218a1lprBFfObbBKnQ5SB7qeMzuEt3t+21aq9y3TFtJS97j0dUdPtrLSkVaLvVatoRrHIQraFdrkIeQXOi2L9VTr3O81iqrWNp59aamRkt5FFs9CG0rHtcDyphOSH3ZcOeDPfMd5lT5sjOMM6RzF77aYnUvRhBTB+iEd6bNccsjzGFHoLWV1BPY9zRwENOsuN+6w6s9BsHfnj6m2hkqk2h3sIGxOfm5rz/1OFYWY/89Wweq6aFqkvV7ozZ8IQ2Pbwf/NwsRbe1QB7WWljKhE3nL2EUoDr2T41wUhBdap9Y7gZpa+QNrO5FvlMmLLsZoAsebnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756374019; c=relaxed/relaxed;
	bh=N2ciFegHeRS5n9y4dPr0MbH+YHshSMSzSLg7dsYhGNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0K/uYJfqoOS829YDjeOA9BGqSDEYIWz/UEGyWpDWL9lcRJbhz+gc38igNFtrHMctnp16wiYqQNoKCuGuJzpx7h6edCWFLXCeX1eNKmY+LqvIyiLWmejI2IzZv5c3h3iJmOU5pweBuEPUY5wNck0hry25F9HjELUeiPAWJiY3U1P6dydtjdVE8ZEt92KC4IS5ClBvgAPZx1K9R3Q1kv8zJqNx0n2wqdK9IpBlx39sudULbNj6Dd42o0VKhRAQ3sZ/e2Zywu2x/UnUM/MO6l8BkZm/WNei/oxhGYFhfhpIeBr/KlYoHHLNbAMskY1fkAwlWwg6/hMa7EA66G+UfBNMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JJ89yqsM; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JJ89yqsM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCGbQ36zSz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 19:40:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BA3F44F2B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 09:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2803C4CEF8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756374016;
	bh=Cl0m1kDKpWeagimjoCyJC2nNVcFJOKHXK8N9AWWvIRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JJ89yqsM/siAb1VR6ZJU3bEFaUkNGoy0qdWneQKwaNTbKw9v5mNgvGxJA28E63mh8
	 Upq25haYXC1EwPZL5mZ2pA6J2O7jYs80WZygAwabYpOC504atc6SOmn/XDviZLtv/u
	 Dkhv5fJWuapG9S8NjjHS5krDPTFQktzMc6uGIyrrf1CtjntEwSY+BeVohNBKzjYck9
	 vc8aBvirQTUlJJbQyNuCJvdcB69O+ndDUle/uzIu+YrtfNIQ654vov6hDZekcrOcRL
	 5uf6Pz1m20Ccro9eZRk6B2A29o17/4zQC0wXfU4vOxKUBk+cvk6B8LwZnfbzjU2bLw
	 ryOgMyPpw3vEg==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-30cceb3be82so715370fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 02:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmqOoOmAiotwok4/Y2cJmFGj4AXJs6cnuAdaIs5WVdyAPBtpYHwyYhm4D0XhZrTCGkgZ5KMSZleF1Dl0U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNUV9y/XCiI+OB6o26eT3RSwi253LUW0uafrvJ5zVV/eOPP42D
	AlTN0E+cVmdbzb8qUmSFEdDZFt4sai/Rdvo40O6HNR2faN88Vw8nF1OdrcDXGJm4VaRJdZTfAOC
	lHlw0np+fyh+9ZOan5SWR7P6A6fJu0bU=
X-Google-Smtp-Source: AGHT+IGV4ScW5OAU3iglUFz6GOl/SaxSbnlEKhbCLP2wFA8xAwCena16hSLRSa/lAp17g1juuguW4VQdAzFwj9/LUxc=
X-Received: by 2002:a05:6870:9710:b0:310:b613:5fdb with SMTP id
 586e51a60fabf-314dcb575e6mr9287838fac.7.1756374014938; Thu, 28 Aug 2025
 02:40:14 -0700 (PDT)
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
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn> <20250827023202.10310-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250827023202.10310-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Aug 2025 11:40:03 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jA7HjNc6VQWdjuwLnmd751kV01NXC4v8Pyn8h-r70BzQ@mail.gmail.com>
X-Gm-Features: Ac12FXyk8AzMIpXHgrT8Z1UHGDrWUNjtTLP9mZxojpyASBCiNu69qRn54WdH-2Y
Message-ID: <CAJZ5v0jA7HjNc6VQWdjuwLnmd751kV01NXC4v8Pyn8h-r70BzQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] ACPI: processor: thermal: Use
 __free(put_cpufreq_policy) for policy reference
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Markus Mayer <mmayer@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 27, 2025 at 4:33=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/acpi/processor_thermal.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..f99ed0812934 100644
> --- a/drivers/acpi/processor_thermal.c
> +++ b/drivers/acpi/processor_thermal.c
> @@ -64,17 +64,13 @@ static int phys_package_first_cpu(int cpu)
>
>  static int cpu_has_cpufreq(unsigned int cpu)
>  {
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy);
>
>         if (!acpi_processor_cpufreq_init)
>                 return 0;
>
>         policy =3D cpufreq_cpu_get(cpu);
> -       if (policy) {
> -               cpufreq_cpu_put(policy);
> -               return 1;
> -       }
> -       return 0;
> +       return !!policy;

If you want to make this change, please also change the return type of
the function to bool.

>  }
>
>  static int cpufreq_get_max_state(unsigned int cpu)
> @@ -95,7 +91,7 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy);

This isn't correct AFAICS at least formally because the scope of the
variable is the whole function, so it won't get out of scope at the
point where you want cpufreq_cpu_put() to be called.

The policy variable should be defined in the block following the "for"
loop (and actually all of the local variables except for "i" can be
defined there).

Or better still, please move that block to a separate function
containing all of the requisite local variable definitions and call
that function for each online CPU.

>         struct acpi_processor *pr;
>         unsigned long max_freq;
>         int i, ret;
> @@ -127,8 +123,6 @@ static int cpufreq_set_cur_state(unsigned int cpu, in=
t state)
>                 max_freq =3D (policy->cpuinfo.max_freq *
>                             (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
>
> -               cpufreq_cpu_put(policy);
> -
>                 ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
>                 if (ret < 0) {
>                         pr_warn("Failed to update thermal freq constraint=
: CPU%d (%d)\n",
> --

