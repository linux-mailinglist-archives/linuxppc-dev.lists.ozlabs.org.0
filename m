Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D45324BB346
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 08:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0NfM2f52z3cc6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 18:31:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J06iflXs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J06iflXs; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0Ndk1Y1Nz3cQb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 18:30:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0EBEB82588
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 07:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0170C340FA
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645169427;
 bh=4Rk51yI7cy+h8GrR+wkZuFO6d6ZOgVmodthZQla/xGE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J06iflXsHwt+ig2v+EdVte9FIMjMd1UJqVEFlBSPatvSar0H1DsjIJrEzO4UZmsLA
 FgLQDKYJQffQRf2jOqj4RvkvbARrp3Zx559O0fjC1X/ZrQnz8/9phWPGirREw3xDmP
 KiiIouYIXRMgjfFJDvoPYvqstcEIa4USPsx0YasFmINbZVvuxO9R4NCI9YhttU3l3w
 hYtMGLNSqPqWYJC3UtSm4OZH9d6VfgkASC0oY7FoLJOtuZDxJ7GGHkw6hTV4w0Lp7v
 R945NbM7PE+UNf3FI0ZmnSCg/psBouNJRccT0U1ZuUR8CSpx8DJXZFWbuaqYEmJYR4
 Q869KtnC6rt2g==
Received: by mail-ed1-f48.google.com with SMTP id i11so12254170eda.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 23:30:27 -0800 (PST)
X-Gm-Message-State: AOAM533rRTUv0DurZsjlgCttSf4fQjEA3fkWf544UaToq74hRciR/b/s
 gZZMpCRgHYhHnNHR4NhAz6ZBzD7/f6ALe1y6zIg=
X-Google-Smtp-Source: ABdhPJz4trlMwdvjT8y0UPggztkdijECp2hMuaf6QP4pGa8b+VYFZp4/tSgCA0YRdkm1OA4dObRIZr3wh6XhtS+RfLY=
X-Received: by 2002:adf:ea01:0:b0:1e4:b3e6:1f52 with SMTP id
 q1-20020adfea01000000b001e4b3e61f52mr4942117wrm.317.1645169415535; Thu, 17
 Feb 2022 23:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-6-arnd@kernel.org>
 <20220218062851.GC22576@lst.de>
In-Reply-To: <20220218062851.GC22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:29:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Dhn1Gsap1Wss2xpKBwe3jWLAmMYtL7S1-26tZ5D_2fQ@mail.gmail.com>
Message-ID: <CAK8P3a1Dhn1Gsap1Wss2xpKBwe3jWLAmMYtL7S1-26tZ5D_2fQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] x86: remove __range_not_ok()
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 7:28 AM Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Feb 16, 2022 at 02:13:19PM +0100, Arnd Bergmann wrote:
> > --- a/arch/x86/events/core.c
> > +++ b/arch/x86/events/core.c
> > @@ -2794,7 +2794,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
> >  static inline int
> >  valid_user_frame(const void __user *fp, unsigned long size)
> >  {
> > -     return (__range_not_ok(fp, size, TASK_SIZE) == 0);
> > +     return __access_ok(fp, size);
> >  }
>
> valid_user_frame just need to go away and the following __get_user calls
> replaced with normal get_user ones.

As I understand it, that would not work here because get_user() calls
access_ok() rather than __access_ok(), and on x86 that can not be
called in NMI context.

It is a bit odd that x86 is the only architecture that has this check,
but adding
it was clearly intentional, see 7c4788950ba5 ("x86/uaccess, sched/preempt:
Verify access_ok() context").

> > diff --git a/arch/x86/kernel/dumpstack.c b/arch/x86/kernel/dumpstack.c
> > index 53de044e5654..da534fb7b5c6 100644
> > --- a/arch/x86/kernel/dumpstack.c
> > +++ b/arch/x86/kernel/dumpstack.c
> > @@ -85,7 +85,7 @@ static int copy_code(struct pt_regs *regs, u8 *buf, unsigned long src,
> >        * Make sure userspace isn't trying to trick us into dumping kernel
> >        * memory by pointing the userspace instruction pointer at it.
> >        */
> > -     if (__chk_range_not_ok(src, nbytes, TASK_SIZE_MAX))
> > +     if (!__access_ok((void __user *)src, nbytes))
> >               return -EINVAL;
>
> This one is not needed at all as copy_from_user_nmi already checks the
> access range.

Ok, removing this.

> > diff --git a/arch/x86/kernel/stacktrace.c b/arch/x86/kernel/stacktrace.c
> > index 15b058eefc4e..ee117fcf46ed 100644
> > --- a/arch/x86/kernel/stacktrace.c
> > +++ b/arch/x86/kernel/stacktrace.c
> > @@ -90,7 +90,7 @@ copy_stack_frame(const struct stack_frame_user __user *fp,
> >  {
> >       int ret;
> >
> > -     if (__range_not_ok(fp, sizeof(*frame), TASK_SIZE))
> > +     if (!__access_ok(fp, sizeof(*frame)))
> >               return 0;
>
> Just switch the __get_user calls below to get_user instead.

Same as the first one, I think we can't do this in NMI context.

         Arnd
