Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AC24B9CA8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 11:02:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzr372lPCz3cbF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 21:02:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzr2j1QLlz3bb7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 21:01:46 +1100 (AEDT)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N9dg5-1oO1mF0mkH-015ZOw for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb
 2022 11:01:42 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so5772948wml.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 02:01:41 -0800 (PST)
X-Gm-Message-State: AOAM532GGd4mPvM9X6Im89VF+W3waFmNHJ9c9VHAqvFnAuRz4lVSiQlj
 wb7wd6btxxDvXx2dYTx7uwATx8AuZEgZpWLIRT4=
X-Google-Smtp-Source: ABdhPJwu2NVHGHLxx29UDj0eC2QtTDz9ABoGgqvKd5FtPXFo3D/c1j3IHxwDsslquGRbQQhg+y3kZFZQ6qJy+rJ75Go=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr4990966wms.82.1645085639420; Thu, 17
 Feb 2022 00:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Feb 2022 09:13:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] clean up asm/uaccess.h, kill set_fs for good
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nvt+lQXzC8jt4ji91+ZzFugqyX7SMGNV2lAVQAibzXhRgigQOHO
 fCZfBwkzHvrbDm9NtR/M/0QcxweRnV+ATyZ9DvWMUZYkuYqpiE5BGO7eFjgfld3k3FI+ljQ
 b3hF98GX2i9/1qTPwCp+HT+W5xw0P3PnJcHzCJ1Q5cCX2lobSQ4LW5/sMhPavO7Tsin6kSF
 qfCIqLdFZBqe+flMW0cEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NJrvHX3On90=:Bk1knEFH7Dkq7LRJbfySUF
 GahYeKVwKo0eMWYSubrp9pLj1v70OrpMAtPbRO1hoJiPNmxJsN7foLt0NdIH4LrxBXgunkPrT
 kANoSKT+9p3QfIYUJSLZY2ax4TXmAXd0GaC4dItEnCnXGwCxdq7NPVO47G0RcQojZ+oRHbBdw
 JjkD/EUP9WJqyK4U8SJTRWXJafXVYALDX83ywD5k6/xfaZMJNqYmuAHfRWUyWnLrPxwhNwvRE
 7LMAPrZslr3ZaOrymcXKdQg0oIvehUGUVvw8AYxX/VY0cYfURG51xFx176TZWbxeey5IzPEGm
 ndT/Siq3EOcX/Qv8SPdWj2nrO4+cQ+7IAPuHk2roR4xTjsbf24td+N5miEwmjpKYYCKpTBV+N
 BBVCvW2chrp0au5Trjh/xM/3aweekPAOq96bGA0yGi1R2ynyM8t1vEFffZB+SSLOtx188tOsa
 4QQwlzZCMjN8MJp6F/J8FmnS3mn91QBzmv31ErMvUrKKuZOudFK0Y80ACleapxREI8CUHWGZG
 8FK6FPADFkvldndNBzFKx/11rypDeukP+E+Ys6TA4Ox8dhLSCZfN6aIw5qZ41POeRhrqGGpZ4
 rG4buLLxUmsDAJFTH+LmIbrohots7hJUyHCUForEYl6IHNz2lLkLVqaujLVnGmv9S6k2XHiGD
 1Z3XWxDd4Q+xdcVXuLDQEgCW6AsdzdPXIRC3PJEv7JYVqmfrk8L65E83BIEtmWVq9FP+xIYcW
 eFJIQ2NZuP9z8Y7V1/y2oM2NaNtxXSpNPObX3b3CKogOy8j7b7tJyf2q5LClhxamttOR1mrxp
 bREuIfiU3uU1ZtY60QeCKdHZnOZeZo9CQ5Q7fI8/zesY5+yBdI=
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
 Peter Zijlstra <peterz@infradead.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Heiko Carstens <hca@linux.ibm.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 2:13 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Christoph Hellwig and a few others spent a huge effort on removing
> set_fs() from most of the important architectures, but about half the
> other architectures were never completed even though most of them don't
> actually use set_fs() at all.
>
> I did a patch for microblaze at some point, which turned out to be fairly
> generic, and now ported it to most other architectures, using new generic
> implementations of access_ok() and __{get,put}_kernel_nocheck().
>
> Three architectures (sparc64, ia64, and sh) needed some extra work,
> which I also completed.
>
> The final series contains extra cleanup changes that touch all
> architectures. Please review and test these, so we can merge them
> for v5.18.
>
> The series is available at
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=set_fs-2
> for testing.

I've added the updated contents to my asm-generic tree now to put them
into linux-next.

         Arnd
