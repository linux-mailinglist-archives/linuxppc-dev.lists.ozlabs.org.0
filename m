Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA85207AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 00:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxwqv214Jz3bpj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 08:31:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ROriFizn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ROriFizn; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxwqF35QHz3bfC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 08:30:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 609A0B819B5;
 Mon,  9 May 2022 22:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66627C385BF;
 Mon,  9 May 2022 22:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652135429;
 bh=S4LlAC3mq9UwT3aVcFvei7z5RLy77IDpLFogiagAZRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ROriFizndG1JVwB+g+LmD2wDW1hsya3caWFBI13xqdTrT3ih4e+Pheu1ylGCQljWB
 kWpq5G81W90UiKXa7ZtzHVUpaflS/3ZT84aIhU+nXvkP5CaxBhmwwBjSxcKhIVccNv
 /teCmFMAMI0KiqMFbl/MuzTCcrN3p0acwW7tEGO4+rIfUlXQLmsqpDD61s+5fRgfXc
 wuaBp3h9k7IziSmI0pPPwiTJKvhxWBvA3sgK+kqkftmC84HPhYTk0ZW/twpvx41Bnf
 YjZ2EZKU61IFSj8fcxX7weoo011wPP101pT/ycO/N2TDQs+Hdj9A5/snfoLGt5ei+M
 Sb072K/QY3dyA==
Date: Mon, 9 May 2022 15:30:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] powerpc/vdso: Link with ld.lld when requested
Message-ID: <YnmWAsVPyMsBoWQU@dev-arch.thelio-3990X>
References: <20220509204635.2539549-1-nathan@kernel.org>
 <20220509204635.2539549-3-nathan@kernel.org>
 <CAKwvOdkvF8AJudCcu=CVmU42eyVMJwUjQFnX+rpVF45bTR86Mg@mail.gmail.com>
 <YnmL6a8eObtstNjZ@dev-arch.thelio-3990X>
 <CAKwvOdnbTGpNvXsum-cM8i5sWuATLHouaURE1vkjuOj5rzTuqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnbTGpNvXsum-cM8i5sWuATLHouaURE1vkjuOj5rzTuqw@mail.gmail.com>
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

On Mon, May 09, 2022 at 02:58:09PM -0700, Nick Desaulniers wrote:
> On Mon, May 9, 2022 at 2:47 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Mon, May 09, 2022 at 02:24:40PM -0700, Nick Desaulniers wrote:
> > > On Mon, May 9, 2022 at 1:47 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > >
> > > > The PowerPC vDSO is linked with $(CC) instead of $(LD), which means the
> > > > default linker of the compiler is used instead of the linker requested
> > > > by the builder.
> > > >
> > > >   $ make ARCH=powerpc LLVM=1 mrproper defconfig arch/powerpc/kernel/vdso/
> > > >   ...
> > > >
> > > >   $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
> > > >
> > > >   File: arch/powerpc/kernel/vdso/vdso32.so.dbg
> > > >   String dump of section '.comment':
> > > >   [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> > > >
> > > >   File: arch/powerpc/kernel/vdso/vdso64.so.dbg
> > > >   String dump of section '.comment':
> > > >   [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> > > >
> > > > The compiler option '-fuse-ld' tells the compiler which linker to use
> > > > when it is invoked as both the compiler and linker. Use '-fuse-ld=lld'
> > > > when LD=ld.lld has been specified (CONFIG_LD_IS_LLD) so that the vDSO is
> > > > linked with the same linker as the rest of the kernel.
> > > >
> > > >   $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
> > > >
> > > >   File: arch/powerpc/kernel/vdso/vdso32.so.dbg
> > > >   String dump of section '.comment':
> > > >   [     0] Linker: LLD 14.0.0
> > > >   [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> > > >
> > > >   File: arch/powerpc/kernel/vdso/vdso64.so.dbg
> > > >   String dump of section '.comment':
> > > >   [     0] Linker: LLD 14.0.0
> > > >   [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> > > >
> > > > LD can be a full path to ld.lld, which will not be handled properly by
> > > > '-fuse-ld=lld' if the full path to ld.lld is outside of the compiler's
> > > > search path. '-fuse-ld' can take a path to the linker but it is
> > > > deprecated in clang 12.0.0; '--ld-path' is preferred for this scenario.
> > > >
> > > > Use '--ld-path' if it is supported, as it will handle a full path or
> > > > just 'ld.lld' properly. See the LLVM commit below for the full details
> > > > of '--ld-path'.
> > >
> > > Perhaps worth adding some additional background from the cover letter
> > > to the commit message that will actually go into the kernel,
> > > particularly:
> > > 1. Kbuild mostly invokes the compiler and linker distinctly; the ppc
> > > vdso code uses the compiler as the linker driver though.
> > > 2. When doing so, depending on how the compiler was configured, the
> > > implicit default linker the compiler invokes might not match $LD.
> >
> > Sure, I think I can clear up these two points with something like:
> >
> > "The PowerPC vDSO uses $(CC) to link, which differs from the rest of the
> > kernel, which uses $(LD) directly. As a result, the default linker of
> > the compiler is used, which may differ from the linker requested by the
> > builder. For example:
> >
> > <example above>
> >
> > LLVM=1 sets LD=ld.lld but ld.lld is not used to link the vDSO; GNU ld is
> > because "ld" is the default linker for clang on most Linux platforms."
> >
> > Thoughts?
> 
> SGTM
> 
> >
> > > 3. This is a problem for LTO since clang may try to invoke ld.gold,
> > > which is not supported as of
> > > commit 75959d44f9dc ("kbuild: Fail if gold linker is detected")
> >
> > Technically, it seemed like ld.bfd was being invoked but the LLVMgold
> > plugin did not exist. Regardless, moving to ld.lld will resolve that,
> > since the LLVMgold plugin won't be needed.
> 
> Oh indeed, invoking clang with `-flto -###` shows it does invoke the
> system's linker with `-plugin path/to/LLVMgold.so`, not `ld.gold`
> itself.  I don't think we should use or depend on the LLVMgold.so
> plugin either (I suspect it will invoke ld.gold, but as you noticed, I
> don't bother to build LLVMgold.so).  So, perhaps reworded (feel free
> to reword further):
> 
> 3. This is a problem for LTO since clang may try to invoke ld.bfd with
> the LLVMgold.so plugin.
> https://llvm.org/docs/GoldPlugin.html states that "usage of the LLVM
> gold plugin with ld.bfd is not tested and therefore not officially
> supported or recommended." Users should instead use ld.lld to drive
> linking for LTO with clang.

I'll stick this blurb above "The compiler option":

"This is a problem for Clang's Link Time Optimization as implemented in
the kernel because use of GNU ld with LTO requires the LLVMgold plugin,
which is not technically supported for ld.bfd per
https://llvm.org/docs/GoldPlugin.html. Furthermore, if LLVMgold.so is
missing from a user's system, the build will fail, even though LTO as it
is implemented in the kernel requires ld.lld to avoid this dependency in
the first place."

Yell if there is something I should change!

> > > 4. Using the linker as the driver can cause ld.bfd 2.26 to crash.
> > > https://lore.kernel.org/all/b2066ccd-2b81-6032-08e3-41105b400f75@csgroup.eu/
> > > (Though, I wonder if that's because I was trying to add
> > > --orphan-handling=warn, which we're not yet doing for the ppc vdso
> > > AFAICT).
> >
> > I can add this if necessary but it seemed like there might have been
> > other problems reported? I could just add a blanket "linker driver had
> > issues, we'll try again later" or something of that effect?
> 
> Sure.

Sounds good, I'll make these changes and send v2 on Wednesday to give
other folks a chance to chime in.

Cheers,
Nathan
