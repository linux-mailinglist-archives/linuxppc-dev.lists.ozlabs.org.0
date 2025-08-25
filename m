Return-Path: <linuxppc-dev+bounces-11257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5900B342DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 16:13:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9XpH4jdcz3ck9;
	Tue, 26 Aug 2025 00:13:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756131223;
	cv=none; b=GjrGUPgbCkcyePoOhI87hfNdfoBipo6iNHJsG3BLSffWfm0UYZQvK7WoA3UWGWsS3RxPdZjlGUICCNhIaMKQeh6LSvTUVDi8/j0KiuD9cs959wY+PSIwu9wOfAG74Z0ykirTvPj7+W8Yza/7kSCgCX+n1ffvG1/6SaHBbuRbrXNV2U2Txn4uzhtexl0nGmX6xiAh0dQhvnpg8uGHMyMiZuj4EVe1SAY5o9VWGMTu+e3pvrkoidyqln4qpJoaTSoL7G7pHigxmI4dhbgeLB7GvRZSfVBNpOlNxURB2RtpbftRgyy1tXZkgoNHYDEKQsS4sIivKGDr272e0j+dq1/DsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756131223; c=relaxed/relaxed;
	bh=D+Wj4lspzxilYHnL2n/XBAI4pOdiOAnsXLwAw+4PFe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obBlJW8kqrjagOtIDtkIE7+qJRTnjsFWYAHYAWWUZujfXwGyr7jkTesOTuUZlKvDRmNsPIg0XxKPuKRjvmWxHLlndtXdQtO4rqLhcmqO4RjN5jbRJNEJ5Mk+h8w+jR965IauuO0YsA4jQxdWhuLkUpY6qgLP7THDWjWHkWA+9fdPzIwYDnDPlsjL80mB4U3CFJnSr4EfMIQgeZLtfRrCAQ9zx7LCpJd2g4H3+7i52Oww5ldS70zNT4BTTcFYVOTBV0hdrlYbOlvYJJrOajlfHXld3rFLgiNN2ji8NI22++s3fneNULqBs3jgEy3eFnhA0HeYeO8JB6Ad8NxHaDhwcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e4fvRADW; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e4fvRADW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9XpG4qqSz3cjm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 00:13:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F3C544D86
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 14:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C6AC4CEF4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131220;
	bh=3RLeKCKpDIk2eBgGx5sPwZfoBKyVmeEo49RWhYh8Kh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e4fvRADWc2SiGyvairwMKdDw1zm1wGOXThGQeER0f4MYqsGYBRhD4UrfH+q2kimaE
	 978Vxb2gnRrcxwK29zKxBr5sDuyaM7DyuM68nemBfDcJoWAJvdefCrMf4ky3tm3mTR
	 ZEf5XaC0Deu8RHdTatQRuIX1UHKAPHYmvItTm0G3jHrBoDa0LYl7qMs/ZPY2JpgApc
	 lQtDHIn1yKhsLsiU+tvHyxR+ZutYlrHGoRZcd4IzOHtkeInzrDGgR65atrSWLdNsYt
	 TaeLwZDvBl70cfWDcKc3Px3Inhk2GTRE0IlvBDIzWF32uT29HeibPtjI2oz6UM54HE
	 cW6lqbzTmXm7Q==
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-74526ca79c2so206298a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 07:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8kttbpMXjCW66Q/gaj1jW3p8m4k1ApDUxxhMnu20YFfrGOpqtpXkRLDiTkS71ZqLy4em5JeN1XgGRGvE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxj9pkc1pJsDcvkwmHGqf/IY2l6WDn9uxdYm/FK38YUaUYDzfwY
	D3TccyS5xnfh6ORFVwRsBcttF9Os81nnnU6DLix8SLync6x8SC17tlqXx8y6HEuXrHMgc7dxRLE
	gz5YcpDZ0fKta8R9GM7cwAzFklhNi6A0=
X-Google-Smtp-Source: AGHT+IGEnV+1YshDCmjAscdFjkSNQru4o/XG/DWYuObgbMiwP57k9JdqOZlPe3YdSW0fnLXsvsMiCF3QToEZVDUm+Q8=
X-Received: by 2002:a05:6830:d18:b0:742:fd7f:e105 with SMTP id
 46e09a7af769-74500aafdb9mr6734918a34.19.1756131219164; Mon, 25 Aug 2025
 07:13:39 -0700 (PDT)
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
References: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
In-Reply-To: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 25 Aug 2025 16:13:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
X-Gm-Features: Ac12FXwCyvYKc8Ipwt4NeaLRZNsWY9t1kMBiUFhDRbkfLg-XPnoGM5Pxq1PIQzg
Message-ID: <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
Subject: Re: [PATCH v1] cpufreq: use __free() for all cpufreq_cpu_get() references
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 25, 2025 at 11:29=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.=
cn> wrote:
>
> This patch replaces all remaining uses of cpufreq_cpu_get() with
> the __free(cpufreq_cpu_put) annotation.
>
> Motivation:
> - Ensures automatic cleanup of policy references when they go out of scop=
e,
>   reducing the risk of forgetting to call cpufreq_cpu_put() on early retu=
rn
>   or error paths.
> - Brings the code in line with the latest kernel coding style and best
>   practices for managing reference-counted objects.
> - No functional changes are introduced; behavior remains the same,
>   but reference counting is now safer and easier to maintain.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  arch/arm64/kernel/topology.c                  |  9 +++----
>  arch/x86/kvm/x86.c                            | 10 ++++----
>  drivers/acpi/processor_thermal.c              | 13 ++++------
>  drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
>  drivers/cpufreq/cppc_cpufreq.c                |  4 +---
>  drivers/cpufreq/intel_pstate.c                |  3 +--
>  drivers/cpufreq/longhaul.c                    |  3 +--
>  drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
>  drivers/cpufreq/powernv-cpufreq.c             |  6 ++---
>  drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
>  drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
>  drivers/devfreq/governor_passive.c            | 19 ++++-----------
>  drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
>  drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
>  drivers/powercap/dtpm_cpu.c                   | 24 ++++++-------------
>  drivers/thermal/imx_thermal.c                 |  7 ++----
>  .../ti-soc-thermal/ti-thermal-common.c        |  5 +---
>  kernel/power/energy_model.c                   |  7 ++----
>  18 files changed, 40 insertions(+), 93 deletions(-)

This changes different pieces of code maintained by different people
and the changes are not interdependent AFAICS, so better send it as a
series of separate patches.

Thanks!

