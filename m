Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2CB3D0EE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 14:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVFhV0k4Qz3bgZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 22:46:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=19cTuzoz;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q3q0I7J1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=19cTuzoz; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=Q3q0I7J1; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVFgy4wZKz2yXJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 22:46:22 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1626871576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cdS1buxKYZqBBBQSENm52Z2BdiL5OnJduLY+Z3jB0eY=;
 b=19cTuzozpKz2m6yusdcjCowUC++mkWqLuMbFOlmc71QS6OURW5sQ6dio/NqnOtRZeXzL1/
 +sm52j62lmS4IzDSo2BJ19dqnWgssdXP5w8YxJXYiz2iWB/PXPeKvROVkwxP3thsSMyLrq
 vT5nJSVsl7l2xwbIcYE0ziUAViZLIVMnn7Cy7ZRhf1oaWPR3QimBaa0uM14kHH8ZSeB7iM
 YT/keUdJIe8LfMBpy7OMPwJ7QSb0mSLKRvhhKG7MYtwtJ0Ti9B0svmKRRP7jxfhIoXoSuX
 GycPdi8THSadrxXzDb/uC2gEGFUhul2oHeGVLPHLgTUFTx4wwdBN6U+SJUqNHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1626871576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cdS1buxKYZqBBBQSENm52Z2BdiL5OnJduLY+Z3jB0eY=;
 b=Q3q0I7J1FXSbLrOv/qmQ4GnglOnFnnEdRZSKWXYKU6ktHo5Y2/FmNqCrN5Gn0IA5Cxbouu
 CMBE6+4XHA57LkDw==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v4 4/6] printk: remove NMI tracking
In-Reply-To: <20210721120026.y3dqno24ahw4sazy@pathway.suse.cz>
References: <20210715193359.25946-1-john.ogness@linutronix.de>
 <20210715193359.25946-5-john.ogness@linutronix.de>
 <20210721120026.y3dqno24ahw4sazy@pathway.suse.cz>
Date: Wed, 21 Jul 2021 14:52:15 +0206
Message-ID: <877dhjygvc.fsf@jogness.linutronix.de>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 Paul Mackerras <paulus@samba.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vipin Sharma <vipinsh@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Terrell <terrelln@fb.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Xiongwei Song <sxwjean@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-07-21, Petr Mladek <pmladek@suse.com> wrote:
>> --- a/kernel/trace/trace.c
>> +++ b/kernel/trace/trace.c
>> @@ -9647,7 +9647,7 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
>>  	tracing_off();
>>  
>>  	local_irq_save(flags);
>> -	printk_nmi_direct_enter();
>> +	printk_deferred_enter();
>
> I would prefer to do not manipulate the printk context here anymore,
> as it was done in v3.
>
> printk_nmi_direct_enter() was added here by the commit the commit
> 03fc7f9c99c1e7ae2925d4 ("printk/nmi: Prevent deadlock when
> accessing the main log buffer in NMI"). It was _not_ about console
> handling. The reason was to modify the default behavior under NMI
> and store the messages directly into the main log buffer.
>
> When I think about it. The original fix was not correct. We should have
> modified the context only when ftrace_dump() was really called under NMI:
>
> 	if (in_nmi())
> 		printk_nmi_direct_enter();
>
> By other words. We should try to show the messages on the console
> when ftrace_dump()/panic() is not called from NMI. It will help
> to see all messages even when the ftrace buffers are bigger
> than printk() ones.
>
> And we do not need any special handling here for NMI. vprintk()
> in printk/printk_safe.c will do the right thing for us.

Agreed. We need to mention this behavior change in the commit
message. Perhaps this as the commit message:

All NMI contexts are handled the same as the safe context: store the
message and defer printing. There is no need to have special NMI
context tracking for this. Using in_nmi() is enough.

There are several parts of the kernel that are manually calling into
the printk NMI context tracking in order to cause general printk
deferred printing:

    arch/arm/kernel/smp.c
    arch/powerpc/kexec/crash.c
    kernel/trace/trace.c

For arm/kernel/smp.c and powerpc/kexec/crash.c, provide a new
function pair printk_deferred_enter/exit that explicitly achieves the
same objective.

For ftrace, remove general printk deferring. This general deferrment
was added in commit 03fc7f9c99c1 ("printk/nmi: Prevent deadlock when
accessing the main log buffer in NMI"), but really should have only
been deferred when in NMI context. Since vprintk() now checks for
NMI context when deciding to defer, ftrace does not need any special
handling.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
