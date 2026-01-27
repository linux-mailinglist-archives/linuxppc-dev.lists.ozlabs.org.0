Return-Path: <linuxppc-dev+bounces-16324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NJKKHbbheGkztwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 17:03:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666E59751A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 17:02:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0qtg5TsRz309N;
	Wed, 28 Jan 2026 03:02:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769529771;
	cv=none; b=SEyVDmzjy+edZIIvXOvGwRzaDpZ3gdXISpmGXTlef6YXosafyFOWSLtQmmR/gZ4aM0x5wdSN8L0cgdXfjzPRWzEGxVUy2rL1EdjhMkZBJCuVU6IPFPOtE8wMGDj5YrTeZlH4S70Rpkhy+j5xr1dauNe8xym9lCTWa2Moi49MkOfKN62nU5y1wDwbe8gqmrqkUry16yvtGXIZDelH0PUB6EDnxfy64W+y/GnVqIY4I9YGav2eEV/qJCFlbbp2rTqOws/7RsqlnAd/L5Uldg0x/Q25XagFhp57MEHljPzQne5Hoz7tKIYKBa+Lk5PkDVOuNBBgrfCSL+lbnwYK9obnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769529771; c=relaxed/relaxed;
	bh=XjNhgAV5Uc7zjxVMNfRjSJ4NulgkiTn1O8FFUA42SJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guBpVOErcP/nFPfIFWG7gOc2bZ9VAO11SfArzAkD7lia2p0U7KcnYfxwMsijf48WGvuh5ltCH8MsuGUZRvFDkuEm/cpBfkUu2QaNE5I6phOq76hu8yM8EOvOXMhxIYn4qO+3a0IJqrumdQnnLa6qWbbLIGkk2wiMTFbGwvFwyO30ADUb7du9O6mPbyBn7haqsrjJcUVJU5OCXAEJsUi5RpC4Mq+0YkwIXxfpIW8/GSJPnBei+rCIBYg9KH1gbxCCNi/mNf801x0Ji0hxcTts6MufOAqcaoqAhVCn8Piwqf0NergdrmTQos59hjLzLmyqmUMYma41kLS8tiFpzlWfHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=nF1rwIiB reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=nF1rwIiB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0qtc6fCkz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 03:02:46 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4f0qtT3pH1z1DPkw;
	Tue, 27 Jan 2026 17:02:41 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4f0qtS1KPDz1DPkR;
	Tue, 27 Jan 2026 17:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1769529761;
	bh=XjNhgAV5Uc7zjxVMNfRjSJ4NulgkiTn1O8FFUA42SJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nF1rwIiBmdMccnC6GLsJ+1cTxVIoLNBWUK2hRgllWz+vqzG3zn6qSGadd3ql/fc/j
	 wftmmd9opEasAb176XRKPUE8StMbl/6p+SplfVp5nf9nN1Js2h0Lp8VSMmtcQE30aH
	 Bl1zEaQxtIRA2e3e+l06MPu18XvsS1MAwBqoUlTwwd2s8vpthHuAcTJvSs6AHdaqC9
	 IvGbmsJblv3nhY89l91lTlG8IritYfepiywoeUokkcFJYOBd8jK3YPlU2kPdjCdp4y
	 HkLZ042uE8RsQsy76g2JHghhGJKUQuKXN/sEzVbuaQAH2qMCw8MbIO603QZ3+XYxw6
	 58WjXFSREqUIw==
Message-ID: <2157220c-0394-40fa-9918-a8514171bd10@gaisler.com>
Date: Tue, 27 Jan 2026 17:02:39 +0100
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
Cc: Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
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
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20260124095628.668870-1-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gaisler.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.f.9.b.1.2.0.0.4.9.4.0.4.2.asn6.rspamd.com:query timed out];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16324-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lis
 ts.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andreas@gaisler.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_PERMFAIL(0.00)[gaisler.com:s=simplycom2];
	FREEMAIL_CC(0.00)[alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	DKIM_TRACE(0.00)[gaisler.com:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[andreas@gaisler.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gaisler.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 666E59751A
X-Rspamd-Action: no action

On 2026-01-24 10:56, Mike Rapoport wrote:
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
>   parameters. Switching to a generic empty_zero_page removes the aliasing
>   and keeps ZERO_PGE for boot parameters only
> * arm64: uses __pa_symbol() in ZERO_PAGE() so that definition of
>   ZERO_PAGE() is kept intact.
> * m68k/parisc/sparc64/um: allocated empty_zero_page from memblock,
>   although they do not support zero page coloring and having it in BSS
>   will work fine.
> * sh: used empty_zero_page for boot parameters at the very early boot.
>   Rename the parameters page to boot_params_page and let sh use the generic
>   empty_zero_page.
> * hexagon: had an amusing comment about empty_zero_page
> 
> 	/* A handy thing to have if one has the RAM. Declared in head.S */
> 
>   that unfortunately had to go :)
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

Running this in an LDOM on an UltraSparc T4 sparc64, the entire LDOM
hangs after a while during boot.


> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index c2d19c9a9244..2bd99944176d 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -177,9 +177,6 @@ extern unsigned long sparc_ramdisk_image64;
>  extern unsigned int sparc_ramdisk_image;
>  extern unsigned int sparc_ramdisk_size;
>  
> -struct page *mem_map_zero __read_mostly;
> -EXPORT_SYMBOL(mem_map_zero);
> -
>  unsigned int sparc64_highest_unlocked_tlb_ent __read_mostly;
>  
>  unsigned long sparc64_kern_pri_context __read_mostly;
> @@ -2506,18 +2503,6 @@ void __init mem_init(void)
>  	 */
>  	register_page_bootmem_info();
>  
> -	/*
> -	 * Set up the zero page, mark it reserved, so that page count
> -	 * is not manipulated when freeing the page from user ptes.
> -	 */
> -	mem_map_zero = alloc_pages(GFP_KERNEL|__GFP_ZERO, 0);
> -	if (mem_map_zero == NULL) {
> -		prom_printf("paging_init: Cannot alloc zero page.\n");
> -		prom_halt();
> -	}
> -	mark_page_reserved(mem_map_zero);
> -
> -
>  	if (tlb_type == cheetah || tlb_type == cheetah_plus)
>  		cheetah_ecache_flush_init();
>  }

This just removes the mark_page_reserved(mem_map_zero) without 
replacing it with something corresponding to that. Perhaps part
of the problem?

Cheers,
Andreas


