Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A751914B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 00:22:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtDwq54wJz3cBg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 08:22:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=g6wHrcBw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=g6wHrcBw; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt8k947Knz2x9M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 05:13:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YwqRVzAP9ZbrZ5VBMcTGFQUJhCIOHa56e0xcGxSMZUc=; b=g6wHrcBwrz2KwYvXjjVtORBiHn
 IYMsR5GaRD/VR0xedfaxvBvF7rTbYR/J22t3j5lb3f06u/Fc1RouLR18wpSiKcYUFYo1Es0dUnLOJ
 KS0gcPiTX1Gp43QoEXeB9qey3fro+JGWKqZb1HOFCCA1BT9LzygpBsI5rkGlNutynR2bG5HAOwC/E
 tPyLP92RA6GDIRm0QuhAm+c5aBu4j0UaKxwKd9I7j0kUsDE4qHndJxIdGDBq1RIB7dNA6suRfXZwh
 e21o4FfMtSVNbUCh0WQI73Gd4fdNm7+rXf7RsUeEiM3OYwwmkesCvbsvfiNKmEoMOIdut9FTHQRzP
 TtMjBb/w==;
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nlxwt-0003VB-Uo; Tue, 03 May 2022 21:12:40 +0200
Message-ID: <adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com>
Date: Tue, 3 May 2022 16:12:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
Content-Language: en-US
To: Evan Green <evgreen@chromium.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-5-gpiccoli@igalia.com>
 <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 04 May 2022 08:18:47 +1000
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
 David Gow <davidgow@google.com>, linux-xtensa@linux-xtensa.org,
 peterz@infradead.org, alejandro.j.jimenez@oracle.com,
 linux-remoteproc@vger.kernel.org, feng.tang@intel.com,
 linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, mikelley@microsoft.com, john.ogness@linutronix.de,
 bhe@redhat.com, Jonathan Corbet <corbet@lwn.net>, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com,
 pmladek@suse.com, dave.hansen@linux.intel.com,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>, linux-um@lists.infradead.org,
 rostedt@goodmis.org, rcu@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, vkuznets@redhat.com,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/05/2022 15:03, Evan Green wrote:
> [...]
> gsmi_shutdown_reason() is a common function called in other scenarios
> as well, like reboot and thermal trip, where it may still make sense
> to wait to acquire a spinlock. Maybe we should add a parameter to
> gsmi_shutdown_reason() so that you can get your change on panic, but
> we don't convert other callbacks into try-fail scenarios causing us to
> miss logs.
> 

Hi Evan, thanks for your feedback, much appreciated!
What I've done in other cases like this was to have a helper checking
the spinlock in the panic notifier - if we can acquire that, go ahead
but if not, bail out. For a proper example of an implementation, check
patch 13 of the series:
https://lore.kernel.org/lkml/20220427224924.592546-14-gpiccoli@igalia.com/ .

Do you agree with that, or prefer really a parameter in
gsmi_shutdown_reason() ? I'll follow your choice =)


> Though thinking more about it, is this really a Good Change (TM)? The
> spinlock itself already disables interrupts, meaning the only case
> where this change makes a difference is if the panic happens from
> within the function that grabbed the spinlock (in which case the
> callback is also likely to panic), or in an NMI that panics within
> that window. The downside of this change is that if one core was
> politely working through an event with the lock held, and another core
> panics, we now might lose the panic log, even though it probably would
> have gone through fine assuming the other core has a chance to
> continue.

My feeling is that this is a good change, indeed - a lot of places are
getting changed like this, in this series.

Reasoning: the problem with your example is that, by default, secondary
CPUs are disabled in the panic path, through an IPI mechanism. IPIs take
precedence and interrupt the work in these CPUs, effectively
interrupting the "polite work" with the lock held heh

Then, such CPU is put to sleep and we finally reach the panic notifier
hereby discussed, in the main CPU. If the other CPU was shut-off *with
the lock held*, it's never finishing such work, so the lock is never to
be released. Conclusion: the spinlock can't be acquired, hence we broke
the machine (which is already broken, given it's panic) in the path of
this notifier.
This should be really rare, but..possible. So I think we should protect
against this scenario.

We can grab others' feedback if you prefer, and of course you have the
rights to refuse this change in the gsmi code, but from my
point-of-view, I don't see any advantage in just assume the risk,
specially since the change is very very simple.

Cheers,


Guilherme
