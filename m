Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CFC445069
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 09:35:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlH5z4LHYz3c4y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 19:35:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wwJZHAwA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=wwJZHAwA; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlH4p3B9Xz2yPp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 19:34:50 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4A58611CB;
 Thu,  4 Nov 2021 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636014888;
 bh=GEv5xuuTebeMrb1u1aiDnK4knfQaEdc4Qr1xwX/fGyo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=wwJZHAwACtd1UwthM2Pl6mRD0qqhlu9xvAPxbN9NaDPzEkLHpjGGvRbPNg2iKlSqQ
 Jo/ceOEuuJu3gxX+Y+RADGhh5PMKusbzzVNNc0h4hVVK2ri0YXj1eV5ik5dq3rHp8l
 mYlTG6mBp+3mbgBTLj8NgEAwa/YDxcLniF2t+DZc=
Subject: Patch "mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS" has been
 added to the 4.9-stable tree
To: arnd@arndb.de, benh@kernel.crashing.org, bp@suse.de, f.fainelli@gmail.com,
 gregkh@linuxfoundation.org, hpa@zytor.com, kirill.shutemov@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org,
 linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, linux@armlinux.org.uk,
 linuxppc-dev@lists.ozlabs.org, luto@amacapital.net, minchan@kernel.org,
 mingo@kernel.org, mingo@redhat.com, mpe@ellerman.id.au, ngupta@vflare.org,
 paulus@samba.org, peterz@infradead.org, ralf@linux-mips.org,
 rppt@linux.ibm.com, sashal@kernel.org, sergey.senozhatsky.work@gmail.com,
 stefan@agner.ch, tglx@linutronix.de, torvalds@linux-foundation.org,
 tsbogend@alpha.franken.de, vgupta@synopsys.com, x86@kernel.org
From: <gregkh@linuxfoundation.org>
Date: Thu, 04 Nov 2021 09:34:37 +0100
In-Reply-To: <20211103205714.374801-2-f.fainelli@gmail.com>
Message-ID: <16360148778012@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mm-zsmalloc-prepare-to-variable-max_physmem_bits.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Thu Nov  4 09:33:49 AM CET 2021
From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed,  3 Nov 2021 13:57:13 -0700
Subject: mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS
To: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Nitin Gupta <ngupta@vflare.org>, Minchan Kim <minchan@kernel.org>, Andy Lutomirski <luto@amacapital.net>, Borislav Petkov <bp@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linux-mm@kvack.org, Ingo Molnar <mingo@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Ralf Baechle <ralf@linux-mips.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)), Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer <tsb
 ogend@alpha.franken.de>, Mike Rapoport <rppt@linux.ibm.com>, Stefan Agner <stefan@agner.ch>, linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE), linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT), linux-mips@linux-mips.org (open list:MIPS), linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)), linux-arch@vger.kernel.org (open list:GENERIC INCLUDE/ASM HEADER FILES)
Message-ID: <20211103205714.374801-2-f.fainelli@gmail.com>

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

commit 02390b87a9459937cdb299e6b34ff33992512ec7 upstream

With boot-time switching between paging mode we will have variable
MAX_PHYSMEM_BITS.

Let's use the maximum variable possible for CONFIG_X86_5LEVEL=y
configuration to define zsmalloc data structures.

The patch introduces MAX_POSSIBLE_PHYSMEM_BITS to cover such case.
It also suits well to handle PAE special case.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Nitin Gupta <ngupta@vflare.org>
Acked-by: Minchan Kim <minchan@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Borislav Petkov <bp@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mm@kvack.org
Link: http://lkml.kernel.org/r/20180214111656.88514-3-kirill.shutemov@linux.intel.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
[florian: drop arch/x86/include/asm/pgtable_64_types.h changes since
there is no CONFIG_X86_5LEVEL]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/include/asm/pgtable-3level_types.h |    1 +
 mm/zsmalloc.c                               |   13 +++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

--- a/arch/x86/include/asm/pgtable-3level_types.h
+++ b/arch/x86/include/asm/pgtable-3level_types.h
@@ -42,5 +42,6 @@ typedef union {
  */
 #define PTRS_PER_PTE	512
 
+#define MAX_POSSIBLE_PHYSMEM_BITS	36
 
 #endif /* _ASM_X86_PGTABLE_3LEVEL_DEFS_H */
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -83,18 +83,19 @@
  * This is made more complicated by various memory models and PAE.
  */
 
-#ifndef MAX_PHYSMEM_BITS
-#ifdef CONFIG_HIGHMEM64G
-#define MAX_PHYSMEM_BITS 36
-#else /* !CONFIG_HIGHMEM64G */
+#ifndef MAX_POSSIBLE_PHYSMEM_BITS
+#ifdef MAX_PHYSMEM_BITS
+#define MAX_POSSIBLE_PHYSMEM_BITS MAX_PHYSMEM_BITS
+#else
 /*
  * If this definition of MAX_PHYSMEM_BITS is used, OBJ_INDEX_BITS will just
  * be PAGE_SHIFT
  */
-#define MAX_PHYSMEM_BITS BITS_PER_LONG
+#define MAX_POSSIBLE_PHYSMEM_BITS BITS_PER_LONG
 #endif
 #endif
-#define _PFN_BITS		(MAX_PHYSMEM_BITS - PAGE_SHIFT)
+
+#define _PFN_BITS		(MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT)
 
 /*
  * Memory for allocating for handle keeps object position by


Patches currently in stable-queue which might be from f.fainelli@gmail.com are

queue-4.9/mm-zsmalloc-prepare-to-variable-max_physmem_bits.patch
queue-4.9/arch-pgtable-define-max_possible_physmem_bits-where-needed.patch
