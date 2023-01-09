Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82836634E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 00:15:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrVDD2rbmz3cdf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 10:15:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Hg3hO8JL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Hg3hO8JL;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrVCG33Hlz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 10:14:49 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id cp9-20020a17090afb8900b00226a934e0e5so148708pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 15:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0+WOyLnDWh5S7xcrPmBfttF3Z19ifhLYlKcXHEX4tIs=;
        b=Hg3hO8JL3A/4d7/eG7rMHOUq18URfw4TuAMqoteHfbY2En4Z8wMIUbn6Wls9eAMRie
         QnLXQI25t2A60rJTTrdmJNF33LIvG8uyFd4+CHsEraCMSflZi6avawbI1nB5FYLpds7W
         x1D911LtQfYNKd6wFxU7QQ3br1mlnfaVBMZVnlMFMHOAv9KSNhFdVRrJ6WCNnZv0xfdp
         TzD7vDuBd04CjyuxJY6xN2H1+R5tZKPgoHlWi2U7uN/HZKIVASC+lC1yqyiqpWxQVmZX
         Gblyo450A3Wu0Q4yWi4Xtf835QOZOvb9WzuS1kskSfQCTaba/69HNDFgKHNb63JeXx88
         59Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+WOyLnDWh5S7xcrPmBfttF3Z19ifhLYlKcXHEX4tIs=;
        b=eY3JujAEh3xKebsjj1elx/5LB1ctejXeqEInxfvTtkJvP409g1u13joE+S5NCQKwJn
         AIUk+RBpcZRk+YSrOfYJeSXCpv3EQ8vM/43AGFJsmdKuFiMdyN0JT6UdW/oWiNjroKgg
         BUvFG3Sl+OeoSHVFU7cyVZ2FOZp7fXfebQxOdIPIV2EkXWKJPalMXO+FvZ9xxg6EqQJj
         Yq8qso0f7I9TOk2pIqRCD9a4ByfhNmw4Flv8V+IwBaeAKyQRjmFGs7CBwktU83Omsx+g
         tI38XcdPXdE/iNQLXd081GESX1ICJABMa/tZtFhjTCW2yzJbXd1+/mhIRxD6m+H3nJd9
         5QoA==
X-Gm-Message-State: AFqh2kouD/wBh+Okt+7rmTzOzR60cKA9duxegPczi3PjpNRphFTyevmk
	vVan/8QRYZd0jZbNr3oV1sQo4nugQA88C1w3YORQYQ==
X-Google-Smtp-Source: AMrXdXsB3ryalN8D7oA3yt3g9w8IcGiWFckF3wJZX8uc1YDF62989GrGh+WqKFfUXH6OhRUTzaYeOT+I2KPSfz2kMDM=
X-Received: by 2002:a17:90a:488a:b0:226:b5f4:d420 with SMTP id
 b10-20020a17090a488a00b00226b5f4d420mr2205324pjh.102.1673306085681; Mon, 09
 Jan 2023 15:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <20230109222337.GM25951@gate.crashing.org>
In-Reply-To: <20230109222337.GM25951@gate.crashing.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 15:14:33 -0800
Message-ID: <CAKwvOdn3En6kdGBmDF4nFYpMgR0Dx0cgaTH1pPZdEcAJTZWaPg@mail.gmail.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
To: Segher Boessenkool <segher@kernel.crashing.org>, Nathan Chancellor <nathan@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 9, 2023 at 2:29 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> Hi!  Happy new year all.

HNY Segher! :)

>
> On Mon, Jan 09, 2023 at 01:58:32PM -0800, Nick Desaulniers wrote:
> > On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > warns that ASFLAGS contains '-s', which is a linking phase option, so it
> > > is unused.
> > >
> > >   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> > >
> > > Looking at the GAS sources, '-s' is only useful when targeting Solaris
> > > and it is ignored for the powerpc target so just drop the flag
> > > altogether, as it is not needed.
> >
> > Do you have any more info where you found this?  I don't see -s
> > documented as an assembler flag.
> > https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
> > https://sourceware.org/binutils/docs/as/Invoking.html
>
> It is required by POSIX (for the c99 command, anyway).  It *also* is
> required to be supported when producing object files (so when no linking
> is done).
>
> It is a GCC flag, and documented just fine:
> https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-s
>
> (Yes, that says it is for linking; but the option is allowed without
> error of any kind always).
>
> (ASFLAGS sounds like it is for assembler commands, but it really is
> for compiler commands that just happen to get .S input files).
>
> > The patch seems fine to me, but what was this ever supposed to be?
> > FWICT it predates git history (looking at
> > arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)
>
> Yeah, good question.  This compiler flag does the moral equivalent of
> strip -s (aka --strip-all).  Maybe this was needed at some point, or
> the symbol or debug info was just annoying (during bringup or similar)?

Ah right! Ok then, I think we might keep the patch's diff, but update
the commit message to mention this is a linker flag that's unused
since the compiler is being invoked but not the linker (the compiler
is being used as the driver to assemble a single assembler source
without linking it; linking is then driven by the linker in a separate
make rule).

Then we might want to revisit that s390 patch, too?
https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v1-9-658cbc8fc592@kernel.org/

>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
>
>
> Segher



-- 
Thanks,
~Nick Desaulniers
