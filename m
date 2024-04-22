Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 810138ACF13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 16:12:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XZI2g4Uq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNRzK1D4Dz3dRK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 00:12:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XZI2g4Uq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNRyZ0wptz3cWD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 00:12:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA3F260DDE;
	Mon, 22 Apr 2024 14:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAD5C32783;
	Mon, 22 Apr 2024 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713795123;
	bh=63rvt2yz8r57hl8myRcuStiGVHTSpmv479F+BVPlgOk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XZI2g4UqcleGPHMCMSqV3/iC7oJP0tZWbpfXP00rfR9bLCRfpzFMwC9X4q54oxXMM
	 DnhZrHtKfWP5KsKR0UwBwIDd4eHpEkLzxxX7LPi42cCObWXCldmkT2ETPDxFRfwhiK
	 nyXLCvvf3mWcIJjGAf2BRpg+sGk/r9FACse9FCIZKTAIMRKChgqXwhJ7CqFLLV8oy/
	 QLrmKiFkxPB4YBmwLg/Hf4QkKGO2SUvS8pCcc0bNoMWOtMRS3u0h3n+olJg1vGec5V
	 55mbL/zgu8a6qrqHPaT4tJ+d8LCTGjRW/TTRHz6/VaV0UanNJA0VfQalKnV9xzPuaQ
	 EUKZMBGXl8nFQ==
Date: Mon, 22 Apr 2024 23:11:51 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v5 14/15] kprobes: remove dependency on CONFIG_MODULES
Message-Id: <20240422231151.0d7c18ec1917887c7f323d4c@kernel.org>
In-Reply-To: <20240422094436.3625171-15-rppt@kernel.org>
References: <20240422094436.3625171-1-rppt@kernel.org>
	<20240422094436.3625171-15-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Over
 street <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Apr 2024 12:44:35 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> kprobes depended on CONFIG_MODULES because it has to allocate memory for
> code.
> 
> Since code allocations are now implemented with execmem, kprobes can be
> enabled in non-modular kernels.
> 
> Add #ifdef CONFIG_MODULE guards for the code dealing with kprobes inside
> modules, make CONFIG_KPROBES select CONFIG_EXECMEM and drop the
> dependency of CONFIG_KPROBES on CONFIG_MODULES.

Looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you!

> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/Kconfig                |  2 +-
>  include/linux/module.h      |  9 ++++++
>  kernel/kprobes.c            | 55 +++++++++++++++++++++++--------------
>  kernel/trace/trace_kprobe.c | 20 +++++++++++++-
>  4 files changed, 63 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 7006f71f0110..a48ce6a488b3 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -52,9 +52,9 @@ config GENERIC_ENTRY
>  
>  config KPROBES
>  	bool "Kprobes"
> -	depends on MODULES
>  	depends on HAVE_KPROBES
>  	select KALLSYMS
> +	select EXECMEM
>  	select TASKS_RCU if PREEMPTION
>  	help
>  	  Kprobes allows you to trap at almost any kernel address and
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 1153b0d99a80..ffa1c603163c 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -605,6 +605,11 @@ static inline bool module_is_live(struct module *mod)
>  	return mod->state != MODULE_STATE_GOING;
>  }
>  
> +static inline bool module_is_coming(struct module *mod)
> +{
> +        return mod->state == MODULE_STATE_COMING;
> +}
> +
>  struct module *__module_text_address(unsigned long addr);
>  struct module *__module_address(unsigned long addr);
>  bool is_module_address(unsigned long addr);
> @@ -857,6 +862,10 @@ void *dereference_module_function_descriptor(struct module *mod, void *ptr)
>  	return ptr;
>  }
>  
> +static inline bool module_is_coming(struct module *mod)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_MODULES */
>  
>  #ifdef CONFIG_SYSFS
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index ddd7cdc16edf..ca2c6cbd42d2 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1588,7 +1588,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  	}
>  
>  	/* Get module refcount and reject __init functions for loaded modules. */
> -	if (*probed_mod) {
> +	if (IS_ENABLED(CONFIG_MODULES) && *probed_mod) {
>  		/*
>  		 * We must hold a refcount of the probed module while updating
>  		 * its code to prohibit unexpected unloading.
> @@ -1603,12 +1603,13 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  		 * kprobes in there.
>  		 */
>  		if (within_module_init((unsigned long)p->addr, *probed_mod) &&
> -		    (*probed_mod)->state != MODULE_STATE_COMING) {
> +		    !module_is_coming(*probed_mod)) {
>  			module_put(*probed_mod);
>  			*probed_mod = NULL;
>  			ret = -ENOENT;
>  		}
>  	}
> +
>  out:
>  	preempt_enable();
>  	jump_label_unlock();
> @@ -2488,24 +2489,6 @@ int kprobe_add_area_blacklist(unsigned long start, unsigned long end)
>  	return 0;
>  }
>  
> -/* Remove all symbols in given area from kprobe blacklist */
> -static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
> -{
> -	struct kprobe_blacklist_entry *ent, *n;
> -
> -	list_for_each_entry_safe(ent, n, &kprobe_blacklist, list) {
> -		if (ent->start_addr < start || ent->start_addr >= end)
> -			continue;
> -		list_del(&ent->list);
> -		kfree(ent);
> -	}
> -}
> -
> -static void kprobe_remove_ksym_blacklist(unsigned long entry)
> -{
> -	kprobe_remove_area_blacklist(entry, entry + 1);
> -}
> -
>  int __weak arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
>  				   char *type, char *sym)
>  {
> @@ -2570,6 +2553,25 @@ static int __init populate_kprobe_blacklist(unsigned long *start,
>  	return ret ? : arch_populate_kprobe_blacklist();
>  }
>  
> +#ifdef CONFIG_MODULES
> +/* Remove all symbols in given area from kprobe blacklist */
> +static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
> +{
> +	struct kprobe_blacklist_entry *ent, *n;
> +
> +	list_for_each_entry_safe(ent, n, &kprobe_blacklist, list) {
> +		if (ent->start_addr < start || ent->start_addr >= end)
> +			continue;
> +		list_del(&ent->list);
> +		kfree(ent);
> +	}
> +}
> +
> +static void kprobe_remove_ksym_blacklist(unsigned long entry)
> +{
> +	kprobe_remove_area_blacklist(entry, entry + 1);
> +}
> +
>  static void add_module_kprobe_blacklist(struct module *mod)
>  {
>  	unsigned long start, end;
> @@ -2672,6 +2674,17 @@ static struct notifier_block kprobe_module_nb = {
>  	.priority = 0
>  };
>  
> +static int kprobe_register_module_notifier(void)
> +{
> +	return register_module_notifier(&kprobe_module_nb);
> +}
> +#else
> +static int kprobe_register_module_notifier(void)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_MODULES */
> +
>  void kprobe_free_init_mem(void)
>  {
>  	void *start = (void *)(&__init_begin);
> @@ -2731,7 +2744,7 @@ static int __init init_kprobes(void)
>  	if (!err)
>  		err = register_die_notifier(&kprobe_exceptions_nb);
>  	if (!err)
> -		err = register_module_notifier(&kprobe_module_nb);
> +		err = kprobe_register_module_notifier();
>  
>  	kprobes_initialized = (err == 0);
>  	kprobe_sysctls_init();
> diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> index 14099cc17fc9..2cb2a3951b4f 100644
> --- a/kernel/trace/trace_kprobe.c
> +++ b/kernel/trace/trace_kprobe.c
> @@ -111,6 +111,7 @@ static nokprobe_inline bool trace_kprobe_within_module(struct trace_kprobe *tk,
>  	return strncmp(module_name(mod), name, len) == 0 && name[len] == ':';
>  }
>  
> +#ifdef CONFIG_MODULES
>  static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
>  {
>  	char *p;
> @@ -129,6 +130,12 @@ static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
>  
>  	return ret;
>  }
> +#else
> +static inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
> +{
> +	return false;
> +}
> +#endif
>  
>  static bool trace_kprobe_is_busy(struct dyn_event *ev)
>  {
> @@ -670,6 +677,7 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
>  	return ret;
>  }
>  
> +#ifdef CONFIG_MODULES
>  /* Module notifier call back, checking event on the module */
>  static int trace_kprobe_module_callback(struct notifier_block *nb,
>  				       unsigned long val, void *data)
> @@ -704,6 +712,16 @@ static struct notifier_block trace_kprobe_module_nb = {
>  	.notifier_call = trace_kprobe_module_callback,
>  	.priority = 1	/* Invoked after kprobe module callback */
>  };
> +static int trace_kprobe_register_module_notifier(void)
> +{
> +	return register_module_notifier(&trace_kprobe_module_nb);
> +}
> +#else
> +static int trace_kprobe_register_module_notifier(void)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_MODULES */
>  
>  static int count_symbols(void *data, unsigned long unused)
>  {
> @@ -1933,7 +1951,7 @@ static __init int init_kprobe_trace_early(void)
>  	if (ret)
>  		return ret;
>  
> -	if (register_module_notifier(&trace_kprobe_module_nb))
> +	if (trace_kprobe_register_module_notifier())
>  		return -EINVAL;
>  
>  	return 0;
> -- 
> 2.43.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
