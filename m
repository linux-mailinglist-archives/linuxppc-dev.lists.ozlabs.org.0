Return-Path: <linuxppc-dev+bounces-5531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D3CA1AA74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 20:41:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfBBx0qHdz30HP;
	Fri, 24 Jan 2025 06:41:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737661273;
	cv=none; b=We2b0dNCKoaSfjOn/GXyeE7+4eb3QiVWHA7D/fp4wGGBweVJL7efttEIFOsDkWHZFOxLba4XDVTJLPFSzM2kUjauYyN48W8ZK0WmwmyhCHCjxXQ3POPofaKzgEZP97uSdCX4SEVnQ1ZFRl9ZfeBPq1lcq0as+4p0LSUYUaUjt/wKpqqQIhPw/iei+LM+JdeRrteHIDOYk8WIbFYoeQlVbVkqEusztlTm2P0QbVrgXs4WjJtFmvz/vBOHXCWpAfJedoKXvqvkvza+sK3zHL/vk45rEUWq1Q+zRVC9i1d29JlLgGwcFus8nkp/UiIU1VtAutn76XPfaW/zo1xeFNpPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737661273; c=relaxed/relaxed;
	bh=EIZXj0NQXlFQEJN+NUiNBmBZ8xZyeEtXhJlqzjffnhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCxSU9qnhuHG1F4sXuOJoXLahiFmMqB07NrKMhKd1g2C1egLXeLxLRbYEj8QT599dxkF5Yqdir1cxdkuqK/bpBPWwh4NVhtgvYgsmW1SIC+MDpkY/FttzdnWquG8dBXFhieEQ3/ggG06F1OrHy4IE1eoNhycdf9DmOoAjg1bsoSCWT/AbWHpSSfMwsBwyClZD6dIZU9NxxJbYfAMasJ1en65flgsk4SJClmN5GzXHqoZWzGjTWlP+uf5WGYGvcF70QIHltA3G1PG1YbOLqZbuQ+Qahw0xSLnIlGy5XRuNFnkQiplLfRG4O4svRmpVBjXpuec93maz8SUL5HcVw5DiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GE9Gsa7i; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GE9Gsa7i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfBBw0m20z30Gy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 06:41:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DB105C5B5A
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 19:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43914C4CEEF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737661268;
	bh=FzgMlZoMTVJxW0DtNfnaS6A9Ohe9wUCQbfRzCAOE11Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GE9Gsa7iiU444KpkYxrogoBdZowGSjkyO0k7laPoPcoq6g3XxCe0poALteq4R4Zph
	 tZ3ytakM0acv90IqA3t/Tq+HIhgvttRHrxIMc4+ftcYx59CQekJex95lkIBya9MuSj
	 e8hgK78Mvi+bBQYrsrlD41mZ7vaA3+PkczkIp5mOMTvpFuEkiNLQOfTC7I53w3Jpp9
	 jdf7sxICX3pGKHys55ON+N8sg3msEwZ1hAbYoGP7MqRskWyhGBaMTolzt8pF6nm7po
	 ccEaxXFbs1MchzhtSnnv0PMPk6yc1GTQLhaCumG8Mkicq84A+N5GxqwlpPfo2bFwbT
	 FHvlAO5Y9gebg==
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3eba559611aso380844b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 11:41:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeNM8FylhHvFGk47BoZB7Q3EjMman7l7pnR2hdTYvy9mY6ynp5BqddJ4NujTngkUzTDMaj5Hu+MNxVGyI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwB8MeqLtZjOLkfTgUUqpSxuXZf1KgNeu5dfllh31utL0z1j5Aj
	WAOwGsZ6PzZRTCcAUAtF5YjkSbtj3BdK53IDFfos/Xgtbp48eOjfcUfQNJ8JECuBZ0nknEZknWB
	g5tQakHqa2mvIpifkLZlAjmTRxlE=
X-Google-Smtp-Source: AGHT+IFEZLpokzQrSZWtE1aUlhzheSpv16W1XbXdM7wOE5P8c+MPFR4VPEp6oVT06Ebj/5DfcgalM7sIG87OhMAknWU=
X-Received: by 2002:a05:6808:309c:b0:3ea:519e:cc71 with SMTP id
 5614622812f47-3f19fd7beb4mr15987065b6e.39.1737661267410; Thu, 23 Jan 2025
 11:41:07 -0800 (PST)
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
MIME-Version: 1.0
References: <cover.1737631669.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 23 Jan 2025 20:40:56 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gQDxb0-a5HiEa0vyWCGz01esQBy1fJ4vNXDZJ=GW1W+Q@mail.gmail.com>
X-Gm-Features: AWEUYZmJBrMCqL-riW-i0DlJyFI1cRh2mxShaIBztS2B8ipvq-I9aavy-zqQjVc
Message-ID: <CAJZ5v0gQDxb0-a5HiEa0vyWCGz01esQBy1fJ4vNXDZJ=GW1W+Q@mail.gmail.com>
Subject: Re: [PATCH 00/33] cpufreq: manage common sysfs attributes from core
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Hector Martin <marcan@marcan.st>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kevin Hilman <khilman@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Markus Mayer <mmayer@broadcom.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Sven Peter <sven@svenpeter.dev>, 
	Thierry Reding <thierry.reding@gmail.com>, WANG Xuerui <kernel@xen0n.name>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, arm-scmi@vger.kernel.org, 
	asahi@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 23, 2025 at 12:38=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> Hello,
>
> Most of the drivers add available and boost frequencies related attribute=
s. This
> patch series tries to avoid duplication and simplify driver's code by man=
aging
> these from core code.
>
> A quick search revealed that only the drivers that set the
> policy->freq_table field, enable these attributes. Which makes sense as
> well, since the show_available_freqs() helper works only if the
> freq_table is present.
>
> In order to simplify drivers, create the relevant sysfs files forcefully
> from cpufreq core.
>
> Pushed here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/core=
-attr

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

for the series.

Thanks!

> --
> Viresh
>
> Viresh Kumar (33):
>   cpufreq: Always create freq-table related sysfs file
>   cpufreq: dt: Stop setting cpufreq_driver->attr field
>   cpufreq: acpi: Stop setting common freq attributes
>   cpufreq: apple: Stop setting cpufreq_driver->attr field
>   cpufreq: bmips: Stop setting cpufreq_driver->attr field
>   cpufreq: brcmstb: Stop setting common freq attributes
>   cpufreq: davinci: Stop setting cpufreq_driver->attr field
>   cpufreq: e_powersaver: Stop setting cpufreq_driver->attr field
>   cpufreq: elanfreq: Stop setting cpufreq_driver->attr field
>   cpufreq: imx6q: Stop setting cpufreq_driver->attr field
>   cpufreq: kirkwood: Stop setting cpufreq_driver->attr field
>   cpufreq: longhaul: Stop setting cpufreq_driver->attr field
>   cpufreq: loongson: Stop setting cpufreq_driver->attr field
>   cpufreq: mediatek: Stop setting cpufreq_driver->attr field
>   cpufreq: omap: Stop setting cpufreq_driver->attr field
>   cpufreq: p4: Stop setting cpufreq_driver->attr field
>   cpufreq: pasemi: Stop setting cpufreq_driver->attr field
>   cpufreq: pmac: Stop setting cpufreq_driver->attr field
>   cpufreq: powernow: Stop setting cpufreq_driver->attr field
>   cpufreq: powernv: Stop setting common freq attributes
>   cpufreq: qcom: Stop setting cpufreq_driver->attr field
>   cpufreq: qoriq: Stop setting cpufreq_driver->attr field
>   cpufreq: sc520_freq: Stop setting cpufreq_driver->attr field
>   cpufreq: scmi: Stop setting cpufreq_driver->attr field
>   cpufreq: scpi: Stop setting cpufreq_driver->attr field
>   cpufreq: sh: Stop setting cpufreq_driver->attr field
>   cpufreq: spear: Stop setting cpufreq_driver->attr field
>   cpufreq: speedstep: Stop setting cpufreq_driver->attr field
>   cpufreq: tegra: Stop setting cpufreq_driver->attr field
>   cpufreq: vexpress: Stop setting cpufreq_driver->attr field
>   cpufreq: virtual: Stop setting cpufreq_driver->attr field
>   cpufreq: Remove cpufreq_generic_attrs
>   cpufreq: Stop checking for duplicate available/boost freq attributes
>
>  drivers/cpufreq/acpi-cpufreq.c         |  1 -
>  drivers/cpufreq/apple-soc-cpufreq.c    |  8 --------
>  drivers/cpufreq/bmips-cpufreq.c        |  1 -
>  drivers/cpufreq/brcmstb-avs-cpufreq.c  |  1 -
>  drivers/cpufreq/cpufreq-dt.c           |  8 --------
>  drivers/cpufreq/cpufreq.c              | 15 +++++++++++++++
>  drivers/cpufreq/davinci-cpufreq.c      |  1 -
>  drivers/cpufreq/e_powersaver.c         |  1 -
>  drivers/cpufreq/elanfreq.c             |  1 -
>  drivers/cpufreq/freq_table.c           |  8 --------
>  drivers/cpufreq/imx6q-cpufreq.c        |  1 -
>  drivers/cpufreq/kirkwood-cpufreq.c     |  1 -
>  drivers/cpufreq/longhaul.c             |  1 -
>  drivers/cpufreq/loongson2_cpufreq.c    |  1 -
>  drivers/cpufreq/loongson3_cpufreq.c    |  1 -
>  drivers/cpufreq/mediatek-cpufreq-hw.c  |  1 -
>  drivers/cpufreq/mediatek-cpufreq.c     |  1 -
>  drivers/cpufreq/omap-cpufreq.c         |  1 -
>  drivers/cpufreq/p4-clockmod.c          |  1 -
>  drivers/cpufreq/pasemi-cpufreq.c       |  1 -
>  drivers/cpufreq/pmac32-cpufreq.c       |  1 -
>  drivers/cpufreq/pmac64-cpufreq.c       |  1 -
>  drivers/cpufreq/powernow-k6.c          |  1 -
>  drivers/cpufreq/powernow-k7.c          |  1 -
>  drivers/cpufreq/powernow-k8.c          |  1 -
>  drivers/cpufreq/powernv-cpufreq.c      |  2 --
>  drivers/cpufreq/qcom-cpufreq-hw.c      |  7 -------
>  drivers/cpufreq/qoriq-cpufreq.c        |  1 -
>  drivers/cpufreq/sc520_freq.c           |  1 -
>  drivers/cpufreq/scmi-cpufreq.c         |  8 --------
>  drivers/cpufreq/scpi-cpufreq.c         |  1 -
>  drivers/cpufreq/sh-cpufreq.c           |  1 -
>  drivers/cpufreq/spear-cpufreq.c        |  1 -
>  drivers/cpufreq/speedstep-centrino.c   |  1 -
>  drivers/cpufreq/speedstep-ich.c        |  1 -
>  drivers/cpufreq/speedstep-smi.c        |  1 -
>  drivers/cpufreq/tegra186-cpufreq.c     |  1 -
>  drivers/cpufreq/tegra194-cpufreq.c     |  1 -
>  drivers/cpufreq/vexpress-spc-cpufreq.c |  1 -
>  drivers/cpufreq/virtual-cpufreq.c      |  1 -
>  include/linux/cpufreq.h                |  1 -
>  41 files changed, 15 insertions(+), 75 deletions(-)
>
> --
> 2.31.1.272.g89b43f80a514
>

