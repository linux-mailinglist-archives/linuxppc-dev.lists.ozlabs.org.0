Return-Path: <linuxppc-dev+bounces-8673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EDCABC4C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 18:40:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1Nhj3CJwz2xKh;
	Tue, 20 May 2025 02:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747672821;
	cv=none; b=WyBDigGGt7dne0y1/P7ToCsXx/vkgV9DuNukKkyoNHO3sMYa0EwnmFU9gxEpga8A6kwDo1scaesJnT7GdCbQXEnRNgouD9mE5DTPJ2NLh63tvnkg7eTS+to8ZvXcpcXev6ztMKDSARrTWqfNSxIaYICX5IXNnGcVUxTBXeY70z24HznGUkkMhlFn5EU37NWeC+gB+DQiqzd+t9fVZebqRZNbzF9XcAG4C+LeeXefNV5X4b4JPg2PNY+kxTmFw8yb/lis2RVTPJSrd4TevftT4ipgMQEyqyvV+XGI6ZY8m0zfvsgbx3UGIyhF/JLEt86mDJeK1znONEyV+Tkzf+phsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747672821; c=relaxed/relaxed;
	bh=X+wPIx+M4NrI6qKRmf6NJzn0ejVxtlM9cMaiIEGvjr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZy87xGCvyFeu2RchDTBHrAJZHuAlzYrJprXB3yEtqKhvDZwIor7cJq4tVHRXQcPzStyZUOilZqkp5yFgae+ZbIv+esUIblbcAQPht/m9VeWpBUjJenEm0n/KTACdpwM8lpp0wQtpvKkUy86wbYQ7Fod3ftJr0P3bUjeZav2oQqtoLl55z6TPZ21rss00GARl7Wg9xMd6frO1N4hbwhFZ4wHDIVsJHLnyZNW4AhelJmmY4Y/CyIcV9XTHTrcM8tVtcD7oex+cbxs+p0bOICmh/t+g4pmJdEH31Z7sWOuu5kWv7OMbSg3PjqkG6HVdgCu9txXFERkJWLXb4WI+cc+dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Nhg73sNz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 02:40:19 +1000 (AEST)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id E852E582847
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 15:54:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B1DD43A66;
	Mon, 19 May 2025 15:54:23 +0000 (UTC)
Message-ID: <dc4e60dc-9b78-473a-9c18-3a2f128a02d2@ghiti.fr>
Date: Mon, 19 May 2025 17:54:23 +0200
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
Subject: Re: [PATCH v2 10/13] arch, mm: set high_memory in free_area_init()
To: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <ptyadav@amazon.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 Praveen Kumar <pravkmr@amazon.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-11-rppt@kernel.org> <mafs05xi0o9ri.fsf@amazon.de>
 <aCdveN2w9ThjVhae@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <aCdveN2w9ThjVhae@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddujeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeejjeeiudemiegsgeeimegrsgguugemfhgvtgefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeejjeeiudemiegsgeeimegrsgguugemfhgvtgefpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeejjeeiudemiegsgeeimegrsgguugemfhgvtgefngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeeiuddprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhthigruggrvhesrghmrgiiohhnrdguvgdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpt
 hhtoheprghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehluhhtoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mike,

On 5/16/25 19:01, Mike Rapoport wrote:
> Hi Pratyush,
>
> On Fri, May 16, 2025 at 05:28:17PM +0200, Pratyush Yadav wrote:
>> Hi Mike, Andrew,
>>
>> On Thu, Mar 13 2025, Mike Rapoport wrote:
>>
>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>>
>>> high_memory defines upper bound on the directly mapped memory.
>>> This bound is defined by the beginning of ZONE_HIGHMEM when a system has
>>> high memory and by the end of memory otherwise.
>>>
>>> All this is known to generic memory management initialization code that
>>> can set high_memory while initializing core mm structures.
>>>
>>> Add a generic calculation of high_memory to free_area_init() and remove
>>> per-architecture calculation except for the architectures that set and
>>> use high_memory earlier than that.
>>>
>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>	# x86
>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> ---
>>>   arch/alpha/mm/init.c         |  1 -
>>>   arch/arc/mm/init.c           |  2 --
>>>   arch/arm64/mm/init.c         |  2 --
>>>   arch/csky/mm/init.c          |  1 -
>>>   arch/hexagon/mm/init.c       |  6 ------
>>>   arch/loongarch/kernel/numa.c |  1 -
>>>   arch/loongarch/mm/init.c     |  2 --
>>>   arch/microblaze/mm/init.c    |  2 --
>>>   arch/mips/mm/init.c          |  2 --
>>>   arch/nios2/mm/init.c         |  6 ------
>>>   arch/openrisc/mm/init.c      |  2 --
>>>   arch/parisc/mm/init.c        |  1 -
>>>   arch/riscv/mm/init.c         |  1 -
>>>   arch/s390/mm/init.c          |  2 --
>>>   arch/sh/mm/init.c            |  7 -------
>>>   arch/sparc/mm/init_32.c      |  1 -
>>>   arch/sparc/mm/init_64.c      |  2 --
>>>   arch/um/kernel/um_arch.c     |  1 -
>>>   arch/x86/kernel/setup.c      |  2 --
>>>   arch/x86/mm/init_32.c        |  3 ---
>>>   arch/x86/mm/numa_32.c        |  3 ---
>>>   arch/xtensa/mm/init.c        |  2 --
>>>   mm/memory.c                  |  8 --------
>>>   mm/mm_init.c                 | 30 ++++++++++++++++++++++++++++++
>>>   mm/nommu.c                   |  2 --
>>>   25 files changed, 30 insertions(+), 62 deletions(-)
>> This patch causes a BUG() when built with CONFIG_DEBUG_VIRTUAL and
>> passing in the cma= commandline parameter:
>>
>>      ------------[ cut here ]------------
>>      kernel BUG at arch/x86/mm/physaddr.c:23!
>>      ception 0x06 IP 10:ffffffff812ebbf8 error 0 cr2 0xffff88903ffff000
>>      CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc6+ #231 PREEMPT(undef)
>>      Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
>>      RIP: 0010:__phys_addr+0x58/0x60
>>      Code: 01 48 89 c2 48 d3 ea 48 85 d2 75 05 e9 91 52 cf 00 0f 0b 48 3d ff ff ff 1f 77 0f 48 8b 05 20 54 55 01 48 01 d0 e9 78 52 cf 00 <0f> 0b 90 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90
>>      RSP: 0000:ffffffff82803dd8 EFLAGS: 00010006 ORIG_RAX: 0000000000000000
>>      RAX: 000000007fffffff RBX: 00000000ffffffff RCX: 0000000000000000
>>      RDX: 000000007fffffff RSI: 0000000280000000 RDI: ffffffffffffffff
>>      RBP: ffffffff82803e68 R08: 0000000000000000 R09: 0000000000000000
>>      R10: ffffffff83153180 R11: ffffffff82803e48 R12: ffffffff83c9aed0
>>      R13: 0000000000000000 R14: 0000001040000000 R15: 0000000000000000
>>      FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
>>      CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>      CR2: ffff88903ffff000 CR3: 0000000002838000 CR4: 00000000000000b0
>>      Call Trace:
>>       <TASK>
>>       ? __cma_declare_contiguous_nid+0x6e/0x340
>>       ? cma_declare_contiguous_nid+0x33/0x70
>>       ? dma_contiguous_reserve_area+0x2f/0x70
>>       ? setup_arch+0x6f1/0x870
>>       ? start_kernel+0x52/0x4b0
>>       ? x86_64_start_reservations+0x29/0x30
>>       ? x86_64_start_kernel+0x7c/0x80
>>       ? common_startup_64+0x13e/0x141
>>
>> The reason is that __cma_declare_contiguous_nid() does:
>>
>>      	highmem_start = __pa(high_memory - 1) + 1;
>>
>> If dma_contiguous_reserve_area() (or any other CMA declaration) is
>> called before free_area_init(), high_memory is uninitialized. Without
>> CONFIG_DEBUG_VIRTUAL, it will likely work but use the wrong value for
>> highmem_start.
>>
>> Among the architectures this patch touches, the below call
>> dma_contiguous_reserve_area() _before_ free_area_init():
>>
>> - x86
>> - s390
>> - mips
>> - riscv
>> - xtensa
>> - loongarch
>> - csky
> For most of those this patch didn't really change anything because they
> initialized high_memory in mem_init() which is a part of free_area_init().
> In those cases cma just did
>
> 	highmem_start = __pa(-1) + 1;
>
> and everyone was happy :)
>   
>> The below call it _after_ free_area_init():
>> - arm64
>>
>> And the below don't call it at all:
>> - sparc
>> - nios2
>> - openrisc
>> - hexagon
>> - sh
>> - um
>> - alpha
>>
>> One possible fix would be to move the calls to
>> dma_contiguous_reserve_area() after free_area_init(). On x86, it would
>> look like the diff below. The obvious downside is that moving the call
>> later increases the chances of allocation failure. I'm not sure how much
>> that actually matters, but at least on x86, that means crash kernel and
>> hugetlb reservations go before DMA reservation. Also, adding a patch
>> like that at rc7 is a bit risky.
> I don't think there's a risk of allocation failure, but moving things
> around in setup_arch() is always risky :)
>   
>> The other option would be to revert this. I tried a revert, but it isn't
>> trivial. It runs into merge conflicts in pretty much all of the arch
>> files. Maybe reverting patches 11, 12, and 13 as well would make it
>> easier but I didn't try that.
> What I think we can do is to add this to mm/cma.c (not even compile tested)
>
> diff --git a/mm/cma.c b/mm/cma.c
> index 15632939f20a..c04be488b099 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -608,7 +608,10 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
>   	 * complain. Find the boundary by adding one to the last valid
>   	 * address.
>   	 */
> -	highmem_start = __pa(high_memory - 1) + 1;
> +	if (IS_ENABLED(CONFIG_HIGHMEM))
> +		highmem_start = __pa(high_memory - 1) + 1;
> +	else
> +		highmem_start = memblock_end_of_DRAM();
>   	pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
>   		__func__, &size, &base, &limit, &alignment);


I encountered the same error as Pratyush and the above diff fixes it: do 
you plan on sending this fix for 6.15?

If so, you can add:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

If not, let me know how you want to proceed :)

Thanks,

Alex


>   
> so that highmem_start in __cma_declare_contiguous_nid() will be always
> correct for !HIGHMEM configs and then restore setting of highmem_start in
> mips::paging_init() as mips is the only architecture that actually set
> high_memory before free_area_init() before this patch.
>
> (for 32 bit configs of x86 there alrady a fixup d893aca973c3 ("x86/mm: restore
> early initialization of high_memory for 32-bits"))
>

