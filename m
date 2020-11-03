Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DA22A4398
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 11:59:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQRd570LmzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 21:59:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=b6UWG1RX; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=7x5E7bhv; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQR2g0jCyzDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 21:33:30 +1100 (AEDT)
Message-Id: <20201103095856.979798613@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=oF4DYonwtBNvmWHcqJ3amZKMdxENJ+WTSLMv3+rtHDM=;
 b=b6UWG1RXLdBy2bRiDY0A2P6zUTcJ5Ww3Hloamuegv/bL3cd0Jtr2ttgYbbJrW5BYak/rkk
 PIZxdNYfysNFn3hkTOqqRZTgj7HKUJeNhycoOe7m3Id4B0EFsqDbR5SzgKvmyNco7YPeDJ
 7zGBcL24S5tqjz5nUv65X7+akcl8LQTNORQzEg/iFXRbEmU8I/BDt33Ieg2A5XD5DrODpw
 Mks84NTPIQAyqEH3f2oDzt/ae9t4w9OMJO+I7JYrxIGeYRIj6k6PPK6tR2mIaKluksa7bD
 OXSaYC6IDAc3KYdm99Ww55f3jctY1IJoZnRNbxPldLZF+7xYm+DqO5Hw2kBfKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=oF4DYonwtBNvmWHcqJ3amZKMdxENJ+WTSLMv3+rtHDM=;
 b=7x5E7bhvi7aofzhhPh9QlETURgTfsCteOpP5xZ/APbluJpgTom1zgixNGKJtT0nUZF2P72
 bnhVHwiHvnfzpbCg==
Date: Tue, 03 Nov 2020 10:27:16 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 04/37] sh/highmem: Remove all traces of unused cruft
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
X-Mailman-Approved-At: Tue, 03 Nov 2020 21:51:17 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For whatever reasons SH has highmem bits all over the place but does
not enable it via Kconfig. Remove the bitrot.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/sh/include/asm/fixmap.h     |    8 --------
 arch/sh/include/asm/kmap_types.h |   15 ---------------
 arch/sh/mm/init.c                |    8 --------
 3 files changed, 31 deletions(-)

--- a/arch/sh/include/asm/fixmap.h
+++ b/arch/sh/include/asm/fixmap.h
@@ -13,9 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/threads.h>
 #include <asm/page.h>
-#ifdef CONFIG_HIGHMEM
-#include <asm/kmap_types.h>
-#endif
 
 /*
  * Here we define all the compile-time 'special' virtual
@@ -53,11 +50,6 @@ enum fixed_addresses {
 	FIX_CMAP_BEGIN,
 	FIX_CMAP_END = FIX_CMAP_BEGIN + (FIX_N_COLOURS * NR_CPUS) - 1,
 
-#ifdef CONFIG_HIGHMEM
-	FIX_KMAP_BEGIN,	/* reserved pte's for temporary kernel mappings */
-	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_TYPE_NR * NR_CPUS) - 1,
-#endif
-
 #ifdef CONFIG_IOREMAP_FIXED
 	/*
 	 * FIX_IOREMAP entries are useful for mapping physical address
--- a/arch/sh/include/asm/kmap_types.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __SH_KMAP_TYPES_H
-#define __SH_KMAP_TYPES_H
-
-/* Dummy header just to define km_type. */
-
-#ifdef CONFIG_DEBUG_HIGHMEM
-#define  __WITH_KM_FENCE
-#endif
-
-#include <asm-generic/kmap_types.h>
-
-#undef __WITH_KM_FENCE
-
-#endif
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -362,9 +362,6 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 	pr_info("virtual kernel memory layout:\n"
 		"    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
-#ifdef CONFIG_HIGHMEM
-		"    pkmap   : 0x%08lx - 0x%08lx   (%4ld kB)\n"
-#endif
 		"    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
 		"    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB) (cached)\n"
 #ifdef CONFIG_UNCACHED_MAPPING
@@ -376,11 +373,6 @@ void __init mem_init(void)
 		FIXADDR_START, FIXADDR_TOP,
 		(FIXADDR_TOP - FIXADDR_START) >> 10,
 
-#ifdef CONFIG_HIGHMEM
-		PKMAP_BASE, PKMAP_BASE+LAST_PKMAP*PAGE_SIZE,
-		(LAST_PKMAP*PAGE_SIZE) >> 10,
-#endif
-
 		(unsigned long)VMALLOC_START, VMALLOC_END,
 		(VMALLOC_END - VMALLOC_START) >> 20,
 

