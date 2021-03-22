Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA99343F6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 12:16:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3sQQ4N39z2ysp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 22:16:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HGQ4Dq/Q;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GVJkDM5N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=HGQ4Dq/Q; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=GVJkDM5N; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3sPy3hlmz2y0D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 22:16:22 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1616411776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6MCD7pdLm1m9o0nSZfcGVynnHaaFFKisNBi8FUOUDI=;
 b=HGQ4Dq/QId1GFRVx1HMe3bnD4P4EIomI4JZ4cANiCSDYQJY6xdBYfGImEqIIUdflHSb2eG
 AG5nGJdk4lX5XVjaaiqS//GrJsVJP9Ijq8bdaIbrE7SKJoEIGdLpM/EDcpQBAB2lQgk6MU
 X8oZeFM6ONCXtShUT3/k50CnKRxnUQZBn4N/a/5fbdnrL+44mEG7qAdlWW2Tg8FmxwI7Oq
 VShNPK4jV2pQROn0KgdIlW5lbfX0nvRrf220GY7eMXUDCtKPCuFUg0M0FJO/mwUwNdxzQ1
 QbMS2AQMn4FOISkPvPjbMNIlD+XNpFoBkR2xwJ+6iO0Nm/Vq0xMd3c4LvxLrUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1616411776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6MCD7pdLm1m9o0nSZfcGVynnHaaFFKisNBi8FUOUDI=;
 b=GVJkDM5NKKZT5EVSKd6owK/h9IbxTC3ADU1q8YrkwIBQ319MtYvZb+Ca0JzfmiT2F1P3nA
 kRaLvwiQ6+lXkyDA==
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH next v1 2/3] printk: remove safe buffers
In-Reply-To: <YFbY8kF7ilYoxvYp@google.com>
References: <20210316233326.10778-1-john.ogness@linutronix.de>
 <20210316233326.10778-3-john.ogness@linutronix.de>
 <YFbY8kF7ilYoxvYp@google.com>
Date: Mon, 22 Mar 2021 12:16:15 +0100
Message-ID: <87k0pzmoao.fsf@jogness.linutronix.de>
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
Cc: Rafael Aquini <aquini@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Paul Mackerras <paulus@samba.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-03-21, Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
>> @@ -369,7 +70,10 @@ __printf(1, 0) int vprintk_func(const char *fmt, va_list args)
>>  	 * Use the main logbuf even in NMI. But avoid calling console
>>  	 * drivers that might have their own locks.
>>  	 */
>> -	if ((this_cpu_read(printk_context) & PRINTK_NMI_DIRECT_CONTEXT_MASK)) {
>> +	if (this_cpu_read(printk_context) &
>> +	    (PRINTK_NMI_DIRECT_CONTEXT_MASK |
>> +	     PRINTK_NMI_CONTEXT_MASK |
>> +	     PRINTK_SAFE_CONTEXT_MASK)) {
>
> Do we need printk_nmi_direct_enter/exit() and
> PRINTK_NMI_DIRECT_CONTEXT_MASK?  Seems like all printk_safe() paths
> are now DIRECT - we store messages to the prb, but don't call console
> drivers.

I was planning on waiting until the kthreads are introduced, in which
case printk_safe.c is completely removed. But I suppose I could switch
the 1 printk_nmi_direct_enter() user to printk_nmi_enter() so that
PRINTK_NMI_DIRECT_CONTEXT_MASK can be removed now. I would do this in a
4th patch of the series.

John Ogness
