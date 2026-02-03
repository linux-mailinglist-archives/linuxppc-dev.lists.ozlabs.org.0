Return-Path: <linuxppc-dev+bounces-16545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHpUETfLgWl1JwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 11:17:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BAAD773D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 11:17:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4ztp4Wtrz30T8;
	Tue, 03 Feb 2026 21:17:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770113842;
	cv=none; b=j6FXjcGmkwNY/u23J134dArLPWuA4GtY5Ql7hWEiiMmz7w+Dmc+5ohsxkW1cWvLIyzMAKC/14kNZYE6Ouqor+wJTMfLVYYnCDCIdRPoTug+Q0qfaBL1B1r9cUxX+7pI7qRFJ6x/1y+UtFPWmdEl5MtN2eZFeknhW1g+uqS+aYno76gCnDcT75sXZHY8cHwIR7bmViAwarACGJSoyE4/Sc8eKb4YPZwNtCTvWgnABLmKP+6ZAGSQJFI4Q3pZPNY2BCLKKcWkNRrC6dcnY+xkDs/ZEIfj89A8ni/PlCkP361SVhJ4Rh5I6rIXtYp2w0Hu3p7L5hDUdm3Pf12YPyTwzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770113842; c=relaxed/relaxed;
	bh=bIz4RVwkv6KARy4MwQOhUdd22JeZFr0fFrNF7J4bRPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWJmUedcVhDUj0Yrt5AivLU/3PTllsUCpyrL6Rxk3oYGP4fPuVjJ0i4/chVsB/qUh3hQvehfV266tBbvlOp30p6EqKAUYJ1o3WbaBOCoT9xKmgSiWAHqsyax1kw4VewUKPLOJVUC2lEQx7WNdBwABWEiI+N60vKmTNaSK5aaXYYAOVcKZ/k4pP9dKtyOHDvT2o3OXYA122ciSUFbD+RKBHFuQE4kvUsZsAwhf5X3PAvq/rJWGlSzeISXv6FwvyIktF8W/5M8QfmQ9JDicdpSMuOTX14lpV8V7g2Q3QR1g7ZDdABwlotK95E0lNxsws8ffvhIQOJFhX4JWFaD7f7jrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=lUAE2uVq reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=lUAE2uVq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4ztl6lJpz30GV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 21:17:17 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4f4ztd00Nsz1FDXZ;
	Tue,  3 Feb 2026 11:17:13 +0100 (CET)
Received: from [10.10.15.18] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4f4ztY1CK4z1DHbc;
	Tue,  3 Feb 2026 11:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1770113832;
	bh=bIz4RVwkv6KARy4MwQOhUdd22JeZFr0fFrNF7J4bRPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lUAE2uVqAzYhZ1sm97fYuqy+vlFYURoO/ESgRDOLYwoPcj+AJLYcKftxzXr+4y/HX
	 2YOyDda3zoXt+26+AX8pMM7QHh5T+XJuM4W03HRzJukix5g8rdsb/fjilKm09oxzSx
	 tBwy+nern6bg1a50/KfLMYddppMeG7txUbC4/AmsAXT1tuu3+smPwBXiUUqokjSpVv
	 UUsrhLX04O7HNQNLLVmIA6iNk0y72m91fWDt4UXVjn71WutyJfQfTM3K8uFvvtoUBz
	 jIXUHdgIYTlrZQBjHS4KV4lgMsEWYt8Uw9Kgk+K14XLmF28umAniXCSL8090kqia/S
	 lC0jknJm/j/RQ==
Message-ID: <ec965a79-dad8-4358-a8e9-ebc9f330b67b@gaisler.com>
Date: Tue, 3 Feb 2026 11:17:08 +0100
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
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov
 <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
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
 <2157220c-0394-40fa-9918-a8514171bd10@gaisler.com>
 <aXj_x5CyUeys7ONM@kernel.org>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <aXj_x5CyUeys7ONM@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gaisler.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lis
 ts.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	R_DKIM_PERMFAIL(0.00)[gaisler.com:s=simplycom2];
	FORGED_SENDER(0.00)[andreas@gaisler.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-16545-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[51];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gaisler.com:~];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 71BAAD773D
X-Rspamd-Action: no action

On 2026-01-27 19:11, Mike Rapoport wrote:
> On Tue, Jan 27, 2026 at 05:02:39PM +0100, Andreas Larsson wrote:
>> On 2026-01-24 10:56, Mike Rapoport wrote:
>>
>>> Every architecture defines empty_zero_page that way or another, but for the
>>> most of them it is always a page aligned page in BSS and most definitions
>>> of ZERO_PAGE do virt_to_page(empty_zero_page).
>>
>> Running this in an LDOM on an UltraSparc T4 sparc64, the entire LDOM
>> hangs after a while during boot.
>>
>>> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
>>> index c2d19c9a9244..2bd99944176d 100644
>>> --- a/arch/sparc/mm/init_64.c
>>> +++ b/arch/sparc/mm/init_64.c
>>> @@ -177,9 +177,6 @@ extern unsigned long sparc_ramdisk_image64;
>>>  extern unsigned int sparc_ramdisk_image;
>>>  extern unsigned int sparc_ramdisk_size;
>>>  
>>> -struct page *mem_map_zero __read_mostly;
>>> -EXPORT_SYMBOL(mem_map_zero);
>>> -
>>>  unsigned int sparc64_highest_unlocked_tlb_ent __read_mostly;
>>>  
>>>  unsigned long sparc64_kern_pri_context __read_mostly;
>>> @@ -2506,18 +2503,6 @@ void __init mem_init(void)
>>>  	 */
>>>  	register_page_bootmem_info();
>>>  
>>> -	/*
>>> -	 * Set up the zero page, mark it reserved, so that page count
>>> -	 * is not manipulated when freeing the page from user ptes.
>>> -	 */
>>> -	mem_map_zero = alloc_pages(GFP_KERNEL|__GFP_ZERO, 0);
>>> -	if (mem_map_zero == NULL) {
>>> -		prom_printf("paging_init: Cannot alloc zero page.\n");
>>> -		prom_halt();
>>> -	}
>>> -	mark_page_reserved(mem_map_zero);
>>> -
>>> -
>>>  	if (tlb_type == cheetah || tlb_type == cheetah_plus)
>>>  		cheetah_ecache_flush_init();
>>>  }
>>
>> This just removes the mark_page_reserved(mem_map_zero) without 
>> replacing it with something corresponding to that. Perhaps part
>> of the problem?
> 
> I don't think so, empty_zero_page is in BSS now an it's reserved as a part
> of the kernel image.
> 
> I suspect that virt_to_page() does not work BSS symbols on sparc64. Can you
> please try with this patch:
> 
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> index 74ede706fb32..0578c5172d4e 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -22,6 +22,7 @@
>  #include <asm/adi.h>
>  #include <asm/page.h>
>  #include <asm/processor.h>
> +#include <asm/vaddrs.h>
>  
>  /* The kernel image occupies 0x4000000 to 0x6000000 (4MB --> 96MB).
>   * The page copy blockops can use 0x6000000 to 0x8000000.
> @@ -210,6 +211,11 @@ extern unsigned long _PAGE_CACHE;
>  extern unsigned long pg_iobits;
>  extern unsigned long _PAGE_ALL_SZ_BITS;
>  
> +extern unsigned long kern_base;
> +#define ZERO_PAGE(vaddr)						   \
> +	(virt_to_page(empty_zero_page + ((unsigned long)__va(kern_base)) - \
> +		      ((unsigned long)KERNBASE)))
> +
>  /* PFNs are real physical page numbers.  However, mem_map only begins to record
>   * per-page information starting at pfn_base.  This is to handle systems where
>   * the first physical page in the machine is at some huge physical address,
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 2bd99944176d..d2d724ba4f83 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -170,6 +170,8 @@ static void __init read_obp_memory(const char *property,
>  
>  /* Kernel physical address base and size in bytes.  */
>  unsigned long kern_base __read_mostly;
> +EXPORT_SYMBOL(kern_base);
> +
>  unsigned long kern_size __read_mostly;
>  
>  /* Initial ramdisk setup */
Hi,

Unfortunately, that does not help. The LDOM goes down in the same fashion.

In QEMU, with or without this extra patch, I get this:

[    3.310674] BUG: Bad page map in process mount  pte:ffffc800016436b0
[    3.310778] pgd:027dc000 p4d:027dc000 pud:027d8000 pmd:0269a000
[    3.311686] addr:000001000020a000 vm_flags:00100077 anon_vma:fffff80002688548 mapping:0000000000000000 index:8000105
[    3.312449] file:(null) fault:0x0 mmap:0x0 mmap_prepare: 0x0 read_folio:0x0
[    3.313622] CPU: 0 UID: 0 PID: 46 Comm: mount Not tainted 6.19.0-rc5-00269-g28acabacf9b0 #22 VOLUNTARY 
[    3.314056] Call Trace:
[    3.314182] [<00000000005e822c>] print_bad_page_map+0x10c/0x260
[    3.314375] [<00000000005e9f30>] vm_normal_page+0x70/0x80
[    3.314400] [<00000000005ea5a8>] unmap_page_range+0x4e8/0x13c0
[    3.314421] [<00000000005eb54c>] unmap_vmas+0x2c/0x120
[    3.314440] [<00000000005f781c>] exit_mmap+0xdc/0x440
[    3.314457] [<000000000047193c>] mmput+0x3c/0x100
[    3.314477] [<0000000000479e94>] do_exit+0x1f4/0xa00
[    3.314494] [<000000000047a83c>] do_group_exit+0x1c/0xa0
[    3.314511] [<0000000000489b28>] get_signal+0x8a8/0x8e0
[    3.314529] [<000000000043be24>] do_notify_resume+0xa4/0x5a0
[    3.314549] [<0000000000404b48>] __handle_signal+0xc/0x30
[    3.314687] Disabling lock debugging due to kernel taint

Cheers,
Andreas


