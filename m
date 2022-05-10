Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07238522703
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 00:43:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyY3H72p5z3cLG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 08:43:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=s9qpTYE/;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vLCouTuS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=s9qpTYE/; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=vLCouTuS; 
 dkim-atps=neutral
X-Greylist: delayed 534 seconds by postgrey-1.36 at boromir;
 Wed, 11 May 2022 05:49:43 AEST
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyTCC2YCwz3bhF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 05:49:43 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1652211640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OEDxfxfGB0zzvmyrmmb19QrPenmgyOx+wB7aMTpPY14=;
 b=s9qpTYE/3WJU4N3KJVSOdyb7xWHt1vkR4fCuQ5J8Zkt0v0hhGnmBmJdDRvMzx7U23g78AD
 5x0GWGYOK6up5rJgLjlqAJ0oKWgxSuZArLqIZD7/93+m719asCNv2npDv0K4E3pzaf0TU1
 QT3fxi7rAkTN0NzY7sIU3W6vHFJAKmFF1D5WFGFp25IVzQ1U2GLRWaAA15JzW4DMVMPiln
 C4PlGutDHid0b5MW+yz4Oad3VH/9G9wKQ7qYFzrw5pmS2R8UQ108RRuRC1xOe7QqhudZaN
 toooF05flVTdgRJ8Mw90Ti/8UtTs7R3lmx6LjRAd0TtWQNVsyqtk/eFe4jDJKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1652211640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OEDxfxfGB0zzvmyrmmb19QrPenmgyOx+wB7aMTpPY14=;
 b=vLCouTuSreEprlIyaHBdxRuhj0utQMxldxJLsrUVX2CbalgS135YGbpGNA0WSY+j9euZdD
 GTFEAV97omDLmGAg==
To: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
In-Reply-To: <20220510132015.38923cb2@gandalf.local.home>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-5-gpiccoli@igalia.com>
 <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
 <adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com> <YnpOv4hAPV4b+6v4@alley>
 <20220510132015.38923cb2@gandalf.local.home>
Date: Tue, 10 May 2022 21:46:38 +0206
Message-ID: <87h75xkwg9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 11 May 2022 08:37:45 +1000
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
 David Gow <davidgow@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, mikelley@microsoft.com, paulmck@kernel.org,
 bhe@redhat.com, Jonathan Corbet <corbet@lwn.net>, fabiomirmar@gmail.com,
 x86@kernel.org, Evan Green <evgreen@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 linux-um@lists.infradead.org, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, senozhatsky@chromium.org,
 vkuznets@redhat.com, linux-edac@vger.kernel.org, jgross@suse.com,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, kernel@gpiccoli.net,
 kexec@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-05-10, Steven Rostedt <rostedt@goodmis.org> wrote:
>> As already mentioned in the other reply, panic() sometimes stops the
>> other CPUs using NMI, for example, see kdump_nmi_shootdown_cpus().
>> 
>> Another situation is when the CPU using the lock ends in some
>> infinite loop because something went wrong. The system is in
>> an unpredictable state during panic().
>> 
>> I am not sure if this is possible with the code under gsmi_dev.lock
>> but such things really happen during panic() in other subsystems.
>> Using trylock in the panic() code path is a good practice.
>
> I believe that Peter Zijlstra had a special spin lock for NMIs or
> early printk, where it would not block if the lock was held on the
> same CPU. That is, if an NMI happened and paniced while this lock was
> held on the same CPU, it would not deadlock. But it would block if the
> lock was held on another CPU.

Yes. And starting with 5.19 it will be carrying the name that _you_ came
up with (cpu_sync):

printk_cpu_sync_get_irqsave()
printk_cpu_sync_put_irqrestore()

John
