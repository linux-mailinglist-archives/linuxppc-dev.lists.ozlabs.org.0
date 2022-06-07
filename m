Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 783FC54073D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 19:45:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHd6g3HwHz3bqR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 03:45:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.176; helo=mail-yw1-f176.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHd6D1dP5z2xMS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 03:44:51 +1000 (AEST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3135519f95fso13838847b3.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jun 2022 10:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+PiNQ7Ke1EDMoHaTdFM09JbhwxFO++lctg5sJwbwR4=;
        b=vw1nAjGimq3IFCg3t1vr6tbf4ES9noWeez53LmsRjqtsKy/WZaCEl64MgH0uzO/1ei
         5LHy9GNX37Q7mdkRlwmAmgnvarWQqQP/iyqRLD3lOtfzYb8/LdqoC5tNvaiP4mmVEpOP
         3ElhKunacnXkrp6x7XNekAH5oNFQX+4LcLRiyMn4ueLrNdP7zPtr/wgszyUqIC4QXUQI
         l6i7A34ygGUCAe5iakbtvlju0c9zG3nZkkdVkY0vKDL58uEQk/pewGrXD4VBAwn/LTL1
         tUz8lc9PAfS5vDKn81cC+FwUkP5aYemziZnvOjW/+uO4bRUzeVOy8es2DXoaPnzUFpkU
         GIgg==
X-Gm-Message-State: AOAM5321kO6Hf8ck1DEapKIinqH7c3Sob4NUuBaMj6+vdkx1TkefhtTq
	BLTFjbXTW0frx+N5s8GIolySw796OUw5xoHTIQ8=
X-Google-Smtp-Source: ABdhPJwzutUKNflb7PpXgywg1Uv/bvtdxWRNOeG6nVPsQilGXkeQttAkd8clvXym4gpzSPRzewnvcZZ1/ttEcYpnDSk=
X-Received: by 2002:a05:690c:28b:b0:30c:bcc2:240d with SMTP id
 bf11-20020a05690c028b00b0030cbcc2240dmr34156080ywb.19.1654623888166; Tue, 07
 Jun 2022 10:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220606165640.634811-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220606165640.634811-1-dmitry.osipenko@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 7 Jun 2022 19:44:37 +0200
Message-ID: <CAJZ5v0icfqdOiPottyc=h6VyagynkbV7-0EqrC+5PZMKV5s6Lg@mail.gmail.com>
Subject: Re: [PATCH v1] kernel/reboot: Fix powering off using a non-syscall
 code paths
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 6, 2022 at 6:57 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> There are other methods of powering off machine than the reboot syscall.
> Previously we missed to coved those methods and it created power-off
> regression for some machines, like the PowerPC e500. Fix this problem
> by moving the legacy sys-off handler registration to the latest phase
> of power-off process and making the kernel_can_power_off() to check the
> legacy pm_power_off presence.
>
> Tested-by: Michael Ellerman <mpe@ellerman.id.au> # ppce500
> Reported-by: Michael Ellerman <mpe@ellerman.id.au> # ppce500
> Fixes: da007f171fc9 ("kernel/reboot: Change registration order of legacy power-off handler")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  kernel/reboot.c | 46 ++++++++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 20 deletions(-)
>
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index 3b19b123efec..b5a71d1ff603 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -320,6 +320,7 @@ static struct sys_off_handler platform_sys_off_handler;
>  static struct sys_off_handler *alloc_sys_off_handler(int priority)
>  {
>         struct sys_off_handler *handler;
> +       gfp_t flags;
>
>         /*
>          * Platforms like m68k can't allocate sys_off handler dynamically
> @@ -330,7 +331,12 @@ static struct sys_off_handler *alloc_sys_off_handler(int priority)
>                 if (handler->cb_data)
>                         return ERR_PTR(-EBUSY);
>         } else {
> -               handler = kzalloc(sizeof(*handler), GFP_KERNEL);
> +               if (system_state > SYSTEM_RUNNING)
> +                       flags = GFP_ATOMIC;
> +               else
> +                       flags = GFP_KERNEL;
> +
> +               handler = kzalloc(sizeof(*handler), flags);
>                 if (!handler)
>                         return ERR_PTR(-ENOMEM);
>         }
> @@ -440,7 +446,7 @@ void unregister_sys_off_handler(struct sys_off_handler *handler)
>  {
>         int err;
>
> -       if (!handler)
> +       if (IS_ERR_OR_NULL(handler))
>                 return;
>
>         if (handler->blocking)
> @@ -615,7 +621,23 @@ static void do_kernel_power_off_prepare(void)
>   */
>  void do_kernel_power_off(void)
>  {
> +       struct sys_off_handler *sys_off = NULL;
> +
> +       /*
> +        * Register sys-off handlers for legacy PM callback. This allows
> +        * legacy PM callbacks temporary co-exist with the new sys-off API.
> +        *
> +        * TODO: Remove legacy handlers once all legacy PM users will be
> +        *       switched to the sys-off based APIs.
> +        */
> +       if (pm_power_off)
> +               sys_off = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
> +                                                  SYS_OFF_PRIO_DEFAULT,
> +                                                  legacy_pm_power_off, NULL);
> +
>         atomic_notifier_call_chain(&power_off_handler_list, 0, NULL);
> +
> +       unregister_sys_off_handler(sys_off);
>  }
>
>  /**
> @@ -626,7 +648,8 @@ void do_kernel_power_off(void)
>   */
>  bool kernel_can_power_off(void)
>  {
> -       return !atomic_notifier_call_chain_is_empty(&power_off_handler_list);
> +       return !atomic_notifier_call_chain_is_empty(&power_off_handler_list) ||
> +               pm_power_off;
>  }
>  EXPORT_SYMBOL_GPL(kernel_can_power_off);
>
> @@ -661,7 +684,6 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
>                 void __user *, arg)
>  {
>         struct pid_namespace *pid_ns = task_active_pid_ns(current);
> -       struct sys_off_handler *sys_off = NULL;
>         char buffer[256];
>         int ret = 0;
>
> @@ -686,21 +708,6 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
>         if (ret)
>                 return ret;
>
> -       /*
> -        * Register sys-off handlers for legacy PM callback. This allows
> -        * legacy PM callbacks temporary co-exist with the new sys-off API.
> -        *
> -        * TODO: Remove legacy handlers once all legacy PM users will be
> -        *       switched to the sys-off based APIs.
> -        */
> -       if (pm_power_off) {
> -               sys_off = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
> -                                                  SYS_OFF_PRIO_DEFAULT,
> -                                                  legacy_pm_power_off, NULL);
> -               if (IS_ERR(sys_off))
> -                       return PTR_ERR(sys_off);
> -       }
> -
>         /* Instead of trying to make the power_off code look like
>          * halt when pm_power_off is not set do it the easy way.
>          */
> @@ -758,7 +765,6 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
>                 break;
>         }
>         mutex_unlock(&system_transition_mutex);
> -       unregister_sys_off_handler(sys_off);
>         return ret;
>  }
>
> --

Applied (with a couple of edits in the changelog), thanks!
