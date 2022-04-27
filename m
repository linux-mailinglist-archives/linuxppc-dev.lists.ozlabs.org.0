Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCD512922
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 03:53:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpdtw69gqz3g5r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:53:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Je1aB/fz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=srs0=gcur=vf=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Je1aB/fz; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpb8R32D1z2xBF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 09:49:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB40461EF7;
 Wed, 27 Apr 2022 23:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16778C385A9;
 Wed, 27 Apr 2022 23:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651103395;
 bh=fUZjHYw9wwKZPDJTueMs+O0QpaDcmLmJGnfVK2U9fDA=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=Je1aB/fze7iTbiS9iJu+ljdypRVlpSNOY2ApvQuQXPIJMcX561LCqFU5KD8NuzITn
 axVegyGDng/no5zGX+N0XJaBX3eCl1u+MBfsPPSUCnAku/LeQQoNnLn0h3GPux3yBk
 VOvYDvtIfUvjSSlCqhYbS9JVxA2AV5YZM/HgUioKVWSI+XcWSCErb9jz9UvrxK1pys
 vStoYHEo4wQDcrF+2d88fEDoby5J66HLtUmYbV1qTrDo2OoFmaqWJaLLn5LoRnwbLY
 cyOzSoD9WN0tR37CmdZFeQgXzlz5t3Jm6TM/uEaGXtF/lFjZIjpGv2bt25uLPFk53d
 hyeP1plId9baA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id AA5975C0B07; Wed, 27 Apr 2022 16:49:54 -0700 (PDT)
Date: Wed, 27 Apr 2022 16:49:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 20/30] panic: Add the panic informational notifier list
Message-ID: <20220427234954.GA3204792@paulmck-ThinkPad-P17-Gen-1>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-21-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-21-gpiccoli@igalia.com>
X-Mailman-Approved-At: Thu, 28 Apr 2022 11:34:03 +1000
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
Reply-To: paulmck@kernel.org
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 linux-xtensa@linux-xtensa.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, Joel Fernandes <joel@joelfernandes.org>,
 linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, mikelley@microsoft.com,
 john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net,
 fabiomirmar@gmail.com, x86@kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 Hari Bathini <hbathini@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, Frederic Weisbecker <frederic@kernel.org>,
 vgoyal@redhat.com, Mike Leach <mike.leach@linaro.org>, pmladek@suse.com,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>, dave.hansen@linux.intel.com,
 Mikko Perttunen <mperttunen@nvidia.com>, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 coresight@lists.linaro.org, Leo Yan <leo.yan@linaro.org>,
 linux-um@lists.infradead.org, Josh Triplett <josh@joshtriplett.org>,
 rostedt@goodmis.org, rcu@vger.kernel.org, gregkh@linuxfoundation.org,
 bp@alien8.de, Nicholas Piggin <npiggin@gmail.com>, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, vkuznets@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 jgross@suse.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 27, 2022 at 07:49:14PM -0300, Guilherme G. Piccoli wrote:
> The goal of this new panic notifier is to allow its users to
> register callbacks to run earlier in the panic path than they
> currently do. This aims at informational mechanisms, like dumping
> kernel offsets and showing device error data (in case it's simple
> registers reading, for example) as well as mechanisms to disable
> log flooding (like hung_task detector / RCU warnings) and the
> tracing dump_on_oops (when enabled).
> 
> Any (non-invasive) information that should be provided before
> kmsg_dump() as well as log flooding preventing code should fit
> here, as long it offers relatively low risk for kdump.
> 
> For now, the patch is almost a no-op, although it changes a bit
> the ordering in which some panic notifiers are executed - specially
> affected by this are the notifiers responsible for disabling the
> hung_task detector / RCU warnings, which now run first. In a
> subsequent patch, the panic path will be refactored, then the
> panic informational notifiers will effectively run earlier,
> before ksmg_dump() (and usually before kdump as well).
> 
> We also defer documenting it all properly in the subsequent
> refactor patch. Finally, while at it, we removed some useless
> header inclusions too.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Cc: Leo Yan <leo.yan@linaro.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Neeraj Upadhyay <quic_neeraju@quicinc.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

From an RCU perspective:

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  arch/arm64/kernel/setup.c                         | 2 +-
>  arch/mips/kernel/relocate.c                       | 2 +-
>  arch/powerpc/kernel/setup-common.c                | 2 +-
>  arch/x86/kernel/setup.c                           | 2 +-
>  drivers/bus/brcmstb_gisb.c                        | 2 +-
>  drivers/hwtracing/coresight/coresight-cpu-debug.c | 4 ++--
>  drivers/soc/tegra/ari-tegra186.c                  | 3 ++-
>  include/linux/panic_notifier.h                    | 1 +
>  kernel/hung_task.c                                | 3 ++-
>  kernel/panic.c                                    | 4 ++++
>  kernel/rcu/tree.c                                 | 1 -
>  kernel/rcu/tree_stall.h                           | 3 ++-
>  kernel/trace/trace.c                              | 2 +-
>  13 files changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 3505789cf4bd..ac2c7e8c9c6a 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -444,7 +444,7 @@ static struct notifier_block arm64_panic_block = {
>  
>  static int __init register_arm64_panic_block(void)
>  {
> -	atomic_notifier_chain_register(&panic_notifier_list,
> +	atomic_notifier_chain_register(&panic_info_list,
>  				       &arm64_panic_block);
>  	return 0;
>  }
> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
> index 56b51de2dc51..650811f2436a 100644
> --- a/arch/mips/kernel/relocate.c
> +++ b/arch/mips/kernel/relocate.c
> @@ -459,7 +459,7 @@ static struct notifier_block kernel_location_notifier = {
>  
>  static int __init register_kernel_offset_dumper(void)
>  {
> -	atomic_notifier_chain_register(&panic_notifier_list,
> +	atomic_notifier_chain_register(&panic_info_list,
>  				       &kernel_location_notifier);
>  	return 0;
>  }
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 1468c3937bf4..d04b8bf8dbc7 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -757,7 +757,7 @@ void __init setup_panic(void)
>  				       &ppc_fadump_block);
>  
>  	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_offset() > 0)
> -		atomic_notifier_chain_register(&panic_notifier_list,
> +		atomic_notifier_chain_register(&panic_info_list,
>  					       &kernel_offset_notifier);
>  
>  	/* Low-level platform-specific routines that should run on panic */
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index c95b9ac5a457..599b25346964 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1266,7 +1266,7 @@ static struct notifier_block kernel_offset_notifier = {
>  
>  static int __init register_kernel_offset_dumper(void)
>  {
> -	atomic_notifier_chain_register(&panic_notifier_list,
> +	atomic_notifier_chain_register(&panic_info_list,
>  					&kernel_offset_notifier);
>  	return 0;
>  }
> diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
> index 1ea7b015e225..c64e087fba7a 100644
> --- a/drivers/bus/brcmstb_gisb.c
> +++ b/drivers/bus/brcmstb_gisb.c
> @@ -486,7 +486,7 @@ static int __init brcmstb_gisb_arb_probe(struct platform_device *pdev)
>  
>  	if (list_is_singular(&brcmstb_gisb_arb_device_list)) {
>  		register_die_notifier(&gisb_die_notifier);
> -		atomic_notifier_chain_register(&panic_notifier_list,
> +		atomic_notifier_chain_register(&panic_info_list,
>  					       &gisb_panic_notifier);
>  	}
>  
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 1874df7c6a73..7b1012454525 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -535,7 +535,7 @@ static int debug_func_init(void)
>  			    &debug_func_knob_fops);
>  
>  	/* Register function to be called for panic */
> -	ret = atomic_notifier_chain_register(&panic_notifier_list,
> +	ret = atomic_notifier_chain_register(&panic_info_list,
>  					     &debug_notifier);
>  	if (ret) {
>  		pr_err("%s: unable to register notifier: %d\n",
> @@ -552,7 +552,7 @@ static int debug_func_init(void)
>  
>  static void debug_func_exit(void)
>  {
> -	atomic_notifier_chain_unregister(&panic_notifier_list,
> +	atomic_notifier_chain_unregister(&panic_info_list,
>  					 &debug_notifier);
>  	debugfs_remove_recursive(debug_debugfs_dir);
>  }
> diff --git a/drivers/soc/tegra/ari-tegra186.c b/drivers/soc/tegra/ari-tegra186.c
> index 02577853ec49..4ef05ebed739 100644
> --- a/drivers/soc/tegra/ari-tegra186.c
> +++ b/drivers/soc/tegra/ari-tegra186.c
> @@ -73,7 +73,8 @@ static struct notifier_block tegra186_ari_panic_nb = {
>  static int __init tegra186_ari_init(void)
>  {
>  	if (of_machine_is_compatible("nvidia,tegra186"))
> -		atomic_notifier_chain_register(&panic_notifier_list, &tegra186_ari_panic_nb);
> +		atomic_notifier_chain_register(&panic_info_list,
> +					       &tegra186_ari_panic_nb);
>  
>  	return 0;
>  }
> diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> index 0bb9dc0dea04..7364a346bcb0 100644
> --- a/include/linux/panic_notifier.h
> +++ b/include/linux/panic_notifier.h
> @@ -7,6 +7,7 @@
>  
>  extern struct atomic_notifier_head panic_notifier_list;
>  extern struct atomic_notifier_head panic_hypervisor_list;
> +extern struct atomic_notifier_head panic_info_list;
>  
>  extern bool crash_kexec_post_notifiers;
>  
> diff --git a/kernel/hung_task.c b/kernel/hung_task.c
> index 52501e5f7655..1b2d7111d5ac 100644
> --- a/kernel/hung_task.c
> +++ b/kernel/hung_task.c
> @@ -85,6 +85,7 @@ hung_task_panic(struct notifier_block *this, unsigned long event, void *ptr)
>  
>  static struct notifier_block panic_block = {
>  	.notifier_call = hung_task_panic,
> +	.priority = INT_MAX, /* run early to prevent potential log flood */
>  };
>  
>  static void check_hung_task(struct task_struct *t, unsigned long timeout)
> @@ -378,7 +379,7 @@ static int watchdog(void *dummy)
>  
>  static int __init hung_task_init(void)
>  {
> -	atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
> +	atomic_notifier_chain_register(&panic_info_list, &panic_block);
>  
>  	/* Disable hung task detector on suspend */
>  	pm_notifier(hungtask_pm_notify, 0);
> diff --git a/kernel/panic.c b/kernel/panic.c
> index ef76f3f9c44d..73ca1bc44e30 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -76,6 +76,9 @@ EXPORT_SYMBOL(panic_notifier_list);
>  ATOMIC_NOTIFIER_HEAD(panic_hypervisor_list);
>  EXPORT_SYMBOL(panic_hypervisor_list);
>  
> +ATOMIC_NOTIFIER_HEAD(panic_info_list);
> +EXPORT_SYMBOL(panic_info_list);
> +
>  static long no_blink(int state)
>  {
>  	return 0;
> @@ -291,6 +294,7 @@ void panic(const char *fmt, ...)
>  	 * add information to the kmsg dump output.
>  	 */
>  	atomic_notifier_call_chain(&panic_hypervisor_list, PANIC_NOTIFIER, buf);
> +	atomic_notifier_call_chain(&panic_info_list, PANIC_NOTIFIER, buf);
>  	atomic_notifier_call_chain(&panic_notifier_list, PANIC_NOTIFIER, buf);
>  
>  	panic_print_sys_info(false);
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index a4b8189455d5..d5a2674ae81c 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -35,7 +35,6 @@
>  #include <linux/panic.h>
>  #include <linux/panic_notifier.h>
>  #include <linux/percpu.h>
> -#include <linux/notifier.h>
>  #include <linux/cpu.h>
>  #include <linux/mutex.h>
>  #include <linux/time.h>
> diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
> index 0c5d8516516a..d8a5840aad5d 100644
> --- a/kernel/rcu/tree_stall.h
> +++ b/kernel/rcu/tree_stall.h
> @@ -97,11 +97,12 @@ static int rcu_panic(struct notifier_block *this, unsigned long ev, void *ptr)
>  
>  static struct notifier_block rcu_panic_block = {
>  	.notifier_call = rcu_panic,
> +	.priority = INT_MAX, /* run early to prevent potential log flood */
>  };
>  
>  static int __init check_cpu_stall_init(void)
>  {
> -	atomic_notifier_chain_register(&panic_notifier_list, &rcu_panic_block);
> +	atomic_notifier_chain_register(&panic_info_list, &rcu_panic_block);
>  	return 0;
>  }
>  early_initcall(check_cpu_stall_init);
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index c1d8a3622ccc..7d02f7a66bb1 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -10138,7 +10138,7 @@ __init static int tracer_alloc_buffers(void)
>  	/* All seems OK, enable tracing */
>  	tracing_disabled = 0;
>  
> -	atomic_notifier_chain_register(&panic_notifier_list,
> +	atomic_notifier_chain_register(&panic_info_list,
>  				       &trace_panic_notifier);
>  
>  	register_die_notifier(&trace_die_notifier);
> -- 
> 2.36.0
> 
