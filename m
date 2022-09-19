Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 796925BD779
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:34:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWfcP0PnYz3f6p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 08:34:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.169; helo=mail-qk1-f169.google.com; envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWT0s2SQzz2yyd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 01:21:31 +1000 (AEST)
Received: by mail-qk1-f169.google.com with SMTP id x18so7411064qkn.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 08:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zwk8/QhMZpatQGQHcLa6CxC1A70tMAO9HDHY25D5feE=;
        b=Q+hCQ3MMj8M7nJ27HYUFZSv8hTHR/E0ASTL8Raisi3fGc/7fPyKb81T3Jz0MXg9hJT
         /V3paR82s+fDgE/5gmNm2NtpEMtIphFPuK0YyCDxiacMRvwshI9UUolnXBw/+XhSGcQA
         bt13dTg0r99WToHnWZ47OFJRSmNvTJmDW076fUpbruge5sw0P56LHUAcNnJMY3K9nrDP
         HUL5hy4tNomExMSoudN1JjRJzPuS92c+2CPsluPTi84x2admy54+XFQAC0GUysTsTE9S
         23v8LFkjihtZqpUX7nRpFvGbxOCE5LL0G5YErR/Y/LcfOsKOrMNHMBBRjNGZq6+edmmy
         ef6w==
X-Gm-Message-State: ACrzQf1K7JCt6h3TEYHEHGNCkFAtVTYbn98ws0ozhoXqBcq6ozf/J1nD
	q4fhaOiYcGhfoRFoTzIA9CqEsHi/UC/9bKOZjZM=
X-Google-Smtp-Source: AMsMyM5cgrHdHMwYAR2D2ZjqABuHY9UEfVqKvTwIhmR6+N901HRJWzEi9ZfhaQwzx+J2b350jxNOS+DoidFDWdYllGY=
X-Received: by 2002:a05:620a:46ac:b0:6ce:3e55:fc21 with SMTP id
 bq44-20020a05620a46ac00b006ce3e55fc21mr12973834qkb.285.1663600885830; Mon, 19
 Sep 2022 08:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org>
In-Reply-To: <20220919095939.761690562@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 19 Sep 2022 17:21:12 +0200
Message-ID: <CAJZ5v0h3y-MRzHmbzrr6B4vBxkkw07LOdCVmBqSS4JDhtGSKXg@mail.gmail.com>
Subject: Re: [PATCH v2 00/44] cpuidle,rcu: Clean up the mess
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 Sep 2022 07:59:18 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Benjamin Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>, Alexander Gordeev <agordeev@linux.ibm.com>, srivatsa@csail.mit.edu, linux-arch <linux-arch@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Andy Gross <agross@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, dl-linux-imx <linux-imx@nxp.com>, vgupta@kernel.org, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Michael Turquette <mturquette@baylibre.com>, sammy@sammy.net, Petr Mladek <pmladek@suse.com>, Linux PM <linux-pm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Lin
 ux OMAP Mailing List <linux-omap@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, andreyknvl@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, Sven Schnelle <svens@linux.ibm.com>, jolsa@kernel.org, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, virtualization@lists.linux-foundation.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, kernel@xen0n.name, Christoph Lameter <cl@linux.com>, linux-s390@vger.kernel.org, vschneid@redhat.com, John Ogness <john.ogness@linutronix.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Linux-sh list <linux-sh@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>, Danie
 l Lezcano <daniel.lezcano@linaro.org>, Jon Hunter <jonathanh@nvidia.com>, Dennis Zhou <dennis@kernel.org>, Len Brown <lenb@kernel.org>, linux-xtensa@linux-xtensa.org, Sascha Hauer <kernel@pengutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-alpha@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, Chris Zankel <chris@zankel.net>, Stephen Boyd <sboyd@kernel.org>, dinguyen@kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Frederic Weisbecker <fweisbec@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Atish Patra <atishp@atishpatra.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, kasan-dev@googlegroups.com, Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Hilman <khilman@kernel.org>, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.i
 nfradead.org, Mel Gorman <mgorman@suse.de>, Jacob Pan <jacob.jun.pan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk <linux-clk@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, bcain@quicinc.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, ryabinin.a.a@gmail.com, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, David Miller <davem@davemloft.net>, Rich Felker <dalias@libc.org>, Tony Lindgren <tony@atomide.com>, amakhalov@vmware.com, Konrad Dybcio <konrad.dybcio@somainline.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Alexander Potapenko <glider@google.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, Yury Norov <yury.norov@gmail.com>, Richard Weinbe
 rger <richard@nod.at>, the arch/x86 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra <linux-tegra@vger.kernel.org>, namhyung@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Juergen Gross <jgross@suse.com>, Michal Simek <monstr@monstr.eu>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 19, 2022 at 12:17 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Hi All!
>
> At long last, a respin of the cpuidle vs rcu cleanup patches.
>
> v1: https://lkml.kernel.org/r/20220608142723.103523089@infradead.org
>
> These here patches clean up the mess that is cpuidle vs rcuidle.
>
> At the end of the ride there's only on RCU_NONIDLE user left:
>
>   arch/arm64/kernel/suspend.c:            RCU_NONIDLE(__cpu_suspend_exit());
>
> and 'one' trace_*_rcuidle() user:
>
>   kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
>   kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
>   kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, caller_addr);
>   kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, caller_addr);
>   kernel/trace/trace_preemptirq.c:                trace_preempt_enable_rcuidle(a0, a1);
>   kernel/trace/trace_preemptirq.c:                trace_preempt_disable_rcuidle(a0, a1);
>
> However this last is all in deprecated code that should be unused for GENERIC_ENTRY.
>
> I've touched a lot of code that I can't test and I might've broken something by
> accident. In particular the whole ARM cpuidle stuff was quite involved.
>
> Please all; have a look where you haven't already.
>
>
> New since v1:
>
>  - rebase on top of Frederic's rcu-context-tracking rename fest
>  - more omap goodness as per the last discusion (thanks Tony!)
>  - removed one more RCU_NONIDLE() from arm64/risc-v perf code
>  - ubsan/kasan fixes
>  - intel_idle module-param for testing
>  - a bunch of extra __always_inline, because compilers are silly.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

for the whole set and let me know if you want me to merge any of these
through cpuidle.

Thanks!

>
> ---
>  arch/alpha/kernel/process.c               |  1 -
>  arch/alpha/kernel/vmlinux.lds.S           |  1 -
>  arch/arc/kernel/process.c                 |  3 ++
>  arch/arc/kernel/vmlinux.lds.S             |  1 -
>  arch/arm/include/asm/vmlinux.lds.h        |  1 -
>  arch/arm/kernel/process.c                 |  1 -
>  arch/arm/kernel/smp.c                     |  6 +--
>  arch/arm/mach-gemini/board-dt.c           |  3 +-
>  arch/arm/mach-imx/cpuidle-imx6q.c         |  4 +-
>  arch/arm/mach-imx/cpuidle-imx6sx.c        |  5 ++-
>  arch/arm/mach-omap2/common.h              |  6 ++-
>  arch/arm/mach-omap2/cpuidle34xx.c         | 16 +++++++-
>  arch/arm/mach-omap2/cpuidle44xx.c         | 29 +++++++-------
>  arch/arm/mach-omap2/omap-mpuss-lowpower.c | 12 +++++-
>  arch/arm/mach-omap2/pm.h                  |  2 +-
>  arch/arm/mach-omap2/pm24xx.c              | 51 +-----------------------
>  arch/arm/mach-omap2/pm34xx.c              | 14 +++++--
>  arch/arm/mach-omap2/pm44xx.c              |  2 +-
>  arch/arm/mach-omap2/powerdomain.c         | 10 ++---
>  arch/arm64/kernel/idle.c                  |  1 -
>  arch/arm64/kernel/smp.c                   |  4 +-
>  arch/arm64/kernel/vmlinux.lds.S           |  1 -
>  arch/csky/kernel/process.c                |  1 -
>  arch/csky/kernel/smp.c                    |  2 +-
>  arch/csky/kernel/vmlinux.lds.S            |  1 -
>  arch/hexagon/kernel/process.c             |  1 -
>  arch/hexagon/kernel/vmlinux.lds.S         |  1 -
>  arch/ia64/kernel/process.c                |  1 +
>  arch/ia64/kernel/vmlinux.lds.S            |  1 -
>  arch/loongarch/kernel/idle.c              |  1 +
>  arch/loongarch/kernel/vmlinux.lds.S       |  1 -
>  arch/m68k/kernel/vmlinux-nommu.lds        |  1 -
>  arch/m68k/kernel/vmlinux-std.lds          |  1 -
>  arch/m68k/kernel/vmlinux-sun3.lds         |  1 -
>  arch/microblaze/kernel/process.c          |  1 -
>  arch/microblaze/kernel/vmlinux.lds.S      |  1 -
>  arch/mips/kernel/idle.c                   |  8 ++--
>  arch/mips/kernel/vmlinux.lds.S            |  1 -
>  arch/nios2/kernel/process.c               |  1 -
>  arch/nios2/kernel/vmlinux.lds.S           |  1 -
>  arch/openrisc/kernel/process.c            |  1 +
>  arch/openrisc/kernel/vmlinux.lds.S        |  1 -
>  arch/parisc/kernel/process.c              |  2 -
>  arch/parisc/kernel/vmlinux.lds.S          |  1 -
>  arch/powerpc/kernel/idle.c                |  5 +--
>  arch/powerpc/kernel/vmlinux.lds.S         |  1 -
>  arch/riscv/kernel/process.c               |  1 -
>  arch/riscv/kernel/vmlinux-xip.lds.S       |  1 -
>  arch/riscv/kernel/vmlinux.lds.S           |  1 -
>  arch/s390/kernel/idle.c                   |  1 -
>  arch/s390/kernel/vmlinux.lds.S            |  1 -
>  arch/sh/kernel/idle.c                     |  1 +
>  arch/sh/kernel/vmlinux.lds.S              |  1 -
>  arch/sparc/kernel/leon_pmc.c              |  4 ++
>  arch/sparc/kernel/process_32.c            |  1 -
>  arch/sparc/kernel/process_64.c            |  3 +-
>  arch/sparc/kernel/vmlinux.lds.S           |  1 -
>  arch/um/kernel/dyn.lds.S                  |  1 -
>  arch/um/kernel/process.c                  |  1 -
>  arch/um/kernel/uml.lds.S                  |  1 -
>  arch/x86/boot/compressed/vmlinux.lds.S    |  1 +
>  arch/x86/coco/tdx/tdcall.S                | 15 +------
>  arch/x86/coco/tdx/tdx.c                   | 25 ++++--------
>  arch/x86/events/amd/brs.c                 | 13 +++----
>  arch/x86/include/asm/fpu/xcr.h            |  4 +-
>  arch/x86/include/asm/irqflags.h           | 11 ++----
>  arch/x86/include/asm/mwait.h              | 14 +++----
>  arch/x86/include/asm/nospec-branch.h      |  2 +-
>  arch/x86/include/asm/paravirt.h           |  6 ++-
>  arch/x86/include/asm/perf_event.h         |  2 +-
>  arch/x86/include/asm/shared/io.h          |  4 +-
>  arch/x86/include/asm/shared/tdx.h         |  1 -
>  arch/x86/include/asm/special_insns.h      |  8 ++--
>  arch/x86/include/asm/xen/hypercall.h      |  2 +-
>  arch/x86/kernel/cpu/bugs.c                |  2 +-
>  arch/x86/kernel/fpu/core.c                |  4 +-
>  arch/x86/kernel/paravirt.c                | 14 ++++++-
>  arch/x86/kernel/process.c                 | 65 +++++++++++++++----------------
>  arch/x86/kernel/vmlinux.lds.S             |  1 -
>  arch/x86/lib/memcpy_64.S                  |  5 +--
>  arch/x86/lib/memmove_64.S                 |  4 +-
>  arch/x86/lib/memset_64.S                  |  4 +-
>  arch/x86/xen/enlighten_pv.c               |  2 +-
>  arch/x86/xen/irq.c                        |  2 +-
>  arch/xtensa/kernel/process.c              |  1 +
>  arch/xtensa/kernel/vmlinux.lds.S          |  1 -
>  drivers/acpi/processor_idle.c             | 36 ++++++++++-------
>  drivers/base/power/runtime.c              | 24 ++++++------
>  drivers/clk/clk.c                         |  8 ++--
>  drivers/cpuidle/cpuidle-arm.c             |  1 +
>  drivers/cpuidle/cpuidle-big_little.c      |  8 +++-
>  drivers/cpuidle/cpuidle-mvebu-v7.c        |  7 ++++
>  drivers/cpuidle/cpuidle-psci.c            | 10 +++--
>  drivers/cpuidle/cpuidle-qcom-spm.c        |  1 +
>  drivers/cpuidle/cpuidle-riscv-sbi.c       | 10 +++--
>  drivers/cpuidle/cpuidle-tegra.c           | 21 +++++++---
>  drivers/cpuidle/cpuidle.c                 | 21 +++++-----
>  drivers/cpuidle/dt_idle_states.c          |  2 +-
>  drivers/cpuidle/poll_state.c              | 10 ++++-
>  drivers/idle/intel_idle.c                 | 19 +++++----
>  drivers/perf/arm_pmu.c                    | 11 +-----
>  drivers/perf/riscv_pmu_sbi.c              |  8 +---
>  include/asm-generic/vmlinux.lds.h         |  9 ++---
>  include/linux/compiler_types.h            |  8 +++-
>  include/linux/cpu.h                       |  3 --
>  include/linux/cpuidle.h                   | 34 ++++++++++++++++
>  include/linux/cpumask.h                   |  4 +-
>  include/linux/percpu-defs.h               |  2 +-
>  include/linux/sched/idle.h                | 40 ++++++++++++++-----
>  include/linux/thread_info.h               | 18 ++++++++-
>  include/linux/tracepoint.h                | 13 ++++++-
>  kernel/cpu_pm.c                           |  9 -----
>  kernel/printk/printk.c                    |  2 +-
>  kernel/sched/idle.c                       | 47 +++++++---------------
>  kernel/time/tick-broadcast-hrtimer.c      | 29 ++++++--------
>  kernel/time/tick-broadcast.c              |  6 ++-
>  kernel/trace/trace.c                      |  3 ++
>  lib/ubsan.c                               |  5 ++-
>  mm/kasan/kasan.h                          |  4 ++
>  mm/kasan/shadow.c                         | 38 ++++++++++++++++++
>  tools/objtool/check.c                     | 17 ++++++++
>  121 files changed, 511 insertions(+), 420 deletions(-)
>
