Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 922A849E24A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 13:23:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl09g3T2Jz3bZC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 23:23:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ThUHhQpH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ThUHhQpH; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl08m5zvKz3bcp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 23:22:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E68E9619E1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 12:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579B5C36AE3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 12:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643286150;
 bh=VONGN8gwVV5fAPg5evut1IyWHTHY4WB+eJ9aI5siPLQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ThUHhQpHzezsBRgkqSGLeGrHTpX4y1HXCDJh7WjodyPHvfSf1LfujpT6SUREL1eTN
 T9Vz8PzwnBJOhLH7a2GdCpUzgD8GVmoirho6KQjLGNxAHEvRg4NUT+8+2rE3QHBQOR
 6R2G7NSvNXIPgmbhFz1P73ZVsnitABCBygNB1HgSjxmNhLbRzHpLtYFoekokKi4IS/
 oe0wiLQkirc2Vjld7eUpytvi1PU9Vy0dxSOi23lv6upu2GLOqYyzAJ9C3pWoZXvzhK
 vna+RCgCXMG/MzYqihFITcj9ZGLGCi5+fQNBKggvtJPbK1c3ATj9d/peh4H2f/G0JO
 I6lz/gnT2sxVQ==
Received: by mail-wr1-f48.google.com with SMTP id u15so4460755wrt.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 04:22:30 -0800 (PST)
X-Gm-Message-State: AOAM530KHZZP4u+OC1fHJ3niocAYyf8vIGKL4/29oyAK3BiZSV+vCzXc
 F7Nivf2gS4Do6lpCbuY+UeZoNiV5QyXp+MEPLWk=
X-Google-Smtp-Source: ABdhPJxxvswEQ3V77CQZybAvJmdUjKALZP7g0AfmzEH6CCanqxQRgzk0qTVYBszKKkJZ+ApEELX5+Y+BqCxIYr3sxp0=
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr2722249wry.417.1643286148547; 
 Thu, 27 Jan 2022 04:22:28 -0800 (PST)
MIME-Version: 1.0
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <CAMj1kXHgpr0KYx5PYO_SpqaN8Ar2kfmc9Pb-d26uaYDpjwTz9w@mail.gmail.com>
 <YfKOENgR6sLnHQmA@FVFF77S0Q05N>
In-Reply-To: <YfKOENgR6sLnHQmA@FVFF77S0Q05N>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Jan 2022 13:22:17 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGsmK9pBmgwmMEr302eCHtL=cqs4jqM_jOiK-bLO2gQog@mail.gmail.com>
Message-ID: <CAMj1kXGsmK9pBmgwmMEr302eCHtL=cqs4jqM_jOiK-bLO2gQog@mail.gmail.com>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
To: Mark Rutland <mark.rutland@arm.com>
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
Cc: Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sachin Sant <sachinp@linux.ibm.com>,
 Yinan Liu <yinan@linux.alibaba.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jan 2022 at 13:20, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Jan 27, 2022 at 01:03:34PM +0100, Ard Biesheuvel wrote:
> > On Thu, 27 Jan 2022 at 12:47, Mark Rutland <mark.rutland@arm.com> wrote:
> > >
> > > [adding LKML so this is easier for others to find]
> > >
> > > If anyone wants to follow the thread from the start, it's at:
> > >
> > >   https://lore.kernel.org/linuxppc-dev/944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com/
> > >
> > > Ard, I was under the impression that the 32-bit arm kernel was (virtually)
> > > relocatable, but I couldn't spot where, and suspect I'm mistaken. Do you know
> > > whether it currently does any boot-time dynamic relocation?
> >
> > No, it does not.
>
> Thanks for comfirming!
>
> So 32-bit arm should be able to opt into the build-time sort as-is.
>
> > > Steve asked for a bit more detail on IRC, so the below is an attempt to explain
> > > what's actually going on here.
> > >
> > > The short answer is that relocatable kernels (e.g. those with KASLR support)
> > > need to handle the kernel being loaded at (somewhat) arbitrary virtual
> > > addresses. Even where code can be position-independent, any pointers in the
> > > kernel image (e.g. the contents of the mcount_loc table) need to be updated to
> > > account for the specific VA the kernel was loaded at -- arch code does this
> > > early at boot time by applying dynamic (ELF) relocations.
> >
> > These architectures use place-relative extables for the same reason:
> > place relative references are resolved at build time rather than at
> > runtime during relocation, making a build time sort feasible.
> >
> > arch/alpha/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > arch/arm64/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > arch/ia64/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > arch/parisc/include/asm/uaccess.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > arch/powerpc/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > arch/riscv/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > arch/s390/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > arch/x86/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> >
> > Note that the swap routine becomes something like the below, given
> > that the relative references need to be fixed up after the entry
> > changes place in the sorted list.
> >
> > static void swap_ex(void *a, void *b, int size)
> > {
> >         struct exception_table_entry *x = a, *y = b, tmp;
> >         int delta = b - a;
> >
> >         tmp = *x;
> >         x->insn = y->insn + delta;
> >         y->insn = tmp.insn - delta;
> >         ...
> > }
> >
> > As a bonus, the resulting footprint of the table in the image is
> > reduced by 8x, given that every 8 byte pointer has an accompanying 24
> > byte RELA record, so we go from 32 bytes to 4 bytes for every call to
> > __gnu_mcount_mc.
>
> Absolutely -- it'd be great if we could do that for the callsite locations; the
> difficulty is that the entries are generated by the compiler itself, so we'd
> either need some build/link time processing to convert each absolute 64-bit
> value to a relative 32-bit offset, or new compiler options to generate those as
> relative offsets from the outset.
>

Don't we use scripts/recordmcount.pl for that?
