Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8388454B346
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 16:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMrbt47jzz3cGf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:36:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=B9wTA4hA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=B9wTA4hA;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMrbD6M9cz2yyS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 00:36:07 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 8286121B97;
	Tue, 14 Jun 2022 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655217363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7h6hH0gYTond1cgiS/uMW2G4mVmL8aIozW74ouv+gK4=;
	b=B9wTA4hA6Qxez4dhaQq2jaLjcRQqv8/C1d0oKbtJxHWYl3duIpfM3QjZ2J2ZIG1jByzjIk
	ObTWFZbyZcppMylTomPCNwhynw9TlYQGEMrmiuv4k8IcEezBoIE3JYy9Oiijt3mtdocbSR
	YntR36rSYs/Otfz0SDXm/BOtVHJZFAE=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 0C0ED2C142;
	Tue, 14 Jun 2022 14:36:01 +0000 (UTC)
Date: Tue, 14 Jun 2022 16:36:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Message-ID: <Yqic0R8/UFqTbbMD@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <87fskzuh11.fsf@email.froward.int.ebiederm.org>
 <0d084eed-4781-c815-29c7-ac62c498e216@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d084eed-4781-c815-29c7-ac62c498e216@igalia.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-hyperv@vger.kernel.org, halves@canonical.com, gregkh@linuxfoundation.org, peterz@infradead.org, alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org, feng.tang@intel.com, mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org, dyoung@redhat.com, vgoyal@redhat.com, mhiramat@kernel.org, linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org, linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 andriy.shevchenko@linux.intel.com, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, "Eric W. Biederman" <ebiederm@xmission.com>, kernel-dev@igalia.com, linux-alpha@vger.kernel.org, vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2022-05-26 13:25:57, Guilherme G. Piccoli wrote:
> OK, so it seems we have some points in which agreement exists, and some
> points that there is no agreement and instead, we have antagonistic /
> opposite views and needs. Let's start with the easier part heh
>
> It seems everybody agrees that *we shouldn't over-engineer things*, and
> as per Eric good words: making the panic path more feature-full or
> increasing flexibility isn't a good idea. So, as a "corollary": the
> panic level approach I'm proposing is not a good fit, I'll drop it and
> let's go with something simpler.

Makes sense.

> Another point of agreement seems to be that _notifier lists in the panic
> path are dangerous_, for *2 different reasons*:
> 
> (a) We cannot guarantee that people won't add crazy callbacks there, we
> can plan and document things the best as possible - it'll never be
> enough, somebody eventually would slip a nonsense callback that would
> break things and defeat the planned purpose of such a list;

It is true that notifier lists might allow to add crazy stuff
without proper review more easily. Things added into the core
code would most likely get better review.

But nothing is error-proof. And bugs will happen with any approach.


> (b) As per Eric point, in a panic/crash situation we might have memory
> corruption exactly in the list code / pointers, etc, so the notifier
> lists are, by nature, a bit fragile. But I think we shouldn't consider
> it completely "bollocks", since this approach has been used for a while
> with a good success rate. So, lists aren't perfect at all, but at the
> same time, they aren't completely useless.

I am not able to judge this. Of course, any extra step increases
the risk. I am just not sure how much more complicated it would
be to hardcode the calls. Most of them are architecture
and/or feature specific. And such code is often hard to
review and maintain.

> To avoid using a 4th list,

4th or 5th? We already have "hypervisor", "info", "pre-reboot", and "pre-loop".
The 5th might be pre-crash-exec.

> especially given the list nature is a bit
> fragile, I'd suggest one of the 3 following approaches - I *really
> appreciate feedbacks* on that so I can implement the best solution and
> avoid wasting time in some poor/disliked solution:

Honestly, I am not able to decide what might be better without seeing
the code.

Most things fits pretty well into the 4 proposed lists:
"hypervisor", "info", "pre-reboot", and "pre-loop". IMHO, the
only question is the code that needs to be always called
even before crash_dump.

I suggest that you solve the crash_dump callbacks the way that
looks best to you. Ideally do it in a separate patch so it can be
reviewed and reworked more easily.

I believe that a fresh code with an updated split and simplified
logic would help us to move forward.

Best Regards,
Petr
