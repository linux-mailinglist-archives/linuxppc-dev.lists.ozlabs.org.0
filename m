Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2142DA1403
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:47:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jx753N37zDqjY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 46Jx4p08nXzDq9l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:44:57 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 431D3AE80037;
 Thu, 29 Aug 2019 04:44:01 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] powerpc/of/pci: Rewrite pci_parse_of_flags
Date: Thu, 29 Aug 2019 18:44:17 +1000
Message-Id: <20190829084417.71873-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The existing code uses bunch of hardcoded values from the PCI Bus Binding
to IEEE Std 1275 spec; and it does so in quite non-obvious way.

This defines fields from the cell#0 of the "reg" property of a PCI device
and uses them for parsing.

This should cause no behavioral change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* fixed a bug with incorrect addr0&(OF_PCI_ADDR0_SPACE_MMIO32|OF_PCI_ADDR0_SPACE_MMIO64)
- defined OF_PCI_ADDR0_SPACE_MASK instead
* moved the comment out of function body
* cut-n-pasted address space donotions
---
 arch/powerpc/kernel/pci_of_scan.c | 57 ++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
index 409c6c1beabf..5bfc937c2268 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -34,18 +34,57 @@ static u32 get_int_prop(struct device_node *np, const char *name, u32 def)
  * pci_parse_of_flags - Parse the flags cell of a device tree PCI address
  * @addr0: value of 1st cell of a device tree PCI address.
  * @bridge: Set this flag if the address is from a bridge 'ranges' property
+ *
+ * PCI Bus Binding to IEEE Std 1275-1994
+ *
+ * Bit#            33222222 22221111 11111100 00000000
+ *                 10987654 32109876 54321098 76543210
+ * phys.hi cell:   npt000ss bbbbbbbb dddddfff rrrrrrrr
+ * phys.mid cell:  hhhhhhhh hhhhhhhh hhhhhhhh hhhhhhhh
+ * phys.lo cell:   llllllll llllllll llllllll llllllll
+ *
+ * where:
+ * n        is 0 if the address is relocatable, 1 otherwise
+ * p        is 1 if the addressable region is "prefetchable", 0 otherwise
+ * t        is 1 if the address is aliased (for non-relocatable I/O),
+ *          below 1 MB (for Memory),or below 64 KB (for relocatable I/O).
+ * ss       is the space code, denoting the address space:
+ *              00 denotes Configuration Space
+ *              01 denotes I/O Space
+ *              10 denotes 32-bit-address Memory Space
+ *              11 denotes 64-bit-address Memory Space
+ * bbbbbbbb is the 8-bit Bus Number
+ * ddddd    is the 5-bit Device Number
+ * fff      is the 3-bit Function Number
+ * rrrrrrrr is the 8-bit Register Number
  */
+#define OF_PCI_ADDR0_SPACE(ss)		(((ss)&3)<<24)
+#define OF_PCI_ADDR0_SPACE_CFG		OF_PCI_ADDR0_SPACE(0)
+#define OF_PCI_ADDR0_SPACE_IO		OF_PCI_ADDR0_SPACE(1)
+#define OF_PCI_ADDR0_SPACE_MMIO32	OF_PCI_ADDR0_SPACE(2)
+#define OF_PCI_ADDR0_SPACE_MMIO64	OF_PCI_ADDR0_SPACE(3)
+#define OF_PCI_ADDR0_SPACE_MASK		OF_PCI_ADDR0_SPACE(3)
+#define OF_PCI_ADDR0_RELOC		(1UL<<31)
+#define OF_PCI_ADDR0_PREFETCH		(1UL<<30)
+#define OF_PCI_ADDR0_ALIAS		(1UL<<29)
+#define OF_PCI_ADDR0_BUS		0x00FF0000UL
+#define OF_PCI_ADDR0_DEV		0x0000F800UL
+#define OF_PCI_ADDR0_FN			0x00000700UL
+#define OF_PCI_ADDR0_BARREG		0x000000FFUL
+
 unsigned int pci_parse_of_flags(u32 addr0, int bridge)
 {
-	unsigned int flags = 0;
+	unsigned int flags = 0, as = addr0 & OF_PCI_ADDR0_SPACE_MASK;
 
-	if (addr0 & 0x02000000) {
+	if (as == OF_PCI_ADDR0_SPACE_MMIO32 ||
+	    as == OF_PCI_ADDR0_SPACE_MMIO64) {
 		flags = IORESOURCE_MEM | PCI_BASE_ADDRESS_SPACE_MEMORY;
-		flags |= (addr0 >> 22) & PCI_BASE_ADDRESS_MEM_TYPE_64;
-		if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64)
-			flags |= IORESOURCE_MEM_64;
-		flags |= (addr0 >> 28) & PCI_BASE_ADDRESS_MEM_TYPE_1M;
-		if (addr0 & 0x40000000)
+		if (as == OF_PCI_ADDR0_SPACE_MMIO64)
+			flags |= PCI_BASE_ADDRESS_MEM_TYPE_64 |
+				IORESOURCE_MEM_64;
+		if (addr0 & OF_PCI_ADDR0_ALIAS)
+			flags |= PCI_BASE_ADDRESS_MEM_TYPE_1M;
+		if (addr0 & OF_PCI_ADDR0_PREFETCH)
 			flags |= IORESOURCE_PREFETCH
 				 | PCI_BASE_ADDRESS_MEM_PREFETCH;
 		/* Note: We don't know whether the ROM has been left enabled
@@ -53,9 +92,9 @@ unsigned int pci_parse_of_flags(u32 addr0, int bridge)
 		 * not set the IORESOURCE_ROM_ENABLE flag) for now rather than
 		 * do a config space read, it will be force-enabled if needed
 		 */
-		if (!bridge && (addr0 & 0xff) == 0x30)
+		if (!bridge && (addr0 & OF_PCI_ADDR0_BARREG) == PCI_ROM_ADDRESS)
 			flags |= IORESOURCE_READONLY;
-	} else if (addr0 & 0x01000000)
+	} else if (as == OF_PCI_ADDR0_SPACE_IO)
 		flags = IORESOURCE_IO | PCI_BASE_ADDRESS_SPACE_IO;
 	if (flags)
 		flags |= IORESOURCE_SIZEALIGN;
-- 
2.17.1

