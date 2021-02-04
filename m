Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7486030FB6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 19:29:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWnBY00kDzDwx9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 05:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.178;
 helo=mail-oi1-f178.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWn8n1DTtzDwvr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 05:27:31 +1100 (AEDT)
Received: by mail-oi1-f178.google.com with SMTP id u66so2786396oig.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 10:27:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O++Ni8S6CV3MVdO8ZTSo7Rk4YCUFt3D0XWVU9XGT+a8=;
 b=A1frV5ZsDjh9QxHKcIIez0ZXCkaYvsNJZJiugjOBfCuF9Yjifh994148MckoZQ10h4
 /I+pDQf6JkS689aGvvPKg7dcX5hY6S3T4jX5IyXxwW/s59AlMC8aCsjuH8p8uxFVNmHI
 iGf3rpzYmbBvty+62hwgk9Z02LD3Uf2RR8V75yzSDb2uYTYpMysnrWv+UJItEX/RrduV
 aRIgoeX9fTWDo3eZye6ZJ8Z8DdmLNN6eXd39AZsv9jYiaPGm6oc91hATbuiXMn24KQLi
 72aDM0WDGUiANcSVRuxtcA3tJt8TVGu5kBsgWFw3gyVXBce47GPjHjV2z5xyqPRLUtyh
 AJig==
X-Gm-Message-State: AOAM531ftp9rTG0QzM87JiN9cVg089ztLpkeXe9PSvxZ5H2ojT0DABC7
 XBdekp9EmN1HIet3p/suukOabGYOuZTbHzrm/+Q=
X-Google-Smtp-Source: ABdhPJxkhKYk4oXkJeTKUtjMr66fakUbvZ+6flWoKUE4tBqAvByzPRwDVWs4bapr1CEIe0d2dayBEHB5xmsWwJ+pEuE=
X-Received: by 2002:aca:308a:: with SMTP id w132mr529264oiw.69.1612463247909; 
 Thu, 04 Feb 2021 10:27:27 -0800 (PST)
MIME-Version: 1.0
References: <bed6bc7e15c3ed398dd61b8f3968049f1f16b1b6.1612244449.git.viresh.kumar@linaro.org>
In-Reply-To: <bed6bc7e15c3ed398dd61b8f3968049f1f16b1b6.1612244449.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 4 Feb 2021 19:27:16 +0100
Message-ID: <CAJZ5v0hFFXKnnTdkc3SHoSNPO06pDAWjudvxSjxQ6eOOnuXq_A@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Remove unused flag CPUFREQ_PM_NO_WARN
To: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Linux PM <linux-pm@vger.kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 2, 2021 at 6:42 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This flag is set by one of the drivers but it isn't used in the code
> otherwise. Remove the unused flag and update the driver.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 5.12 material, thanks!

> ---
> Rebased over:
>
> https://lore.kernel.org/lkml/a59bb322b22c247d570b70a8e94067804287623b.1612241683.git.viresh.kumar@linaro.org/
>
>  drivers/cpufreq/pmac32-cpufreq.c |  3 +--
>  include/linux/cpufreq.h          | 13 +++++--------
>  2 files changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
> index 73621bc11976..4f20c6a9108d 100644
> --- a/drivers/cpufreq/pmac32-cpufreq.c
> +++ b/drivers/cpufreq/pmac32-cpufreq.c
> @@ -439,8 +439,7 @@ static struct cpufreq_driver pmac_cpufreq_driver = {
>         .init           = pmac_cpufreq_cpu_init,
>         .suspend        = pmac_cpufreq_suspend,
>         .resume         = pmac_cpufreq_resume,
> -       .flags          = CPUFREQ_PM_NO_WARN |
> -                         CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
> +       .flags          = CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
>         .attr           = cpufreq_generic_attr,
>         .name           = "powermac",
>  };
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index c8e40e91fe9b..353969c7acd3 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -398,8 +398,11 @@ struct cpufreq_driver {
>  /* loops_per_jiffy or other kernel "constants" aren't affected by frequency transitions */
>  #define CPUFREQ_CONST_LOOPS                    BIT(1)
>
> -/* don't warn on suspend/resume speed mismatches */
> -#define CPUFREQ_PM_NO_WARN                     BIT(2)
> +/*
> + * Set by drivers that want the core to automatically register the cpufreq
> + * driver as a thermal cooling device.
> + */
> +#define CPUFREQ_IS_COOLING_DEV                 BIT(2)
>
>  /*
>   * This should be set by platforms having multiple clock-domains, i.e.
> @@ -431,12 +434,6 @@ struct cpufreq_driver {
>   */
>  #define CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING      BIT(6)
>
> -/*
> - * Set by drivers that want the core to automatically register the cpufreq
> - * driver as a thermal cooling device.
> - */
> -#define CPUFREQ_IS_COOLING_DEV                 BIT(7)
> -
>  int cpufreq_register_driver(struct cpufreq_driver *driver_data);
>  int cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
>
> --
> 2.25.0.rc1.19.g042ed3e048af
>
