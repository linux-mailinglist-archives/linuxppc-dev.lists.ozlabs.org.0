Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F9D54408A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 02:24:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPwy32clz3hnw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 10:24:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.135; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJLhT1930z3blw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 07:58:31 +1000 (AEST)
Received: from mail-ot1-f53.google.com ([209.85.210.53]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MfbwW-1nWZVT13RA-00g2vU for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun
 2022 23:58:27 +0200
Received: by mail-ot1-f53.google.com with SMTP id a8-20020a05683012c800b0060c027c8afdso5826979otq.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun 2022 14:58:26 -0700 (PDT)
X-Gm-Message-State: AOAM533EQBFb0KS0Ylsfbola1Tl3zK7Z3dAz5mq53RLAiMRNn7AjS5sC
	zc+QorcJjHN6Dutlfa+atyBjjSCOa3mEtJqc8U4=
X-Google-Smtp-Source: ABdhPJzN5kbTwiXruPcKSpnmqojFIl1cGQUBuhNCCdRneCrpSwm0deMOGKvKLmavgOJ05DHkpAoCHNV4Fm5CQu/QOU4=
X-Received: by 2002:a0d:efc2:0:b0:2fe:d2b7:da8 with SMTP id
 y185-20020a0defc2000000b002fed2b70da8mr36982567ywe.42.1654705351589; Wed, 08
 Jun 2022 09:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.188449351@infradead.org>
In-Reply-To: <20220608144517.188449351@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jun 2022 18:22:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2y5+nrQFzhjrTTZe+d57Ug261J3kwLNe8Mu8i2qxtG2w@mail.gmail.com>
Message-ID: <CAK8P3a2y5+nrQFzhjrTTZe+d57Ug261J3kwLNe8Mu8i2qxtG2w@mail.gmail.com>
Subject: Re: [PATCH 20/36] arch/idle: Change arch_cpu_idle() IRQ behaviour
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jhsOR2OLfEmtFaGCck8aElezQtAMAi/hp+7qXSaB7Z4R8W6cVKU
 RgDhJc+l4tbYnMAolFNf26sMPZWodHmepks0bpyhsqzSLZYwZ6g3kIJcH3mouFTkTmqNQU6
 B6OWadRb41yTO4udEW+Zf99UGMn247cYioL9kHQFGFXVAhEabMbxU+30/bVV/7GjZUcqaJi
 NHquoaXYq/R1JbiRYoN6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BvwcjheZQHU=:dK57Ic+Qi5v+yeD8gmMa54
 PVKCuMuFDO8RVNeOEMLtuZzcnhqZ+DKLFFRj8tPEx9rtFatctgh6U29DJ9IrAovFObYnu2FdX
 6y/g8UTRl7fhCOianzyyDdab2KoERSUlBLqaKjBC4un+RbqZdcMcX0nUhH+Jocm5VGz88YkV2
 sfb+DNNW12jDKZUej4cjJpyU+ztG0OhBxi44LFa8/MWW0XLOvyEjy1SJKvCKo6zFJNQfUCm8D
 kHt5q8ccSS4azAyW8xvNDg3GlXfiH9JnH/jyP/Jx6Deqf0yLNGNpIY5TZCI15t9usxDHClIH6
 4WLdylDRssRBUkzDdz7IR4T5aC0JeTqX65WjGr/MufFgMA2nC/lvsYBzrXajjHRrbkey51pIN
 CkA/QAbVqNN1yibOMLpW3JbQNazlfdH7OL3CK6Sm5n5G+gg90lB1hlyeJqLLBcW0kt9dms+q5
 Vfo3mmWnZwrTmwhL8b4NQuEZa5fIu5MwhuFvE1BU6Nsc95WQg//T8MUx7FB4+fUJmHnVzzPPH
 88gtm6zvnBxb9aJ+s8wF/EEHJCdLtl8di0v4cNBbB64yOUfr5wawt4DODacUAtPJ26OKFWniB
 tkcCE0euO+82/kGJ4DcDjx2bbeDh4tfHhIVcrvldZM0L3PHzGLR9jatQXoVy4B64+6ClimXb+
 eHwnGlYSKmyGojCvNT5/06i4NijIhPuGBKZJiDgEWLa7H+mIGDJe5ZxrlH1OXA5LSRv1O6uUD
 z44mV+9SM1CoWrFUA3N/1/a85lPYrJ8u2wP7rYetNqQwl5SG+rNYaow8AiFyKQiW9kKq+Lxrk
 Vy7ETR8+Ikv7Uf/aM7NLxWvtddHMu9ikyPPZkq0J7z8Zh4WrYVproxd8yFeM17WToL3S20Lu3
 iLCdWtU3Vs+0/Av5ljAF0efMuZRQ2d1QMI8oqRD6r4WRE8ni/FG9McfSfkI0LYdIeKG/mjHu9
 U7PnABqgBH1OdwhxSGWgg6bSfTFQcv11UWu+A203ScM49+1kzR7ei
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
> Current arch_cpu_idle() is called with IRQs disabled, but will return
> with IRQs enabled.
>
> However, the very first thing the generic code does after calling
> arch_cpu_idle() is raw_local_irq_disable(). This means that
> architectures that can idle with IRQs disabled end up doing a
> pointless 'enable-disable' dance.
>
> Therefore, push this IRQ disabling into the idle function, meaning
> that those architectures can avoid the pointless IRQ state flipping.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

I think you now need to add the a raw_local_irq_disable(); in loongarch
as well.

       Arnd
