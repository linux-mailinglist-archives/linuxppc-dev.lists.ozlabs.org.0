Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F20355178
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 13:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF4My49brz30FD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 21:01:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nl9GFkH7;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yzGkWAKS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=nl9GFkH7; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=yzGkWAKS; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF4MW0CMGz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 21:01:10 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617706863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S2O1k9yZlYySt7+8gnNrDK/Yp/8kwoWX62PxlbcqwbA=;
 b=nl9GFkH778lC7VCrJOuaoV80FdfH0mtXyzGk6zcuRJPpzUbwbdCttQk6fZN0TWXbTNFRHS
 9OP4F05zxprZGg/xrYgT3Dc78sX2wQoXJufiMTarERPRiF1HwtW87KNXnnLCLPBwAEUI8l
 Lyi4cptRgwjQyWy4f5OzjrnYIUFDU3znx7RetH9ffo5pac9HdBj/wgI4zvpLnhJw7e2oAi
 h34q2YaMqx653oO2+7Tqu8iGaVsxQwJhHRPYLrqPOAfOpobaf1NbF3s91jgtawE7IIWdKE
 UV94lIL4ee0lGL/6gJg9KEoMtmeOBzCgkHyqOsp+irX0SlOmZB2rI9/coqhytg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617706863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S2O1k9yZlYySt7+8gnNrDK/Yp/8kwoWX62PxlbcqwbA=;
 b=yzGkWAKS3iH7xchc7y3QLe7xFMXuhjofzIxtdxB9f2DojJ4aTiCvWNPgQVcmr4T/abFsf7
 grBHNd4e9TDvqEDQ==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v2 2/5] printk: remove safe buffers
In-Reply-To: <YGXV8LJarjUJDhvy@alley>
References: <20210330153512.1182-1-john.ogness@linutronix.de>
 <20210330153512.1182-3-john.ogness@linutronix.de> <YGW63/elFr/gYW1u@alley>
 <87a6qiqgzr.fsf@jogness.linutronix.de> <YGXV8LJarjUJDhvy@alley>
Date: Tue, 06 Apr 2021 13:01:02 +0200
Message-ID: <87im4zoexd.fsf@jogness.linutronix.de>
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
 Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Rafael Aquini <aquini@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
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

On 2021-04-01, Petr Mladek <pmladek@suse.com> wrote:
>> Caller-id solves this problem and is easy to sort for anyone with
>> `grep'. Yes, it is a shame that `dmesg' does not show it, but
>> directly using any of the printk interfaces does show it (kmsg_dump,
>> /dev/kmsg, syslog, console).
>
> True but frankly, the current situation is _far_ from convenient:
>
>    + consoles do not show it by default
>    + none userspace tool (dmesg, journalctl, crash) is able to show it
>    + grep is a nightmare, especially if you have more than handful of CPUs
>
> Yes, everything is solvable but not easily.
>
>> >     I get this with "echo l >/proc/sysrq-trigger" and this patchset:
>> 
>> Of course. Without caller-id, it is a mess. But this has nothing to do
>> with NMI. The same problem exists for WARN_ON() on multiple CPUs
>> simultaneously. If the user is not using caller-id, they are
>> lost. Caller-id is the current solution to the interlaced logs.
>
> Sure. But in reality, the risk of mixed WARN_ONs is small. While
> this patch makes backtraces from all CPUs always unusable without
> caller_id and non-trivial effort.

I would prefer we solve the situation for non-NMI as well, not just for
the sysrq "l" case.

>> For the long term, we should introduce a printk-context API that allows
>> callers to perfectly pack their multi-line output into a single
>> entry. We discussed [0][1] this back in August 2020.
>
> We need a "short" term solution. There are currently 3 solutions:
>
> 1. Keep nmi_safe() and all the hacks around.
>
> 2. Serialize nmi_cpu_backtrace() by a spin lock and later by
>    the special lock used also by atomic consoles.
>
> 3. Tell complaining people how to sort the messed logs.

Or we look into the long term solution now. If caller-id's cannot not be
used as the solution (because nobody turns it on, nobody knows about it,
and/or distros do not enable it), then we should look at how to make at
least the backtraces contiguous. I have a few ideas here.

John Ogness
