Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44952EC10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 14:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4R016QxYz3btH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 22:30:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n//aSrT8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n//aSrT8; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4QzQ2MTKz2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 22:30:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2FAC061E07;
 Fri, 20 May 2022 12:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351AEC385A9;
 Fri, 20 May 2022 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653049806;
 bh=AqlsiTiDuwleDs60bALNrrGbJz64ZW8+v9vBuAfjIdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n//aSrT8ReVB2j6Z6WCHL/0E27hvzGhZhsyLSdtYHrlW7pApWXEOxRsVVHnaPu4by
 7jZvcFfdaRPJj8AShcRrqy/G/9Te5hyyU7E031UruMFJyaqVbdSwmBokv3CR6j+NFV
 Xvb4JAUzvnOOXOLojKlgRveQavW5WHUqP2IibyHS3HXgnUQyS+FKQ6TrTslYASokRK
 UXuFIwAZ5/9Sz3inokKAhG1YblBR8djEbp9loldJhx+kXD+Y5rD9nCya7K44TDqIgT
 OAdD+mqc1Tu/4Mst2Bl6M7wV6q3Mi3l1Kpwcvu+SAKT0ERpwyYafOGKoDWhVoDmPp2
 3TdVlbbVTcZOA==
Received: by pali.im (Postfix)
 id E90F45F2; Fri, 20 May 2022 14:30:02 +0200 (CEST)
Date: Fri, 20 May 2022 14:30:02 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: linux-mm@kvack.org
Subject: Re: [PATCH 11/12] powerpc: wiiu: don't enforce flat memory
Message-ID: <20220520123002.rd46p5ty6wumi7cc@pali>
References: <20220302044406.63401-1-ash@heyquark.com>
 <20220302044406.63401-12-ash@heyquark.com>
 <20220513224353.n56qg5fhstbaqhfz@pali>
 <d84e4d24-f350-80fc-6c31-b7e7f8d429f4@heyquark.com>
 <20220520080454.c3cqodsdbfbkmg56@pali>
 <935b426a-6c64-beb0-907f-8c3f0a089ab7@heyquark.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <935b426a-6c64-beb0-907f-8c3f0a089ab7@heyquark.com>
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
 Ash Logan <ash@heyquark.com>, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+ linux-mm

Do you know what are requirements for kernel to support non-contiguous
memory support and what is needed to enable it for 32-bit powerpc?

Currently powerpc arch code does not support "memblock.memory.cnt > 1"
except for WII which seems like a hack... See below.

On Friday 20 May 2022 20:44:04 Ash Logan wrote:
> On 20/5/22 18:04, Pali Rohár wrote:
> > On Friday 20 May 2022 13:41:04 Ash Logan wrote:
> >> On 14/5/22 08:43, Pali Rohár wrote:
> >>> On Wednesday 02 March 2022 15:44:05 Ash Logan wrote:
> >>>> pgtable_32.c:mapin_ram loops over each valid memory range, which means
> >>>> non-contiguous memory just works.
> >>>
> >>> Hello! Does it mean that non-contiguous memory works for any 32-bit
> >>> powerpc platform, and not only for wiiu? If yes, should not be
> >>> non-contiguous memory support enabled for all 32-bit ppc boards then?
> >>
> >> Hi! Sorry for my delayed response. As best I can tell, it does indeed
> >> Just Work, but I have only been able to test on wiiu which is missing a
> >> lot of features other boards have (like PCI) - so it's possible there's
> >> still an assumption elsewhere in the kernel that I haven't hit.
> >>
> >> As best I can tell, the Wii and Wii U are the only 32-bit powerpc boards
> >> out there where it's even possible to have non-contiguous memory.
> > 
> > What is the reason that those two boards are the **only**? Is there some
> > specific requirement from bootloader or hardware to "enable"
> > non-contiguous memory support?
> 
> Not that I know of, I was just saying that I was only aware of those two
> boards where the memory map isn't contiguous, and that is the only place
> where it has been tested. Evidently you know of another board!
> 
> > I'm interested in enabling non-contiguous memory support for P2020-based
> > board as it has gaps in its 32-bit memory layout and which could be used
> > for RAM mapping when 4GB DDR3 module is plugged in (default is 2GB).
> 
> If it's like the Wii or Wii U (some memory at 0, a gap for MMIO or
> whatever, then more memory at a higher address) then you should try a
> patch along these lines, because barring the unknowns I mentioned before
> it should work. At least as far as I'm aware ;)
> 
> >>>> Signed-off-by: Ash Logan <ash@heyquark.com>
> >>>> ---
> >>>>  arch/powerpc/mm/init_32.c | 4 ++--
> >>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
> >>>> index 3d690be48e84..59a84629d9a0 100644
> >>>> --- a/arch/powerpc/mm/init_32.c
> >>>> +++ b/arch/powerpc/mm/init_32.c
> >>>> @@ -125,10 +125,10 @@ void __init MMU_init(void)
> >>>>  	 * lowmem_end_addr is initialized below.
> >>>>  	 */
> >>>>  	if (memblock.memory.cnt > 1) {
> >>>> -#ifndef CONFIG_WII
> >>>> +#if !defined(CONFIG_WII) && !defined(CONFIG_WIIU)
> >>>>  		memblock_enforce_memory_limit(memblock.memory.regions[0].size);
> >>>>  		pr_warn("Only using first contiguous memory region\n");
> >>>> -#else
> >>>> +#elif defined(CONFIG_WII)
> >>>>  		wii_memory_fixups();
> >>>>  #endif
> >>>>  	}
> >>>> -- 
> >>>> 2.35.1
> >>>>
