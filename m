Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7918C39B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 00:27:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k33P0ncZzDrSg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 10:27:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=julian.calaby@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W4p7IqK8; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k31h4H98zDrN6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 10:25:57 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id s1so3098871lfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 16:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xryJO8lkXqRCZQK2yjx1cRHjWBLO8IFysYsWxEoA3uE=;
 b=W4p7IqK840U96gHxPUFDwKRKl0DeyM62Cf4hK4MVxDeZLz/NuJnzVzNLCXHzzJPXw3
 cuO7UoACnyau5ntSIeAtexp74bDciO1/5FPGcp4uN5dfZOgTP1gdGS6uEx07EyMxxSuW
 UTG41vXaINQUcorBOvlljqNGUuDzQ/Gzdti5RddYiwIqkyU/TcLQoyujB40JItwp4I44
 aLE8124W9EF1NiPA2u/s7EaM8iAp9jTolVsVbLF6auvhBLnXqNVx2On8kwVpvS0Al6yh
 3ce8EGJVdi1kbQEQX8KtoqT37e1mM0eGUDk1WEofyR/5anu3exltpzmPFnsw6CUMrPmR
 10SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xryJO8lkXqRCZQK2yjx1cRHjWBLO8IFysYsWxEoA3uE=;
 b=dfg/2aF5sPWxUbavhQTftX3teC1gtRfu+u9oKX3OSrFMvNrrw4TUuVPP7q16VObJnO
 fJ67tz1ZwYE7DU1wGAOSMcUuSsVZ7IiYbOZg2qtsfXsbsFoiuaMg982kIZIyAf1adwlk
 +2K1x4w8nYjwBiYXunBoKKuf94hYIInzCVs2d9N+F6FOKq9NEdXXi3E+fByv+Cz1Xuxf
 3FE6nCgBNJ4kEiUJ1jsAy42/mvr3xmM+kuNoYpMczwuBnefFmhH8z/Trx983oj0fOsrZ
 BciBCTmZSh7QVwnpIQZNGUhdpxo4p4nNg5Ju/0dBS2Go1WFLJLWXSlFbD5zx+iEAPQXX
 uqJA==
X-Gm-Message-State: ANhLgQ3votZ2ilwAYJ/zYHNyrB7UJLmk4KPQXdgHWmwiUdlOFTseGA8P
 1HTji0eeUFYsq5abS244n8ho0m0QPnAdKE4EJZk=
X-Google-Smtp-Source: ADFU+vutZe3vAn9jxlvO0kvX2a2rYQyzTHs+93M3VoF6k7ot+b480wfjbV128JnurPO8vWCARFUaoAdJ1D285cdVDEc=
X-Received: by 2002:a19:5504:: with SMTP id n4mr3537070lfe.149.1584660352957; 
 Thu, 19 Mar 2020 16:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.521507446@linutronix.de>
In-Reply-To: <20200318204408.521507446@linutronix.de>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 20 Mar 2020 10:25:41 +1100
Message-ID: <CAGRGNgXAW14=8ntTiB_hJ_nLq7WC_oFR3N9BNjqVEZM=ze85tQ@mail.gmail.com>
Subject: Re: [patch V2 11/15] completion: Use simple wait queues
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
 Oleg Nesterov <oleg@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, "Paul E . McKenney" <paulmck@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb <linux-usb@vger.kernel.org>, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Thu, Mar 19, 2020 at 7:48 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
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
>
>   - wake_up() walks an unbounded number of list entries during the wake up
>     and may wake an unbounded number of waiters.
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
>                 pr_info("%s(): freeing\n", __func__);
>                 ffs_data_clear(ffs);
>                 BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
> -                      waitqueue_active(&ffs->ep0req_completion.wait) ||
> +                      swait_active(&ffs->ep0req_completion.wait) ||

This looks like some code is reaching deep into the dirty dark corners
of the completion implementation, should there be some wrapper around
this to hide that?

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
