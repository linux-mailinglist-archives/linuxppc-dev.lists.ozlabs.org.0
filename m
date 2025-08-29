Return-Path: <linuxppc-dev+bounces-11459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B18B3B2E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 08:04:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCnm24LjMz2xS2;
	Fri, 29 Aug 2025 16:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756447474;
	cv=none; b=euEzPOIF6c519iiB6wXp/87HNJbf5ArPbnTlPGoBk7XNWFk+TNJlXpqX5RT07WZFczC+72Ow2Q6H4ied/DFBGdt2wiMV9GG4SoCku9a6CJ2bPJJwsM5BL8VOzWaTVua8IA8C/1QZkwrtNOj4LzGcXT8o/B6dRmdlCoFlp2YSletS9WeoMqNhx2JOBGT/v0JZpiocUKlF1iOjCiSSwvOZ2t/oRxqp3AOKJECv1i2RAv2Iq3bvO9jwEIucgbH6rwXFgGY/uZPm9s600JKRV9qDjAE+e/O/kD9Rvz/Wi/LG7LzOYkPr25RIhfsPHi4OvLlUdcGxBQLtDZekIzoHS6wCFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756447474; c=relaxed/relaxed;
	bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arV+qZYk8XYDA7yflRfvwarH0szgGILHVsDPOg68EwJ34J91wiqOCPcU6iqx36tcWskJd+JDI+8A1NKgMASWNb5u2XfV20zHF7NcbFMnU7gn82FMHL/9dkQ4liH4p4wFvunqrbvNJt7AqYELTJCWAGBxXa1AfPqJ7Pyb3B7X34WDI5ZDECczHa6P+Y9/u3xo3X/honuH3onSIlcmbCDPPf9Cx1BMO/fyTt6eYlS+a7c02t/EPDajSsT3v8iSWV22t4DHyqYyF5K8IAlYOKszuE+o9HrAv5hqc+qj+qAVtj+5aW5KqDEuAZd3j+welDj8aSnaJqngygK6LVtFXvH21Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ONGHbMaC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ONGHbMaC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCnm14wwWz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 16:04:33 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-327f87275d4so10572a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447471; x=1757052271; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
        b=ONGHbMaCnCiFJboEFHZPpwNB7U2ARo8mFSIc90Kdq35IJbT7dnFThQNM3OHQyLO2j2
         3MsPdAhYJL2LnpEjc1lrvV2esnziv0iFAmLJ/OlC4mw1DVzXwEjvKAZ+Lb+pKyt5exBW
         xpulwmx3UEfXWmUSltuqdZeqcyzGFOfC4DfTuJsaQ1ZEKrgcwQTOky1IEvPWXBHX/q7e
         raQSS4BRxkuG+J4o8mf/RTd7BjMnU0jZradgTCAN1jKz4Bly2K2mLKTK0L48qAIcGSrp
         WqS2OQAK6Y56e4CZVr47KLJXG+IuoaQkbMwbfr0Eq/jPMZNDc76liuj8CxQ9Lr2tNdow
         pImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447471; x=1757052271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
        b=N6C3hLd6a+HQ8yiGIJWjGO4UVIpyCiyjevn5Rwzz6yvQSwlz6CsRs7g1WLDzmqV2NA
         UT74DWpZHrra6tP0c2b2VepFYWwhOdbkoldDu7ZbnfkAkF7H1UCCKj4qExUhD/Py6vKu
         QJqBvwjvUnY+2GaKKLdIYQAi5u42+stNHdlthnKvLv7jl2/7NuJU3QgRCYEOY94L4Lny
         lm6RqHLhQ1fT1rarHSTYLERpzqRmupean3DDv4LH1L+MY3YItbAvocDJBNxqVD6ZJR6+
         rTxSVGbnpsODd9XWPlvQuYtvXnBZAfuaIfv2ZRleifezmFIrUC2WPWMHzMUQbNyDNhz6
         HvyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUAvcw2HwlmgBpdbAUB+V+XEhVx3v9IuHhJZKWVs8AzwGGWXWqrnMcKxETXh8fYMhUHA6dSmurXXzuOog=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDRwbhhRqdvzIQtQbIbZKuv/PsmrfN3mDzucbuqypitIwCYH/U
	YSkhSUtNrwhgT40H0k2qn8zIfvkezu5LShKIneRBQkAaBKvjm/FT9ybcgeLJ5tuY3LU=
X-Gm-Gg: ASbGnctWRNASyR7YEcfkgZEruVFIiVkYZ/lh0jsnfn7wOHj/LJHmodvXBLO9x4Nf8S3
	Xbi0qL9mIQtMrc7rHLzlo0LhXyGf4h9wQVrjHzD2rmchGVDxZg8taBl3OlhU6OFwCX8ubhvA7x4
	ZB5jnQ+hZIcTqOjPwEN+8Y/PUvNJ2gCtC5lbnz/lCelSGZ0MV9KUbCeDZSIo3zzllH88tDeubx2
	s4ePlYv5NvyywVan2+gVIlaMD9ollTz2yW02VvO2m7JkBWTk8QAURlGEla2FDTHYkBcYbcAuurd
	dAn0mdQs0u58mlPM/6jEvaX1LOwFI8dIA7NfqxtCnnXNEQTPlxTuXGHRNskyFEz6kSuklnbwIbe
	n9IFA8j63ZMtjx4XDMgxZh4Vo
X-Google-Smtp-Source: AGHT+IHJm0ouStNvxO+mrh5P3XbGCZbjhM83KCGZEDW+lDzAXYoH2OUF1pt2Xet0QmziR4vBgyThHQ==
X-Received: by 2002:a17:90b:4ec7:b0:31f:42e8:a896 with SMTP id 98e67ed59e1d1-32518b8233amr31504637a91.34.1756447471082;
        Thu, 28 Aug 2025 23:04:31 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57ab9esm7074127a91.4.2025.08.28.23.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:04:30 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:34:28 +0530
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
Subject: Re: [PATCH v2 05/18] cpufreq: CPPC: Use __free(put_cpufreq_policy)
 for policy reference
Message-ID: <20250829060428.aoo4wlp67celupv5@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-6-zhangzihuan@kylinos.cn>
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
In-Reply-To: <20250827023202.10310-6-zhangzihuan@kylinos.cn>
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
>  drivers/cpufreq/cppc_cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh

