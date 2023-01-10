Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2CB663672
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 01:52:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrXMn1HmFz3cFj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 11:52:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YuCJCYa5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YuCJCYa5;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrXLq10Svz3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 11:51:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78BD5B80883;
	Tue, 10 Jan 2023 00:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB15C433EF;
	Tue, 10 Jan 2023 00:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673311886;
	bh=ABP81GQOCO3EpwsNw8BqP4nH2rcps88TFH5KDXoFM1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YuCJCYa5yX2WnkEt64Xi0gObab9ggVLsqfFJnZZ6V4WwBcgtSMvQC17JkHVfe5s+q
	 +aHeDJd+cZXuFOyu0jaAId/vM7KTF51xl4+LSJsQh7kuJ6+A8mXYjYW9LEyMpOBtKG
	 uqxRaiYm9Q1GWjtGpY4GLVLr+Wvrw6fgYOLxVDfpi+zB13H24su765Rvkod9CDO1Fe
	 84DsaabUxvrOnBmQttx8Vx2iVKNBc3Eig/slXsX2up3GFDhVpJjpsXH6DVr/+SuxFr
	 YreC1QqTojbJevhDwZ9i9V953X4XVpEko0TI0HbIqWHOaaMYVx2P6J43fv9Aapfbcb
	 8slNVAeXhDWKQ==
Date: Mon, 9 Jan 2023 17:51:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <Y7y2izKLUYr7giKj@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
 <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
 <20230109222337.GM25951@gate.crashing.org>
 <CAKwvOdn3En6kdGBmDF4nFYpMgR0Dx0cgaTH1pPZdEcAJTZWaPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdn3En6kdGBmDF4nFYpMgR0Dx0cgaTH1pPZdEcAJTZWaPg@mail.gmail.com>
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

On Mon, Jan 09, 2023 at 03:14:33PM -0800, Nick Desaulniers wrote:
> On Mon, Jan 9, 2023 at 2:29 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > Hi!  Happy new year all.
> 
> HNY Segher! :)
> 
> >
> > On Mon, Jan 09, 2023 at 01:58:32PM -0800, Nick Desaulniers wrote:
> > > On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > > >
> > > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > > warns that ASFLAGS contains '-s', which is a linking phase option, so it
> > > > is unused.
> > > >
> > > >   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
> > > >
> > > > Looking at the GAS sources, '-s' is only useful when targeting Solaris
> > > > and it is ignored for the powerpc target so just drop the flag
> > > > altogether, as it is not needed.
> > >
> > > Do you have any more info where you found this?  I don't see -s
> > > documented as an assembler flag.
> > > https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
> > > https://sourceware.org/binutils/docs/as/Invoking.html
> >
> > It is required by POSIX (for the c99 command, anyway).  It *also* is
> > required to be supported when producing object files (so when no linking
> > is done).
> >
> > It is a GCC flag, and documented just fine:
> > https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-s
> >
> > (Yes, that says it is for linking; but the option is allowed without
> > error of any kind always).
> >
> > (ASFLAGS sounds like it is for assembler commands, but it really is
> > for compiler commands that just happen to get .S input files).
> >
> > > The patch seems fine to me, but what was this ever supposed to be?
> > > FWICT it predates git history (looking at
> > > arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)
> >
> > Yeah, good question.  This compiler flag does the moral equivalent of
> > strip -s (aka --strip-all).  Maybe this was needed at some point, or
> > the symbol or debug info was just annoying (during bringup or similar)?
> 
> Ah right! Ok then, I think we might keep the patch's diff, but update
> the commit message to mention this is a linker flag that's unused
> since the compiler is being invoked but not the linker (the compiler
> is being used as the driver to assemble a single assembler source
> without linking it; linking is then driven by the linker in a separate
> make rule).

Yes, sorry, I thought that was clear with the "which is a linking phase
option" comment in the commit message but clearly not :)

> Then we might want to revisit that s390 patch, too?
> https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v1-9-658cbc8fc592@kernel.org/

So for this patch, I have

  When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
  warns:

    clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]

  The compiler's '-s' flag is a linking option (it is passed along to the
  linker directly), which means it does nothing when the linker is not
  invoked by the compiler. The kernel builds all .o files with either '-c'
  or '-S', which do not run the linker, so '-s' can be safely dropped from
  ASFLAGS.

as a new commit message. Is that sufficient for everyone? If so, I'll
adjust the s390 commit to match, as it is the same exact problem.

Alternatively, if '-s' should actually remain around, we could move it
to ldflags-y, which is added in patch 7. However, I assume that nobody
has noticed that it has not been doing its job for a while, so it should
be safe to remove.

Cheers,
Nathan
