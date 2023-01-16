Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C51766D11A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 22:52:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwm306tl2z3fDN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 08:52:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 367 seconds by postgrey-1.36 at boromir; Tue, 17 Jan 2023 04:06:08 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwdhc5gz5z2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 04:06:07 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30C411570;
	Mon, 16 Jan 2023 09:00:09 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.35.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B0403F67D;
	Mon, 16 Jan 2023 08:59:10 -0800 (PST)
Date: Mon, 16 Jan 2023 16:59:04 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 00/51] cpuidle,rcu: Clean up the mess
Message-ID: <Y8WCWAuQSHN651dA@FVFF77S0Q05N.cambridge.arm.com>
References: <20230112194314.845371875@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112194314.845371875@infradead.org>
X-Mailman-Approved-At: Tue, 17 Jan 2023 08:52:03 +1100
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
 org, linux-ia64@vger.kernel.org, alim.akhtar@samsung.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org, brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, festevam@gmail.com, boris.ostrovsky@oracle.com, khilman@k
 ernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, linux-mm@kvack.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, mhiramat@kernel.org, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, ope
 nrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, andersson@kernel.org, linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 08:43:14PM +0100, Peter Zijlstra wrote:
> Hi All!

Hi Peter,

> The (hopefully) final respin of cpuidle vs rcu cleanup patches. Barring any
> objections I'll be queueing these patches in tip/sched/core in the next few
> days.

I'm sorry to have to bear some bad news on that front. :(

I just had a go at testing this on a Juno dev board, using your queue.git
sched/idle branch and defconfig + CONFIG_PROVE_LOCKING=y +
CONFIG_DEBUG_LOCKDEP=y + CONFIG_DEBUG_ATOMIC_SLEEP=y.

With that I consistently see RCU at boot time (log below).

| =============================
| WARNING: suspicious RCU usage
| 6.2.0-rc3-00051-gced9b6eecb31 #1 Not tainted
| -----------------------------
| include/trace/events/ipi.h:19 suspicious rcu_dereference_check() usage!
| 
| other info that might help us debug this:
| 
| 
| rcu_scheduler_active = 2, debug_locks = 1
| RCU used illegally from extended quiescent state!
| no locks held by swapper/0/0.
| 
| stack backtrace:
| CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.2.0-rc3-00051-gced9b6eecb31 #1
| Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, BIOS EDK II May 16 2021
| Call trace:
|  dump_backtrace.part.0+0xe4/0xf0
|  show_stack+0x18/0x30
|  dump_stack_lvl+0x98/0xd4
|  dump_stack+0x18/0x34
|  lockdep_rcu_suspicious+0xf8/0x10c
|  trace_ipi_raise+0x1a8/0x1b0
|  arch_irq_work_raise+0x4c/0x70
|  __irq_work_queue_local+0x48/0x80
|  irq_work_queue+0x50/0x80
|  __wake_up_klogd.part.0+0x98/0xe0
|  defer_console_output+0x20/0x30
|  vprintk+0x98/0xf0
|  _printk+0x5c/0x84
|  lockdep_rcu_suspicious+0x34/0x10c
|  trace_lock_acquire+0x174/0x180
|  lock_acquire+0x3c/0x8c
|  _raw_spin_lock_irqsave+0x70/0x150
|  down_trylock+0x18/0x50
|  __down_trylock_console_sem+0x3c/0xd0
|  console_trylock+0x28/0x90
|  vprintk_emit+0x11c/0x354
|  vprintk_default+0x38/0x4c
|  vprintk+0xd4/0xf0
|  _printk+0x5c/0x84
|  lockdep_rcu_suspicious+0x34/0x10c
|  printk_sprint+0x238/0x240
|  vprintk_store+0x32c/0x4b0
|  vprintk_emit+0x104/0x354
|  vprintk_default+0x38/0x4c
|  vprintk+0xd4/0xf0
|  _printk+0x5c/0x84
|  lockdep_rcu_suspicious+0x34/0x10c
|  trace_irq_disable+0x1ac/0x1b0
|  trace_hardirqs_off+0xe8/0x110
|  cpu_suspend+0x4c/0xfc
|  psci_cpu_suspend_enter+0x58/0x6c
|  psci_enter_idle_state+0x70/0x170
|  cpuidle_enter_state+0xc4/0x464
|  cpuidle_enter+0x38/0x50
|  do_idle+0x230/0x2c0
|  cpu_startup_entry+0x24/0x30
|  rest_init+0x110/0x190
|  arch_post_acpi_subsys_init+0x0/0x18
|  start_kernel+0x6f8/0x738
|  __primary_switched+0xbc/0xc4

IIUC what's happenign here is the PSCI cpuidle driver has entered idle and RCU
is no longer watching when arm64's cpu_suspend() manipulates DAIF. Our
local_daif_*() helpers poke lockdep and tracing, hence the call to
trace_hardirqs_off() and the RCU usage.

I think we need RCU to be watching all the way down to cpu_suspend(), and it's
cpu_suspend() that should actually enter/exit idle context. That and we need to
make cpu_suspend() and the low-level PSCI invocation noinstr.

I'm not sure whether 32-bit will have a similar issue or not.

I'm surprised no-one else who has tested has seen this; I suspect people
haven't enabled lockdep and friends. :/

Thanks,
Mark. 
