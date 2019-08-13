Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A3A8BF8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 19:21:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467KJh0bfjzDqYk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 03:21:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=ego.lkml@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UVdfblT5"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467KGp3kmszDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 03:20:18 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id e12so31203257otp.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 10:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=90Ewmj8ds/YpTw7j5q2bwI1KuVHJSLGds9otUCNgTZo=;
 b=UVdfblT5KbGtk1MPAWsHpcK1f9zNfc/uYAiirsx/X+F2vcZbtMBl+yEPSsj6X2XJCt
 huQGYvjwiPun/L5qE2T/UWGQA7XTp4fY1Z/NoiznqjbU53EmbD8WsYcvnrqv6ULLAQAp
 g/v1DL2JKfRjmGbMkzeVYQLXr1ske9OgQ9M+nLwDILyDoHMEmSe+40WiomwGLTucyPGA
 9l2g/m55m1k87GSujD6sDvl2gogObfzY46nP6ugocVkjKr02XfVe+hYYRY9P8kP5t3Af
 7XFN6UJziBccSh49d/yyQ4MK1nrEddenV1TpkR9hA6eLLJAVTWREMKglEHvtwdYHHhWR
 gEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=90Ewmj8ds/YpTw7j5q2bwI1KuVHJSLGds9otUCNgTZo=;
 b=gRZnA6TSKHfgQlBRZT/UXVjporF93vacOw0FFRl/o5E4d04pbj2D8PQ3a76qt4FS8W
 w2SOEVJFJ5U4pOdrMxtrq3v9+N1UOCd6eUPNE2LPeSykj7laFIAEHDrwl12pWfvLRHdh
 oMcCU5SzpBJdRCJZatyW9E4yMB6Xh9sF852Hm1yVaJoMzElZPWBdvh/W625OWjSAh8r2
 JmVUlPbU5SC52fdzXUWsemcZLjqGa56ihkuM8AteQtE3BAKo1ZKSrEsjpFZydywy++si
 GIW+l/kLj4P6GKU8QPHug9+qyYGQU/FPlIYUUbzUgajfWgdHYs2mLYWl7Mvk6+0g9F2J
 JhWg==
X-Gm-Message-State: APjAAAV5dOL89v3IqB7JnxvaWJ9NJ/XJUBsySDgjVviFEuXarBZJYD/3
 8HaZOty84MJLi8Ghcto+mtPDIAWY81qyseV8hh68l5nV
X-Google-Smtp-Source: APXvYqzRCTD8AXh4GuZK9RsjxKZselkEKMRNu9Tai/VKIquQjaG7hwMmnUDlIVBfNJDPcQmlEUydsfPuT2ngXtkl74E=
X-Received: by 2002:a9d:6652:: with SMTP id q18mr12714934otm.162.1565716814900; 
 Tue, 13 Aug 2019 10:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190802192926.19277-1-nathanl@linux.ibm.com>
 <20190802192926.19277-2-nathanl@linux.ibm.com>
In-Reply-To: <20190802192926.19277-2-nathanl@linux.ibm.com>
From: Gautham R Shenoy <ego.lkml@gmail.com>
Date: Tue, 13 Aug 2019 22:50:03 +0530
Message-ID: <CAHZ_5WxJcgn4A0Tyq3K+ohKZo89pj4tnF3_L90akWkbQii1eyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/rtas: use device model APIs and
 serialization during LPM
To: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: ego@linux.vnet.ibm.com
Cc: ego@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nathan,

On Sat, Aug 3, 2019 at 1:06 AM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>
> The LPAR migration implementation and userspace-initiated cpu hotplug
> can interleave their executions like so:
>
> 1. Set cpu 7 offline via sysfs.
>
> 2. Begin a partition migration, whose implementation requires the OS
>    to ensure all present cpus are online; cpu 7 is onlined:
>
>      rtas_ibm_suspend_me -> rtas_online_cpus_mask -> cpu_up
>
>    This sets cpu 7 online in all respects except for the cpu's
>    corresponding struct device; dev->offline remains true.
>
> 3. Set cpu 7 online via sysfs. _cpu_up() determines that cpu 7 is
>    already online and returns success. The driver core (device_online)
>    sets dev->offline = false.
>
> 4. The migration completes and restores cpu 7 to offline state:
>
>      rtas_ibm_suspend_me -> rtas_offline_cpus_mask -> cpu_down
>
> This leaves cpu7 in a state where the driver core considers the cpu
> device online, but in all other respects it is offline and
> unused. Attempts to online the cpu via sysfs appear to succeed but the
> driver core actually does not pass the request to the lower-level
> cpuhp support code. This makes the cpu unusable until the cpu device
> is manually set offline and then online again via sysfs.
>
> Instead of directly calling cpu_up/cpu_down, the migration code should
> use the higher-level device core APIs to maintain consistent state and
> serialize operations.
>
> Fixes: 120496ac2d2d ("powerpc: Bring all threads online prior to migration/hibernation")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Looks good to me. This locking scheme makes the code consistent with
dlpar_cpu() which also uses the  high-level device APIs.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 5faf0a64c92b..05824eb4323b 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -871,15 +871,17 @@ static int rtas_cpu_state_change_mask(enum rtas_cpu_state state,
>                 return 0;
>
>         for_each_cpu(cpu, cpus) {
> +               struct device *dev = get_cpu_device(cpu);
> +
>                 switch (state) {
>                 case DOWN:
> -                       cpuret = cpu_down(cpu);
> +                       cpuret = device_offline(dev);
>                         break;
>                 case UP:
> -                       cpuret = cpu_up(cpu);
> +                       cpuret = device_online(dev);
>                         break;
>                 }
> -               if (cpuret) {
> +               if (cpuret < 0) {
>                         pr_debug("%s: cpu_%s for cpu#%d returned %d.\n",
>                                         __func__,
>                                         ((state == UP) ? "up" : "down"),
> @@ -968,6 +970,8 @@ int rtas_ibm_suspend_me(u64 handle)
>         data.token = rtas_token("ibm,suspend-me");
>         data.complete = &done;
>
> +       lock_device_hotplug();
> +
>         /* All present CPUs must be online */
>         cpumask_andnot(offline_mask, cpu_present_mask, cpu_online_mask);
>         cpuret = rtas_online_cpus_mask(offline_mask);
> @@ -1006,6 +1010,7 @@ int rtas_ibm_suspend_me(u64 handle)
>                                 __func__);
>
>  out:
> +       unlock_device_hotplug();
>         free_cpumask_var(offline_mask);
>         return atomic_read(&data.error);
>  }
> --
> 2.20.1
>


-- 
Thanks and Regards
gautham.
