Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B94B65D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 09:18:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyYrp1FHhz3cVT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 19:18:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=stRaKCev;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=stRaKCev; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyYr74mW7z2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 19:18:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BA7861666
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 08:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BEFC340EC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644913093;
 bh=04jl3xlTAr2mAK86GyJL0xbgNN5b7HtshwArFPtWTHk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=stRaKCevAHKdgCmUGBrfhYzWT/8iK3ELaeINBLVStpnUtlgra7KJKB1LPYgCFz1Pz
 +EGWCG7GiscQwxqnR6qJYfTfqIKew2R3ilXdCTdcizcfhkqcFb2TJHt6sjZQfI2a33
 z9c50e3SciQbRuuCC7ZH5imVtHHxU2mhBfrCJWqpha1zoDHYemAFJAhKFnW+HE9Ygj
 VumcFjSy1p4dB9c+6GpPb1xWIMbXv5/9DDjAH5DCfzY/fxC8JQEtfusc6ZaJDHhC5h
 AXGqyPAIzRgK+LIGR73S0GgDLdYFf2jflIjiT0umxwXaCiuWmVS2bzqZo6JrJeQrhm
 7SbBQn0gB5/3Q==
Received: by mail-ed1-f48.google.com with SMTP id t21so2536706edd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 00:18:13 -0800 (PST)
X-Gm-Message-State: AOAM530EG4bpwsA/Fo/8MriNBiReKC4W+oH21052h4Dw03Xmi7WUAAve
 /QwNMch2GLWrreaiV/XKwbWHWW/rJNIrYfRE+cA=
X-Google-Smtp-Source: ABdhPJw4PL6nNrFqa4c6RC8ozuX9Vj+TpXvd1rMYfibECm69yxHe+9RwBgU/na3QadsOPEjyGv1buhx93wXVXPObDfI=
X-Received: by 2002:a5d:490d:: with SMTP id x13mr2213081wrq.417.1644913080942; 
 Tue, 15 Feb 2022 00:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
In-Reply-To: <20220214163452.1568807-9-arnd@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Feb 2022 09:17:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
Message-ID: <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
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
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-snps-arc@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, monstr@monstr.eu,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-api@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dinguyen@kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Feb 2022 at 17:37, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> arm64 has an inline asm implementation of access_ok() that is derived from
> the 32-bit arm version and optimized for the case that both the limit and
> the size are variable. With set_fs() gone, the limit is always constant,
> and the size usually is as well, so just using the default implementation
> reduces the check into a comparison against a constant that can be
> scheduled by the compiler.
>
> On a defconfig build, this saves over 28KB of .text.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/asm/uaccess.h | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index 357f7bd9c981..e8dce0cc5eaa 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -26,6 +26,8 @@
>  #include <asm/memory.h>
>  #include <asm/extable.h>
>
> +static inline int __access_ok(const void __user *ptr, unsigned long size);
> +
>  /*
>   * Test whether a block of memory is a valid user space address.
>   * Returns 1 if the range is valid, 0 otherwise.
> @@ -33,10 +35,8 @@
>   * This is equivalent to the following test:
>   * (u65)addr + (u65)size <= (u65)TASK_SIZE_MAX
>   */
> -static inline unsigned long __access_ok(const void __user *addr, unsigned long size)
> +static inline int access_ok(const void __user *addr, unsigned long size)
>  {
> -       unsigned long ret, limit = TASK_SIZE_MAX - 1;
> -
>         /*
>          * Asynchronous I/O running in a kernel thread does not have the
>          * TIF_TAGGED_ADDR flag of the process owning the mm, so always untag
> @@ -46,27 +46,9 @@ static inline unsigned long __access_ok(const void __user *addr, unsigned long s
>             (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
>                 addr = untagged_addr(addr);
>
> -       __chk_user_ptr(addr);
> -       asm volatile(
> -       // A + B <= C + 1 for all A,B,C, in four easy steps:
> -       // 1: X = A + B; X' = X % 2^64
> -       "       adds    %0, %3, %2\n"
> -       // 2: Set C = 0 if X > 2^64, to guarantee X' > C in step 4
> -       "       csel    %1, xzr, %1, hi\n"
> -       // 3: Set X' = ~0 if X >= 2^64. For X == 2^64, this decrements X'
> -       //    to compensate for the carry flag being set in step 4. For
> -       //    X > 2^64, X' merely has to remain nonzero, which it does.
> -       "       csinv   %0, %0, xzr, cc\n"
> -       // 4: For X < 2^64, this gives us X' - C - 1 <= 0, where the -1
> -       //    comes from the carry in being clear. Otherwise, we are
> -       //    testing X' - C == 0, subject to the previous adjustments.
> -       "       sbcs    xzr, %0, %1\n"
> -       "       cset    %0, ls\n"
> -       : "=&r" (ret), "+r" (limit) : "Ir" (size), "0" (addr) : "cc");
> -
> -       return ret;
> +       return likely(__access_ok(addr, size));
>  }
> -#define __access_ok __access_ok
> +#define access_ok access_ok
>
>  #include <asm-generic/access_ok.h>
>
> --
> 2.29.2
>

With set_fs() out of the picture, wouldn't it be sufficient to check
that bit #55 is clear? (the bit that selects between TTBR0 and TTBR1)
That would also remove the need to strip the tag from the address.

Something like

    asm goto("tbnz  %0, #55, %2     \n"
             "tbnz  %1, #55, %2     \n"
             :: "r"(addr), "r"(addr + size - 1) :: notok);
    return 1;
notok:
    return 0;

with an additional sanity check on the size which the compiler could
eliminate for compile-time constant values.
