Return-Path: <linuxppc-dev+bounces-11807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B95B4619B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 20:01:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJPKn6HDLz3dLN;
	Sat,  6 Sep 2025 04:01:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f9:3051:3f93::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757095277;
	cv=none; b=jarWeH/C+WuoAS+F3a2Qy1r9bnwmVSSsrWKt+ZFYHQaaUFxXkpFkTeJ3GtzkRUnshp81raFZQVVclXc/VlP3Jp2mCXl1+hIv8mdGYLlzyhSetl1Il8sE9X5jS9sWf2dDG5wi3W5FMckiutr0f1ixzXNR6hunGMv50ofzdAF3wCuxOZRpNk2lttFHGWpmxP4lsUjro+M47o4YSCCturqDNWNfBRwAo35S1xgQ2jDhkyI9cfFs+L1FN2NQmbSCiUQBkhvo8+jEzeQgLfoZtXTJCp6EPb3oPlF0mgig+2EyJx7t43c4n4sQHKpUNP7trjLncXJdcX+/wQAh0ZKsG32X3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757095277; c=relaxed/relaxed;
	bh=nvYUl9QmXcZhGV7LDMivTR1R7SodOASqEywSNEZXCFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvK8C/Jx2uptm4RFeX+lv7oSILKCQGrRhyXdGRFCEgGj6X6GNnkJOGYzEfRtLTnIhJf2bAyM5eL1b7gOSPueEtGUa+ppODyLa+5ymXSAPnQW6WodGR7J8rHHqPtElXK+yO/UOBXfeod+LFaT4IcHTg9Tl7NVbicUvcRCBI9z3hxVpU8LF42W6wMCdjaboSsPBiZ028NjL1CuqCihk5zhtR2E3EujwoJ7dH95Mhd0KU+O1KW5ZTLW1eGwU0hEo2okwhszVA+C42hQcazKF9UaVPmt9bKF6f41+I1Na5+5yuERNYCsCH7TgbvnURqqFxNZZYnhC0OlgiFoK0RVKCfRnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=MeAap+sk; dkim-atps=neutral; spf=pass (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=MeAap+sk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 639 seconds by postgrey-1.37 at boromir; Sat, 06 Sep 2025 04:01:12 AEST
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJPKh0wT8z3dKy
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 04:01:12 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 34ABD40E016D;
	Fri,  5 Sep 2025 17:50:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5uOUeExJDHzu; Fri,  5 Sep 2025 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1757094622; bh=nvYUl9QmXcZhGV7LDMivTR1R7SodOASqEywSNEZXCFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MeAap+sk+VdwfyCrswiOc5REIH3s9U7SaP0ra9piDtNpViHKJrjiiXC+OYwbEnjcT
	 vwbogjD2xQul6ZxKUnv7+8p/uvByda2LQ9ycJvqg+iaTvEDQdy9sJBj06686iAO05u
	 LYk91Odqh2reQIDbVXE62GJ/SEHiShROwNqiWov8ZplEJ8dGU2H1o2LOqjuJUFPYnH
	 Hl+/PMD8BvMWnnq9L74fYprFl1mAEdcKlMLwU1XuOaLLcme2lQlb8wB1EKeF1Wkr4w
	 LPM1FpPt6mnOkHIE9/9ieU3LBDgDcugFeP301vE3tSOReDbOxcanvOnV9REpx/V79V
	 kfDbtKEyGS+YKgf0/TkIDFi8HgFuTi+wPxplFJsKSbpkO+19/x25dNs7Yx2ChXhYA9
	 nPABWcUYMaDxUwaTEk4fUX6JFbTPtsJX7TaU/qqXqIhLRLk9YuaagdbqQjdSVL1ZPz
	 bVURNzkLucbI0Ny6oLRtekjNLnYlGwfAjPpE9J1xw8qkQ6Ea7DOkkTa1/3ISF7wWw4
	 8G4tfgbnQEIkhkmQlAQseuKbvB3XWcCxvk0N/X8c1Ep28yuffQIMOl3KMycFMzcT1s
	 76pK91UNExnVDSeaQTE2egOD0fCWDWZkFiJ4UCsr4k78nblHLZu4xXeaf2cCLYd3/h
	 Ka+nU1Z9wTcsmovkAE+m7C4c=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id EFA6B40E00DE;
	Fri,  5 Sep 2025 17:49:34 +0000 (UTC)
Date: Fri, 5 Sep 2025 19:49:28 +0200
From: Borislav Petkov <bp@alien8.de>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] cpufreq: use __free() for all cpufreq_cpu_get()
 references
Message-ID: <20250905174928.GFaLsiqKV36JDowX94@fat_crate.local>
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 05, 2025 at 09:24:07PM +0800, Zihuan Zhang wrote:
> This patchset converts all remaining cpufreq users to rely on the
> __free(put_cpufreq_policy) annotation for policy references, instead of
> calling cpufreq_cpu_put() manually.

Sep 01 Zihuan Zhang ( :8.6K|) [PATCH v3 00/12] cpufreq: use __free() for all cpufreq_cpu_get() references
Sep 03 Zihuan Zhang ( :  65|) [PATCH v4 00/10] cpufreq: use __free() for all cpufreq_cpu_get() references
Sep 05 Zihuan Zhang ( :8.3K|) [PATCH v5 0/6] cpufreq: use __free() for all cpufreq_cpu_get() references

Please stop the spamming. While waiting, go read how this kernel process thing
works:

From: Documentation/process/submitting-patches.rst

Don't get discouraged - or impatient
------------------------------------

After you have submitted your change, be patient and wait.  Reviewers are
busy people and may not get to your patch right away.

Once upon a time, patches used to disappear into the void without comment,
but the development process works more smoothly than that now.  You should
receive comments within a week or so; if that does not happen, make sure
that you have sent your patches to the right place.  Wait for a minimum of
one week before resubmitting or pinging reviewers - possibly longer during
busy times like merge windows.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

