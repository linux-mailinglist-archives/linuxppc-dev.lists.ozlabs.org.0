Return-Path: <linuxppc-dev+bounces-13815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C06C37A9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 21:15:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1xQb0kn2z2yrT;
	Thu,  6 Nov 2025 07:15:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762373734;
	cv=none; b=a8TQqCdb0RIpBptNqo5Sf9hjHW4czDoPAULHeCFHo8HbK1qSnl4G8dBUZ9AUM6MQj1xANRxdSo/74/WsOQmovrZsT84mku3JE6r4PCTAyUiaa8lx3bspqUoOYGN281RrN5BRnGDrMVrFoXJ4t6MU9uwhpjnnU9LQKNS4tbj+ZqoK5pd4RkO0yDuc30/qP7HCxr3K564ISAc+9F8D9OtDgor2DWq3OqlZXEwQ4oL76ke1wXzzzHIChy2bztkEmSJpWT9utQSf8Ub1whL0+tgn/8SZ/i5wP8QgBtwUtDvT63b5+9B1qr66rczSwgZpg5IGQc64ceghBCGSnvUOVLJI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762373734; c=relaxed/relaxed;
	bh=YLcI7uh56ZVRt3C9U1s60gRSr20JslBP/aA229quIic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnD+F5ZZzRBKpLPKmUvYYf/UT5wJtlVTHTWtozU3DmZ4pp6/R1zwBoCVqa2BudVXpkXVnIuS3KH3zz3sVqhCYgDg1HrWmaSrg8LyGLmaJMat/l0GS2w0PuZZJZd1iSMvZZFxp+M0Aoo25swBKmi9oaZOn4RKs6Ckz6E54HqSG8rJkEUsXbN7m3V4k1awtxdkBjCbXD6Mok7iK8lc5O5tsFK0b1Wp9nhULqTTPJG/O4qZRhS6ndk6XwFMpSev3ii3nAOkVYKZXnjVTbab6tALUbrred1iSebYpYfd6vlaMcSpE/tynOrw8rp7LyA/bTfsZ/KfqmuWLcaJMa6sDwUu2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tVjlLypv; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tVjlLypv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1xQZ1GnQz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 07:15:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 056A0601F1;
	Wed,  5 Nov 2025 20:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A94C4CEF5;
	Wed,  5 Nov 2025 20:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762373731;
	bh=Lw++o2HELy2ZtWzBIbekYFJktkL5pR/Om2RKn74v1rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVjlLypvxp3tK6h3M4G7McwvdI6gA8sxm/UocCXG0mBUTsqUSzgrjT87E1jK3B7rE
	 ibU2ywmazXPh8J10A3IxweVZ8xaZofARrlwX0OlWkDzUJKqErx5FjL0EPddsf91/NQ
	 3oPru8Psy5xRWnEgEShymCYgSetPXqw72puMPnE6ccAIz+Fu5j6x1iwibexdQ9zoiS
	 fe18mkKCL625LUctrbKaESMKZ7GPUJftYZvZ2rxKR4a+sJN2uJfeLNcoyICvtUikQi
	 PLh4WhrsOD8YLyih3t766j/ZSJe7NBsghwm5c25JoUzABBadcnwyLdEVVQJ7W553rD
	 0eOxjwkaepv7Q==
Date: Wed, 5 Nov 2025 13:15:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org, llvm@lists.linux.dev,
	Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] kbuild: Add '-fms-extensions' to areas with dedicated
 CFLAGS
Message-ID: <20251105201522.GB3787308@ax162>
References: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
 <aQtUujos2ADVs-_O@gate>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQtUujos2ADVs-_O@gate>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025 at 07:44:26AM -0600, Segher Boessenkool wrote:
> On Sat, Nov 01, 2025 at 12:35:47PM -0400, Nathan Chancellor wrote:
> > There are many places within the kernel that use their own CFLAGS
> > instead of the main KBUILD_CFLAGS, meaning code written with the main
> > kernel's use of '-fms-extensions' in mind that may be tangentially
> > included in these areas will result in "error: declaration does not
> > declare anything" messages from the compiler.
> 
> Please fix such non-standard code then, instead?  The only (documented)
> thing -fms-extensions does for C code is give meaning to something that
> otherwise is a syntax error (and it is for a good reason!)

Right, the kernel would like to start taking advantage of one of those
extensions. See these other threads for more information.

https://lore.kernel.org/20251020142228.1819871-1-linux@rasmusvillemoes.dk/
https://lore.kernel.org/20251023082142.2104456-1-linux@rasmusvillemoes.dk/

Cheers,
Nathan

