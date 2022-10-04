Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE505F4AC9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 23:16:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhr904G6gz2yPm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 08:16:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UiXw6aHZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UiXw6aHZ;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhh9Z01jhz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 02:16:00 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id e11-20020a17090a77cb00b00205edbfd646so18922007pjs.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=J2ppHC6gj92crGPpSrELKUpyhixWpF3W0/4C0ZdDtPI=;
        b=UiXw6aHZigxzPRMUFzDILsNVsAdyFtr3B9KxKEI8m7E01CsajejevTYV7BdP2wsOm/
         HvcPZBMM+TkW28eTt3F1DhxxBtezuv0XTDjtGYW8B2mbElhkTInGpM6vTu+4Ez1+Z4Zl
         CSSAi6wcg4/gLFK0z0F/WRWRc047jLnY5XkW7fk/hHejtLeNbcKkU7CbDUwW9lkytUXr
         cd/OQHjN7wB6eRDMRvJyzU3msr1RCb52XcEzMB0ZW808FTM1QI6i/jSUk70317I5p+kD
         nFmZIjIA0zvgwBAFP/4LpKCKrT0ZRrqcJXuKYGFTLZWpkF7eqaysYMEZs2++diGTMeSz
         qF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=J2ppHC6gj92crGPpSrELKUpyhixWpF3W0/4C0ZdDtPI=;
        b=lY4VQWbRGgRuBx/VHG5IclQvVwsbVT62YOX5ZU3iEQ8f965YDW04bfkC+jRsr/Ykbi
         lmYQumKx+z5f+P1wPqR7CiGi0foseZ6axIhAnR1eX54A7f0UlT1DlU+V1XJxnBi/LCmK
         tTtATCfqz99uuVIvFsiuO/TmsUqaFv8CsayLYdE4W5xGB7akzJbrCEj7hNZCmw9coZdS
         r4bRthxME7EQ2dE425c6LYQV6p6yLQorOAF7+9tdEZdUD8nP//CP8Yxv4BTtpSzmjZfF
         0QFwmNSDuC9Cx7ZFy7vpZcsNrTU+GXHBQUMZpyioSD6xIkq7eLyOhZ9EG46Uqbxk9alh
         bEAg==
X-Gm-Message-State: ACrzQf39tsJLaDV22UF7LT3eJEPpxQyvRW9OBJsg/D98N+NAqt2BYkcW
	xGNjG91SFrZiEfLN4waxGhlin4TOI/uPxfaw75EMpw==
X-Google-Smtp-Source: AMsMyM7n+Vc130we6EQHET/igQcvZPTbfdglKFSS5m9j3dBgMdP/YI1FG0U2Mdd0MJ/1Rl84IgnhjST9lkox2h0baYs=
X-Received: by 2002:a17:90b:1b06:b0:202:cce0:2148 with SMTP id
 nu6-20020a17090b1b0600b00202cce02148mr262733pjb.84.1664896556863; Tue, 04 Oct
 2022 08:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org>
In-Reply-To: <20220919095939.761690562@infradead.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Oct 2022 17:15:20 +0200
Message-ID: <CAPDyKFqwV27k5r8Pqo0bOqKQ2WKfcMdQoua665nA953U36+rXg@mail.gmail.com>
Subject: Re: [PATCH v2 00/44] cpuidle,rcu: Clean up the mess
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:14:24 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, linux-clk@vger.kernel.org, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, linux-sh@vger.kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org, mingo@redhat.com, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, lpieralisi@kernel.org, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, kernel@pengutronix.de, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel
 .com, virtualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, jolsa@kernel.org, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, chenhuacai@kernel.org, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, mturquette@baylibre.com, paul.walmsley@sifive.com, linux@rasmusvillemoes.dk, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, tony@atomide.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.
 pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, anup@brainfault.org, ryabinin.a.a@gmail.com, linux-alpha@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, pv-drivers@vmware.com, hpa@zytor.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, amakhalov@vmware.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, agross@kernel.org, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, atishp@atishpatra.org, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyu
 kov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, linux-hexagon@vger.kernel.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Sept 2022 at 12:18, Peter Zijlstra <peterz@infradead.org> wrote:
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

Thanks for cleaning up the situation!

I have applied this on a plain v6.0 (only one patch had a minor
conflict) and tested this on an ARM64 Dragonboard 410c, which uses
cpuidle-psci and the cpuidle-psci-domain. I didn't observe any
problems, so feel free to add:

Tested-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
