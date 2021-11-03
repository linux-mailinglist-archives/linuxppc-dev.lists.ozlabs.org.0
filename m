Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FAB444A0B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 22:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hkzj73GYZz3cmn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 08:01:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=URmpnGWL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=URmpnGWL; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkzcV5LZ6z2ywk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 07:57:46 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id u11so3632331plf.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Nov 2021 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gp+q+Dp9Rg8+gbw0JzqtKDIoOTrQCdiRZcY/99hfXto=;
 b=URmpnGWL791dLOnO2PzfX4IQbFW2IlgqhpCLMVShp4wPT6hwXU/zpYC9/2hz5RXQd8
 uFCaD6M6Cu8K7WHuDbHT7S+BcNVOU2S1wK4t0D3FoJYLYYNhJa/7my7Skw3arb387ZSU
 g49Ha2Oc8PcqGVFRw3Qxw9svIWJDiclovUF3/Ql07dJNjheCkir+jDna0JX3BYPplNAl
 P9MoHa8zCt+Hep1au1Cf3SA4GceWH74J23cdFSUkajkIHV1NCKV+gP22KIIhAC7YKyU+
 kqTog0GqtReKoJb2NaJlvQR5LOZ6lHEfk9jfzrNJFG+JJaNFPDACHRAhAacDkvbudy2j
 Bc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gp+q+Dp9Rg8+gbw0JzqtKDIoOTrQCdiRZcY/99hfXto=;
 b=Lt2vQk3/0U8g/yQSCvoU8PqVN8spG50jp84ZH84DbNqj4JTQVeNvDmO/WHofeWm+TO
 kyNZT2/8lyAohan/UR7Gle+Yt6YqmTP3BKMqZlUy5WJHjP+0p6R8lxTgJdq1Jetmj6Na
 odvjE/6Mgjlw5yU6S3o3XuhOA1zUfsIcueXMosI7N2DEzBDWvMQl4aOosQsPjkJNhcbZ
 nUw0xPkCh9vha2Fj7FQE1IXEv/+AUMzD8P/EgGEmcc/DcgP54hOsODR6itPkBQsrNCAn
 Tm7VeQwXRGXklbniOexuqs14ttk9ftHYVYUIzy/Z75uqiosHIh8PvrEfLuDzerbx2nIi
 izRA==
X-Gm-Message-State: AOAM530vxWyi9zPyTc2nDOLB+p0LJ5cBtFieperlyl/X5175Ko+gVwnJ
 dBMh7z0+X7n5nYHYd7WB8gE=
X-Google-Smtp-Source: ABdhPJxaQhs3rUPf+5wXCB1IY4jfT140BDfhG5OoHFaRDoUG46SqIjVMSeFPILH71toODyyhkdhUQg==
X-Received: by 2002:a17:90a:cf85:: with SMTP id
 i5mr17320338pju.101.1635973064168; 
 Wed, 03 Nov 2021 13:57:44 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n14sm2512073pgd.68.2021.11.03.13.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:57:40 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH stable 4.9 2/2] arch: pgtable: define
 MAX_POSSIBLE_PHYSMEM_BITS where needed
Date: Wed,  3 Nov 2021 13:57:14 -0700
Message-Id: <20211103205714.374801-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103205714.374801-1-f.fainelli@gmail.com>
References: <20211103205714.374801-1-f.fainelli@gmail.com>
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
Cc: "open list:MIPS" <linux-mips@linux-mips.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Stefan Agner <stefan@agner.ch>,
 "open list:ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, stable@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Sasha Levin <sashal@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nitin Gupta <ngupta@vflare.org>,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ralf Baechle <ralf@linux-mips.org>, Minchan Kim <minchan@kernel.org>,
 Vineet Gupta <vgupta@synopsys.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit cef397038167ac15d085914493d6c86385773709 ]

Stefan Agner reported a bug when using zsram on 32-bit Arm machines
with RAM above the 4GB address boundary:

  Unable to handle kernel NULL pointer dereference at virtual address 00000000
  pgd = a27bd01c
  [00000000] *pgd=236a0003, *pmd=1ffa64003
  Internal error: Oops: 207 [#1] SMP ARM
  Modules linked in: mdio_bcm_unimac(+) brcmfmac cfg80211 brcmutil raspberrypi_hwmon hci_uart crc32_arm_ce bcm2711_thermal phy_generic genet
  CPU: 0 PID: 123 Comm: mkfs.ext4 Not tainted 5.9.6 #1
  Hardware name: BCM2711
  PC is at zs_map_object+0x94/0x338
  LR is at zram_bvec_rw.constprop.0+0x330/0xa64
  pc : [<c0602b38>]    lr : [<c0bda6a0>]    psr: 60000013
  sp : e376bbe0  ip : 00000000  fp : c1e2921c
  r10: 00000002  r9 : c1dda730  r8 : 00000000
  r7 : e8ff7a00  r6 : 00000000  r5 : 02f9ffa0  r4 : e3710000
  r3 : 000fdffe  r2 : c1e0ce80  r1 : ebf979a0  r0 : 00000000
  Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
  Control: 30c5383d  Table: 235c2a80  DAC: fffffffd
  Process mkfs.ext4 (pid: 123, stack limit = 0x495a22e6)
  Stack: (0xe376bbe0 to 0xe376c000)

As it turns out, zsram needs to know the maximum memory size, which
is defined in MAX_PHYSMEM_BITS when CONFIG_SPARSEMEM is set, or in
MAX_POSSIBLE_PHYSMEM_BITS on the x86 architecture.

The same problem will be hit on all 32-bit architectures that have a
physical address space larger than 4GB and happen to not enable sparsemem
and include asm/sparsemem.h from asm/pgtable.h.

After the initial discussion, I suggested just always defining
MAX_POSSIBLE_PHYSMEM_BITS whenever CONFIG_PHYS_ADDR_T_64BIT is
set, or provoking a build error otherwise. This addresses all
configurations that can currently have this runtime bug, but
leaves all other configurations unchanged.

I looked up the possible number of bits in source code and
datasheets, here is what I found:

 - on ARC, CONFIG_ARC_HAS_PAE40 controls whether 32 or 40 bits are used
 - on ARM, CONFIG_LPAE enables 40 bit addressing, without it we never
   support more than 32 bits, even though supersections in theory allow
   up to 40 bits as well.
 - on MIPS, some MIPS32r1 or later chips support 36 bits, and MIPS32r5
   XPA supports up to 60 bits in theory, but 40 bits are more than
   anyone will ever ship
 - On PowerPC, there are three different implementations of 36 bit
   addressing, but 32-bit is used without CONFIG_PTE_64BIT
 - On RISC-V, the normal page table format can support 34 bit
   addressing. There is no highmem support on RISC-V, so anything
   above 2GB is unused, but it might be useful to eventually support
   CONFIG_ZRAM for high pages.

Fixes: 61989a80fb3a ("staging: zsmalloc: zsmalloc memory allocation library")
Fixes: 02390b87a945 ("mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS")
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Tested-by: Stefan Agner <stefan@agner.ch>
Acked-by: Mike Rapoport <rppt@linux.ibm.com>
Link: https://lore.kernel.org/linux-mm/bdfa44bf1c570b05d6c70898e2bbb0acf234ecdf.1604762181.git.stefan@agner.ch/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
[florian: patch arch/powerpc/include/asm/pte-common.h for 4.9.y
removed arch/riscv/include/asm/pgtable.h which does not exist]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arc/include/asm/pgtable.h        |  2 ++
 arch/arm/include/asm/pgtable-2level.h |  2 ++
 arch/arm/include/asm/pgtable-3level.h |  2 ++
 arch/mips/include/asm/pgtable-32.h    |  3 +++
 arch/powerpc/include/asm/pte-common.h |  2 ++
 include/asm-generic/pgtable.h         | 13 +++++++++++++
 6 files changed, 24 insertions(+)

diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index c10f5cb203e6..81198a6773c6 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -137,8 +137,10 @@
 
 #ifdef CONFIG_ARC_HAS_PAE40
 #define PTE_BITS_NON_RWX_IN_PD1	(0xff00000000 | PAGE_MASK | _PAGE_CACHEABLE)
+#define MAX_POSSIBLE_PHYSMEM_BITS 40
 #else
 #define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK | _PAGE_CACHEABLE)
+#define MAX_POSSIBLE_PHYSMEM_BITS 32
 #endif
 
 /**************************************************************************
diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index 92fd2c8a9af0..6154902bed83 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -78,6 +78,8 @@
 #define PTE_HWTABLE_OFF		(PTE_HWTABLE_PTRS * sizeof(pte_t))
 #define PTE_HWTABLE_SIZE	(PTRS_PER_PTE * sizeof(u32))
 
+#define MAX_POSSIBLE_PHYSMEM_BITS	32
+
 /*
  * PMD_SHIFT determines the size of the area a second-level page table can map
  * PGDIR_SHIFT determines what a third-level page table entry can map
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 2a029bceaf2f..35807e611b6e 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -37,6 +37,8 @@
 #define PTE_HWTABLE_OFF		(0)
 #define PTE_HWTABLE_SIZE	(PTRS_PER_PTE * sizeof(u64))
 
+#define MAX_POSSIBLE_PHYSMEM_BITS 40
+
 /*
  * PGDIR_SHIFT determines the size a top-level page table entry can map.
  */
diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index c0be540e83cb..2c6df5a92e1e 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -110,6 +110,7 @@ static inline void pmd_clear(pmd_t *pmdp)
 
 #if defined(CONFIG_XPA)
 
+#define MAX_POSSIBLE_PHYSMEM_BITS 40
 #define pte_pfn(x)		(((unsigned long)((x).pte_high >> _PFN_SHIFT)) | (unsigned long)((x).pte_low << _PAGE_PRESENT_SHIFT))
 static inline pte_t
 pfn_pte(unsigned long pfn, pgprot_t prot)
@@ -125,6 +126,7 @@ pfn_pte(unsigned long pfn, pgprot_t prot)
 
 #elif defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
 
+#define MAX_POSSIBLE_PHYSMEM_BITS 36
 #define pte_pfn(x)		((unsigned long)((x).pte_high >> 6))
 
 static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
@@ -139,6 +141,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 #else
 
+#define MAX_POSSIBLE_PHYSMEM_BITS 32
 #ifdef CONFIG_CPU_VR41XX
 #define pte_pfn(x)		((unsigned long)((x).pte >> (PAGE_SHIFT + 2)))
 #define pfn_pte(pfn, prot)	__pte(((pfn) << (PAGE_SHIFT + 2)) | pgprot_val(prot))
diff --git a/arch/powerpc/include/asm/pte-common.h b/arch/powerpc/include/asm/pte-common.h
index 4ba26dd259fd..0d81cd9dd60e 100644
--- a/arch/powerpc/include/asm/pte-common.h
+++ b/arch/powerpc/include/asm/pte-common.h
@@ -101,8 +101,10 @@ static inline bool pte_user(pte_t pte)
  */
 #if defined(CONFIG_PPC32) && defined(CONFIG_PTE_64BIT)
 #define PTE_RPN_MASK	(~((1ULL<<PTE_RPN_SHIFT)-1))
+#define MAX_POSSIBLE_PHYSMEM_BITS 36
 #else
 #define PTE_RPN_MASK	(~((1UL<<PTE_RPN_SHIFT)-1))
+#define MAX_POSSIBLE_PHYSMEM_BITS 32
 #endif
 
 /* _PAGE_CHG_MASK masks of bits that are to be preserved across
diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index 0a4c2d4d9f8d..b43fa9d95a7a 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -847,6 +847,19 @@ static inline bool arch_has_pfn_modify_check(void)
 #define io_remap_pfn_range remap_pfn_range
 #endif
 
+#if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+/*
+ * ZSMALLOC needs to know the highest PFN on 32-bit architectures
+ * with physical address space extension, but falls back to
+ * BITS_PER_LONG otherwise.
+ */
+#error Missing MAX_POSSIBLE_PHYSMEM_BITS definition
+#else
+#define MAX_POSSIBLE_PHYSMEM_BITS 32
+#endif
+#endif
+
 #ifndef has_transparent_hugepage
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define has_transparent_hugepage() 1
-- 
2.25.1

