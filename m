Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A372867F234
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 00:20:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3YTX3FdMz3fLS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 10:20:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=paJf4L9c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=maskray@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=paJf4L9c;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3YSZ5x7Qz3fGx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 10:19:41 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id w6-20020a17090ac98600b0022c58cc7a18so1659501pjt.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 15:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8CUiuR0W5E+PBhliE9B5Xpc1hgvQcn7IvZXYHXz1Ztk=;
        b=paJf4L9cWbEi06hvXF3W+dvDzKcJfx5lCtIJZryT2W6x9jn8QFdqdeSxBXueWWBz4l
         rmERWAhF8Jm6eVjAbcEKqXWk92TaZ81krplTYlrMd/cx7BLYELfqbb5CODOLpDvn3Wml
         kRDg2FG0oQukaBrpadAmUfS7JdX6dtNX5Yhxfrmh9fF25lANpaUbh+OUe4mJnDmapjXX
         gkAdUczu4u3q5myPePEFbhYsOrjzSYhCHKeHI7PmJlrIZYidHb64mfDumPwdlk9pOjoP
         gInzuu73k1EMmj9geC+hKbAVQjTYtmE/jHVcj9mm7ngPUJ7ymq4p0azycwmTjONcP99X
         kwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CUiuR0W5E+PBhliE9B5Xpc1hgvQcn7IvZXYHXz1Ztk=;
        b=5TcR5szaXN5D6TJRvFs0xXHr0K+Ox81S1D7bp9wRietZSx64MBep1DJgWCaEBN7hND
         R6uI9vkjLa9J4X/S4WQsEYX3U/PBmeuFTk+jYOGTstOGp9cx16sx5dU++5JKV9wB8P0L
         58JZ+0WAldNuUIMKfT/QpSK7jCZheSACsCMkQVjEDD9t0VI+AzTFn5jZmRm+5Qj59NXG
         x2cz9bqr/TYNUPdixOq6klapnDAu4Ke8IfL1PN5aT5SYqd5NKSCRikATCbg6tu/71aQl
         gBpA2JTPQZBfwxf+dfXuZf0EF676vhzgOUy44vbaIZ4Nn+q4KbijlbSgGDapOmzt374m
         lJpA==
X-Gm-Message-State: AO0yUKW1vP+qJ+l++fdr9WLsk/LD3be5cTJOWvgMabSVIcESq/bpq/Fh
	pQiR+uDje/NytymLYyJt7iFX/Y6jefppm34K6htGog==
X-Google-Smtp-Source: AK7set86nD7AHLHjFHADNw68YHO3+pTEXmPYEX73qRUo91NxvyvumPLImtBCeS4GMfu57Ja5MOsxUjtYU3znLSUgghw=
X-Received: by 2002:a17:90a:2ec7:b0:22c:419a:f4cd with SMTP id
 h7-20020a17090a2ec700b0022c419af4cdmr750919pjs.74.1674861577303; Fri, 27 Jan
 2023 15:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20221221235147.45lkqmosndritfpe@google.com> <mhng-17d41c33-7f33-4a1c-8af2-ae7d07134e8c@palmer-ri-x1c9>
In-Reply-To: <mhng-17d41c33-7f33-4a1c-8af2-ae7d07134e8c@palmer-ri-x1c9>
From: Fangrui Song <maskray@google.com>
Date: Fri, 27 Jan 2023 18:19:25 -0500
Message-ID: <CAFP8O3J1Pn+_BMKXtxB+avtYyZ+bBKffHfNOXoJPMD5QHv5obQ@mail.gmail.com>
Subject: Re: [PATCH v2] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-csky@vger.kernel.org, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 29, 2022 at 11:22 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 21 Dec 2022 15:51:47 PST (-0800), maskray@google.com wrote:
> > The actual intention is that no dynamic relocation exists. However, some
> > GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
> > the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> > relocations. E.g. ld's powerpc port recently fixed
> > https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
> > generally no-op in the dynamic loaders. So just ignore them.
> >
> > With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
> > bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
> > not called "absolute relocations". (The patch is motivated by the arm64
> > port missing R_AARCH64_RELATIVE.)
> >
> > Signed-off-by: Fangrui Song <maskray@google.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> > Change from v1:
> > * rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso: use "grep -E" instead of "egrep")
> > * change the commit message to mention an example GNU ld bug; no longer say the patch fixes a deprecated egrep use
> > ---
> >   arch/arm/vdso/Makefile            |  3 ---
> >   arch/arm64/kernel/vdso/Makefile   |  3 ---
> >   arch/arm64/kernel/vdso32/Makefile |  3 ---
> >   arch/csky/kernel/vdso/Makefile    |  3 ---
> >   arch/loongarch/vdso/Makefile      |  3 ---
> >   arch/mips/vdso/Makefile           |  3 ---
> >   arch/powerpc/kernel/vdso/Makefile |  1 -
> >   arch/riscv/kernel/vdso/Makefile   |  3 ---
> >   arch/s390/kernel/vdso32/Makefile  |  2 --
> >   arch/s390/kernel/vdso64/Makefile  |  2 --
> >   arch/x86/entry/vdso/Makefile      |  4 ----
> >   lib/vdso/Makefile                 | 13 ++++---------
> >   12 files changed, 4 insertions(+), 39 deletions(-)
>
> [snip]
>
> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> > index 06e6b27f3bcc..d85c37e11b21 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -1,9 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   # Copied from arch/tile/kernel/vdso/Makefile
> >
> > -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
> > -# the inclusion of generic Makefile.
> > -ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
> >   include $(srctree)/lib/vdso/Makefile
> >   # Symbols present in the vdso
> >   vdso-syms  = rt_sigreturn
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
>
> Thanks!

Looks like this patch hasn't been picked yet...
