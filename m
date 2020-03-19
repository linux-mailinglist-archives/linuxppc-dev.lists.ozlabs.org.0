Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D518B073
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 10:45:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jhps0lTzzDr6T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 20:45:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jhnF1ZsszDqT5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 20:44:01 +1100 (AEDT)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1jEr2O-0003WY-CF; Thu, 19 Mar 2020 10:00:24 +0100
Date: Thu, 19 Mar 2020 10:00:24 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 07/15] powerpc/ps3: Convert half completion to rcuwait
Message-ID: <20200319090024.wbrywc77tff3ro7i@linutronix.de>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.102694393@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200318204408.102694393@linutronix.de>
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
Cc: linux-usb@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 netdev@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, "Paul E . McKenney" <paulmck@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
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

On 2020-03-18 21:43:09 [+0100], Thomas Gleixner wrote:
> --- a/arch/powerpc/platforms/ps3/device-init.c
> +++ b/arch/powerpc/platforms/ps3/device-init.c
> @@ -725,12 +728,12 @@ static int ps3_notification_read_write(s
>  	unsigned long flags;
>  	int res;
> =20
> -	init_completion(&dev->done);
>  	spin_lock_irqsave(&dev->lock, flags);
>  	res =3D write ? lv1_storage_write(dev->sbd.dev_id, 0, 0, 1, 0, lpar,
>  					&dev->tag)
>  		    : lv1_storage_read(dev->sbd.dev_id, 0, 0, 1, 0, lpar,
>  				       &dev->tag);
> +	dev->done =3D false;
>  	spin_unlock_irqrestore(&dev->lock, flags);
>  	if (res) {
>  		pr_err("%s:%u: %s failed %d\n", __func__, __LINE__, op, res);
> @@ -738,14 +741,10 @@ static int ps3_notification_read_write(s
>  	}
>  	pr_debug("%s:%u: notification %s issued\n", __func__, __LINE__, op);
> =20
> -	res =3D wait_event_interruptible(dev->done.wait,
> -				       dev->done.done || kthread_should_stop());
> +	rcuwait_wait_event(&dev->wait, dev->done || kthread_should_stop(), TASK=
_IDLE);
> +
=E2=80=A6

Not sure it matters but this struct `dev' is allocated on stack. Should
the interrupt fire *before* rcuwait_wait_event() set wait.task to NULL
then it is of random value on the first invocation of rcuwait_wake_up().
->

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platfo=
rms/ps3/device-init.c
index 197347c3c0b24..e87360a0fb40d 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -809,6 +809,7 @@ static int ps3_probe_thread(void *data)
 	}
=20
 	spin_lock_init(&dev.lock);
+	rcuwait_init(&dev.wait);
=20
 	res =3D request_irq(irq, ps3_notification_interrupt, 0,
 			  "ps3_notification", &dev);


Sebastian
