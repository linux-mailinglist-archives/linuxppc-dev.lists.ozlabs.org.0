Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98717663476
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 23:55:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrTn43VhWz3cFj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:55:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrTmT6G1sz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 09:55:05 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 309MleMo026818;
	Mon, 9 Jan 2023 16:47:40 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 309MlbXg026817;
	Mon, 9 Jan 2023 16:47:37 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 9 Jan 2023 16:47:37 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
Message-ID: <20230109224737.GN25951@gate.crashing.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org> <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com> <20230109222337.GM25951@gate.crashing.org> <Y7yXQdAG3OpxNDS0@dev-arch.thelio-3990X>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7yXQdAG3OpxNDS0@dev-arch.thelio-3990X>
User-Agent: Mutt/1.4.2.3i
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 09, 2023 at 03:37:53PM -0700, Nathan Chancellor wrote:
> On Mon, Jan 09, 2023 at 04:23:37PM -0600, Segher Boessenkool wrote:
> > Hi!  Happy new year all.
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
> > 
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> 
> Thank you for the review and extra explanation! I had kind of expanded
> on this in the s390 version of this patch [1], I will go ahead and do
> the same thing for the powerpc version too.
> 
> [1]: https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v1-9-658cbc8fc592@kernel.org/

The underwhelming GCC source code for this is
https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/gcc.cc;h=d629ca5e424ad3120be13e82b9f38b7bf8f1cdf2;hb=HEAD#l1148
which says that the -s flag is passed through unmodified to the linker
when invoking the linker.  See #l603 for the %{s} specs syntax.

This is not a flag to the assembler at all.  It is a flag to the
compiler, which passes it on to the linker :-)

> > (ASFLAGS sounds like it is for assembler commands, but it really is
> > for compiler commands that just happen to get .S input files).


Segher
