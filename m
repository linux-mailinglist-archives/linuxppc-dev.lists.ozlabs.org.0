Return-Path: <linuxppc-dev+bounces-2920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F09BF176
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 16:21:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk8763WgNz301n;
	Thu,  7 Nov 2024 02:21:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730906482;
	cv=none; b=Pl1RkLxtuxlXLY6q3OAc/W6UQBkbLBtSxCH0YTWmuMeiC7AEZzxuI806+ZpBjiGncwQ+w3jRXIW5uxKmBFlnEftjWmw/NxzZGCxpb6Cy2qO9tHbRfm7AJah27JaaqYBu4erUpJcKU/KtSorIg0mDDUHPVk9GYIVQAciHnLjNh3bA+3AzDR4z89IEPsIqIYeIs+abm8jjVYlyHKl3hYCPz522nAsjA59O5fjjH5nlxBxrpxxruflwNraqW4/joKlAzbyc92BVqxOHOOw/puAqerNMnui1h6cXmd+vU7IDLBjDZ9CsR/R4HvS1t/fYTiJ84O8I50Ey5OSZ3JAfu7wNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730906482; c=relaxed/relaxed;
	bh=T1HG8pL8NT1ZfYM2OqiWpX2HTm+cSy1Z5jP3mS/kFwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+X+nTWpoi++1sOiNlgGvUpTNNduQVNWct643SVbGr/eZUJ+mZXWu39SlMLdKXHwgkdiUnTa8smGP16xbrglqih9ApJ/qbI22ByTnS/39rVhVYqV17dvI0sWkDFbMJ8bd5mRV/7SgEqGbZe42lU9JZMR0AxEXGOJ5anhx3CNRo7meG+HTGPddtJf2pUK8S3W2LFf5VMvg1cG1E6VybWQOqaYpywXjEgdKGk9yf/SsgVCe0o13cKMH4fjpCSr3NrfEOG3i2Xo4OrxqX3fxIzS2Wmgmm9uX7ykhMYjoXvJUoZ6fdkKEQ/jIIrmZFLhyIx4nMxckRSIgBJWdmhH1KYACA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tBSgmgGh; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tBSgmgGh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk8731LKKz2xjJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 02:21:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09E2CA43ED2;
	Wed,  6 Nov 2024 15:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33989C4CEC6;
	Wed,  6 Nov 2024 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730906476;
	bh=iJSFfu/7mDUN+APdZbNmZkyP0R97PoistfqOwZ9X8hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBSgmgGhYQarahcJvidaF3o/1pYi+Kgfn0Zv/soCRYug5MYHEenUi6bVchu0qLzTc
	 uX7EJ7SWXY34Olg4+mT9C1PjBOpHwPOWZOS0CHxtKQCsK9dpbXJ5LpeYNYwUEYiTHT
	 9m2gHC5kXmbpjZn2VVp9MED+lzhDCjVV3DACDfwVjb98N+s/uhXcIAFqTZiJFgcQga
	 huRhD1YemOxB1PMmKtjCU+9AOak0gnl8sc7+2ZDZ6CjVbMKZtewBB/Xqulhorp3D6T
	 f5P4hAZQQyICro5VeJnLtWFRT9uesccfxFEZuS4+FNs++th3E7DNlQ9BSX4xFSF7em
	 Rc3MiqibMaT7A==
Date: Wed, 6 Nov 2024 08:21:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] powerpc/vdso: Drop -mstack-protector-guard flags in
 32-bit files with clang
Message-ID: <20241106152114.GA2738371@thelio-3990X>
References: <20241030-powerpc-vdso-drop-stackp-flags-clang-v1-1-d95e7376d29c@kernel.org>
 <884cf694-09c7-4082-a6b1-6de987025bf8@csgroup.eu>
 <20241106133752.GG29862@gate.crashing.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106133752.GG29862@gate.crashing.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Christophe and Segher,

On Wed, Nov 06, 2024 at 07:37:52AM -0600, Segher Boessenkool wrote:
> On Wed, Nov 06, 2024 at 09:55:58AM +0100, Christophe Leroy wrote:
> > Le 30/10/2024 à 19:41, Nathan Chancellor a écrit :
> > >Under certain conditions, the 64-bit '-mstack-protector-guard' flags may
> > >end up in the 32-bit vDSO flags, resulting in build failures due to the
> > >structure of clang's argument parsing of the stack protector options,
> > >which validates the arguments of the stack protector guard flags
> > >unconditionally in the frontend, choking on the 64-bit values when
> > >targeting 32-bit:
> > >
> > >   clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', 
> > >   expected one of: r2
> > >   clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', 
> > >   expected one of: r2
> > >   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:85: 
> > >   arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
> > >   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:87: 
> > >   arch/powerpc/kernel/vdso/vgetrandom-32.o] Error 1
> > >
> > >Remove these flags by adding them to the CC32FLAGSREMOVE variable, which
> > >already handles situations similar to this. Additionally, reformat and
> > >align a comment better for the expanding CONFIG_CC_IS_CLANG block.
> > 
> > Is the problem really exclusively for 32-bit VDSO on 64-bit kernel ?

As far as I can tell, yes, as I do not think there are any other places
where flags for targeting one word size were being used when targeting
the other word size.

> > In any case, it is just wrong to have anything related to stack 
> > protection in VDSO, for this reason we have the following in Makefile:
> > 
> > ccflags-y += $(call cc-option, -fno-stack-protector)
> > 
> > If it is not enough, should we have more complete ?

That should be enough to disable the stack protector from my
understanding. It is just that clang's argument validation happens even
with -fno-stack-protector, so the flags need to contain valid values for
the target. This is true for GCC as well, it just supports any base
register like Segher mentions below so it does not hit any issue here:

  $ powerpc64-linux-gcc -fno-stack-protector -mstack-protector-guard=tls -mstack-protector-guard-reg=r50 -c -o /dev/null -x c /dev/null
  cc1: error: 'r50' is not a valid base register in '-mstack-protector-guard-reg='
  cc1: error: '-mstack-protector-guard=tls' needs a valid base register

> The -mstack-protector-guard-reg= doesn't do anything if you aren't
> doing stack protection.  It allows any base register (so, r1..r31).
> Setting it to any valid reg should be fine and not do anything harmful,
> unless perhaps you *do* enable stack protector, then it better be the
> expected stuff ;-)
> 
> Apparently clang does not implement it correctly?  This is just a clang
> bug, please report it with them?
> 
> (r2 is the default for -m32, r13 is the default for -m64, it appears
> that clang does not implement this option at all, it simply checks if
> you set the default, and explodes if not).

Not sure that I would say it has not been implemented correctly, more
that it has not been implemented in the same manner as GCC. Keith chose
not to open up support for arbitrary registers to keep the
implementation of this option in LLVM simple:

https://lore.kernel.org/linuxppc-dev/87o73uvaq5.fsf@keithp.com/

Cheers,
Nathan

