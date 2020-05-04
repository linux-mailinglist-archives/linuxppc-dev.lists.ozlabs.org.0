Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE65C1C48C7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 23:05:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GFkR3S1MzDqR6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 07:05:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2002:c35c:fd02::1;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GFgh4l7YzDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 07:03:12 +1000 (AEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jViEL-0010Kx-57; Mon, 04 May 2020 21:02:25 +0000
Date: Mon, 4 May 2020 22:02:25 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH V2 00/11] Subject: Remove duplicated kmap code
Message-ID: <20200504210225.GW23230@ZenIV.linux.org.uk>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504013509.GU23230@ZenIV.linux.org.uk>
 <20200504050447.GA979899@iweiny-DESK2.sc.intel.com>
 <20200504053357.GV23230@ZenIV.linux.org.uk>
 <20200504201740.GA985739@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504201740.GA985739@iweiny-DESK2.sc.intel.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 04, 2020 at 01:17:41PM -0700, Ira Weiny wrote:

> > || * arm: much, much worse.  We have several files that pull linux/highmem.h:
> > || arch/arm/mm/cache-feroceon-l2.c, arch/arm/mm/cache-xsc3l2.c,
> > || arch/arm/mm/copypage-*.c, arch/arm/mm/dma-mapping.c, arch/arm/mm/flush.c,
> > || arch/arm/mm/highmem.c, arch/arm/probes/uprobes/core.c,
> > || arch/arm/include/asm/kvm_mmu.h (kmap_atomic_pfn()).
> > || Those are fine, but we also have this:
> > || arch/arm/include/asm/pgtable.h:200:#define __pte_map(pmd)               (pte_t *)kmap_atomic(pmd_page(*(pmd)))
> > || arch/arm/include/asm/pgtable.h:208:#define pte_offset_map(pmd,addr)     (__pte_map(pmd) + pte_index(addr))
> > || and sure as hell, asm/pgtable.h does *NOT* pull linux/highmem.h.
> 
> It does not pull asm/highmem.h either...

No, but the users of those macros need to be considered.

> > || #define pte_offset_map(dir, addr)               \
> > ||         ((pte_t *) kmap_atomic(pmd_page(*(dir))) + pte_index(addr))
> > ||         One pte_offset_map user in arch/microblaze:
> > || arch/microblaze/kernel/signal.c:207:    ptep = pte_offset_map(pmdp, address);
> > || Messy, but doesn't require any changes (we have asm/pgalloc.h included
> > || there, and that pull linux/highmem.h).
> 
> AFAICS asm/pgtable.h does not include asm/highmem.h here...
> 
> So looks like arch/microblaze/kernel/signal.c will need linux/highmem.h

See above - line 39 in there is
#include <asm/pgalloc.h>
and line 14 in arch/microblaze/include/asm/pgalloc.h is
#include <linux/highmem.h>
It's conditional upon CONFIG_MMU in there, but so's the use of
pte_offset_map() in arch/microblaze/kernel/signal.c 

So it shouldn't be a problem.

> > || * xtensa: users in arch/xtensa/kernel/pci-dma.c, arch/xtensa/mm/highmem.c,
> > || arch/xtensa/mm/cache.c and arch/xtensa/platforms/iss/simdisk.c (all pull
> > || linux/highmem.h).
> 
> Actually
> 
> arch/xtensa/mm/cache.c gets linux/highmem.h from linux/pagemap.h
> 
> arch/xtensa/platforms/iss/simdisk.c may have an issue?
> 	linux/blkdev.h -> CONFIG_BLOCK -> linux/pagemap.h -> linux/highmem.h
> 	But simdisk.c requires BLK_DEV_SIMDISK -> CONFIG_BLOCK...
> 	<sigh>

Yep - see above re major chain of indirect includes conditional upon CONFIG_BLOCK
and its uses in places that only build with such configs.  There's a plenty of
similar considerations outside of arch/*, unfortunately...
