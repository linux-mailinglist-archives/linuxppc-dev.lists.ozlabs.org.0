Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F968B5A79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 15:48:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lyORC9o2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSl6b24rNz3cb6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 23:48:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lyORC9o2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSl5q67hWz3cVq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 23:48:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7009ACE0B94;
	Mon, 29 Apr 2024 13:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427D1C113CD;
	Mon, 29 Apr 2024 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714398492;
	bh=2OmxYBcG8kYWa15/HKPOVgxwdgSzJ8/xMevqt/hqwIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lyORC9o2Lm+u2avM+eOyj/ccYiyuxZQLnwqOF6FZV49QnzRN+Dcvvb8f+L/I+DIcc
	 bR6gzWrxR06bLVpEA1X1PfPHzCF0nDSdsFIGgv/R/Ztx7jvyn/LZvp5GTSxbA3X+Ea
	 5Q5++mVTUse/so5L++FV3pac1nAd6FyimPuc/dQPplc7m0nyf+JoSS48zL0c07gOKG
	 +Q9TxDTXUAv++YZPpMLvDQVzMH1VHt+BXIScwupTc1u15EnhRP870WSg23oHheSEFh
	 X/E2DhZuUkcbr1ov6EZLQFmBffBmxl2jf1fX5T3O6khvfYPOQWnrKD7j3rIrd7dwdJ
	 AMHlyJcx5ffMw==
Date: Mon, 29 Apr 2024 22:48:03 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: Re: [PATCH] kprobe/ftrace: bail out if ftrace was killed
Message-Id: <20240429224803.49d420b514e22d51412e1602@kernel.org>
In-Reply-To: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
References: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kern
 el@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On Fri, 26 Apr 2024 15:58:34 -0700
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> If an error happens in ftrace, ftrace_kill() will prevent disarming
> kprobes. Eventually, the ftrace_ops associated with the kprobes will be
> freed, yet the kprobes will still be active, and when triggered, they
> will use the freed memory, likely resulting in a page fault and panic.

Hmm, indeed.

> 
> This behavior can be reproduced quite easily, by creating a kprobe and
> then triggering a ftrace_kill(). For simplicity, we can simulate an
> ftrace error with a kernel module like [1]:
> 
> [1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_killer
> 
>   sudo perf probe --add commit_creds
>   sudo perf trace -e probe:commit_creds
>   # In another terminal
>   make
>   sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
>   # Back to perf terminal
>   # ctrl-c
>   sudo perf probe --del commit_creds
> 
> After a short period, a page fault and panic would occur as the kprobe
> continues to execute and uses the freed ftrace_ops. While ftrace_kill()
> is supposed to be used only in extreme circumstances, it is invoked in
> FTRACE_WARN_ON() and so there are many places where an unexpected bug
> could be triggered, yet the system may continue operating, possibly
> without the administrator noticing. If ftrace_kill() does not panic the
> system, then we should do everything we can to continue operating,
> rather than leave a ticking time bomb.

OK, the patch looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks!

> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
> 
> Apologies for the wide net cast here. I recognize that a change like this
> may need to be split up and go through arch-specific trees. I hoped to get
> feedback on the patch itself. If it's satisfactory and the architecture
> maintainers prefer it split out, I'm glad to do it. Thanks!
> 
>  arch/csky/kernel/probes/ftrace.c     | 3 +++
>  arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
>  arch/parisc/kernel/ftrace.c          | 3 +++
>  arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
>  arch/riscv/kernel/probes/ftrace.c    | 3 +++
>  arch/s390/kernel/ftrace.c            | 3 +++
>  arch/x86/kernel/kprobes/ftrace.c     | 3 +++
>  include/linux/ftrace.h               | 2 ++
>  8 files changed, 23 insertions(+)
> 
> diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
> index 834cffcfbce3..3931bf9f707b 100644
> --- a/arch/csky/kernel/probes/ftrace.c
> +++ b/arch/csky/kernel/probes/ftrace.c
> @@ -12,6 +12,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe_ctlblk *kcb;
>  	struct pt_regs *regs;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
> index 73858c9029cc..82c952cb5be0 100644
> --- a/arch/loongarch/kernel/ftrace_dyn.c
> +++ b/arch/loongarch/kernel/ftrace_dyn.c
> @@ -287,6 +287,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe *p;
>  	struct kprobe_ctlblk *kcb;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> index 621a4b386ae4..3660834f54c3 100644
> --- a/arch/parisc/kernel/ftrace.c
> +++ b/arch/parisc/kernel/ftrace.c
> @@ -206,6 +206,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe *p;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
> index 072ebe7f290b..85eb55aa1457 100644
> --- a/arch/powerpc/kernel/kprobes-ftrace.c
> +++ b/arch/powerpc/kernel/kprobes-ftrace.c
> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>  	struct pt_regs *regs;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(nip, parent_nip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
> index 7142ec42e889..8814fbe4c888 100644
> --- a/arch/riscv/kernel/probes/ftrace.c
> +++ b/arch/riscv/kernel/probes/ftrace.c
> @@ -11,6 +11,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe_ctlblk *kcb;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
> index c46381ea04ec..ccbe8ccf945b 100644
> --- a/arch/s390/kernel/ftrace.c
> +++ b/arch/s390/kernel/ftrace.c
> @@ -296,6 +296,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe *p;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
> index dd2ec14adb77..c73f9ab7ff50 100644
> --- a/arch/x86/kernel/kprobes/ftrace.c
> +++ b/arch/x86/kernel/kprobes/ftrace.c
> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe_ctlblk *kcb;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 54d53f345d14..ba83e99c1fbe 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -399,6 +399,7 @@ int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *a
>  #define register_ftrace_function(ops) ({ 0; })
>  #define unregister_ftrace_function(ops) ({ 0; })
>  static inline void ftrace_kill(void) { }
> +static inline int ftrace_is_dead(void) { return 0; }
>  static inline void ftrace_free_init_mem(void) { }
>  static inline void ftrace_free_mem(struct module *mod, void *start, void *end) { }
>  static inline int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *addrs)
> @@ -914,6 +915,7 @@ static inline bool is_ftrace_trampoline(unsigned long addr)
>  
>  /* totally disable ftrace - can not re-enable after this */
>  void ftrace_kill(void);
> +int ftrace_is_dead(void);
>  
>  static inline void tracer_disable(void)
>  {
> -- 
> 2.39.3
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
