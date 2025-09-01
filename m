Return-Path: <linuxppc-dev+bounces-11586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA5B3E956
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 17:17:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFstT29Vyz2ywh;
	Tue,  2 Sep 2025 01:17:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756739841;
	cv=none; b=howD+Z73yh32poaEl/GGDBzZMW8K/x2w9py723FcjtjyehMbKXlFvioC/4i8R3r3DFpn9ue6dKh0JNZgNp/6kFSyaKYeKQMCRLvQbvJj6uXCJRdqIB8qP8ovI4bFIBgjbudEtXYrhvAOo90t/dQxgoHx7B2kdy6Rbcpg5B6xNABRvXPHKyECbSczXCF3QOJzZ2jfFY3vJDV5Td+u9XgSDdN8Ta4gcK1by5Of4uGW5vI0HMzYTEdNC7UbD8fUAmMzn8AGEmXa0irVXrb87n8pFGogpur/AP53DxdLegEnT0F9+ThWBNhkDfKMTpfTnzLTbiR9N6l/DmVxW1T3JXILyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756739841; c=relaxed/relaxed;
	bh=6TImWhcAqndssQTrfnkjNKmhvD9vElOxFN8zK455Rmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeO4+L84eAxhZyzh0HQ4xW8AweGEbSz21Hc/BWK8gF1wK7uiTkFTkO6JOUeb7vUhIL+1a+2N0yctV/Rul6mkJlN2zx8tnCWzjWIChAS+KytRt5wtjVg5nCT4wEekg/NF9ezuGBpgcZSJtV/n4YLHYGPCaNudpKjKIpZ7oMpONOCHkUEQvU5NR+Rv7R7ELCOklPL9DZVmggkke5hEOP1hSowqeD7Iz2bsDm86Rpg3Ct/SH7ewUphX6dyMnwNTXWT5TIR+TKb/327Ysid6PplNZJWJFJl0/dcd1lOHLV0EwKG+CpwHF9zPfTIZJ6A3loEcN1NcIgZY8WgK6SRoVIOyQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fHSscyxU; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fHSscyxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFstS3rCPz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 01:17:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFC09601DE
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 15:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3888C4CEF0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756739837;
	bh=5weQGGRb22PrjCyP/g4zxlVoFtpKwJSJ+1zX1sG+Ceo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fHSscyxUBqa2PrUEAJYH4gjbe394x6UINLLLJtU3No/ch07okasdYpPcLQVZ4fQdz
	 QQVpadnQL9+K/Bpr7PRPb1lji/ueyUJo0Nz3wjlJnIDs6gj2K0bIoBRm5dUqa4DnzM
	 DY2h8b80jorHneNn39SEcsZRb6GHqyX/EXJ0F/BwtNCV5dmP3SHyX9yn+TVbM49IPg
	 gJX0lOPTuzPnXXKhNhXoblUzf/66Yb6hsnXIc36xlN9G/S8hlUTrrtuZhlzHc+/YLr
	 6Fj48VcKspQFdxqqBYoze3u/d/wGFeYtGEBYBk9/cEEhhvcPXXMosbjDG8tSDIKFer
	 oYp4KruBpNFcA==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-315bb486e6dso2248896fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Sep 2025 08:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfZlP6E6Br14qkw9Fg0I4Cw1C6gVKRfJVrCiylPuqzYLkPgAwMMStORFjzbQURoCZmZTjvX2tt/Zd4He8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxaSEoReip7Dl7yr9eYUSZutAkcL+lVpTrsrMwrtMmTGiTtpeuA
	V7Hk75kmOuxXokVbP13tmKuK8kgtJdoWS4ItNqB0w+LsMvMs7s7+/f7AgT2q2ZBX0LGAWtwDWj8
	HXklj9he7QEQcRUYFMMg0XBou+pela+I=
X-Google-Smtp-Source: AGHT+IEqozTSDrtoR1W72zJmy9Z1LH1mlLFPdwzpw5V1Yv8IGBwtb8EBAZercDEFewoqAI3YKrAtdKI2Ii3KK+l5mg4=
X-Received: by 2002:a05:6870:9b09:b0:30b:b123:b6c9 with SMTP id
 586e51a60fabf-319630e13fbmr3523480fac.12.1756739836982; Mon, 01 Sep 2025
 08:17:16 -0700 (PDT)
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
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn> <20250901085748.36795-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250901085748.36795-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 1 Sep 2025 17:17:05 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
X-Gm-Features: Ac12FXy28aQLAZnDRwhZh3hbZ0aFKhCyHW17tDgFwo0nHMN5cP-adgYEeM5GYyY
Message-ID: <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] cpufreq: intel_pstate: Use scope-based cleanup helper
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

On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
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
>  drivers/cpufreq/intel_pstate.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..4abc1ef2d2b0 100644
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

The structure of the code is intentional here and there's no reason to
change it.

