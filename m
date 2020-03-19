Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E75A18A9DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 01:35:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jScH2QLVzDq6J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 11:35:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel@joelfernandes.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.a=rsa-sha256 header.s=google header.b=vKjz15ir; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jSZb4XFMzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 11:33:56 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id g16so365863qtp.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 17:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cHl5FEDU/in/tKhyh8KADSkZ8t44HVVU6qSIiQF7HDk=;
 b=vKjz15irrUHQOxGKx3YJZSYaREZiLBQ5dkdKASVNi/DUnapYI1oeMp9PSbchikzKPl
 RL8eE9BxcoQ9gT2Z+96oGA/M+zvf4M7Ww0jlnMdeOCV7wPsoaRRDYZ+t1YRHJBhYvxmw
 JQHaOq18/lt39V3Rogoc35Lu1FpkxEJUwdFM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cHl5FEDU/in/tKhyh8KADSkZ8t44HVVU6qSIiQF7HDk=;
 b=RV1n657EOWH7vqsz75iA9XOkWtAvCvoVIL0Wmn2obGVpiMEQU1IY1/5DP0eOFUqFWI
 oCeNjs5f3TWg8Omspi3MD8076xzYjdV+imUyZwW3Xw47vsmIDNiBEKcJSj5kB0PKvx+A
 5599B6NwqoTvgg3jM6cgWf1xN2bfGm3/zEtC6U0NS6i4pnKqJps19ed6kQBiYAuEp36S
 ubycG2Xgqcu28SceLq//a70HRpAOkpH+66WgfJLLfzT4z0bwtksQBzGZwDJ6TIT5u6o0
 WtST4yhy6jMNI67mrfaUvNXWQSplg7iEjsEXIoiyzSiIvtPoGDzUlRX8NTMptl3tYX2U
 JnfQ==
X-Gm-Message-State: ANhLgQ0e6tKPEtH0194sSTfqkRkTOoMCUldPylfD8Gezlo0uyXIVbJ/p
 wGcHEWie56lnc4g4a/uMsZymhQ==
X-Google-Smtp-Source: ADFU+vte9vg5yrKnsJYwQUFLJMp35Yp0oNpQIim2wyXmoa5rkeGpiqYzRFosPkhMiCPa11iAMkqA+g==
X-Received: by 2002:ac8:1762:: with SMTP id u31mr389327qtk.359.1584578032733; 
 Wed, 18 Mar 2020 17:33:52 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id f13sm456312qkm.19.2020.03.18.17.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 17:33:52 -0700 (PDT)
Date: Wed, 18 Mar 2020 20:33:51 -0400
From: Joel Fernandes <joel@joelfernandes.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 11/15] completion: Use simple wait queues
Message-ID: <20200319003351.GA211584@google.com>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.521507446@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318204408.521507446@linutronix.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Wed, Mar 18, 2020 at 09:43:13PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> completion uses a wait_queue_head_t to enqueue waiters.
> 
> wait_queue_head_t contains a spinlock_t to protect the list of waiters
> which excludes it from being used in truly atomic context on a PREEMPT_RT
> enabled kernel.
> 
> The spinlock in the wait queue head cannot be replaced by a raw_spinlock
> because:
> 
>   - wait queues can have custom wakeup callbacks, which acquire other
>     spinlock_t locks and have potentially long execution times

Cool, makes sense.

>   - wake_up() walks an unbounded number of list entries during the wake up
>     and may wake an unbounded number of waiters.

Just to clarify here, wake_up() will really wake up just 1 waiter if all the
waiters on the queue are exclusive right? So in such scenario at least, the
"unbounded number of waiters" would not be an issue if everything waiting was
exclusive and waitqueue with wake_up() was used. Please correct me if I'm
wrong about that though.

So the main reasons to avoid waitqueue in favor of swait (as you mentioned)
would be the sleep-while-atomic issue in truly atomic context on RT, and the
fact that callbacks can take a long time.

> 
> For simplicity and performance reasons complete() should be usable on
> PREEMPT_RT enabled kernels.
> 
> completions do not use custom wakeup callbacks and are usually single
> waiter, except for a few corner cases.
> 
> Replace the wait queue in the completion with a simple wait queue (swait),
> which uses a raw_spinlock_t for protecting the waiter list and therefore is
> safe to use inside truly atomic regions on PREEMPT_RT.
> 
> There is no semantical or functional change:
> 
>   - completions use the exclusive wait mode which is what swait provides
> 
>   - complete() wakes one exclusive waiter
> 
>   - complete_all() wakes all waiters while holding the lock which protects
>     the wait queue against newly incoming waiters. The conversion to swait
>     preserves this behaviour.
> 
> complete_all() might cause unbound latencies with a large number of waiters
> being woken at once, but most complete_all() usage sites are either in
> testing or initialization code or have only a really small number of
> concurrent waiters which for now does not cause a latency problem. Keep it
> simple for now.
> 
> The fixup of the warning check in the USB gadget driver is just a straight
> forward conversion of the lockless waiter check from one waitqueue type to
> the other.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel


> ---
> V2: Split out the orinoco and usb gadget parts and amended change log
> ---
>  drivers/usb/gadget/function/f_fs.c |    2 +-
>  include/linux/completion.h         |    8 ++++----
>  kernel/sched/completion.c          |   36 +++++++++++++++++++-----------------
>  3 files changed, 24 insertions(+), 22 deletions(-)
> 
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1703,7 +1703,7 @@ static void ffs_data_put(struct ffs_data
>  		pr_info("%s(): freeing\n", __func__);
>  		ffs_data_clear(ffs);
>  		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
> -		       waitqueue_active(&ffs->ep0req_completion.wait) ||
> +		       swait_active(&ffs->ep0req_completion.wait) ||
>  		       waitqueue_active(&ffs->wait));
>  		destroy_workqueue(ffs->io_completion_wq);
>  		kfree(ffs->dev_name);
> --- a/include/linux/completion.h
> +++ b/include/linux/completion.h
> @@ -9,7 +9,7 @@
>   * See kernel/sched/completion.c for details.
>   */
>  
> -#include <linux/wait.h>
> +#include <linux/swait.h>
>  
>  /*
>   * struct completion - structure used to maintain state for a "completion"
> @@ -25,7 +25,7 @@
>   */
>  struct completion {
>  	unsigned int done;
> -	wait_queue_head_t wait;
> +	struct swait_queue_head wait;
>  };
>  
>  #define init_completion_map(x, m) __init_completion(x)
> @@ -34,7 +34,7 @@ static inline void complete_acquire(stru
>  static inline void complete_release(struct completion *x) {}
>  
>  #define COMPLETION_INITIALIZER(work) \
> -	{ 0, __WAIT_QUEUE_HEAD_INITIALIZER((work).wait) }
> +	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait) }
>  
>  #define COMPLETION_INITIALIZER_ONSTACK_MAP(work, map) \
>  	(*({ init_completion_map(&(work), &(map)); &(work); }))
> @@ -85,7 +85,7 @@ static inline void complete_release(stru
>  static inline void __init_completion(struct completion *x)
>  {
>  	x->done = 0;
> -	init_waitqueue_head(&x->wait);
> +	init_swait_queue_head(&x->wait);
>  }
>  
>  /**
> --- a/kernel/sched/completion.c
> +++ b/kernel/sched/completion.c
> @@ -29,12 +29,12 @@ void complete(struct completion *x)
>  {
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&x->wait.lock, flags);
> +	raw_spin_lock_irqsave(&x->wait.lock, flags);
>  
>  	if (x->done != UINT_MAX)
>  		x->done++;
> -	__wake_up_locked(&x->wait, TASK_NORMAL, 1);
> -	spin_unlock_irqrestore(&x->wait.lock, flags);
> +	swake_up_locked(&x->wait);
> +	raw_spin_unlock_irqrestore(&x->wait.lock, flags);
>  }
>  EXPORT_SYMBOL(complete);
>  
> @@ -58,10 +58,12 @@ void complete_all(struct completion *x)
>  {
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&x->wait.lock, flags);
> +	WARN_ON(irqs_disabled());
> +
> +	raw_spin_lock_irqsave(&x->wait.lock, flags);
>  	x->done = UINT_MAX;
> -	__wake_up_locked(&x->wait, TASK_NORMAL, 0);
> -	spin_unlock_irqrestore(&x->wait.lock, flags);
> +	swake_up_all_locked(&x->wait);
> +	raw_spin_unlock_irqrestore(&x->wait.lock, flags);
>  }
>  EXPORT_SYMBOL(complete_all);
>  
> @@ -70,20 +72,20 @@ do_wait_for_common(struct completion *x,
>  		   long (*action)(long), long timeout, int state)
>  {
>  	if (!x->done) {
> -		DECLARE_WAITQUEUE(wait, current);
> +		DECLARE_SWAITQUEUE(wait);
>  
> -		__add_wait_queue_entry_tail_exclusive(&x->wait, &wait);
>  		do {
>  			if (signal_pending_state(state, current)) {
>  				timeout = -ERESTARTSYS;
>  				break;
>  			}
> +			__prepare_to_swait(&x->wait, &wait);
>  			__set_current_state(state);
> -			spin_unlock_irq(&x->wait.lock);
> +			raw_spin_unlock_irq(&x->wait.lock);
>  			timeout = action(timeout);
> -			spin_lock_irq(&x->wait.lock);
> +			raw_spin_lock_irq(&x->wait.lock);
>  		} while (!x->done && timeout);
> -		__remove_wait_queue(&x->wait, &wait);
> +		__finish_swait(&x->wait, &wait);
>  		if (!x->done)
>  			return timeout;
>  	}
> @@ -100,9 +102,9 @@ static inline long __sched
>  
>  	complete_acquire(x);
>  
> -	spin_lock_irq(&x->wait.lock);
> +	raw_spin_lock_irq(&x->wait.lock);
>  	timeout = do_wait_for_common(x, action, timeout, state);
> -	spin_unlock_irq(&x->wait.lock);
> +	raw_spin_unlock_irq(&x->wait.lock);
>  
>  	complete_release(x);
>  
> @@ -291,12 +293,12 @@ bool try_wait_for_completion(struct comp
>  	if (!READ_ONCE(x->done))
>  		return false;
>  
> -	spin_lock_irqsave(&x->wait.lock, flags);
> +	raw_spin_lock_irqsave(&x->wait.lock, flags);
>  	if (!x->done)
>  		ret = false;
>  	else if (x->done != UINT_MAX)
>  		x->done--;
> -	spin_unlock_irqrestore(&x->wait.lock, flags);
> +	raw_spin_unlock_irqrestore(&x->wait.lock, flags);
>  	return ret;
>  }
>  EXPORT_SYMBOL(try_wait_for_completion);
> @@ -322,8 +324,8 @@ bool completion_done(struct completion *
>  	 * otherwise we can end up freeing the completion before complete()
>  	 * is done referencing it.
>  	 */
> -	spin_lock_irqsave(&x->wait.lock, flags);
> -	spin_unlock_irqrestore(&x->wait.lock, flags);
> +	raw_spin_lock_irqsave(&x->wait.lock, flags);
> +	raw_spin_unlock_irqrestore(&x->wait.lock, flags);
>  	return true;
>  }
>  EXPORT_SYMBOL(completion_done);
> 
