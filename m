Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3C34D37A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 17:14:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8GLw1dl9z30HM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 02:14:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IHRwqqJ/;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=U8WYssHx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=IHRwqqJ/; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=U8WYssHx; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8GLT74Zcz2y6B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 02:13:37 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617030811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lAwcHh6VjZxvqu3eesE1syVGkWZBlzSGzupXo8CqfAQ=;
 b=IHRwqqJ/d8imEGKqIbKlA/qGFQR4bQ7Mhspabxdc3MX3R7eN5G7MQ4m5yMDEPE07Lv+phx
 zHEhhYkohJ8y/1HxidHAV34j6T1NDKgbBGWl861sk+fSQTqFBgAyx+mn+iamm2DCjBxNr8
 FSS5Pe4mAqzC65UdyPCNXbajLcCGJ7RH28rT2g8VbNzOtgT/36qjtM0xobnnIkx1daTNY6
 ct98FPnxEMo/We+aNUTa0BhSI17YnG4onDaQqN6q3BTiEy5TWC9ZhccI9GrfEQEEV2vbiJ
 RAdsnOm6LcHaaNMaxzoJHU7fUWyXNWeo2tkJ24JgIIySm8sS4q3ecgzXOE6HTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617030811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lAwcHh6VjZxvqu3eesE1syVGkWZBlzSGzupXo8CqfAQ=;
 b=U8WYssHxW3bwbN8MrVn1MezAusXrDPWH1/e3X2mo5XDOhiiwBibO2wcYpGLnSm7tmW4Q/W
 +BAOUaJ5F1W6NoAQ==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH next v1 2/3] printk: remove safe buffers
In-Reply-To: <87sg4e6lo5.fsf@jogness.linutronix.de>
References: <20210316233326.10778-1-john.ogness@linutronix.de>
 <20210316233326.10778-3-john.ogness@linutronix.de> <YFnHKlCvIA2nI41c@alley>
 <87pmzmi2xm.fsf@jogness.linutronix.de> <YGGmNu5ilDnSKH3g@alley>
 <87sg4e6lo5.fsf@jogness.linutronix.de>
Date: Mon, 29 Mar 2021 17:13:30 +0200
Message-ID: <87o8f26lid.fsf@jogness.linutronix.de>
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
 =?utf-8?Q?C?= =?utf-8?Q?=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-03-29, John Ogness <john.ogness@linutronix.de> wrote:
>> Will you call console write() callback with irq enabled from the
>> kthread?
>
> No. That defeats the fundamental purpose of this entire rework
> excercise. ;-)

Sorry, I misread your question. The answer is "yes". We want to avoid a
local_irq_save() when calling into console->write().

John Ogness
