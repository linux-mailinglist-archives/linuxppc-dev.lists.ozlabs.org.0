Return-Path: <linuxppc-dev+bounces-17196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALkwIJIin2mPZAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 17:25:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3CB19A934
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 17:25:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLg1p19Cfz3f62;
	Thu, 26 Feb 2026 03:25:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772036750;
	cv=none; b=DZO2bJvlnuFch8QpuISZJwxMx7PSMTG3PSubYMrFC2DQ+Mwio9REkyjNiLigJDYnnIzkd+r6+DkBbUAyR801aimw3MwjAMQ2jGU3OSSSmOdG/B4QFMjQCAplE0vZbQbJi7TdGuxRpiSelkBufJynZahVis7Xix4/LRRgeb1+I3gyHDwl4/+Yhbn0buYyZ+DkqUP1K8vlCnaUh4a2DXvjn4I0PEIF/ZDUp6a/HVDpik5kowvf21QunJJd3tDEe9evprvw1TQ/amxDjnt9QfnHGyFY2cVbXT1ocihWh8rE2YD5Jkl8gQOg2eiZWcI+sO6mnxLXq+1pJqFRh8xsADd7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772036750; c=relaxed/relaxed;
	bh=Ho7oD4oPu5/eYCdKSOQS6EY6Lbkwk1pVey6+CNgj1os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKfKF9YqyJWZU3WxubBJZ04SAL9BNEby2Snm/j+gPqH5AtbC9HyVMYHXlXVON4ZOO7oRmF375QKYnGNBgH4RzLtXjMTXq14HrdrpgfRaK0/MJDi2m/OW9H6tIamidk5iY3OaSHvEEyUNNLlVJabmBmkKIEm81IVEf0os6GIZ/upTtEa5gG0mkMcRfkAs7YP5y9CIlhgo2Q0W7kWoVZ1OLe95C389GSUl1xbny4i0JgLM/6K5TtvfpLGGgQDnc3IHEPS2N6VH6jwbFpF7fCmFHgIAvqob7/29t7/Lg4RMr5t6rwkM9vcl5ROrRyK7CP4Lv6LqmjhRndVm0wCHKebwAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cULZ5qEP; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cULZ5qEP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLg1n0H9hz3f57
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 03:25:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCF4660126;
	Wed, 25 Feb 2026 16:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3776DC116D0;
	Wed, 25 Feb 2026 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772036745;
	bh=guCbsIDgg8ayG9mMMymVvi9nZm4Jxc5WYXcp2FwHotE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cULZ5qEPz3eS7I+Fsxr6miX8AP+0kVboSS3w9recg6hIWBQu8d492aJMKFAtePr5C
	 Yxw6zeIYl0NzkVTqOY+rZ3drD+EwjqMadIeU3+bhyJFoPCMVo0RZaVEqrkGtGCEwa4
	 bcriv7DhH2j0T9uGVeVdL+y8N8zL0iY2hVFSWAbADuMDI7VU71xE8IuqKkYJ+gZCsQ
	 xR3OY+ov4QmLACxJ9gpX2X8RBJq46iAC34jhNq6rOPIAXeo23p3YGZbABHQNK9QxkC
	 B70PkGx9oFgxrBgyJwJJ0C90f4GZTWG9hD7VkXOtmEBOVrFFkcSQg/ezo7Ywq0Uean
	 YvcAIzi1k5CAg==
Date: Wed, 25 Feb 2026 18:25:24 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Klara Modin <klarasmodin@gmail.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 24/29] arch, mm: consolidate initialization of SPARSE
 memory model
Message-ID: <aZ8idANginXzhf0_@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-25-rppt@kernel.org>
 <87tsv5h544.ritesh.list@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tsv5h544.ritesh.list@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17196-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:akpm@linux-foundation.org,m:alexs@kernel.org,m:agordeev@linux.ibm.com,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:chleroy@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:hca@linux.ibm.com,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:corbet@lwn.net,m:klarasmodin@gmail.com,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:palmer@dabbelt.com,m:pratyush@kernel.org,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tsbogend@alpha.franken.de,m:tglx@linutronix.de,m:gor@linux.ibm.com,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kern
 el.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-um@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:sparclinux@vger.kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,linux.ibm.com,gaisler.com,alien8.de,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,lwn.net,gmail.com,oracle.com,ellerman.id.au,suse.com,monstr.eu,linux.dev,suse.de,dabbelt.com,nod.at,armlinux.org.uk,google.com,alpha.franken.de,linutronix.de,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,kvack.org,lists.ozlabs.org,lists.linux.dev];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[66];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EC3CB19A934
X-Rspamd-Action: no action

Hello Ritesh,

On Wed, Feb 25, 2026 at 09:00:35AM +0530, Ritesh Harjani wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Every architecture calls sparse_init() during setup_arch() although the
> > data structures created by sparse_init() are not used until the
> > initialization of the core MM.
> >
> > Beside the code duplication, calling sparse_init() from architecture
> > specific code causes ordering differences of vmemmap and HVO initialization
> > on different architectures.
> >
> > Move the call to sparse_init() from architecture specific code to
> > free_area_init() to ensure that vmemmap and HVO initialization order is
> > always the same.
> >
> 
> Hello Mike,
> 
> [    0.000000][    T0] ------------[ cut here ]------------
> [    0.000000][    T0] WARNING: arch/powerpc/include/asm/io.h:879 at virt_to_phys+0x44/0x1b8, CPU#0: swapper/0
> [    0.000000][    T0] Modules linked in:
> [    0.000000][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-12139-gc57b1c00145a #31 PREEMPT
> [    0.000000][    T0] Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801200 0xf000006 of:SLOF,git-ee03ae pSeries
> [    0.000000][    T0] NIP:  c000000000601584 LR: c000000004075de4 CTR: c000000000601548
> [    0.000000][    T0] REGS: c000000004d1f870 TRAP: 0700   Not tainted  (6.19.0-12139-gc57b1c00145a)
> [    0.000000][    T0] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 48022448  XER: 20040000
> [    0.000000][    T0] CFAR: c0000000006016c4 IRQMASK: 1
> [    0.000000][    T0] GPR00: c000000004075dd4 c000000004d1fb10 c00000000304bb00 c000000180000000
> [    0.000000][    T0] GPR04: 0000000000000009 0000000000000009 c000000004ec94a0 0000000000000000
> [    0.000000][    T0] GPR08: 0000000000018000 0000000000000001 c000000004921280 0000000048022448
> [    0.000000][    T0] GPR12: c000000000601548 c000000004fe0000 0000000000000004 0000000000000004
> [    0.000000][    T0] GPR16: 000000000287fb08 0000000000000060 0000000000000002 0000000002831750
> [    0.000000][    T0] GPR20: 0000000002831778 fffffffffffffffd c000000004d78050 00000000051cbb00
> [    0.000000][    T0] GPR24: 0000000005a40008 c000000000000000 c000000000400000 0000000000000100
> [    0.000000][    T0] GPR28: c000000004d78050 0000000000000000 c000000004ecd4a8 0000000000000001
> [    0.000000][    T0] NIP [c000000000601584] virt_to_phys+0x44/0x1b8
> [    0.000000][    T0] LR [c000000004075de4] alloc_bootmem+0x144/0x1a8
> [    0.000000][    T0] Call Trace:
> [    0.000000][    T0] [c000000004d1fb50] [c000000004075dd4] alloc_bootmem+0x134/0x1a8
> [    0.000000][    T0] [c000000004d1fba0] [c000000004075fac] __alloc_bootmem_huge_page+0x164/0x230
> [    0.000000][    T0] [c000000004d1fbe0] [c000000004030bc4] alloc_bootmem_huge_page+0x44/0x138
> [    0.000000][    T0] [c000000004d1fc10] [c000000004076e48] hugetlb_hstate_alloc_pages+0x350/0x5ac
> [    0.000000][    T0] [c000000004d1fd30] [c0000000040782f0] hugetlb_bootmem_alloc+0x15c/0x19c
> [    0.000000][    T0] [c000000004d1fd70] [c00000000406d7b4] mm_core_init_early+0x7c/0xdf4
> [    0.000000][    T0] [c000000004d1ff30] [c000000004011d84] start_kernel+0xac/0xc58
> [    0.000000][    T0] [c000000004d1ffe0] [c00000000000e99c] start_here_common+0x1c/0x20
> [    0.000000][    T0] Code: 6129ffff 792907c6 6529ffff 6129ffff 7c234840 40810018 3d2201e8 3929a7a8 e9290000 7c291840 41810044 3be00001 <0b1f0000> 3d20bfff 6129ffff 792907c6
> 
> 
> I think this is happening because, now in mm_core_early_init(), the
> order of initialization between hugetlb_bootmem_alloc() and
> free_area_init() is reversed. Since free_area_init() -> sparse_init()
> is responsible for setting SECTIONS and vmemmap area. 
> 
> Then in alloc_bootmem() (from hugetlb_bootmem_alloc() path), it uses virt_to_phys(m)...
> 
> 			/*
> 			 * For pre-HVO to work correctly, pages need to be on
> 			 * the list for the node they were actually allocated
> 			 * from. That node may be different in the case of
> 			 * fallback by memblock_alloc_try_nid_raw. So,
> 			 * extract the actual node first.
> 			 */
> 			if (m)
> 				listnode = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));
> 
> 
> ... virt_to_phys on powerpc uses:
> 
> static inline unsigned long virt_to_phys(const volatile void * address)
> {
> 	WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && !virt_addr_valid(address));
> 
> 	return __pa((unsigned long)address);
> }
> 
> #define virt_addr_valid(vaddr)	({					\
> 	unsigned long _addr = (unsigned long)vaddr;			\
> 	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
> 	pfn_valid(virt_to_pfn((void *)_addr));				\
> })
> 
> 
> I think the above warning in dmesg gets printed from above WARN_ON, i.e.
> because pfn_valid() is false, since we haven't done sparse_init() yet.

Yes, I agree.
 
> So, what I wanted to check was - do you think instead of virt_to_phys(), we
> could directly use __pa() here() in mm/hugetlb.c, since these are
> memblock alloc addresses? i.e.: 
> 
> // alloc_bootmem():
> -   listnode = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));
> +   listnode = early_pfn_to_nid(PHYS_PFN(__pa(m)));
> 
> // __alloc_bootmem_huge_page():
> -   memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE),
> +   memblock_reserved_mark_noinit(__pa((void *)m + PAGE_SIZE),

It surely will work for powerpc :)
I checked the definitions of __pa() on other architectures and it seems the
safest and the easiest way to fix this.
 
Would you send a formal patch?

> Thoughts?
> 
> -ritesh

-- 
Sincerely yours,
Mike.

