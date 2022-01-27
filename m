Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E059D49E359
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 14:24:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl1XR65jnz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 00:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jl1X14DB9z2x9G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 00:24:16 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 225B51063;
 Thu, 27 Jan 2022 05:24:14 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.14.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D36163F766;
 Thu, 27 Jan 2022 05:24:12 -0800 (PST)
Date: Thu, 27 Jan 2022 13:24:00 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <YfKc8MDwenS1iXqQ@FVFF77S0Q05N>
References: <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <CAMj1kXHgpr0KYx5PYO_SpqaN8Ar2kfmc9Pb-d26uaYDpjwTz9w@mail.gmail.com>
 <YfKOENgR6sLnHQmA@FVFF77S0Q05N>
 <CAMj1kXGsmK9pBmgwmMEr302eCHtL=cqs4jqM_jOiK-bLO2gQog@mail.gmail.com>
 <YfKXM0wBfTh0V8+L@FVFF77S0Q05N>
 <CAMj1kXF3Fg2O=5prQnUWeNFeCqojP1z2zDXMwxFdcNtWLfL7Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXF3Fg2O=5prQnUWeNFeCqojP1z2zDXMwxFdcNtWLfL7Vg@mail.gmail.com>
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

On Thu, Jan 27, 2022 at 02:07:03PM +0100, Ard Biesheuvel wrote:
> On Thu, 27 Jan 2022 at 13:59, Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Thu, Jan 27, 2022 at 01:22:17PM +0100, Ard Biesheuvel wrote:
> > > On Thu, 27 Jan 2022 at 13:20, Mark Rutland <mark.rutland@arm.com> wrote:
> > > > On Thu, Jan 27, 2022 at 01:03:34PM +0100, Ard Biesheuvel wrote:
> > > >
> > > > > These architectures use place-relative extables for the same reason:
> > > > > place relative references are resolved at build time rather than at
> > > > > runtime during relocation, making a build time sort feasible.
> > > > >
> > > > > arch/alpha/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > > arch/arm64/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > > arch/ia64/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > > arch/parisc/include/asm/uaccess.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > > arch/powerpc/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > > arch/riscv/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > > arch/s390/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > > arch/x86/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > >
> > > > > Note that the swap routine becomes something like the below, given
> > > > > that the relative references need to be fixed up after the entry
> > > > > changes place in the sorted list.
> > > > >
> > > > > static void swap_ex(void *a, void *b, int size)
> > > > > {
> > > > >         struct exception_table_entry *x = a, *y = b, tmp;
> > > > >         int delta = b - a;
> > > > >
> > > > >         tmp = *x;
> > > > >         x->insn = y->insn + delta;
> > > > >         y->insn = tmp.insn - delta;
> > > > >         ...
> > > > > }
> > > > >
> > > > > As a bonus, the resulting footprint of the table in the image is
> > > > > reduced by 8x, given that every 8 byte pointer has an accompanying 24
> > > > > byte RELA record, so we go from 32 bytes to 4 bytes for every call to
> > > > > __gnu_mcount_mc.
> > > >
> > > > Absolutely -- it'd be great if we could do that for the callsite locations; the
> > > > difficulty is that the entries are generated by the compiler itself, so we'd
> > > > either need some build/link time processing to convert each absolute 64-bit
> > > > value to a relative 32-bit offset, or new compiler options to generate those as
> > > > relative offsets from the outset.
> > >
> > > Don't we use scripts/recordmcount.pl for that?
> >
> > Not quite -- we could adjust it to do so, but today it doesn't consider
> > existing mcount_loc entries, and just generates new ones where the compiler has
> > generated calls to mcount, which it finds by scanning the instructions in the
> > binary. Today it is not used:
> >
> > * On arm64 when we default to using `-fpatchable-function-entry=N`.  That makes
> >   the compiler insert 2 NOPs in the function prologue, and log the location of
> >   that NOP sled to a section called.  `__patchable_function_entries`.
> >
> >   We need the compiler to do that since we can't reliably identify 2 NOPs in a
> >   function prologue as being intended to be a patch site, as e.g. there could
> >   be notrace functions where the compiler had to insert NOPs for alignment of a
> >   subsequent brnach or similar.
> >
> > * On architectures with `-nop-mcount`. On these, it's necessary to use
> >   `-mrecord-mcount` to have the compiler log the patch-site, for the same
> >   reason as with `-fpatchable-function-entry`.
> >
> > * On architectures with `-mrecord-mcount` generally, since this avoids the
> >   overhead of scanning each object.
> >
> > * On x86 when objtool is used.
> >
> 
> Right.
> 
> I suppose that on arm64, we can work around this by passing
> --apply-dynamic-relocs to the linker, so that all R_AARCH64_RELATIVE
> targets are prepopulated with the link time value of the respective
> addresses. It does cause some bloat, which is why we disable that
> today, but we could make that dependent on ftrace being enabled.

We'd also need to teach the build-time sort to update the relocations, unless
you mean to also change the boot-time reloc code to RMW with the offset?

I think for right now the best thing is to disable the build-time sort for
arm64, but maybe something like that is the right thing to do longer term.

> I do wonder how much over head we accumulate, though, by having all
> these relocations, but I suppose that is the situation today in any
> case.

Yeah; I suspect if we want to do something about that we want to do it more
generally, and would probably need to do something like the x86 approach and
rewrite the relocs at build-time to something more compressed. If we applied
the dynamic relocs with the link-time address we'd only need 4 bytes to
identify each pointer to apply an offset to.

I'm not exactly sure how we could do that, nor what the trade-off look like in
practice.

THanks,
Mark.
