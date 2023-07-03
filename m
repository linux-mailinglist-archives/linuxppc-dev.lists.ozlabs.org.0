Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C00745409
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 05:02:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oeF7X0/s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvW211HyJz3bcJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 13:02:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oeF7X0/s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvW142PT5z308K
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 13:01:57 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-767582c6c72so143261685a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jul 2023 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688353311; x=1690945311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cjyh3GtK+R5C3rMXx/WtR6Q6tk1qQkvOCfKCK4nSvD8=;
        b=oeF7X0/s6rjJdfuF75CMy22fbngqq3qO98CdvpfG+vKUl5BhnE5dUjCSlGfi0LK2cT
         kK/H+YCAaeK0Wt4QxrKBiMeFYltEArekjRV68QzQ/kp20VMp2w8hiLv5nYfM4wd2rk/q
         dGMsYrSWRPQJ7Opd/KT105MDGh8n4thPW20fl3GAhmLeQQSVD/plo09vhct92Oud/eFr
         00HsIb+4mNowfw9k9e02nBmcJPsZzlIJreVSBY/gyhjsiG6JHQiGYJQ3NEniFFEhROkR
         +Xjd7apYDWAhaFSZIqwyzkvL6xab8WvvKmJbMDDhgvISkwBQtC4U8DNiYhiMR3x2rnel
         QhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688353311; x=1690945311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjyh3GtK+R5C3rMXx/WtR6Q6tk1qQkvOCfKCK4nSvD8=;
        b=B3TE+T9BMqCaoMcSJPpfFjI5/Cws+9gTs1PSK+w6Mh6m7qtxKsQH7DYs/M53VIqc+D
         fzt3Q0WMCYiTa+OnjrRFTDKHqzjxFeyzz628hEP5mXId2FVjAcmKV3iYFtwRCNc3+Hln
         P0qQexZVWriPKnlOWmN6WqE9d65SFPJJDoUVP80dVvm+HY3HO31Q8AT09aCfmD2Xze0y
         86LDDrx5cl0HUdYhgdSmZUTZB6cymiA/zzw+uK4+BxI2OgkJR6TT7F2Xc5+33gd2/Fgm
         QsA1KvsRM/eJicQg8pbQCSb5pYX4FFwS9n9D+MVvI4v12wiidWTlvGkah++7BXSvNtoO
         gzxA==
X-Gm-Message-State: AC+VfDwZeZ6CLlWAKjRG8+cqPlposzbrwAhvZJRGBVf27T8qeBgJp004
	C9MJSET1UR48/wPgRvULDsW7Dg==
X-Google-Smtp-Source: ACHHUZ7zEWBGw11hn9CutuzNOAsF/ItUVATKgr/3z9aXor3X5TI0VMp4nfcy31WyWtPRQ+2gigyc4g==
X-Received: by 2002:a05:620a:22ea:b0:763:e407:4eec with SMTP id p10-20020a05620a22ea00b00763e4074eecmr8718582qki.50.1688353311183;
        Sun, 02 Jul 2023 20:01:51 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id x3-20020aa79183000000b006828e49c04csm1026365pfa.75.2023.07.02.20.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 20:01:50 -0700 (PDT)
Date: Mon, 3 Jul 2023 08:31:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] cpufreq: pmac32: Use of_property_read_reg() to parse
 "reg"
Message-ID: <20230703030148.qqszljkgnyzt52da@vireshk-i7>
References: <20230609183111.1765507-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609183111.1765507-1-robh@kernel.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09-06-23, 12:31, Rob Herring wrote:
> Use the recently added of_property_read_reg() helper to get the
> untranslated "reg" address value.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/cpufreq/pmac32-cpufreq.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
> index ec75e79659ac..f53635ba16c1 100644
> --- a/drivers/cpufreq/pmac32-cpufreq.c
> +++ b/drivers/cpufreq/pmac32-cpufreq.c
> @@ -378,10 +378,9 @@ static int pmac_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  
>  static u32 read_gpio(struct device_node *np)
>  {
> -	const u32 *reg = of_get_property(np, "reg", NULL);
> -	u32 offset;
> +	u64 offset;
>  
> -	if (reg == NULL)
> +	if (of_property_read_reg(np, 0, &offset, NULL) < 0)
>  		return 0;
>  	/* That works for all keylargos but shall be fixed properly
>  	 * some day... The problem is that it seems we can't rely

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
