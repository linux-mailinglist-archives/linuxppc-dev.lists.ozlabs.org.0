Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 975EA6C829B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 17:50:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pjp943d8Qz3fV0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 03:50:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bikEEwzo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bikEEwzo;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pjp8B0PLcz3cf8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 03:49:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7F3F62AEF;
	Fri, 24 Mar 2023 16:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FEDC433D2;
	Fri, 24 Mar 2023 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679676550;
	bh=Ko+doy6miNVccGF6PLZMT2NOgYDK5UYSp2j4A6+XB/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bikEEwzoIKbiEp++ZVDS2od9Vj6fM5doaZjPYGBWhRItvFbwZWn4eSSvcUDhXwz2C
	 +/MRKr1qCD+3SgCkFt27Y/szQX9521IROrEvmdyPxM1NH7q+6vTIIjPlZHXUFtL+nD
	 eBQ6glP0tjCcYZoC5P0I/kB5YLLHHGZTP0VGQ1eUWkz053KBLBkGgqn36LUxpzpEPd
	 ZqqPv69iDsAnebfmMUJjszrgWw2Uuxhbang2j2KzncjL8C6WVRbwu7zYScqlBAsHCU
	 CmAlaxtZKKboh0FbxAqNeNw306p+ZHZYlHjKeSYEYeiUZrkTS8iGzHhnQuFUY/lTov
	 0bNoykhMwACXQ==
Date: Fri, 24 Mar 2023 19:48:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 00/14] arch,mm: cleanup Kconfig entries for
 ARCH_FORCE_MAX_ORDER
Message-ID: <ZB3Uci7kjTOyOEiy@kernel.org>
References: <20230324052233.2654090-1-rppt@kernel.org>
 <F98008AC-F79C-4712-A262-4EC85BBC0B29@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F98008AC-F79C-4712-A262-4EC85BBC0B29@nvidia.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 24, 2023 at 10:30:07AM -0400, Zi Yan wrote:
> On 24 Mar 2023, at 1:22, Mike Rapoport wrote:
> 
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > Hi,
> >
> > Several architectures have ARCH_FORCE_MAX_ORDER in their Kconfig and
> > they all have wrong and misleading prompt and help text for this option.
> >
> > Besides, some define insane limits for possible values of
> > ARCH_FORCE_MAX_ORDER, some carefully define ranges only for a subset of
> > possible configurations, some make this option configurable by users for no
> > good reason.
> >
> > This set updates the prompt and help text everywhere and does its best to
> > update actual definitions of ranges where applicable.
> >
> > kbuild generated a bunch of false positives because it assigns -1 to
> > ARCH_FORCE_MAX_ORDER, hopefully this will be fixed soon.
> >
> > v2:
> > * arm64: show prompt for ARCH_FORCE_MAX_ORDER only if EXPERT (Catalin)
> > * Add Acked- and Reviewed-by tags (thanks Geert, Kirill and Max)
> >
> > v1: https://lore.kernel.org/all/20230323092156.2545741-1-rppt@kernel.org
> >
> > Mike Rapoport (IBM) (14):
> >   arm: reword ARCH_FORCE_MAX_ORDER prompt and help text
> >   arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
> >   arm64: reword ARCH_FORCE_MAX_ORDER prompt and help text
> >   csky: drop ARCH_FORCE_MAX_ORDER
> >   ia64: don't allow users to override ARCH_FORCE_MAX_ORDER
> >   m68k: reword ARCH_FORCE_MAX_ORDER prompt and help text
> >   nios2: reword ARCH_FORCE_MAX_ORDER prompt and help text
> >   nios2: drop ranges for definition of ARCH_FORCE_MAX_ORDER
> >   powerpc: reword ARCH_FORCE_MAX_ORDER prompt and help text
> >   powerpc: drop ranges for definition of ARCH_FORCE_MAX_ORDER
> >   sh: reword ARCH_FORCE_MAX_ORDER prompt and help text
> >   sh: drop ranges for definition of ARCH_FORCE_MAX_ORDER
> >   sparc: reword ARCH_FORCE_MAX_ORDER prompt and help text
> >   xtensa: reword ARCH_FORCE_MAX_ORDER prompt and help text
> >
> >  arch/arm/Kconfig      | 16 +++++++++-------
> >  arch/arm64/Kconfig    | 27 ++++++++++++---------------
> >  arch/csky/Kconfig     |  4 ----
> >  arch/ia64/Kconfig     |  3 +--
> >  arch/m68k/Kconfig.cpu | 16 +++++++++-------
> >  arch/nios2/Kconfig    | 17 +++++++++--------
> >  arch/powerpc/Kconfig  | 22 +++++++++-------------
> >  arch/sh/mm/Kconfig    | 19 +++++++++----------
> >  arch/sparc/Kconfig    | 16 +++++++++-------
> >  arch/xtensa/Kconfig   | 16 +++++++++-------
> >  10 files changed, 76 insertions(+), 80 deletions(-)
> >
> >
> > base-commit: 51551d71edbc998fd8c8afa7312db3d270f5998e
> 
> LGTM, thanks. Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

And thanks for spotting the mistakes in arm64 and sh patches.
 
> --
> Best Regards,
> Yan, Zi

-- 
Sincerely yours,
Mike.
