Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D44652B84B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 13:08:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L39FX6kszz3cJc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 21:08:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=T0gGp12c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=T0gGp12c; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L352n3TzKz3bbQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 17:58:24 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1B35021B9A;
 Wed, 18 May 2022 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652860701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QH8rZRpDaB1rKzYBSvbHTkuJfXIZgq5PPOEyov0S61g=;
 b=T0gGp12c0pU5b8b1i3GTuIGm3SeP3EhRpXPECQNn/enftlsKdapz4VZkfCcS2uIPqM17q+
 /PBA3AVHUNLBKEckN04LlFAw1RfXD18Ad2wMfhhColdg9InPjS0Cl4zZnO5bfZL0Ln9Soj
 5NqvLRJqL5BZI+4DmlPHTXzoYIVJS4o=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0683D2C142;
 Wed, 18 May 2022 07:58:19 +0000 (UTC)
Date: Wed, 18 May 2022 09:58:18 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Message-ID: <YoSnGmBJ3kYs5WMf@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <YoOpyW1+q+Z5as78@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoOpyW1+q+Z5as78@alley>
X-Mailman-Approved-At: Wed, 18 May 2022 21:06:24 +1000
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
 stern@rowland.harvard.edu, xen-devel@lists.xenproject.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 luto@kernel.org, Mihai Carabas <mihai.carabas@oracle.com>, tglx@linutronix.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 akpm@linux-foundation.org, linux-hyperv@vger.kernel.org,
 dave.hansen@linux.intel.com, linux-s390@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 vgoyal@redhat.com, Sven Schnelle <svens@linux.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, linux-xtensa@linux-xtensa.org,
 john.ogness@linutronix.de, Scott Branden <scott.branden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Markus Mayer <mmayer@broadcom.com>,
 hidehiro.kawai.ez@hitachi.com, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com, fabiomirmar@gmail.com, halves@canonical.com,
 alejandro.j.jimenez@oracle.com, feng.tang@intel.com,
 zhenwei pi <pizhenwei@bytedance.com>, will@kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, bhe@redhat.com, corbet@lwn.net,
 Dexuan Cui <decui@microsoft.com>, Evan Green <evgreen@chromium.org>,
 bcm-kernel-feedback-list@broadcom.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 keescook@chromium.org, arnd@arndb.de, Haiyang Zhang <haiyangz@microsoft.com>,
 rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de,
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
 andriy.shevchenko@linux.intel.com, Hari Bathini <hbathini@linux.ibm.com>,
 linux-edac@vger.kernel.org, jgross@suse.com, netdev@vger.kernel.org,
 kernel@gpiccoli.net, kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2022-05-17 15:57:34, Petr Mladek wrote:
> On Mon 2022-05-16 12:06:17, Guilherme G. Piccoli wrote:
> > >> --- a/drivers/soc/bcm/brcmstb/pm/pm-arm.c
> > >> +++ b/drivers/soc/bcm/brcmstb/pm/pm-arm.c
> > >> @@ -814,7 +814,7 @@ static int brcmstb_pm_probe(struct platform_device *pdev)
> > >>  		goto out;
> > >>  	}
> > >>  
> > >> -	atomic_notifier_chain_register(&panic_notifier_list,
> > >> +	atomic_notifier_chain_register(&panic_hypervisor_list,
> > >>  				       &brcmstb_pm_panic_nb);
> > > 
> > > I am not sure about this one. It instruct some HW to preserve DRAM.
> > > IMHO, it better fits into pre_reboot category but I do not have
> > > strong opinion.
> > 
> > Disagree here, I'm CCing Florian for information.
> > 
> > This notifier preserves RAM so it's *very interesting* if we have
> > kmsg_dump() for example, but maybe might be also relevant in case kdump
> > kernel is configured to store something in a persistent RAM (then,
> > without this notifier, after kdump reboots the system data would be lost).
> 
> I see. It is actually similar problem as with
> drivers/firmware/google/gsmi.c.

As discussed in the other other reply, it seems that both affected
notifiers do not store kernel logs and should stay in the "hypervisor".

> I does similar things like kmsg_dump() so it should be called in
> the same location (after info notifier list and before kdump).
>
> A solution might be to put it at these notifiers at the very
> end of the "info" list or make extra "dump" notifier list.

I just want to point out that the above idea has problems.
Notifiers storing kernel log need to be treated as kmsg_dump().
In particular, we would  need to know if there are any.
We do not need to call "info" notifier list before kdump
when there is no kernel log dumper registered.

Best Regards,
Petr
