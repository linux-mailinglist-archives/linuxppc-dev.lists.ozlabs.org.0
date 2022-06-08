Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D6544089
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 02:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPwV5lT7z3hk6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 10:24:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=217.72.192.73; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJKn60M1Yz3bnT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 07:17:28 +1000 (AEST)
Received: from mail-yb1-f181.google.com ([209.85.219.181]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M9Evp-1o4oLt43br-006OjQ for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun
 2022 23:17:23 +0200
Received: by mail-yb1-f181.google.com with SMTP id r1so10034937ybd.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun 2022 14:17:22 -0700 (PDT)
X-Gm-Message-State: AOAM5316hyzNvNU4qsLv91eRc+Q1u23lv6Py0FEhJmpJlyKpHePIVXz8
	CHA7LJVomJc4gvVodyM3YSbbGIc4sxYnr3iacnk=
X-Google-Smtp-Source: ABdhPJzNVjvOg+I4TKoqtI9Mj5r7eGnKl4yZEYVHLzTr22uimte8bgKc1nTgREfDsecVqzQDeuxH8v8jGezndj85u8s=
X-Received: by 2002:a25:e64b:0:b0:663:ffad:eac5 with SMTP id
 d72-20020a25e64b000000b00663ffadeac5mr3789690ybh.550.1654705730388; Wed, 08
 Jun 2022 09:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144518.010587032@infradead.org>
In-Reply-To: <20220608144518.010587032@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jun 2022 18:28:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
Message-ID: <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
Subject: Re: [PATCH 33/36] cpuidle,omap3: Use WFI for omap3_pm_idle()
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:m9UWrk2ovY8IvKWEHnjPOjIc39/BhpwP8Qo6mY+xLyeSzKd/3O2
 tdP3xI869VXjvE655MYG1j3+NUeBTpZlJnO+ZKeIWVm8IUsRO7QYRvO3jSz6BRFtZs4M6p6
 mfaPEUfGA2xSV7WcQL1BBm3PqmJR2FIdCKhGQLw/65X7OSUCCGiRJrzfUBnvtorOd8jFcJQ
 daN/QkU4Ncw/7lrqwxSuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hOqurvyl6/Y=:yMtyWxdlaIIlqg5e0aR9/W
 2SnhoHfuHKaiW8JmUwsORomP3So1pMIduz+usCHyLLYjrnUh/ZSBlnpHg90GDDWDUy+cyQ8Ug
 fGmRvzhFH3rYUtil3PG1EoHe/TE4l/h6KI3p/X5FecZtBZrrYQWKMKnmdRFwxBfAnHULdRUSB
 ctrY5LD6MJOrQs2EbpZHGDFbw4LLBQC9J7D0RzvJhH3jhMZowL1fSKmGSpl94ZHsmfqxc3Uz9
 KYUR1QvVv++Y5tj3XCIZ1PEo2T6sIUMLEDRy+8HKt7LKElG2UR0XE9r3rvLJqWjIOsRDQoL2Y
 csmk6hFK3FLJby31WkmhcwUCQkzgbfbR0eZL4eO5NX6danNr11G6im85Y3unq4y3eMMiGnTqH
 mQnfuniDzYIiIAdyV7cb3EjdvY5yucjWnF95zM6sEcMKOk4/utya8amdjp9xsKuZn/9Vl3ei8
 YUh3znnYn5PMw+NLGOM9kY7llv/ycQuOjA18RgCmp1AbALz+ZWuCFnzccV2MWJ0BuFDvy3OHW
 CSfZ5WMVk6ILsPXAaLolWa9UbbOXifpsnO7518DCYMyUJMD4/fTXdVwASJ9cfwPd/ZSWWImQQ
 aJbW+F0Oda63rwaXop2yzBMmvyDhAShCJ0tNqsSwStdYvcWW5Po8LU2y5e3/IU995r7YGSvFa
 H3E9DJUcBFlWLTBKudqTWAQX0jZoE4ccYlbh1UYJsQ69WYqFCBhQLd2+pHbpiWoiiywnrBYXs
 YeGa3FcEWEOQ/9RlyLKlpySAdKLx7vMwGd/tgDPJ1KlWOYMuilFIdb41F9GaSYGq4jdq4vcpL
 bNGGUteUYVmMZ7zKqDr8VOrQVQKaTbLIY/DVys4o/vc7X8L02GCRm1ETwQS/APrYD0W1EMlVS
 2HerG5cQc8z+dDesYtoEmcxDMPsNBrI70H3fy+q+g=
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rafael Wysocki <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Ben Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>, Alexander Gordeev <agordeev@linux.ibm.com>, srivatsa@csail.mit.edu, linux-arch <linux-arch@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Andy Gross <agross@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, NXP Linux Team <linux-imx@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Michael Turquette <mturquette@baylibre.com>, Sam Creasey <sammy@sammy.net>, Petr Mladek <pmladek@suse.com>, Linux PM list <linux-pm@vger.kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um <linux-um@lists.infrade
 ad.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-omap <linux-omap@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Richard Henderson <rth@twiddle.net>, gregkh <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Paul Mackerras <paulus@samba.org>, Mark Rutland <mark.rutland@arm.com>, "open list:IA64 \(Itanium\) PLATFORM" <linux-ia64@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Xuerui Wang <kernel@xen0n.name>, quic_neeraju@quicinc.com, linux-s390 <linux-s390@vger.kernel.org>, vschneid@redhat.com, John Ogn
 ess <john.ogness@linutronix.de>, Yoshinori Sato <ysat

o@users.sourceforge.jp>, Linux-sh list <linux-sh@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Frederic Weisbecker <frederic@kernel.org>, Len Brown <lenb@kernel.org>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Sascha Hauer <kernel@pengutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Stafford Horne <shorne@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Chris Zankel <chris@zankel.net>, Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Daniel Bristot de Oliveira <bristot@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, lpieralisi@kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Joel Fernandes <
 joel@joelfernandes.org>, Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Hilman <khilman@kernel.org>, linux-csky@vger.kernel.org, Pv-drivers <pv-drivers@vmware.com>, "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, Mel Gorman <mgorman@suse.de>, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Vineet Gupta <vgupta@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>, bcain@quicinc.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, David Miller <davem@davemloft.net>, Rich Felker <dalias@libc.org>, Tony Lindgren <tony@atomide.com>, amakhalov@vmware.com, Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.c
 om>, sparclinux <sparclinux@vger.kernel.org>, "open l
ist:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, Yury Norov <yury.norov@gmail.com>, Richard Weinberger <richard@nod.at>, the arch/x86 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Openrisc <openrisc@lists.librecores.org>, Paul Walmsley <paul.walmsley@sifive.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Namhyung Kim <namhyung@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jpoimboe@kernel.org, Juergen Gross <jgross@suse.com>, Michal Simek <monstr@monstr.eu>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anu
 p@brainfault.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 4:27 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> arch_cpu_idle() is a very simple idle interface and exposes only a
> single idle state and is expected to not require RCU and not do any
> tracing/instrumentation.
>
> As such, omap_sram_idle() is not a valid implementation. Replace it
> with the simple (shallow) omap3_do_wfi() call. Leaving the more
> complicated idle states for the cpuidle driver.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

I see similar code in omap2:

omap2_pm_idle()
 -> omap2_enter_full_retention()
     -> omap2_sram_suspend()

Is that code path safe to use without RCU or does it need a similar change?

        Arnd
