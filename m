Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA82221144
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 17:37:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6M2k0nxtzDqmh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 01:37:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6LwD52X7zDqmb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 01:31:56 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id 95so1768814otw.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 08:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CfCu9gcxeRoD+7qVqyIBHyNUHyLlmoT+teLp+nb2dZ0=;
 b=P2XLUGR9f2REMcJWn9KMW3+m/+vekWg8XDeKDOi8zTGQbmmPTKrVZV9L13pbF8Yh6S
 uq53zd+jOR1URFrVPF45cCDHMfrH1NeuaKWKmDfmUpi0z31oyNFytbXb5QmX2hcH5FH1
 a8ZtuflnlfgWwPOzfBpAEVXqX7g1y7Z3BDJIzsm3qeApMSiBeuhAc07eJP92ylZqcbLp
 PN0DJL+wQbS0CRUhYL++NikhfyXp6B1djtWBWRgwFzUzr1v5PpyANNCfsgby9J8uVhxD
 rn6zFJCLLXfqCax4u2zLOpQtnkMw/RIkMKILsRb6IZ7SLWXLrdfAXLWvxpIcmdXHvffE
 8wig==
X-Gm-Message-State: AOAM5311MsMeryR+Psjyt4V1xKZ12b7Pmt4j4kOcB8kUjgHO1pj4hVt+
 HJIyFOqDewkZph6H+wHEli0Yt8LU60Gth5Foozw=
X-Google-Smtp-Source: ABdhPJxqCa9PIsfAHEJXsS21RCQfg4fCS9+30rYQzsKC5k3XqY+8qM8Ud9Ij5B5Du4CoOnGQcTDfoDk7AHff+v9KjO8=
X-Received: by 2002:a9d:590a:: with SMTP id t10mr188460oth.262.1594827113876; 
 Wed, 15 Jul 2020 08:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200714142424.66648-1-weiyongjun1@huawei.com>
In-Reply-To: <20200714142424.66648-1-weiyongjun1@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 15 Jul 2020 17:31:42 +0200
Message-ID: <CAJZ5v0g-vEdOdHMXDBKX2+akELXCYYbRQSb+5RhG7chrP6-vXg@mail.gmail.com>
Subject: Re: [PATCH -next] cpuidle/pseries: Make symbol 'pseries_idle_driver'
 static
To: Wei Yongjun <weiyongjun1@huawei.com>
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Hulk Robot <hulkci@huawei.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 4:14 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> The sparse tool complains as follows:
>
> drivers/cpuidle/cpuidle-pseries.c:25:23: warning:
>  symbol 'pseries_idle_driver' was not declared. Should it be static?
>
> 'pseries_idle_driver' is not used outside of this file, so marks
> it static.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/cpuidle/cpuidle-pseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index 6513ef2af66a..3e058ad2bb51 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -22,7 +22,7 @@
>  #include <asm/idle.h>
>  #include <asm/plpar_wrappers.h>
>
> -struct cpuidle_driver pseries_idle_driver = {
> +static struct cpuidle_driver pseries_idle_driver = {
>         .name             = "pseries_idle",
>         .owner            = THIS_MODULE,
>  };

Applied as 5.9 material, thanks!
