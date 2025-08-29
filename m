Return-Path: <linuxppc-dev+bounces-11462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D0B3B333
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 08:18:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCp3v2VMnz2xnM;
	Fri, 29 Aug 2025 16:18:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756448299;
	cv=none; b=i/iDqdbtDV3dyYK1b8uR2LDVV5N4yLrliL8brewfgAU9RDaH97Wztylnet5j3FjJAOWMxeA+JaPsiokEuNJ/pwbFUD+plGK8HPrRRUKwxT++EtAJ1xSkR9zzR56lP/UMsZ+9A9KgezOlwFXjp+GnTMgNs2g0Ky1NodSG8kTjREMMum8zkbZWsrc1HvAY8kts7pqXllDEycT4ocYvGz553yQmYifNzFqbrJGv/q9G6mn9aly72qtfJof4FMJQmMPepQmlkVwmCqf2NVuEEvc/cvIayXcorJrJR6ktYKgKhjvUbZdQzxTOlq12WVsWZAFxy4ONJhg7aLkan4qqB940RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756448299; c=relaxed/relaxed;
	bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVJTaty7DPwoE0lLJTdlEU3NR+rTnDYdyBQP4MQOTdKNF4iC5fLMZBfqT7bEMnZQfqW7Sk/XMevG89oRSbcpy3q5sOsilmUWZkInEX1p5HXnqmCy3FyF6SZUQWZ1uvO1hMDlLERFVqptsG1dyLSS9LuiP1tkvWOwtawN+zLJO1UlmMraX75cSWKIsMZGmUr1gsmjaalnSlYhSDqIgCMfh6iSUHXuuS5s8eEhPmCdH9WRYy18MkdsmBMKOd/5/qsv7jPQcKtNgfXbC7MNQzBIVpnxDYfBq/cFdiTaCVtfPsEW8Xb++ggW1hYnpaI6mQIA4ewJzXRbb49b1fvucH7beQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rvGXEnml; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rvGXEnml;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCp3t3Hj8z2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 16:18:17 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-771ed4a8124so1850381b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756448295; x=1757053095; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
        b=rvGXEnmlMS9Qjgxtgysh63+xRp+Fq7N120sf8l3mJwCRD/9mAEQhn1cGgV99nuRPh/
         oK7WOFLuJrYrxrkNgiv/No+P+dg6t1Vd/TMrZkr6GinpW+rDAb9b7MmHzmMi0X1z2fQQ
         dvMuaPqgRpDloSsUpmK2P7wQ1H+Rm/kKcYBVZDiQyPk5ruRlymvkY31uklDnp3dfcenc
         CBPLgteNjfinyXfwww8pGnQBjvlBWBnpvk44d6Zqh7i+xphqC8gP/bjNA0BlAD9tVQPO
         rTR8ZjRis5mrBoXAmSlGdrG2misd0kgoZ2gObb9maSKY7BJaa6m5WqnULmdY0/7bf+3x
         qDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448295; x=1757053095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
        b=vzIV1lvjmnO2H7N70FSrW2I1hLS4VIRMvPWc0zUTw0mJ0DzHHP9CdCawEJgsuRxlQm
         ctBpvCgYZHnUXLyTj9hk3gAEQnljXss8g62JNCNiLMrWRD0D4DtXRzzWgUyQn5XwmfaM
         aWwNty8qG7nRgu8eUIrdKdrVKzFMW745djua9hSPoOed/AZyarLTEmtiMKn1NJpDQ7K4
         v6CnX3TYDXh5sjjCVaDZfpRLcOvhnpYDpPnLut6p1p9ldwz/d4fa7TuyS4MQYwZqFj16
         PRSJqz8QlCptIzpocyhWS9L3x2tEYaY+IVNfPcIIKXNo6y5sZBFDL/C+hazTKJqOdDoX
         eLdw==
X-Forwarded-Encrypted: i=1; AJvYcCUlv5DEq836fdW+BA6VUs/OIslKTkKsrPSEz6Kw5IiTdk3qTHtfOAiS4pWxw3ZWEMGKEJ1U41CjfRfREv4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxg/KhCK+qc/1qf7IwxxGqu3KeNj1SbO1nysjODPERKFZ7ik6I9
	DNozI2cEhclmFcxj8g3FKTzBWQhzlc0n/u1X8CASoYBGZCX+SXhKbGTTNGjGAVxr/BI=
X-Gm-Gg: ASbGncsr8kKAz6w36440eE4mgwMFifNe8ARa6BuCtSwaRt6oG2zUMvri0I45HeoPrWw
	SjrTSD6kEMmryRALPBo5AabDJci9LHPljrUrFiJTicJ+sv7xKGC4r4mN/z5BCMeLfpXCyJMZhG5
	vxBQvVkGEqVa/bbMUwj4ooNurwICJ3ixXOYaeSqI1f4lbhB8ALVuUbAzn7jbkBEjtLeJWhsPlLI
	oD3qWs60xb5rKrioMwE/952fxARIQJ79YdR4ddKM4ZXC24uxIlgXzzsm5KsEsvhLGRELI/HEVtB
	aAP/cKfBtLz4bmXuY9KKQjqweHAsfoZT6pDEkuP0J+jqOvt/9MsKb7dknOs1h1WoNqYKGYGf1tu
	cGxUDD0WzgbaquyAS9Nna6Yx0ypJ2j76h12w=
X-Google-Smtp-Source: AGHT+IEdwrBA8fEPouruiBjmjO1y+VLHrsJ6SO97Twxy5LbO1fb87iKCtpWKSDsewOGX8ikCQhJ2gQ==
X-Received: by 2002:a05:6a00:3907:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-7702faaf2acmr35042659b3a.18.1756448295215;
        Thu, 28 Aug 2025 23:18:15 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1b21sm1307488b3a.69.2025.08.28.23.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:18:14 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:48:12 +0530
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
Subject: Re: [PATCH v2 08/18] cpufreq: mediatek: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829061812.fziokvashujzbtth@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-9-zhangzihuan@kylinos.cn>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-9-zhangzihuan@kylinos.cn>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index f3f02c4b6888..1fae060e16d9 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -320,7 +320,7 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  	struct dev_pm_opp *new_opp;
>  	struct mtk_cpu_dvfs_info *info;
>  	unsigned long freq, volt;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	int ret = 0;
>  
>  	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> @@ -354,11 +354,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  
>  			dev_pm_opp_put(new_opp);
>  			policy = cpufreq_cpu_get(info->opp_cpu);
> -			if (policy) {
> +			if (policy)
>  				cpufreq_driver_target(policy, freq / 1000,
>  						      CPUFREQ_RELATION_L);
> -				cpufreq_cpu_put(policy);
> -			}
>  		}
>  	}

Merged with:

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 1fae060e16d9..fae062a6431f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -320,7 +320,6 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
        struct dev_pm_opp *new_opp;
        struct mtk_cpu_dvfs_info *info;
        unsigned long freq, volt;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);
        int ret = 0;

        info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
@@ -353,7 +352,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
                        }

                        dev_pm_opp_put(new_opp);
-                       policy = cpufreq_cpu_get(info->opp_cpu);
+
+                       struct cpufreq_policy *policy __free(put_cpufreq_policy)
+                               = cpufreq_cpu_get(info->opp_cpu);
                        if (policy)
                                cpufreq_driver_target(policy, freq / 1000,
                                                      CPUFREQ_RELATION_L);

-- 
viresh

