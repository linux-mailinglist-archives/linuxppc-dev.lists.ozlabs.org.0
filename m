Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 028236FC050
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 09:19:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFqKS5mXfz3fMS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 17:19:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e4NzMKx3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e4NzMKx3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFqJd1PR7z3ccn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 17:18:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18059617F3;
	Tue,  9 May 2023 07:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ED0C433D2;
	Tue,  9 May 2023 07:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683616718;
	bh=8QQ/TWzUc3gS4jlPeHQgsKdVbG+aX+ZMQAWZ/cm0O6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4NzMKx3tLVybcg+6uQj0VRxQXy+OLypPq+PxwnJpQGfMz/i6PIZOpYVrjZGNbVaF
	 xzwTof73+FXb0A86M5fSPYwb+2dDP1igHEVjBoxopn05V8Z/b81pi+jwKdkkW3iNAJ
	 rc1EojlxIc1q/6coWp/NucH9h8toDQ/3tkFBvT6HNr8+dcAINE49k6mbytvTPZ5LR1
	 CSgw9qCWYRCUobtcW8oIhfgM4elaAyDfVcPQySnaBU+QoY82UTF7YEN1mIjthoo8Xu
	 yx+XXP2f7CCx/oDzMWyIUtPEZ8bi3YF8+yABVI7I3coz3wbAzYhtZDHSzRqW8YU7ed
	 rtkcwiXzKlKkg==
Received: by pali.im (Postfix)
	id 435EB95D; Tue,  9 May 2023 09:18:35 +0200 (CEST)
Date: Tue, 9 May 2023 09:18:35 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH AUTOSEL 6.3 6/7] powerpc/fsl_uli1575: Allow to disable
 FSL_ULI1575 support
Message-ID: <20230509071835.rrfefrhwtwsxlngy@pali>
References: <20230509035455.59524-1-sashal@kernel.org>
 <20230509035455.59524-6-sashal@kernel.org>
 <62539831-1f8c-d908-bd7c-2a926702fa7f@infradead.org>
 <87jzxix9g7.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzxix9g7.fsf@mail.lhotse>
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
Cc: Sasha Levin <sashal@kernel.org>, arnd@arndb.de, linus.walleij@linaro.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 09 May 2023 17:14:48 Michael Ellerman wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> > Hi--
> >
> > Just a heads up. This patch can cause build errors.
> > I sent a patch for these on 2023-APR-28:
> >   https://lore.kernel.org/linuxppc-dev/20230429043519.19807-1-rdunlap@infradead.org/
> >
> > Michael, I think this is your area if I'm not mistaken.
> 
> Yes. The fix is in my fixes branch as:
>   536d948a8dee ("powerpc/fsl_uli1575: fix kconfig warnings and build errors")
> 
> But I don't think this commit (22fdf79171e8) really warrants going to
> stable, it's a nice-to-have but doesn't fix any pressing bugs.

Exactly. And also this patch alone without 1/8 would not work as in 1/8
https://lore.kernel.org/all/20230409000812.18904-2-pali@kernel.org/ was
added static inline variant of function which is used when ULI is
disabled.

> cheers
> 
> > On 5/8/23 20:54, Sasha Levin wrote:
> >> From: Pali Rohár <pali@kernel.org>
> >> 
> >> [ Upstream commit 22fdf79171e8509db54599fd2c05ef0022ee83f5 ]
> >> 
> >> ULI1575 PCIe south bridge exists only on some Freescale boards. Allow to
> >> disable CONFIG_FSL_ULI1575 symbol when it is not explicitly selected and
> >> only implied. This is achieved by marking symbol as visible by providing
> >> short description. Also adds dependency for this symbol to prevent enabling
> >> it on platforms on which driver does not compile.
> >> 
> >> Signed-off-by: Pali Rohár <pali@kernel.org>
> >> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> >> Link: https://msgid.link/20230409000812.18904-7-pali@kernel.org
> >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> >> ---
> >>  arch/powerpc/platforms/Kconfig | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
> >> index d41dad227de84..608ac0290e3aa 100644
> >> --- a/arch/powerpc/platforms/Kconfig
> >> +++ b/arch/powerpc/platforms/Kconfig
> >> @@ -261,7 +261,9 @@ config CPM2
> >>  	  on it (826x, 827x, 8560).
> >>  
> >>  config FSL_ULI1575
> >> -	bool
> >> +	bool "ULI1575 PCIe south bridge support"
> >> +	depends on FSL_SOC_BOOKE || PPC_86xx
> >> +	select FSL_PCI
> >>  	select GENERIC_ISA_DMA
> >>  	help
> >>  	  Supports for the ULI1575 PCIe south bridge that exists on some
> >
> > -- 
> > ~Randy
