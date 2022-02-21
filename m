Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A94BDA40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 15:32:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2PsF6NHHz3cB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 01:32:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kzJ4oJ7u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kzJ4oJ7u; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2PrV5p6Rz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 01:31:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C73A60F4E
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 14:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B958DC340F5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645453911;
 bh=12Bbx9GqAhHL6qqDyToeCYzPAWe2m8+m6+gTGV+hFTw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kzJ4oJ7uqkQlH8HKP59hga7BxTSd9yAv9G83J3PE9Vxo9wgwCF55WEif4JDuq66Es
 xJHgiAYKMSMrCA+rbeIjmKJKM3SV0fBLyOZsQa95vK8cdEppsgKEikoB+c9hrTgPD6
 N3/wnjEuF/+t+ByBpKQN3Dzq1OrIxHrSb4YNAPOcfEv6v4f/QcpswnD2hOYaY7e5ZR
 P2yzCaocscWCwjSY0LU/aagBUySQOBShLiiZAXM9rLdNx4Mpjcu34oGUvRfmZEBPw+
 VjJykXvvmkBWqCNmRXcJeDSqWyibRwN4/9udBAhduxi7qzsuFLGNxd5SxW6ohLqgwt
 B42/CscfKu6MA==
Received: by mail-ej1-f46.google.com with SMTP id qx21so33682694ejb.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 06:31:51 -0800 (PST)
X-Gm-Message-State: AOAM530012n7qsQ4WuI25XpBiWYbG8yA8VB8ft6KHTsdZX2Nq6fY6HiW
 +rkBu5R4EivevQq0g/CtSqBp6bfGTdrtV4vgyok=
X-Google-Smtp-Source: ABdhPJwkamQNFHYmlXBqgC6u1r1MKNMeB6x6hm57ILAz8yVFLOW/Qf4lv8t2aLUhrb2kSK2FAx/PKmoUpYjfFDbRcw0=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr16170850wri.219.1645453899581; Mon, 21
 Feb 2022 06:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
In-Reply-To: <20220221132456.GA7139@alpha.franken.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 21 Feb 2022 15:31:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
Message-ID: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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

On Mon, Feb 21, 2022 at 2:24 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Wed, Feb 16, 2022 at 02:13:23PM +0100, Arnd Bergmann wrote:
> >
> > diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> > index db9a8e002b62..d7c89dc3426c 100644
>
> this doesn't work. For every access above maximum implemented virtual address
> space of the CPU an address error will be issued, but not a TLB miss.
> And address error isn't able to handle this situation.

Ah, so the __ex_table entry only catches TLB misses?

Does this mean it also traps for kernel memory accesses, or do those
work again? If the addresses on mips64 are separate like on
sparc64 or s390, the entire access_ok() step could be replaced
by a fixup code in the exception handler. I suppose this depends on
CONFIG_EVA and you still need a limit check at least when EVA is
disabled.

> With this patch
>
> diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
> index df4b708c04a9..3911f1481f3d 100644
> --- a/arch/mips/kernel/unaligned.c
> +++ b/arch/mips/kernel/unaligned.c
> @@ -1480,6 +1480,13 @@ asmlinkage void do_ade(struct pt_regs *regs)
>         prev_state = exception_enter();
>         perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS,
>                         1, regs, regs->cp0_badvaddr);
> +
> +       /* Are we prepared to handle this kernel fault?  */
> +       if (fixup_exception(regs)) {
> +               current->thread.cp0_baduaddr = regs->cp0_badvaddr;
> +               return;
> +       }
> +
>         /*
>          * Did we catch a fault trying to load an instruction?
>          */
>
> I at least get my simple test cases fixed, but I'm not sure this is
> correct.
>
> Is there a reason to not also #define TASK_SIZE_MAX   __UA_LIMIT like
> for the 32bit case ?
>

For 32-bit, the __UA_LIMIT is a compile-time constant, so the check
ends up being trivial. On all other architectures, the same thing can
be done after the set_fs removal, so I was hoping it would work here
as well.

I suspect doing the generic (size <= limit) && (addr <= (limit - size))
check on mips64 with the runtime limit ends up slightly slower
than the current code that checks a bit mask instead. If you like,
I'll update it this way, otherwise I'd need help in form of a patch
that changes the exception handling so __get_user/__put_user
also return -EFAULT for an address error.

       Arnd
