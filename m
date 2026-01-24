Return-Path: <linuxppc-dev+bounces-16270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DyuL+ubdGnj7wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 11:16:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A37D36F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 11:16:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyrKz0qvXz2yDk;
	Sat, 24 Jan 2026 21:16:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769249767;
	cv=none; b=RZ+yIuuEOw384G+3xmav3zK5pr/FEBUBbYDmdNG66bZzb7YYqJRpDRhGkE4kk2Bikbwcy4x+vbqWod9WaoYcZYBxrAhGp7K0gcKX0f06m052im7HFXda2eYEvmqdre7gdZatR0CV4Ri0mQD6DpuncvNYqQRnULirzmwrYZltj4OYYD4UglsLyFMRr1a4Zw+WnssSm8uRcf68svQFTBFfjjIP1e0bnXwI8BfZ88djSSEK2Qjv2b7/qcarSbYR6kLK6ZS4zdAfDzM3HgANHPs9me0WGD4WF2qwlEqS/WIO59BggYGbeNK2uE0kAykfCJKJ+fVTOb+gI/zF5pBKSzxukg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769249767; c=relaxed/relaxed;
	bh=W/5NPMb0LZF5TbTdERpsT57n+ZMmWhyHLzllN9jVgX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8upDvoiQU2uKs9jh14VgVqdrSemvMV+pbIjpvZq3YwRxjTI4N4cpCZW0KeKU5r5RzJMs2Zgo49AOhZzC6sXPLS2o3TP72IqkD2Ae1t9QV+1o3B0m3+47wnGy/02luG1XeAnl/P4ma0ooSPy4+C+70/RHXhO35O/j3al0pysLEL7Kcj15900BZOLPr7QjK72/D0eRBGgx74A5HK6cI6gg1rCxqYGDK8lU/sYKy7h5Nkvv/V2DZHSQZnJPhb/yYfheWenKo4ZsXbv+9CeH73D0yRbNkd/EPXN8QZSf58lFp4l/5tWgHvIJeDMegJvnXyiaL0rfs8WRayJjR+cv+fJHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BG+9wd2o; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BG+9wd2o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyrKx1vWvz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 21:16:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ED6843C9A;
	Sat, 24 Jan 2026 10:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D83BC116D0;
	Sat, 24 Jan 2026 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769249762;
	bh=UPTxfV10NFGsFNMLbllwwGihhByrD9Chz5Ya/aU4aSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BG+9wd2ovrMG5pu7KsxBmuHPlYw48y+qEQuXSOmuaQ786O9ubyptVjzd3TPikqKEV
	 MtPvuwrKZtwGgD5G4X1PGRfnjjFohKmYb3O3Y4u5BFFb01X2hKPytrs6tuQ52Dm9nS
	 fmDIq7vs8J8McangAIFv826LCzRZLNgtf/9d3q8GVASVYzXNiEOedwA61U/TSPBRLw
	 B/uNVy9iMafbxhVtHeEUGbMQNxTqlAJ8n51n6Tyk+R2myqLHAu834xSBnmo1UVELl7
	 eeika37+zLOWSlLAtg5QwuglP1fRf1menyZ0BPn8+f6CDzm2bJ29YHmoNsPqWpbZ5/
	 er2PErNhz4kjQ==
Message-ID: <02784e9a-d934-44c3-ae24-a83a1bcf678d@kernel.org>
Date: Sat, 24 Jan 2026 11:15:47 +0100
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
Subject: Re: [PATCH mm-unstable] arch, mm: consolidate empty_zero_page
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org
References: <20260124095628.668870-1-rppt@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260124095628.668870-1-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16270-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linu
 x.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[52];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C13A37D36F
X-Rspamd-Action: no action



Le 24/01/2026 à 10:56, Mike Rapoport a écrit :
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Reduce 22 declarations of empty_zero_page to 3 and 23 declarations of
> ZERO_PAGE() to 4.
> 
> Every architecture defines empty_zero_page that way or another, but for the
> most of them it is always a page aligned page in BSS and most definitions
> of ZERO_PAGE do virt_to_page(empty_zero_page).
> 
> Move Linus vetted x86 definition of empty_zero_page and ZERO_PAGE() to the
> core MM and drop these definitions in architectures that do not implement
> colored zero page (MIPS and s390).
> 
> ZERO_PAGE() remains a macro because turning it to a wrapper for a static
> inline causes severe pain in header dependencies.
> 
> For the most part the change is mechanical, with these being noteworthy:
> 
> * alpha: aliased empty_zero_page with ZERO_PGE that was also used for boot
>    parameters. Switching to a generic empty_zero_page removes the aliasing
>    and keeps ZERO_PGE for boot parameters only
> * arm64: uses __pa_symbol() in ZERO_PAGE() so that definition of
>    ZERO_PAGE() is kept intact.
> * m68k/parisc/sparc64/um: allocated empty_zero_page from memblock,
>    although they do not support zero page coloring and having it in BSS
>    will work fine.
> * sh: used empty_zero_page for boot parameters at the very early boot.
>    Rename the parameters page to boot_params_page and let sh use the generic
>    empty_zero_page.
> * hexagon: had an amusing comment about empty_zero_page
> 
> 	/* A handy thing to have if one has the RAM. Declared in head.S */
> 
>    that unfortunately had to go :)
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/alpha/include/asm/pgtable.h          |  6 ------
>   arch/arc/include/asm/pgtable.h            |  3 ---
>   arch/arc/mm/init.c                        |  2 --
>   arch/arm/include/asm/pgtable.h            |  9 ---------
>   arch/arm/mm/mmu.c                         |  7 -------
>   arch/arm/mm/nommu.c                       |  7 -------
>   arch/arm64/include/asm/pgtable.h          |  1 -
>   arch/arm64/mm/mmu.c                       |  7 -------
>   arch/csky/include/asm/pgtable.h           |  3 ---
>   arch/csky/mm/init.c                       |  3 ---
>   arch/hexagon/include/asm/pgtable.h        |  6 ------
>   arch/hexagon/kernel/head.S                |  5 -----
>   arch/hexagon/kernel/hexagon_ksyms.c       |  1 -
>   arch/loongarch/include/asm/pgtable.h      |  9 ---------
>   arch/loongarch/mm/init.c                  |  3 ---
>   arch/m68k/include/asm/pgtable_mm.h        |  9 ---------
>   arch/m68k/include/asm/pgtable_no.h        |  7 -------
>   arch/m68k/mm/init.c                       |  9 ---------
>   arch/m68k/mm/mcfmmu.c                     |  2 --
>   arch/m68k/mm/motorola.c                   |  6 ------
>   arch/m68k/mm/sun3mmu.c                    |  2 --
>   arch/microblaze/include/asm/pgtable.h     | 10 ----------
>   arch/microblaze/kernel/head.S             |  4 ----
>   arch/microblaze/kernel/microblaze_ksyms.c |  2 --
>   arch/nios2/include/asm/pgtable.h          |  7 -------
>   arch/nios2/kernel/head.S                  | 10 ----------
>   arch/nios2/kernel/nios2_ksyms.c           |  1 -
>   arch/openrisc/include/asm/pgtable.h       |  4 ----
>   arch/openrisc/kernel/head.S               |  3 ---
>   arch/openrisc/kernel/or32_ksyms.c         |  1 -
>   arch/openrisc/mm/init.c                   |  3 ---
>   arch/parisc/include/asm/pgtable.h         | 11 -----------
>   arch/parisc/mm/init.c                     |  6 ------
>   arch/powerpc/include/asm/pgtable.h        |  6 ------
>   arch/powerpc/mm/mem.c                     |  3 ---

For powerpc:

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

>   arch/riscv/include/asm/pgtable.h          |  7 -------
>   arch/riscv/mm/init.c                      |  4 ----
>   arch/sh/include/asm/pgtable.h             |  8 --------
>   arch/sh/include/asm/setup.h               |  3 ++-
>   arch/sh/kernel/head_32.S                  |  4 ++--
>   arch/sh/kernel/sh_ksyms_32.c              |  1 -
>   arch/sh/mm/init.c                         |  1 -
>   arch/sparc/include/asm/pgtable_32.h       |  8 --------
>   arch/sparc/include/asm/pgtable_64.h       |  3 ---
>   arch/sparc/include/asm/setup.h            |  2 --
>   arch/sparc/kernel/head_32.S               |  7 -------
>   arch/sparc/mm/init_32.c                   |  4 ----
>   arch/sparc/mm/init_64.c                   | 15 ---------------
>   arch/um/include/asm/pgtable.h             |  9 ---------
>   arch/um/include/shared/kern_util.h        |  1 -
>   arch/um/kernel/mem.c                      | 16 ----------------
>   arch/um/kernel/um_arch.c                  |  1 -
>   arch/x86/include/asm/pgtable.h            |  8 --------
>   arch/x86/kernel/head_32.S                 |  4 ----
>   arch/x86/kernel/head_64.S                 |  7 -------
>   arch/xtensa/include/asm/pgtable.h         |  4 ----
>   arch/xtensa/kernel/head.S                 |  3 ---
>   arch/xtensa/kernel/xtensa_ksyms.c         |  2 --
>   include/linux/pgtable.h                   |  8 ++++++++
>   mm/mm_init.c                              |  9 +++++++++
>   60 files changed, 21 insertions(+), 296 deletions(-)
> 

