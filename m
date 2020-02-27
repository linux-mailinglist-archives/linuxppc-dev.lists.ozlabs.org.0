Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B921713F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 10:18:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SnBy6wXFzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 20:18:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=LqZ40BV3; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Smb64B1BzDqnk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 19:50:26 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66C3C2467B;
 Thu, 27 Feb 2020 08:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582793424;
 bh=3TUHpXUbQiWINEYvkWLHV5i4L4XeTvzA8f61zC86hUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LqZ40BV3UtfEghlnUPWXWBsJFDSAO7LkQqjE4MyBCGfIko4QuZCxn23PStuQNx1cq
 tvT2jv5qJjkdWlq9d7ue7n4+FqXK4iHQUHRv2LG0NwyjK0dGeVNasttpjd5fI9PHcT
 er1rbsLlplzYI9Bv+wbujgi0e7G4RYfo2Y2xJgaE=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/14] asm-generic: remove pgtable-nop4d-hack.h
Date: Thu, 27 Feb 2020 10:46:07 +0200
Message-Id: <20200227084608.18223-14-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227084608.18223-1-rppt@kernel.org>
References: <20200227084608.18223-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Jonas Bonn <jonas@southpole.se>,
 linux-arch@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 James Morse <james.morse@arm.com>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

No architecture defines __ARCH_USE_5LEVEL_HACK and therefore
pgtable-nop4d-hack.h will be never actually included.

Remove it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/asm-generic/pgtable-nop4d-hack.h | 64 ------------------------
 include/asm-generic/pgtable-nopud.h      |  4 --
 2 files changed, 68 deletions(-)
 delete mode 100644 include/asm-generic/pgtable-nop4d-hack.h

diff --git a/include/asm-generic/pgtable-nop4d-hack.h b/include/asm-generic/pgtable-nop4d-hack.h
deleted file mode 100644
index 829bdb0d6327..000000000000
--- a/include/asm-generic/pgtable-nop4d-hack.h
+++ /dev/null
@@ -1,64 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _PGTABLE_NOP4D_HACK_H
-#define _PGTABLE_NOP4D_HACK_H
-
-#ifndef __ASSEMBLY__
-#include <asm-generic/5level-fixup.h>
-
-#define __PAGETABLE_PUD_FOLDED 1
-
-/*
- * Having the pud type consist of a pgd gets the size right, and allows
- * us to conceptually access the pgd entry that this pud is folded into
- * without casting.
- */
-typedef struct { pgd_t pgd; } pud_t;
-
-#define PUD_SHIFT	PGDIR_SHIFT
-#define PTRS_PER_PUD	1
-#define PUD_SIZE	(1UL << PUD_SHIFT)
-#define PUD_MASK	(~(PUD_SIZE-1))
-
-/*
- * The "pgd_xxx()" functions here are trivial for a folded two-level
- * setup: the pud is never bad, and a pud always exists (as it's folded
- * into the pgd entry)
- */
-static inline int pgd_none(pgd_t pgd)		{ return 0; }
-static inline int pgd_bad(pgd_t pgd)		{ return 0; }
-static inline int pgd_present(pgd_t pgd)	{ return 1; }
-static inline void pgd_clear(pgd_t *pgd)	{ }
-#define pud_ERROR(pud)				(pgd_ERROR((pud).pgd))
-
-#define pgd_populate(mm, pgd, pud)		do { } while (0)
-#define pgd_populate_safe(mm, pgd, pud)		do { } while (0)
-/*
- * (puds are folded into pgds so this doesn't get actually called,
- * but the define is needed for a generic inline function.)
- */
-#define set_pgd(pgdptr, pgdval)	set_pud((pud_t *)(pgdptr), (pud_t) { pgdval })
-
-static inline pud_t *pud_offset(pgd_t *pgd, unsigned long address)
-{
-	return (pud_t *)pgd;
-}
-
-#define pud_val(x)				(pgd_val((x).pgd))
-#define __pud(x)				((pud_t) { __pgd(x) })
-
-#define pgd_page(pgd)				(pud_page((pud_t){ pgd }))
-#define pgd_page_vaddr(pgd)			(pud_page_vaddr((pud_t){ pgd }))
-
-/*
- * allocating and freeing a pud is trivial: the 1-entry pud is
- * inside the pgd, so has no extra memory associated with it.
- */
-#define pud_alloc_one(mm, address)		NULL
-#define pud_free(mm, x)				do { } while (0)
-#define __pud_free_tlb(tlb, x, a)		do { } while (0)
-
-#undef  pud_addr_end
-#define pud_addr_end(addr, end)			(end)
-
-#endif /* __ASSEMBLY__ */
-#endif /* _PGTABLE_NOP4D_HACK_H */
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index d3776cb494c0..ad05c1684bfc 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -4,9 +4,6 @@
 
 #ifndef __ASSEMBLY__
 
-#ifdef __ARCH_USE_5LEVEL_HACK
-#include <asm-generic/pgtable-nop4d-hack.h>
-#else
 #include <asm-generic/pgtable-nop4d.h>
 
 #define __PAGETABLE_PUD_FOLDED 1
@@ -65,5 +62,4 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 #define pud_addr_end(addr, end)			(end)
 
 #endif /* __ASSEMBLY__ */
-#endif /* !__ARCH_USE_5LEVEL_HACK */
 #endif /* _PGTABLE_NOPUD_H */
-- 
2.24.0

