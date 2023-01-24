Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2A679E5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 17:15:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1XBs2gb1z3cGD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 03:15:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eKnI31K/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eKnI31K/;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1X9v3Wwcz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 03:14:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BB535B8128A;
	Tue, 24 Jan 2023 16:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCA3C433D2;
	Tue, 24 Jan 2023 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674576894;
	bh=5DfgSAXJHi/R6zrfkO3Bu4T0XYdp//PH3WS6X+RZU4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKnI31K/lyFANr15L4/i6SrFwsUap21OIm6uGBh5pAcR7WQ+VJjVC2Mbf07y0wCFs
	 jfCSjrZ3Bx6hvVfMu7VlArcmofveuikGYffxUA2PGPX/FlXjIpVaKLI+pzZGwW2Ydz
	 s75oJHVTUwW3I6gjP5j8zoOANyptHi0oQI7Am0IrsaqXQUM3RxaW+8RnJbpz3HeKFX
	 U899TvOzGWQFUA/27FDOCITZ3Jmx1dxrEv40ZjLfiIdTpzb0cnIQ5sODVjv90Lpeez
	 paBLfqxM8V9YFB7KBDA0qLLZ4J7aSbHDpleauVFElF8E5Q6JNXKHNUnjEgun3utGkD
	 3TOzop7uGGDHg==
Date: Tue, 24 Jan 2023 09:14:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
Message-ID: <Y9AD/Mejnv6jp7Np@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
 <20230123150716.GJ25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123150716.GJ25951@gate.crashing.org>
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 09:07:16AM -0600, Segher Boessenkool wrote:
> Hi!
> 
> On Wed, Jan 11, 2023 at 08:05:04PM -0700, Nathan Chancellor wrote:
> > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> > are several warnings in the PowerPC vDSO:
> > 
> >   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> >   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> >   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
> > 
> >   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
> >   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
> 
> There is nothing wrong with the warnings, but as usual, -Werror is very
> counterproductive.
> 
> > The first group of warnings point out that linker flags were being added
> > to all invocations of $(CC), even though they will only be used during
> > the final vDSO link. Move those flags to ldflags-y.
> 
> Which is explicitly allowed, and won't do anything, so nothing harmful
> either.  It is not a bad idea to avoid this if that is trivial to do,
> of course.

I think this patch shows that it is trivial to do this, the primary core
of the diff is only a few lines.

> > The second group of warnings are compiler or assembler flags that will
> > be unused during linking. Filter them out from KBUILD_CFLAGS so that
> > they are not used during linking.
> 
> And here it is even more obviously fine.  If you need obfuscation like
> in your patch, it is better not to do this imo.

I do not think this patch really obfuscates anything? The filtering is
pretty clear to me.

If this is a real objection to the patch, I suppose we could just
localize '-Qunused-arguments' to this Makefile and be done with it but I
do not think this change is a bad solution to the problem either.

Cheers,
Nathan
