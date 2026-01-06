Return-Path: <linuxppc-dev+bounces-15299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD0ECF7461
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 09:20:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlkcw4HWdz2yKr;
	Tue, 06 Jan 2026 19:20:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767675500;
	cv=none; b=P4TI/d5R6Ll4wIdrWzX90L6nxavOtqam/A9pfVM7iKKvD1Mtik93T8P2xLZCeZDimfWzKRLSmmXM7x5XCxAb7oc8ImIyz72sB6Pfdvcmbcp1JY4F+F4DXpwv3HmFIAIdndxcGRYCMeLiuom4ubSL+UKz5dVpvTSSzylSrxfNFYs8guAguvNtXHCAJZzzr5V98eqJLWNSuZB/yoQ7YU/bk9ABM4BVsYMKoLEhp/075exqZWH8Iy0ZV3r8rGQYEMb6K+pzcV6zDMHo7LkrZ0knQReppZu3Tjt41+Q5gL+OvezV6qACpfleAnvpCtOYy/GbL5LWGmi5qdCVYl20DkQkGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767675500; c=relaxed/relaxed;
	bh=oOlNWZ1ASjDiM8/EVArPiKc25ePbXneuyrH70Dm1FmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbkDnPe0f2RJBmDQipzWfjCCCdrG8oiIrtmLmIpYLToKueRdBqcAEwJkAuho3j4W38luvRETyFJOGDEqfqx9IRi5kchuS+r5hlJ1p9pv6XA584wW6gkdi/b0Gm3Evz94ZWD06QZTLOIlgPCigR/6RJPZGgxZnEEZTzQg2x77tMyTBCiEILSKHFXJf+Qe6TJh5kS57jBMlysyX8HCDeEgSBGZ9nkOazU5E3w+XDWZt1ln9jdaRiGOc+HGWAmmrXK2foagyF5mJZyMAjgnksrQriAhBSw96oLyuKwq0EpbwApM+AWbrIOQHEDzBqjJjxxrVHPktdVTkCz97YGZZprM1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TFuRtJaI; dkim-atps=neutral; spf=pass (client-ip=209.85.210.169; helo=mail-pf1-f169.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TFuRtJaI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=209.85.210.169; helo=mail-pf1-f169.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlf7b1Chtz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 15:58:17 +1100 (AEDT)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b75e366866so271566b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 20:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767675435; x=1768280235; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oOlNWZ1ASjDiM8/EVArPiKc25ePbXneuyrH70Dm1FmA=;
        b=TFuRtJaICtEgKAZlxnUmUJUl8OQChptLngeEb2AokDEYGTm4+Piew6q5Y/+EmIhFlO
         BM75V6o6YL+CLTwZYsmfj4ChXQ2ub4tr7UfmLyXLG48sMMXocZdfuzv/hMcrqyDiC/KL
         +/TEoynAgc+4c8t5cC6NVvfB3ruIl5AzaH5InICAWsmoeIk+Lty2j7u8iyVMXGClHGJL
         L5VjBsipHzol7VFtEehn0A16paHd7EBrCrrVa/eVDydl0zYdlBF3vLSyI0n739rY3tKU
         MrotWCn70HPlVQLLTa8wiCllyRb9Uv58CmFb+PfqxFere5IWnkeTd7iRgvvA6BH22Io7
         4ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675435; x=1768280235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOlNWZ1ASjDiM8/EVArPiKc25ePbXneuyrH70Dm1FmA=;
        b=JwVlnH5ZYxkxYm6SObUzcBQuQAZprnCndpnB3lDM4ylTyXdDtmszmKIrIySFqVbxAg
         Qch6nZD84o2x8f0xFXStQ7Zv9mrUAI0MVTXkPfOEYavoGZux4J8i8PQsXAIxh2nu0WoQ
         +7jIXzj8GnSfPi0hJR2eYzCKqkgdVIGBl0dgpoiAMuQYfSsPaw7qxajFnFqZNMTg/qmZ
         zaxwl3dw50bIC8akDPHoCS+b/sprGx7Inx7Efg3tm9MPGzKOqvecaKgjRJAliX9nzetb
         Ot6Ob0qK4SKwD22EFgRk4NrygXywXYw0yfUiAWxNGRi7ziPEwsehEFG/i3LCkwAmWaJD
         C4wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxDg7+uwrziyH6GWAGKIA2juVtLlfC7fpK8Mjez0FPm7hFuzJtmV0Q5tgw44/t7ixw0QH57ld8j/L5JtY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YycUxNyaP95IsbJggO2ysygDjiXw8JVmC1mUtN/KAs8k3QFe82O
	PAsSoirjJbxo/TPLKoVfs/JyeUsVW8Tm1foSWDj/HJijUs6mCiUg+GrlY9p8nvEJYvA=
X-Gm-Gg: AY/fxX5nOQLcPvJtVrVr5xL2Cmlo/2P2lGz1TBtkifgkdJDqkLyXE3ZVz1xsnoJ9B7z
	Ph6EMKTg/AYOvcXOCZnSJgu6zBqK8Ftyn+tFX0d2hGYapCycAztis4A9rEU5nzxavoIIDX5xNwg
	jI1UThYgLRaxAl20sfPfFs8No3RSiodSZVAUDm/akVirfDTAnQnyxeZLwiEY9YFxOP6+gty5sJS
	mhpN9AhAzLOKMIXYiaxj4G/M1ugBXsUiYH2/PDeQa7BnybOz3l4jOYjyJkAeSSyBnGDrnlCd4LQ
	++SE2iRqBVibIXux5q0hooATwWjAFAC50LIW3GmL8jYpriE0WVOQPPI8Tx1+iR7mIu6lGLRrRsR
	L+WS9RbDyVE+MuHjnys7m5k+v7JpkindCgj7awBMQ1ftw7yorDj4d+QD0T91pmcTUTcjOc9t6iv
	a0ZbnieX54cWuqqEfQqRNBjw==
X-Google-Smtp-Source: AGHT+IH1HIV++y2p498uUKeXICIqTonP/XkL+xU6dt4xBDj6CXKEeUOGv7lJojUw920KVFSDaG10IA==
X-Received: by 2002:a05:6a00:ad86:b0:7e8:43f5:bd3e with SMTP id d2e1a72fcca58-8187f78d9fdmr1867900b3a.42.1767675434866;
        Mon, 05 Jan 2026 20:57:14 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa1936dsm727051b3a.12.2026.01.05.20.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 20:57:14 -0800 (PST)
Date: Tue, 6 Jan 2026 10:27:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 11/11] cpufreq: s5pv210: Simplify with scoped for each OF
 child loop
Message-ID: <g4k2qdsihxfawfsi5ie3w2fhbsd2x6z5heifkcte75c2w3sjg3@cofrjgaiilta>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
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
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [122.172.80.63 listed in zen.spamhaus.org]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.169 listed in list.dnswl.org]
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 RCVD_IN_MSPIKE_H3 RBL: Good reputation (+3)
	*      [209.85.210.169 listed in wl.mailspike.net]
	*  0.0 RCVD_IN_MSPIKE_WL Mailspike good senders
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05-01-26, 14:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.  Note that there is another part of code using "np"
> variable, so scoped loop should not shadow it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Depends on the first patch.
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index ba8a1c96427a..e64e84e1ee79 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>  		goto err_clock;
>  	}
>  
> -	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
> -		id = of_alias_get_id(np, "dmc");
> +	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
> +		id = of_alias_get_id(dmc, "dmc");
>  		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
> -			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
> -			of_node_put(np);
> +			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
>  			result = id;
>  			goto err_clk_base;
>  		}
>  
> -		dmc_base[id] = of_iomap(np, 0);
> +		dmc_base[id] = of_iomap(dmc, 0);
>  		if (!dmc_base[id]) {
>  			dev_err(dev, "failed to map dmc%d registers\n", id);
> -			of_node_put(np);
>  			result = -EFAULT;
>  			goto err_dmc;
>  		}
> 

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

