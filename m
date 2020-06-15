Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350551F8CBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 05:55:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lcth0s34zDqQN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 13:55:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lcry0cyFzDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 13:54:09 +1000 (AEST)
Received: from [10.44.0.192] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 291D120768;
 Mon, 15 Jun 2020 03:53:45 +0000 (UTC)
To: rppt@kernel.org
References: <20200412194859.12663-5-rppt@kernel.org>
Subject: Re: [PATCH 04/21] mm: free_area_init: use maximal zone PFNs rather
 than zone sizes
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <f53e68db-ed81-6ef6-5087-c7246d010ea2@linux-m68k.org>
Date: Mon, 15 Jun 2020 13:53:42 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200412194859.12663-5-rppt@kernel.org>
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
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
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

From: Mike Rapoport <rppt@linux.ibm.com>
> Currently, architectures that use free_area_init() to initialize memory map
> and node and zone structures need to calculate zone and hole sizes. We can
> use free_area_init_nodes() instead and let it detect the zone boundaries
> while the architectures will only have to supply the possible limits for
> the zones.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

This is causing some new warnings for me on boot on at least one non-MMU m68k target:

...
NET: Registered protocol family 17
BUG: Bad page state in process swapper  pfn:20165
page:41fe0ca0 refcount:0 mapcount:1 mapping:00000000 index:0x0
flags: 0x0()
raw: 00000000 00000100 00000122 00000000 00000000 00000000 00000000 00000000
page dumped because: nonzero mapcount
CPU: 0 PID: 1 Comm: swapper Not tainted 5.8.0-rc1-00001-g3a38f8a60c65-dirty #1
Stack from 404c9ebc:
         404c9ebc 4029ab28 4029ab28 40088470 41fe0ca0 40299e21 40299df1 404ba2a4
         00020165 00000000 41fd2c10 402c7ba0 41fd2c04 40088504 41fe0ca0 40299e21
         00000000 40088a12 41fe0ca0 41fe0ca4 0000020a 00000000 00000001 402ca000
         00000000 41fe0ca0 41fd2c10 41fd2c10 00000000 00000000 402b2388 00000001
         400a0934 40091056 404c9f44 404c9f44 40088db4 402c7ba0 00000001 41fd2c04
         41fe0ca0 41fd2000 41fe0ca0 40089e02 4026ecf4 40089e4e 41fe0ca0 ffffffff
Call Trace:
         [<40088470>] 0x40088470
  [<40088504>] 0x40088504
  [<40088a12>] 0x40088a12
  [<402ca000>] 0x402ca000
  [<400a0934>] 0x400a0934

         [<40091056>] 0x40091056
  [<40088db4>] 0x40088db4
  [<40089e02>] 0x40089e02
  [<4026ecf4>] 0x4026ecf4
  [<40089e4e>] 0x40089e4e

         [<4008ca26>] 0x4008ca26
  [<4004adf8>] 0x4004adf8
  [<402701ec>] 0x402701ec
  [<4008f25e>] 0x4008f25e
  [<400516f4>] 0x400516f4

         [<4026eec0>] 0x4026eec0
  [<400224f0>] 0x400224f0
  [<402ca000>] 0x402ca000
  [<4026eeda>] 0x4026eeda
  [<40020b00>] 0x40020b00
...

Lots more of them.

...
BUG: Bad page state in process swapper  pfn:201a0
page:41fe1400 refcount:0 mapcount:1 mapping:00000000 index:0x0
flags: 0x0()
raw: 00000000 00000100 00000122 00000000 00000000 00000000 00000000 00000000
page dumped because: nonzero mapcount
CPU: 0 PID: 1 Comm: swapper Tainted: G    B             5.8.0-rc1-00001-g3a38f8a60c65-dirty #1
Stack from 404c9ebc:
         404c9ebc 4029ab28 4029ab28 40088470 41fe1400 40299e21 40299df1 404ba2a4
         000201a0 00000000 41fd2c10 402c7ba0 41fd2c04 40088504 41fe1400 40299e21
         00000000 40088a12 41fe1400 41fe1404 0000020a 0000003b 00000001 40340000
         00000000 41fe1400 41fd2c10 41fd2c10 00000000 00000000 41fe13e0 40022826
         00000044 404c9f44 404c9f44 404c9f44 40088db4 402c7ba0 00000001 41fd2c04
         41fe1400 41fd2000 41fe1400 40089e02 4026ecf4 40089e4e 41fe1400 ffffffff
Call Trace:
         [<40088470>] 0x40088470
  [<40088504>] 0x40088504
  [<40088a12>] 0x40088a12
  [<40022826>] 0x40022826
  [<40088db4>] 0x40088db4

         [<40089e02>] 0x40089e02
  [<4026ecf4>] 0x4026ecf4
  [<40089e4e>] 0x40089e4e
  [<4008ca26>] 0x4008ca26
  [<4004adf8>] 0x4004adf8

         [<402701ec>] 0x402701ec
  [<4008f25e>] 0x4008f25e
  [<400516f4>] 0x400516f4
  [<4026eec0>] 0x4026eec0
  [<400224f0>] 0x400224f0

         [<402ca000>] 0x402ca000
  [<4026eeda>] 0x4026eeda
  [<40020b00>] 0x40020b00
Freeing unused kernel memory: 648K
This architecture does not have kernel memory protection.
Run /init as init process
...

System boots pretty much as normal through user space after this.
Seems to be fully operational despite all those BUGONs.

Specifically this is a M5208EVB target (arch/m68k/configs/m5208evb).


[snip]
> diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
> index b88d510d4fe3..6d3147662ff2 100644
> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -84,7 +84,7 @@ void __init paging_init(void)
>  	 * page_alloc get different views of the world.
>  	 */
>  	unsigned long end_mem = memory_end & PAGE_MASK;
> -	unsigned long zones_size[MAX_NR_ZONES] = { 0, };
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
>  
>  	high_memory = (void *) end_mem;
>  
> @@ -98,8 +98,8 @@ void __init paging_init(void)
>  	 */
>  	set_fs (USER_DS);
>  
> -	zones_size[ZONE_DMA] = (end_mem - PAGE_OFFSET) >> PAGE_SHIFT;
> -	free_area_init(zones_size);
> +	max_zone_pfn[ZONE_DMA] = end_mem >> PAGE_SHIFT;
> +	free_area_init(max_zone_pfn);

This worries me a little. On this target PAGE_OFFSET will be non-0.

Thoughts?

Regards
Greg



