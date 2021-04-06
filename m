Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2385B3551CC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 13:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF4lM157Fz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 21:18:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=PAPEhIZf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=PAPEhIZf; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF4kt4Xqdz2yx1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 21:17:57 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1617707873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fSuO/VW+4decWYFfrvqFXfusfZIlDNCC7v2+c0XWZNo=;
 b=PAPEhIZfLegtekKTZbyfOl81UNz8pz/kgdVoCWlQ7KlRomwHba9R9oKWB7w9Fro7JYGctH
 JBUkAnWeVgDeuUYHC5hWZE8psWje/FUDf0OHOZlEGwVr885jT6I0PNz7c4TKgneYv7NhyW
 okifsrMShl9eL/r1m+KFPF8Amq2bFnw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C581FB155;
 Tue,  6 Apr 2021 11:17:52 +0000 (UTC)
Date: Tue, 6 Apr 2021 13:17:48 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH printk v2 2/5] printk: remove safe buffers
Message-ID: <YGxDXBJAolBCtojY@alley>
References: <20210330153512.1182-1-john.ogness@linutronix.de>
 <20210330153512.1182-3-john.ogness@linutronix.de>
 <YGW63/elFr/gYW1u@alley> <87a6qiqgzr.fsf@jogness.linutronix.de>
 <YGXV8LJarjUJDhvy@alley> <YGZ9+kfQKxASmVDR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGZ9+kfQKxASmVDR@google.com>
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
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 John Ogness <john.ogness@linutronix.de>,
 Alistair Popple <alistair@popple.id.au>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2021-04-02 11:14:18, Sergey Senozhatsky wrote:
> On (21/04/01 16:17), Petr Mladek wrote:
> > > For the long term, we should introduce a printk-context API that allows
> > > callers to perfectly pack their multi-line output into a single
> > > entry. We discussed [0][1] this back in August 2020.
> > 
> > We need a "short" term solution. There are currently 3 solutions:
> > 
> > 1. Keep nmi_safe() and all the hacks around.
> > 
> > 2. Serialize nmi_cpu_backtrace() by a spin lock and later by
> >    the special lock used also by atomic consoles.
> > 
> > 3. Tell complaining people how to sort the messed logs.
> 
> Are we talking about nmi_cpu_backtrace()->dump_stack() or some
> other path?

It is about serializing

			if (regs)
				show_regs(regs);
			else
				dump_stack();

in nmi_cpu_backtrace() when it is triggered on many(all) CPUs
at the same time.


> dump_stack() seems to be already serialized by `dump_lock`. Hmm,
> show_regs() is not serialized, seems like it should be under the
> same `dump_lock` as dump_stack().

Ah, I think that you already mentioned it in the past and I forget it.

Yes, we would need to synchronize all these dump/show functions using
the same lock. It is already the lock that might be taken recursively
on the same CPU.

In each case, we must not introduce another lock in
nmi_cpu_backtrace() because it might cause deadlock with
@dump_lock.

Anyway, I would really like to keep the dumps serialized. So, we
either need to use the same lock everywhere or we need to keep
nmi_safe buffers for now.

I would like to remove the nmi_safe buffers in the long term
but I am fine with doing it later after the consoles rework.
I'll leave the prioritization for John who is doing the work
and might have some preferences.

Best Regards,
Petr
