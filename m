Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912341B140
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 15:53:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJgw51PNWz3035
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 23:53:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MtU6qqn+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MtU6qqn+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJgvQ3fZdz2yNZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 23:53:22 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE21861206
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632837199;
 bh=jrbVenceAWLgQkHzrFIo4zTN1wFu086UNecp+tCchZ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MtU6qqn+kJSqX0pnHB39Hyt4TlXOGkDoOSpdfiFiizMF3zB6K4Kj1qU67ylirdEoA
 M3uIAYetRVNsArPrQ3wtdz7x1/5FDCW77d18UD0OLFfJBWxyEh5F3pP3BmIpYNEwux
 nxumzBozjIm4l2W1h2P/shzeKp0uJokfThTl9GfRer/LCavK13SDzYkN7Km4b/b0IU
 6zSnfS+7+K+WzzCYJgtVdE9FSdZlJJYYHowlP8QpW3ZSfwpzF+dIo4iNQ9RF3bzhES
 W8HnaBJnTgw3Rxsa8c+h19aOA0hPFU2qT/RDYAef3kAS6B5jGOrULAJPErmQwD14Ur
 NFI4KYTvgDq7A==
Received: by mail-oi1-f169.google.com with SMTP id t189so30065785oie.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 06:53:19 -0700 (PDT)
X-Gm-Message-State: AOAM530B3xLcIx85Z4OdcBbutclF5/My2H9uUKIBwsmokVHdLAIyqd/O
 s75Qw2e3k7/7dmF7LuvX605mtLTt9r7FJVd6PsQ=
X-Google-Smtp-Source: ABdhPJz9to8lWFr60Gpre4Od/46x6s4Nrtse/34SwP3rmoXnxlQkLzOc/1tmIX3U1LqO/1/3HTa84J5WaQo7iINmJLs=
X-Received: by 2002:a05:6808:1148:: with SMTP id
 u8mr3628695oiu.33.1632837188990; 
 Tue, 28 Sep 2021 06:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-4-ardb@kernel.org>
In-Reply-To: <20210914121036.3975026-4-ardb@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 28 Sep 2021 15:52:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGfPYBRKoj5eBefr61kHc=m336g0EbPUeDRy+GZVGw26w@mail.gmail.com>
Message-ID: <CAMj1kXGfPYBRKoj5eBefr61kHc=m336g0EbPUeDRy+GZVGw26w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/8] s390: add CPU field to struct thread_info
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The CPU field will be moved back into thread_info even when
> THREAD_INFO_IN_TASK is enabled, so add it back to s390's definition of
> struct thread_info.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/s390/include/asm/thread_info.h | 1 +
>  1 file changed, 1 insertion(+)
>

Heiko, Christian, Vasily,

Do you have any objections to this change? If you don't, could you
please ack it so it can be taken through another tree (or if that is
problematic for you, could you please propose another way of merging
these changes?)

Thanks,
Ard.

> diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
> index e6674796aa6f..b2ffcb4fe000 100644
> --- a/arch/s390/include/asm/thread_info.h
> +++ b/arch/s390/include/asm/thread_info.h
> @@ -37,6 +37,7 @@
>  struct thread_info {
>         unsigned long           flags;          /* low level flags */
>         unsigned long           syscall_work;   /* SYSCALL_WORK_ flags */
> +       unsigned int            cpu;            /* current CPU */
>  };
>
>  /*
> --
> 2.30.2
>
