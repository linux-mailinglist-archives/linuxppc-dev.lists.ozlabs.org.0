Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D6A52E6EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 10:05:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4K6G0pc9z3btG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 18:05:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PLGFqZcc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PLGFqZcc; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4K5W1GbMz3bm7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 18:05:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12792B82A59;
 Fri, 20 May 2022 08:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E373C385A9;
 Fri, 20 May 2022 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653033897;
 bh=2+UsR8SY09lQomSf/1VOLFJ4QEsxG2ZXRneVf/dRIRQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PLGFqZccKSIjEgIWJN2VKqwQzgxTVsmT1Os/COyLLsf72r3km7q6scL8RKqTvMzGH
 fGGyAXIDxmixCis7kbCQUDTIFR+kkCMEKpDbG44/e4AT9f73rI8rmDq7IZV/NiGMYo
 fj2GQzGF5i1bTCoYocEVOl3Wu1H4tz94tet7vKNJd8ogrKJWWzKFu3b62ZZaZqMebv
 3mWP3KnJvOYxTn02uLcE6bF8pPkk9iTHX4Kbr1IRhEfO6zSuL2V4+3PEzB9wns8iV9
 D7I2+rPaUBv+4OIfsw3KtPCyb/q5GcgyQQzGLobuGO4KxLZJm2PW+mqJug7Ax53DtE
 KLNrk+p+H7yFw==
Received: by pali.im (Postfix)
 id 3491053E; Fri, 20 May 2022 10:04:54 +0200 (CEST)
Date: Fri, 20 May 2022 10:04:54 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Ash Logan <ash@heyquark.com>
Subject: Re: [PATCH 11/12] powerpc: wiiu: don't enforce flat memory
Message-ID: <20220520080454.c3cqodsdbfbkmg56@pali>
References: <20220302044406.63401-1-ash@heyquark.com>
 <20220302044406.63401-12-ash@heyquark.com>
 <20220513224353.n56qg5fhstbaqhfz@pali>
 <d84e4d24-f350-80fc-6c31-b7e7f8d429f4@heyquark.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d84e4d24-f350-80fc-6c31-b7e7f8d429f4@heyquark.com>
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
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 20 May 2022 13:41:04 Ash Logan wrote:
> On 14/5/22 08:43, Pali Rohár wrote:
> > On Wednesday 02 March 2022 15:44:05 Ash Logan wrote:
> >> pgtable_32.c:mapin_ram loops over each valid memory range, which means
> >> non-contiguous memory just works.
> > 
> > Hello! Does it mean that non-contiguous memory works for any 32-bit
> > powerpc platform, and not only for wiiu? If yes, should not be
> > non-contiguous memory support enabled for all 32-bit ppc boards then?
> 
> Hi! Sorry for my delayed response. As best I can tell, it does indeed
> Just Work, but I have only been able to test on wiiu which is missing a
> lot of features other boards have (like PCI) - so it's possible there's
> still an assumption elsewhere in the kernel that I haven't hit.
> 
> As best I can tell, the Wii and Wii U are the only 32-bit powerpc boards
> out there where it's even possible to have non-contiguous memory.

What is the reason that those two boards are the **only**? Is there some
specific requirement from bootloader or hardware to "enable"
non-contiguous memory support?

I'm interested in enabling non-contiguous memory support for P2020-based
board as it has gaps in its 32-bit memory layout and which could be used
for RAM mapping when 4GB DDR3 module is plugged in (default is 2GB).

> >> Signed-off-by: Ash Logan <ash@heyquark.com>
> >> ---
> >>  arch/powerpc/mm/init_32.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
> >> index 3d690be48e84..59a84629d9a0 100644
> >> --- a/arch/powerpc/mm/init_32.c
> >> +++ b/arch/powerpc/mm/init_32.c
> >> @@ -125,10 +125,10 @@ void __init MMU_init(void)
> >>  	 * lowmem_end_addr is initialized below.
> >>  	 */
> >>  	if (memblock.memory.cnt > 1) {
> >> -#ifndef CONFIG_WII
> >> +#if !defined(CONFIG_WII) && !defined(CONFIG_WIIU)
> >>  		memblock_enforce_memory_limit(memblock.memory.regions[0].size);
> >>  		pr_warn("Only using first contiguous memory region\n");
> >> -#else
> >> +#elif defined(CONFIG_WII)
> >>  		wii_memory_fixups();
> >>  #endif
> >>  	}
> >> -- 
> >> 2.35.1
> >>
