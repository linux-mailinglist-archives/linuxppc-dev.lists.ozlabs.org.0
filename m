Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F949E316
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 14:08:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl1974Mcvz3cN2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 00:07:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UoX6rFQM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UoX6rFQM; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl18S24m5z2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 00:07:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36AB461B43
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 13:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F193C340E8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 13:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643288836;
 bh=xjiolTwYVgGM09+KCzAYuvgj9y0KyzZcSIFHpSpItXk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UoX6rFQMHpfRRGi8X1i7wYsabbL2lq5IFZg6+XQmkkuIoqVFw2pmh+GGKLpdUW3uH
 4FEX65OwRSzBC/24euszv0oZnaeZyI68fTEhuk2XOusktZ27+IoneGCIeP4A+8rN8Y
 ZPu6ydG4uuAVMZfiVNiZID0MxtFKZvPvj808hYGSBmYDP9C8iiT14zN6bM4yj/G3N8
 E00bPsN1mI69BRJ2T4kl6k8RPKHcekVuGZkcjgZ4CLzVHrFRiOkK8S9D96Toa1b1XS
 +tLfDlZjP9+Dk7QIiFe2ZDkh/xjWM74vYacpiDqE6wzLHVqiiq9rIGVP1mgW22JIxE
 jyBFb0acj0KTQ==
Received: by mail-wm1-f51.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso1814790wms.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 05:07:16 -0800 (PST)
X-Gm-Message-State: AOAM531cnqHKWB+qN1esX4FJPEyGB4ezf3Vk3MV9jSm9cu3pzTAyHSVD
 4MAncWRrqz0eAUbeJByp3EQPGdmB8H2qb/uL4Nc=
X-Google-Smtp-Source: ABdhPJwbCwCWLtbAbT8kLcweQn+kTjBpSx1tf+fD4KUCz2yJl1aENEcupjcDD8pDx8dzv7OGcDz8MrNZd3DgigGp4iU=
X-Received: by 2002:a05:600c:a47:: with SMTP id
 c7mr3158487wmq.25.1643288834852; 
 Thu, 27 Jan 2022 05:07:14 -0800 (PST)
MIME-Version: 1.0
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <CAMj1kXHgpr0KYx5PYO_SpqaN8Ar2kfmc9Pb-d26uaYDpjwTz9w@mail.gmail.com>
 <YfKOENgR6sLnHQmA@FVFF77S0Q05N>
 <CAMj1kXGsmK9pBmgwmMEr302eCHtL=cqs4jqM_jOiK-bLO2gQog@mail.gmail.com>
 <YfKXM0wBfTh0V8+L@FVFF77S0Q05N>
In-Reply-To: <YfKXM0wBfTh0V8+L@FVFF77S0Q05N>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Jan 2022 14:07:03 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF3Fg2O=5prQnUWeNFeCqojP1z2zDXMwxFdcNtWLfL7Vg@mail.gmail.com>
Message-ID: <CAMj1kXF3Fg2O=5prQnUWeNFeCqojP1z2zDXMwxFdcNtWLfL7Vg@mail.gmail.com>
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

On Thu, 27 Jan 2022 at 13:59, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Jan 27, 2022 at 01:22:17PM +0100, Ard Biesheuvel wrote:
> > On Thu, 27 Jan 2022 at 13:20, Mark Rutland <mark.rutland@arm.com> wrote:
> > > On Thu, Jan 27, 2022 at 01:03:34PM +0100, Ard Biesheuvel wrote:
> > >
> > > > These architectures use place-relative extables for the same reason:
> > > > place relative references are resolved at build time rather than at
> > > > runtime during relocation, making a build time sort feasible.
> > > >
> > > > arch/alpha/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > arch/arm64/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > arch/ia64/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > arch/parisc/include/asm/uaccess.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > arch/powerpc/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > arch/riscv/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > arch/s390/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > > arch/x86/include/asm/extable.h:#define ARCH_HAS_RELATIVE_EXTABLE
> > > >
> > > > Note that the swap routine becomes something like the below, given
> > > > that the relative references need to be fixed up after the entry
> > > > changes place in the sorted list.
> > > >
> > > > static void swap_ex(void *a, void *b, int size)
> > > > {
> > > >         struct exception_table_entry *x = a, *y = b, tmp;
> > > >         int delta = b - a;
> > > >
> > > >         tmp = *x;
> > > >         x->insn = y->insn + delta;
> > > >         y->insn = tmp.insn - delta;
> > > >         ...
> > > > }
> > > >
> > > > As a bonus, the resulting footprint of the table in the image is
> > > > reduced by 8x, given that every 8 byte pointer has an accompanying 24
> > > > byte RELA record, so we go from 32 bytes to 4 bytes for every call to
> > > > __gnu_mcount_mc.
> > >
> > > Absolutely -- it'd be great if we could do that for the callsite locations; the
> > > difficulty is that the entries are generated by the compiler itself, so we'd
> > > either need some build/link time processing to convert each absolute 64-bit
> > > value to a relative 32-bit offset, or new compiler options to generate those as
> > > relative offsets from the outset.
> >
> > Don't we use scripts/recordmcount.pl for that?
>
> Not quite -- we could adjust it to do so, but today it doesn't consider
> existing mcount_loc entries, and just generates new ones where the compiler has
> generated calls to mcount, which it finds by scanning the instructions in the
> binary. Today it is not used:
>
> * On arm64 when we default to using `-fpatchable-function-entry=N`.  That makes
>   the compiler insert 2 NOPs in the function prologue, and log the location of
>   that NOP sled to a section called.  `__patchable_function_entries`.
>
>   We need the compiler to do that since we can't reliably identify 2 NOPs in a
>   function prologue as being intended to be a patch site, as e.g. there could
>   be notrace functions where the compiler had to insert NOPs for alignment of a
>   subsequent brnach or similar.
>
> * On architectures with `-nop-mcount`. On these, it's necessary to use
>   `-mrecord-mcount` to have the compiler log the patch-site, for the same
>   reason as with `-fpatchable-function-entry`.
>
> * On architectures with `-mrecord-mcount` generally, since this avoids the
>   overhead of scanning each object.
>
> * On x86 when objtool is used.
>

Right.

I suppose that on arm64, we can work around this by passing
--apply-dynamic-relocs to the linker, so that all R_AARCH64_RELATIVE
targets are prepopulated with the link time value of the respective
addresses. It does cause some bloat, which is why we disable that
today, but we could make that dependent on ftrace being enabled.

I do wonder how much over head we accumulate, though, by having all
these relocations, but I suppose that is the situation today in any
case.
