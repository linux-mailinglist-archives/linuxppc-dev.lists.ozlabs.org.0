Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1934B6775
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 10:22:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JybG13yvCz3cQX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 20:22:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ByWt4vOJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ByWt4vOJ; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JybFN660Pz2xXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 20:21:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CEF660B3B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 09:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C093C340FB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 09:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644916902;
 bh=RZSvrBa9M+3bZFIsmIZDqZd7d5VDsf+KxZINLGmOa8g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ByWt4vOJfqjqQ0OH4IvfI8jS3cNXCG5QhUo8gSIwjjhgCCS+EG0eKJ0OH6/0slZvx
 5U+ORhV/qmEP9oYVsVNpQ4z0lgql1TDOtqZVyNJTB8uBbTHj7+Hg7hvcX9C+Qv1bCI
 xQNAX/BA+J/E8f8ciCAWG7YKJjWggpCRtRf088QmmnoHbINY0ozxdVN63LXsFj9bVW
 ZhFM4Qb1eAEg1T5cs+QDuQULOCDF4wZ0xb4KGHrAr2D6FIM67m8SLg/YuPl9OWXIEm
 yh46w91bs+bStHygYZV+PqbRzBrItLIY2RTjtzTLLCehlXePQ+tqzQBbMEGgsxRqGP
 oZHRnDmRrRB6Q==
Received: by mail-lf1-f54.google.com with SMTP id j7so18274780lfu.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 01:21:41 -0800 (PST)
X-Gm-Message-State: AOAM532HbdktPHaDSyusktPnGmj+DQm4BMFyz5KgI4x9CXqbeJwJpL58
 LqzMz0D5ZR/xJYRgoT8tXOv8pbvpw2+E4G5Ig4Q=
X-Google-Smtp-Source: ABdhPJxTZ3T3Abm/GIU6+FEpYkuoBAl5nS/ZOniPodztANRfoa0z/A0V8x7uBN46c9isaaDTdlBbvvwdEiVYUyGe5DM=
X-Received: by 2002:adf:da4c:: with SMTP id r12mr2454185wrl.550.1644916889390; 
 Tue, 15 Feb 2022 01:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
In-Reply-To: <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Feb 2022 10:21:16 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
Message-ID: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
To: Arnd Bergmann <arnd@kernel.org>
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
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Feb 2022 at 10:13, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Feb 15, 2022 at 9:17 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Mon, 14 Feb 2022 at 17:37, Arnd Bergmann <arnd@kernel.org> wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> >
> > With set_fs() out of the picture, wouldn't it be sufficient to check
> > that bit #55 is clear? (the bit that selects between TTBR0 and TTBR1)
> > That would also remove the need to strip the tag from the address.
> >
> > Something like
> >
> >     asm goto("tbnz  %0, #55, %2     \n"
> >              "tbnz  %1, #55, %2     \n"
> >              :: "r"(addr), "r"(addr + size - 1) :: notok);
> >     return 1;
> > notok:
> >     return 0;
> >
> > with an additional sanity check on the size which the compiler could
> > eliminate for compile-time constant values.
>
> That should work, but I don't see it as a clear enough advantage to
> have a custom implementation. For the constant-size case, it probably
> isn't better than a compiler-scheduled comparison against a
> constant limit, but it does hurt maintainability when the next person
> wants to change the behavior of access_ok() globally.
>

arm64 also has this leading up to the range check, and I think we'd no
longer need it:

    if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
        (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
            addr = untagged_addr(addr);

> If we want to get into micro-optimizing uaccess, I think a better target
> would be a CONFIG_CC_HAS_ASM_GOTO_OUTPUT version
> of __get_user()/__put_user as we have on x86 and powerpc.
>
>          Arnd
