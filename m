Return-Path: <linuxppc-dev+bounces-11460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DB7B3B311
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 08:13:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCny90X0mz2xlQ;
	Fri, 29 Aug 2025 16:13:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756448001;
	cv=none; b=fVRWGdaJPV1afjosCsCHfb2cLp9AJe/kWbQnbCBOVOPN2EVSEski+BBEhC+ynb2yQ2JOsqlbbNl1cRfjv7olevvXdmKDxqWyZXm3OXrWtUyT5pxt3Ms7lhRlYPImplrnzjgPjP45DD1d/TAHA9G6WJv9cemKPWyGY/YhUEE/oDL052OJTpC61IeycFW8K8YDtQ/LWBrdyauLaPcDFnUQceKCSd400XdUIxVFe0IYmbbrwmhOTg6uUWopLf6QPX8HNtPo2rEwtmwH9DnJeY743jq9cjypsqjY51MLq8i6Gmed7ltwYWS1JjbYNEnohGZbBKi6hU7L+CFzgMFxE8y5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756448001; c=relaxed/relaxed;
	bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia11zGuD3+XEk/VLVtcGvLRc1vKuhUeWyvU5+drDrUyeDHXvKSBEdfaBrzj6mSSB/ktcCzxoQPhixuK2mtHT63farqbRQlbgn3Zo+zriHim58pZmq3A1tVkXHmxyUPfdkCx8hquOtXj8qOd7//rSH4O66nkLzv67rOkMtFR58Jf3hn8dYKSE6Q+E4N68OCucwi/Em7lExU51ARIll1G7ujtalvGhnQqK/8LO/sPD3/yQ4aJjDBHU87gFqKJ1R3M6aI/XEoDNHSoeI83SgE88wc24rjE8jWa7BtPSCXDp1fQJO9+UikqJu0JZEMhSY87OIFPfKdq3r3dBzjVOpR72jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BmYCsBmr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BmYCsBmr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCny80svJz2xWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 16:13:19 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b4c9a6d3fc7so476149a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447997; x=1757052797; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=;
        b=BmYCsBmrrOenQKemQj7Klw96UMUg2KkeYlQ9kJxRiI6HTwTTnwp9iJ3WA2jRzjT+uY
         t8wnxJsXJFnntEqEf1ZMxZxBaf2oKnkNMqXmzFs2OarnTc++EzcftHtW/Mq2vauwihDR
         neShXbZVK9dJXaQlj1RRlur1OIN6fcFkAdu/Z8WRgXVJxuF0UoudJEaNlF1JWsHR6hjK
         as72G16oqON2hb6vavurcItYRVBjZW9/eA5Tmn/UESrza010aKs205WlGgQrKnUOZPvb
         CvVlRuFij+Di7DvKlVe6ys92HV4zcbARq6MI1PN+j0ThEvjfhWdqn7FSSX4d7RUPFEdJ
         v7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447997; x=1757052797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3x6b/e3MpUD14LIMocrPRNaCjXydrgPTujas71bYH8=;
        b=tOhXfXsCTkKmGx/klvcdE8Pews4o7PJBFbgxcvdNKrY6h+aayg4Y1Cgjafx+kfJh9Z
         w5SOvEwBSw6dYzyC/D8Qr7TUsPJfhiLh6G+EDg72YVCsgH3QrHn3RsFiyRokpsWIOEoy
         k8Rnqw927dw0iWT/Uz+Xs5rdI6cwtHB271R/n+9gwkk4NPhgHyzRnrYCknBNPvCRrYdH
         iRVIBGTNuTe+/3fT9+yfSSIT4VtjqDrlur0n1Jxw2wVNMTB29dWkPqtpABhIIIhjwd7v
         kGbSe5Hb4t1l+mqWdev3CL64zQhSL605zm3xblWYj4PR0GDMjj34gGgU0BAWqXbTfYIw
         vn3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUchWblFoTHApt/+A/kdcG9mE5Ll0kBYBMB4IQGVyAavOScUy9T4PQjwIm0ihD8hKaFd/fBKqkDAr0t0T8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxkilm/YyuOncKOQb7YmEhvmxxYFr+ZNggfLjH1KyfOTObtrfPh
	h3a1092grzoioL90fUE7uwUFkIV7116VeK2fW8Bf2Euaaw6mlVh93Aqoshu9TOvOo4k=
X-Gm-Gg: ASbGncuKj8EeI1s9MbdpbxT7LU/Srtwzy6qx+dfeQsBvH+9xminmVo+K13xfjrUmYRC
	xJkRqATu1s70EsXtmx7EXlfQKSU9D0y82IVNakXxTR45j7TxxeAqHB60WomDiJjOmd4hjlQLTbc
	+wwE5lIUcYuxyF3oU1bCrDuhmpveDfEYCSj0o4diDaf070VLBvbtAAZSK+q+ISNTmBdCbV4wBOS
	MpKWXbvoWps49AfttBJuHe8UU6hOUpjfq1m2Y8ewjVLVQBQvni6X5ydEV4NM58KuCstfTqzCy83
	g3Zw/L5+FY9ENQVsJrfGBf4/7aISOskOtMYE+DN0ZA488DISjB2V1xWrgqmZ15bMppKDiAaUTqF
	rIPiwd5IxWSjDf1gg+/PFtDbpHXc8IpShWfA=
X-Google-Smtp-Source: AGHT+IFWh4jzpCyQazo33Du3vwJOQK6BMtgUKuJSYiyNvSKeAM+9t6q52OKXzZUwBWVIjDVwh5LnnA==
X-Received: by 2002:a17:903:248:b0:248:7018:c739 with SMTP id d9443c01a7336-2487018c906mr177164055ad.28.1756447996693;
        Thu, 28 Aug 2025 23:13:16 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490658999fsm13362715ad.112.2025.08.28.23.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:13:16 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:43:13 +0530
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
Subject: Re: [PATCH v2 10/18] cpufreq: s5pv210: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829061313.bloyct5htjym6b3j@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-11-zhangzihuan@kylinos.cn>
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
In-Reply-To: <20250827023202.10310-11-zhangzihuan@kylinos.cn>
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
>  drivers/cpufreq/s5pv210-cpufreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index 76c888ed8d16..95f1568e9530 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -555,7 +555,7 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  						 unsigned long event, void *ptr)
>  {
>  	int ret;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  
>  	policy = cpufreq_cpu_get(0);
>  	if (!policy) {
> @@ -564,7 +564,6 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  	}
>  
>  	ret = cpufreq_driver_target(policy, SLEEP_FREQ, 0);
> -	cpufreq_cpu_put(policy);
>  
>  	if (ret < 0)
>  		return NOTIFY_BAD;

Merged with minor change:

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index 95f1568e9530..4215621deb3f 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -554,10 +554,9 @@ static int s5pv210_cpu_init(struct cpufreq_policy *policy)
 static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
                                                 unsigned long event, void *ptr)
 {
+       struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
        int ret;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);

-       policy = cpufreq_cpu_get(0);
        if (!policy) {
                pr_debug("cpufreq: get no policy for cpu0\n");
                return NOTIFY_BAD;

-- 
viresh

