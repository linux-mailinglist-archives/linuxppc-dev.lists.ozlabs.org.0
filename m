Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A95B58536A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 18:30:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvY0Y1xxZz3c2W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jul 2022 02:30:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" header.d=lespinasse.org header.i=@lespinasse.org header.a=ed25519-sha256 header.s=srv-79-ed header.b=z07fAc3s;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=lespinasse.org header.i=@lespinasse.org header.a=rsa-sha256 header.s=srv-79-rsa header.b=I1XE4PG3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lespinasse.org (client-ip=63.205.204.226; helo=server.lespinasse.org; envelope-from=michel@lespinasse.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass header.d=lespinasse.org header.i=@lespinasse.org header.a=ed25519-sha256 header.s=srv-79-ed header.b=z07fAc3s;
	dkim=pass (2048-bit key; secure) header.d=lespinasse.org header.i=@lespinasse.org header.a=rsa-sha256 header.s=srv-79-rsa header.b=I1XE4PG3;
	dkim-atps=neutral
Received: from server.lespinasse.org (server.lespinasse.org [63.205.204.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvNtm64JRz2xHn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 20:25:03 +1000 (AEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=lespinasse.org; i=@lespinasse.org; q=dns/txt; s=srv-79-ed;
 t=1659090298; h=date : from : to : cc : subject : message-id :
 references : mime-version : content-type : in-reply-to : from;
 bh=a/XS8F6DJ0UncG2aNUIYHtQzj6v+HgUrBJ1uNti4iPo=;
 b=z07fAc3s82E8eDjOmWqCiQ8bXbav83TEx3/Re97NlSxxiCQo28PSqhP5HNIn+14JJNint
 RyzSM6g4CHMlWDtCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lespinasse.org;
 i=@lespinasse.org; q=dns/txt; s=srv-79-rsa; t=1659090298; h=date :
 from : to : cc : subject : message-id : references : mime-version :
 content-type : in-reply-to : from;
 bh=a/XS8F6DJ0UncG2aNUIYHtQzj6v+HgUrBJ1uNti4iPo=;
 b=I1XE4PG3J6WdBxHBHPO8gz729jU9NwxFGePQBg2SGh03K5MaVR21Or0F1Ed2fJkedXwqn
 73ZEg9HBg/VtqO2lKkpr4whjhup8i+ouV+MRlyl12YqkOIbBlxYxGShIJKbmEieaOBGjn22
 ZXDWImDNaRHLW7cNGx8eSPR5smKlm5X/Vadfwpk61igIRp4T13wJ8QuAfpZsGCdgjSHCAt3
 xICHC0gdRmgeZ4VsHAxcqkS8UkYtj/62Fy/MANXsihH037ZiFlqRtJ1IH4+gKYbMZ+SX1Jj
 7eSPi+obGVy9GT10OfxqZ1++H06soXF8UFwZNT5FhqZM4eGuNqJqYx1H9gbg==
Received: by server.lespinasse.org (Postfix, from userid 1000)
	id 43C591608FB; Fri, 29 Jul 2022 03:24:58 -0700 (PDT)
Date: Fri, 29 Jul 2022 03:24:58 -0700
From: Michel Lespinasse <michel@lespinasse.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
Message-ID: <20220729102458.GA1695@lespinasse.org>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.172460444@infradead.org>
 <20220725194306.GA14746@lespinasse.org>
 <20220728172053.GA3607379@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728172053.GA3607379@paulmck-ThinkPad-P17-Gen-1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 30 Jul 2022 02:30:06 +1000
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
Cc: Michel Lespinasse <michel@lespinasse.org>, juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org,
  dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, rh0@fb.com, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, josh@joshtriplett.org, khilman@kernel.org, li
 nux-csky@vger.kernel.org, tony@atomide.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, yury.norov@gmail.com, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, monstr@monstr.eu, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, Peter Zijlstra <peterz@infradead.org>, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, Arnd Bergmann <arnd@arndb.de>, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy
 .shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com, pv-drivers@vmware.com, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 28, 2022 at 10:20:53AM -0700, Paul E. McKenney wrote:
> On Mon, Jul 25, 2022 at 12:43:06PM -0700, Michel Lespinasse wrote:
> > On Wed, Jun 08, 2022 at 04:27:27PM +0200, Peter Zijlstra wrote:
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
> > After this change was introduced, I am seeing "WARNING: suspicious RCU
> > usage" when booting a kernel with debug options compiled in. Please
> > see the attached dmesg output. The issue starts with commit 32d4fd5751ea
> > and is still present in v5.19-rc8.
> > 
> > I'm not sure, is this too late to fix or revert in v5.19 final ?
> 
> I finally got a chance to take a quick look at this.
> 
> The rcu_eqs_exit() function is making a lockdep complaint about
> being invoked with interrupts enabled.  This function is called from
> rcu_idle_exit(), which is an expected code path from cpuidle_enter_state()
> via its call to rcu_idle_exit().  Except that rcu_idle_exit() disables
> interrupts before invoking rcu_eqs_exit().
> 
> The only other call to rcu_idle_exit() does not disable interrupts,
> but it is via rcu_user_exit(), which would be a very odd choice for
> cpuidle_enter_state().
> 
> It seems unlikely, but it might be that it is the use of local_irq_save()
> instead of raw_local_irq_save() within rcu_idle_exit() that is causing
> the trouble.  If this is the case, then the commit shown below would
> help.  Note that this commit removes the warning from lockdep, so it
> is necessary to build the kernel with CONFIG_RCU_EQS_DEBUG=y to enable
> equivalent debugging.
> 
> Could you please try your test with the -rce commit shown below applied?

Thanks for looking into it.

After checking out Peter's commit 32d4fd5751ea,
cherry picking your commit ed4ae5eff4b3,
and setting CONFIG_RCU_EQS_DEBUG=y in addition of my usual debug config,
I am now seeing this a few seconds into the boot:

[    3.010650] ------------[ cut here ]------------
[    3.010651] WARNING: CPU: 0 PID: 0 at kernel/sched/clock.c:397 sched_clock_tick+0x27/0x60
[    3.010657] Modules linked in:
[    3.010660] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.19.0-rc1-test-00005-g1be22fea0611 #1
[    3.010662] Hardware name: LENOVO 30BFS44D00/1036, BIOS S03KT51A 01/17/2022
[    3.010663] RIP: 0010:sched_clock_tick+0x27/0x60
[    3.010665] Code: 1f 40 00 53 eb 02 5b c3 66 90 8b 05 2f c3 40 01 85 c0 74 18 65 8b 05 60 88 8f 4e 85 c0 75 0d 65 8b 05 a9 85 8f 4e 85 c0 74 02 <0f> 0b e8 e2 6c 89 00 48 c7 c3 40 d5 02 00
 89 c0 48 03 1c c5 c0 98
[    3.010667] RSP: 0000:ffffffffb2803e28 EFLAGS: 00010002
[    3.010670] RAX: 0000000000000001 RBX: ffffc8ce7fa07060 RCX: 0000000000000001
[    3.010671] RDX: 0000000000000000 RSI: ffffffffb268dd21 RDI: ffffffffb269ab13
[    3.010673] RBP: 0000000000000001 R08: ffffffffffc300d5 R09: 000000000002be80
[    3.010674] R10: 000003625b53183a R11: ffffa012b802b7a4 R12: ffffffffb2aa9e80
[    3.010675] R13: ffffffffb2aa9e00 R14: 0000000000000001 R15: 0000000000000000
[    3.010677] FS:  0000000000000000(0000) GS:ffffa012b8000000(0000) knlGS:0000000000000000
[    3.010678] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.010680] CR2: ffffa012f81ff000 CR3: 0000000c99612001 CR4: 00000000003706f0
[    3.010681] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.010682] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.010683] Call Trace:
[    3.010685]  <TASK>
[    3.010688]  cpuidle_enter_state+0xb7/0x4b0
[    3.010694]  cpuidle_enter+0x29/0x40
[    3.010697]  do_idle+0x1d4/0x210
[    3.010702]  cpu_startup_entry+0x19/0x20
[    3.010704]  rest_init+0x117/0x1a0
[    3.010708]  arch_call_rest_init+0xa/0x10
[    3.010711]  start_kernel+0x6d8/0x6ff
[    3.010716]  secondary_startup_64_no_verify+0xce/0xdb
[    3.010728]  </TASK>
[    3.010729] irq event stamp: 44179
[    3.010730] hardirqs last  enabled at (44179): [<ffffffffb2000ccb>] asm_sysvec_apic_timer_interrupt+0x1b/0x20
[    3.010734] hardirqs last disabled at (44177): [<ffffffffb22003f0>] __do_softirq+0x3f0/0x498
[    3.010736] softirqs last  enabled at (44178): [<ffffffffb2200332>] __do_softirq+0x332/0x498
[    3.010738] softirqs last disabled at (44171): [<ffffffffb16c760b>] irq_exit_rcu+0xab/0xf0
[    3.010741] ---[ end trace 0000000000000000 ]---
