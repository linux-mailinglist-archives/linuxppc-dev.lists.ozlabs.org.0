Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12373663412
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 23:39:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrTQg6pBNz3ch4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:39:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RbDLLONb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RbDLLONb;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrTPC2VFbz3cDs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 09:38:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id EC977CE1281;
	Mon,  9 Jan 2023 22:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEC0C433EF;
	Mon,  9 Jan 2023 22:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673303898;
	bh=dclPwp96wKjDlc1FajSl86T4kQa8AF1q5XWy8XdCCeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbDLLONbytCU+y1moF2ZQadPzH9WooGc+7xaOOqG9IQuI+VlzMeMJcTOblDlf0+Oj
	 Lp6z9ZJe37Th4vg8XaigbM4gfEB+ahuP7lbxFV9obuFwPjsiVGtClWJt6pYvZf6FD2
	 7/0U7UHLWVLqkzZ/elVxU4opDa0IcepkJRjyxscfJ624qBm0a9JOcQgAlwdzhFN1ki
	 NQAM+Uyq/pgAh88HFwWFqwMcxDCOHzN7H4yu7zDDUT4wf/G6pCqXsbkTfhD7yT9HNt
	 iEhrWtfUxJ6CHDlSuM3eOpdUlelWg+uCGOBbw4nrvRRD5MyJYRDUe76EYBfhZLGt+1
	 ntKVucTgmgHAw==
Date: Mon, 9 Jan 2023 15:38:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
Message-ID: <Y7yXV3WOtWXF4PgT@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
 <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com>
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

On Mon, Jan 09, 2023 at 02:12:55PM -0800, Nick Desaulniers wrote:
> On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > warns:
> >
> >   clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
> >
> > This flag is supported for 64-bit powerpc but not 32-bit, hence the warning.
> > Just remove the flag from vgettimeofday-32.o's CFLAGS when using clang, as has
> > been done for other flags previously.
> >
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Hmm...so this was added by the top level Makefile doing a cc-option
> test.  How did the test pass if this was unsupported? That worries me
> that perhaps other cc-option tests are passing erroneously for certain
> ppc -m32/-m64 configs?

Sure, that is a reasonable concern. I should have expanded upon this a
little bit more in the commit message. Is this any better?

  When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
  warns:

    clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]

  This warning happens because vgettimeofday-32.c gets its base CFLAGS
  from the main kernel, which may contain flags that are only supported
  on a 64-bit target but not a 32-bit one, which is the case here.
  -fstack-clash-protection and its negation are only suppported by the
  64-bit powerpc target but that flag is included in an invocation for a
  32-bit powerpc target, so clang points out that while the flag is one
  that it recognizes, it is not actually used by this compiler job.

  To eliminate the warning, remove -fno-stack-clash-protection from
  vgettimeofday-32.c's CFLAGS when using clang, as has been done for
  other flags previously.

Cheers,
Nathan

> > ---
> > Cc: mpe@ellerman.id.au
> > Cc: npiggin@gmail.com
> > Cc: christophe.leroy@csgroup.eu
> > Cc: linuxppc-dev@lists.ozlabs.org
> > ---
> >  arch/powerpc/kernel/vdso/Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> > index 769b62832b38..4ee7d36ce752 100644
> > --- a/arch/powerpc/kernel/vdso/Makefile
> > +++ b/arch/powerpc/kernel/vdso/Makefile
> > @@ -16,6 +16,11 @@ ifneq ($(c-gettimeofday-y),)
> >    CFLAGS_vgettimeofday-32.o += -ffreestanding -fasynchronous-unwind-tables
> >    CFLAGS_REMOVE_vgettimeofday-32.o = $(CC_FLAGS_FTRACE)
> >    CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
> > +  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
> > +  # an unused command line flag warning for this file.
> > +  ifdef CONFIG_CC_IS_CLANG
> > +  CFLAGS_REMOVE_vgettimeofday-32.o += -fno-stack-clash-protection
> > +  endif
> >    CFLAGS_vgettimeofday-64.o += -include $(c-gettimeofday-y)
> >    CFLAGS_vgettimeofday-64.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
> >    CFLAGS_vgettimeofday-64.o += $(call cc-option, -fno-stack-protector)
> >
> > --
> > 2.39.0
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
