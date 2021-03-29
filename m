Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C70B34D359
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 17:10:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8GH41pKsz30Hn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 02:10:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3lmkfVXQ;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IAdBFzE0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=3lmkfVXQ; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=IAdBFzE0; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8GGb5k2Sz2yRg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 02:10:15 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617030603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=czaWfQDmWfTZZyk40/r3fn5m8w82rCTMKw/DG6KyCoA=;
 b=3lmkfVXQ6Kn8x60NUjbCQEHJ6ITAaNLJLrTnRuRX79GChppNS9h4DSkLF9ihUdwo1uxBBf
 nRbSqQ7ZgOFX/uwi8bTzSHRM2J7jRcMz+LBfdbllOjxGHkLMkCsWez4kglhEbvuHhpEUUs
 IckgkHO26+svKMgFIWzihmC95ey6tfnNRWzz33LTUZn5t6psLWN5YNgYffoS5d/azDT+4F
 R8YtzpNyVod55yDrfeqRVze0rWL4ZPvemU3Qvb7xvlqL2wEbZQrLZmQwA+f2tlDQdvYNHz
 XcUrWIXlJ6UH4PiTv6M/UYTqpmgVxiA3F7vils6OtvtTO4ZQW7Dv93hVGX8P2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617030603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=czaWfQDmWfTZZyk40/r3fn5m8w82rCTMKw/DG6KyCoA=;
 b=IAdBFzE0yMQolHI4rDtJPaIUbjeNL+Gd3Mx/YUdTHGxrOCZhymDMIWuCIWSOB9MI2RgLFn
 p9Fb5UQys2JfXMAg==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH next v1 2/3] printk: remove safe buffers
In-Reply-To: <YGGmNu5ilDnSKH3g@alley>
References: <20210316233326.10778-1-john.ogness@linutronix.de>
 <20210316233326.10778-3-john.ogness@linutronix.de> <YFnHKlCvIA2nI41c@alley>
 <87pmzmi2xm.fsf@jogness.linutronix.de> <YGGmNu5ilDnSKH3g@alley>
Date: Mon, 29 Mar 2021 17:10:02 +0200
Message-ID: <87sg4e6lo5.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Rafael Aquini <aquini@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>, "Guilherme G.
 Piccoli" <gpiccoli@canonical.com>, Nicholas Piggin <npiggin@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-03-29, Petr Mladek <pmladek@suse.com> wrote:
> I wonder if some console drivers rely on the fact that the write()
> callback is called with interrupts disabled.
>
> IMHO, it would be a bug when any write() callback expects that
> callers disabled the interrupts.

Agreed.

> Do you plan to remove the console-spinning stuff after offloading
> consoles to the kthreads?

Yes. Although a similar concept will be introduced to allow the threaded
printers and the atomic consoles to compete.

> Will you call console write() callback with irq enabled from the
> kthread?

No. That defeats the fundamental purpose of this entire rework
excercise. ;-)

> Anyway, we should at least add a comment why the interrupts are
> disabled.

I decided to move the local_irq_save/restore inside the console-spinning
functions and added a comment for v2.

John Ogness
