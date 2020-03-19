Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA14C18B01D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 10:24:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jhLr0sFMzDr7W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 20:24:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=NwKhFNci; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jhDg67t2zDr6T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 20:19:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=SB/qCDEi+ZlLoLxSkMyuujlTlFYXH48WLPTca/+wLJY=; b=NwKhFNciaaQRedaPUzwWPcEuDO
 6YVQI3gxcvsFKcY2D95xHQnwZQ6Fq7XXnfo4XgG40qTzyiZHbhFfhMxGGXxMXL5nOdm9z64lms9Z+
 MX1zySziAorbSKFBt7djHH284Q+NJF6Bb99TR0xCyf+90inBaIDUn//3J4VlfMgAhymPi6uBU+vmN
 JUAT7xa4tCtk6ndbnC5NazgC8uPsUvQyULtff1Ve5ZeXuOYhtibKip39ePOa8ICTYje92d/Ntl5jK
 VrGi7zImBW85bGdyp0jXcfivDfYp8D/VIudF0S6oSHSTX5GpQUuBccuLm4TkctWy6ecIxYgPnnbEz
 X6WpnIEA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jErKJ-0001Bz-4R; Thu, 19 Mar 2020 09:18:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4ABB83013A4;
 Thu, 19 Mar 2020 10:18:50 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 31213285F232E; Thu, 19 Mar 2020 10:18:50 +0100 (CET)
Date: Thu, 19 Mar 2020 10:18:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [patch V2 07/15] powerpc/ps3: Convert half completion to rcuwait
Message-ID: <20200319091850.GM20730@hirez.programming.kicks-ass.net>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.102694393@linutronix.de>
 <20200319090024.wbrywc77tff3ro7i@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200319090024.wbrywc77tff3ro7i@linutronix.de>
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
Cc: linux-usb@vger.kernel.org, linux-pci@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, netdev@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Davidlohr Bueso <dave@stgolabs.net>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Ingo Molnar <mingo@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 19, 2020 at 10:00:24AM +0100, Sebastian Andrzej Siewior wrote:
> On 2020-03-18 21:43:09 [+0100], Thomas Gleixner wrote:
> > --- a/arch/powerpc/platforms/ps3/device-init.c
> > +++ b/arch/powerpc/platforms/ps3/device-init.c
> > @@ -725,12 +728,12 @@ static int ps3_notification_read_write(s
> >  	unsigned long flags;
> >  	int res;
> >  
> > -	init_completion(&dev->done);
> >  	spin_lock_irqsave(&dev->lock, flags);
> >  	res = write ? lv1_storage_write(dev->sbd.dev_id, 0, 0, 1, 0, lpar,
> >  					&dev->tag)
> >  		    : lv1_storage_read(dev->sbd.dev_id, 0, 0, 1, 0, lpar,
> >  				       &dev->tag);
> > +	dev->done = false;
> >  	spin_unlock_irqrestore(&dev->lock, flags);
> >  	if (res) {
> >  		pr_err("%s:%u: %s failed %d\n", __func__, __LINE__, op, res);
> > @@ -738,14 +741,10 @@ static int ps3_notification_read_write(s
> >  	}
> >  	pr_debug("%s:%u: notification %s issued\n", __func__, __LINE__, op);
> >  
> > -	res = wait_event_interruptible(dev->done.wait,
> > -				       dev->done.done || kthread_should_stop());
> > +	rcuwait_wait_event(&dev->wait, dev->done || kthread_should_stop(), TASK_IDLE);
> > +
> …
> 
> Not sure it matters but this struct `dev' is allocated on stack. Should
> the interrupt fire *before* rcuwait_wait_event() set wait.task to NULL
> then it is of random value on the first invocation of rcuwait_wake_up().
> ->
> 
> diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
> index 197347c3c0b24..e87360a0fb40d 100644
> --- a/arch/powerpc/platforms/ps3/device-init.c
> +++ b/arch/powerpc/platforms/ps3/device-init.c
> @@ -809,6 +809,7 @@ static int ps3_probe_thread(void *data)
>  	}
>  
>  	spin_lock_init(&dev.lock);
> +	rcuwait_init(&dev.wait);
>  
>  	res = request_irq(irq, ps3_notification_interrupt, 0,
>  			  "ps3_notification", &dev);
> 

Very good, sorry for that.
