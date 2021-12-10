Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B6A471E5C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:53:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Kl4Hg1z3f2Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:53:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.53; helo=mail-oo1-f53.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9fMT4cx3z2ywb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:20:05 +1100 (AEDT)
Received: by mail-oo1-f53.google.com with SMTP id
 e17-20020a4a8291000000b002c5ee0645e7so2604628oog.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=otNvdkTkoV7wYQ8jKu5rR7dHo6vQCE5BmfrHPdMYTOI=;
 b=m4smvaqLAczc/RH8jHs8YIoTDYSGGlJ4ZsAQPl+SY5Iu5/NE8ALq9aDJvX6g8QM5Mw
 m4sLGb7B1Tr7iFAUeStPT16dtVoiANPipAQDdfuP57z5UiOp1VDiJGfo1SBn+Jh5+ft6
 tRz0hpBdS0ED+myRFseQ0fXb0qqYUeTatBdKfUoJP000pQgHNRJrIqhRdN48QYLcud3V
 j0BN6ZC3t8qdQzUlK8q4bWdSe1jRrJYDRi2OWJNIn1uEVLA/nMaMfmlOwHCcXywyDfyz
 Andxm+pbqSvnCP3TtS8mA6uKLCQvVU71dlNoJGR0Q0rctkFiyqNcLxz2LG3CU4TTiP94
 PX7w==
X-Gm-Message-State: AOAM530Qguzp+Y0/GHNI69/YizG/5WShNRVU/r5yxwPCAYq5YJCfzrUW
 1x2/4Wvcz5E3+VMCIJQIlrwZSVR4KIAH+6hu4xQ=
X-Google-Smtp-Source: ABdhPJwWhlgSTT1XO9DdsJeGtp3+qj/KLI9CFrQ1iXrm/9qKavB6UGr0uIjkNl6uj3XKEKq2VM+aZTVW+dl+zG+2Q+M=
X-Received: by 2002:a4a:1d82:: with SMTP id 124mr9074671oog.91.1639160403307; 
 Fri, 10 Dec 2021 10:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-4-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-4-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:19:52 +0100
Message-ID: <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>, alankao@andestech.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linux-sh list <linux-sh@vger.kernel.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add atomic/blocking_notifier_has_unique_priority() helpers which return
> true if given handler has unique priority.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/notifier.h |  5 +++
>  kernel/notifier.c        | 69 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>
> diff --git a/include/linux/notifier.h b/include/linux/notifier.h
> index 924c9d7c8e73..2c4036f225e1 100644
> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -175,6 +175,11 @@ int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
>
>  bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
>
> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
> +               struct notifier_block *nb);
> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
> +               struct notifier_block *nb);
> +
>  #define NOTIFY_DONE            0x0000          /* Don't care */
>  #define NOTIFY_OK              0x0001          /* Suits me */
>  #define NOTIFY_STOP_MASK       0x8000          /* Don't call further */
> diff --git a/kernel/notifier.c b/kernel/notifier.c
> index b20cb7b9b1f0..7a325b742104 100644
> --- a/kernel/notifier.c
> +++ b/kernel/notifier.c
> @@ -122,6 +122,19 @@ static int notifier_call_chain_robust(struct notifier_block **nl,
>         return ret;
>  }
>
> +static int notifier_has_unique_priority(struct notifier_block **nl,
> +                                       struct notifier_block *n)
> +{
> +       while (*nl && (*nl)->priority >= n->priority) {
> +               if ((*nl)->priority == n->priority && *nl != n)
> +                       return false;
> +
> +               nl = &((*nl)->next);
> +       }
> +
> +       return true;
> +}
> +
>  /*
>   *     Atomic notifier chain routines.  Registration and unregistration
>   *     use a spinlock, and call_chain is synchronized by RCU (no locks).
> @@ -203,6 +216,30 @@ int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
>  EXPORT_SYMBOL_GPL(atomic_notifier_call_chain);
>  NOKPROBE_SYMBOL(atomic_notifier_call_chain);
>
> +/**
> + *     atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
> + *     @nh: Pointer to head of the atomic notifier chain
> + *     @n: Entry in notifier chain to check
> + *
> + *     Checks whether there is another notifier in the chain with the same priority.
> + *     Must be called in process context.
> + *
> + *     Returns true if priority is unique, false otherwise.
> + */
> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
> +               struct notifier_block *n)
> +{
> +       unsigned long flags;
> +       bool ret;
> +
> +       spin_lock_irqsave(&nh->lock, flags);
> +       ret = notifier_has_unique_priority(&nh->head, n);
> +       spin_unlock_irqrestore(&nh->lock, flags);

This only works if the caller can prevent new entries from being added
to the list at this point or if the caller knows that they cannot be
added for some reason, but the kerneldoc doesn't mention this
limitation.

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(atomic_notifier_has_unique_priority);
> +
>  /*
>   *     Blocking notifier chain routines.  All access to the chain is
>   *     synchronized by an rwsem.
> @@ -336,6 +373,38 @@ bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
>  }
>  EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);
>
> +/**
> + *     blocking_notifier_has_unique_priority - Checks whether notifier's priority is unique
> + *     @nh: Pointer to head of the blocking notifier chain
> + *     @n: Entry in notifier chain to check
> + *
> + *     Checks whether there is another notifier in the chain with the same priority.
> + *     Must be called in process context.
> + *
> + *     Returns true if priority is unique, false otherwise.
> + */
> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
> +               struct notifier_block *n)
> +{
> +       bool ret;
> +
> +       /*
> +        * This code gets used during boot-up, when task switching is
> +        * not yet working and interrupts must remain disabled. At such
> +        * times we must not call down_read().
> +        */
> +       if (system_state != SYSTEM_BOOTING)

No, please don't do this, it makes the whole thing error-prone.

> +               down_read(&nh->rwsem);
> +
> +       ret = notifier_has_unique_priority(&nh->head, n);
> +
> +       if (system_state != SYSTEM_BOOTING)
> +               up_read(&nh->rwsem);

And still what if a new entry with a non-unique priority is added to
the chain at this point?

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(blocking_notifier_has_unique_priority);
> +
>  /*
>   *     Raw notifier chain routines.  There is no protection;
>   *     the caller must provide it.  Use at your own risk!
> --
> 2.33.1
>
