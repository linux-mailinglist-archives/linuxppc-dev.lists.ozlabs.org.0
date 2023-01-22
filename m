Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCE767714C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jan 2023 19:02:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0Lfg0ymcz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 05:02:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VY65pI9z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VY65pI9z;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0Ldl2xKkz3bXr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:01:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7E42FB80B45;
	Sun, 22 Jan 2023 18:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815A6C433EF;
	Sun, 22 Jan 2023 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674410486;
	bh=ZGiCjszJqpHiIFSAq3hgbJBEIhIKVjiFIcdUwUi83q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VY65pI9zOzf5Af1dwN1TzzmPaGvB30Z4TTP8WtMbLii3inEeuMp6dAjuzgzwlB2Li
	 9fMnwmdNr30j6nmSq7p2aMpqEj9QgzTSG9DB0ozm0W1AbwVRh74tZKfEMf44GZTLxy
	 haome2sNLyo9B/ReHtRrhmtrA7MkR3cbysu5xLHnPu2q8kFqzpt31hs80Tt1NcyEZl
	 dqXcaffRhDKKasuXhwiTiAHOOiMPBcj3R1rx9QNFzu6Vv2QEySehex+kOlTHac5VX4
	 Y/kXjKLBsfTNM25bDohNMupqpAeJ1zuI60nPLEYon0zv8q6G7J5Xlxh0/QUDqHhbGB
	 pUhxx38MOJE1Q==
Date: Sun, 22 Jan 2023 11:01:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
Message-ID: <Y81588GQh3fNY3fO@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
 <CA+icZUUgq-dnSTRbdynPA8bEWg6SsCE9GYBMF6iViVmo9DfaFA@mail.gmail.com>
 <Y8BPp905fJciHNa2@dev-arch.thelio-3990X>
 <CAK7LNATRetne7hK4xNeEpn7a1=Eaxr42X6nRWohJzWGYiyiPww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATRetne7hK4xNeEpn7a1=Eaxr42X6nRWohJzWGYiyiPww@mail.gmail.com>
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com, Sedat Dilek <sedat.dilek@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 02:27:51AM +0900, Masahiro Yamada wrote:
> On Fri, Jan 13, 2023 at 3:21 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Sedat,
> >
> > On Thu, Jan 12, 2023 at 07:02:30PM +0100, Sedat Dilek wrote:
> > > On Thu, Jan 12, 2023 at 4:06 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > > >
> > > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> > > > are several warnings in the PowerPC vDSO:
> > > >
> > > >   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > > >   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > > >   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
> > > >
> > > >   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
> > > >   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
> > > >
> > > > The first group of warnings point out that linker flags were being added
> > > > to all invocations of $(CC), even though they will only be used during
> > > > the final vDSO link. Move those flags to ldflags-y.
> > > >
> > > > The second group of warnings are compiler or assembler flags that will
> > > > be unused during linking. Filter them out from KBUILD_CFLAGS so that
> > > > they are not used during linking.
> > > >
> > > > Additionally, '-z noexecstack' was added directly to the ld_and_check
> > > > rule in commit 1d53c0192b15 ("powerpc/vdso: link with -z noexecstack")
> > > > but now that there is a common ldflags variable, it can be moved there.
> > > >
> > > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > ---
> > > > Cc: mpe@ellerman.id.au
> > > > Cc: npiggin@gmail.com
> > > > Cc: christophe.leroy@csgroup.eu
> > > > Cc: linuxppc-dev@lists.ozlabs.org
> > > > ---
> > > >  arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
> > > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> > > > index 45c0cc5d34b6..4337b3aa9171 100644
> > > > --- a/arch/powerpc/kernel/vdso/Makefile
> > > > +++ b/arch/powerpc/kernel/vdso/Makefile
> > > > @@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
> > > >  UBSAN_SANITIZE := n
> > > >  KASAN_SANITIZE := n
> > > >
> > > > -ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> > > > -ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > > > -
> > > > -CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> > > > +ccflags-y := -fno-common -fno-builtin
> > > > +ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack
> > > > +ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> > > > +# Filter flags that clang will warn are unused for linking
> > > > +ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> > > > +
> > > > +CC32FLAGS := -m32
> > > > +LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
> > > >  AS32FLAGS := -D__VDSO32__
> > > >
> > > > -CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> > >
> > > Set CC64FLAGS := -m64 ?
> >
> > I do not think it is necessary. ldflags-y is filtered from
> > KBUILD_CFLAGS, which should already include '-m64' (search for
> > 'HAS_BIARCH' in arch/powerpc/Makefile). We would have seen a problem
> > with this already if a 32-bit target (powerpc-linux-gnu-) CROSS_COMPILE
> > value since $(c_flags) uses the main kernel's CROSS_COMPILE value.
> >
> > > > +LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
> > > >  AS64FLAGS := -D__VDSO64__
> > > >
> > > >  targets += vdso32.lds
> > > > @@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
> > > >
> > > >  # actual build commands
> > > >  quiet_cmd_vdso32ld_and_check = VDSO32L $@
> > > > -      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > > > +      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
> > > >  quiet_cmd_vdso32as = VDSO32A $@
> > > >        cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
> > > >  quiet_cmd_vdso32cc = VDSO32C $@
> > > >        cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
> > > >
> > > >  quiet_cmd_vdso64ld_and_check = VDSO64L $@
> > > > -      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> > > > +      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
> > >
> > > If no CC64FLAGS := xxx is set, this can go?
> >
> > Good catch! CC64FLAGS can be removed. Masahiro, I am happy to send a v3
> > when I am back online next week but if you are able to fix it up during
> > application, please feel free to do so (once the PowerPC folks give
> > their Acks of course).
> 
> I removed CC64FLAGS locally.

Thank you!

> Just two comments.
> 
> - Is 7f3d349065d0c643f7f7013fbf9bc9f2c90b675f
>   applicable to powerpc too?
> 
>   Maybe, as a follow-up cleanup, use $(LD)
>   and remove -Wl, prefixes.

Yes, that should be possible to do here as well. Nick attempted it some
time ago but there was some complications with older tools, so we
decided to use ld.lld via the compiler in commit 4406b12214f6
("powerpc/vdso: Link with ld.lld when requested").

> - ldflags-y still pulls $(KBUILD_CFLAGS).
>   Potentially, a new flag addition to KBUILD_CFLAGS
>   may trigger a new -Wunused-command-line-argument warning.

Right, this is certainly possible. Hopefully it will not happen
frequently enough to be problematic.

>   I hope somebody takes a closer look at which flags
>   are really needed for the linker.

This is definitely not a bad idea.

Cheers,
Nathan
