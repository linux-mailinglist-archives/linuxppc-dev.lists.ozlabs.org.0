Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 084A55BD72D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:21:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWfKj6XfSz3h48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 08:21:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UQsvU8nl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UQsvU8nl;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWLH45rVhz3bWB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 20:18:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=D+MsKiHRvmSvqyjrleqvhdKjdXvjkJhvT05d1tF3TYc=; b=UQsvU8nlB76xZeTRu6KbAZ5g4A
	v21ezpBG4aDzfKkxxCb9GpmlADJppCf+KVyodO/TEoyudKbqBLCyLdtwrbFAxb0aJ5fwHbEPQQ1N5
	EmuvzVJrRo7TykFnlJ+oN15NWd2VLfXjixEytfV45kWCvhMnssNkUfZVmK3eHsT83TmhrkAy+1rWL
	dSaGj0mA5cA9DiUGq8Uf3dsk4uEicB4ZuKl7D0T57Yf0eK8IdpHZoEAhNRMLiW4K3HehEHlB8w53i
	worbn3yXyIb3FqjM/nTkOkRImrnF50v+k8ux+BswwsADI0NLv4ntoM+CNvwAF6XnPH12b3dM+N70J
	YkBwTAqw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDpA-00E28m-SP; Mon, 19 Sep 2022 10:17:17 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E11F930035F;
	Mon, 19 Sep 2022 12:16:21 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id BF8DF2BA49033; Mon, 19 Sep 2022 12:16:21 +0200 (CEST)
Message-ID: <20220919095939.761690562@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 19 Sep 2022 11:59:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v2 00/44] cpuidle,rcu: Clean up the mess
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, vir
 tualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradea
 d.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org,
  andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All!

At long last, a respin of the cpuidle vs rcu cleanup patches.

v1: https://lkml.kernel.org/r/20220608142723.103523089@infradead.org

These here patches clean up the mess that is cpuidle vs rcuidle.

At the end of the ride there's only on RCU_NONIDLE user left:

  arch/arm64/kernel/suspend.c:            RCU_NONIDLE(__cpu_suspend_exit());

and 'one' trace_*_rcuidle() user:

  kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
  kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
  kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, caller_addr);
  kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, caller_addr);
  kernel/trace/trace_preemptirq.c:                trace_preempt_enable_rcuidle(a0, a1);
  kernel/trace/trace_preemptirq.c:                trace_preempt_disable_rcuidle(a0, a1);

However this last is all in deprecated code that should be unused for GENERIC_ENTRY.

I've touched a lot of code that I can't test and I might've broken something by
accident. In particular the whole ARM cpuidle stuff was quite involved.

Please all; have a look where you haven't already.


New since v1:

 - rebase on top of Frederic's rcu-context-tracking rename fest
 - more omap goodness as per the last discusion (thanks Tony!)
 - removed one more RCU_NONIDLE() from arm64/risc-v perf code
 - ubsan/kasan fixes
 - intel_idle module-param for testing
 - a bunch of extra __always_inline, because compilers are silly.

---
 arch/alpha/kernel/process.c               |  1 -
 arch/alpha/kernel/vmlinux.lds.S           |  1 -
 arch/arc/kernel/process.c                 |  3 ++
 arch/arc/kernel/vmlinux.lds.S             |  1 -
 arch/arm/include/asm/vmlinux.lds.h        |  1 -
 arch/arm/kernel/process.c                 |  1 -
 arch/arm/kernel/smp.c                     |  6 +--
 arch/arm/mach-gemini/board-dt.c           |  3 +-
 arch/arm/mach-imx/cpuidle-imx6q.c         |  4 +-
 arch/arm/mach-imx/cpuidle-imx6sx.c        |  5 ++-
 arch/arm/mach-omap2/common.h              |  6 ++-
 arch/arm/mach-omap2/cpuidle34xx.c         | 16 +++++++-
 arch/arm/mach-omap2/cpuidle44xx.c         | 29 +++++++-------
 arch/arm/mach-omap2/omap-mpuss-lowpower.c | 12 +++++-
 arch/arm/mach-omap2/pm.h                  |  2 +-
 arch/arm/mach-omap2/pm24xx.c              | 51 +-----------------------
 arch/arm/mach-omap2/pm34xx.c              | 14 +++++--
 arch/arm/mach-omap2/pm44xx.c              |  2 +-
 arch/arm/mach-omap2/powerdomain.c         | 10 ++---
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
 arch/mips/kernel/idle.c                   |  8 ++--
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
 arch/x86/coco/tdx/tdx.c                   | 25 ++++--------
 arch/x86/events/amd/brs.c                 | 13 +++----
 arch/x86/include/asm/fpu/xcr.h            |  4 +-
 arch/x86/include/asm/irqflags.h           | 11 ++----
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
 arch/x86/kernel/process.c                 | 65 +++++++++++++++----------------
 arch/x86/kernel/vmlinux.lds.S             |  1 -
 arch/x86/lib/memcpy_64.S                  |  5 +--
 arch/x86/lib/memmove_64.S                 |  4 +-
 arch/x86/lib/memset_64.S                  |  4 +-
 arch/x86/xen/enlighten_pv.c               |  2 +-
 arch/x86/xen/irq.c                        |  2 +-
 arch/xtensa/kernel/process.c              |  1 +
 arch/xtensa/kernel/vmlinux.lds.S          |  1 -
 drivers/acpi/processor_idle.c             | 36 ++++++++++-------
 drivers/base/power/runtime.c              | 24 ++++++------
 drivers/clk/clk.c                         |  8 ++--
 drivers/cpuidle/cpuidle-arm.c             |  1 +
 drivers/cpuidle/cpuidle-big_little.c      |  8 +++-
 drivers/cpuidle/cpuidle-mvebu-v7.c        |  7 ++++
 drivers/cpuidle/cpuidle-psci.c            | 10 +++--
 drivers/cpuidle/cpuidle-qcom-spm.c        |  1 +
 drivers/cpuidle/cpuidle-riscv-sbi.c       | 10 +++--
 drivers/cpuidle/cpuidle-tegra.c           | 21 +++++++---
 drivers/cpuidle/cpuidle.c                 | 21 +++++-----
 drivers/cpuidle/dt_idle_states.c          |  2 +-
 drivers/cpuidle/poll_state.c              | 10 ++++-
 drivers/idle/intel_idle.c                 | 19 +++++----
 drivers/perf/arm_pmu.c                    | 11 +-----
 drivers/perf/riscv_pmu_sbi.c              |  8 +---
 include/asm-generic/vmlinux.lds.h         |  9 ++---
 include/linux/compiler_types.h            |  8 +++-
 include/linux/cpu.h                       |  3 --
 include/linux/cpuidle.h                   | 34 ++++++++++++++++
 include/linux/cpumask.h                   |  4 +-
 include/linux/percpu-defs.h               |  2 +-
 include/linux/sched/idle.h                | 40 ++++++++++++++-----
 include/linux/thread_info.h               | 18 ++++++++-
 include/linux/tracepoint.h                | 13 ++++++-
 kernel/cpu_pm.c                           |  9 -----
 kernel/printk/printk.c                    |  2 +-
 kernel/sched/idle.c                       | 47 +++++++---------------
 kernel/time/tick-broadcast-hrtimer.c      | 29 ++++++--------
 kernel/time/tick-broadcast.c              |  6 ++-
 kernel/trace/trace.c                      |  3 ++
 lib/ubsan.c                               |  5 ++-
 mm/kasan/kasan.h                          |  4 ++
 mm/kasan/shadow.c                         | 38 ++++++++++++++++++
 tools/objtool/check.c                     | 17 ++++++++
 121 files changed, 511 insertions(+), 420 deletions(-)

