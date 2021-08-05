Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC98C3E189E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 17:47:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgY0R5scwz3dBv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 01:47:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HFFKv1lO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=HFFKv1lO; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgY00224rz3024
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 01:47:27 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 05803223C9;
 Thu,  5 Aug 2021 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628178443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjyShzouPrJcHBbruWtTQutmAQhza4mB7qEDF4um5Mg=;
 b=HFFKv1lODf3gm58MqBGWAh8qSB3SjD0CWH1FfzIS9Ttb2ITfRIGZdfCH1BtAnoyP4ESIec
 etQbWzYl+6ASAoafzEiq37hiOIvpPGQL0Maxr2rIGqwGWJypE77o36bBPH1bIEeFynFgxE
 JPgwV+WeWHfe1PUy2fE9+HyrOT/gvco=
Received: from suse.cz (pmladek.udp.ovpn1.prg.suse.de [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9259EA3EC0;
 Thu,  5 Aug 2021 15:47:22 +0000 (UTC)
Date: Thu, 5 Aug 2021 17:47:22 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v1 00/10] printk: introduce atomic consoles and
 sync mode
Message-ID: <YQwHwT2wYM1dJfVk@alley>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803131301.5588-1-john.ogness@linutronix.de>
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Al Cooper <alcooperx@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Cengiz Can <cengiz@kernel.wtf>,
 Chengyang Fan <cy.fan@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, Changbin Du <changbin.du@intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 linux-mediatek@lists.infradead.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Wang Qing <wangqing@vivo.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Johan Hovold <johan@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sedat Dilek <sedat.dilek@gmail.com>, Claire Chang <tientzu@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrij Abyzov <aabyzov@slb.com>, linux-arm-kernel@lists.infradead.org,
 Sumit Garg <sumit.garg@linaro.org>,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>, Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linuxppc-dev@lists.ozlabs.org,
 Vitor Massaru Iha <vitor@massaru.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2021-08-03 15:18:51, John Ogness wrote:
> Hi,
> 
> This is the next part of our printk-rework effort (points 3 and
> 4 of the LPC 2019 summary [0]).
> 
> Here the concept of "atomic consoles" is introduced through  a
> new (optional) write_atomic() callback for console drivers. This
> callback must be implemented as an NMI-safe variant of the
> write() callback, meaning that it can function from any context
> without relying on questionable tactics such as ignoring locking
> and also without relying on the synchronization of console
> semaphore.
> 
> As an example of how such an atomic console can look like, this
> series implements write_atomic() for the 8250 UART driver.
> 
> This series also introduces a new console printing mode called
> "sync mode" that is only activated when the kernel is about to
> end (such as panic, oops, shutdown, reboot). Sync mode can only
> be activated if atomic consoles are available. A system without
> registered atomic consoles will be unaffected by this series.
>
> When in sync mode, the console printing behavior becomes:
> 
> - only consoles implementing write_atomic() will be called
> 
> - printing occurs within vprintk_store() instead of
>   console_unlock(), since the console semaphore is irrelevant
>   for atomic consoles

I am fine with the new behavior at this stage. It is a quite clear
win when (only) the atomic console is used. And it does not make any
difference when atomic consoles are disabled.

But I am not sure about the proposed terms and implementation.
I want to be sure that we are on the right way for introducing
console kthreads.

Let me try to compare the behavior:

1. before this patchset():

	/* printk: store immediately; try all consoles immediately */
	int printk(...)
	{
		vprintk_store();
		if (console_try_lock()) {
			/* flush pending messages to the consoles */
			console_unlock();
		}
	}

	/* panic: try hard to flush messages to the consoles and avoid deadlock */
	void panic()
	{
		/* Ignore locks in console drivers */
		bust_spinlocks(1);

		printk("Kernel panic ...);
		dump_stack();

		smp_send_stop();
		/* ignore console lock */
		console_flush_on_panic();
	}


2. after this patchset():

   + same as before in normal mode or when there is no atomic console

   + in panic with atomic console; it modifies the behavior:

	/*
	 * printk: store immediately; immediately flush atomic consoles;
	 *         unsafe consoles are not used anymore;
	 */
	int printk(...)
	{
		vprintk_store();
		flush_atomic_consoles();
	}

	/* panic: no hacks; only atomic consoles are used */
	void panic()
	{
		printk("Kernel panic ...);
		dump_stack();
	}


3. After introducing console kthread(s):

	int printk(...)
	{
		vprintk_store();
		wake_consoles_via_irqwork();
	}

	+ in panic:

	    + with atomic console like after this patchset?
	    + without atomic consoles?

	+ during early boot?


I guess that we will need another sync mode for the early boot,
panic, suspend, kexec, etc.. It must be posible to debug these states
even wihtout atomic console and working kthreads.

Best Regards,
Petr
