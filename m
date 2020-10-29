Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B145E29E58F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:59:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMHsQ4VxKzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 18:59:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=duIABjJk; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMHql663lzDqGY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 18:58:11 +1100 (AEDT)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48A4220724;
 Thu, 29 Oct 2020 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603958289;
 bh=ZcYvWQr2VWQJtO2BXb6i/VkN/X0mqZM5yiREyaXyl50=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=duIABjJkNNi8c+SdlJLhGYLKvsMmP3ziC5m5+qOVz+2xsjzrBsyeeD6fnYweqCjzK
 vinRLQ6rgBdJamFfYVDOweLdMWIvCQGWGFPexG/BBW42C3b5wWUxTF2et8MNALOdrG
 1fKICN4OGuubvxElYZ3VOGjVNLPF7NiEGA1RCMUU=
Date: Thu, 29 Oct 2020 16:58:03 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 5/9] kprobes/ftrace: Add recursion protection to the
 ftrace callback
Message-Id: <20201029165803.5f6b401e5bccca4e57c70181@kernel.org>
In-Reply-To: <20201028115613.140212174@goodmis.org>
References: <20201028115244.995788961@goodmis.org>
 <20201028115613.140212174@goodmis.org>
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
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-s390@vger.kernel.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Steve,

On Wed, 28 Oct 2020 07:52:49 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> 
> If a ftrace callback does not supply its own recursion protection and
> does not set the RECURSION_SAFE flag in its ftrace_ops, then ftrace will
> make a helper trampoline to do so before calling the callback instead of
> just calling the callback directly.

So in that case the handlers will be called without preempt disabled?


> The default for ftrace_ops is going to assume recursion protection unless
> otherwise specified.

This seems to skip entier handler if ftrace finds recursion.
I would like to increment the missed counter even in that case.

[...]
e.g.

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

	if (bit < 0) {
		kprobes_inc_nmissed_count(p);
		goto out;
	}

>  
> @@ -56,6 +61,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  		 */
>  		__this_cpu_write(current_kprobe, NULL);
>  	}
> +out:
> +	preempt_enable_notrace();

	if (bit >= 0)
		ftrace_test_recursion_unlock(bit);

>  }
>  NOKPROBE_SYMBOL(kprobe_ftrace_handler);
>  

Or, we can also introduce a support function,

static inline void kprobes_inc_nmissed_ip(unsigned long ip)
{
	struct kprobe *p;

	preempt_disable_notrace();
	p = get_kprobe((kprobe_opcode_t *)ip);
	if (p)
		kprobes_inc_nmissed_count(p);
	preempt_enable_notrace();
}

> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> index 4bab21c71055..5f7742b225a5 100644
> --- a/arch/parisc/kernel/ftrace.c
> +++ b/arch/parisc/kernel/ftrace.c
> @@ -208,13 +208,19 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  {
>  	struct kprobe_ctlblk *kcb;
>  	struct kprobe *p = get_kprobe((kprobe_opcode_t *)ip);

(BTW, here is a bug... get_kprobe() must be called with preempt disabled.)

> +	int bit;
>  
> -	if (unlikely(!p) || kprobe_disabled(p))
> +	bit = ftrace_test_recursion_trylock();

	if (bit < 0) {
		kprobes_inc_nmissed_ip(ip);
>  		return;
	}

This may easier for you ?

Thank you,

>  
> +	preempt_disable_notrace();
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
> @@ -235,6 +241,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
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
> index b388e87a08bf..88466d7fb6b2 100644
> --- a/arch/s390/kernel/ftrace.c
> +++ b/arch/s390/kernel/ftrace.c
> @@ -202,13 +202,19 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  {
>  	struct kprobe_ctlblk *kcb;
>  	struct kprobe *p = get_kprobe((kprobe_opcode_t *)ip);
> +	int bit;
>  
> -	if (unlikely(!p) || kprobe_disabled(p))
> +	bit = ftrace_test_recursion_trylock();
> +	if (bit < 0)
>  		return;
>  
> +	preempt_disable_notrace();
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
> @@ -228,6 +234,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
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
