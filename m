Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCF520744
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 23:59:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxw6q13Wsz3c7R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 07:58:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=PgydWL3i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=PgydWL3i; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxw6B3XbZz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 07:58:25 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id i10so26122678lfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 14:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aM58VLEYK3OPz+dxz/e3P39oZMoTQOHg5Skeyfuaw+k=;
 b=PgydWL3iTr2+I7wwsidaRzy2KvNTlCFmCHi3NEgdM4U5/OxxoUcNyUi0fZX095bEy/
 u8gfFHMeT9ZDIR9vAwTWhYx4Q08Bvi9ZqGTCPxANowlGLYBJgftCkf5TC0hi3fxt6CQK
 3e35rJ9iQCJ+59jZJ9QsBy0XmRmoSDLxVdFxtIArysOaiMXvWR5HMlwmH0QKaXBRdnWX
 2U7SFHMcBxI/JnZKhCginJrSqmQohQKV99PIH4qOOugMz8nruN1YMFhPjAjfN//X2XRj
 P/i0fiUqC5WNOpd9WnurknYwSXiWhhI1fvhCwGjzasF1gR0bsPggUfvDqfAQwWtvTZyI
 M0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aM58VLEYK3OPz+dxz/e3P39oZMoTQOHg5Skeyfuaw+k=;
 b=zTh0Glm/ndH2WLvTkjdPhCD9MTgnhihyvCHiKu5/X1ACJc+f1Ytvxqa9+Iqr26acnJ
 xpO2KiOZjbnalA4jdvYgHvx7oWd6NkBI7+Rr3ghIWHUg4tV+AVVpxKS4PWCSSEFcE1/v
 Oe0pv74lr/D7pVKZxcadUPjbX2WHKzvAc7ABXczCDjDYRrv6rZT4WegVc6HOY93a3X6M
 PhogpCZxLTVyrg9DDm7fWZg75J2vHhjwDgz1SM9qlGsTtFGoOET5zLAgIodhJ9IO0XyZ
 2NAJuAIOuvz1RL8IilpO/2VvaIjHgHKkMo/17RVTWhMkIgMzFfFgwKMVyunYvzxu7s2Q
 csHg==
X-Gm-Message-State: AOAM530eMEWM1du8CgBNfYp2sRgmr9NsuVDkqyqKwxuSUUnjkF1S6tsJ
 2T0xSJCz/nYJDg9tLDzjbbnpPQzfh/FB9vcxH7UrIw==
X-Google-Smtp-Source: ABdhPJxIH8+tsIhft4L3Ly9ibBwf8nUknmdWV0+D0qaUm7yXlZfZMRiNhcm2509AU0Xek7fJ/kWMwz5mBiDFGroZkhY=
X-Received: by 2002:a05:6512:48f:b0:472:3c47:94a0 with SMTP id
 v15-20020a056512048f00b004723c4794a0mr14081977lfq.579.1652133501024; Mon, 09
 May 2022 14:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220509204635.2539549-1-nathan@kernel.org>
 <20220509204635.2539549-3-nathan@kernel.org>
 <CAKwvOdkvF8AJudCcu=CVmU42eyVMJwUjQFnX+rpVF45bTR86Mg@mail.gmail.com>
 <YnmL6a8eObtstNjZ@dev-arch.thelio-3990X>
In-Reply-To: <YnmL6a8eObtstNjZ@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 14:58:09 -0700
Message-ID: <CAKwvOdnbTGpNvXsum-cM8i5sWuATLHouaURE1vkjuOj5rzTuqw@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/vdso: Link with ld.lld when requested
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 patches@lists.linux.dev, Paul Mackerras <paulus@samba.org>,
 Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 9, 2022 at 2:47 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, May 09, 2022 at 02:24:40PM -0700, Nick Desaulniers wrote:
> > On Mon, May 9, 2022 at 1:47 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > The PowerPC vDSO is linked with $(CC) instead of $(LD), which means the
> > > default linker of the compiler is used instead of the linker requested
> > > by the builder.
> > >
> > >   $ make ARCH=powerpc LLVM=1 mrproper defconfig arch/powerpc/kernel/vdso/
> > >   ...
> > >
> > >   $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
> > >
> > >   File: arch/powerpc/kernel/vdso/vdso32.so.dbg
> > >   String dump of section '.comment':
> > >   [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> > >
> > >   File: arch/powerpc/kernel/vdso/vdso64.so.dbg
> > >   String dump of section '.comment':
> > >   [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> > >
> > > The compiler option '-fuse-ld' tells the compiler which linker to use
> > > when it is invoked as both the compiler and linker. Use '-fuse-ld=lld'
> > > when LD=ld.lld has been specified (CONFIG_LD_IS_LLD) so that the vDSO is
> > > linked with the same linker as the rest of the kernel.
> > >
> > >   $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
> > >
> > >   File: arch/powerpc/kernel/vdso/vdso32.so.dbg
> > >   String dump of section '.comment':
> > >   [     0] Linker: LLD 14.0.0
> > >   [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> > >
> > >   File: arch/powerpc/kernel/vdso/vdso64.so.dbg
> > >   String dump of section '.comment':
> > >   [     0] Linker: LLD 14.0.0
> > >   [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> > >
> > > LD can be a full path to ld.lld, which will not be handled properly by
> > > '-fuse-ld=lld' if the full path to ld.lld is outside of the compiler's
> > > search path. '-fuse-ld' can take a path to the linker but it is
> > > deprecated in clang 12.0.0; '--ld-path' is preferred for this scenario.
> > >
> > > Use '--ld-path' if it is supported, as it will handle a full path or
> > > just 'ld.lld' properly. See the LLVM commit below for the full details
> > > of '--ld-path'.
> >
> > Perhaps worth adding some additional background from the cover letter
> > to the commit message that will actually go into the kernel,
> > particularly:
> > 1. Kbuild mostly invokes the compiler and linker distinctly; the ppc
> > vdso code uses the compiler as the linker driver though.
> > 2. When doing so, depending on how the compiler was configured, the
> > implicit default linker the compiler invokes might not match $LD.
>
> Sure, I think I can clear up these two points with something like:
>
> "The PowerPC vDSO uses $(CC) to link, which differs from the rest of the
> kernel, which uses $(LD) directly. As a result, the default linker of
> the compiler is used, which may differ from the linker requested by the
> builder. For example:
>
> <example above>
>
> LLVM=1 sets LD=ld.lld but ld.lld is not used to link the vDSO; GNU ld is
> because "ld" is the default linker for clang on most Linux platforms."
>
> Thoughts?

SGTM

>
> > 3. This is a problem for LTO since clang may try to invoke ld.gold,
> > which is not supported as of
> > commit 75959d44f9dc ("kbuild: Fail if gold linker is detected")
>
> Technically, it seemed like ld.bfd was being invoked but the LLVMgold
> plugin did not exist. Regardless, moving to ld.lld will resolve that,
> since the LLVMgold plugin won't be needed.

Oh indeed, invoking clang with `-flto -###` shows it does invoke the
system's linker with `-plugin path/to/LLVMgold.so`, not `ld.gold`
itself.  I don't think we should use or depend on the LLVMgold.so
plugin either (I suspect it will invoke ld.gold, but as you noticed, I
don't bother to build LLVMgold.so).  So, perhaps reworded (feel free
to reword further):

3. This is a problem for LTO since clang may try to invoke ld.bfd with
the LLVMgold.so plugin.
https://llvm.org/docs/GoldPlugin.html states that "usage of the LLVM
gold plugin with ld.bfd is not tested and therefore not officially
supported or recommended." Users should instead use ld.lld to drive
linking for LTO with clang.

>
> > 4. Using the linker as the driver can cause ld.bfd 2.26 to crash.
> > https://lore.kernel.org/all/b2066ccd-2b81-6032-08e3-41105b400f75@csgroup.eu/
> > (Though, I wonder if that's because I was trying to add
> > --orphan-handling=warn, which we're not yet doing for the ppc vdso
> > AFAICT).
>
> I can add this if necessary but it seemed like there might have been
> other problems reported? I could just add a blanket "linker driver had
> issues, we'll try again later" or something of that effect?

Sure.

-- 
Thanks,
~Nick Desaulniers
