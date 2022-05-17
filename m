Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C552AE81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 01:25:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2sfL1pyRz3cHh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 09:24:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=D3nbGBAQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=D3nbGBAQ; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2cQ25zf2z2yMS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 23:28:26 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4DBA821CC7;
 Tue, 17 May 2022 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652794103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m8eH28qbE+2Xy0DKW3X9feLJxxFiFeYxt7IWdkwBacU=;
 b=D3nbGBAQ9bCKnB1WwjJRY0SPMWZeGE7s6okektsDFoMjSCg4MWkDlGu0CaIrnv72L2dSjB
 TH4hbCd7WNPBQBo5APMhOgzqiXxMfJKdv72h+T8GhDipQ36bscz5ULSJq0aGA9QxAaz7ZE
 2DHOtfp4NZ3vqG8gLdmAnQza/SAFmg4=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id DE9622C141;
 Tue, 17 May 2022 13:28:20 +0000 (UTC)
Date: Tue, 17 May 2022 15:28:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Message-ID: <YoOi9PFK/JnNwH+D@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
X-Mailman-Approved-At: Wed, 18 May 2022 09:23:23 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, Justin Chen <justinpopo6@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, xen-devel@lists.xenproject.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Linux PM <linux-pm@vger.kernel.org>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 luto@kernel.org, Mihai Carabas <mihai.carabas@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, senozhatsky@chromium.org,
 d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-hyperv@vger.kernel.org,
 dave.hansen@linux.intel.com, linux-s390@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 vgoyal@redhat.com, Sven Schnelle <svens@linux.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, linux-xtensa@linux-xtensa.org,
 john.ogness@linutronix.de, Scott Branden <scott.branden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Markus Mayer <mmayer@broadcom.com>,
 hidehiro.kawai.ez@hitachi.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, kernel-dev@igalia.com,
 fabiomirmar@gmail.com, halves@canonical.com, alejandro.j.jimenez@oracle.com,
 feng.tang@intel.com, Will Deacon <will@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, bhe@redhat.com,
 Jonathan Corbet <corbet@lwn.net>, Dexuan Cui <decui@microsoft.com>,
 zhenwei pi <pizhenwei@bytedance.com>, bcm-kernel-feedback-list@broadcom.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 rostedt@goodmis.org, rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 openipmi-developer@lists.sourceforge.net,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-alpha@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, peterz@infradead.org,
 linux-remoteproc@vger.kernel.org, mikelley@microsoft.com,
 sparclinux@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-leds@vger.kernel.org, x86@kernel.org,
 mingo@redhat.com, dyoung@redhat.com, paulmck@kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 David Gow <davidgow@google.com>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>, linux-edac@vger.kernel.org,
 jgross@suse.com, netdev@vger.kernel.org, kernel@gpiccoli.net,
 kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 2022-05-16 09:02:10, Evan Green wrote:
> On Mon, May 16, 2022 at 8:07 AM Guilherme G. Piccoli
> <gpiccoli@igalia.com> wrote:
> >
> > Thanks for the review!
> >
> > I agree with the blinking stuff, I can rework and add all LED/blinking
> > stuff into the loop list, it does make sense. I'll comment a bit in the
> > others below...
> >
> > On 16/05/2022 11:01, Petr Mladek wrote:
> > > [...]
> > >> --- a/arch/mips/sgi-ip22/ip22-reset.c
> > >> +++ b/arch/mips/sgi-ip22/ip22-reset.c
> > >> @@ -195,7 +195,7 @@ static int __init reboot_setup(void)
> > >>      }
> > >>
> > >>      timer_setup(&blink_timer, blink_timeout, 0);
> > >> -    atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
> > >> +    atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> > >
> > > This notifier enables blinking. It is not much safe. It calls
> > > mod_timer() that takes a lock internally.
> > >
> > > This kind of functionality should go into the last list called
> > > before panic() enters the infinite loop. IMHO, all the blinking
> > > stuff should go there.
> > > [...]
> > >> --- a/arch/mips/sgi-ip32/ip32-reset.c
> > >> +++ b/arch/mips/sgi-ip32/ip32-reset.c
> > >> @@ -145,7 +144,7 @@ static __init int ip32_reboot_setup(void)
> > >>      pm_power_off = ip32_machine_halt;
> > >>
> > >>      timer_setup(&blink_timer, blink_timeout, 0);
> > >> -    atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
> > >> +    atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> > >
> > > Same here. Should be done only before the "loop".
> > > [...]
> >
> > Ack.
> >
> >
> > >> --- a/drivers/firmware/google/gsmi.c
> > >> +++ b/drivers/firmware/google/gsmi.c
> > >> @@ -1034,7 +1034,7 @@ static __init int gsmi_init(void)
> > >>
> > >>      register_reboot_notifier(&gsmi_reboot_notifier);
> > >>      register_die_notifier(&gsmi_die_notifier);
> > >> -    atomic_notifier_chain_register(&panic_notifier_list,
> > >> +    atomic_notifier_chain_register(&panic_hypervisor_list,
> > >>                                     &gsmi_panic_notifier);
> > >
> > > I am not sure about this one. It looks like some logging or
> > > pre_reboot stuff.
> > >
> >
> > Disagree here. I'm looping Google maintainers, so they can comment.
> > (CCed Evan, David, Julius)
> >
> > This notifier is clearly a hypervisor notification mechanism. I've fixed
> > a locking stuff there (in previous patch), I feel it's low-risk but even
> > if it's mid-risk, the class of such callback remains a perfect fit with
> > the hypervisor list IMHO.
>
> This logs a panic to our "eventlog", a tiny logging area in SPI flash
> for critical and power-related events. In some cases this ends up
> being the only clue we get in a Chromebook feedback report that a
> panic occurred, so from my perspective moving it to the front of the
> line seems like a good idea.

IMHO, this would really better fit into the pre-reboot notifier list:

   + the callback stores the log so it is similar to kmsg_dump()
     or console_flush_on_panic()

   + the callback should be proceed after "info" notifiers
     that might add some other useful information.

Honestly, I am not sure what exactly hypervisor callbacks do. But I
think that they do not try to extract the kernel log because they
would need to handle the internal format.

Best Regards,
Petr
