Return-Path: <linuxppc-dev+bounces-16268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAHRKGeXdGnG7gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 10:56:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E3F7D2B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 10:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyqvj33XMz2yDk;
	Sat, 24 Jan 2026 20:56:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769248609;
	cv=none; b=Y6Vxr6mi2RQroFsTUIgLiN6iVijG4YN4SJgVoYa50lADNc2wUjHoH4Y7OLytPTO42jNqzZ0D+xk3rV1czIqh/hRidTzZOII11DuET147/6qMQOG/Mi14ZIMuY1AVME2kKKpAuMWYwMJsNZTAZOT1HnrEugTPxuiHBxrhEwEsZmSP61C7Ee73Ewx97/ec0S5d8+Pe46EIM9gTUNFSdZCx20imQapeOqJu5X83eu15cDai7SpGPDHkV0WiS+VwkSfDGU7/jEMSahkVkXrWxKxOU+I0lZPkUKopw1d49Lm6O+I8OafiRO7R9yB/3rnZ7Fx90hmN9m7d5v04XLcn5f741w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769248609; c=relaxed/relaxed;
	bh=uNC6k7/2NhC0kTgnrR5yWjvOKToFA6JXbTzBYSsPnOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hgM3vDHSZrBvx5bh1kDY7EV4kqxi7c2jgv6SXpC6sjSusAi8+9abwCFD3Ba8tPspv/oGhDdNFfjRKAJHW/pPLwkthjxUp3c59H2Jg+P83C8ujPx/OfcTLiVcORzDuZ+EaGahVPshswM2hhkVZgfuUJE+QjXlQANuYi4QxBYE7J16wRzSVJl8rnmiBePcNOpkeA+VrO2PvxH5cQjtmn2b0AQ+eRYwmDSElnoMKaJpyWQALx4QipGzHjkifaskLcMfw4UoKGhEoz+lMuZ0u9tSVeV9TXjVtpTeWx8cdWzUALL2t/i5Z5FO4ozwFHiZ5wOi9uJvggmMr+de+Be4Kodx3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WBs0xJcC; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WBs0xJcC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyqvh1cgPz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 20:56:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B16AE60018;
	Sat, 24 Jan 2026 09:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC29C116D0;
	Sat, 24 Jan 2026 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769248604;
	bh=xmBgePQ0Wi76iJH328SSCvDYutkVN3tt0ESYDzUDhCg=;
	h=From:To:Cc:Subject:Date:From;
	b=WBs0xJcCvT8mtt8PyR34tLV7xHPERk2GEPwM9+tmvveEhTFTVZHIWyQm77SDLgFgC
	 yxEXD+iJs8PcKwIircCHuG+VJe8xDmk1RFfb9sFG96QOaMAp8MFJQmBHTJCaRoeuOv
	 xzdDbUY6odUjx/32ehxCIIsh1HU/ybg1IIE4fTtRKqziLv/w/zpJHFsdHfa9Xx6n38
	 cQI7rhDLd/qR96eHbZ8NR7Cf44Hix3R/pYtG8Oq6ftt2fxxSSYb5crVGG5W5qEBB0/
	 DXw2YLiLymNCoPGwfnZBEpzzrQf6pHCrV9gu8edI6atHWwMUM4VzYwuuyxLwiKK0yY
	 fZGxBGKvcttvw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH mm-unstable] arch, mm: consolidate empty_zero_page
Date: Sat, 24 Jan 2026 11:56:28 +0200
Message-ID: <20260124095628.668870-1-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16268-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:rppt@kernel.org,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linu
 x.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[52];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A2E3F7D2B0
X-Rspamd-Action: no action

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Reduce 22 declarations of empty_zero_page to 3 and 23 declarations of
ZERO_PAGE() to 4.

Every architecture defines empty_zero_page that way or another, but for the
most of them it is always a page aligned page in BSS and most definitions
of ZERO_PAGE do virt_to_page(empty_zero_page).

Move Linus vetted x86 definition of empty_zero_page and ZERO_PAGE() to the
core MM and drop these definitions in architectures that do not implement
colored zero page (MIPS and s390).

ZERO_PAGE() remains a macro because turning it to a wrapper for a static
inline causes severe pain in header dependencies.

For the most part the change is mechanical, with these being noteworthy:

* alpha: aliased empty_zero_page with ZERO_PGE that was also used for boot
  parameters. Switching to a generic empty_zero_page removes the aliasing
  and keeps ZERO_PGE for boot parameters only
* arm64: uses __pa_symbol() in ZERO_PAGE() so that definition of
  ZERO_PAGE() is kept intact.
* m68k/parisc/sparc64/um: allocated empty_zero_page from memblock,
  although they do not support zero page coloring and having it in BSS
  will work fine.
* sh: used empty_zero_page for boot parameters at the very early boot.
  Rename the parameters page to boot_params_page and let sh use the generic
  empty_zero_page.
* hexagon: had an amusing comment about empty_zero_page

	/* A handy thing to have if one has the RAM. Declared in head.S */

  that unfortunately had to go :)

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/alpha/include/asm/pgtable.h          |  6 ------
 arch/arc/include/asm/pgtable.h            |  3 ---
 arch/arc/mm/init.c                        |  2 --
 arch/arm/include/asm/pgtable.h            |  9 ---------
 arch/arm/mm/mmu.c                         |  7 -------
 arch/arm/mm/nommu.c                       |  7 -------
 arch/arm64/include/asm/pgtable.h          |  1 -
 arch/arm64/mm/mmu.c                       |  7 -------
 arch/csky/include/asm/pgtable.h           |  3 ---
 arch/csky/mm/init.c                       |  3 ---
 arch/hexagon/include/asm/pgtable.h        |  6 ------
 arch/hexagon/kernel/head.S                |  5 -----
 arch/hexagon/kernel/hexagon_ksyms.c       |  1 -
 arch/loongarch/include/asm/pgtable.h      |  9 ---------
 arch/loongarch/mm/init.c                  |  3 ---
 arch/m68k/include/asm/pgtable_mm.h        |  9 ---------
 arch/m68k/include/asm/pgtable_no.h        |  7 -------
 arch/m68k/mm/init.c                       |  9 ---------
 arch/m68k/mm/mcfmmu.c                     |  2 --
 arch/m68k/mm/motorola.c                   |  6 ------
 arch/m68k/mm/sun3mmu.c                    |  2 --
 arch/microblaze/include/asm/pgtable.h     | 10 ----------
 arch/microblaze/kernel/head.S             |  4 ----
 arch/microblaze/kernel/microblaze_ksyms.c |  2 --
 arch/nios2/include/asm/pgtable.h          |  7 -------
 arch/nios2/kernel/head.S                  | 10 ----------
 arch/nios2/kernel/nios2_ksyms.c           |  1 -
 arch/openrisc/include/asm/pgtable.h       |  4 ----
 arch/openrisc/kernel/head.S               |  3 ---
 arch/openrisc/kernel/or32_ksyms.c         |  1 -
 arch/openrisc/mm/init.c                   |  3 ---
 arch/parisc/include/asm/pgtable.h         | 11 -----------
 arch/parisc/mm/init.c                     |  6 ------
 arch/powerpc/include/asm/pgtable.h        |  6 ------
 arch/powerpc/mm/mem.c                     |  3 ---
 arch/riscv/include/asm/pgtable.h          |  7 -------
 arch/riscv/mm/init.c                      |  4 ----
 arch/sh/include/asm/pgtable.h             |  8 --------
 arch/sh/include/asm/setup.h               |  3 ++-
 arch/sh/kernel/head_32.S                  |  4 ++--
 arch/sh/kernel/sh_ksyms_32.c              |  1 -
 arch/sh/mm/init.c                         |  1 -
 arch/sparc/include/asm/pgtable_32.h       |  8 --------
 arch/sparc/include/asm/pgtable_64.h       |  3 ---
 arch/sparc/include/asm/setup.h            |  2 --
 arch/sparc/kernel/head_32.S               |  7 -------
 arch/sparc/mm/init_32.c                   |  4 ----
 arch/sparc/mm/init_64.c                   | 15 ---------------
 arch/um/include/asm/pgtable.h             |  9 ---------
 arch/um/include/shared/kern_util.h        |  1 -
 arch/um/kernel/mem.c                      | 16 ----------------
 arch/um/kernel/um_arch.c                  |  1 -
 arch/x86/include/asm/pgtable.h            |  8 --------
 arch/x86/kernel/head_32.S                 |  4 ----
 arch/x86/kernel/head_64.S                 |  7 -------
 arch/xtensa/include/asm/pgtable.h         |  4 ----
 arch/xtensa/kernel/head.S                 |  3 ---
 arch/xtensa/kernel/xtensa_ksyms.c         |  2 --
 include/linux/pgtable.h                   |  8 ++++++++
 mm/mm_init.c                              |  9 +++++++++
 60 files changed, 21 insertions(+), 296 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 90e7a9539102..12a3c5f8ece8 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -125,12 +125,6 @@ struct vm_area_struct;
  */
 #define pgprot_noncached(prot)	(prot)
 
-/*
- * ZERO_PAGE is a global shared page that is always zero:  used
- * for zero-mapped memory areas etc..
- */
-#define ZERO_PAGE(vaddr)	(virt_to_page(ZERO_PGE))
-
 /*
  * On certain platforms whose physical address space can overlap KSEG,
  * namely EV6 and above, we must re-twiddle the physaddr to restore the
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index bd580e2b62d7..0fdaea81b5fa 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -21,9 +21,6 @@
 
 #ifndef __ASSEMBLER__
 
-extern char empty_zero_page[PAGE_SIZE];
-#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
-
 extern pgd_t swapper_pg_dir[] __aligned(PAGE_SIZE);
 
 /* to cope with aliasing VIPT cache */
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index a5e92f46e5d1..d6b5c27a0098 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -19,8 +19,6 @@
 #include <asm/arcregs.h>
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __aligned(PAGE_SIZE);
-char empty_zero_page[PAGE_SIZE] __aligned(PAGE_SIZE);
-EXPORT_SYMBOL(empty_zero_page);
 
 static const unsigned long low_mem_start = CONFIG_LINUX_RAM_BASE;
 static unsigned long low_mem_sz;
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 6fa9acd6a7f5..982795cf4563 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -10,15 +10,6 @@
 #include <linux/const.h>
 #include <asm/proc-fns.h>
 
-#ifndef __ASSEMBLY__
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
-#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
-#endif
-
 #include <asm-generic/pgtable-nopud.h>
 
 #ifndef CONFIG_MMU
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 518def8314e7..23b87b5ef7f1 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -41,13 +41,6 @@
 
 extern unsigned long __atags_pointer;
 
-/*
- * empty_zero_page is a special page that is used for
- * zero-initialized data and COW.
- */
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
-EXPORT_SYMBOL(empty_zero_page);
-
 /*
  * The pmd table for the upper-most set of pages.
  */
diff --git a/arch/arm/mm/nommu.c b/arch/arm/mm/nommu.c
index 7e42d8accec6..040ea43cce32 100644
--- a/arch/arm/mm/nommu.c
+++ b/arch/arm/mm/nommu.c
@@ -27,13 +27,6 @@
 
 unsigned long vectors_base;
 
-/*
- * empty_zero_page is a special page that is used for
- * zero-initialized data and COW.
- */
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
-EXPORT_SYMBOL(empty_zero_page);
-
 #ifdef CONFIG_ARM_MPU
 struct mpu_rgn_info mpu_rgn_info;
 #endif
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a17eb8a76788..516147f06fe8 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -110,7 +110,6 @@ static inline void arch_leave_lazy_mmu_mode(void)
  * ZERO_PAGE is a global shared page that is always zero: used
  * for zero-mapped memory areas etc..
  */
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #define ZERO_PAGE(vaddr)	phys_to_page(__pa_symbol(empty_zero_page))
 
 #define pte_ERROR(e)	\
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a6a00accf4f9..0f6a171faf1f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -64,13 +64,6 @@ static bool rodata_is_rw __ro_after_init = true;
  */
 long __section(".mmuoff.data.write") __early_cpu_boot_status;
 
-/*
- * Empty_zero_page is a special page that is used for zero-initialized data
- * and COW.
- */
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
-EXPORT_SYMBOL(empty_zero_page);
-
 static DEFINE_SPINLOCK(swapper_pgdir_lock);
 static DEFINE_MUTEX(fixmap_lock);
 
diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index d606afbabce1..bafcd5823531 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -76,9 +76,6 @@
 #define MAX_SWAPFILES_CHECK() \
 		BUILD_BUG_ON(MAX_SWAPFILES_SHIFT != 5)
 
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
-#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
-
 extern void load_pgd(unsigned long pg_dir);
 extern pte_t invalid_pte_table[PTRS_PER_PTE];
 
diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
index 573da66b2543..fa16015ea1c0 100644
--- a/arch/csky/mm/init.c
+++ b/arch/csky/mm/init.c
@@ -38,9 +38,6 @@ pte_t invalid_pte_table[PTRS_PER_PTE] __page_aligned_bss;
 pte_t kernel_pte_tables[PTRS_KERN_TABLE] __page_aligned_bss;
 
 EXPORT_SYMBOL(invalid_pte_table);
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
-						__page_aligned_bss;
-EXPORT_SYMBOL(empty_zero_page);
 
 void free_initmem(void)
 {
diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/asm/pgtable.h
index fbf24d1d1ca6..27b269e2870d 100644
--- a/arch/hexagon/include/asm/pgtable.h
+++ b/arch/hexagon/include/asm/pgtable.h
@@ -14,9 +14,6 @@
 #include <asm/page.h>
 #include <asm-generic/pgtable-nopmd.h>
 
-/* A handy thing to have if one has the RAM. Declared in head.S */
-extern unsigned long empty_zero_page;
-
 /*
  * The PTE model described here is that of the Hexagon Virtual Machine,
  * which autonomously walks 2-level page tables.  At a lower level, we
@@ -348,9 +345,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	return (unsigned long)__va(pmd_val(pmd) & PAGE_MASK);
 }
 
-/* ZERO_PAGE - returns the globally shared zero page */
-#define ZERO_PAGE(vaddr) (virt_to_page(&empty_zero_page))
-
 /*
  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
  * are !pte_none() && !pte_present().
diff --git a/arch/hexagon/kernel/head.S b/arch/hexagon/kernel/head.S
index 0b016308cc79..908ffece9132 100644
--- a/arch/hexagon/kernel/head.S
+++ b/arch/hexagon/kernel/head.S
@@ -216,8 +216,3 @@ __head_s_vaddr_target:
 .p2align PAGE_SHIFT
 ENTRY(external_cmdline_buffer)
         .fill _PAGE_SIZE,1,0
-
-.data
-.p2align PAGE_SHIFT
-ENTRY(empty_zero_page)
-        .fill _PAGE_SIZE,1,0
diff --git a/arch/hexagon/kernel/hexagon_ksyms.c b/arch/hexagon/kernel/hexagon_ksyms.c
index 36a80e31d187..81bc6f81e200 100644
--- a/arch/hexagon/kernel/hexagon_ksyms.c
+++ b/arch/hexagon/kernel/hexagon_ksyms.c
@@ -17,7 +17,6 @@ EXPORT_SYMBOL(raw_copy_to_user);
 EXPORT_SYMBOL(__vmgetie);
 EXPORT_SYMBOL(__vmsetie);
 EXPORT_SYMBOL(__vmyield);
-EXPORT_SYMBOL(empty_zero_page);
 EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memset);
 
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index c33b3bcb733e..a244de27a03e 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -74,15 +74,6 @@
 struct mm_struct;
 struct vm_area_struct;
 
-/*
- * ZERO_PAGE is a global shared page that is always zero; used
- * for zero-mapped memory areas etc..
- */
-
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
-
-#define ZERO_PAGE(vaddr)	virt_to_page(empty_zero_page)
-
 #ifdef CONFIG_32BIT
 
 #define VMALLOC_START	(vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index c331bf69d2ec..00f3822b6e47 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -36,9 +36,6 @@
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
-EXPORT_SYMBOL(empty_zero_page);
-
 void copy_user_highpage(struct page *to, struct page *from,
 	unsigned long vaddr, struct vm_area_struct *vma)
 {
diff --git a/arch/m68k/include/asm/pgtable_mm.h b/arch/m68k/include/asm/pgtable_mm.h
index bba64a9c49ac..7501ff030c63 100644
--- a/arch/m68k/include/asm/pgtable_mm.h
+++ b/arch/m68k/include/asm/pgtable_mm.h
@@ -110,15 +110,6 @@ extern unsigned long m68k_vmalloc_end;
 #define VMALLOC_END KMAP_START
 #endif
 
-/* zero page used for uninitialized stuff */
-extern void *empty_zero_page;
-
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
-
 extern void kernel_set_cachemode(void *addr, unsigned long size, int cmode);
 
 /*
diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
index 1a86c15b9008..11751807a3f3 100644
--- a/arch/m68k/include/asm/pgtable_no.h
+++ b/arch/m68k/include/asm/pgtable_no.h
@@ -30,13 +30,6 @@
 
 #define swapper_pg_dir ((pgd_t *) 0)
 
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-extern void *empty_zero_page;
-#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
-
 /*
  * All 32bit addresses are effectively valid for vmalloc...
  * Sort of meaningless for non-VM targets.
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 53b71f786c27..3b88c0dd1616 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -33,13 +33,6 @@
 #include <asm/sections.h>
 #include <asm/tlb.h>
 
-/*
- * ZERO_PAGE is a special page that is used for zero-initialized
- * data and COW.
- */
-void *empty_zero_page;
-EXPORT_SYMBOL(empty_zero_page);
-
 void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(memblock_end_of_DRAM());
@@ -71,8 +64,6 @@ void __init paging_init(void)
 	unsigned long end_mem = memory_end & PAGE_MASK;
 
 	high_memory = (void *) end_mem;
-
-	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
 }
 
 #endif /* CONFIG_MMU */
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 3418fd864237..4924f2ff8ef8 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -41,8 +41,6 @@ void __init paging_init(void)
 	unsigned long next_pgtable;
 	int i;
 
-	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
-
 	pg_dir = swapper_pg_dir;
 	memset(swapper_pg_dir, 0, sizeof(swapper_pg_dir));
 
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 127a3fa69f4c..b30aa69a73a6 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -498,12 +498,6 @@ void __init paging_init(void)
 
 	early_memtest(min_addr, max_addr);
 
-	/*
-	 * initialize the bad page table and bad page to point
-	 * to a couple of allocated pages
-	 */
-	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
-
 	/*
 	 * Set up SFC/DFC registers
 	 */
diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index c801677f7df8..f139cc15753a 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -43,8 +43,6 @@ void __init paging_init(void)
 	unsigned long bootmem_end;
 	unsigned long size;
 
-	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
-
 	address = PAGE_OFFSET;
 	pg_dir = swapper_pg_dir;
 	memset (swapper_pg_dir, 0, sizeof (swapper_pg_dir));
diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
index 4eb76de6be4a..ea72291de553 100644
--- a/arch/microblaze/include/asm/pgtable.h
+++ b/arch/microblaze/include/asm/pgtable.h
@@ -207,16 +207,6 @@ extern pte_t *va_to_pte(unsigned long address);
  * Also, write permissions imply read permissions.
  */
 
-#ifndef __ASSEMBLER__
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-extern unsigned long empty_zero_page[1024];
-#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
-
-#endif /* __ASSEMBLER__ */
-
 #define pte_none(pte)		((pte_val(pte) & ~_PTE_NONE_MASK) == 0)
 #define pte_present(pte)	(pte_val(pte) & _PAGE_PRESENT)
 #define pte_clear(mm, addr, ptep) \
diff --git a/arch/microblaze/kernel/head.S b/arch/microblaze/kernel/head.S
index ec2fcb545e64..808019c3b7ac 100644
--- a/arch/microblaze/kernel/head.S
+++ b/arch/microblaze/kernel/head.S
@@ -39,10 +39,6 @@
 #include <asm/processor.h>
 
 .section .data
-.global empty_zero_page
-.align 12
-empty_zero_page:
-	.space	PAGE_SIZE
 .global swapper_pg_dir
 swapper_pg_dir:
 	.space	PAGE_SIZE
diff --git a/arch/microblaze/kernel/microblaze_ksyms.c b/arch/microblaze/kernel/microblaze_ksyms.c
index a8553f54152b..ad7596d7ba07 100644
--- a/arch/microblaze/kernel/microblaze_ksyms.c
+++ b/arch/microblaze/kernel/microblaze_ksyms.c
@@ -33,8 +33,6 @@ EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memmove);
 #endif
 
-EXPORT_SYMBOL(empty_zero_page);
-
 EXPORT_SYMBOL(mbc);
 
 extern void __divsi3(void);
diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index 844dce55569f..d389aa9ca57c 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -65,13 +65,6 @@ struct mm_struct;
 #define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
 #define PGDIR_MASK	(~(PGDIR_SIZE-1))
 
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
-#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
-
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 extern pte_t invalid_pte_table[PAGE_SIZE/sizeof(pte_t)];
 
diff --git a/arch/nios2/kernel/head.S b/arch/nios2/kernel/head.S
index 372ce4a33018..613212e1a63a 100644
--- a/arch/nios2/kernel/head.S
+++ b/arch/nios2/kernel/head.S
@@ -23,16 +23,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/asm-macros.h>
 
-/*
- * ZERO_PAGE is a special page that is used for zero-initialized
- * data and COW.
- */
-.data
-.global empty_zero_page
-.align 12
-empty_zero_page:
-	.space	PAGE_SIZE
-
 /*
  * This global variable is used as an extension to the nios'
  * STATUS register to emulate a user/supervisor mode.
diff --git a/arch/nios2/kernel/nios2_ksyms.c b/arch/nios2/kernel/nios2_ksyms.c
index 54f7b23df1bf..c40aa39e8658 100644
--- a/arch/nios2/kernel/nios2_ksyms.c
+++ b/arch/nios2/kernel/nios2_ksyms.c
@@ -20,7 +20,6 @@ EXPORT_SYMBOL(memmove);
 
 /* memory management */
 
-EXPORT_SYMBOL(empty_zero_page);
 EXPORT_SYMBOL(flush_icache_range);
 
 /*
diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index b218050e2f6d..6b89996d0b62 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -179,10 +179,6 @@ extern void paging_init(void);
 	__pgprot(_PAGE_ALL | _PAGE_SRE | _PAGE_SWE \
 		 | _PAGE_SHARED | _PAGE_DIRTY | _PAGE_EXEC | _PAGE_CI)
 
-/* zero page used for uninitialized stuff */
-extern unsigned long empty_zero_page[2048];
-#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
-
 #define pte_none(x)	(!pte_val(x))
 #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
 #define pte_clear(mm, addr, xp)	do { pte_val(*(xp)) = 0; } while (0)
diff --git a/arch/openrisc/kernel/head.S b/arch/openrisc/kernel/head.S
index bd760066f1cd..45890393947d 100644
--- a/arch/openrisc/kernel/head.S
+++ b/arch/openrisc/kernel/head.S
@@ -1563,9 +1563,6 @@ _string_nl:
  */
 	.section .data,"aw"
 	.align	8192
-	.global  empty_zero_page
-empty_zero_page:
-	.space  8192
 
 	.global  swapper_pg_dir
 swapper_pg_dir:
diff --git a/arch/openrisc/kernel/or32_ksyms.c b/arch/openrisc/kernel/or32_ksyms.c
index 212e5f85004c..84a937a64e2a 100644
--- a/arch/openrisc/kernel/or32_ksyms.c
+++ b/arch/openrisc/kernel/or32_ksyms.c
@@ -40,7 +40,6 @@ DECLARE_EXPORT(__ashldi3);
 DECLARE_EXPORT(__lshrdi3);
 DECLARE_EXPORT(__ucmpdi2);
 
-EXPORT_SYMBOL(empty_zero_page);
 EXPORT_SYMBOL(__copy_tofrom_user);
 EXPORT_SYMBOL(__clear_user);
 EXPORT_SYMBOL(memset);
diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
index 78fb0734cdbc..89d8c6df8855 100644
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -188,9 +188,6 @@ void __init mem_init(void)
 {
 	BUG_ON(!mem_map);
 
-	/* clear the zero-page */
-	memset((void *)empty_zero_page, 0, PAGE_SIZE);
-
 	printk("mem_init_done ...........................................\n");
 	mem_init_done = 1;
 	return;
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 2c139a4dbf4b..cbdc01a26ea0 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -262,17 +262,6 @@ extern pgd_t swapper_pg_dir[]; /* declared in init_task.c */
 
 extern pte_t pg0[];
 
-/* zero page used for uninitialized stuff */
-
-extern unsigned long *empty_zero_page;
-
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-
-#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
-
 #define pte_none(x)     (pte_val(x) == 0)
 #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
 #define pte_user(x)	(pte_val(x) & _PAGE_USER)
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 6a39e031e5ff..be3380c9bcda 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -604,9 +604,6 @@ void __init mem_init(void)
 #endif
 }
 
-unsigned long *empty_zero_page __ro_after_init;
-EXPORT_SYMBOL(empty_zero_page);
-
 /*
  * pagetable_init() sets up the page tables
  *
@@ -639,9 +636,6 @@ static void __init pagetable_init(void)
 			  initrd_end - initrd_start, PAGE_KERNEL, 0);
 	}
 #endif
-
-	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
-
 }
 
 static void __init gateway_init(void)
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index dcd3a88caaf6..b27d94c06d0e 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -76,12 +76,6 @@ static inline const void *pmd_page_vaddr(pmd_t pmd)
 }
 #define pmd_page_vaddr pmd_page_vaddr
 #endif
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-extern unsigned long empty_zero_page[];
-#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
 
 extern pgd_t swapper_pg_dir[];
 
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 3789a51bdaae..85508392a6b6 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -34,9 +34,6 @@
 
 unsigned long long memory_limit __initdata;
 
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
-EXPORT_SYMBOL(empty_zero_page);
-
 pgprot_t __phys_mem_access_prot(unsigned long pfn, unsigned long size,
 				pgprot_t vma_prot)
 {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9ecbf0366719..a6b496f4944f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1258,13 +1258,6 @@ extern u64 satp_mode;
 void paging_init(void);
 void misc_mem_init(void);
 
-/*
- * ZERO_PAGE is a global shared page that is always zero,
- * used for zero-mapped memory areas, etc.
- */
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
-#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
-
 /*
  * Use set_p*_safe(), and elide TLB flushing, when confident that *no*
  * TLB flush will be required as a result of the "set". For example, use
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 848efeb9e163..95ac79c62067 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -69,10 +69,6 @@ unsigned long vmemmap_start_pfn __ro_after_init;
 EXPORT_SYMBOL(vmemmap_start_pfn);
 #endif
 
-unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
-							__page_aligned_bss;
-EXPORT_SYMBOL(empty_zero_page);
-
 extern char _start[];
 void *_dtb_early_va __initdata;
 uintptr_t _dtb_early_pa __initdata;
diff --git a/arch/sh/include/asm/pgtable.h b/arch/sh/include/asm/pgtable.h
index 10fa8f2bb8d1..d5ce0950a323 100644
--- a/arch/sh/include/asm/pgtable.h
+++ b/arch/sh/include/asm/pgtable.h
@@ -20,14 +20,6 @@
 #ifndef __ASSEMBLER__
 #include <asm/addrspace.h>
 #include <asm/fixmap.h>
-
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
-#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
-
 #endif /* !__ASSEMBLER__ */
 
 /*
diff --git a/arch/sh/include/asm/setup.h b/arch/sh/include/asm/setup.h
index 84bb23a771f3..63c9efc06348 100644
--- a/arch/sh/include/asm/setup.h
+++ b/arch/sh/include/asm/setup.h
@@ -7,7 +7,8 @@
 /*
  * This is set up by the setup-routine at boot-time
  */
-#define PARAM	((unsigned char *)empty_zero_page)
+extern unsigned char *boot_params_page;
+#define PARAM boot_params_page
 
 #define MOUNT_ROOT_RDONLY (*(unsigned long *) (PARAM+0x000))
 #define RAMDISK_FLAGS (*(unsigned long *) (PARAM+0x004))
diff --git a/arch/sh/kernel/head_32.S b/arch/sh/kernel/head_32.S
index b603b7968b38..0b91bb85d40a 100644
--- a/arch/sh/kernel/head_32.S
+++ b/arch/sh/kernel/head_32.S
@@ -26,7 +26,7 @@
 #endif
 
 	.section	.empty_zero_page, "aw"
-ENTRY(empty_zero_page)
+ENTRY(boot_params_page)
 	.long	1		/* MOUNT_ROOT_RDONLY */
 	.long	0		/* RAMDISK_FLAGS */
 	.long	0x0200		/* ORIG_ROOT_DEV */
@@ -39,7 +39,7 @@ ENTRY(empty_zero_page)
 	.long	0x53453f00 + 29	/* "SE?" = 29 bit */
 #endif
 1:
-	.skip	PAGE_SIZE - empty_zero_page - 1b
+	.skip	PAGE_SIZE - boot_params_page - 1b
 
 	__HEAD
 
diff --git a/arch/sh/kernel/sh_ksyms_32.c b/arch/sh/kernel/sh_ksyms_32.c
index 5858936cb431..041191002e2e 100644
--- a/arch/sh/kernel/sh_ksyms_32.c
+++ b/arch/sh/kernel/sh_ksyms_32.c
@@ -20,7 +20,6 @@ EXPORT_SYMBOL(csum_partial);
 EXPORT_SYMBOL(csum_partial_copy_generic);
 EXPORT_SYMBOL(copy_page);
 EXPORT_SYMBOL(__clear_user);
-EXPORT_SYMBOL(empty_zero_page);
 #ifdef CONFIG_FLATMEM
 /* need in pfn_valid macro */
 EXPORT_SYMBOL(min_low_pfn);
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 464a3a63e2fa..4e40d5e96be9 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -332,7 +332,6 @@ void __init mem_init(void)
 	cpu_cache_init();
 
 	/* clear the zero-page */
-	memset(empty_zero_page, 0, PAGE_SIZE);
 	__flush_wback_region(empty_zero_page, PAGE_SIZE);
 
 	vsyscall_init();
diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index a9f802d1dd64..f89b1250661d 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -71,14 +71,6 @@ extern unsigned long ptr_in_current_pgd;
 extern unsigned long phys_base;
 extern unsigned long pfn_base;
 
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
-
-#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
-
 /*
  * In general all page table modifications should use the V8 atomic
  * swap instruction.  This insures the mmu and the cpu are in sync
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 615f460c50af..74ede706fb32 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -210,9 +210,6 @@ extern unsigned long _PAGE_CACHE;
 extern unsigned long pg_iobits;
 extern unsigned long _PAGE_ALL_SZ_BITS;
 
-extern struct page *mem_map_zero;
-#define ZERO_PAGE(vaddr)	(mem_map_zero)
-
 /* PFNs are real physical page numbers.  However, mem_map only begins to record
  * per-page information starting at pfn_base.  This is to handle systems where
  * the first physical page in the machine is at some huge physical address,
diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
index 72205684e51e..21bed5514028 100644
--- a/arch/sparc/include/asm/setup.h
+++ b/arch/sparc/include/asm/setup.h
@@ -17,8 +17,6 @@ extern char reboot_command[];
  */
 extern unsigned char boot_cpu_id;
 
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
-
 extern int serial_console;
 static inline int con_is_present(void)
 {
diff --git a/arch/sparc/kernel/head_32.S b/arch/sparc/kernel/head_32.S
index 38345460d542..8c320fa25a67 100644
--- a/arch/sparc/kernel/head_32.S
+++ b/arch/sparc/kernel/head_32.S
@@ -57,13 +57,6 @@ sun4e_notsup:
 
 	.align PAGE_SIZE
 
-/* This was the only reasonable way I could think of to properly align
- * these page-table data structures.
- */
-	.globl empty_zero_page
-empty_zero_page:	.skip PAGE_SIZE
-EXPORT_SYMBOL(empty_zero_page)
-
 	.global root_flags
 	.global ram_flags
 	.global root_dev
diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index fdc93dd12c3e..e0e66f91ceeb 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -246,10 +246,6 @@ void __init arch_mm_preinit(void)
 		prom_halt();
 	}
 
-
-	/* Saves us work later. */
-	memset((void *)empty_zero_page, 0, PAGE_SIZE);
-
 	i = last_valid_pfn >> ((20 - PAGE_SHIFT) + 5);
 	i += 1;
 	sparc_valid_addr_bitmap = (unsigned long *)
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index c2d19c9a9244..2bd99944176d 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -177,9 +177,6 @@ extern unsigned long sparc_ramdisk_image64;
 extern unsigned int sparc_ramdisk_image;
 extern unsigned int sparc_ramdisk_size;
 
-struct page *mem_map_zero __read_mostly;
-EXPORT_SYMBOL(mem_map_zero);
-
 unsigned int sparc64_highest_unlocked_tlb_ent __read_mostly;
 
 unsigned long sparc64_kern_pri_context __read_mostly;
@@ -2506,18 +2503,6 @@ void __init mem_init(void)
 	 */
 	register_page_bootmem_info();
 
-	/*
-	 * Set up the zero page, mark it reserved, so that page count
-	 * is not manipulated when freeing the page from user ptes.
-	 */
-	mem_map_zero = alloc_pages(GFP_KERNEL|__GFP_ZERO, 0);
-	if (mem_map_zero == NULL) {
-		prom_printf("paging_init: Cannot alloc zero page.\n");
-		prom_halt();
-	}
-	mark_page_reserved(mem_map_zero);
-
-
 	if (tlb_type == cheetah || tlb_type == cheetah_plus)
 		cheetah_ecache_flush_init();
 }
diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index 3b42b0f45bf6..19e0608fb649 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -34,9 +34,6 @@
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 
-/* zero page used for uninitialized stuff */
-extern unsigned long *empty_zero_page;
-
 /* Just any arbitrary offset to the start of the vmalloc VM area: the
  * current 8MB value just means that there will be a 8MB "hole" after the
  * physical memory until the kernel virtual memory starts.  That means that
@@ -74,12 +71,6 @@ extern unsigned long *empty_zero_page;
  * get..
  */
 
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-#define ZERO_PAGE(vaddr) virt_to_page(empty_zero_page)
-
 #define pte_clear(mm, addr, xp) pte_set_val(*(xp), (phys_t) 0, __pgprot(_PAGE_NEEDSYNC))
 
 #define pmd_none(x)	(!((unsigned long)pmd_val(x) & ~_PAGE_NEEDSYNC))
diff --git a/arch/um/include/shared/kern_util.h b/arch/um/include/shared/kern_util.h
index 38321188c04c..9812efd14ec0 100644
--- a/arch/um/include/shared/kern_util.h
+++ b/arch/um/include/shared/kern_util.h
@@ -38,7 +38,6 @@ extern void timer_handler(int sig, struct siginfo *unused_si, struct uml_pt_regs
 extern void uml_pm_wake(void);
 
 extern int start_uml(void);
-extern void paging_init(void);
 
 extern void uml_cleanup(void);
 extern void do_uml_exitcalls(void);
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 89c8c8b94a79..1eef0e42ef5d 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -44,10 +44,6 @@ __section(".kasan_init") __used
 = kasan_init;
 #endif
 
-/* allocated in paging_init, zeroed in mem_init, and unchanged thereafter */
-unsigned long *empty_zero_page = NULL;
-EXPORT_SYMBOL(empty_zero_page);
-
 /*
  * Initialized during boot, and readonly for initializing page tables
  * afterwards
@@ -65,9 +61,6 @@ void __init arch_mm_preinit(void)
 	/* Safe to call after jump_label_init(). Enables KASAN. */
 	kasan_init_generic();
 
-	/* clear the zero-page */
-	memset(empty_zero_page, 0, PAGE_SIZE);
-
 	/* Map in the area just after the brk now that kmalloc is about
 	 * to be turned on.
 	 */
@@ -89,15 +82,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 	max_zone_pfns[ZONE_NORMAL] = high_physmem >> PAGE_SHIFT;
 }
 
-void __init paging_init(void)
-{
-	empty_zero_page = (unsigned long *) memblock_alloc_low(PAGE_SIZE,
-							       PAGE_SIZE);
-	if (!empty_zero_page)
-		panic("%s: Failed to allocate %lu bytes align=%lx\n",
-		      __func__, PAGE_SIZE, PAGE_SIZE);
-}
-
 /*
  * This can't do anything because nothing in the kernel image can be freed
  * since it's not in kernel physical memory.
diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index e2b24e1ecfa6..2141f5f1f5a2 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -413,7 +413,6 @@ void __init setup_arch(char **cmdline_p)
 	uml_dtb_init();
 	read_initrd();
 
-	paging_init();
 	strscpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 	setup_hostinfo(host_info, sizeof host_info);
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 1662c5a8f445..54289f4587a4 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -47,14 +47,6 @@ void ptdump_walk_user_pgd_level_checkwx(void);
 #define debug_checkwx_user()	do { } while (0)
 #endif
 
-/*
- * ZERO_PAGE is a global shared page that is always zero: used
- * for zero-mapped memory areas etc..
- */
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
-	__visible;
-#define ZERO_PAGE(vaddr) ((void)(vaddr),virt_to_page(empty_zero_page))
-
 extern spinlock_t pgd_lock;
 extern struct list_head pgd_list;
 
diff --git a/arch/x86/kernel/head_32.S b/arch/x86/kernel/head_32.S
index 80ef5d386b03..5171cb746444 100644
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -441,10 +441,6 @@ initial_pg_fixmap:
 swapper_pg_dir:
 	.fill 1024,4,0
 	.fill PTI_USER_PGD_FILL,4,0
-.globl empty_zero_page
-empty_zero_page:
-	.fill 4096,1,0
-EXPORT_SYMBOL(empty_zero_page)
 
 /*
  * This starts the data section.
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 21816b48537c..cbf7647a25d8 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -712,10 +712,3 @@ SYM_PIC_ALIAS(phys_base);
 EXPORT_SYMBOL(phys_base)
 
 #include "../xen/xen-head.S"
-
-	__PAGE_ALIGNED_BSS
-SYM_DATA_START_PAGE_ALIGNED(empty_zero_page)
-	.skip PAGE_SIZE
-SYM_DATA_END(empty_zero_page)
-EXPORT_SYMBOL(empty_zero_page)
-
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 50a136213b2b..61f07d981a94 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -209,10 +209,6 @@
 #define pgd_ERROR(e) \
 	printk("%s:%d: bad pgd entry %08lx.\n", __FILE__, __LINE__, pgd_val(e))
 
-extern unsigned long empty_zero_page[1024];
-
-#define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
-
 #ifdef CONFIG_MMU
 extern pgd_t swapper_pg_dir[PAGE_SIZE/sizeof(pgd_t)];
 extern void paging_init(void);
diff --git a/arch/xtensa/kernel/head.S b/arch/xtensa/kernel/head.S
index 8484294bc623..4b0c5c5e685a 100644
--- a/arch/xtensa/kernel/head.S
+++ b/arch/xtensa/kernel/head.S
@@ -381,6 +381,3 @@ ENTRY(swapper_pg_dir)
 	.fill	PAGE_SIZE, 1, 0
 END(swapper_pg_dir)
 #endif
-ENTRY(empty_zero_page)
-	.fill	PAGE_SIZE, 1, 0
-END(empty_zero_page)
diff --git a/arch/xtensa/kernel/xtensa_ksyms.c b/arch/xtensa/kernel/xtensa_ksyms.c
index 62d81e76e18e..ced335b4df5f 100644
--- a/arch/xtensa/kernel/xtensa_ksyms.c
+++ b/arch/xtensa/kernel/xtensa_ksyms.c
@@ -15,8 +15,6 @@
 #include <linux/module.h>
 #include <asm/pgtable.h>
 
-EXPORT_SYMBOL(empty_zero_page);
-
 unsigned int __sync_fetch_and_and_4(volatile void *p, unsigned int v)
 {
 	BUG();
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 4f063438a4fc..3687ea2ddedb 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2188,6 +2188,14 @@ static inline const char *pgtable_level_to_str(enum pgtable_level level)
 	}
 }
 
+#ifndef __HAVE_COLOR_ZERO_PAGE
+extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
+#endif
+
+#ifndef ZERO_PAGE
+#define ZERO_PAGE(vaddr) ((void)(vaddr),virt_to_page(empty_zero_page))
+#endif
+
 #endif /* !__ASSEMBLY__ */
 
 #if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1a29a719af58..8ea5b76f317f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -53,6 +53,15 @@ EXPORT_SYMBOL(mem_map);
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
 
+#ifndef __HAVE_COLOR_ZERO_PAGE
+/*
+ * ZERO_PAGE is a global shared page that is always zero: used
+ * for zero-mapped memory areas etc..
+ */
+unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
+EXPORT_SYMBOL(empty_zero_page);
+#endif
+
 #ifdef CONFIG_DEBUG_MEMORY_INIT
 int __meminitdata mminit_loglevel;
 

base-commit: 10de4550639e9df9242e32e9affc90ed75a27c7d
-- 
2.51.0


