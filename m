Return-Path: <linuxppc-dev+bounces-2917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8E9BEF3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 14:40:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk5tS3mg6z30CD;
	Thu,  7 Nov 2024 00:40:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730900416;
	cv=none; b=L1f6MazV22jV/k4AoNr04vYRWBw0znuCwNH1l4aHn9psrKUqCSCbf4fECCzOdAn4tvxsEn8BBp7prz+irY1CRE5S3BM6r7WhFtADicy6jo5ID/SiMJTlGPxQmk5zQCIrd+HTrTFLrwYTXP/dJ7VEet3DjMdq7zskBKJB2gQ1NAieih4R0oCUDlOgLt5+V9rXUwgI4TyP4UphOehU402ZGbZMknERYgR9D1xRDBelZiwlN6i11wHrfPEaNoeBDFlyI06nYFIqABiD0j260IXaK1WgO/qWjaJUVqXL5l3NhEEtepcEl4FfOfCluxWOdoc53eq2QuCPGAsWEQSmMqzbKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730900416; c=relaxed/relaxed;
	bh=s3JjyiDANRtUDiiAHTzxURPxsEIC0ZstHL6fBpbkgpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLNsTjdcXJoSKhFZy2vwjKFiUiOPYwVfGEsABIcj+p6YP5B3sXwMZP5qwC+yGFn+Rvr4lZIyaV8XCA+0yOPdn2gRtuDdgDl42aXoJX5MVIEcWTDQXmjhO/8/D3Tp2O7Xeg/PH7qhBN0CiaXc3j1/dDwZgrpuHqIZNbMuc2HJdOhr2h+huSE6pU5ZAXrMLSj9e2+mjRImAPxIe3vGnNsZJWN45NaqfJYFuviz5PLG83IW1w1lNvw4K6baH/e1dEOMm9mqPHeYBrqcMOICFrU50K+T3X+DXjTVHue5/5lO3i0rqxuPsAS6A6AB+YTPpPLHsPrISYBwz1Tq9vVXQ2kljw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk5tQ49BNz2yV6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 00:40:14 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4A6DbrZA029304;
	Wed, 6 Nov 2024 07:37:53 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4A6Dbqdj029302;
	Wed, 6 Nov 2024 07:37:52 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 6 Nov 2024 07:37:52 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
        llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] powerpc/vdso: Drop -mstack-protector-guard flags in 32-bit files with clang
Message-ID: <20241106133752.GG29862@gate.crashing.org>
References: <20241030-powerpc-vdso-drop-stackp-flags-clang-v1-1-d95e7376d29c@kernel.org> <884cf694-09c7-4082-a6b1-6de987025bf8@csgroup.eu>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <884cf694-09c7-4082-a6b1-6de987025bf8@csgroup.eu>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Wed, Nov 06, 2024 at 09:55:58AM +0100, Christophe Leroy wrote:
> Le 30/10/2024 à 19:41, Nathan Chancellor a écrit :
> >Under certain conditions, the 64-bit '-mstack-protector-guard' flags may
> >end up in the 32-bit vDSO flags, resulting in build failures due to the
> >structure of clang's argument parsing of the stack protector options,
> >which validates the arguments of the stack protector guard flags
> >unconditionally in the frontend, choking on the 64-bit values when
> >targeting 32-bit:
> >
> >   clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', 
> >   expected one of: r2
> >   clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', 
> >   expected one of: r2
> >   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:85: 
> >   arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
> >   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:87: 
> >   arch/powerpc/kernel/vdso/vgetrandom-32.o] Error 1
> >
> >Remove these flags by adding them to the CC32FLAGSREMOVE variable, which
> >already handles situations similar to this. Additionally, reformat and
> >align a comment better for the expanding CONFIG_CC_IS_CLANG block.
> 
> Is the problem really exclusively for 32-bit VDSO on 64-bit kernel ?
> In any case, it is just wrong to have anything related to stack 
> protection in VDSO, for this reason we have the following in Makefile:
> 
> ccflags-y += $(call cc-option, -fno-stack-protector)
> 
> If it is not enough, should we have more complete ?

The -mstack-protector-guard-reg= doesn't do anything if you aren't
doing stack protection.  It allows any base register (so, r1..r31).
Setting it to any valid reg should be fine and not do anything harmful,
unless perhaps you *do* enable stack protector, then it better be the
expected stuff ;-)

Apparently clang does not implement it correctly?  This is just a clang
bug, please report it with them?

(r2 is the default for -m32, r13 is the default for -m64, it appears
that clang does not implement this option at all, it simply checks if
you set the default, and explodes if not).


Segher

