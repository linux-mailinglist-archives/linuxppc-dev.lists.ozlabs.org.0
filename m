Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B08546538
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:12:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJGN1wDcz3dyv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:12:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eTVis02L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eTVis02L;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJfHl4Fjpz3blT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 19:41:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jxhFyRA7gcpqWtRQyvyD3abswc2PbVc4FSoswUV5Ukc=; b=eTVis02Li1gUMyvYNvhtQOfPjM
	7jPK+tlnMQu8YlONdKYuGGzg5f4OtA6n+DLuvaVtWLmmwBKEcjK3gJJFZyuUsx9s+WrgcdXDtEGo5
	n/0BitYa/9Tv9a5PHDy4FBaJ0usEOIIGYMMcR/SAKx38GPSteGLT2qjJKdgzgVt9Wb+/EeSMk/GCj
	o7MIldwwpKDLAKlNGDE/FUzTM2RKPEJfDUWHFxb549VYWV718uWBpBWrwfwVc4Y51nI2XmOQdPNke
	dbtUv13RdN1xprVJqbJ/lLZKhjUqu4j3NGqJXLsSZjtm/Jap7nXVhvEByTNVwWiNq35HcNs4n5id9
	tqC7XoNQ==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEen-006Kx5-AX; Thu, 09 Jun 2022 09:40:49 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id B092F981287; Thu,  9 Jun 2022 11:40:46 +0200 (CEST)
Date: Thu, 9 Jun 2022 11:40:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 33/36] cpuidle,omap3: Use WFI for omap3_pm_idle()
Message-ID: <YqHAHpGVe10I8O1z@worktop.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144518.010587032@infradead.org>
 <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
 joel@joelfernandes.org>, Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Hilman <khilman@kernel.org>, linux-csky@vger.kernel.org, Pv-drivers <pv-drivers@vmware.com>, "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, Mel Gorman <mgorman@suse.de>, jacob.jun.pan@linux.intel.com, Yury Norov <yury.norov@gmail.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Vineet Gupta <vgupta@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>, bcain@quicinc.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, David Miller <davem@davemloft.net>, Rich Felker <dalias@libc.org>, Tony Lindgren <tony@atomide.com>, amakhalov@vmware.com, Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zyt
 or.com>, sparclinux <sparclinux@vger.kernel.org>, "op
en list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>, the arch/x86 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Openrisc <openrisc@lists.librecores.org>, Paul Walmsley <paul.walmsley@sifive.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Namhyung Kim <namhyung@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jpoimboe@kernel.org, Juergen Gross <jgross@suse.com>, Michal Simek <monstr@monstr.eu>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, Ivan Kokshay
 sky <ink@jurassic.park.msu.ru>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 08, 2022 at 06:28:33PM +0200, Arnd Bergmann wrote:
> On Wed, Jun 8, 2022 at 4:27 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > arch_cpu_idle() is a very simple idle interface and exposes only a
> > single idle state and is expected to not require RCU and not do any
> > tracing/instrumentation.
> >
> > As such, omap_sram_idle() is not a valid implementation. Replace it
> > with the simple (shallow) omap3_do_wfi() call. Leaving the more
> > complicated idle states for the cpuidle driver.
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> I see similar code in omap2:
> 
> omap2_pm_idle()
>  -> omap2_enter_full_retention()
>      -> omap2_sram_suspend()
> 
> Is that code path safe to use without RCU or does it need a similar change?

It needs a similar change, clearly I was running on fumes to not have
found that when grepping around the omap code :/
