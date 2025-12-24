Return-Path: <linuxppc-dev+bounces-15004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA8ACDC23D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:35:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbqZ955Nqz2yNv;
	Wed, 24 Dec 2025 22:35:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766576145;
	cv=none; b=R/IkHmj1Tng05uHcmy2oTHlr8CS+/y4QsP6P1QnS91Ks2v5BCtYb0Kl+PFGK5jRrMdET99LZRBcfB2WRXzD1tmieIsJV84UESI88O/sON7QXd8LMvI0aJdUKZJwqNLE4fc6CK25QHmaNb97emr7zDAr9r7duzO4ITox8AyIDJdgmb11fJaTkTP4cMK+ocVLgnUWBTN5vDpO20xPiwuynh6BCacFGpRX+qczb1J0JJHxQME5uV8w9eEKo6l4X/qRymsGQ0I6ME8xeghqxWVtjO5vd/KXdA/6EjgP/P52L796+NeNevN/gDmaLvXSSBJt115HRJAZukLTbVZ4HuwrHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766576145; c=relaxed/relaxed;
	bh=aPfIf24VliWQq0f8Kj4Kw8bFV8BRu0VC6Nhx23FKLvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDUdiL+6KJkDi11J7w0UPtJ7+jyYKgPsFF8MelhjK+J9e46zohOCERu2YVkDz61uRejf0+2/C/zRw09k+M8u8e6ZF+8Qop9LTTmCf2HTXcIVe8d458Mn9vSnHqcCwXndEcudYguscznWWFrm8I4S+j8mjaq+RieW1YzQeIcIVsg9FpjigUw1EnGAFyeFrntU0kOg/LZ79w64RcFOlaxZIiShmY+WdIJLsNnlnHQkAFt8txX/l3OHyCMq7YO1yrRhbTv5G6SYGVUQFzdDIehP9tBuIZDq/hlYXviw5JtDsIheJrjkYfOXkcKr3zsrFhnMRCZywBSmlYhFnN7uDY/jTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xyh3uCiq; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xyh3uCiq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbqZ84WVYz2yMv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:35:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CEE260010;
	Wed, 24 Dec 2025 11:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A511C4CEFB;
	Wed, 24 Dec 2025 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766576142;
	bh=rcZ3nMY4d65lf7YZ3P3xmWEvn3BCIy1Hqxm5btFypgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xyh3uCiqBwLSFzvpXcwS7OgzIHuc0bPj2+++1C+l1eEdHzwH9vJxSkiPqkRFMbS1y
	 ps9iufDkUHMFc+Ubsp/Ih+8vg/xG8gALVWWcXY8qNStsjwnxrLOqaekU8um42jJEfS
	 Lc4m/ukrr2IIbJASAXqg+HHenooEDls2rLMRH+jytjJ6hh1g6L3+GcX8wqn7OZWMYC
	 HKN4ffk7wlUSVmn8o1KLxUx+Ck8RnJ4pswDZfnYqLfRA9T9YiYmihb5Eh3YYjWHQxH
	 H4dgYwbOm0YyQODKZahb3AHHHOWVb79bXnGIvQqAB1Qib22CmyKuAdU37Gl3WgD+CW
	 8Arj0xFK1ZM8A==
Message-ID: <6089e76b-80aa-4254-af70-12b96d115a2e@kernel.org>
Date: Wed, 24 Dec 2025 12:35:31 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arch/*: increase lowmem size to avoid highmem use
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Andreas Larsson <andreas@gaisler.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthew Wilcox <willy@infradead.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Michal Simek <monstr@monstr.eu>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nishanth Menon <nm@ti.com>, Lucas Stach <l.stach@pengutronix.de>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-2-arnd@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251219161559.556737-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/12/2025 à 17:15, Arnd Bergmann a écrit :
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most of the common 32-bit architectures (x86, arm, powerpc) all use the
> default virtual memory layout that was already in place for i386 systems
> in the 1990s, using exactly 3GiB of user TASK_SIZE, with the upper 1GiB
> of addresses split between (at most 896MiB) lowmem and vmalloc.
> 
> Linux-2.3 introduced CONFIG_HIGHMEM for large x86 server machines that
> had 4GiB of RAM or more, with the VMSPLIT_3G/2G/1G options added in
> v2.6.16 for machines that had one or two gigabytes of memory but wanted
> to avoid the overhead from managing highmem. Over time, similar options
> appeared on other 32-bit architectures.
> 
> Twenty years later, it makes sense to reconsider the default settings,
> as the tradeoffs have changed a bit:
> 
>   - Configurations with more than 2GiB have become extremely rare,
>     as any users with large memory have moved on to 64-bit systems.
>     There were only ever a few Laptop models in this category: Apple
>     Powerbook G4 (2005), Macbook (2006), IBM Thinkpad X60 (2006), Arm
>     Chromebooks based on Exynos 5800 (2014), Tegra K1 (2014) and RK3288
>     (2015), and manufacturer support for all of these has ended in 2020
>     or (much) earlier.
>     Embedded systems with more than 2GiB use additional SoCs of a
>     similar vintage: Intel Atom Z5xx (2008), Freescale QorIQ (2008),
>     Marvell Armada XP (2010), Freescale i.MX6Q (2011), LSI Axxia (2013),
>     TI Keystone2 (2014), Renesas RZ/G1M (2015). Most boards based on
>     these have stopped receiving kernel upgrades. Newer 32-bit chips
>     only support smaller memory configurations, though in particular the
>     i.MX6Q and Keystone2 families have expected support cycles past 2035.
>     While 32-bit server installations used to support even larger memory,
>     none of those seem to still be used in production on any architecture.
> 
>   - While general-purpose distributes for 32-bit targets were common,
>     it was rather risky to change the CONFIG_VMSPLIT setting because
>     there is always a possibility of running into device driver bugs or
>     applications that need a large virtual memory size. Presumably
>     a lot of these issues have been resolved now, so most setups should
>     be fine using a custom vmsplit instead of highmem now.
> 
>   - As fewer users test highmem, the expectation is that it will
>     increasingly break in the future, so getting users to change the
>     vmsplit means that even if there is a bug to fix initially,
>     it improves the situation in the long run.
> 
>   - Highmem will ultimately need to be removed, at least for the page
>     cache and most other code using it today. In a previous discussion, I
>     had suggested doing this as early as 2029, but based on the discussions
>     since ELC, the plan is now to leave highmem-enabled page cache as an
>     option until at least 2029, at which point remaining users will have
>     the choice between no longer updating kernels or using a combination of
>     a custom vmsplit and zram/zswap. Changing the defaults now should both
>     speed up the highmem deprecation and make it less painful for users.
> 
>   - The most VM space intensive applications tend to be web browsers,
>     specifcally Chrome/ChromeOS and Firefox. Both have now stopped
>     providing binary updates, but Firefox can still be built from source.
>     Testing various combinations on Debian/armhf, I found that Firefox 140
>     can still show complex websites with VMSPLIT_2G_OPT with and without
>     HIGHMEM, though it failed for me both with the small address space
>     of VMSPLIT_1G and the small lowmem of VMSPLIT_3G_OPT when HIGHMEM
>     is disabled.
>     This is likely to get worse with future versions, so embedded users
>     may still be forced to migrate to specialized browsers like WPE Webkit
>     when HIGHMEM pagecache is finally removed.
> 
> Based on the above observations and the discussion at the kernel summit,
> change the defaults to the most appropriate values: use 1GiB of lowmem on
> non-highmem configurations, and either 2GiB or 1.75GiB of lowmem on highmem
> builds, depending on what is available on the architecture.  As ARM_LPAE
> and X86_PAE builds both require a gigabyte-aligned vmsplit, those get
> to use VMSPLIT_2G. The result is that the majority of previous highmem
> users now only need lowmem. For platform specific defconfig files that
> are known to only support up to 1GiB of RAM, drop the CONFIG_HIGHMEM line
> as well as a simplification.
> 
> On PowerPC and Microblaze, the options have somewhat different names but
> should have the same effect. MIPS and Xtensa cannot support a larger
> than 512MB of lowmem but are limited to small DDR2 memory in most
> implementations, with MT7621 being a notable exception. ARC and C-Sky
> could support a configurable vmsplit in theory, but it's not clear
> if anyone still cares.
> SPARC is currently limited to 192MB of lowmem and should get patched
> to behave either like arm/x86 or powerpc/microblaze to support 2GiB
> of lowmem.
> 
> There are likely going to be regressions from the changed defaults,
> in particular when hitting previously hidden device driver bugs
> that fail to set the correct DMA mask, or from applications that
> need a large virtual address space.
> Ideally the in-kernel problems should all be fixable, but the previous
> behavior is still selectable as a fallback with CONFIG_EXPERT=y
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: linux-mm@kvack.org
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm/Kconfig                            |  5 ++++-
>   arch/arm/configs/aspeed_g5_defconfig        |  1 -
>   arch/arm/configs/dove_defconfig             |  2 --
>   arch/arm/configs/mv78xx0_defconfig          |  2 --
>   arch/arm/configs/u8500_defconfig            |  1 -
>   arch/arm/configs/vt8500_v6_v7_defconfig     |  3 ---
>   arch/arm/mach-omap2/Kconfig                 |  1 -
>   arch/microblaze/Kconfig                     |  9 ++++++---
>   arch/microblaze/configs/mmu_defconfig       |  1 -
>   arch/powerpc/Kconfig                        | 17 +++++++++++------
>   arch/powerpc/configs/44x/akebono_defconfig  |  1 -
>   arch/powerpc/configs/85xx/ksi8560_defconfig |  1 -
>   arch/powerpc/configs/85xx/stx_gp3_defconfig |  1 -

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Be aware that it will likely trivialy conflict with 
https://lore.kernel.org/linuxppc-dev/6a2575420770d075cd090b5a316730a2ffafdee4.1766574657.git.chleroy@kernel.org/

Another point is that it will increase the overall memory usage when 
people activate KASAN as KASAN reserves 1/8 of RAM for lowmem memory. I 
think we need to look at the impact on available virtual memory, because 
1/8 of 2G is 256M which is the size of the last segment shared by KASAN 
shadow mem and vmalloc.

Christophe


