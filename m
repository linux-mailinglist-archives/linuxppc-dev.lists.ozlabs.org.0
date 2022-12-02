Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3812640C88
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 18:48:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NP0mD3xPNz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 04:48:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.171; helo=mail-qt1-f171.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NP0lk543fz3bNB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 04:48:01 +1100 (AEDT)
Received: by mail-qt1-f171.google.com with SMTP id c15so6180538qtw.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Dec 2022 09:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZkrcSltncE8/ZuZoYv4b2d7hscDOxyl0JUDZPI6liw=;
        b=0uC/XT5eJLS5/k/Eg9ICx6tV+SlfLqWiFpEH0IuytVNgl4md5LDthJudceB3SLhDHY
         584/jRCncuJIwnDNjB3Xgkti0/Bsof9PHHx+AVTao9Uu4PrrQkdqCXe3ZMNd492s/cWt
         dShDzZb8tkvqjyOf0yw2ZOUhXf62oQLXohy1fLigjxc//rX7w710RbRBA/1pm15BebvU
         FwcYexzDkZXh0sqGR3SEXXnvZcx0I3rocvUH7VrCta5lgKh7/K8uWWzS/OjgBjc6tpJN
         55TczQqgGtTZ4nEpR4cpK25sWXob13ZzQ1/sHdVDI0NjvXVesaXSSHGcqvLlKLXkklsG
         BFAw==
X-Gm-Message-State: ANoB5pkx+xRQ1VZsJ+k9whD3jaeypDBSLQ7/nQh3fX7FYbUzrq1B4u2a
	WA88H7qYG22Nz+1BaI08dnCDDQrUsfMPeQ7vUtM=
X-Google-Smtp-Source: AA0mqf51uIOWkjKSwhAqxTpfKMjsu42I0eiMVKrm0VEx7HQYTsVmieNicP3p40lc7YCyIthr+ry0hUYCl4VWsxspqf0=
X-Received: by 2002:ac8:7dcb:0:b0:3a6:8dd0:4712 with SMTP id
 c11-20020ac87dcb000000b003a68dd04712mr11196833qte.411.1670003278849; Fri, 02
 Dec 2022 09:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org> <20221127-snd-freeze-v8-2-3bc02d09f2ce@chromium.org>
In-Reply-To: <20221127-snd-freeze-v8-2-3bc02d09f2ce@chromium.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 2 Dec 2022 18:47:47 +0100
Message-ID: <CAJZ5v0jbKSTQopEoXW9FpqDmAqp6Pn=-Om5QP2-7ocuGdq8R9w@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] freezer: refactor pm_freezing into a function.
To: Ricardo Ribalda <ribalda@chromium.org>
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org, x86@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, linux-efi@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>, Joel Fernandes <joel@joelfernandes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, sound-open-firmware@alsa-project.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, Takashi Iwai <tiwai@suse.com>, Dexuan Cui <decui@microsoft.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Chromeos Kdump <chromeos-kdump@google.com>, xen-devel@lists.xenproject.org, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@ker
 nel.org>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, kexec@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Eric Biederman <ebiederm@xmission.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 1, 2022 at 12:08 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Add a way to let the drivers know if the processes are frozen.
>
> This is needed by drivers that are waiting for processes to end on their
> shutdown path.
>
> Convert pm_freezing into a function and export it, so it can be used by
> drivers that are either built-in or modules.
>
> Cc: stable@vger.kernel.org
> Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Why can't you export the original pm_freezing variable and why is this
fixing anything?

> ---
>  include/linux/freezer.h |  3 ++-
>  kernel/freezer.c        |  3 +--
>  kernel/power/process.c  | 24 ++++++++++++++++++++----
>  3 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/freezer.h b/include/linux/freezer.h
> index b303472255be..3413c869d68b 100644
> --- a/include/linux/freezer.h
> +++ b/include/linux/freezer.h
> @@ -13,7 +13,7 @@
>  #ifdef CONFIG_FREEZER
>  DECLARE_STATIC_KEY_FALSE(freezer_active);
>
> -extern bool pm_freezing;               /* PM freezing in effect */
> +bool pm_freezing(void);
>  extern bool pm_nosig_freezing;         /* PM nosig freezing in effect */
>
>  /*
> @@ -80,6 +80,7 @@ static inline int freeze_processes(void) { return -ENOSYS; }
>  static inline int freeze_kernel_threads(void) { return -ENOSYS; }
>  static inline void thaw_processes(void) {}
>  static inline void thaw_kernel_threads(void) {}
> +static inline bool pm_freezing(void) { return false; }
>
>  static inline bool try_to_freeze(void) { return false; }
>
> diff --git a/kernel/freezer.c b/kernel/freezer.c
> index 4fad0e6fca64..2d3530ebdb7e 100644
> --- a/kernel/freezer.c
> +++ b/kernel/freezer.c
> @@ -20,7 +20,6 @@ EXPORT_SYMBOL(freezer_active);
>   * indicate whether PM freezing is in effect, protected by
>   * system_transition_mutex
>   */
> -bool pm_freezing;
>  bool pm_nosig_freezing;
>
>  /* protects freezing and frozen transitions */
> @@ -46,7 +45,7 @@ bool freezing_slow_path(struct task_struct *p)
>         if (pm_nosig_freezing || cgroup_freezing(p))
>                 return true;
>
> -       if (pm_freezing && !(p->flags & PF_KTHREAD))
> +       if (pm_freezing() && !(p->flags & PF_KTHREAD))
>                 return true;
>
>         return false;
> diff --git a/kernel/power/process.c b/kernel/power/process.c
> index ddd9988327fe..8a4d0e2c8c20 100644
> --- a/kernel/power/process.c
> +++ b/kernel/power/process.c
> @@ -108,6 +108,22 @@ static int try_to_freeze_tasks(bool user_only)
>         return todo ? -EBUSY : 0;
>  }
>
> +/*
> + * Indicate whether PM freezing is in effect, protected by
> + * system_transition_mutex.
> + */
> +static bool pm_freezing_internal;
> +
> +/**
> + * pm_freezing - indicate whether PM freezing is in effect.
> + *
> + */
> +bool pm_freezing(void)
> +{
> +       return pm_freezing_internal;
> +}
> +EXPORT_SYMBOL(pm_freezing);

Use EXPORT_SYMBOL_GPL() instead, please.

> +
>  /**
>   * freeze_processes - Signal user space processes to enter the refrigerator.
>   * The current thread will not be frozen.  The same process that calls
> @@ -126,12 +142,12 @@ int freeze_processes(void)
>         /* Make sure this task doesn't get frozen */
>         current->flags |= PF_SUSPEND_TASK;
>
> -       if (!pm_freezing)
> +       if (!pm_freezing())
>                 static_branch_inc(&freezer_active);
>
>         pm_wakeup_clear(0);
>         pr_info("Freezing user space processes ... ");
> -       pm_freezing = true;
> +       pm_freezing_internal = true;
>         error = try_to_freeze_tasks(true);
>         if (!error) {
>                 __usermodehelper_set_disable_depth(UMH_DISABLED);
> @@ -187,9 +203,9 @@ void thaw_processes(void)
>         struct task_struct *curr = current;
>
>         trace_suspend_resume(TPS("thaw_processes"), 0, true);
> -       if (pm_freezing)
> +       if (pm_freezing())
>                 static_branch_dec(&freezer_active);
> -       pm_freezing = false;
> +       pm_freezing_internal = false;
>         pm_nosig_freezing = false;
>
>         oom_killer_enable();
>
> --
