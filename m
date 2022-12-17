Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38D64F69F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 02:01:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYnjJ3BHlz3bW2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 12:01:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KoWXmEU1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KoWXmEU1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYngl2v5Nz3bZS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 12:00:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F132F622E1;
	Sat, 17 Dec 2022 01:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E4AC433EF;
	Sat, 17 Dec 2022 01:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671238800;
	bh=WrZ4Vcwfb8m+T/xdynWjQxbDC5cNDCpPd1ov+C22G5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KoWXmEU17NQZeo1x10mA1we/WKt8xxbmsz2YQFWjbkGyJiuC48Uo6c7cZtyyD1N4Y
	 VEaESuT71uZxZLrTA8Sx7+2g1SK/nGmCpsGNj+o5erfhIvcdZs43YID3XVZk2Vrrwt
	 CKSTeghfH/ZDiNpNkj9hvhG5KA5IizCdsu/8L2qcmk/MsKMP+qzTJYlq6+uLnjwyrl
	 1Ls9EDJQqo22Jp/JJYdIYBIdYXwgvhMxdWQfeShjFXyCi0qAH0HCcWp3Qk+SXEnfBc
	 D0YUlqHpcARs1EFkv3pNUnqlqRk7SZeVo93WDZ7PYRV00ORjP2vKrVimr/D0plgXvz
	 5qooF5hEs70bg==
Received: by pali.im (Postfix)
	id 73253B01; Sat, 17 Dec 2022 01:59:57 +0100 (CET)
Date: Sat, 17 Dec 2022 01:59:57 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc: Pass correct CPU reference to assembler
Message-ID: <20221217005957.o22gtjcwvw2njnvi@pali>
References: <01fe73614988e2402a7526fb6b6e903bc3777bb5.1671179743.git.christophe.leroy@csgroup.eu>
 <20221216171821.GA25951@gate.crashing.org>
 <73fc1107-b540-bec3-7625-c6e6d0641bbb@csgroup.eu>
 <20221216181048.GC25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221216181048.GC25951@gate.crashing.org>
User-Agent: NeoMutt/20180716
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 16 December 2022 12:10:48 Segher Boessenkool wrote:
> On Fri, Dec 16, 2022 at 05:57:46PM +0000, Christophe Leroy wrote:
> > Le 16/12/2022 à 18:18, Segher Boessenkool a écrit :
> > > On Fri, Dec 16, 2022 at 09:35:50AM +0100, Christophe Leroy wrote:
> > >> Today we have CONFIG_TARGET_CPU which provides the identification of the
> > >> expected CPU, it is used for GCC. Use it as well for the assembler.
> > > 
> > > Why do you use -Wa, at all for this?  The compiler should already pass
> > > proper options always!
> > 
> > That's historical I guess. Comes from commit 14cf11af6cf6 ("powerpc: 
> > Merge enough to start building in arch/powerpc.")
> 
> Ah.  The patch moves stuff around, I thought more of it is new than it
> really is.  Sorry.
> 
> It would be good to get rid of all such things that do no good and can
> easily cause problems, of course, but that does not belong to this patch
> of course.

Just a coincident but u-boot has similar problem...
https://patchwork.ozlabs.org/project/uboot/patch/20221211141204.8153-1-pali@kernel.org/

So I agree that removal of -Wa,-mXXX is a good idea. I checked that gcc
pass correct -Wa,-mXXX flag from -mcpu=YYY flag.

> > >> +cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= $(call as-option,-Wa$(comma)-many)
> > > 
> > > What is this for?  Using -many is a huge step back, it hides many
> > > problems :-(
> > 
> > The only thing I did is removed the -Wa,-mpower4 from the line, leaving 
> > the remaining part. Initialy it was:
> > 
> > cpu-as-$(CONFIG_PPC_BOOK3S_64) += $(call as-option,-Wa$(comma)-mpower4) 
> > $(call as-option,-Wa$(comma)-many)
> > 
> > It was added in 2018 by commit 960e30029863 ("powerpc/Makefile: Fix 
> > PPC_BOOK3S_64 ASFLAGS"). There is a long explanation it the commit.
> > 
> > Should we remove it ?
> 
> The commit says it is a workaround for clang problems, so it needs
> testing there.  It also needs testing everywhere else, because as I said
> it hides a lot of problems, so removing it will make a lot of sloppy
> code that has crept in since 2018 scream bloody murder :-(
> 
> 
> Segher
