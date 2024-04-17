Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 864E68A8F09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 00:57:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DIgtuj13;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKbry2BDWz3cjm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 08:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DIgtuj13;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=masami.hiramatsu@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKYcb75GCz3cNC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 07:16:30 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso226066b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 14:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713388587; x=1713993387; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bn6gtyCUSwijw+6XX0qI9C//f05i55ZPnAFUJjnUL90=;
        b=DIgtuj13wXd9JhhQvyufysnP8FklLvf3dkcdQMKJDsBG5DUS1Vk7XStc1R6CJu7FVg
         B2fSFQYv3SNWRVJQYOd2jsc4OAqlYhqmJ9oRAfvC0jLCdVB0w0In1Eg/F7JPmKXLy7WN
         fG55egv9NcknzO/p/trYglJidrYHxzi8WoSLxWs3w+fEXfksFHpwxiLHCCEXZ5I7CGyC
         aO+9vDwA94ES4sqAYIrdbTwwJcmNKAawhsddWR2guKbX1cWNvOWzbm9IvAJ34lpMnyJD
         pFEv6DaJ5k3ZO4GX4R8vaglxfFOoGiwbwhDkRbcNNHO8uicDhtCPh5Uo15y8eE88tecu
         pNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713388587; x=1713993387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bn6gtyCUSwijw+6XX0qI9C//f05i55ZPnAFUJjnUL90=;
        b=JEoKQiCIJmXgV3mRlmfDuor2a9KYEucL9NDlaEKyw0b5SDGabyZ1NTdeXPspXjOKQj
         NCjVEoVQjyd2HiaGnodUWVQjx2qedg8oHWt5ciamX4K5koHEfRKxOvSde/gpDJR+KGWk
         XrKRm3tgam47yB/dp3N8IFk4605S6Y6hIcNaaCGVv793lOHYANR4ZEP1bU6BEpHpodBS
         qfQKr44/8LcG1l3qaZVrVKSeQMaX00yvQRTW+/5itXKoaola5lT5vjnqmIAlNv22r8nJ
         mzznUhsrrEXdhuazuQyBRuXNlbQUdOeqH3iLaerzresRO29GPZlrUgv31NmmYKRimtSX
         hlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwsIX74E3LAnRaWqO3wfPYxoFpy+XVtr7gOb8JrYcv1Lh/+NdK8fGbJpZQIkdiz0rjt+l+uFFAUtUDSYgb6RxTyoWe0A6vNS9oYNNz6g==
X-Gm-Message-State: AOJu0Yz/5ueBrRISNeJEMuzlRpq79sZAw+Mvt1x/be7WAPxeTFQXJf1v
	LmH1smpRrKQtmD0nhKKvunRY6ZeVo/NTA+MVIen07o0E+7d7U86Z
X-Google-Smtp-Source: AGHT+IGaiPoLXXXpVrpLOJx1iAETWJgKsjUW+rWbh5/bn42gLXIa3/rbbH0xm62Oxp9IYd0WoUIt9A==
X-Received: by 2002:aa7:8884:0:b0:6eb:1d5:6e43 with SMTP id z4-20020aa78884000000b006eb01d56e43mr962657pfe.11.1713388587052;
        Wed, 17 Apr 2024 14:16:27 -0700 (PDT)
Received: from devnote2 (113x37x226x201.ap113.ftth.ucom.ne.jp. [113.37.226.201])
        by smtp.gmail.com with ESMTPSA id h3-20020a056a00218300b006ed4aa9d48esm110372pfi.212.2024.04.17.14.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 14:16:26 -0700 (PDT)
Date: Thu, 18 Apr 2024 06:16:15 +0900
From: Masami Hiramatsu <masami.hiramatsu@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 14/15] kprobes: remove dependency on CONFIG_MODULES
Message-Id: <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
In-Reply-To: <20240411160051.2093261-15-rppt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
	<20240411160051.2093261-15-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 18 Apr 2024 08:56:41 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev
 >, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

On Thu, 11 Apr 2024 19:00:50 +0300
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

Thanks for this work, but this conflicts with the latest fix in v6.9-rc4.
Also, can you use IS_ENABLED(CONFIG_MODULES) instead of #ifdefs in
function body? We have enough dummy functions for that, so it should
not make a problem.

Thank you,

> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/Kconfig                |  2 +-
>  kernel/kprobes.c            | 43 +++++++++++++++++++++----------------
>  kernel/trace/trace_kprobe.c | 11 ++++++++++
>  3 files changed, 37 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index bc9e8e5dccd5..68177adf61a0 100644
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
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 047ca629ce49..90c056853e6f 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1580,6 +1580,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  		goto out;
>  	}
>  
> +#ifdef CONFIG_MODULES
>  	/* Check if 'p' is probing a module. */
>  	*probed_mod = __module_text_address((unsigned long) p->addr);
>  	if (*probed_mod) {
> @@ -1603,6 +1604,8 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  			ret = -ENOENT;
>  		}
>  	}
> +#endif
> +
>  out:
>  	preempt_enable();
>  	jump_label_unlock();
> @@ -2482,24 +2485,6 @@ int kprobe_add_area_blacklist(unsigned long start, unsigned long end)
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
> @@ -2564,6 +2549,25 @@ static int __init populate_kprobe_blacklist(unsigned long *start,
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
> @@ -2665,6 +2669,7 @@ static struct notifier_block kprobe_module_nb = {
>  	.notifier_call = kprobes_module_callback,
>  	.priority = 0
>  };
> +#endif
>  
>  void kprobe_free_init_mem(void)
>  {
> @@ -2724,8 +2729,10 @@ static int __init init_kprobes(void)
>  	err = arch_init_kprobes();
>  	if (!err)
>  		err = register_die_notifier(&kprobe_exceptions_nb);
> +#ifdef CONFIG_MODULES
>  	if (!err)
>  		err = register_module_notifier(&kprobe_module_nb);
> +#endif
>  
>  	kprobes_initialized = (err == 0);
>  	kprobe_sysctls_init();
> diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> index 14099cc17fc9..f0610137d6a3 100644
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
> @@ -704,6 +712,7 @@ static struct notifier_block trace_kprobe_module_nb = {
>  	.notifier_call = trace_kprobe_module_callback,
>  	.priority = 1	/* Invoked after kprobe module callback */
>  };
> +#endif
>  
>  static int count_symbols(void *data, unsigned long unused)
>  {
> @@ -1933,8 +1942,10 @@ static __init int init_kprobe_trace_early(void)
>  	if (ret)
>  		return ret;
>  
> +#ifdef CONFIG_MODULES
>  	if (register_module_notifier(&trace_kprobe_module_nb))
>  		return -EINVAL;
> +#endif
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
> 


-- 
Masami Hiramatsu
