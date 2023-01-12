Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABA76685A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:40:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtHz43hVTz3g4T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:40:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TlaXG0Uv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TlaXG0Uv;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFjY1ZMhz3c9R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=nVA2Mm1l3YORbADd6moHHe8hZRGP2vbv/t+d/ET+JHY=; b=TlaXG0UvI5/2makRvuA5VeDU0a
	4qRI7QdjL2xdYtQkDc8A2gDeJm4SgV/ZE4QRpV0RJDXMMB4Ses7eZGFiDTofTYDgr5hwzJFCgjN92
	vjbEtwgBXa7w8/R1TM/dXCqOwghJkDoeZQJX5TmGkr+c4V4wG8XOesTfWGNVPxDj+IWa66EcgnnI+
	N0h0XzCqzVIGmuy6C6fbFV000CEf+CbKGraRaRx5LgxRtmWU3UqYXBQJ9uTZWqnINayTTaNj6FBwG
	4DgvEy1EZkXwsa6PFe7gZwS9WdTNugjk+fRc/F3eGMFukmGi05t3vedt00SILqwwr57VstSzHs3kM
	kK9YAFjw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pG3hA-0045np-38;
	Thu, 12 Jan 2023 19:57:05 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A8EB0300293;
	Thu, 12 Jan 2023 20:57:07 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 892382CCF1F46; Thu, 12 Jan 2023 20:57:07 +0100 (CET)
Message-ID: <20230112194314.845371875@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 20:43:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v3 00/51] cpuidle,rcu: Clean up the mess
X-Mailman-Approved-At: Fri, 13 Jan 2023 07:59:45 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, nsekhar@ti.com, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.
 org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, alim.akhtar@samsung.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org, brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, festevam@gmail.com, boris.ostrovsky
 @oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, linux-mm@kvack.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, mhiramat@kernel.org, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristians
 son@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, andersson@kernel.org, linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All!

The (hopefully) final respin of cpuidle vs rcu cleanup patches. Barring any
objections I'll be queueing these patches in tip/sched/core in the next few
days.

v2: https://lkml.kernel.org/r/20220919095939.761690562@infradead.org

These here patches clean up the mess that is cpuidle vs rcuidle.

At the end of the ride there's only on RCU_NONIDLE user left:

  arch/arm64/kernel/suspend.c:            RCU_NONIDLE(__cpu_suspend_exit());

And I know Mark has been prodding that with something sharp.

The last version was tested by a number of people and I'm hoping to not have
broken anything in the meantime ;-)


Changes since v2:

 - rebased to v6.2-rc3; as available at:
     git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/idle

 - folded: https://lkml.kernel.org/r/Y3UBwYNY15ETUKy9@hirez.programming.kicks-ass.net
   which makes the ARM cpuidle index 0 consistently not use
   CPUIDLE_FLAG_RCU_IDLE, as requested by Ulf.

 - added a few more __always_inline to empty stub functions as found by the
   robot.

 - Used _RET_IP_ instead of _THIS_IP_ in a few placed because of:
   https://github.com/ClangBuiltLinux/linux/issues/263

 - Added new patches to address various robot reports:

     #35:  trace,hardirq: No moar _rcuidle() tracing
     #47:  cpuidle: Ensure ct_cpuidle_enter() is always called from noinstr/__cpuidle
     #48:  cpuidle,arch: Mark all ct_cpuidle_enter() callers __cpuidle
     #49:  cpuidle,arch: Mark all regular cpuidle_state::enter methods __cpuidle
     #50:  cpuidle: Comments about noinstr/__cpuidle
     #51:  context_tracking: Fix noinstr vs KASAN


---
 arch/alpha/kernel/process.c               |  1 -
 arch/alpha/kernel/vmlinux.lds.S           |  1 -
 arch/arc/kernel/process.c                 |  3 ++
 arch/arc/kernel/vmlinux.lds.S             |  1 -
 arch/arm/include/asm/vmlinux.lds.h        |  1 -
 arch/arm/kernel/cpuidle.c                 |  4 +-
 arch/arm/kernel/process.c                 |  1 -
 arch/arm/kernel/smp.c                     |  6 +--
 arch/arm/mach-davinci/cpuidle.c           |  4 +-
 arch/arm/mach-gemini/board-dt.c           |  3 +-
 arch/arm/mach-imx/cpuidle-imx5.c          |  4 +-
 arch/arm/mach-imx/cpuidle-imx6q.c         |  8 ++--
 arch/arm/mach-imx/cpuidle-imx6sl.c        |  4 +-
 arch/arm/mach-imx/cpuidle-imx6sx.c        |  9 ++--
 arch/arm/mach-imx/cpuidle-imx7ulp.c       |  4 +-
 arch/arm/mach-omap2/common.h              |  6 ++-
 arch/arm/mach-omap2/cpuidle34xx.c         | 16 ++++++-
 arch/arm/mach-omap2/cpuidle44xx.c         | 29 +++++++------
 arch/arm/mach-omap2/omap-mpuss-lowpower.c | 12 +++++-
 arch/arm/mach-omap2/pm.h                  |  2 +-
 arch/arm/mach-omap2/pm24xx.c              | 51 +---------------------
 arch/arm/mach-omap2/pm34xx.c              | 14 +++++--
 arch/arm/mach-omap2/pm44xx.c              |  2 +-
 arch/arm/mach-omap2/powerdomain.c         | 10 ++---
 arch/arm/mach-s3c/cpuidle-s3c64xx.c       |  5 +--
 arch/arm64/kernel/cpuidle.c               |  2 +-
 arch/arm64/kernel/idle.c                  |  1 -
 arch/arm64/kernel/smp.c                   |  4 +-
 arch/arm64/kernel/vmlinux.lds.S           |  1 -
 arch/csky/kernel/process.c                |  1 -
 arch/csky/kernel/smp.c                    |  2 +-
 arch/csky/kernel/vmlinux.lds.S            |  1 -
 arch/hexagon/kernel/process.c             |  1 -
 arch/hexagon/kernel/vmlinux.lds.S         |  1 -
 arch/ia64/kernel/process.c                |  1 +
 arch/ia64/kernel/vmlinux.lds.S            |  1 -
 arch/loongarch/kernel/idle.c              |  1 +
 arch/loongarch/kernel/vmlinux.lds.S       |  1 -
 arch/m68k/kernel/vmlinux-nommu.lds        |  1 -
 arch/m68k/kernel/vmlinux-std.lds          |  1 -
 arch/m68k/kernel/vmlinux-sun3.lds         |  1 -
 arch/microblaze/kernel/process.c          |  1 -
 arch/microblaze/kernel/vmlinux.lds.S      |  1 -
 arch/mips/kernel/idle.c                   | 14 +++----
 arch/mips/kernel/vmlinux.lds.S            |  1 -
 arch/nios2/kernel/process.c               |  1 -
 arch/nios2/kernel/vmlinux.lds.S           |  1 -
 arch/openrisc/kernel/process.c            |  1 +
 arch/openrisc/kernel/vmlinux.lds.S        |  1 -
 arch/parisc/kernel/process.c              |  2 -
 arch/parisc/kernel/vmlinux.lds.S          |  1 -
 arch/powerpc/kernel/idle.c                |  5 +--
 arch/powerpc/kernel/vmlinux.lds.S         |  1 -
 arch/riscv/kernel/process.c               |  1 -
 arch/riscv/kernel/vmlinux-xip.lds.S       |  1 -
 arch/riscv/kernel/vmlinux.lds.S           |  1 -
 arch/s390/kernel/idle.c                   |  1 -
 arch/s390/kernel/vmlinux.lds.S            |  1 -
 arch/sh/kernel/idle.c                     |  1 +
 arch/sh/kernel/vmlinux.lds.S              |  1 -
 arch/sparc/kernel/leon_pmc.c              |  4 ++
 arch/sparc/kernel/process_32.c            |  1 -
 arch/sparc/kernel/process_64.c            |  3 +-
 arch/sparc/kernel/vmlinux.lds.S           |  1 -
 arch/um/kernel/dyn.lds.S                  |  1 -
 arch/um/kernel/process.c                  |  1 -
 arch/um/kernel/uml.lds.S                  |  1 -
 arch/x86/boot/compressed/vmlinux.lds.S    |  1 +
 arch/x86/coco/tdx/tdcall.S                | 15 +------
 arch/x86/coco/tdx/tdx.c                   | 25 ++++-------
 arch/x86/events/amd/brs.c                 | 13 +++---
 arch/x86/include/asm/fpu/xcr.h            |  4 +-
 arch/x86/include/asm/irqflags.h           | 11 ++---
 arch/x86/include/asm/mwait.h              | 14 +++----
 arch/x86/include/asm/nospec-branch.h      |  2 +-
 arch/x86/include/asm/paravirt.h           |  6 ++-
 arch/x86/include/asm/perf_event.h         |  2 +-
 arch/x86/include/asm/shared/io.h          |  4 +-
 arch/x86/include/asm/shared/tdx.h         |  1 -
 arch/x86/include/asm/special_insns.h      |  8 ++--
 arch/x86/include/asm/xen/hypercall.h      |  2 +-
 arch/x86/kernel/cpu/bugs.c                |  2 +-
 arch/x86/kernel/fpu/core.c                |  4 +-
 arch/x86/kernel/paravirt.c                | 14 ++++++-
 arch/x86/kernel/process.c                 | 65 ++++++++++++++--------------
 arch/x86/kernel/vmlinux.lds.S             |  1 -
 arch/x86/lib/memcpy_64.S                  |  5 +--
 arch/x86/lib/memmove_64.S                 |  4 +-
 arch/x86/lib/memset_64.S                  |  4 +-
 arch/x86/xen/enlighten_pv.c               |  2 +-
 arch/x86/xen/irq.c                        |  2 +-
 arch/xtensa/kernel/process.c              |  1 +
 arch/xtensa/kernel/vmlinux.lds.S          |  1 -
 drivers/acpi/processor_idle.c             | 28 ++++++++-----
 drivers/base/power/runtime.c              | 24 +++++------
 drivers/clk/clk.c                         |  8 ++--
 drivers/cpuidle/cpuidle-arm.c             |  4 +-
 drivers/cpuidle/cpuidle-big_little.c      | 12 ++++--
 drivers/cpuidle/cpuidle-mvebu-v7.c        | 13 ++++--
 drivers/cpuidle/cpuidle-psci.c            | 26 +++++-------
 drivers/cpuidle/cpuidle-qcom-spm.c        |  4 +-
 drivers/cpuidle/cpuidle-riscv-sbi.c       | 19 +++++----
 drivers/cpuidle/cpuidle-tegra.c           | 31 +++++++++-----
 drivers/cpuidle/cpuidle.c                 | 70 ++++++++++++++++++++++---------
 drivers/cpuidle/dt_idle_states.c          |  2 +-
 drivers/cpuidle/poll_state.c              | 10 ++++-
 drivers/idle/intel_idle.c                 | 19 ++++-----
 drivers/perf/arm_pmu.c                    | 11 +----
 drivers/perf/riscv_pmu_sbi.c              |  8 +---
 include/asm-generic/vmlinux.lds.h         |  9 ++--
 include/linux/clockchips.h                |  4 +-
 include/linux/compiler_types.h            | 18 +++++++-
 include/linux/cpu.h                       |  3 --
 include/linux/cpuidle.h                   | 32 ++++++++++++++
 include/linux/cpumask.h                   |  4 +-
 include/linux/percpu-defs.h               |  2 +-
 include/linux/sched/idle.h                | 40 +++++++++++++-----
 include/linux/thread_info.h               | 18 +++++++-
 include/linux/tracepoint.h                | 15 ++++++-
 kernel/context_tracking.c                 | 12 +++---
 kernel/cpu_pm.c                           |  9 ----
 kernel/printk/printk.c                    |  2 +-
 kernel/sched/idle.c                       | 47 ++++++---------------
 kernel/time/tick-broadcast-hrtimer.c      | 29 ++++++-------
 kernel/time/tick-broadcast.c              |  6 ++-
 kernel/trace/trace.c                      |  3 ++
 kernel/trace/trace_preemptirq.c           | 50 ++++++----------------
 lib/ubsan.c                               |  5 ++-
 mm/kasan/kasan.h                          |  4 ++
 mm/kasan/shadow.c                         | 38 +++++++++++++++++
 tools/objtool/check.c                     | 17 ++++++++
 131 files changed, 617 insertions(+), 523 deletions(-)

