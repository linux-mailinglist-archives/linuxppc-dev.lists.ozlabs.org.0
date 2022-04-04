Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297C4F0F5A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 08:27:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX16g4CJhz3bbw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 16:27:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=scJfEMJY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=scJfEMJY; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX15z5j66z2xT8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 16:27:17 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id y6so7342915plg.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Apr 2022 23:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GUHkECGWKY4l3E498xDgM7CvWt62/0VfG1HSPGMaIYw=;
 b=scJfEMJYuAspUIdp6WETBXjmUi8vHfbOFJipjAChHFRwm9v2gRdff8COQwUulA04DB
 UiwVkCkVA0GgE9U6B3N8S/XMfLvureAjj5VmIhUsm9Vi3auk0cgF1PbUnn8l5y08tuO4
 GQJ83GQVILft88fjmMPTDp6va0aNZYuppB+20YqTNngW2iTu+sVggidfEea+042eLi1A
 BWyLPzP9pLYyXtNvI/uTBLqBP/qGaLq9QLmUYQ0/j1au0QL+uJ4HAaLP4he73ilT6fDw
 3x8BlQyLYjc1arBlFin1yppYELsR9EL4RiYqOdbtMTAUjf+n0Np50NsbxtrpAqx6TQNO
 sUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GUHkECGWKY4l3E498xDgM7CvWt62/0VfG1HSPGMaIYw=;
 b=bUflI+i9+xH/lYvxPgV6PseA62iCjpovGnXxwSjDX1qg71WLv1++UlNOkj7U59ijvA
 XSWbjLVD1G9wlkfVO17T9vbDVSOLdLPVT983JCMp75zeTqSD4E9PgfPnQYlE9Eh6/+QY
 N0fPdX23MGJ5kQ8AzrbDmwQMggvoQzLkj9gRV3Zh73Cro1PawDXXYr6VDP0C+o7pNP7h
 EOYJPkzILpNdAVpsXaVxXTgEGVGidlSky2D1Ld054cTOnlgcbA327jPhghX+iH9HZT3G
 IAvY+L/8HDECTq/1CnQc/4l63BWExQzjPXLYNnxyqteRcgnu71uuIQulTm8Dln4G9kmr
 yAHA==
X-Gm-Message-State: AOAM531FdAZtLlP9Nab3yogzkMyIeT9p/Rv39WL3IskqV52Z0cQ0JpCA
 85l/3MwbzQcAEQ7TMFG/mfBr2Q==
X-Google-Smtp-Source: ABdhPJyzknAqgsqF4eVMxtFdkqCsqFhKIN8KyYVMzApIqf7PI/18GfuGS4Iwk429QxcL3onQPTAyWQ==
X-Received: by 2002:a17:903:32c4:b0:156:8fd2:4aae with SMTP id
 i4-20020a17090332c400b001568fd24aaemr7346804plr.150.1649053632831; 
 Sun, 03 Apr 2022 23:27:12 -0700 (PDT)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 be11-20020a056a001f0b00b004fb29215dd9sm10015506pfb.30.2022.04.03.23.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 23:27:12 -0700 (PDT)
Date: Mon, 4 Apr 2022 11:57:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] cpufreq: Prepare cleanup of powerpc's asm/prom.h
Message-ID: <20220404062710.m6bzpg5gsx4x7tm5@vireshk-i7>
References: <4cb0c4573cce165657ad1f7275c4b3852cbcd115.1648833416.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cb0c4573cce165657ad1f7275c4b3852cbcd115.1648833416.git.christophe.leroy@csgroup.eu>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01-04-22, 19:24, Christophe Leroy wrote:
> powerpc's asm/prom.h brings some headers that it doesn't
> need itself.
> 
> In order to clean it up, first add missing headers in
> users of asm/prom.h
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/cpufreq/pasemi-cpufreq.c      | 1 -
>  drivers/cpufreq/pmac32-cpufreq.c      | 2 +-
>  drivers/cpufreq/pmac64-cpufreq.c      | 2 +-
>  drivers/cpufreq/ppc_cbe_cpufreq.c     | 1 -
>  drivers/cpufreq/ppc_cbe_cpufreq_pmi.c | 2 +-
>  5 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> index 815645170c4d..039a66bbe1be 100644
> --- a/drivers/cpufreq/pasemi-cpufreq.c
> +++ b/drivers/cpufreq/pasemi-cpufreq.c
> @@ -18,7 +18,6 @@
>  
>  #include <asm/hw_irq.h>
>  #include <asm/io.h>
> -#include <asm/prom.h>
>  #include <asm/time.h>
>  #include <asm/smp.h>
>  
> diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
> index 4f20c6a9108d..20f64a8b0a35 100644
> --- a/drivers/cpufreq/pmac32-cpufreq.c
> +++ b/drivers/cpufreq/pmac32-cpufreq.c
> @@ -24,7 +24,7 @@
>  #include <linux/device.h>
>  #include <linux/hardirq.h>
>  #include <linux/of_device.h>
> -#include <asm/prom.h>
> +
>  #include <asm/machdep.h>
>  #include <asm/irq.h>
>  #include <asm/pmac_feature.h>
> diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
> index d7542a106e6b..ba9c31d98bd6 100644
> --- a/drivers/cpufreq/pmac64-cpufreq.c
> +++ b/drivers/cpufreq/pmac64-cpufreq.c
> @@ -22,7 +22,7 @@
>  #include <linux/completion.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
> -#include <asm/prom.h>
> +
>  #include <asm/machdep.h>
>  #include <asm/irq.h>
>  #include <asm/sections.h>
> diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.c b/drivers/cpufreq/ppc_cbe_cpufreq.c
> index c58abb4cca3a..e3313ce63b38 100644
> --- a/drivers/cpufreq/ppc_cbe_cpufreq.c
> +++ b/drivers/cpufreq/ppc_cbe_cpufreq.c
> @@ -12,7 +12,6 @@
>  #include <linux/of_platform.h>
>  
>  #include <asm/machdep.h>
> -#include <asm/prom.h>
>  #include <asm/cell-regs.h>
>  
>  #include "ppc_cbe_cpufreq.h"
> diff --git a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c b/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
> index 037fe23bc6ed..4fba3637b115 100644
> --- a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
> +++ b/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
> @@ -13,9 +13,9 @@
>  #include <linux/init.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_qos.h>
> +#include <linux/slab.h>
>  
>  #include <asm/processor.h>
> -#include <asm/prom.h>
>  #include <asm/pmi.h>
>  #include <asm/cell-regs.h>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
