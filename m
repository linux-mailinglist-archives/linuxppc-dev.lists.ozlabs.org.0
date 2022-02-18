Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66B4BB31B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 08:17:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0NLX3bFqz3cmf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 18:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r8o3+Dm+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r8o3+Dm+; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0NKh6bFsz3cZB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 18:16:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6718A61EF7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 07:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C56C340EB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645168598;
 bh=q+jKWrJ4jJZ2v7I08P11+5fwNrVng4vZR8KgCaGgNp8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r8o3+Dm+a6u2yuTBujW62OQnvtW5pvmDhps0Cpl0K+eu/wKOlM8p0veQJPpFH1zdv
 0fxsmSliPkulM7Kl7vCS8nzUNYY6ywTF3wQAYGJsq785nmbKn58bwTfQDo5juQ5bZy
 4PDz3AKxCyOrSn6qNJQWhgx5127j4tN9UC7OLPbEJyZr/gvDh/ALH4YO64Sj1fSAb3
 OryhzyLOyA2dZ5YYXLDjxwk7GsfmBEbvyUqiRjhOfjtjHqWPMMFYMHtK7QLWCSGE/x
 8GFawUQIti8cOYOIFhmNkRCpE3o/qQGRyQUGCKgXA616MOpEZ4OJCypYjdoYSIOwwa
 BwNXSACYWWZxg==
Received: by mail-ej1-f45.google.com with SMTP id p14so12799256ejf.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 23:16:38 -0800 (PST)
X-Gm-Message-State: AOAM531hUHMAv2bCpc0phfTg/KiDs30GJBYkNL0/fkXxETfO/6Hd93i0
 GYZPPMR1gIMDBcdEYD9gYdRgUpC28IZfq/Ekw3M=
X-Google-Smtp-Source: ABdhPJzrsD9ZegAYWxopB2Dqyhs5CbptDH37N4ZCxM0ghQnmxjYRVare/kFAwMrZOPIITOhmBYHifd3MXTFISbjy0gQ=
X-Received: by 2002:adf:c406:0:b0:1e4:a5ae:34a3 with SMTP id
 v6-20020adfc406000000b001e4a5ae34a3mr5120080wrf.407.1645168587142; Thu, 17
 Feb 2022 23:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
In-Reply-To: <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:16:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2r3zB2G7CjCdXB6cDx1Q7jdOnA8YcCHM+3Q3CybnZ=hQ@mail.gmail.com>
Message-ID: <CAK8P3a2r3zB2G7CjCdXB6cDx1Q7jdOnA8YcCHM+3Q3CybnZ=hQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: Andy Lutomirski <luto@amacapital.net>
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
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
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

On Thu, Feb 17, 2022 at 8:15 PM Andy Lutomirski <luto@amacapital.net> wrote:
>
> On Wed, Feb 16, 2022 at 5:19 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > There are many different ways that access_ok() is defined across
> > architectures, but in the end, they all just compare against the
> > user_addr_max() value or they accept anything.
> >
> > Provide one definition that works for most architectures, checking
> > against TASK_SIZE_MAX for user processes or skipping the check inside
> > of uaccess_kernel() sections.
> >
> > For architectures without CONFIG_SET_FS(), this should be the fastest
> > check, as it comes down to a single comparison of a pointer against a
> > compile-time constant, while the architecture specific versions tend to
> > do something more complex for historic reasons or get something wrong.
>
> This isn't actually optimal.  On x86, TASK_SIZE_MAX is a bizarre
> constant that has a very specific value to work around a bug^Wdesign
> error^Wfeature of Intel CPUs.  TASK_SIZE_MAX is the maximum address at
> which userspace is permitted to allocate memory, but there is a huge
> gap between user and kernel addresses, and any value in the gap would
> be adequate for the comparison.  If we wanted to optimize this, simply
> checking the high bit (which x86 can do without any immediate
> constants at all) would be sufficient and, for an access known to fit
> in 32 bits, one could get even fancier and completely ignore the size
> of the access.  (For accesses not known to fit in 32 bits, I suspect
> some creativity could still come up with a construction that's
> substantially faster than the one in your patch.)
>
> So there's plenty of room for optimization here.
>
> (This is not in any respect a NAK -- it's just an observation that
> this could be even better.)

Thank you for taking a look!

As you can see in the patch that changes the algorithm on x86 [1],
it was already using TASK_SIZE_MAX as the limit, only the order
in which the comparison is done, hopefully leading to better code
already. I have looked at trivial examples on x86 that showed an
improvement for constant sizes, but only looked at arm64 in detail
for the overall result.

It may be worth checking if using LONG_MAX as the limit produces
better code, but it's probably best to do the optimization in the
common code in a portable way to keep it from diverging again.

       Arnd

[1] https://lore.kernel.org/lkml/20220216131332.1489939-7-arnd@kernel.org/
