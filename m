Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1A544061
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 02:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPfB489Sz3gJf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 10:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=IZXaFH74;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=IZXaFH74;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ9712kr3z3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 00:47:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=p3ITF8gI2GW93+lJzbbS6NFG2q6U7tMgsXybvfaCekw=; b=IZXaFH74aF36MwDA0OcR+zpVbA
	fK18DkOhaaN9C1eG5s1+L4J5X2rdyrZWtHWtryVrvRYiz9kbVuWHWIVzgsfJfxFZ8UgI4eMrcfFM5
	ly+cYznO6PhU6shFXLnvDd0b/G1PXNb75sy24LC6bprnB0FmxiDeLgilEva9+AdZsD25bPgSLsRpe
	GUlfX77jG3iIxErkRylfvAiLV5VrXlgN4oApJfGBzUS+eVMlY/iFt5TC7UePOXm4aRWTFo8vVwc5V
	N9prIiiaKfHEwyVF5x1V2xztOpfeiRRaQZej2V9pcRWXnMPtP3IswDsfj7t5zg4WvO1/IMs6PKgfh
	Vu2f1Ucw==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywww-00ChVo-B5; Wed, 08 Jun 2022 14:46:22 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 58CC930008D;
	Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 3237720C0F991; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Message-ID: <20220608142723.103523089@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH 00/36] cpuidle,rcu: Cleanup the mess
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, virtualizatio
 n@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradea
 d.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com

, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dab
 belt.com, anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All! (omg so many)

These here few patches mostly clear out the utter mess that is cpuidle vs rcuidle.

At the end of the ride there's only 2 real RCU_NONIDLE() users left

  arch/arm64/kernel/suspend.c:            RCU_NONIDLE(__cpu_suspend_exit());
  drivers/perf/arm_pmu.c:                 RCU_NONIDLE(armpmu_start(event, PERF_EF_RELOAD));
  kernel/cfi.c:   RCU_NONIDLE({

(the CFI one is likely dead in the kCFI rewrite) and there's only a hand full
of trace_.*_rcuidle() left:

  kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
  kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
  kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, caller_addr);
  kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, caller_addr);
  kernel/trace/trace_preemptirq.c:                trace_preempt_enable_rcuidle(a0, a1);
  kernel/trace/trace_preemptirq.c:                trace_preempt_disable_rcuidle(a0, a1);

All of them are in 'deprecated' code that is unused for GENERIC_ENTRY.

I've touched a _lot_ of code that I can't test and likely broken some of it :/
In particular, the whole ARM cpuidle stuff was quite involved with OMAP being
the absolute 'winner'.

I'm hoping Mark can help me sort the remaining ARM64 bits as he moves that to
GENERIC_ENTRY. I've also got a note that says ARM64 can probably do a WFE based
idle state and employ TIF_POLLING_NRFLAG to avoid some IPIs.

---
 arch/alpha/kernel/process.c          |    1 
 arch/alpha/kernel/vmlinux.lds.S      |    1 
 arch/arc/kernel/process.c            |    3 +
 arch/arc/kernel/vmlinux.lds.S        |    1 
 arch/arm/include/asm/vmlinux.lds.h   |    1 
 arch/arm/kernel/process.c            |    1 
 arch/arm/kernel/smp.c                |    6 +--
 arch/arm/mach-gemini/board-dt.c      |    3 +
 arch/arm/mach-imx/cpuidle-imx6q.c    |    4 +-
 arch/arm/mach-imx/cpuidle-imx6sx.c   |    5 ++
 arch/arm/mach-omap2/cpuidle34xx.c    |   16 ++++++++
 arch/arm/mach-omap2/cpuidle44xx.c    |   29 +++++++++------
 arch/arm/mach-omap2/pm.h             |    2 -
 arch/arm/mach-omap2/pm34xx.c         |   14 +++++--
 arch/arm/mach-omap2/powerdomain.c    |   10 ++---
 arch/arm64/kernel/idle.c             |    1 
 arch/arm64/kernel/smp.c              |    4 +-
 arch/arm64/kernel/vmlinux.lds.S      |    1 
 arch/csky/kernel/process.c           |    1 
 arch/csky/kernel/smp.c               |    2 -
 arch/csky/kernel/vmlinux.lds.S       |    1 
 arch/hexagon/kernel/process.c        |    1 
 arch/hexagon/kernel/vmlinux.lds.S    |    1 
 arch/ia64/kernel/process.c           |    1 
 arch/ia64/kernel/vmlinux.lds.S       |    1 
 arch/loongarch/kernel/vmlinux.lds.S  |    1 
 arch/m68k/kernel/vmlinux-nommu.lds   |    1 
 arch/m68k/kernel/vmlinux-std.lds     |    1 
 arch/m68k/kernel/vmlinux-sun3.lds    |    1 
 arch/microblaze/kernel/process.c     |    1 
 arch/microblaze/kernel/vmlinux.lds.S |    1 
 arch/mips/kernel/idle.c              |    8 +---
 arch/mips/kernel/vmlinux.lds.S       |    1 
 arch/nios2/kernel/process.c          |    1 
 arch/nios2/kernel/vmlinux.lds.S      |    1 
 arch/openrisc/kernel/process.c       |    1 
 arch/openrisc/kernel/vmlinux.lds.S   |    1 
 arch/parisc/kernel/process.c         |    2 -
 arch/parisc/kernel/vmlinux.lds.S     |    1 
 arch/powerpc/kernel/idle.c           |    5 +-
 arch/powerpc/kernel/vmlinux.lds.S    |    1 
 arch/riscv/kernel/process.c          |    1 
 arch/riscv/kernel/vmlinux-xip.lds.S  |    1 
 arch/riscv/kernel/vmlinux.lds.S      |    1 
 arch/s390/kernel/idle.c              |    1 
 arch/s390/kernel/vmlinux.lds.S       |    1 
 arch/sh/kernel/idle.c                |    1 
 arch/sh/kernel/vmlinux.lds.S         |    1 
 arch/sparc/kernel/leon_pmc.c         |    4 ++
 arch/sparc/kernel/process_32.c       |    1 
 arch/sparc/kernel/process_64.c       |    3 +
 arch/sparc/kernel/vmlinux.lds.S      |    1 
 arch/um/kernel/dyn.lds.S             |    1 
 arch/um/kernel/process.c             |    1 
 arch/um/kernel/uml.lds.S             |    1 
 arch/x86/coco/tdx/tdcall.S           |   15 +-------
 arch/x86/coco/tdx/tdx.c              |   25 +++----------
 arch/x86/events/amd/brs.c            |   13 ++-----
 arch/x86/include/asm/irqflags.h      |   11 ++---
 arch/x86/include/asm/mwait.h         |   14 +++----
 arch/x86/include/asm/nospec-branch.h |    2 -
 arch/x86/include/asm/paravirt.h      |    6 ++-
 arch/x86/include/asm/perf_event.h    |    2 -
 arch/x86/include/asm/shared/io.h     |    4 +-
 arch/x86/include/asm/shared/tdx.h    |    1 
 arch/x86/include/asm/special_insns.h |    6 +--
 arch/x86/include/asm/xen/hypercall.h |    2 -
 arch/x86/kernel/paravirt.c           |   14 ++++++-
 arch/x86/kernel/process.c            |   65 +++++++++++++++++------------------
 arch/x86/kernel/vmlinux.lds.S        |    1 
 arch/x86/xen/enlighten_pv.c          |    2 -
 arch/x86/xen/irq.c                   |    2 -
 arch/xtensa/kernel/process.c         |    1 
 arch/xtensa/kernel/vmlinux.lds.S     |    1 
 drivers/acpi/processor_idle.c        |   46 ++++++++++++++----------
 drivers/base/power/runtime.c         |   24 ++++++------
 drivers/clk/clk.c                    |    8 ++--
 drivers/cpuidle/cpuidle-arm.c        |    1 
 drivers/cpuidle/cpuidle-big_little.c |    8 +++-
 drivers/cpuidle/cpuidle-mvebu-v7.c   |    7 +++
 drivers/cpuidle/cpuidle-psci.c       |   10 +++--
 drivers/cpuidle/cpuidle-qcom-spm.c   |    1 
 drivers/cpuidle/cpuidle-riscv-sbi.c  |   10 +++--
 drivers/cpuidle/cpuidle-tegra.c      |   21 ++++++++---
 drivers/cpuidle/cpuidle.c            |   21 +++++------
 drivers/cpuidle/dt_idle_states.c     |    2 -
 drivers/cpuidle/poll_state.c         |   10 ++++-
 drivers/idle/intel_idle.c            |   29 ++++++++++++---
 include/asm-generic/vmlinux.lds.h    |    9 +---
 include/linux/compiler_types.h       |    8 +++-
 include/linux/cpu.h                  |    3 -
 include/linux/cpuidle.h              |   33 +++++++++++++++++
 include/linux/cpumask.h              |    4 +-
 include/linux/sched/idle.h           |   40 ++++++++++++++++-----
 include/linux/thread_info.h          |   18 +++++++++
 include/linux/tracepoint.h           |   13 ++++++-
 kernel/cpu_pm.c                      |    9 ----
 kernel/printk/printk.c               |    2 -
 kernel/rcu/tree.c                    |    9 +---
 kernel/sched/idle.c                  |   47 +++++++------------------
 kernel/time/tick-broadcast-hrtimer.c |   29 ++++++---------
 kernel/time/tick-broadcast.c         |    6 ++-
 kernel/trace/trace.c                 |    3 +
 tools/objtool/check.c                |   15 +++++++-
 104 files changed, 449 insertions(+), 342 deletions(-)

