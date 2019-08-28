Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EACE8A0936
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 20:04:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JYYB5SCMzDqtN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 04:04:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rOtj7avi"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JYTS5XHYzDrJj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 04:01:31 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id o13so118469pgp.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/9cEynbX19AvJzoEgiHwKGteceFTE1ys9oyagJjkZAw=;
 b=rOtj7aviFrxSPtDu5RCopbB3+BGnL8mph6ucHa2CIA7ygi0sOSsEibJuEbbJj94fpQ
 x66iT79k3dbCO/mCbxrmkq9BxvyshcXfzaUejmsf0qfi0qYGAbJCU8dC6nkMp133T8kN
 eGMqnQ6ai9vsiu2yIbbfsiXK4AD5JOIThmRseYbjF6Ocr6f/D3XA5QqyRqTDjmdB+KIW
 bP8eQgpGqZMAzoub5+TCB1FsSsrKQjgf6aCd00I60WHxUq2KP0UoLSTRveezMmwkQFkY
 WkNHgVFaRt5C/18B4Q9hr18vzFE9nwUhW55/xNAUM2v1DnTrw3y74yGKFtwRnA4avGBl
 kBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/9cEynbX19AvJzoEgiHwKGteceFTE1ys9oyagJjkZAw=;
 b=r1AUYuNI4mxR5wYgO/AkkLvtV7wcCXcuaGe7vdHcJ+EOYWpkKJ9EioqWWecd2CdLoD
 z3aKfOs/GnedAWPYyBouYc32hdg1fc1eRR3S6FRaRYSKx7EgQgABqLpg4iojGw9IAOBw
 wmVx4INLmKEO5lQABYwc6kCMhVauydAHsj6t4v+hUOJDWIwiIRd5Pa3IJ2JTJ3NnynFz
 169z4xZTVwOu7b3FCeRlTbB22IyIenoRxzf+RCZzu9iC8gRTdP1+NuXtUPMlYBzUu52f
 gl9ZadqUC5lKmORNWTCKHxpIfIAxjODc95tGCuEwphmZf33lZXfX5H52XrXtLmQSLOUx
 it1w==
X-Gm-Message-State: APjAAAUq55L1EPrpPxAfTxzzOsd+j7iu5/myAbSjlxLETpTyaSTVdxpk
 WLZSJ1pb97iN4X/EbtNH7T0QrOSCXFLdWVzC/8KyHw==
X-Google-Smtp-Source: APXvYqwLIJGTP7b3E1+6DKIHKO+TMUth/mMe1NLek/YikeEOUIvfeSOCsus777R/aF0jN7WKBM1D3IrXGdGNjXlUYYo=
X-Received: by 2002:a63:61cd:: with SMTP id v196mr4621079pgb.263.1567015286046; 
 Wed, 28 Aug 2019 11:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190812023214.107817-1-natechancellor@gmail.com>
 <878srdv206.fsf@mpe.ellerman.id.au>
 <20190828175322.GA121833@archlinux-threadripper>
In-Reply-To: <20190828175322.GA121833@archlinux-threadripper>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Aug 2019 11:01:14 -0700
Message-ID: <CAKwvOdmXbYrR6n-cxKt3XxkE4Lmj0sSoZBUtHVb0V2LTUFHmug@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2019 at 10:53 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 11:43:53PM +1000, Michael Ellerman wrote:
> > Nathan Chancellor <natechancellor@gmail.com> writes:
> >
> > > Commit aea447141c7e ("powerpc: Disable -Wbuiltin-requires-header when
> > > setjmp is used") disabled -Wbuiltin-requires-header because of a warning
> > > about the setjmp and longjmp declarations.
> > >
> > > r367387 in clang added another diagnostic around this, complaining that
> > > there is no jmp_buf declaration.
> > >
> > > In file included from ../arch/powerpc/xmon/xmon.c:47:
> > > ../arch/powerpc/include/asm/setjmp.h:10:13: error: declaration of
> > > built-in function 'setjmp' requires the declaration of the 'jmp_buf'
> > > type, commonly provided in the header <setjmp.h>.
> > > [-Werror,-Wincomplete-setjmp-declaration]
> > > extern long setjmp(long *);
> > >             ^
> > > ../arch/powerpc/include/asm/setjmp.h:11:13: error: declaration of
> > > built-in function 'longjmp' requires the declaration of the 'jmp_buf'
> > > type, commonly provided in the header <setjmp.h>.
> > > [-Werror,-Wincomplete-setjmp-declaration]
> > > extern void longjmp(long *, long);
> > >             ^
> > > 2 errors generated.
> > >
> > > Take the same approach as the above commit by disabling the warning for
> > > the same reason, we provide our own longjmp/setjmp function.
> > >
> > > Cc: stable@vger.kernel.org # 4.19+
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/625
> > > Link: https://github.com/llvm/llvm-project/commit/3be25e79477db2d31ac46493d97eca8c20592b07
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > ---
> > >
> > > It may be worth using -fno-builtin-setjmp and -fno-builtin-longjmp
> > > instead as it makes it clear to clang that we are not using the builtin
> > > longjmp and setjmp functions, which I think is why these warnings are
> > > appearing (at least according to the commit that introduced this waring).
> > >
> > > Sample patch:
> > > https://github.com/ClangBuiltLinux/linux/issues/625#issuecomment-519251372
> >
> > Couldn't we just add those flags to CFLAGS for the whole kernel? Rather
> > than making them per-file.
>
> Yes, I don't think this would be unreasonable. Are you referring to the
> cc-disable-warning flags or the -fno-builtin flags? I personally think
> the -fno-builtin flags convey to clang what the kernel is intending to
> do better than disabling the warnings outright.

The `-f` family of flags have dire implications for codegen, I'd
really prefer we think long and hard before adding/removing them to
suppress warnings.  I don't think it's a solution for this particular
problem.

>
> > I mean there's no kernel code that wants to use clang's builtin
> > setjmp/longjmp implementation at all right?
> >
> > cheers
>
> I did a quick search of the tree and it looks like powerpc and x86/um
> are the only architectures that do anything with setjmp/longjmp. x86/um
> avoids this by using a define flag to change setjmp to kernel_setjmp:
>
> arch/um/Makefile: -Dlongjmp=kernel_longjmp -Dsetjmp=kernel_setjmp \
>
> Seems like adding those flags should be safe.
>
> Cheers,
> Nathan



-- 
Thanks,
~Nick Desaulniers
