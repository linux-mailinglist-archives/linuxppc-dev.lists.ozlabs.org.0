Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04452A2CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 15:11:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2c2z1v6zz3cFS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 23:11:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=FE8yzrSt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=FE8yzrSt; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2c2N3mKrz2yn2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 23:11:23 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0C7941F88E;
 Tue, 17 May 2022 13:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652793080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R3V2DPM1jjc4jD8tVw3U8Rq3S0Maoan+sJ+xup8d8sI=;
 b=FE8yzrStcygQwANxOmZrJZbOrCy87Ou5DJ3FGcXlGzv/8KcD1Q9vQAYohnpV6O9yl65Qfm
 zyx0GaYk63CmAg8xlzK3VRV5wlBb3dplZbLwFVDWl++Ff8DNSFdVejZHiQCHUg6G6gVRgz
 J3YUEPeJCts4dfmVUl5hnzLG7sbV2vU=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D75DF2C141;
 Tue, 17 May 2022 13:11:17 +0000 (UTC)
Date: Tue, 17 May 2022 15:11:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 14/30] panic: Properly identify the panic event to the
 notifiers' callbacks
Message-ID: <YoOe7ifxfW8CEHdt@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-15-gpiccoli@igalia.com>
 <YnqBsXBImU64PAOL@alley>
 <244a412c-4589-28d1-bb77-d3648d4f0b12@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <244a412c-4589-28d1-bb77-d3648d4f0b12@igalia.com>
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, vkuznets@redhat.com,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2022-05-10 13:16:54, Guilherme G. Piccoli wrote:
> On 10/05/2022 12:16, Petr Mladek wrote:
> > [...]
> > Hmm, this looks like a hack. PANIC_UNUSED will never be used.
> > All notifiers will be always called with PANIC_NOTIFIER.
> > 
> > The @val parameter is normally used when the same notifier_list
> > is used in different situations.
> > 
> > But you are going to use it when the same notifier is used
> > in more lists. This is normally distinguished by the @nh
> > (atomic_notifier_head) parameter.
> > 
> > IMHO, it is a bad idea. First, it would confuse people because
> > it does not follow the original design of the parameters.
> > Second, the related code must be touched anyway when
> > the notifier is moved into another list so it does not
> > help much.
> > 
> > Or do I miss anything, please?
> > 
> > Best Regards,
> > Petr
> 
> Hi Petr, thanks for the review.
> 
> I'm not strong attached to this patch, so we could drop it and refactor
> the code of next patches to use the @nh as identification - but
> personally, I feel this parameter could be used to identify the list
> that called such function, in other words, what is the event that
> triggered the callback. Some notifiers are even declared with this
> parameter called "ev", like the event that triggers the notifier.
> 
> 
> You mentioned 2 cases:
> 
> (a) Same notifier_list used in different situations;
> 
> (b) Same *notifier callback* used in different lists;
> 
> Mine is case (b), right? Can you show me an example of case (a)?

There are many examples of case (a):

   + module_notify_list:
	MODULE_STATE_LIVE, 	/* Normal state. */
	MODULE_STATE_COMING,	/* Full formed, running module_init. */
	MODULE_STATE_GOING,	/* Going away. */
	MODULE_STATE_UNFORMED,	/* Still setting it up. */


   + netdev_chain:

	NETDEV_UP	= 1,	/* For now you can't veto a device up/down */
	NETDEV_DOWN,
	NETDEV_REBOOT,		/* Tell a protocol stack a network interface
				   detected a hardware crash and restarted
				   - we can use this eg to kick tcp sessions
				   once done */
	NETDEV_CHANGE,		/* Notify device state change */
	NETDEV_REGISTER,
	NETDEV_UNREGISTER,
	NETDEV_CHANGEMTU,	/* notify after mtu change happened */
	NETDEV_CHANGEADDR,	/* notify after the address change */
	NETDEV_PRE_CHANGEADDR,	/* notify before the address change */
	NETDEV_GOING_DOWN,
	...

    + vt_notifier_list:

	#define VT_ALLOCATE		0x0001 /* Console got allocated */
	#define VT_DEALLOCATE		0x0002 /* Console will be deallocated */
	#define VT_WRITE		0x0003 /* A char got output */
	#define VT_UPDATE		0x0004 /* A bigger update occurred */
	#define VT_PREWRITE		0x0005 /* A char is about to be written to the console */

    + die_chain:

	DIE_OOPS = 1,
	DIE_INT3,
	DIE_DEBUG,
	DIE_PANIC,
	DIE_NMI,
	DIE_DIE,
	DIE_KERNELDEBUG,
	...

These all call the same list/chain in different situations.
The situation is distinguished by @val.


> You can see in the following patches (or grep the kernel) that people are using
> this identification parameter to determine which kind of OOPS trigger
> the callback to condition the execution of the function to specific
> cases.

Could you please show me some existing code for case (b)?
I am not able to find any except in your patches.

Anyway, the solution in 16th patch is bad, definitely.
hv_die_panic_notify_crash() uses "val" to disinguish
both:

     + "panic_notifier_list" vs "die_chain"
     + die_val when callen via "die_chain"

The API around "die_chain" API is not aware of enum panic_notifier_val
and the API using "panic_notifier_list" is not aware of enum die_val.
As I said, it is mixing apples and oranges and it is error prone.

Best Regards,
Petr
