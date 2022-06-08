Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E44554407B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 02:19:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPqV3bdyz3hCl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 10:19:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.172; helo=mail-yb1-f172.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJBx01TSYz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 02:08:51 +1000 (AEST)
Received: by mail-yb1-f172.google.com with SMTP id v22so37314163ybd.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun 2022 09:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kprufSUtg2c0Z0Z7k//OQq4qpvnNTKXHCWDLteZACkI=;
        b=wCxtCeaU8SkpZqni9ydQsKHZO3Rok3aeCY9bGQmmke+tHqnwjbcMKR1YWld1gn5Myh
         xWILEiEZc9mjI6ZKoEbGOTxsYTVkIh4QBToJChUw6MXp0bvhQ8ZBaeA6ygl1JFBlYbJ7
         FkBKG4cQONckaxW5hfNNgPwPDwH2eKzoXyOyrVCE1RdirTY23WZ5XFSOpMGeqeBzPphn
         kHXcevlJDDms2LoTXw3LzZhuy098M8TrnEJcV+8l+F6GiAW/4ePLBdBlbVmKAcvWs0WE
         5rg3YpvfBKyyxE6loUwWs4F8xjjUk6vc2eZi4laqJ/GmvTSbLBAhwvRfQrDOJIekZCzl
         hPdg==
X-Gm-Message-State: AOAM533kPwAb+vGSISwPF3ABmyQZ+9GEaEiLw4u8vzBa0VKQv9psaMcH
	sqvXv4sTg2S5GYFlKTmExzjSpEeA1TxSiNiJXMg=
X-Google-Smtp-Source: ABdhPJyG4ZT1DjeY4ERw/W2efwDb4GS4TUltgXoK23+ZW/CgpHQ75Z+ngY7GcqUaxeuwjXh809zcJPBimQ/BOSJe/30=
X-Received: by 2002:a25:d98b:0:b0:65c:9dc9:7a8f with SMTP id
 q133-20020a25d98b000000b0065c9dc97a8fmr34529681ybg.622.1654704528580; Wed, 08
 Jun 2022 09:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144516.172460444@infradead.org>
 <CAJZ5v0gW-zD8Mgghy70f3rFz0QoozCwZ9idyrqtFgA6SWHK5XQ@mail.gmail.com> <YqDEwMDSL1YXdHFH@hirez.programming.kicks-ass.net>
In-Reply-To: <YqDEwMDSL1YXdHFH@hirez.programming.kicks-ass.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 8 Jun 2022 18:08:37 +0200
Message-ID: <CAJZ5v0hFfhxjp5cVNz+JSWcWx5ga1cDccmsqKAVgxp-JWs9upg@mail.gmail.com>
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:55:19 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Benjamin Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>, Alexander Gordeev <agordeev@linux.ibm.com>, srivatsa@csail.mit.edu, linux-arch <linux-arch@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Andy Gross <agross@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, dl-linux-imx <linux-imx@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org, mattst88@gmail.com, Christian Borntraeger <borntraeger@linux.ibm.com>, Michael Turquette <mturquette@baylibre.com>, sammy@sammy.net, Petr Mladek <pmladek@suse.com>, Linux PM <linux-pm@vger.kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, Thomas Gleixner <tglx@
 linutronix.de>, Linux OMAP Mailing List <linux-omap@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, rth@twiddle.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, Sven Schnelle <svens@linux.ibm.com>, jolsa@kernel.org, Paul Mackerras <paulus@samba.org>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, virtualization@lists.linux-foundation.org, James Bottomley <James.Bottomley@hansenpartnership.com>, jcmvbkbc@gmail.com, Thierry Reding <thierry.reding@gmail.com>, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, John Ogness <john.ogness@linutronix.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Linux-sh list <linux-sh@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jon H
 unter <jonathanh@nvidia.com>, Mathieu Desnoyers <math

ieu.desnoyers@efficios.com>, Frederic Weisbecker <frederic@kernel.org>, Len Brown <lenb@kernel.org>, linux-xtensa@linux-xtensa.org, Sascha Hauer <kernel@pengutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-alpha@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, Stafford Horne <shorne@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, chris@zankel.net, Stephen Boyd <sboyd@kernel.org>, dinguyen@kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, lpieralisi@kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Joel Fernandes <joel@joelfernandes.org>, Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Hilman <khilman@kernel.org>, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, Mel Gorman <mgorman@suse.de>, Jacob Pan <jacob.jun.pan@linux.intel.com>, Arnd Bergmann <arnd@arndb.d
 e>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk <linux-clk@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>, bcain@quicinc.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, David Miller <davem@davemloft.net>, Rich Felker <dalias@libc.org>, Tony Lindgren <tony@atomide.com>, amakhalov@vmware.com, Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, anton.ivanov@cambridgegreys.com, jonas@southpole.se, Yury Norov <yury.norov@gmail.com>, Richard Weinberger <richard@nod.at>, the arch/x86 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, "P
 aul E. McKenney" <paulmck@kernel.org>, Heiko Carstens
 <hca@linux.ibm.com>, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra <linux-tegra@vger.kernel.org>, namhyung@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jpoimboe@kernel.org, Juergen Gross <jgross@suse.com>, Michal Simek <monstr@monstr.eu>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, ink@jurassic.park.msu.ru, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 5:48 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Jun 08, 2022 at 05:01:05PM +0200, Rafael J. Wysocki wrote:
> > On Wed, Jun 8, 2022 at 4:47 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > Commit c227233ad64c ("intel_idle: enable interrupts before C1 on
> > > Xeons") wrecked intel_idle in two ways:
> > >
> > >  - must not have tracing in idle functions
> > >  - must return with IRQs disabled
> > >
> > > Additionally, it added a branch for no good reason.
> > >
> > > Fixes: c227233ad64c ("intel_idle: enable interrupts before C1 on Xeons")
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > And do I think correctly that this can be applied without the rest of
> > the series?
>
> Yeah, I don't think this relies on any of the preceding patches. If you
> want to route this through the pm/fixes tree that's fine.

OK, thanks, applied (and I moved the intel_idle() kerneldoc so it is
next to the function to avoid the docs build warning).
