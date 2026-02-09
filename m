Return-Path: <linuxppc-dev+bounces-16720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAWRCbudiWlU/wQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:41:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D71510D15F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:41:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8dTF4jXlz2yGx;
	Mon, 09 Feb 2026 19:41:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770626481;
	cv=none; b=fNmU6Dj4ShSZYWVKKXgPzoVp8ILi+piL6bcmKVCOQTCKK6627V/lMFtppypa9Fp4Jlr2vNmwiCna+jZlvXR7SeJKswejFPEep3IBdKwLe/A0lzcVUhhgVZnKF4xTumQnFWCq+dfh4XbHty5Ubis3SrUEbpEXVYe4Qop2HATVbYQZeVlFIlIY2aWIS2ovD6L2NzM4JWOeekgC00wDP3jcjOQAuLeh7+dp61Y1mDgeVbrKEqU7BdmhN6JNPa94WuY66K2cOgkCJ60iAfiQGKDIQHlD8k4SzoMhvkGDi/LutaMv7lQmDteDTiLvLMQ3tzyu60JmL/YRQBrEoKVUePqRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770626481; c=relaxed/relaxed;
	bh=RbC+RKpRL3vyZA9rhFwXc+s3LnlBOMIWZ1+a+rfNhok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2RQadjy+KWj3t+ptT/L291hiH2SQXxvx8AH+TMuFHQ0zx/M3xDqNt/1AN1I+DDjS7dsQ0RCuFJd4Bnfzyc90aCLhaYlvr8u8XN3Zve8yvntj8gDPpvA0D4XlUVo7W0e0L1/UesGgg6G8cRyajHKBRdAcYaftjslCybHjAUGslAFpPYwXYVz+yH9DHqVbQUP3wqPpl2PksIoKoZHDw/MVk/NlGTF6T6PZ/Jza1+hpFmzaW0iDRgoOVUDKmKHVpWJ5ntPiEjmSQeuInN0UruFTp7RGkpLXNprs6NBIlqZhAxUsW2xcndidN0/LO/xaJBw4xTnXtf3z0LzEO6crjBlqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=OzGhPxF4 reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=OzGhPxF4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8dTB5jlCz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 19:41:16 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4f8dT36VdGz1DDdY;
	Mon,  9 Feb 2026 09:41:11 +0100 (CET)
Received: from [10.10.15.18] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4f8dT110xZz1DDXf;
	Mon,  9 Feb 2026 09:41:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1770626471;
	bh=RbC+RKpRL3vyZA9rhFwXc+s3LnlBOMIWZ1+a+rfNhok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OzGhPxF4b1JTlL0uvUgojBuLGl/d8Dy9MJzVSCLeT/MydG7knOZy+3rxTsSLXE0fa
	 Fe8HpYTWVqRUTnGYcY3oAZB1G1mG+IVuTFOS7+WqJBz1ilC5nvTR8TovjKYRzf+P2w
	 Ww4xwxi029qA+7zIuREjyi1oyTjnneeeu19Nl05HHLco+NvnhYBsugXIxVmZ8+yauy
	 xXkbpOW82Lh5ONVHEwDikWUcNveQWPl7uCMf/FTqxIDhDMLT/JU43EG3ChwZ3W9qcL
	 8U/FowPM9gwj9XED74iSkSmiVCadg33Ys0HHbcY4Truz0z7WWFA4WvlePWVs4XcxTs
	 tU6jXEQEdNbzw==
Message-ID: <55bef6c2-de81-4b60-b6df-5ef733b54dee@gaisler.com>
Date: Mon, 9 Feb 2026 09:41:08 +0100
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
 <ec965a79-dad8-4358-a8e9-ebc9f330b67b@gaisler.com>
 <aYcVu7gs65S1CeST@kernel.org>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <aYcVu7gs65S1CeST@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
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
	TAGGED_FROM(0.00)[bounces-16720-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[51];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gaisler.com:~];
	NEURAL_HAM(-0.00)[-0.932];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 6D71510D15F
X-Rspamd-Action: no action

On 2026-02-07 11:36, Mike Rapoport wrote:
>> Unfortunately, that does not help. The LDOM goes down in the same fashion.
> 
> Apparently something is wrong with my pointer arithmetics :/
> 
> Can you try this one instead?
> 
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> index 74ede706fb32..615f460c50af 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -210,6 +210,9 @@ extern unsigned long _PAGE_CACHE;
>  extern unsigned long pg_iobits;
>  extern unsigned long _PAGE_ALL_SZ_BITS;
>  
> +extern struct page *mem_map_zero;
> +#define ZERO_PAGE(vaddr)	(mem_map_zero)
> +
>  /* PFNs are real physical page numbers.  However, mem_map only begins to record
>   * per-page information starting at pfn_base.  This is to handle systems where
>   * the first physical page in the machine is at some huge physical address,
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 2bd99944176d..aa1f9f071fb2 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -177,6 +177,9 @@ extern unsigned long sparc_ramdisk_image64;
>  extern unsigned int sparc_ramdisk_image;
>  extern unsigned int sparc_ramdisk_size;
>  
> +struct page *mem_map_zero __read_mostly;
> +EXPORT_SYMBOL(mem_map_zero);
> +
>  unsigned int sparc64_highest_unlocked_tlb_ent __read_mostly;
>  
>  unsigned long sparc64_kern_pri_context __read_mostly;
> @@ -2495,6 +2498,9 @@ static void __init register_page_bootmem_info(void)
>  }
>  void __init mem_init(void)
>  {
> +	phys_addr_t zero_page_pa = kern_base +
> +		((unsigned long)&empty_zero_page[0] - KERNBASE);
> +
>  	/*
>  	 * Must be done after boot memory is put on freelist, because here we
>  	 * might set fields in deferred struct pages that have not yet been
> @@ -2503,6 +2509,12 @@ void __init mem_init(void)
>  	 */
>  	register_page_bootmem_info();
>  
> +	/*
> +	 * Set up the zero page, mark it reserved, so that page count
> +	 * is not manipulated when freeing the page from user ptes.
> +	 */
> +	mem_map_zero = pfn_to_page(PHYS_PFN(zero_page_pa));
> +
>  	if (tlb_type == cheetah || tlb_type == cheetah_plus)
>  		cheetah_ecache_flush_init();
>  }
> 

With that one, things work fine.

Cheers,
Andreas


