Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B296C6542
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 11:38:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj1yX3QSzz2yNX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 21:38:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sPKSP02i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sPKSP02i;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj1xf5Ptyz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 21:37:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98F7D62100;
	Thu, 23 Mar 2023 10:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F9CC4339B;
	Thu, 23 Mar 2023 10:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679567844;
	bh=7HVmHyHcaSnCmEQ9wvlGS5D2gJIf2hovuJXSyaCaqdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPKSP02iJA6KAFPv7bGM4/Se81vulHnHqt8qfWTUhZFZfE1s7yfVR1WI2haHPg+A3
	 jWzVvRFZzkglSwote3myrlA5TUDE+Mjiy60hA/JC5FTriwEUlR/LYSMkz7fsTaldFc
	 oMQlw0WTXs+ktUIZkgxUF4A7BhNREJZy9IC+pPvHI8Vsp+m2dbErDE2naZmB571znT
	 Fxiq15cRjtHrw73FO6Y3VXmv90htiJ2rNj1RicLa12inWDP9wSpUycX7R7yd2Kgx+7
	 vrbS8fMpVelSjMFK/gnOL3tvAHj3UliwBTODwab575ZgUsXBaJnqCJoJygIlhUcZOE
	 OSTuDUXtdmoRA==
Date: Thu, 23 Mar 2023 12:37:05 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 02/14] arm64: drop ranges in definition of
 ARCH_FORCE_MAX_ORDER
Message-ID: <ZBwr0bXdtOtKKila@kernel.org>
References: <20230323092156.2545741-1-rppt@kernel.org>
 <20230323092156.2545741-3-rppt@kernel.org>
 <ZBwmxbRJrF8RxZEp@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBwmxbRJrF8RxZEp@arm.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 23, 2023 at 10:15:33AM +0000, Catalin Marinas wrote:
> On Thu, Mar 23, 2023 at 11:21:44AM +0200, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > It is not a good idea to change fundamental parameters of core memory
> > management. Having predefined ranges suggests that the values within
> > those ranges are sensible, but one has to *really* understand
> > implications of changing MAX_ORDER before actually amending it and
> > ranges don't help here.
> > 
> > Drop ranges in definition of ARCH_FORCE_MAX_ORDER
> > 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >  arch/arm64/Kconfig | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index e60baf7859d1..bab6483e4317 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1489,9 +1489,7 @@ config XEN
> >  config ARCH_FORCE_MAX_ORDER
> >  	int "Maximum zone order" if ARM64_4K_PAGES || ARM64_16K_PAGES
> >  	default "13" if ARM64_64K_PAGES
> > -	range 11 13 if ARM64_16K_PAGES
> >  	default "11" if ARM64_16K_PAGES
> > -	range 10 15 if ARM64_4K_PAGES
> >  	default "10"
> 
> I don't mind rewriting the help text as in the subsequent patch but I'd
> keep the ranges as a safety measure. It's less wasted time explaining to
> people why some random max order doesn't work. Alternatively, we can
> drop the ranges but make this option configurable only if EXPERT.

I like the EXPERT alternative more. I'll add it in v2.
 
> -- 
> Catalin

-- 
Sincerely yours,
Mike.
