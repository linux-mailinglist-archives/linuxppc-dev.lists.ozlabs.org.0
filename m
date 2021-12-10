Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F0A471E67
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:58:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0RY6dMrz3fg7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:58:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.45; helo=mail-ot1-f45.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9gRQ6T6sz2x9H
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 06:08:34 +1100 (AEDT)
Received: by mail-ot1-f45.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so10511872oto.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 11:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eV+MT/c+cWty36yyN1k88RcKH0yc2be+fuKXycnWnqs=;
 b=gcdCE3ZTshZU/vy6NeeW1l/V7TIaWC8oV5P5Tbn776Nnk/QF1AF2eLLSBYLv/V63Ce
 BcoK2Gluy5fZyP/bzibcEO3aQc846PkZaM4wMm9cYcnZ8RoND3iHI+VNE+82d1JPnqkM
 4WU2H3kJS34AB55/RAcPkDWq4X1N8rO4TB+fFrbK9HA6FAGS+qOEgxKo6kCb2xfEr6hu
 dOkDgYsijqwayvtm5SqnnZwq7lTUMgWhYCsXFHuw4ga3g8h3bIWl595N7RICeYY034rt
 1yAmF+KTfkorEisPousQB697UcWXZpJBGntlgAine/lV6jmbV+RKthg2KSzjUhDFe0Xo
 kPqw==
X-Gm-Message-State: AOAM532F5HiIUkSqkmZi0GAHffArUXZ1Zk8h2c4Je9JmqFUZOOlovMPy
 vYmVTY/NqN0dIw4cIOK09wLBvjaTm01qqQVWYpE=
X-Google-Smtp-Source: ABdhPJz3WnXJDp9MR1neaOhkZU7y1rSVa1ldfWi3aUs9lzZU+HiO7VfKdE35iqJJyDqw6NIr5Fwr8foXDpr2Xp5/alg=
X-Received: by 2002:a05:6830:1e57:: with SMTP id
 e23mr12553404otj.16.1639163312676; 
 Fri, 10 Dec 2021 11:08:32 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-7-digetx@gmail.com>
 <CAJZ5v0ii7tGRDbxw+5GqdyONXvRPznXUqBZd03+pdoAd+pH=JQ@mail.gmail.com>
 <c518ce36-09d2-16a3-cec2-6bab8260e3cf@gmail.com>
In-Reply-To: <c518ce36-09d2-16a3-cec2-6bab8260e3cf@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 20:08:21 +0100
Message-ID: <CAJZ5v0iP_VnNW3ChmdvRFg1gvwvkDGmqtGnf1oVwQxXY303RkQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler()
 fails
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

On Fri, Dec 10, 2021 at 7:54 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 10.12.2021 21:32, Rafael J. Wysocki =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> Emit warning if unregister_restart_handler() fails since it never shou=
ld
> >> fail. This will ease further API development by catching mistakes earl=
y.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  kernel/reboot.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/kernel/reboot.c b/kernel/reboot.c
> >> index e6659ae329f1..f0e7b9c13f6b 100644
> >> --- a/kernel/reboot.c
> >> +++ b/kernel/reboot.c
> >> @@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
> >>   */
> >>  int unregister_restart_handler(struct notifier_block *nb)
> >>  {
> >> -       return atomic_notifier_chain_unregister(&restart_handler_list,=
 nb);
> >> +       return WARN_ON(atomic_notifier_chain_unregister(&restart_handl=
er_list, nb));
> >
> > The only reason why it can fail is if the object pointed to by nb is
> > not in the chain.
>
> I had exactly this case where object wasn't in the chain due to a bug
> and this warning was very helpful.

During the development.  In production it would be rather annoying.

> >  Why WARN() about this?  And what about systems with
> > panic_on_warn set?
>
> That warning condition will never happen normally, only when something
> is seriously wrong.
>
> Those systems with panic_on_warn will get what was they asked for.

They may not be asking for panicking on bugs in the reboot notifier
code, though.  That's what your change is making them panic on.
