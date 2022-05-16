Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2105281C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 12:22:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1wKz0RNkz3cB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 20:22:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=LWTnDo04;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=LWTnDo04; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1wKJ2RvZz3bcW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 May 2022 20:21:54 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 02AF51F930;
 Mon, 16 May 2022 10:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652696511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SKwT5B95E5YN9xa81VvHUpO+QGR+zcfCsbhuV2Jgp4=;
 b=LWTnDo04g2ZIMR91v0c2MAsYmxaUOl80sz+tTo9fRyqmuLzfAZ1jmcmhBu1F/2SwEKbidr
 AAgP6W9p9YHXuK9IdMK0VKJ5T49DYuwEAzjkXZlkWl2knT/MPCmRsL91fAF4WZ26S0Lq+5
 GaIq0ymGLcl5C1bryaGKOpn3k9Ph6bU=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 89FB92C141;
 Mon, 16 May 2022 10:21:48 +0000 (UTC)
Date: Mon, 16 May 2022 12:21:48 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Message-ID: <YoIlvFxbqoiDsD1l@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <Yn0TnsWVxCcdB2yO@alley>
 <d313eec2-96b6-04e3-35cd-981f103d010e@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d313eec2-96b6-04e3-35cd-981f103d010e@igalia.com>
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
 feng.tang@intel.com, "michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 john.ogness@linutronix.de, Baoquan He <bhe@redhat.com>, corbet@lwn.net,
 paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Dave Young <dyoung@redhat.com>, vgoyal@redhat.com,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 vkuznets@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun 2022-05-15 19:47:39, Guilherme G. Piccoli wrote:
> On 12/05/2022 11:03, Petr Mladek wrote:
> > This talks only about kdump. The reality is much more complicated.
> > The level affect the order of:
> > 
> >     + notifiers vs. kdump
> >     + notifiers vs. crash_dump
> >     + crash_dump vs. kdump
> 
> First of all, I'd like to ask you please to clarify to me *exactly* what
> are the differences between "crash_dump" and "kdump". I'm sorry if
> that's a silly question, I need to be 100% sure I understand the
> concepts the same way you do.

Ah, it should have been:

     + notifiers vs. kmsg_dump
     + notifiers vs. crash_dump
     + crash_dump vs. kmsg_dump

I am sorry for the confusion. Even "crash_dump" is slightly
misleading because there is no function with this name.
But it seems to be easier to understand than __crash_kexec().


> > There might theoretically many variants of the ordering of kdump,
> > crash_dump, and the 4 notifier list. Some variants do not make
> > much sense. You choose 5 variants and tried to select them by
> > a level number.
> > 
> > The question is if we really could easily describe the meaning this
> > way. It is not only about a "level" of notifiers before kdump. It is
> > also about the ordering of crash_dump vs. kdump. IMHO, "level"
> > semantic does not fit there.
> > 
> > Maybe more parameters might be easier to understand the effect.
> > Anyway, we first need to agree on the chosen variants.
> > I am going to discuss it more in the code, see below.
> > 
> > 
> > [...] 
> > Here is the code using the above functions. It helps to discuss
> > the design and logic.
> > 
> > I have to say that the logic is very unclear. Almost all
> > functions are called twice:
> > 
> > The really used code path is defined by order_panic_notifiers_and_kdump()
> > that encodes "level" into "bits". The bits are then flipped in
> > panic_notifier_*_once() calls that either do something or not.
> > kmsg_dump() is called according to the bit flip.
> > 
> > Also I guess that it is good proof that "level" abstraction does
> > not fit here. Normal levels would not need this kind of magic.
> 
> Heheh OK, I appreciate your opinion, but I guess we'll need to agree in
> disagree here - I'm much more fond to this kind of code than a bunch of
> if/else blocks that almost give headaches. Encoding such "level" logic
> in the if/else scheme is very convoluted, generates a very big code. And
> the functions aren't so black magic - they map a level in bits, and the
> functions _once() are called...once! Although we switch the position in
> the code, so there are 2 calls, one of them is called and the other not.

I see. Well, I would consider this as a warning that the approach is
too complex. If the code, using if/then/else, would cause headaches
then also understanding of the behavior would cause headaches for
both users and programmers.


> But that's totally fine to change - especially if we're moving away from
> the "level" logic. I see below you propose a much simpler approach - if
> we follow that, definitely we won't need the "black magic" approach heheh

I do not say that my proposal is fully correct. But we really need
this kind of simpler approach.


> > OK, the question is how to make it better.

> > One option "panic_prefer_crash_dump" should be enough.
> > And the code might look like:
> > 
> > void panic()
> > {
> > [...]
> > 	dump_stack();
> > 	kgdb_panic(buf);
> > 
> > 	< ---  here starts the reworked code --- >
> > 
> > 	/* crash dump is enough when enabled and preferred. */
> > 	if (panic_prefer_crash_dump)
> > 		__crash_kexec(NULL);
> > 
> > 	/* Stop other CPUs and focus on handling the panic state. */
> > 	if (has_kexec_crash_image)
> > 		crash_smp_send_stop();
> > 	else
> > 		smp_send_stop()
> > 
> 
> Here we have a very important point. Why do we need 2 variants of SMP
> CPU stopping functions? I disagree with that - my understanding of this
> after some study in architectures is that the crash_() variant is
> "stronger", should work in all cases and if not, we should fix that -
> that'd be a bug.
> 
> Such variant either maps to smp_send_stop() (in various architectures,
> including XEN/x86) or overrides the basic function with more proper
> handling for panic() case...I don't see why we still need such
> distinction, if you / others have some insight about that, I'd like to
> hear =)

The two variants were introduced by the commit 0ee59413c967c35a6dd
("x86/panic: replace smp_send_stop() with kdump friendly version in
panic path")

It points to https://lkml.org/lkml/2015/6/24/44 that talks about
still running watchdogs.

It is possible that the problem could be fixed another way. It is
even possible that it has already been fixed by the notifiers
that disable the watchdogs.

Anyway, any change of the smp_send_stop() behavior should be done
in a separate patch. It will help with bisection of possible
regression. Also it would require a good explanation in
the commit message. I would personally do it in a separate
patch(set).


> > 	/* Notify hypervisor about the system panic. */
> > 	atomic_notifier_call_chain(&panic_hypervisor_list, 0, NULL);
> > 
> > 	/*
> > 	 * No need to risk extra info when there is no kmsg dumper
> > 	 * registered.
> > 	 */
> > 	if (!has_kmsg_dumper())
> > 		__crash_kexec(NULL);
> > 
> > 	/* Add extra info from different subsystems. */
> > 	atomic_notifier_call_chain(&panic_info_list, 0, NULL);
> > 
> > 	kmsg_dump(KMSG_DUMP_PANIC);
> > 	__crash_kexec(NULL);
> > 
> > 	/* Flush console */
> > 	unblank_screen();
> > 	console_unblank();
> > 	debug_locks_off();
> > 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
> > 
> > 	if (panic_timeout > 0) {
> > 		delay()
> > 	}
> > 
> > 	/*
> > 	 * Prepare system for eventual reboot and allow custom
> > 	 * reboot handling.
> > 	 */
> > 	atomic_notifier_call_chain(&panic_reboot_list, 0, NULL);
> 
> You had the order of panic_reboot_list VS. consoles flushing inverted.
> It might make sense, although I didn't do that in V1...

IMHO, it makes sense:

  1. panic_reboot_list contains notifiers that do the reboot
     immediately, for example, xen_panic_event, alpha_panic_event.
     The consoles have to be flushed earlier.

  2. console_flush_on_panic() ignores the result of console_trylock()
     and always calls console_unlock(). As a result the lock should
     be unlocked at the end. And any further printk() should be able
     to printk the messages to the console immediately. It means
     that any messages printed by the reboot notifiers should appear
     on the console as well.

> Are you OK in having a helper for console flushing, as I did in V1? It
> makes code of panic() a bit less polluted / more focused I feel.

Yes, it makes sense. Well, it would better to do it in a separate
patch. The patch patch reworking the logic should be as small
as possible. It will simplify the review.


> > 	if (panic_timeout != 0) {
> > 		reboot();
> > 	}
> > 
> > 	/*
> > 	 * Prepare system for the infinite waiting, for example,
> > 	 * setup blinking.
> > 	 */
> > 	atomic_notifier_call_chain(&panic_loop_list, 0, NULL);
> > 
> > 	infinite_loop();
> > }
> > 
> > 
> > __crash_kexec() is there 3 times but otherwise the code looks
> > quite straight forward.
> > 
> > Note 1: I renamed the two last notifier list. The name 'post-reboot'
> > 	did sound strange from the logical POV ;-)
> > 
> > Note 2: We have to avoid the possibility to call "reboot" list
> > 	before kmsg_dump(). All callbacks providing info
> > 	have to be in the info list. It a callback combines
> > 	info and reboot functionality then it should be split.
> > 
> > 	There must be another way to calm down problematic
> > 	info callbacks. And it has to be solved when such
> > 	a problem is reported. Is there any known issue, please?
> > 
> > It is possible that I have missed something important.
> > But I would really like to make the logic as simple as possible.
> 
> OK, I agree with you! It's indeed simpler and if others agree, I can
> happily change the logic to what you proposed. Although...currently the
> "crash_kexec_post_notifiers" allows to call _all_ panic_reboot_list
> callbacks _before kdump_.
>
> We need to mention this change in the commit messages, but I really
> would like to hear the opinions of heavy users of notifiers (as
> Michael/Hyper-V) and the kdump interested parties (like Baoquan / Dave
> Young / Hayatama). If we all agree on such approach, will change that
> for V2 =)

Sure, we need to make sure that we call everything that is needed.
And it should be documented.

I believe that this is the right way because:

  + It was actually the motivation for this patchset. We split
    the notifiers into separate lists because we want to call
    only the really needed ones before kmsg_dump and crash_dump.

  + If anything is needed for crash_dump that it should be called
    even when crash_dump is called first. It should be either
    hardcoded into crash_dump() or we would need another notifier
    list that will be always called before crash_dump.


Thanks a lot for working on this.

Best Regards,
Petr
