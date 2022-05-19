Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D111952E0C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 01:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L461c4lK5z30Bl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 09:45:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A1NmWK4G;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cH1jZ7B9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=A1NmWK4G; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=cH1jZ7B9; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L460w6wDWz309l
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 09:45:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653003913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xcqeqNHBqLaEPFvaMSIdVsHM/2ssgjepqSc89Z+McDY=;
 b=A1NmWK4G/Tnr0+ZlvjpzQNqsGDIO7dshbDJJZGU9Ozj9ysKdnjToR8iYdxDb4XepI7+eEu
 ++yRczmz9zH5sWH8dFkaOI4ulJi/SonkfTgO3YUIPDJGJfSX+1m5zB3Ti40m+jCy0Hc46d
 cqhJ1ggmZQrOzIHoYrjADt2ocDfcP3E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653003914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xcqeqNHBqLaEPFvaMSIdVsHM/2ssgjepqSc89Z+McDY=;
 b=cH1jZ7B9s6QPsLL95flJcVUTqhu/a/tgBUpghaM5U6BI16PpGbL0aFbZt3tCOe0LuHUd1p
 9Ag8XSB23ERy2dy9dibS8wRkFYY7oTZKGNoiOANIJKG3KWOtYWosuDQR4zKR+E6Ce+bJCZ
 dO967Y0vDCSFGo7+e6Ic1TcGvCPGhxs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-51qE-HMZMJ-_l5k-QlXFHg-1; Thu, 19 May 2022 19:45:10 -0400
X-MC-Unique: 51qE-HMZMJ-_l5k-QlXFHg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A41B685A5AA;
 Thu, 19 May 2022 23:45:07 +0000 (UTC)
Received: from localhost (ovpn-12-42.pek2.redhat.com [10.72.12.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ABA5492C14;
 Thu, 19 May 2022 23:45:06 +0000 (UTC)
Date: Fri, 20 May 2022 07:45:02 +0800
From: Baoquan He <bhe@redhat.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Message-ID: <20220519234502.GA194232@MiWiFi-R3L-srv>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <Yn0TnsWVxCcdB2yO@alley>
 <d313eec2-96b6-04e3-35cd-981f103d010e@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d313eec2-96b6-04e3-35cd-981f103d010e@igalia.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
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

On 05/15/22 at 07:47pm, Guilherme G. Piccoli wrote:
> On 12/05/2022 11:03, Petr Mladek wrote:
...... 
> > OK, the question is how to make it better. Let's start with
> > a clear picture of the problem:
> > 
> > 1. panic() has basically two funtions:
> > 
> >       + show/store debug information (optional ways and amount)
> >       + do something with the system (reboot, stay hanged)
> > 
> > 
> > 2. There are 4 ways how to show/store the information:
> > 
> >       + tell hypervisor to store what it is interested about
> >       + crash_dump
> >       + kmsg_dump()
> >       + consoles
> > 
> >   , where crash_dump and consoles are special:
> > 
> >      + crash_dump does not return. Instead it ends up with reboot.
> > 
> >      + Consoles work transparently. They just need an extra flush
> >        before reboot or staying hanged.
> > 
> > 
> > 3. The various notifiers do things like:
> > 
> >      + tell hypervisor about the crash
> >      + print more information (also stop watchdogs)
> >      + prepare system for reboot (touch some interfaces)
> >      + prepare system for staying hanged (blinking)
> > 
> >    Note that it pretty nicely matches the 4 notifier lists.
> > 
> 
> I really appreciate the summary skill you have, to convert complex
> problems in very clear and concise ideas. Thanks for that, very useful!
> I agree with what was summarized above.

I want to say the similar words to Petr's reviewing comment when I went
through the patches and traced each reviewing sub-thread to try to
catch up. Petr has reivewed this series so carefully and given many
comments I want to ack immediately.

I agree with most of the suggestions from Petr to this patch, except of
one tiny concern, please see below inline comment.

> 
> 
> > Now, we need to decide about the ordering. The main area is how
> > to store the debug information. Consoles are transparent so
> > the quesition is about:
> > 
> >      + hypervisor
> >      + crash_dump
> >      + kmsg_dump
> > 
> > Some people need none and some people want all. There is a
> > risk that system might hung at any stage. This why people want to
> > make the order configurable.
> > 
> > But crash_dump() does not return when it succeeds. And kmsg_dump()
> > users havn't complained about hypervisor problems yet. So, that
> > two variants might be enough:
> > 
> >     + crash_dump (hypervisor, kmsg_dump as fallback)
> >     + hypervisor, kmsg_dump, crash_dump
> > 
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

I like the proposed skeleton of panic() and code style suggested by
Petr very much. About panic_prefer_crash_dump which might need be added,
I hope it has a default value true. This makes crash_dump execute at
first by default just as before, unless people specify
panic_prefer_crash_dump=0|n|off to disable it. Otherwise we need add
panic_prefer_crash_dump=1 in kernel and in our distros to enable kdump,
this is inconsistent with the old behaviour.

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
> 
> 
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
> Are you OK in having a helper for console flushing, as I did in V1? It
> makes code of panic() a bit less polluted / more focused I feel.
> 
> 
> > 
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
> 
> Thanks again Petr, for the time spent in such detailed review!
> Cheers,
> 
> 
> Guilherme
> 

