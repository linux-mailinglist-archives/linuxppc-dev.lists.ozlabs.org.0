Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E1F2BC134
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 19:01:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cdh6z0xHJzDqlp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Nov 2020 05:01:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cdh503Y6nzDqkK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Nov 2020 04:59:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Cdh4l0SGCz9tvyn;
 Sat, 21 Nov 2020 18:59:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WE5crqo2u7BH; Sat, 21 Nov 2020 18:59:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Cdh4k6bWJz9v0td;
 Sat, 21 Nov 2020 18:59:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 85A348B76E;
 Sat, 21 Nov 2020 18:59:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Q5ygbl9T9fDV; Sat, 21 Nov 2020 18:59:20 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 250508B75B;
 Sat, 21 Nov 2020 18:59:20 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A7FCD668CD; Sat, 21 Nov 2020 17:59:19 +0000 (UTC)
Message-Id: <18b357d68c4cde149f75c7a1031c850925cd8128.1605981539.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: inline iomap accessors
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sat, 21 Nov 2020 17:59:19 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ioreadXX()/ioreadXXbe() accessors are equivalent to ppc
in_leXX()/in_be16() accessors but they are not inlined.

Since commit 0eb573682872 ("powerpc/kerenl: Enable EEH for IO
accessors"), the 'le' versions are equivalent to the ones
defined in asm-generic/io.h, allthough the ones there are inlined.

Include asm-generic/io.h to get them. Keep ppc versions of the
'be' ones as they are optimised, but make them inline in ppc io.h.

This reduces the size of ppc64e_defconfig build by 3 kbytes:

   text	   data	    bss	    dec	    hex	filename
10160733	4343422	 562972	15067127	 e5e7f7	vmlinux.before
10159239	4341590	 562972	15063801	 e5daf9	vmlinux.after

A typical function using ioread and iowrite before the change:

c00000000066a3c4 <.ata_bmdma_stop>:
c00000000066a3c4:	7c 08 02 a6 	mflr    r0
c00000000066a3c8:	fb c1 ff f0 	std     r30,-16(r1)
c00000000066a3cc:	f8 01 00 10 	std     r0,16(r1)
c00000000066a3d0:	fb e1 ff f8 	std     r31,-8(r1)
c00000000066a3d4:	f8 21 ff 81 	stdu    r1,-128(r1)
c00000000066a3d8:	eb e3 00 00 	ld      r31,0(r3)
c00000000066a3dc:	eb df 00 98 	ld      r30,152(r31)
c00000000066a3e0:	7f c3 f3 78 	mr      r3,r30
c00000000066a3e4:	4b 9b 6f 7d 	bl      c000000000021360 <.ioread8>
c00000000066a3e8:	60 00 00 00 	nop
c00000000066a3ec:	7f c4 f3 78 	mr      r4,r30
c00000000066a3f0:	54 63 06 3c 	rlwinm  r3,r3,0,24,30
c00000000066a3f4:	4b 9b 70 4d 	bl      c000000000021440 <.iowrite8>
c00000000066a3f8:	60 00 00 00 	nop
c00000000066a3fc:	7f e3 fb 78 	mr      r3,r31
c00000000066a400:	38 21 00 80 	addi    r1,r1,128
c00000000066a404:	e8 01 00 10 	ld      r0,16(r1)
c00000000066a408:	eb c1 ff f0 	ld      r30,-16(r1)
c00000000066a40c:	7c 08 03 a6 	mtlr    r0
c00000000066a410:	eb e1 ff f8 	ld      r31,-8(r1)
c00000000066a414:	4b ff ff 8c 	b       c00000000066a3a0 <.ata_sff_dma_pause>

The same function with this patch:

c000000000669cb4 <.ata_bmdma_stop>:
c000000000669cb4:	e8 63 00 00 	ld      r3,0(r3)
c000000000669cb8:	e9 43 00 98 	ld      r10,152(r3)
c000000000669cbc:	7c 00 04 ac 	hwsync
c000000000669cc0:	89 2a 00 00 	lbz     r9,0(r10)
c000000000669cc4:	0c 09 00 00 	twi     0,r9,0
c000000000669cc8:	4c 00 01 2c 	isync
c000000000669ccc:	55 29 06 3c 	rlwinm  r9,r9,0,24,30
c000000000669cd0:	7c 00 04 ac 	hwsync
c000000000669cd4:	99 2a 00 00 	stb     r9,0(r10)
c000000000669cd8:	a1 4d 06 f0 	lhz     r10,1776(r13)
c000000000669cdc:	2c 2a 00 00 	cmpdi   r10,0
c000000000669ce0:	41 c2 00 08 	beq-    c000000000669ce8 <.ata_bmdma_stop+0x34>
c000000000669ce4:	b1 4d 06 f2 	sth     r10,1778(r13)
c000000000669ce8:	4b ff ff a8 	b       c000000000669c90 <.ata_sff_dma_pause>

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/io.h | 154 ++++++++++++++++++++++++++++++-
 arch/powerpc/kernel/iomap.c   | 166 ----------------------------------
 2 files changed, 153 insertions(+), 167 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 58635960403c..2469b46ac2c4 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -302,41 +302,56 @@ static inline unsigned char __raw_readb(const volatile void __iomem *addr)
 {
 	return *(volatile unsigned char __force *)PCI_FIX_ADDR(addr);
 }
+#define __raw_readb __raw_readb
+
 static inline unsigned short __raw_readw(const volatile void __iomem *addr)
 {
 	return *(volatile unsigned short __force *)PCI_FIX_ADDR(addr);
 }
+#define __raw_readw __raw_readw
+
 static inline unsigned int __raw_readl(const volatile void __iomem *addr)
 {
 	return *(volatile unsigned int __force *)PCI_FIX_ADDR(addr);
 }
+#define __raw_readl __raw_readl
+
 static inline void __raw_writeb(unsigned char v, volatile void __iomem *addr)
 {
 	*(volatile unsigned char __force *)PCI_FIX_ADDR(addr) = v;
 }
+#define __raw_writeb __raw_writeb
+
 static inline void __raw_writew(unsigned short v, volatile void __iomem *addr)
 {
 	*(volatile unsigned short __force *)PCI_FIX_ADDR(addr) = v;
 }
+#define __raw_writew __raw_writew
+
 static inline void __raw_writel(unsigned int v, volatile void __iomem *addr)
 {
 	*(volatile unsigned int __force *)PCI_FIX_ADDR(addr) = v;
 }
+#define __raw_writel __raw_writel
 
 #ifdef __powerpc64__
 static inline unsigned long __raw_readq(const volatile void __iomem *addr)
 {
 	return *(volatile unsigned long __force *)PCI_FIX_ADDR(addr);
 }
+#define __raw_readq __raw_readq
+
 static inline void __raw_writeq(unsigned long v, volatile void __iomem *addr)
 {
 	*(volatile unsigned long __force *)PCI_FIX_ADDR(addr) = v;
 }
+#define __raw_writeq __raw_writeq
 
 static inline void __raw_writeq_be(unsigned long v, volatile void __iomem *addr)
 {
 	__raw_writeq((__force unsigned long)cpu_to_be64(v), addr);
 }
+#define __raw_writeq_be __raw_writeq_be
 
 /*
  * Real mode versions of the above. Those instructions are only supposed
@@ -609,10 +624,37 @@ static inline void name at					\
 /* Some drivers check for the presence of readq & writeq with
  * a #ifdef, so we make them happy here.
  */
+#define readb readb
+#define readw readw
+#define readl readl
+#define writeb writeb
+#define writew writew
+#define writel writel
+#define readsb readsb
+#define readsw readsw
+#define readsl readsl
+#define writesb writesb
+#define writesw writesw
+#define writesl writesl
+#define inb inb
+#define inw inw
+#define inl inl
+#define outb outb
+#define outw outw
+#define outl outl
+#define insb insb
+#define insw insw
+#define insl insl
+#define outsb outsb
+#define outsw outsw
+#define outsl outsl
 #ifdef __powerpc64__
 #define readq	readq
 #define writeq	writeq
 #endif
+#define memset_io memset_io
+#define memcpy_fromio memcpy_fromio
+#define memcpy_toio memcpy_toio
 
 /*
  * Convert a physical pointer to a virtual kernel pointer for /dev/mem
@@ -637,7 +679,106 @@ static inline void name at					\
 #define writel_relaxed(v, addr)	writel(v, addr)
 #define writeq_relaxed(v, addr)	writeq(v, addr)
 
+#ifdef CONFIG_GENERIC_IOMAP
 #include <asm-generic/iomap.h>
+#else
+/*
+ * Here comes the implementation of the IOMAP interfaces.
+ */
+static inline unsigned int ioread16be(const void __iomem *addr)
+{
+	return readw_be(addr);
+}
+#define ioread16be ioread16be
+
+static inline unsigned int ioread32be(const void __iomem *addr)
+{
+	return readl_be(addr);
+}
+#define ioread32be ioread32be
+
+#ifdef __powerpc64__
+static inline u64 ioread64_lo_hi(const void __iomem *addr)
+{
+	return readq(addr);
+}
+#define ioread64_lo_hi ioread64_lo_hi
+
+static inline u64 ioread64_hi_lo(const void __iomem *addr)
+{
+	return readq(addr);
+}
+#define ioread64_hi_lo ioread64_hi_lo
+
+static inline u64 ioread64be(const void __iomem *addr)
+{
+	return readq_be(addr);
+}
+#define ioread64be ioread64be
+
+static inline u64 ioread64be_lo_hi(const void __iomem *addr)
+{
+	return readq_be(addr);
+}
+#define ioread64be_lo_hi ioread64be_lo_hi
+
+static inline u64 ioread64be_hi_lo(const void __iomem *addr)
+{
+	return readq_be(addr);
+}
+#define ioread64be_hi_lo ioread64be_hi_lo
+#endif /* __powerpc64__ */
+
+static inline void iowrite16be(u16 val, void __iomem *addr)
+{
+	writew_be(val, addr);
+}
+#define iowrite16be iowrite16be
+
+static inline void iowrite32be(u32 val, void __iomem *addr)
+{
+	writel_be(val, addr);
+}
+#define iowrite32be iowrite32be
+
+#ifdef __powerpc64__
+static inline void iowrite64_lo_hi(u64 val, void __iomem *addr)
+{
+	writeq(val, addr);
+}
+#define iowrite64_lo_hi iowrite64_lo_hi
+
+static inline void iowrite64_hi_lo(u64 val, void __iomem *addr)
+{
+	writeq(val, addr);
+}
+#define iowrite64_hi_lo iowrite64_hi_lo
+
+static inline void iowrite64be(u64 val, void __iomem *addr)
+{
+	writeq_be(val, addr);
+}
+#define iowrite64be iowrite64be
+
+static inline void iowrite64be_lo_hi(u64 val, void __iomem *addr)
+{
+	writeq_be(val, addr);
+}
+#define iowrite64be_lo_hi iowrite64be_lo_hi
+
+static inline void iowrite64be_hi_lo(u64 val, void __iomem *addr)
+{
+	writeq_be(val, addr);
+}
+#define iowrite64be_hi_lo iowrite64be_hi_lo
+#endif /* __powerpc64__ */
+
+struct pci_dev;
+void pci_iounmap(struct pci_dev *dev, void __iomem *addr);
+#define pci_iounmap pci_iounmap
+void __iomem *ioport_map(unsigned long port, unsigned int len);
+#define ioport_map ioport_map
+#endif
 
 static inline void iosync(void)
 {
@@ -670,7 +811,6 @@ static inline void iosync(void)
 
 #define IO_SPACE_LIMIT ~(0UL)
 
-
 /**
  * ioremap     -   map bus memory into CPU space
  * @address:   bus address of the memory
@@ -706,7 +846,13 @@ extern void __iomem *ioremap(phys_addr_t address, unsigned long size);
 extern void __iomem *ioremap_prot(phys_addr_t address, unsigned long size,
 				  unsigned long flags);
 extern void __iomem *ioremap_wc(phys_addr_t address, unsigned long size);
+#define ioremap_wc ioremap_wc
+
+#ifdef CONFIG_PPC32
 void __iomem *ioremap_wt(phys_addr_t address, unsigned long size);
+#define ioremap_wt ioremap_wt
+#endif
+
 void __iomem *ioremap_coherent(phys_addr_t address, unsigned long size);
 #define ioremap_uc(addr, size)		ioremap((addr), (size))
 #define ioremap_cache(addr, size) \
@@ -766,6 +912,7 @@ static inline unsigned long virt_to_phys(volatile void * address)
 
 	return __pa((unsigned long)address);
 }
+#define virt_to_phys virt_to_phys
 
 /**
  *	phys_to_virt	-	map physical address to virtual
@@ -783,6 +930,7 @@ static inline void * phys_to_virt(unsigned long address)
 {
 	return (void *)__va(address);
 }
+#define phys_to_virt phys_to_virt
 
 /*
  * Change "struct page" to physical address.
@@ -810,6 +958,7 @@ static inline unsigned long virt_to_bus(volatile void * address)
 		return 0;
         return __pa(address) + PCI_DRAM_OFFSET;
 }
+#define virt_to_bus virt_to_bus
 
 static inline void * bus_to_virt(unsigned long address)
 {
@@ -817,6 +966,7 @@ static inline void * bus_to_virt(unsigned long address)
 		return NULL;
         return __va(address - PCI_DRAM_OFFSET);
 }
+#define bus_to_virt bus_to_virt
 
 #define page_to_bus(page)	(page_to_phys(page) + PCI_DRAM_OFFSET)
 
@@ -855,6 +1005,8 @@ static inline void * bus_to_virt(unsigned long address)
 
 #define clrsetbits_8(addr, clear, set) clrsetbits(8, addr, clear, set)
 
+#include <asm-generic/io.h>
+
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_POWERPC_IO_H */
diff --git a/arch/powerpc/kernel/iomap.c b/arch/powerpc/kernel/iomap.c
index 9fe4fb3b08aa..72862a4d3a5d 100644
--- a/arch/powerpc/kernel/iomap.c
+++ b/arch/powerpc/kernel/iomap.c
@@ -11,177 +11,11 @@
 #include <asm/pci-bridge.h>
 #include <asm/isa-bridge.h>
 
-/*
- * Here comes the ppc64 implementation of the IOMAP 
- * interfaces.
- */
-unsigned int ioread8(const void __iomem *addr)
-{
-	return readb(addr);
-}
-unsigned int ioread16(const void __iomem *addr)
-{
-	return readw(addr);
-}
-unsigned int ioread16be(const void __iomem *addr)
-{
-	return readw_be(addr);
-}
-unsigned int ioread32(const void __iomem *addr)
-{
-	return readl(addr);
-}
-unsigned int ioread32be(const void __iomem *addr)
-{
-	return readl_be(addr);
-}
-EXPORT_SYMBOL(ioread8);
-EXPORT_SYMBOL(ioread16);
-EXPORT_SYMBOL(ioread16be);
-EXPORT_SYMBOL(ioread32);
-EXPORT_SYMBOL(ioread32be);
-#ifdef __powerpc64__
-u64 ioread64(const void __iomem *addr)
-{
-	return readq(addr);
-}
-u64 ioread64_lo_hi(const void __iomem *addr)
-{
-	return readq(addr);
-}
-u64 ioread64_hi_lo(const void __iomem *addr)
-{
-	return readq(addr);
-}
-u64 ioread64be(const void __iomem *addr)
-{
-	return readq_be(addr);
-}
-u64 ioread64be_lo_hi(const void __iomem *addr)
-{
-	return readq_be(addr);
-}
-u64 ioread64be_hi_lo(const void __iomem *addr)
-{
-	return readq_be(addr);
-}
-EXPORT_SYMBOL(ioread64);
-EXPORT_SYMBOL(ioread64_lo_hi);
-EXPORT_SYMBOL(ioread64_hi_lo);
-EXPORT_SYMBOL(ioread64be);
-EXPORT_SYMBOL(ioread64be_lo_hi);
-EXPORT_SYMBOL(ioread64be_hi_lo);
-#endif /* __powerpc64__ */
-
-void iowrite8(u8 val, void __iomem *addr)
-{
-	writeb(val, addr);
-}
-void iowrite16(u16 val, void __iomem *addr)
-{
-	writew(val, addr);
-}
-void iowrite16be(u16 val, void __iomem *addr)
-{
-	writew_be(val, addr);
-}
-void iowrite32(u32 val, void __iomem *addr)
-{
-	writel(val, addr);
-}
-void iowrite32be(u32 val, void __iomem *addr)
-{
-	writel_be(val, addr);
-}
-EXPORT_SYMBOL(iowrite8);
-EXPORT_SYMBOL(iowrite16);
-EXPORT_SYMBOL(iowrite16be);
-EXPORT_SYMBOL(iowrite32);
-EXPORT_SYMBOL(iowrite32be);
-#ifdef __powerpc64__
-void iowrite64(u64 val, void __iomem *addr)
-{
-	writeq(val, addr);
-}
-void iowrite64_lo_hi(u64 val, void __iomem *addr)
-{
-	writeq(val, addr);
-}
-void iowrite64_hi_lo(u64 val, void __iomem *addr)
-{
-	writeq(val, addr);
-}
-void iowrite64be(u64 val, void __iomem *addr)
-{
-	writeq_be(val, addr);
-}
-void iowrite64be_lo_hi(u64 val, void __iomem *addr)
-{
-	writeq_be(val, addr);
-}
-void iowrite64be_hi_lo(u64 val, void __iomem *addr)
-{
-	writeq_be(val, addr);
-}
-EXPORT_SYMBOL(iowrite64);
-EXPORT_SYMBOL(iowrite64_lo_hi);
-EXPORT_SYMBOL(iowrite64_hi_lo);
-EXPORT_SYMBOL(iowrite64be);
-EXPORT_SYMBOL(iowrite64be_lo_hi);
-EXPORT_SYMBOL(iowrite64be_hi_lo);
-#endif /* __powerpc64__ */
-
-/*
- * These are the "repeat read/write" functions. Note the
- * non-CPU byte order. We do things in "IO byteorder"
- * here.
- *
- * FIXME! We could make these do EEH handling if we really
- * wanted. Not clear if we do.
- */
-void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
-{
-	readsb(addr, dst, count);
-}
-void ioread16_rep(const void __iomem *addr, void *dst, unsigned long count)
-{
-	readsw(addr, dst, count);
-}
-void ioread32_rep(const void __iomem *addr, void *dst, unsigned long count)
-{
-	readsl(addr, dst, count);
-}
-EXPORT_SYMBOL(ioread8_rep);
-EXPORT_SYMBOL(ioread16_rep);
-EXPORT_SYMBOL(ioread32_rep);
-
-void iowrite8_rep(void __iomem *addr, const void *src, unsigned long count)
-{
-	writesb(addr, src, count);
-}
-void iowrite16_rep(void __iomem *addr, const void *src, unsigned long count)
-{
-	writesw(addr, src, count);
-}
-void iowrite32_rep(void __iomem *addr, const void *src, unsigned long count)
-{
-	writesl(addr, src, count);
-}
-EXPORT_SYMBOL(iowrite8_rep);
-EXPORT_SYMBOL(iowrite16_rep);
-EXPORT_SYMBOL(iowrite32_rep);
-
 void __iomem *ioport_map(unsigned long port, unsigned int len)
 {
 	return (void __iomem *) (port + _IO_BASE);
 }
-
-void ioport_unmap(void __iomem *addr)
-{
-	/* Nothing to do */
-}
 EXPORT_SYMBOL(ioport_map);
-EXPORT_SYMBOL(ioport_unmap);
 
 #ifdef CONFIG_PCI
 void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
-- 
2.25.0

