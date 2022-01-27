Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119149E234
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 13:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl07D0zXzz3cPk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 23:21:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jl06n43hBz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 23:20:48 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7740D1063;
 Thu, 27 Jan 2022 04:20:46 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.14.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ACD73F7D8;
 Thu, 27 Jan 2022 04:20:45 -0800 (PST)
Date: Thu, 27 Jan 2022 12:20:32 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <YfKOENgR6sLnHQmA@FVFF77S0Q05N>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <CAMj1kXHgpr0KYx5PYO_SpqaN8Ar2kfmc9Pb-d26uaYDpjwTz9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHgpr0KYx5PYO_SpqaN8Ar2kfmc9Pb-d26uaYDpjwTz9w@mail.gmail.com>
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
Cc: Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sachin Sant <sachinp@linux.ibm.com>,
 Yinan Liu <yinan@linux.alibaba.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 01:03:34PM +0100, Ard Biesheuvel wrote:
> On Thu, 27 Jan 2022 at 12:47, Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > [adding LKML so this is easier for others to find]
> >
> > If anyone wants to follow the thread from the start, it's at:
> >
> >   https://lore.kernel.org/linuxppc-dev/944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com/
> >
> > Ard, I was under the impression that the 32-bit arm kernel was (virtually)
> > relocatable, but I couldn't spot where, and suspect I'm mistaken. Do you know
> > whether it currently does any boot-time dynamic relocation?
> 
> No, it does not.

Thanks for comfirming!

So 32-bit arm should be able to opt into the build-time sort as-is.

> > Steve asked for a bit more detail on IRC, so the below is an attempt to explain
> > what's actually going on here.
> >
> > The short answer is that relocatable kernels (e.g. those with KASLR support)
> > need to handle the kernel being loaded at (somewhat) arbitrary virtual
> > addresses. Even where code can be position-independent, any pointers in the
> > kernel image (e.g. the contents of the mcount_loc table) need to be updated to
> > account for the specific VA the kernel was loaded at -- arch code does this
> > early at boot time by applying dynamic (ELF) relocations.
> 
> These architectures use place-relative extables for the same reason:
> place relative references are resolved at build time rather than at
> runtime during relocation, making a build time sort feasible.
> 
> arch/alpha/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> arch/arm64/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> arch/ia64/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> arch/parisc/include/asm/uaccess.h:#define ARCH_HAS_RELATIVE_EXTABLE
> arch/powerpc/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> arch/riscv/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> arch/s390/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> arch/x86/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> 
> Note that the swap routine becomes something like the below, given
> that the relative references need to be fixed up after the entry
> changes place in the sorted list.
> 
> static void swap_ex(void *a, void *b, int size)
> {
>         struct exception_table_entry *x = a, *y = b, tmp;
>         int delta = b - a;
> 
>         tmp = *x;
>         x->insn = y->insn + delta;
>         y->insn = tmp.insn - delta;
>         ...
> }
> 
> As a bonus, the resulting footprint of the table in the image is
> reduced by 8x, given that every 8 byte pointer has an accompanying 24
> byte RELA record, so we go from 32 bytes to 4 bytes for every call to
> __gnu_mcount_mc.

Absolutely -- it'd be great if we could do that for the callsite locations; the
difficulty is that the entries are generated by the compiler itself, so we'd
either need some build/link time processing to convert each absolute 64-bit
value to a relative 32-bit offset, or new compiler options to generate those as
relative offsets from the outset.

Thanks,
Mark.
