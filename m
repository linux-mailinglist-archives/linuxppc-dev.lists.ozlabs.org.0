Return-Path: <linuxppc-dev+bounces-15109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8100DCECBE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 02:27:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhTj61ky3z2xs1;
	Thu, 01 Jan 2026 12:27:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767230874;
	cv=none; b=VcwZF6NBi3yB8IDRa7Omh4AMQfvldTGUKWD0GGJd2bnBbtufEZ4/C+H6aPeHOpE4k53S5fm0HMK7CLpPDMhCTIvsWPfq0mHzZsbmQCrHixlBEY7v+uXriASSdj3DGSBY1/mX5g/TTFy704MptHot5ZD5nmJpIU34JnIsEI5fHvlaVY3ZAGp/qjKEbn3et+CWZmW/EN5S8zMs2UP/ySSASLyA+ym/vAZR3u5MIQkvFvpRq8HDum2dQPLMNNRAsdTaimR0VVgaWyr9g2lcmqGrw0VlA+rCEG+eDg84FEhUYq2s0qvYrwHuR+tcig4n9QlK1wbAwz0B/ws4vlN0qu0NGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767230874; c=relaxed/relaxed;
	bh=GIZ2+TTs0EEoEyjGKcpoyL5C5f8RhmuxTK2sG/mfXjE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nGIqQO7Km2nJNW1fcl5djksoBDN50Ak7FLBntGQ9NNFYN5/xoGJzmljnWI+M9zzfkh+G7HLzwMh4bqMe1whoE8iTPh0HsIDDK528euqT2eQ+EEZkT0yKjaos91yTq18m0/UPGsPWjHtGmPskesXC3WGo6NyT3UglxeqrxuciyMg8kWuhF5VHwgEyxuqPBogvYs5IfijVoAoDikUhkTqp/XzyKnRUMuikHmiinlXWM4U+IMytsHh3osECKbluDdR9DXd+9qssSXEdUwOUjSLreNpPaD6D5p9PlWfv/kGyf7/+6XU333muYCICRwcH5w8nQcw9/EZwFK1j6ISFgO385A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=go9XllSI; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=go9XllSI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhTj35KFyz2xWP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jan 2026 12:27:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3163160008;
	Thu,  1 Jan 2026 01:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7ACC113D0;
	Thu,  1 Jan 2026 01:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767230836;
	bh=kfzq7OmA115iWgJ760zWgcONuzBXEf0EdKCppmYMA+4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=go9XllSISBYzAOyojV4kRDLc0Hnz1rcUEPO57TcB9+qJSNx41b/AgCw3COmwnxqiT
	 j7mZyPb6MMMoWfBvYMRKbnSkqA9aNlPjK8qN3O6fQrDlWlCfoS7A/tERDwbL0qwoSr
	 LfQqAcLLX+Rrl87zP58OiVxJMBgmW31R6wiBayKc=
Date: Wed, 31 Dec 2025 17:27:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, Dinh
 Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet
 <corbet@lwn.net>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Michal Simek <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, Oscar
 Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Pratyush
 Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Russell
 King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Suren
 Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily
 Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org,
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
Subject: Re: [PATCH 00/28] arch, mm: consolidate hugetlb early reservation
Message-Id: <20251231172714.a7fe44e856c14fdc8fe1cb43@linux-foundation.org>
In-Reply-To: <20251228124001.3624742-1-rppt@kernel.org>
References: <20251228124001.3624742-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 28 Dec 2025 14:39:30 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> Order in which early memory reservation for hugetlb happens depends on
> architecture, on configuration options and on command line parameters.
> 
> Some architectures rely on the core MM to call hugetlb_bootmem_alloc()
> while others call it very early to allow pre-allocation of HVO-style
> vmemmap.
> 
> When hugetlb_cma is supported by an architecture it is initialized during
> setup_arch() and then later hugetlb_init code needs to understand did it
> happen or not.
> 
> To make everything consistent and unified, both reservation of hugetlb
> memory from bootmem and creation of CMA areas for hugetlb must be called
> from core MM initialization and it would have been a simple change.
> However, HVO-style pre-initialization ordering requirements slightly
> complicate things and for HVO pre-init to work sparse and memory map should
> be initialized after hugetlb reservations.
> 
> This required pulling out the call to free_area_init() out of setup_arch()
> path and moving it MM initialization and this is what the first 23 patches
> do.
> 
> These changes are deliberately split into per-arch patches that change how
> the zone limits are calculated for each architecture and the patches 22 and
> 23 just remove the calls to free_area_init() and sprase_init() from arch/*.
> 
> Patch 24 is a simple cleanup for MIPS.
> 
> Patches 25 and 26 actually consolidate hugetlb reservations and patches 27
> and 28 perform some aftermath cleanups.

Thanks for the diligence - this can't have been the most exciting thing
to work on!

> I tried to trim the distribution list and although it's still quite long
> if you feel that someone was wrongly excluded please add them back.

I'll add these to mm.git's mm-new branch for some testing.  I'll
suppress the usual email storm because 41 * 28 is a lot of emails ;)

