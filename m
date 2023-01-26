Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0B67C2A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 03:08:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2PJ4208yz3fBb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 13:08:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y/afT4Mb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y/afT4Mb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2PH62qTrz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 13:07:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C805616FD;
	Thu, 26 Jan 2023 02:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA24C433D2;
	Thu, 26 Jan 2023 02:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674698846;
	bh=iDE4VETN4jaTIfHsOYmXJe6CouDOc+jNMaZZeQ0kuik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/afT4MbpJ33okTS4d577X4WXr8yyUKZG7CbK6x96mmxW29k4Bct/SByOmGvV3Z7R
	 eLbmTPS2neoJVeM4uGy1Gp0IQeDDtrb68xbMS1K3MclF/eVrCDwhNa+6ty/+Pjt0Wx
	 2VOrfEbXLnudEqDrEC00/KvShOMgG8D0f+loDVdKudn/7cdp/u7Ek8ZzBaQ26znNBH
	 WbQFYGDEBzHj/exLdMBJ3zTYF8qPPrE8xo992Pg+LwrkfM6PCjvxdO86Pl/Fv8rW0e
	 26eIOlRYXdoT123MTXtS1dqaNVVY+xkmyCvkr8KegJcxSEwXn73l1ZN5XrbQ2zVczS
	 bkRPHz7lZGN9g==
Date: Wed, 25 Jan 2023 19:07:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
Message-ID: <Y9HgXE9kmcfmva1C@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
 <871qnjqmmq.fsf@mpe.ellerman.id.au>
 <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com, trix@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 10:29:54AM +0900, Masahiro Yamada wrote:
> On Wed, Jan 25, 2023 at 1:11 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Nathan Chancellor <nathan@kernel.org> writes:
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > points out that KBUILD_AFLAGS contains a linker flag, which will be
> > > used:
> >
> > Should that say "unused" ?
> 
> 
> 
> Nathan, shall I fix it up locally?
> (it will change the commit hash, though.)

Yes please, if you would not mind. Sorry about that and thank you for
spotting it Michael!

Since you have to rebase to fix it, you can include Michael's acks?

Cheers,
Nathan

> > >   clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> > >
> > > This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
> > > unnecessary, as all supported versions of clang and gcc will pass '-a64'
> > > or '-a32' to GNU as based on the value of '-m'; the behavior of the
> > > latest stable release of the oldest supported major version of each
> > > compiler is shown below and each compiler's latest release exhibits the
> > > same behavior (GCC 12.2.0 and Clang 15.0.6).
> > >
> > >   $ powerpc64-linux-gcc --version | head -1
> > >   powerpc64-linux-gcc (GCC) 5.5.0
> > >
> > >   $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
> > >   .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s
> > >
> > >   $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
> > >   .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg
> > >
> > >   $ clang --version | head -1
> > >   Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5
> > >
> > >   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
> > >     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
> > >    "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"
> > >
> > >   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
> > >     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
> > >    "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"
> > >
> > > Remove this flag altogether to avoid future issues.
> > >
> > > Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > > Cc: mpe@ellerman.id.au
> >
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> >
> > cheers
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
