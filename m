Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6FC8B6773
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 03:29:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT2fn6wh3z3dVr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 11:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=5p5d=md=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT2fN6bwWz3cVP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 11:29:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10C0B61152;
	Tue, 30 Apr 2024 01:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B6AC116B1;
	Tue, 30 Apr 2024 01:28:53 +0000 (UTC)
Date: Mon, 29 Apr 2024 21:29:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: Re: [PATCH v2] kprobe/ftrace: bail out if ftrace was killed
Message-ID: <20240429212933.327aae6e@gandalf.local.home>
In-Reply-To: <20240429174718.1347900-1-stephen.s.brennan@oracle.com>
References: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
	<20240429174718.1347900-1-stephen.s.brennan@oracle.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-trace-kernel
 @vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Apr 2024 10:47:18 -0700
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> If an error happens in ftrace, ftrace_kill() will prevent disarming
> kprobes. Eventually, the ftrace_ops associated with the kprobes will be
> freed, yet the kprobes will still be active, and when triggered, they
> will use the freed memory, likely resulting in a page fault and panic.
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
> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
> Difference from v1: removed both existing declarations of ftrace_is_dead()
> from kernel/trace/trace.h.
> 
>  arch/csky/kernel/probes/ftrace.c     | 3 +++
>  arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
>  arch/parisc/kernel/ftrace.c          | 3 +++
>  arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
>  arch/riscv/kernel/probes/ftrace.c    | 3 +++
>  arch/s390/kernel/ftrace.c            | 3 +++
>  arch/x86/kernel/kprobes/ftrace.c     | 3 +++
>  include/linux/ftrace.h               | 2 ++
>  kernel/trace/trace.h                 | 2 --
>  9 files changed, 23 insertions(+), 2 deletions(-)
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
> diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
> index 64450615ca0c..70a37ee41813 100644
> --- a/kernel/trace/trace.h
> +++ b/kernel/trace/trace.h
> @@ -1026,7 +1026,6 @@ static inline int ftrace_trace_task(struct trace_array *tr)
>  	return this_cpu_read(tr->array_buffer.data->ftrace_ignore_pid) !=
>  		FTRACE_PID_IGNORE;
>  }
> -extern int ftrace_is_dead(void);

Honestly I rather not expose this function outside of the tracing
infrastructure. Instead, we should have a kprobe_ftrace_kill() function,
and have ftrace_kill() call that.

Then kprobe_ftrace_kill() can set its own variable that is exposed to all
these functions and they can test that instead of adding the extra overhead
in the fast path of a function call to ftrace_is_dead()

extern bool kprobes_ftrace_disabled __read_mostly;

void kprobe_ftrace_kill(void)
{
	kprobes_ftrace_disabled = true;
}

And you can then replace all these with:

	if (kprobes_ftrace_disabled)
		return;

Which is faster.

-- Steve

>  int ftrace_create_function_files(struct trace_array *tr,
>  				 struct dentry *parent);
>  void ftrace_destroy_function_files(struct trace_array *tr);
> @@ -1046,7 +1045,6 @@ static inline int ftrace_trace_task(struct trace_array *tr)
>  {
>  	return 1;
>  }
> -static inline int ftrace_is_dead(void) { return 0; }
>  static inline int
>  ftrace_create_function_files(struct trace_array *tr,
>  			     struct dentry *parent)

