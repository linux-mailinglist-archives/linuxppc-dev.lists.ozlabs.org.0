Return-Path: <linuxppc-dev+bounces-11463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F6B3B354
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 08:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCpFM0VP4z2xcD;
	Fri, 29 Aug 2025 16:26:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756448791;
	cv=none; b=bF45iutK5OauVdT7mclHHn9NRgm+AZlksG4nL/DWucTdDgfsFQkwDDPZxz0yorky+PvjEzcKRDUS5OQaXuSSon8S228+4i+uoGlQXjY1qbIUL9fqwWw9SGkbR4+h2R2N/GzfcKt0G8ENWPFjCTYLWkE12Rgwld0ThgaTlsIoqFUhz2QrVgL/qUcq8ul9lW5ix+hSz7s5v29N5ykLRO06rK/lJhLtVaTCh+njIHMLVGlQW2pAxnlmrxSNzlwcRZnf9n8CsJMDot0wsjfQ+p6mZqNNbB5AUVdTehYtu5gRP4YCO80dBYc6JupHpkhMW3rr9cQ624DfzolWyuoax+tp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756448791; c=relaxed/relaxed;
	bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgdfDAjp/XhVxIoQlt/LiC8XvqscW9BDlO9/XXzEnAjmLGcRB/UzTRLbGvmLF0fumKDEugwlE7sRmn/KWMTCtF00NXW2Hrb+5GFL1+RQAQlke+Y2dFOZpCAuzHJ1FVmWPXzaphi+oDCuQ0L1hMDKYaQ+hQmXcLqFmkS+p8OOLwiXpQi96EaprJY1MNOcdFJ09aF0m1xOrv1ufJoYBg+9ySTGICvQ5sf4xbl9meiwqFuy4++UV4PQz7EYdObIL5k4eyKnWRnDf/D5qNuUcfZB2O0lJymnOKpB9+iLEylxahQAikZqAnV4uJ1hUuJ2HekdUpkc1DgP7DLnvM1JPG2AaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n7LAbYsI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n7LAbYsI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCpFL1rTlz2xWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 16:26:29 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-327b3e24637so986455a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448787; x=1757053587; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
        b=n7LAbYsIz6QgTDGn38hQg/1IyiSzN25VkkFOGhvasiVcAelTCiq1JzDV/TQSoq9GtL
         avJoupYLkT+/FUY7fAp5qmRwTet4OG/Bc7s1jeDMWD9l9NWXcm2isHZssYEWZFjRXprT
         duKuHxhfMyc6wy1JTTpa6DM1sAweJSVOcm3FWVTIHDuUDu529OYYhkk7KnBy+g37mfs3
         jiwNesRfPwZqNM9/nAScNUxPVcg5RNRVtkB96mNiz+2Yg2yCGq84kAUzfpqkEvUk46J9
         BA/boEeD9xzm7LY1reFx9tmVihzDPaXmzwpvo0cDnu0cKYNMPV651o/wHMv0mPrpVhP4
         Xu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448787; x=1757053587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
        b=oBbfXW/FFtN+FGUjD8UWMhQZl/XKG7MVm0NPAhb91KwPHdWOST3tHUBDTCYfcvBFJQ
         +iO3kB3+qsRHcWcVax3K2xHpDWNd4X2Pt7xTjJiyoRsrS1KOLahPzoJ9A7mMeg1CErP6
         1XCcYyzFy97IsV8BpNwiCB66ZeGcqwOwH3wiD//9O55cLsprLvuXmgf88quP5wc465up
         Tg6oep2yMgvi2hw7AdbpsdfD0HYT5ZOXVKj8hhBh1VTBGoa+GNYK4ZOzFG6TYalFL48s
         jYrzhdR5M3NCFbffupt+F4pb+0ftVvHz5ZkQMYFuxvcTZrEbWhy+xiyy4xtTEsSP+uRO
         lzWw==
X-Forwarded-Encrypted: i=1; AJvYcCWZpf1sZbyD+iBr1YsxjVxnxidqiIkYkGxvyZU/CzRYYZQB3AuDDI4xNB7auu5NlwLQIEsKGHBEksxlu1k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysxA4QRNyH8ChO79dJfHmfMnqh5LYxjoLiApDCRuFnLNGpAG+W
	xG/2KEViOkCY63aViZz/oIjsSyUWgp+ALE/xXXuTFkmS1iN44a9THyhQ0BIRn6LpzRQ=
X-Gm-Gg: ASbGncuZqwnEuTSQALaBwrssvJgde+N3qDRLDsaTDtqtGLC3i2Ei8UmQ56l2rlJF2RH
	BlPCJ0CIVot1spL3Sfffr7KA2qNQUVvOFa7LNhUZHGHKZaRpKKqDUTAA6T1fNhd8OPD3PNNKjv8
	wnliBKyPYTrIyuS98FPf7gKFS0mnakXzaHfvmndmi+2CT9oQmyf3wF/+HD7GoCu6fQ2v0m6TSBs
	Bq2FjK7Yf1WgOyIAY7WgjKBv4MawQO400pHDIWpUM3acTSJBwtsro/R6VACuDaFGpX9IzxcO5bq
	a6bAchVluHSmQ7f7IN73NOHWZUBlNjit4Y9p5EYfaSF70RFtgupFZzEn37aM2DOsdU0/Jhdi9vy
	sznEF+9QjEHceEg1bIuLy67Dq
X-Google-Smtp-Source: AGHT+IFHYb22k9tJefksk8Ol8WzLcbkUpFNWBPL7w5JQ2Y92t38N6cXrTs0utCYM4huh3xQWCdkxbA==
X-Received: by 2002:a17:90b:57ce:b0:31f:210e:e34a with SMTP id 98e67ed59e1d1-32515eacfddmr32147827a91.8.1756448787009;
        Thu, 28 Aug 2025 23:26:27 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd4bd6sm6984417a91.15.2025.08.28.23.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:26:26 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:56:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829062624.jalqqsigs7hanf7i@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
 <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
 <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29-08-25, 14:16, Zihuan Zhang wrote:
> Thanks for applying the patch!
> 
> I’ve been thinking further — instead of using __free directly, maybe we
> could introduce a small macro wrapper around it to make the release scope
> more controllable and consistent.
> 
> Link:
> https://lore.kernel.org/all/6174bcc8-30f5-479b-bac6-f42eb1232b4d@kylinos.cn/
> 
> Do you think this would be a better approach, or should we just stick with
> the current use of __free?

Lets keep it simple for now and use __free directly. And keep this
similar with other parts of the kernel.

-- 
viresh

