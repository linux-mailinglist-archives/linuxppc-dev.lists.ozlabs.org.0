Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E070634FAFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 10:00:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Jdc6CMJz3by7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 19:00:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HgYwf+F5;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OFsxY0UL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=HgYwf+F5; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=OFsxY0UL; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Jcz5fxGz3049
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 18:59:47 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617177580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwENOV5fEtmm72Pvhge8smr8aYXEWHQVNQRqr1NurZ8=;
 b=HgYwf+F5t8/gQgaF2YZ17DNXo2yFb0pVTZn0ZbtZzqd8Y8Sahi6vDVeZ0yDH70XJiw0lYy
 IK406t8beuNJxH/nzZQzcWA/+RKwjqyUs73YOdDIcQaxefWARdaqrvvi8vrYEBXmgHaHr+
 /FYl89dM6MubMB7wiK1nxPRKCKwPD2bGb5i9UPJU7tgIY2LiqAVuAwuunDsFRrSDNh0I4v
 WlfdgErhyH1WDEQToFUy5Z/KFpxMkU1s6CQxFPHluQW67Vj+WuamrzwdOP99FhY4iMolJ5
 ehk4vzv9DwvPis/DM3Em1aEAz+5bwH2MpcfVmgMKTdLWSbSGGgbu/DijF3vdww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617177580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwENOV5fEtmm72Pvhge8smr8aYXEWHQVNQRqr1NurZ8=;
 b=OFsxY0ULFZzlVDBhGsXuic6UtSXoqjsWNTcAn2ba/w5Yp2FKfdTtXYRsqVzLZI5u8tMC41
 ZAd55frkyv+omGAQ==
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v2 2/5] printk: remove safe buffers
In-Reply-To: <20210330153512.1182-3-john.ogness@linutronix.de>
References: <20210330153512.1182-1-john.ogness@linutronix.de>
 <20210330153512.1182-3-john.ogness@linutronix.de>
Date: Wed, 31 Mar 2021 09:59:39 +0200
Message-ID: <875z17vjmc.fsf@jogness.linutronix.de>
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

On 2021-03-30, John Ogness <john.ogness@linutronix.de> wrote:
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index e971c0a9ec9e..f090d6a1b39e 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -1772,16 +1759,21 @@ static struct task_struct *console_owner;
>  static bool console_waiter;
>=20=20
>  /**
> - * console_lock_spinning_enable - mark beginning of code where another
> + * console_lock_spinning_enable_irqsave - mark beginning of code where a=
nother
>   *	thread might safely busy wait
>   *
>   * This basically converts console_lock into a spinlock. This marks
>   * the section where the console_lock owner can not sleep, because
>   * there may be a waiter spinning (like a spinlock). Also it must be
>   * ready to hand over the lock at the end of the section.
> + *
> + * This disables interrupts because the hand over to a waiter must not be
> + * interrupted until the hand over is completed (@console_waiter is clea=
red).
>   */
> -static void console_lock_spinning_enable(void)
> +static void console_lock_spinning_enable_irqsave(unsigned long *flags)

I missed the prototype change for the !CONFIG_PRINTK case, resulting in:

linux/kernel/printk/printk.c:2707:3: error: implicit declaration of functio=
n =E2=80=98console_lock_spinning_enable_irqsave=E2=80=99; did you mean =E2=
=80=98console_lock_spinning_enable=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
   console_lock_spinning_enable_irqsave(&flags);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   console_lock_spinning_enable

Will be fixed for v3.

(I have now officially added !CONFIG_PRINTK to my CI tests.)

John Ogness
