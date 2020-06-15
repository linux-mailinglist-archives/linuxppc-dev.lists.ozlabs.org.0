Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB8E1F90E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 09:59:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lkJL0kvmzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:59:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=xim4=74=linux-m68k.org=gerg@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ljN25K3XzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 17:17:54 +1000 (AEST)
Received: from [10.44.0.192] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFCCF206D7;
 Mon, 15 Jun 2020 07:17:31 +0000 (UTC)
Subject: Re: [PATCH 04/21] mm: free_area_init: use maximal zone PFNs rather
 than zone sizes
To: Mike Rapoport <rppt@kernel.org>
References: <20200412194859.12663-5-rppt@kernel.org>
 <f53e68db-ed81-6ef6-5087-c7246d010ea2@linux-m68k.org>
 <20200615062234.GA7882@kernel.org>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <24563231-ed19-6f4f-617e-4d6bfc7553e4@linux-m68k.org>
Date: Mon, 15 Jun 2020 17:17:28 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615062234.GA7882@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 catalin.marinas@arm.com, heiko.carstens@de.ibm.com, x86@kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 jcmvbkbc@gmail.com, guoren@kernel.org, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, bcain@codeaurora.org, corbet@lwn.net,
 linux-hexagon@vger.kernel.org, deller@gmx.de, linux-sh@vger.kernel.org,
 linux@armlinux.org.uk, ley.foon.tan@intel.com, rppt@linux.ibm.com,
 ysato@users.sourceforge.jp, geert@linux-m68k.org,
 linux-arm-kernel@lists.infradead.org, msalter@redhat.com, mattst88@gmail.com,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, nickhu@andestech.com,
 linux-um@lists.infradead.org, richard@nod.at, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, paul.walmsley@sifive.com,
 shorne@gmail.com, mhocko@kernel.org, gxt@pku.edu.cn,
 Hoan@os.amperecomputing.com, monstr@monstr.eu, tony.luck@intel.com,
 bhe@redhat.com, linux-parisc@vger.kernel.org, linux-mm@kvack.org,
 vgupta@synopsys.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, tsbogend@alpha.franken.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

On 15/6/20 4:22 pm, Mike Rapoport wrote:
> On Mon, Jun 15, 2020 at 01:53:42PM +1000, Greg Ungerer wrote:
>> From: Mike Rapoport <rppt@linux.ibm.com>
>>> Currently, architectures that use free_area_init() to initialize memory map
>>> and node and zone structures need to calculate zone and hole sizes. We can
>>> use free_area_init_nodes() instead and let it detect the zone boundaries
>>> while the architectures will only have to supply the possible limits for
>>> the zones.
>>>
>>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>>
>> This is causing some new warnings for me on boot on at least one non-MMU m68k target:
> 
> There were a couple of changes that cause this. The free_area_init()
> now relies on memblock data and architectural limits for zone sizes
> rather than on explisit pfns calculated by the arch code. I've update
> motorola variant and missed coldfire. Angelo sent a fix for mcfmmu.c
> [1] and I've updated it to include nommu as well
> 
> [1] https://lore.kernel.org/linux-m68k/20200614225119.777702-1-angelo.dureghello@timesys.com
> 
>>From 55b8523df2a5c4565b132c0691990f0821040fec Mon Sep 17 00:00:00 2001
> From: Angelo Dureghello <angelo.dureghello@timesys.com>
> Date: Mon, 15 Jun 2020 00:51:19 +0200
> Subject: [PATCH] m68k: fix registration of memory regions with memblock
> 
> Commit 3f08a302f533 ("mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP option")
> introduced assumption that UMA systems have their memory at node 0 and
> updated most of them, but it forgot nommu and coldfire variants of m68k.
> 
> The later change in free area initialization in commit fa3354e4ea39 ("mm:
> free_area_init: use maximal zone PFNs rather than zone sizes") exposed that
> and caused a lot of "BUG: Bad page state in process swapper" reports.

Even with this patch applied I am still seeing the same messages.

Regards
Greg



> Using memblock_add_node() with nid = 0 to register memory banks solves the
> problem.
> 
> Fixes: 3f08a302f533 ("mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP option")
> Fixes: fa3354e4ea39 ("mm: free_area_init: use maximal zone PFNs rather than zone sizes")
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
> Co-developed-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   arch/m68k/kernel/setup_no.c | 2 +-
>   arch/m68k/mm/mcfmmu.c       | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index e779b19e0193..0c4589a39ba9 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -138,7 +138,7 @@ void __init setup_arch(char **cmdline_p)
>   	pr_debug("MEMORY -> ROMFS=0x%p-0x%06lx MEM=0x%06lx-0x%06lx\n ",
>   		 __bss_stop, memory_start, memory_start, memory_end);
>   
> -	memblock_add(memory_start, memory_end - memory_start);
> +	memblock_add_node(memory_start, memory_end - memory_start, 0);
>   
>   	/* Keep a copy of command line */
>   	*cmdline_p = &command_line[0];
> diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> index 29f47923aa46..7d04210d34f0 100644
> --- a/arch/m68k/mm/mcfmmu.c
> +++ b/arch/m68k/mm/mcfmmu.c
> @@ -174,7 +174,7 @@ void __init cf_bootmem_alloc(void)
>   	m68k_memory[0].addr = _rambase;
>   	m68k_memory[0].size = _ramend - _rambase;
>   
> -	memblock_add(m68k_memory[0].addr, m68k_memory[0].size);
> +	memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0);
>   
>   	/* compute total pages in system */
>   	num_pages = PFN_DOWN(_ramend - _rambase);
> 
