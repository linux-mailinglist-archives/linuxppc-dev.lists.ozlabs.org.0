Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EF693F33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 08:55:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFc8T2D80z3cB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 18:55:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P/NLBLn1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P/NLBLn1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFc7W2PsCz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 18:54:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 16B7EB80E01;
	Mon, 13 Feb 2023 07:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3884FC433EF;
	Mon, 13 Feb 2023 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676274881;
	bh=6metnuiv9QkmKFu+JTHLVBvZLre3nFtuNi3AR7PlA78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/NLBLn1QBccO0iLmwEVdjTRTOu/1JTVdr0CvbgYz4ThLcAoENpkQwi1mRk7/P19V
	 Brn+rbVYSD8LBBQWtetps+o6x9tV427CYirqerxd+gmGggehAz5OXTZeiD3MkT7U29
	 s/as2HenQlPGtPPTTf3fp/G4jLA+MmtrrPcey6hAK36CzGgOAg/0LtwnODYIfT0DI9
	 MUeph4dw/P2V8jMyhN9SftHlhcEV/JNhGKIKb6cMv7netYSdbt356AlVVkhPoiPUvd
	 r4aExWVaj3CL3McIngU/VdH3ENcuJwfiC6rBQVcgRCzZo3MtbE8U1j5N/4s5pn2pxp
	 sfCWQJUUPJk8Q==
Date: Mon, 13 Feb 2023 09:54:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 4/4] mm, arch: add generic implementation of
 pfn_valid() for FLATMEM
Message-ID: <Y+nsqV6u/PqNlwDS@kernel.org>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-5-rppt@kernel.org>
 <20230212161320.GA3784076@roeck-us.net>
 <Y+mRz6Wfocopv9jw@kernel.org>
 <15a2c023-fdfa-9543-ac36-a846e5f8a000@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15a2c023-fdfa-9543-ac36-a846e5f8a000@roeck-us.net>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Mic
 hal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew, 

On Sun, Feb 12, 2023 at 10:37:15PM -0800, Guenter Roeck wrote:
> On 2/12/23 17:26, Mike Rapoport wrote:
> > On Sun, Feb 12, 2023 at 08:13:20AM -0800, Guenter Roeck wrote:
> > > On Sun, Jan 29, 2023 at 02:42:35PM +0200, Mike Rapoport wrote:
> > > > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > > 
> > > > Every architecture that supports FLATMEM memory model defines its own
> > > > version of pfn_valid() that essentially compares a pfn to max_mapnr.
> > > > 
> > > > Use mips/powerpc version implemented as static inline as a generic
> > > > implementation of pfn_valid() and drop its per-architecture definitions.
> > > > 
> > > 
> > > With this patch in the tree, sh4 and sh4eb qemu emulations no longer boot.
> > > Reverting this patch fixes the problem.
> > 
> > This should be a better fix than a revert:
> > 
> > diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> > index 506784702430..bf1b54055316 100644
> > --- a/arch/sh/mm/init.c
> > +++ b/arch/sh/mm/init.c
> > @@ -301,6 +301,7 @@ void __init paging_init(void)
> >   	 */
> >   	max_low_pfn = max_pfn = memblock_end_of_DRAM() >> PAGE_SHIFT;
> >   	min_low_pfn = __MEMORY_START >> PAGE_SHIFT;
> > +	set_max_mapnr(max_low_pfn - min_low_pfn);
> >   	nodes_clear(node_online_map);
> 
> Confirmed, this fixes the problem for me.
 
What is your preference for this and m68k fix? Fixups on top of mm-stable
or v3 of the entire series? 

> Thanks,
> Guenter

-- 
Sincerely yours,
Mike.
