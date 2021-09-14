Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A082E40AFD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 15:56:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H84cx4FfGz2yfr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 23:56:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4H84cW23nQz2xr8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 23:55:37 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D62A1FB;
 Tue, 14 Sep 2021 06:55:33 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.21.233])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D39B3F5A1;
 Tue, 14 Sep 2021 06:55:29 -0700 (PDT)
Date: Tue, 14 Sep 2021 14:55:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 0/8] Move task_struct::cpu back into thread_info
Message-ID: <20210914135527.GC30247@C02TD0UTHF1T.local>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 14, 2021 at 02:10:28PM +0200, Ard Biesheuvel wrote:
> Commit c65eacbe290b ("sched/core: Allow putting thread_info into
> task_struct") mentions that, along with moving thread_info into
> task_struct, the cpu field is moved out of the former into the latter,
> but does not explain why.

From what I recall of talking to Andy around that time, when converting
arm64 over, the theory was that over time we'd move more and more out of
thread_info and into task_struct or thread_struct, until task_struct
supplanted thread_info entirely, and that all became generic.

I think the key gain there was making things more *generic*, and there
are other ways we could do that in future without moving more into
task_struct (e.g. with a geenric thread_info and arch_thread_info inside
that).

With that in mind, and given the diffstat, I think this is worthwhile.

FWIW, for the series:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> While collaborating with Keith on adding THREAD_INFO_IN_TASK support to
> ARM, we noticed that keeping CPU in task_struct is problematic for
> architectures that define raw_smp_processor_id() in terms of this field,
> as it requires linux/sched.h to be included, which causes a lot of pain
> in terms of circular dependencies (or 'header soup', as the original
> commit refers to it).
> 
> For examples of how existing architectures work around this, please
> refer to patches #6 or #7. In the former case, it uses an awful
> asm-offsets hack to index thread_info/current without using its type
> definition. The latter approach simply keeps a copy of the task_struct
> CPU field in thread_info, and keeps it in sync at context switch time.
> 
> Patch #8 reverts this latter approach for ARM, but this code is still
> under review so it does not currently apply to mainline.
> 
> We also discussed introducing yet another Kconfig symbol to indicate
> that the arch has THREAD_INFO_IN_TASK enabled but still prefers to keep
> its CPU field in thread_info, but simply keeping it in thread_info in
> all cases seems to be the cleanest approach here.
> 
> Cc: Keith Packard <keithpac@amazon.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> 
> Ard Biesheuvel (8):
>   arm64: add CPU field to struct thread_info
>   x86: add CPU field to struct thread_info
>   s390: add CPU field to struct thread_info
>   powerpc: add CPU field to struct thread_info
>   sched: move CPU field back into thread_info if THREAD_INFO_IN_TASK=y
>   powerpc: smp: remove hack to obtain offset of task_struct::cpu
>   riscv: rely on core code to keep thread_info::cpu updated
>   ARM: rely on core code to keep thread_info::cpu updated
> 
>  arch/arm/include/asm/switch_to.h       | 14 --------------
>  arch/arm/kernel/smp.c                  |  3 ---
>  arch/arm64/include/asm/thread_info.h   |  1 +
>  arch/arm64/kernel/asm-offsets.c        |  2 +-
>  arch/arm64/kernel/head.S               |  2 +-
>  arch/powerpc/Makefile                  | 11 -----------
>  arch/powerpc/include/asm/smp.h         | 17 +----------------
>  arch/powerpc/include/asm/thread_info.h |  3 +++
>  arch/powerpc/kernel/asm-offsets.c      |  4 +---
>  arch/powerpc/kernel/smp.c              |  2 +-
>  arch/riscv/kernel/asm-offsets.c        |  1 -
>  arch/riscv/kernel/entry.S              |  5 -----
>  arch/riscv/kernel/head.S               |  1 -
>  arch/s390/include/asm/thread_info.h    |  1 +
>  arch/x86/include/asm/thread_info.h     |  3 +++
>  include/linux/sched.h                  |  6 +-----
>  kernel/sched/sched.h                   |  4 ----
>  17 files changed, 14 insertions(+), 66 deletions(-)
> 
> -- 
> 2.30.2
> 
