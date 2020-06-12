Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A51F7E77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 23:35:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kDXV6LCrzDr1Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 07:35:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=rbkQ2oj9; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kDVY0STLzDqvd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 07:33:24 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id s23so4906386pfh.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0GLuAsGyzw8XHhb9/Fo63Z5vxlJgDAQ39CGDhGwS054=;
 b=rbkQ2oj9O9gTPPbPoOCPZmUZbaMeD2elX037NDfoqa9tP8JAUYHbOz8B0Yij58YAnq
 8/qRFpWyBd0PuSOTxponSdBG0KZaj2LBuyk5Bs76l1F9UkvD++szIxYDDkAMNtFLhTgV
 cDNNOn2iz++xIG0WRGJfn0L/qhvejS92Z9BQxCeFacxt/Rgl2D3mzj3t3bjJx3fgerVx
 NzjDa+EQtwOHivdCuc3kXny+vCBboe/x9e0jf289ztzXvxrR3zQza+sUiRNIhQ2oxk/I
 HADTlxXkiDpDHipgeR3She05KK63aDyBYO5N6Y6EBmwpuMrGi+MctEpYDstcw33IJ2pW
 Iegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0GLuAsGyzw8XHhb9/Fo63Z5vxlJgDAQ39CGDhGwS054=;
 b=i+2Du9rzTk76tde9zwBdynj08uQQeR6W1Io4V1GnCjlqsq+sULQhI6vh9hVQ45oNqG
 azEFWMjIIOTvuQfz3W0BhAbUZu4xQhKPOuqDd4NflcKQK0a8SWn+tTBJBH11aiLeikvd
 juq7IkQrSzxWrNQtNkli6a8MK3d7x4E36Ng3dIVPLoRbnO6nH9jOnVm9Tq1If+wHT4ky
 DeUSnSKSRysHUrYOb5uWnPfLOdh6uXcmhXgsAfjCoHGOy9gP3XY1PL8l0vZbQVqx1mUJ
 TNfNBdXgsJ6t4DcLS4vdX/3UXLXfJzViVG3eQfRU8AAfSq2G7JW92pxDwh+5fsPPW+6I
 5+Ig==
X-Gm-Message-State: AOAM532iiAtj0PRN71SOMDLOs6xaPFlg0e7zb5TRddiG2lO4vcDcDdEu
 VcIlyFTIeJFToX7KT8fwTOjE0wN9jAPednXbGjrDGw==
X-Google-Smtp-Source: ABdhPJx+4mECMpHu00mF9/2L/mTNPot8//CHptWLmjXuq6HX2R196IB0IpWDqfk7vhNEkpNPAzjMfVMtnMQMcgUbqlA=
X-Received: by 2002:a63:f00d:: with SMTP id k13mr12942397pgh.263.1591997600747; 
 Fri, 12 Jun 2020 14:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <49YBKY13Szz9sT4@ozlabs.org>
 <20200611224355.71174-1-ndesaulniers@google.com>
 <20200611235256.GL31009@gate.crashing.org>
In-Reply-To: <20200611235256.GL31009@gate.crashing.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 12 Jun 2020 14:33:09 -0700
Message-ID: <CAKwvOdkKywb1KZ-SDwwuvQEmbsaAzJj9mEPqVG=qw1F5Ogv8rw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Ellerman <patch-notifications@ellerman.id.au>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 11, 2020 at 4:53 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Thu, Jun 11, 2020 at 03:43:55PM -0700, Nick Desaulniers wrote:
> > Segher, Cristophe, I suspect Clang is missing support for the %L and %U
> > output templates [1].
>
> The arch/powerpc kernel first used the %U output modifier in 0c176fa80fdf
> (from 2016), and %L in b8b572e1015f (2008).  include/asm-ppc (and ppc64)
> have had %U since 2005 (1da177e4c3f4), and %L as well (0c541b4406a6).

Thanks for all the references.  So it looks like we should have failed
sooner, if we didn't support those. Hmm...

> > Can you please point me to documentation/unit tests/source for
> > these so that I can figure out what they should be doing, and look into
> > implementing them in Clang?
>
> The PowerPC part of
> https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html#Machine-Const=
raints
> (sorry, no anchor) documents %U.

I thought those were constraints, not output templates?  Oh,
    The asm statement must also use %U<opno> as a placeholder for the
    =E2=80=9Cupdate=E2=80=9D flag in the corresponding load or store instru=
ction.
got it.

>
> Traditionally the source code is the documentation for this.  The code
> here starts with the comment
>       /* Write second word of DImode or DFmode reference.  Works on regis=
ter
>          or non-indexed memory only.  */
> (which is very out-of-date itself, it works fine for e.g. TImode as well,
> but alas).
>
> Unit tests are completely unsuitable for most compiler things like this.

What? No, surely one may write tests for output operands.  Grepping
for `%L` in gcc/ was less fun than I was hoping.

>
> The source code is gcc/config/rs6000/rs6000.c, easiest is to search for
> 'L' (with those quotes).  Function print_operand.
>
> HtH,

Yes, perfect, thank you so much!  So it looks like LLVM does not yet
handle %L properly for memory operands.
https://bugs.llvm.org/show_bug.cgi?id=3D46186#c4
It's neat to see how this is implemented in GCC (and how many aren't
implemented in LLVM, yikes :( ).  For reference, this is implemented
in PPCAsmPrinter::PrintAsmOperand() and
PPCAsmPrinter::PrintAsmMemoryOperand() in
llvm/lib/Target/PowerPC/PPCAsmPrinter.cpp.  GCC switches first on the
modifier characters, then the operand type. LLVM dispatches on operand
type, then modifier.  When I was looking into LLVM's AsmPrinter class,
I was surprised to see it's basically an assembler that just has
complex logic to just do a bunch of prints, so it makes sense to see
that pattern in GCC literally calling printf.  Not drastically
different than my first toy compiler
https://nickdesaulniers.github.io/blog/2015/05/25/interpreter-compiler-jit/
(looking back at that post now knowing what relocations are, I feel I
should probably add a note that that's a problem that's being solved
there.  Didn't know it at the time).

Some things I don't understand from PPC parlance is the "mode"
(preinc, predec, premodify) and small data operands?

IIUC the bug report correctly, it looks like LLVM is failing for the
__put_user_asm2_goto case for -m32.  A simple reproducer:
https://godbolt.org/z/jBBF9b

void foo(long long in, long long* out) {
asm volatile(
  "stw%X1 %0, %1\n\t"
  "stw%X1 %L0, %L1"
  ::"r"(in), "m"(*out));
}
prints (in GCC):
foo:
  stw 3, 0(5)
  stw 4, 4(5)
  blr
(first time looking at ppc assembler, seems constants and registers
are not as easy to distinguish,
https://developer.ibm.com/technologies/linux/articles/l-ppc/ say "Get
used to it." LOL, ok).
so that's "store word from register 3 into dereference of register 5
plus 0, then store word from register 4 into dereference of register 5
plus 4?"  Guessing the ppc32 abi is ILP32 putting long long's into two
separate registers?
Seems easy to implement in LLVM (short of those modes/small data operands).
https://reviews.llvm.org/D81767
--=20
Thanks,
~Nick Desaulniers
