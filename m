Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F8D3D705C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 09:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYpKB1Tgqz3bdk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 17:27:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=nJqvAQvq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=nJqvAQvq; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYpJk1qYPz308m
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 17:27:00 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 145C322103;
 Tue, 27 Jul 2021 07:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627370816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BIRDRD9L4czToF86gzK0EPiIaFDmmYi9JHkmXI3ngzQ=;
 b=nJqvAQvqUxZZ5iCL8QYWjWGPVyDkMYBjRJVMYG19s7WhBLGIG4Kg9PRrCjcMUHPW5yFHCM
 2mF/l/4bgDhpI+TWQPFm3lrdvLLUZBwX8OZdqxGQ4wX+eJqBw55B2LjMIA1DCAGo4Lvkm4
 +SJtF34yqgIyDeVCvZyZaFocQovqWtE=
Received: from suse.cz (unknown [10.100.224.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 8A49BA3B81;
 Tue, 27 Jul 2021 07:26:54 +0000 (UTC)
Date: Tue, 27 Jul 2021 09:26:54 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v4 0/6] printk: remove safe buffers
Message-ID: <YP+1PqaKTfZXHjmU@alley>
References: <20210715193359.25946-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715193359.25946-1-john.ogness@linutronix.de>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 Paul Mackerras <paulus@samba.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Borkmann <daniel@iogearbox.net>, Marc Zyngier <maz@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Peter Zijlstra <peterz@infradead.org>, Yue Hu <huyue2@yulong.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vipin Sharma <vipinsh@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Terrell <terrelln@fb.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Nick Desaulniers <ndesaulniers@google.com>, Xiongwei Song <sxwjean@gmail.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2021-07-15 21:39:53, John Ogness wrote:
> Hi,
> 
> Here is v4 of a series to remove the safe buffers. v3 can be
> found here [0]. The safe buffers are no longer needed because
> messages can be stored directly into the log buffer from any
> context.
> 
> However, the safe buffers also provided a form of recursion
> protection. For that reason, explicit recursion protection is
> implemented for this series.
> 
> The safe buffers also implicitly provided serialization
> between multiple CPUs executing in NMI context. This was
> particularly necessary for the nmi_backtrace() output. This
> serializiation is now preserved by using the printk cpulock.
> 
> With the removal of the safe buffers, there is no need for
> extra NMI enter/exit tracking. So this is also removed
> (which includes removing the config option CONFIG_PRINTK_NMI).
> 
> And finally, there are a few places in the kernel that need to
> specify code blocks where all printk calls are to be deferred
> printing. Previously the NMI tracking API was being (mis)used
> for this purpose. This series introduces an official and
> explicit interface for such cases. (Note that all deferred
> printing will be removed anyway, once printing kthreads are
> introduced.)
> 
> John Ogness (6):
>   lib/nmi_backtrace: explicitly serialize banner and regs
>   printk: track/limit recursion
>   printk: remove safe buffers
>   printk: remove NMI tracking
>   printk: convert @syslog_lock to mutex
>   printk: syslog: close window between wait and read

The entire patchset has been committed into printk/linux.git,
branch rework/printk_safe-removal.

Note that I have updated the 4th patch as discussed, see
https://lore.kernel.org/r/20210721120026.y3dqno24ahw4sazy@pathway.suse.cz
https://lore.kernel.org/r/20210721130852.zrjnti6b3fwjgdzj@pathway.suse.cz

Best Regards,
Petr
