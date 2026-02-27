Return-Path: <linuxppc-dev+bounces-17425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Pr7AUf/oWl4yAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:32:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921AD1BDAA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 21:32:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fN0Ny6Y64z30Sv;
	Sat, 28 Feb 2026 07:32:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772224322;
	cv=none; b=Lj2RBiskOJ6gHgEq9x+OUiq6Rx2DjDty0YVE2SINW+RUC8JasvUKLuyQjJthZpn9jdv+DqsBVQVhfqqMte7jAlwN844snc5sgCdqul8xdVK63T3sTVkvXAxO95pAhwnmmJbLBasQ/ZPuiJkeKBoLtdWEBu7/SaS8DU5d3QleTyhHtju1rzTi8OJp5LvIDW8H1IEvNk6SpbjAcXEwHx5ew69vvRuGLqX58MjHyLAd++l//aLwEp1Ivym8hQRfe6pADsna00U76RhUokDw0MdzYZ5QO9wUbk4yO90KbYP1QTGq1tcjOb8nP1FTD2m476oF/TNVNDDXI0BIeP6KG2MVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772224322; c=relaxed/relaxed;
	bh=HAcmYxQyGIzXk3g2T2QkeEz1xqCTs6mD3orFZBdIEmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaZqT/yVsMhfU6vauPGCnpV6czpCJQi4qc5OAQ4inMABa9CNcTwH0RnR8JjtkqYuFZuC9XUBtfD8GgkcmFwV5wLkh2340W5xmWZLooBxGn7QOhEYNF+fdt1Zmk0FAy/hf6Wm2AYHzOjYYkMkptlAgRrGq2zfBnvlVxm75IDQZdXCzUsYAz6LVG8JYyBJS0ETI4Qt1mK8yhRm9nguul2T+yZAM8Soe74qGLewckAts1DsWJ2eajcvvhOdTBD/0JiAmbQjtxBDM1vGmbPjUAsdnrim0NzwFH8ZdLkxesLHbiglQvad/yqojHKn1wJKSeKrsamnLariiDzjMf29b2IRlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kyuHOhzj; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kyuHOhzj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fN0Nx5nFSz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 07:32:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A889F4415A;
	Fri, 27 Feb 2026 20:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BD0C116C6;
	Fri, 27 Feb 2026 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772224318;
	bh=GsGJcM5lC5dbmgIT+M4WfJsd6FtHP9AI7W3MvjVlZXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyuHOhzjPeaL9ZBX8v9BFk4Vl1+Z8aFaC9olyQsYhW+BEPn4gG+OirqiS0vjY7wSh
	 08AMVtHAdfLIukZECBbxqF78N9qGu5FW8Bt5tRmyiQAQYFEw5wxcQuuzR9pqH6WqJw
	 r3wShM1wgJAs/WfWXNGcQSjs2IlTlepCJqMP4x/V5zu2VMrV5sMU8NMr+KOPjW/OyS
	 itN52VkP0EjHt7tbTWQfjPdKlfT5854ZDrWUbFljsH2eAU+gk+L6ltqkFxDegpDUJq
	 GyMKzPup//vrXRRmPfxpL1HVKDjePjl8VyB6YHiKhoq6Y49SPP4z4wQTNnR2bzJ/f2
	 3gdeO5LHu2EBQ==
Date: Fri, 27 Feb 2026 22:31:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 23/29] arch, mm: consolidate initialization of nodes,
 zones and memory map
Message-ID: <aaH_LVnl8FlERA_r@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-24-rppt@kernel.org>
 <b9527ed4-7a5c-42e9-8814-b276b3741f63@suse.cz>
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
In-Reply-To: <b9527ed4-7a5c-42e9-8814-b276b3741f63@suse.cz>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17425-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,linux.ibm.com,gaisler.com,alien8.de,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,lwn.net,gmail.com,oracle.com,ellerman.id.au,suse.com,monstr.eu,linux.dev,suse.de,dabbelt.com,nod.at,armlinux.org.uk,google.com,alpha.franken.de,linutronix.de,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,kvack.org,lists.ozlabs.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vbabka@suse.cz,m:akpm@linux-foundation.org,m:alexs@kernel.org,m:agordeev@linux.ibm.com,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:chleroy@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:hca@linux.ibm.com,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:corbet@lwn.net,m:klarasmodin@gmail.com,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:palmer@dabbelt.com,m:pratyush@kernel.org,m:richard@nod.at,m:ritesh.list@gmail.com,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tsbogend@alpha.franken.de,m:tglx@linutronix.de,m:gor@linux.ibm.com,m:vgupta@kernel.org,m:will@kern
 el.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-um@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[66];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 921AD1BDAA8
X-Rspamd-Action: no action

Hi Vlastimil,

On Fri, Feb 27, 2026 at 04:14:42PM +0100, Vlastimil Babka wrote:
> On 1/11/26 09:20, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > To initialize node, zone and memory map data structures every architecture
> > calls free_area_init() during setup_arch() and passes it an array of zone
> > limits.
> > 
> > Beside code duplication it creates "interesting" ordering cases between
> > allocation and initialization of hugetlb and the memory map. Some
> > architectures allocate hugetlb pages very early in setup_arch() in certain
> > cases, some only create hugetlb CMA areas in setup_arch() and sometimes
> > hugetlb allocations happen mm_core_init().
> > 
> > With arch_zone_limits_init() helper available now on all architectures it
> > is no longer necessary to call free_area_init() from architecture setup
> > code. Rather core MM initialization can call arch_zone_limits_init() in a
> > single place.
> > 
> > This allows to unify ordering of hugetlb vs memory map allocation and
> > initialization.
> > 
> > Remove the call to free_area_init() from architecture specific code and
> > place it in a new mm_core_init_early() function that is called immediately
> > after setup_arch().
> > 
> > After this refactoring it is possible to consolidate hugetlb allocations
> > and eliminate differences in ordering of hugetlb and memory map
> > initialization among different architectures.
> > 
> > As the first step of this consolidation move hugetlb_bootmem_alloc() to
> > mm_core_early_init().
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> I've bisected a problem with virtme-ng testing a NUMA memoryless
> node setup (on x86_64) to this patch (commit d49004c5f0c1).
> 
> It's executed like this, where node 0 has memory and node 1 only cpus:
> 
> vng -vr . -p 8 -m 4G --numa 4G,cpus=0-3 --numa 0,cpus=4-7
> 
> This fails to boot due to:
> 
> [    0.095894] BUG: unable to handle page fault for address: 0000000000004620
> [    0.097196] #PF: supervisor read access in kernel mode
> [    0.098180] #PF: error_code(0x0000) - not-present page
> [    0.099155] PGD 0 P4D 0 
> [    0.099641] Oops: Oops: 0000 [#1] SMP NOPTI
> [    0.100437] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc6-00152-gf206359553c9 #53 PREEMPT 
> [    0.102201] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.17.0-2-g4f253b9b-prebuilt.qemu.org 04/01/2014
> [    0.104313] RIP: 0010:mm_core_init_early+0x263/0x900
> [    0.105271] Code: 93 ff 72 09 8b 7c 24 30 e8 da 82 00 00 48 63 44 24 30 45 31 db 4c 8b 24 c5 a0 7b 1d 9a 48 89 c3 4c 89 5c 24 50 4c 89 5c 24 58 <41> 83 bc 24 20 46 00 00 00 75 0b 41 83 bc 24 14 47 00 00 00 74 04
> [    0.108863] RSP: 0000:ffffffff99403e38 EFLAGS: 00010046
> [    0.109861] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 0000000000000001
> [    0.111223] RDX: 0000000000000040 RSI: 0000000000100000 RDI: ffff89597fffae00
> [    0.112577] RBP: 0000000000000005 R08: 0000000000000000 R09: ffff89597fffa200
> [    0.113924] R10: 80000000ffffe000 R11: 0000000000000000 R12: 0000000000000000
> [    0.115294] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [    0.116656] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.118193] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.119283] CR2: 0000000000004620 CR3: 0000000060048000 CR4: 00000000000000b0
> [    0.120645] Call Trace:
> [    0.121122]  <TASK>
> [    0.121521]  start_kernel+0x5d/0x780
> [    0.122206]  x86_64_start_reservations+0x24/0x30
> [    0.123079]  x86_64_start_kernel+0xd1/0xe0
> [    0.123860]  common_startup_64+0x12c/0x138
> [    0.124641]  </TASK>
> [    0.125061] Modules linked in:
> [    0.125646] CR2: 0000000000004620
> [    0.126279] ---[ end trace 0000000000000000 ]---
> [    0.127162] RIP: 0010:mm_core_init_early+0x263/0x900
> [    0.128106] Code: 93 ff 72 09 8b 7c 24 30 e8 da 82 00 00 48 63 44 24 30 45 31 db 4c 8b 24 c5 a0 7b 1d 9a 48 89 c3 4c 89 5c 24 50 4c 89 5c 24 58 <41> 83 bc 24 20 46 00 00 00 75 0b 41 83 bc 24 14 47 00 00 00 74 04
> [    0.131676] RSP: 0000:ffffffff99403e38 EFLAGS: 00010046
> [    0.132684] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 0000000000000001
> [    0.134033] RDX: 0000000000000040 RSI: 0000000000100000 RDI: ffff89597fffae00
> [    0.135412] RBP: 0000000000000005 R08: 0000000000000000 R09: ffff89597fffa200
> [    0.136763] R10: 80000000ffffe000 R11: 0000000000000000 R12: 0000000000000000
> [    0.138112] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [    0.139487] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.141014] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.142094] CR2: 0000000000004620 CR3: 0000000060048000 CR4: 00000000000000b0
> [    0.143448] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.144833] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> 
> > ./scripts/faddr2line vmlinux mm_core_init_early+0x263/0x900
> mm_core_init_early+0x263/0x900:
> free_area_init_node at mm/mm_init.c:1721
> (inlined by) free_area_init at mm/mm_init.c:1902
> (inlined by) mm_core_init_early at mm/mm_init.c:2681
> 
> It crashes at WARN_ON(pgdat->nr_zones || pgdat->kswapd_highest_zoneidx);
> because pgdat is NULL.
> 
> With some debug printk's I've figured out that in free_area_init()
> we have:
> 
>                 if (!node_online(nid))
>                         alloc_offline_node_data(nid);
>              
>                 pgdat = NODE_DATA(nid);
>                 free_area_init_node(nid);
> 
> 
> But node_online() is true so this allocation doesn't happen, and
> pgdat remains NULL.
> 
> And node_online() becomes true in init_cpu_to_node():
> 
>                 if (!node_online(node))
>                         node_set_online(node);
> 
> But without having a pgdat allocated.
> 
> I was able to workaround this by changing the code in free_area_init() to
> 
>                if (!node_online(nid) || !NODE_DATA(nid))
>                         alloc_offline_node_data(nid);

if (!NODE_DATA(nid)) is enough ...
 
> But I don't have the bigger picture, and also didn't check yet what exactly
> about this patch results in the failure. Probably ordering of various related 
> actions. Thoughts?

... and there's a fix already in the mm-hotfixes-stable:

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-hotfixes-unstable&id=a4ab97e34bb687a2ca63fc70b47e8762e689797f

-- 
Sincerely yours,
Mike.

