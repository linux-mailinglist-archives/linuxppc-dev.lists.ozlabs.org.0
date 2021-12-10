Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3FC471E66
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:57:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0R51G26z3fcS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:57:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.170;
 helo=mail-oi1-f170.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9gNB36Sbz3c4h
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 06:05:46 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id 7so14434540oip.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 11:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c+Gg3IcBrVO+p3DERDiz2wIK2rZh3JBEUqlmxz2Wt9w=;
 b=q5tw5mBphjhln+EwthZRCPqntM7azGW/7GHGpFzdWdpXZvkUrAJO5MKGSM+djksGgn
 QV0H7w6ImnqgA+zMNYsRve168hzHX7pP5djwS2vLQ6hzNH4IOPVylpxD9o9pdKlIUtSj
 fI5y2WVx3gmGGOKYbIDHbu142aIse5dEKWBY6TSIsGt4bmY6XyFMHc5o1kIwaLNa7xt7
 FY9VoOirWTFKB/haxX0F8sLCREzTWzQVsoHNpzALVhkPkjrjbiqnyzuhD0GTenOcfBV7
 uHdnQfOmty2BhrYVRFsMMJ41rHzzuCgo1s8xF436QWrid0rFz5aNL78QIxQ5hNDNnkHZ
 RksQ==
X-Gm-Message-State: AOAM530VqXkJNEX53RqW/T8c9K1DG8hSxDBKdqL8jx4d59m6fPASj7vu
 1oZ6Kgh+c0Q+bni2pRBfSz6EvuS8wTiQtldDxtU=
X-Google-Smtp-Source: ABdhPJyFnxvuCdo/SAuZsTrbeFY0ttrM6VIAZMHiyNGyFieUXOlcjM/63kmCFhhj1nwi5THbS12OxkRKZ5ROskKDe+g=
X-Received: by 2002:aca:eb0b:: with SMTP id j11mr14151206oih.51.1639163143930; 
 Fri, 10 Dec 2021 11:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-4-digetx@gmail.com>
 <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
 <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
In-Reply-To: <e6ff1cea-a168-1cb0-25c5-fb16c681cf4a@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 20:05:32 +0100
Message-ID: <CAJZ5v0gwnY07vg71_NB8RDWyv84FtMsmx7UTDd8TkUd7vFzc6A@mail.gmail.com>
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Dec 10, 2021 at 7:52 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 10.12.2021 21:19, Rafael J. Wysocki =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head =
*nh,
> >> +               struct notifier_block *n)
> >> +{
> >> +       unsigned long flags;
> >> +       bool ret;
> >> +
> >> +       spin_lock_irqsave(&nh->lock, flags);
> >> +       ret =3D notifier_has_unique_priority(&nh->head, n);
> >> +       spin_unlock_irqrestore(&nh->lock, flags);
> >
> > This only works if the caller can prevent new entries from being added
> > to the list at this point or if the caller knows that they cannot be
> > added for some reason, but the kerneldoc doesn't mention this
> > limitation.
>
> I'll update the comment.
>
> ..
> >> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_h=
ead *nh,
> >> +               struct notifier_block *n)
> >> +{
> >> +       bool ret;
> >> +
> >> +       /*
> >> +        * This code gets used during boot-up, when task switching is
> >> +        * not yet working and interrupts must remain disabled. At suc=
h
> >> +        * times we must not call down_read().
> >> +        */
> >> +       if (system_state !=3D SYSTEM_BOOTING)
> >
> > No, please don't do this, it makes the whole thing error-prone.
>
> What should I do then?

First of all, do you know of any users who may want to call this
during early initialization?  If so, then why may they want to do
that?

Depending on the above, I would consider adding a special mechanism for the=
m.

> >> +               down_read(&nh->rwsem);
> >> +
> >> +       ret =3D notifier_has_unique_priority(&nh->head, n);
> >> +
> >> +       if (system_state !=3D SYSTEM_BOOTING)
> >> +               up_read(&nh->rwsem);
> >
> > And still what if a new entry with a non-unique priority is added to
> > the chain at this point?
>
> If entry with a non-unique priority is added after the check, then
> obviously it won't be detected.

Why isn't this a problem?

> I don't understand the question. These
> down/up_read() are the locks that prevent the race, if that's the questio=
n.

Not really, they only prevent the race from occurring while
notifier_has_unique_priority() is running.

If anyone depends on this check for correctness, they need to lock the
rwsem, do the check, do the thing depending on the check while holding
the rwsem and then release the rwsem.  Otherwise it is racy.
