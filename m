Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 781526633BF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 23:16:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrSvR2gCtz3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:16:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9fLWX/O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f9fLWX/O;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrStV56J9z30DC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 09:15:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B728B61462;
	Mon,  9 Jan 2023 22:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D780C433EF;
	Mon,  9 Jan 2023 22:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673302510;
	bh=rMxiXT24cJy5vKA+lJutQflz87Lb9x3a2qshOdeXs3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9fLWX/OrdnGyjHkdHQf24yXZhNNlbkPPm9P3VJKcQbCAutav9WpHni7Ym1Ea+7hS
	 U6z6rm+rRDjHfgXAHQosi/HgS9qSL9BXYih1rRWT5IgC06fogYoXloEvmwQ8KLLNaW
	 oTpVmmkUoOO1t0g4g6cG/JBrP+eRvX+hEBwZltiDeJ+EFEgIhEkmLnYZKpZY8pcXcm
	 aP3qjkX2S4u9TMzK4qy0bTdt9ZEKaBS9UYrI6TSRjiuySrwIrPOF+W9KN1gw6iwRco
	 WFWUBr9ZWroS9+gn9jsqBBCuKXZ0nZje7w2OJIqjSupErlltoCWwXF2mtxZYt5A6Pq
	 bsAvWpLg2bidQ==
Date: Mon, 9 Jan 2023 15:15:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <Y7yR65TeqQXU/4nS@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
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

On Mon, Jan 09, 2023 at 01:58:32PM -0800, Nick Desaulniers wrote:
> On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > warns that ASFLAGS contains '-s', which is a linking phase option, so it
> > is unused.
> >
> >   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> >
> > Looking at the GAS sources, '-s' is only useful when targeting Solaris
> > and it is ignored for the powerpc target so just drop the flag
> > altogether, as it is not needed.
> 
> Do you have any more info where you found this?  I don't see -s
> documented as an assembler flag.
> https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
> https://sourceware.org/binutils/docs/as/Invoking.html

Sure thing, sorry I did not include it initially. See the section from
line 1284 to 1291 or search for "case 's':":

https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-ppc.c;h=9450fa74de1b61542c9a18babf8c8f621ef904fb;hb=HEAD

> The patch seems fine to me, but what was this ever supposed to be?
> FWICT it predates git history (looking at
> arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)

Right, I could not figure it out either, it has been there since the
vDSO was introduced back in 2005 (I was three days away from 10!) and
there is no comment about it so *shrug*:

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=054eb7153aeb84cc92da84210cf93b0e2a34811b

If someone else's archeological skills are better and can provide more
information, I am happy to include that.

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks as always for the review! I'll include this and a note about
where in binutils I found that information for v2.

> >
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Cc: mpe@ellerman.id.au
> > Cc: npiggin@gmail.com
> > Cc: christophe.leroy@csgroup.eu
> > Cc: linuxppc-dev@lists.ozlabs.org
> > ---
> >  arch/powerpc/kernel/vdso/Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> > index 6a977b0d8ffc..45c0cc5d34b6 100644
> > --- a/arch/powerpc/kernel/vdso/Makefile
> > +++ b/arch/powerpc/kernel/vdso/Makefile
> > @@ -51,10 +51,10 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> >  ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> >
> >  CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> > -AS32FLAGS := -D__VDSO32__ -s
> > +AS32FLAGS := -D__VDSO32__
> >
> >  CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> > -AS64FLAGS := -D__VDSO64__ -s
> > +AS64FLAGS := -D__VDSO64__
> >
> >  targets += vdso32.lds
> >  CPPFLAGS_vdso32.lds += -P -C -Upowerpc
> >
> > --
> > 2.39.0
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
