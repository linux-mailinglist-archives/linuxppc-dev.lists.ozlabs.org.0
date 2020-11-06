Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B22A944F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 11:27:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSGmj45XZzDrLk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 21:27:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=qrj0z7G3; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSGjx6VvdzDrHd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 21:25:25 +1100 (AEDT)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E04920691;
 Fri,  6 Nov 2020 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604658322;
 bh=6YzS8ko75d9YTXXdkNZu4e61owx1w6yTEHh/zi9Ys+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qrj0z7G3y/lZrOk2fz41MdO04PyFbYhfjAhrg5AVQLxLizOCNVBjMsgKIy0bUw0Hi
 hqqcf/Zb0mCmEIW8Ik8Ma2jhwN9eOnseMIUiq5Yvfw2pZ+LVsjQO+7jZiixAowTDoI
 n4AsCexEDeWZTmwsOwUMKcG4RJmGkrAZ4+EUEE+o=
Date: Fri, 6 Nov 2020 19:25:13 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Steven Rostedt (VMware) <rostedt@goodmis.org>
Subject: Re: [PATCH 05/11 v3] kprobes/ftrace: Add recursion protection to
 the ftrace callback
Message-Id: <20201106192513.80b330351c0cafd03134b0d1@kernel.org>
In-Reply-To: <20201106023546.944907560@goodmis.org>
References: <20201106023235.367190737@goodmis.org>
 <20201106023546.944907560@goodmis.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Miroslav Benes <mbenes@suse.cz>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Petr Mladek <pmladek@suse.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jiri Kosina <jikos@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 05 Nov 2020 21:32:40 -0500
Steven Rostedt (VMware) <rostedt@goodmis.org> wrote:

> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> 
> If a ftrace callback does not supply its own recursion protection and
> does not set the RECURSION_SAFE flag in its ftrace_ops, then ftrace will
> make a helper trampoline to do so before calling the callback instead of
> just calling the callback directly.
> 
> The default for ftrace_ops is going to change. It will expect that handlers
> provide their own recursion protection, unless its ftrace_ops states
> otherwise.
> 
> Link: https://lkml.kernel.org/r/20201028115613.140212174@goodmis.org
> 

Looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you!

> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> Cc: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-csky@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> ---
> 
> Changes since v2:
> 
>  - Move get_kprobe() into preempt disabled sections for various archs
> 
> 
>  arch/csky/kernel/probes/ftrace.c     | 12 ++++++++++--
>  arch/parisc/kernel/ftrace.c          | 16 +++++++++++++---
>  arch/powerpc/kernel/kprobes-ftrace.c | 11 ++++++++++-
>  arch/s390/kernel/ftrace.c            | 16 +++++++++++++---
>  arch/x86/kernel/kprobes/ftrace.c     | 12 ++++++++++--
>  5 files changed, 56 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
> index 5264763d05be..5eb2604fdf71 100644
> --- a/arch/csky/kernel/probes/ftrace.c
> +++ b/arch/csky/kernel/probes/ftrace.c
> @@ -13,16 +13,21 @@ int arch_check_ftrace_location(struct kprobe *p)
>  void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  			   struct ftrace_ops *ops, struct pt_regs *regs)
>  {
> +	int bit;
>  	bool lr_saver = false;
>  	struct kprobe *p;
>  	struct kprobe_ctlblk *kcb;
>  
> -	/* Preempt is disabled by ftrace */
> +	bit = ftrace_test_recursion_trylock();
> +	if (bit < 0)
> +		return;
> +
> +	preempt_disable_notrace();
>  	p = get_kprobe((kprobe_opcode_t *)ip);
>  	if (!p) {
>  		p = get_kprobe((kprobe_opcode_t *)(ip - MCOUNT_INSN_SIZE));
>  		if (unlikely(!p) || kprobe_disabled(p))
> -			return;
> +			goto out;
>  		lr_saver = true;
>  	}
>  
> @@ -56,6 +61,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  		 */
>  		__this_cpu_write(current_kprobe, NULL);
>  	}
> +out:
> +	preempt_enable_notrace();
> +	ftrace_test_recursion_unlock(bit);
>  }
>  NOKPROBE_SYMBOL(kprobe_ftrace_handler);
>  
> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> index 63e3ecb9da81..13d85042810a 100644
> --- a/arch/parisc/kernel/ftrace.c
> +++ b/arch/parisc/kernel/ftrace.c
> @@ -207,14 +207,21 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  			   struct ftrace_ops *ops, struct pt_regs *regs)
>  {
>  	struct kprobe_ctlblk *kcb;
> -	struct kprobe *p = get_kprobe((kprobe_opcode_t *)ip);
> +	struct kprobe *p;
> +	int bit;
>  
> -	if (unlikely(!p) || kprobe_disabled(p))
> +	bit = ftrace_test_recursion_trylock();
> +	if (bit < 0)
>  		return;
>  
> +	preempt_disable_notrace();
> +	p = get_kprobe((kprobe_opcode_t *)ip);
> +	if (unlikely(!p) || kprobe_disabled(p))
> +		goto out;
> +
>  	if (kprobe_running()) {
>  		kprobes_inc_nmissed_count(p);
> -		return;
> +		goto out;
>  	}
>  
>  	__this_cpu_write(current_kprobe, p);
> @@ -235,6 +242,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  		}
>  	}
>  	__this_cpu_write(current_kprobe, NULL);
> +out:
> +	preempt_enable_notrace();
> +	ftrace_test_recursion_unlock(bit);
>  }
>  NOKPROBE_SYMBOL(kprobe_ftrace_handler);
>  
> diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
> index 972cb28174b2..5df8d50c65ae 100644
> --- a/arch/powerpc/kernel/kprobes-ftrace.c
> +++ b/arch/powerpc/kernel/kprobes-ftrace.c
> @@ -18,10 +18,16 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>  {
>  	struct kprobe *p;
>  	struct kprobe_ctlblk *kcb;
> +	int bit;
>  
> +	bit = ftrace_test_recursion_trylock();
> +	if (bit < 0)
> +		return;
> +
> +	preempt_disable_notrace();
>  	p = get_kprobe((kprobe_opcode_t *)nip);
>  	if (unlikely(!p) || kprobe_disabled(p))
> -		return;
> +		goto out;
>  
>  	kcb = get_kprobe_ctlblk();
>  	if (kprobe_running()) {
> @@ -52,6 +58,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>  		 */
>  		__this_cpu_write(current_kprobe, NULL);
>  	}
> +out:
> +	preempt_enable_notrace();
> +	ftrace_test_recursion_unlock(bit);
>  }
>  NOKPROBE_SYMBOL(kprobe_ftrace_handler);
>  
> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
> index b388e87a08bf..8f31c726537a 100644
> --- a/arch/s390/kernel/ftrace.c
> +++ b/arch/s390/kernel/ftrace.c
> @@ -201,14 +201,21 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  		struct ftrace_ops *ops, struct pt_regs *regs)
>  {
>  	struct kprobe_ctlblk *kcb;
> -	struct kprobe *p = get_kprobe((kprobe_opcode_t *)ip);
> +	struct kprobe *p;
> +	int bit;
>  
> -	if (unlikely(!p) || kprobe_disabled(p))
> +	bit = ftrace_test_recursion_trylock();
> +	if (bit < 0)
>  		return;
>  
> +	preempt_disable_notrace();
> +	p = get_kprobe((kprobe_opcode_t *)ip);
> +	if (unlikely(!p) || kprobe_disabled(p))
> +		goto out;
> +
>  	if (kprobe_running()) {
>  		kprobes_inc_nmissed_count(p);
> -		return;
> +		goto out;
>  	}
>  
>  	__this_cpu_write(current_kprobe, p);
> @@ -228,6 +235,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  		}
>  	}
>  	__this_cpu_write(current_kprobe, NULL);
> +out:
> +	preempt_enable_notrace();
> +	ftrace_test_recursion_unlock(bit);
>  }
>  NOKPROBE_SYMBOL(kprobe_ftrace_handler);
>  
> diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
> index 681a4b36e9bb..a40a6cdfcca3 100644
> --- a/arch/x86/kernel/kprobes/ftrace.c
> +++ b/arch/x86/kernel/kprobes/ftrace.c
> @@ -18,11 +18,16 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  {
>  	struct kprobe *p;
>  	struct kprobe_ctlblk *kcb;
> +	int bit;
>  
> -	/* Preempt is disabled by ftrace */
> +	bit = ftrace_test_recursion_trylock();
> +	if (bit < 0)
> +		return;
> +
> +	preempt_disable_notrace();
>  	p = get_kprobe((kprobe_opcode_t *)ip);
>  	if (unlikely(!p) || kprobe_disabled(p))
> -		return;
> +		goto out;
>  
>  	kcb = get_kprobe_ctlblk();
>  	if (kprobe_running()) {
> @@ -52,6 +57,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  		 */
>  		__this_cpu_write(current_kprobe, NULL);
>  	}
> +out:
> +	preempt_enable_notrace();
> +	ftrace_test_recursion_unlock(bit);
>  }
>  NOKPROBE_SYMBOL(kprobe_ftrace_handler);
>  
> -- 
> 2.28.0
> 
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
