Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2345D11F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 00:25:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzxvj3gbCz3bXJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:25:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=X/yZX2zV;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eAA9L8IY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=X/yZX2zV; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=eAA9L8IY; 
 dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at boromir;
 Thu, 25 Nov 2021 10:25:17 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzxv11yMmz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 10:25:17 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637795881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgfD0hDh4gr0XMzkR2x84BR1TQ6+tWZptmE4dSLrghY=;
 b=X/yZX2zV8XlAus/FBu0sptVdXYWgFjt85wCwAiu6eUKJBsOkqXZw1bwG6D5eQ4y3XItSO5
 PME1b7NJiqjCFFOLUwssxvQfdm3YwlEVkZeZq2Lvaxr9X1F9DySBoKbtptiCypU7vX0lxb
 rLd2g2UZ9iw2md3zGsCQFZVDy+Ps1Wj2giT5og+i4j8yelPkAlnXWb1Z02Pec22ezIqgU2
 B24yr0FzQWwSctufH3JLXvswN/Vcon5CJcGGr3lK01xAYCAI+akKbgpKk2mMxDKnUMte1X
 HsR0U998RBH9nGgHbNTgaQPvxAzbH7/ZRc3B/1s5dnvXurNarvbbMcqz8xLFyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637795881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgfD0hDh4gr0XMzkR2x84BR1TQ6+tWZptmE4dSLrghY=;
 b=eAA9L8IY3vpIoozSoepqegehvk44k8iiAJ19r79ZDI+VHKbA09Xcb0eAefvCuqFa/D4MxI
 qHgBCZYVv9jhifBA==
To: Arnd Bergmann <arnd@arndb.de>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@collabora.com>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
In-Reply-To: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
 <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Date: Thu, 25 Nov 2021 00:18:00 +0100
Message-ID: <87v90hjg7r.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 lkft-triage@lists.linaro.org, Max Filippov <jcmvbkbc@gmail.com>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 sparclinux <sparclinux@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Waiman Long <longman@redhat.com>,
 "open
 list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Ingo Molnar <mingo@redhat.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, Rob Landley <rob@landley.net>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 24 2021 at 15:29, Arnd Bergmann wrote:
> On Wed, Nov 24, 2021 at 2:21 PM Andr=C3=A9 Almeida <andrealmeid@collabora=
.com> wrote:
>>
>> Wireup futex_waitv syscall for all remaining archs.
>>
>> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@collabora.com>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> I double-checked that futex_waitv() doesn't need any architecture specific
> hacks, and that the list above is complete.
>
> Should I take this through the asm-generic tree, or would you send it
> through the tip tree?

Feel free to pick it up.

Thanks,

        tglx
