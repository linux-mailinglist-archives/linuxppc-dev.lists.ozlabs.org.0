Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D224728B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 11:15:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCHSV1974z3cCg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 21:15:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.182;
 helo=mail-pf1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCGK917hpz2xYL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 20:23:39 +1100 (AEDT)
Received: by mail-pf1-f182.google.com with SMTP id x131so14344350pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 01:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7JQ6xhDuC8UGs/jm3YR6x8QoCCs8KyehtdxluDCRZKo=;
 b=IUnErhH49a53wpj4Tzhx9efMyyfWaOJvYXIR38En1GLLb4PF92XqSOolRd1CilpTzv
 YvWESrNbL5kM4GSdJt0nC0YyzrGzYQFq6jZA5T2T16BkgWgCToTCuOwfCE9c6vXVAaFn
 UGwwWXcA2fsnOBKNb75sZqUnQ1bLft/n7c7HXPWGyRtv1gTVLv+4w5Qu1CwMK40HB2PE
 12HxlUtZas80tsbFHDEjGmlERPXSrMJIxU8+wEeY1xFiGJQ4wtaBBaUe+4Mv7sqKCjEs
 OGXf5c9s+yk0UFUsWsYAWWLQKRFF2GsweimoHMIfxIyvy0+7tyINVEUAjkpbKnupn/Og
 45YA==
X-Gm-Message-State: AOAM5334Sumu3zFAOqiGjnmlHWsiNzR1UYDlSYJkkX3Z6Z9a1qu4liF4
 Q4k5P3+bBdiUM9VEdHlVfDsx9vHus8T83w==
X-Google-Smtp-Source: ABdhPJzZUDXQ50DUC3HqjEzny757aTqL993MJGY+7xjO/+cf30sOI8EBthPPF1TFtheh/aQirCwEUg==
X-Received: by 2002:a63:b307:: with SMTP id i7mr52968070pgf.445.1639387415625; 
 Mon, 13 Dec 2021 01:23:35 -0800 (PST)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com.
 [209.85.215.182])
 by smtp.gmail.com with ESMTPSA id r16sm9612807pgk.45.2021.12.13.01.23.34
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 01:23:35 -0800 (PST)
Received: by mail-pg1-f182.google.com with SMTP id j11so14040970pgs.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 01:23:34 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr26074577vsj.77.1639387403608; 
 Mon, 13 Dec 2021 01:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com>
 <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
 <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
 <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
 <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
 <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
In-Reply-To: <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Dec 2021 10:23:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXW1bCLkJhC1Jnf2rkS1rBnXsMX=4LMVdXDvMV5HOzrLw@mail.gmail.com>
Message-ID: <CAMuHMdXW1bCLkJhC1Jnf2rkS1rBnXsMX=4LMVdXDvMV5HOzrLw@mail.gmail.com>
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
To: "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 13 Dec 2021 21:14:44 +1100
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
 Linux-sh list <linux-sh@vger.kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 Dmitry Osipenko <digetx@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>, alankao@andestech.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
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
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 10, 2021 at 8:14 PM Rafael J. Wysocki <rafael@kernel.org> wrote=
:
> On Fri, Dec 10, 2021 at 8:04 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> > 10.12.2021 21:27, Rafael J. Wysocki =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Mon, Nov 29, 2021 at 12:34 PM Dmitry Osipenko <digetx@gmail.com> w=
rote:
> > >> 29.11.2021 03:26, Micha=C5=82 Miros=C5=82aw =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
> > >>> On Mon, Nov 29, 2021 at 12:06:19AM +0300, Dmitry Osipenko wrote:
> > >>>> 28.11.2021 03:28, Micha=C5=82 Miros=C5=82aw =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
> > >>>>> On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
> > >>>>>> Add sanity check which ensures that there are no two restart han=
dlers
> > >>>>>> registered with the same priority. Normally it's a direct sign o=
f a
> > >>>>>> problem if two handlers use the same priority.
> > >>>>>
> > >>>>> The patch doesn't ensure the property that there are no duplicate=
d-priority
> > >>>>> entries on the chain.
> > >>>>
> > >>>> It's not the exact point of this patch.
> > >>>>
> > >>>>> I'd rather see a atomic_notifier_chain_register_unique() that ret=
urns
> > >>>>> -EBUSY or something istead of adding an entry with duplicate prio=
rity.
> > >>>>> That way it would need only one list traversal unless you want to
> > >>>>> register the duplicate anyway (then you would call the older
> > >>>>> atomic_notifier_chain_register() after reporting the error).
> > >>>>
> > >>>> The point of this patch is to warn developers about the problem th=
at
> > >>>> needs to be fixed. We already have such troubling drivers in mainl=
ine.
> > >>>>
> > >>>> It's not critical to register different handlers with a duplicated
> > >>>> priorities, but such cases really need to be corrected. We shouldn=
't
> > >>>> break users' machines during transition to the new API, meanwhile
> > >>>> developers should take action of fixing theirs drivers.
> > >>>>
> > >>>>> (Or you could return > 0 when a duplicate is registered in
> > >>>>> atomic_notifier_chain_register() if the callers are prepared
> > >>>>> for that. I don't really like this way, though.)
> > >>>>
> > >>>> I had a similar thought at some point before and decided that I'm =
not in
> > >>>> favor of this approach. It's nicer to have a dedicated function th=
at
> > >>>> verifies the uniqueness, IMO.
> > >>>
> > >>> I don't like the part that it traverses the list second time to che=
ck
> > >>> the uniqueness. But actually you could avoid that if
> > >>> notifier_chain_register() would always add equal-priority entries i=
n
> > >>> reverse order:
> > >>>
> > >>>  static int notifier_chain_register(struct notifier_block **nl,
> > >>>               struct notifier_block *n)
> > >>>  {
> > >>>       while ((*nl) !=3D NULL) {
> > >>>               if (unlikely((*nl) =3D=3D n)) {
> > >>>                       WARN(1, "double register detected");
> > >>>                       return 0;
> > >>>               }
> > >>> -             if (n->priority > (*nl)->priority)
> > >>> +             if (n->priority >=3D (*nl)->priority)
> > >>>                       break;
> > >>>               nl =3D &((*nl)->next);
> > >>>       }
> > >>>       n->next =3D *nl;
> > >>>       rcu_assign_pointer(*nl, n);
> > >>>       return 0;
> > >>>  }
> > >>>
> > >>> Then the check for uniqueness after adding would be:
> > >>>
> > >>>  WARN(nb->next && nb->priority =3D=3D nb->next->priority);
> > >>
> > >> We can't just change the registration order because invocation order=
 of
> > >> the call chain depends on the registration order
> > >
> > > It doesn't if unique priorities are required and isn't that what you =
want?
> > >
> > >> and some of current
> > >> users may rely on that order. I'm pretty sure that changing the orde=
r
> > >> will have unfortunate consequences.
> > >
> > > Well, the WARN() doesn't help much then.
> > >
> > > Either you can make all of the users register with unique priorities,
> > > and then you can make the registration reject non-unique ones, or you
> > > cannot assume them to be unique.
> >
> > There is no strong requirement for priorities to be unique, the reboot.=
c
> > code will work properly.
>
> In which case adding the WARN() is not appropriate IMV.
>
> Also I've looked at the existing code and at least in some cases the
> order in which the notifiers run doesn't matter.  I'm not sure what
> the purpose of this patch is TBH.
>
> > The potential problem is on the user's side and the warning is intended
> > to aid the user.
>
> Unless somebody has the panic_on_warn mentioned previously set and
> really the user need not understand what the WARN() is about.  IOW,
> WARN() helps developers, not users.

Do panic_on_warn and reboot_on_panic play well with having a WARN()
in the reboot notifier handling?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
