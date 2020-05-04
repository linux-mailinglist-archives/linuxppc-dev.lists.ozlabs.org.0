Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E41C3EC9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 17:42:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G6Y75GYwzDqWg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 01:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=r4eFD/8M; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G6V42yKVzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 01:39:23 +1000 (AEST)
Received: from kernel.org (unknown [87.71.57.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB3FF206D7;
 Mon,  4 May 2020 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588606761;
 bh=K3AQD4/kSurqTKgiy9tnhsUhrYGtu7oPwWRQzafMBDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r4eFD/8M6rkpVhWGJCM/XtjuL/CEeeN7FuJSwVNx6NS+9s41kdKOpAfrpyLGuvIjw
 Dsuxy71lGNPG6A1BQVCQEZ5Cg17/+/r+5sTXhGv9TOpm3Ji63adplTBcIG0ncWkgZc
 n7BzNcKe3WYWVs/gQPxwA3v+UREC5VfAHR93vTCo=
Date: Mon, 4 May 2020 18:39:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 17/20] mm: free_area_init: allow defining max_zone_pfn
 in descending order
Message-ID: <20200504153901.GM14260@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
 <20200503174138.GA114085@roeck-us.net>
 <20200503184300.GA154219@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200503184300.GA154219@roeck-us.net>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Nick Hu <nickhu@andestech.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Qian Cai <cai@lca.pw>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, Brian Cain <bcain@codeaurora.org>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 03, 2020 at 11:43:00AM -0700, Guenter Roeck wrote:
> On Sun, May 03, 2020 at 10:41:38AM -0700, Guenter Roeck wrote:
> > Hi,
> > 
> > On Wed, Apr 29, 2020 at 03:11:23PM +0300, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > 
> > > Some architectures (e.g. ARC) have the ZONE_HIGHMEM zone below the
> > > ZONE_NORMAL. Allowing free_area_init() parse max_zone_pfn array even it is
> > > sorted in descending order allows using free_area_init() on such
> > > architectures.
> > > 
> > > Add top -> down traversal of max_zone_pfn array in free_area_init() and use
> > > the latter in ARC node/zone initialization.
> > > 
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > This patch causes my microblazeel qemu boot test in linux-next to fail.
> > Reverting it fixes the problem.
> > 
> The same problem is seen with s390 emulations.

Yeah, this patch breaks some others as well :(

My assumption that max_zone_pfn defines architectural limit for maximal
PFN that can belong to a zone was over-optimistic. Several arches
actually do that, but others do

	max_zone_pfn[ZONE_DMA] = MAX_DMA_PFN;
	max_zone_pfn[ZONE_NORMAL] = max_pfn;

where MAX_DMA_PFN is build-time constrain and max_pfn is run time limit
for the current system.

So, when max_pfn is lower than MAX_DMA_PFN, the free_init_area() will
consider max_zone_pfn as descending and will wrongly calculate zone
extents.

That said, instead of trying to create a generic way to special case
ARC, I suggest to simply use the below patch instead.

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 41eb9be1653c..386959bac3d2 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -77,6 +77,11 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 		base, TO_MB(size), !in_use ? "Not used":"");
 }
 
+bool arch_has_descending_max_zone_pfns(void)
+{
+	return true;
+}
+
 /*
  * First memory setup routine called from setup_arch()
  * 1. setup swapper's mm @init_mm
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b990e9734474..114f0e027144 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7307,6 +7307,15 @@ static void check_for_memory(pg_data_t *pgdat, int nid)
 	}
 }
 
+/*
+ * Some architecturs, e.g. ARC may have ZONE_HIGHMEM below ZONE_NORMAL. For
+ * such cases we allow max_zone_pfn sorted in the descending order
+ */
+bool __weak arch_has_descending_max_zone_pfns(void)
+{
+	return false;
+}
+
 /**
  * free_area_init - Initialise all pg_data_t and zone data
  * @max_zone_pfn: an array of max PFNs for each zone
@@ -7324,7 +7333,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 {
 	unsigned long start_pfn, end_pfn;
 	int i, nid, zone;
-	bool descending = false;
+	bool descending;
 
 	/* Record where the zone boundaries are */
 	memset(arch_zone_lowest_possible_pfn, 0,
@@ -7333,14 +7342,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 				sizeof(arch_zone_highest_possible_pfn));
 
 	start_pfn = find_min_pfn_with_active_regions();
-
-	/*
-	 * Some architecturs, e.g. ARC may have ZONE_HIGHMEM below
-	 * ZONE_NORMAL. For such cases we allow max_zone_pfn sorted in the
-	 * descending order
-	 */
-	if (MAX_NR_ZONES > 1 && max_zone_pfn[0] > max_zone_pfn[1])
-		descending = true;
+	descending = arch_has_descending_max_zone_pfns();
 
 	for (i = 0; i < MAX_NR_ZONES; i++) {
 		if (descending)

> Guenter
> 
> > qemu command line:
> > 
> > qemu-system-microblazeel -M petalogix-ml605 -m 256 \
> > 	-kernel arch/microblaze/boot/linux.bin -no-reboot \
> > 	-initrd rootfs.cpio \
> > 	-append 'panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0,115200' \
> > 	-monitor none -serial stdio -nographic
> > 
> > initrd:
> > 	https://github.com/groeck/linux-build-test/blob/master/rootfs/microblazeel/rootfs.cpio.gz
> > configuration:
> > 	https://github.com/groeck/linux-build-test/blob/master/rootfs/microblazeel/qemu_microblazeel_ml605_defconfig
> > 
> > Bisect log is below.
> > 
> > Guenter
> > 
> > ---
> > # bad: [fb9d670f57e3f6478602328bbbf71138be06ca4f] Add linux-next specific files for 20200501
> > # good: [6a8b55ed4056ea5559ebe4f6a4b247f627870d4c] Linux 5.7-rc3
> > git bisect start 'HEAD' 'v5.7-rc3'
> > # good: [068b80b68a670f0b17288c8a3d1ee751f35162ab] Merge remote-tracking branch 'drm/drm-next'
> > git bisect good 068b80b68a670f0b17288c8a3d1ee751f35162ab
> > # good: [46c70fc6a3ac35cd72ddad248dcbe4eee716d2a5] Merge remote-tracking branch 'drivers-x86/for-next'
> > git bisect good 46c70fc6a3ac35cd72ddad248dcbe4eee716d2a5
> > # good: [f39c4ad479a2f005f972a2b941b40efa6b9c9349] Merge remote-tracking branch 'rpmsg/for-next'
> > git bisect good f39c4ad479a2f005f972a2b941b40efa6b9c9349
> > # bad: [165d3ee0162fe28efc2c8180176633e33515df15] ipc-convert-ipcs_idr-to-xarray-update
> > git bisect bad 165d3ee0162fe28efc2c8180176633e33515df15
> > # good: [001f1d211ed2ed0f005838dc4390993930bbbd69] mm: remove early_pfn_in_nid() and CONFIG_NODES_SPAN_OTHER_NODES
> > git bisect good 001f1d211ed2ed0f005838dc4390993930bbbd69
> > # bad: [aaad7401bd32f10c1d591dd886b3a9b9595c6d77] mm/vmsan: fix some typos in comment
> > git bisect bad aaad7401bd32f10c1d591dd886b3a9b9595c6d77
> > # bad: [09f9d0ab1fbed85623b283995aa7a7d78daa1611] khugepaged: allow to collapse PTE-mapped compound pages
> > git bisect bad 09f9d0ab1fbed85623b283995aa7a7d78daa1611
> > # bad: [c942fc8a3e5088407bc32d94f554bab205175f8a] mm/vmstat.c: do not show lowmem reserve protection information of empty zone
> > git bisect bad c942fc8a3e5088407bc32d94f554bab205175f8a
> > # bad: [b29358d269ace3826d8521bea842fc2984cfc11b] mm/page_alloc.c: rename free_pages_check() to check_free_page()
> > git bisect bad b29358d269ace3826d8521bea842fc2984cfc11b
> > # bad: [be0fb591a1f1df20a00c8f023f9ca4891f177b0d] mm: simplify find_min_pfn_with_active_regions()
> > git bisect bad be0fb591a1f1df20a00c8f023f9ca4891f177b0d
> > # bad: [c17422a008d36dcf3e9f51469758c5762716cb0a] mm: rename free_area_init_node() to free_area_init_memoryless_node()
> > git bisect bad c17422a008d36dcf3e9f51469758c5762716cb0a
> > # bad: [51a2f644fd020d5f090044825c388444d11029d5] mm: free_area_init: allow defining max_zone_pfn in descending order
> > git bisect bad 51a2f644fd020d5f090044825c388444d11029d5
> > # first bad commit: [51a2f644fd020d5f090044825c388444d11029d5] mm: free_area_init: allow defining max_zone_pfn in descending order

-- 
Sincerely yours,
Mike.
