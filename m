Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C160654BD35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:02:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LN2Tl5WRXz3cjF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:02:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csail.mit.edu (client-ip=128.30.2.210; helo=outgoing-stata.csail.mit.edu; envelope-from=srivatsa@csail.mit.edu; receiver=<UNKNOWN>)
X-Greylist: delayed 1964 seconds by postgrey-1.36 at boromir; Tue, 14 Jun 2022 05:23:11 AEST
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu [128.30.2.210])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMM0v3D8Kz2ywl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 05:23:09 +1000 (AEST)
Received: from [77.23.249.31] (helo=srivatsab-a02.vmware.com)
	by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.82)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1o0p7j-0002lx-0j; Mon, 13 Jun 2022 14:49:15 -0400
Subject: Re: [PATCH 29/36] cpuidle,xenpv: Make more PARAVIRT_XXL noinstr clean
To: Peter Zijlstra <peterz@infradead.org>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.759631860@infradead.org>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <510b9b68-7d53-7d4d-5a05-37fbd199eb4b@csail.mit.edu>
Date: Mon, 13 Jun 2022 20:48:49 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220608144517.759631860@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 15 Jun 2022 08:01:46 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, linux-clk@vger.kernel.org, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, virtualiza
 tion@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infra
 dead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.

com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfaul
 t.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/8/22 4:27 PM, Peter Zijlstra wrote:
> vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0xde: call to wbinvd() leaves .noinstr.text section
> vmlinux.o: warning: objtool: default_idle+0x4: call to arch_safe_halt() leaves .noinstr.text section
> vmlinux.o: warning: objtool: xen_safe_halt+0xa: call to HYPERVISOR_sched_op.constprop.0() leaves .noinstr.text section
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>


Regards,
Srivatsa
VMware Photon OS

> ---
>  arch/x86/include/asm/paravirt.h      |    6 ++++--
>  arch/x86/include/asm/special_insns.h |    4 ++--
>  arch/x86/include/asm/xen/hypercall.h |    2 +-
>  arch/x86/kernel/paravirt.c           |   14 ++++++++++++--
>  arch/x86/xen/enlighten_pv.c          |    2 +-
>  arch/x86/xen/irq.c                   |    2 +-
>  6 files changed, 21 insertions(+), 9 deletions(-)
> 
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -168,7 +168,7 @@ static inline void __write_cr4(unsigned
>  	PVOP_VCALL1(cpu.write_cr4, x);
>  }
>  
> -static inline void arch_safe_halt(void)
> +static __always_inline void arch_safe_halt(void)
>  {
>  	PVOP_VCALL0(irq.safe_halt);
>  }
> @@ -178,7 +178,9 @@ static inline void halt(void)
>  	PVOP_VCALL0(irq.halt);
>  }
>  
> -static inline void wbinvd(void)
> +extern noinstr void pv_native_wbinvd(void);
> +
> +static __always_inline void wbinvd(void)
>  {
>  	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV));
>  }
> --- a/arch/x86/include/asm/special_insns.h
> +++ b/arch/x86/include/asm/special_insns.h
> @@ -115,7 +115,7 @@ static inline void wrpkru(u32 pkru)
>  }
>  #endif
>  
> -static inline void native_wbinvd(void)
> +static __always_inline void native_wbinvd(void)
>  {
>  	asm volatile("wbinvd": : :"memory");
>  }
> @@ -179,7 +179,7 @@ static inline void __write_cr4(unsigned
>  	native_write_cr4(x);
>  }
>  
> -static inline void wbinvd(void)
> +static __always_inline void wbinvd(void)
>  {
>  	native_wbinvd();
>  }
> --- a/arch/x86/include/asm/xen/hypercall.h
> +++ b/arch/x86/include/asm/xen/hypercall.h
> @@ -382,7 +382,7 @@ MULTI_stack_switch(struct multicall_entr
>  }
>  #endif
>  
> -static inline int
> +static __always_inline int
>  HYPERVISOR_sched_op(int cmd, void *arg)
>  {
>  	return _hypercall2(int, sched_op, cmd, arg);
> --- a/arch/x86/kernel/paravirt.c
> +++ b/arch/x86/kernel/paravirt.c
> @@ -233,6 +233,11 @@ static noinstr void pv_native_set_debugr
>  	native_set_debugreg(regno, val);
>  }
>  
> +noinstr void pv_native_wbinvd(void)
> +{
> +	native_wbinvd();
> +}
> +
>  static noinstr void pv_native_irq_enable(void)
>  {
>  	native_irq_enable();
> @@ -242,6 +247,11 @@ static noinstr void pv_native_irq_disabl
>  {
>  	native_irq_disable();
>  }
> +
> +static noinstr void pv_native_safe_halt(void)
> +{
> +	native_safe_halt();
> +}
>  #endif
>  
>  enum paravirt_lazy_mode paravirt_get_lazy_mode(void)
> @@ -273,7 +283,7 @@ struct paravirt_patch_template pv_ops =
>  	.cpu.read_cr0		= native_read_cr0,
>  	.cpu.write_cr0		= native_write_cr0,
>  	.cpu.write_cr4		= native_write_cr4,
> -	.cpu.wbinvd		= native_wbinvd,
> +	.cpu.wbinvd		= pv_native_wbinvd,
>  	.cpu.read_msr		= native_read_msr,
>  	.cpu.write_msr		= native_write_msr,
>  	.cpu.read_msr_safe	= native_read_msr_safe,
> @@ -307,7 +317,7 @@ struct paravirt_patch_template pv_ops =
>  	.irq.save_fl		= __PV_IS_CALLEE_SAVE(native_save_fl),
>  	.irq.irq_disable	= __PV_IS_CALLEE_SAVE(pv_native_irq_disable),
>  	.irq.irq_enable		= __PV_IS_CALLEE_SAVE(pv_native_irq_enable),
> -	.irq.safe_halt		= native_safe_halt,
> +	.irq.safe_halt		= pv_native_safe_halt,
>  	.irq.halt		= native_halt,
>  #endif /* CONFIG_PARAVIRT_XXL */
>  
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1019,7 +1019,7 @@ static const typeof(pv_ops) xen_cpu_ops
>  
>  		.write_cr4 = xen_write_cr4,
>  
> -		.wbinvd = native_wbinvd,
> +		.wbinvd = pv_native_wbinvd,
>  
>  		.read_msr = xen_read_msr,
>  		.write_msr = xen_write_msr,
> --- a/arch/x86/xen/irq.c
> +++ b/arch/x86/xen/irq.c
> @@ -24,7 +24,7 @@ noinstr void xen_force_evtchn_callback(v
>  	(void)HYPERVISOR_xen_version(0, NULL);
>  }
>  
> -static void xen_safe_halt(void)
> +static noinstr void xen_safe_halt(void)
>  {
>  	/* Blocking includes an implicit local_irq_enable(). */
>  	if (HYPERVISOR_sched_op(SCHEDOP_block, NULL) != 0)
> 
> 
