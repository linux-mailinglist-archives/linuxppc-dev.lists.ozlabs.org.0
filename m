Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D021C6CB1D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 00:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Plnbh5dRJz3fTp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 09:31:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.171; helo=mail-oi1-f171.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Plnb62kbwz3cfd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 09:30:57 +1100 (AEDT)
Received: by mail-oi1-f171.google.com with SMTP id bi31so7580333oib.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 15:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679956255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaM8q8QF+IQ6nWYjMCRw/gvGqbSwmBUlsgKxklFnTd4=;
        b=OaS7wduJGEw7JgPRKqElSiKuks1/GrQUYH4NE9wa+9/jS6vNuX8pIgl5ZN/rVvW2Nm
         QCeab+GljqMJDmcpnbmRUqDdHl3DVmyjpVdNRj+erPpMioHtZMJjYvt2QNHsYFPNU8i2
         seLEqdidzL0dUGF8yPAc9zdas+ZHGPEZN3vNaY4cqCzteXIpZWLm2EDEfVqd9YInlO0m
         8eT8Jcs6o1QjSGkWA/Ehj4YCvyOhWw7qzSFBG+O52uCkv+JxAd8hxCvLS0YGxHjyqZMx
         N5CHt2IOHj5T+VBlBtbDLqf/PrO18xjpK2uks119bGbYJJSmifukxBk8f1KYWbvAZ97I
         lxuw==
X-Gm-Message-State: AO0yUKWZQF/xLICb4vo9BGJUeGAg1BPiBeHgCEs+8zoi16FhCuOKNVxq
	hWzBm8ue5Tn2OapJM7gDPA==
X-Google-Smtp-Source: AK7set/1miGgLn0ymy+7VSFsPmHFvN9Y36ZA0WMc3bkqnmG77aBzAjHJgPqJMDiFTxWo0Dk8xMgWQQ==
X-Received: by 2002:a54:4418:0:b0:378:6ca0:11e9 with SMTP id k24-20020a544418000000b003786ca011e9mr5643146oiw.28.1679956254438;
        Mon, 27 Mar 2023 15:30:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y184-20020aca32c1000000b0037841fb9a65sm11730984oiy.5.2023.03.27.15.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 15:30:53 -0700 (PDT)
Received: (nullmailer pid 820043 invoked by uid 1000);
	Mon, 27 Mar 2023 22:30:53 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: isa-bridge: Remove open coded "ranges" parsing
Date: Mon, 27 Mar 2023 17:30:45 -0500
Message-Id: <20230327223045.819852-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"ranges" is a standard property with common parsing functions. Users
shouldn't be implementing their own parsing of it. Reimplement the
ISA brige "ranges" parsing using the common ranges iterator functions.

The common routines are flexible enough to work on PCI and non-PCI to
ISA bridges, so refactor pci_process_ISA_OF_ranges() and
isa_bridge_init_non_pci() into a single implementation.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Compile tested only!
---
 arch/powerpc/kernel/isa-bridge.c | 169 ++++++++-----------------------
 1 file changed, 40 insertions(+), 129 deletions(-)

diff --git a/arch/powerpc/kernel/isa-bridge.c b/arch/powerpc/kernel/isa-bridge.c
index dc746611ebc0..438605395cd4 100644
--- a/arch/powerpc/kernel/isa-bridge.c
+++ b/arch/powerpc/kernel/isa-bridge.c
@@ -55,80 +55,52 @@ static void remap_isa_base(phys_addr_t pa, unsigned long size)
 	}
 }
 
-static void pci_process_ISA_OF_ranges(struct device_node *isa_node,
-				      unsigned long phb_io_base_phys)
+static int process_ISA_OF_ranges(struct device_node *isa_node,
+				  unsigned long phb_io_base_phys)
 {
-	/* We should get some saner parsing here and remove these structs */
-	struct pci_address {
-		u32 a_hi;
-		u32 a_mid;
-		u32 a_lo;
-	};
-
-	struct isa_address {
-		u32 a_hi;
-		u32 a_lo;
-	};
-
-	struct isa_range {
-		struct isa_address isa_addr;
-		struct pci_address pci_addr;
-		unsigned int size;
-	};
-
-	const struct isa_range *range;
-	unsigned long pci_addr;
-	unsigned int isa_addr;
 	unsigned int size;
-	int rlen = 0;
+	struct of_range_parser parser;
+	struct of_range range;
 
-	range = of_get_property(isa_node, "ranges", &rlen);
-	if (range == NULL || (rlen < sizeof(struct isa_range)))
+	if (of_range_parser_init(&parser, isa_node))
 		goto inval_range;
 
-	/* From "ISA Binding to 1275"
-	 * The ranges property is laid out as an array of elements,
-	 * each of which comprises:
-	 *   cells 0 - 1:	an ISA address
-	 *   cells 2 - 4:	a PCI address
-	 *			(size depending on dev->n_addr_cells)
-	 *   cell 5:		the size of the range
-	 */
-	if ((range->isa_addr.a_hi & ISA_SPACE_MASK) != ISA_SPACE_IO) {
-		range++;
-		rlen -= sizeof(struct isa_range);
-		if (rlen < sizeof(struct isa_range))
-			goto inval_range;
-	}
-	if ((range->isa_addr.a_hi & ISA_SPACE_MASK) != ISA_SPACE_IO)
-		goto inval_range;
+	for_each_of_range(&parser, &range) {
+		if ((range.flags & ISA_SPACE_MASK) != ISA_SPACE_IO)
+			continue;
 
-	isa_addr = range->isa_addr.a_lo;
-	pci_addr = (unsigned long) range->pci_addr.a_mid << 32 |
-		range->pci_addr.a_lo;
+		if (range.cpu_addr == OF_BAD_ADDR) {
+			printk(KERN_ERR "ISA: Bad CPU mapping: %s\n",
+			__func__);
+			return -EINVAL;
+		}
 
-	/* Assume these are both zero. Note: We could fix that and
-	 * do a proper parsing instead ... oh well, that will do for
-	 * now as nobody uses fancy mappings for ISA bridges
-	 */
-	if ((pci_addr != 0) || (isa_addr != 0)) {
-		printk(KERN_ERR "unexpected isa to pci mapping: %s\n",
-		       __func__);
-		return;
-	}
+		/* We need page alignment */
+		if ((range.bus_addr & ~PAGE_MASK) || (range.cpu_addr & ~PAGE_MASK)) {
+			pr_warn("ISA: bridge %pOF has non aligned IO range\n",
+				isa_node);
+			return -EINVAL;
+		}
 
-	/* Align size and make sure it's cropped to 64K */
-	size = PAGE_ALIGN(range->size);
-	if (size > 0x10000)
-		size = 0x10000;
+		/* Align size and make sure it's cropped to 64K */
+		size = PAGE_ALIGN(range.size);
+		if (size > 0x10000)
+			size = 0x10000;
 
-	remap_isa_base(phb_io_base_phys, size);
-	return;
+		if (!phb_io_base_phys)
+			phb_io_base_phys = range.cpu_addr;
+
+		remap_isa_base(phb_io_base_phys, size);
+		return 0;
+	}
 
 inval_range:
-	printk(KERN_ERR "no ISA IO ranges or unexpected isa range, "
-	       "mapping 64k\n");
-	remap_isa_base(phb_io_base_phys, 0x10000);
+	if (!phb_io_base_phys) {
+		printk(KERN_ERR "no ISA IO ranges or unexpected isa range, "
+		       "mapping 64k\n");
+		remap_isa_base(phb_io_base_phys, 0x10000);
+	}
+	return 0;
 }
 
 
@@ -170,7 +142,7 @@ void __init isa_bridge_find_early(struct pci_controller *hose)
 	isa_bridge_devnode = np;
 
 	/* Now parse the "ranges" property and setup the ISA mapping */
-	pci_process_ISA_OF_ranges(np, hose->io_base_phys);
+	process_ISA_OF_ranges(np, hose->io_base_phys);
 
 	/* Set the global ISA io base to indicate we have an ISA bridge */
 	isa_io_base = ISA_IO_BASE;
@@ -186,75 +158,15 @@ void __init isa_bridge_find_early(struct pci_controller *hose)
  */
 void __init isa_bridge_init_non_pci(struct device_node *np)
 {
-	const __be32 *ranges, *pbasep = NULL;
-	int rlen, i, rs;
-	u32 na, ns, pna;
-	u64 cbase, pbase, size = 0;
+	int ret;
 
 	/* If we already have an ISA bridge, bail off */
 	if (isa_bridge_devnode != NULL)
 		return;
 
-	pna = of_n_addr_cells(np);
-	if (of_property_read_u32(np, "#address-cells", &na) ||
-	    of_property_read_u32(np, "#size-cells", &ns)) {
-		pr_warn("ISA: Non-PCI bridge %pOF is missing address format\n",
-			np);
-		return;
-	}
-
-	/* Check it's a supported address format */
-	if (na != 2 || ns != 1) {
-		pr_warn("ISA: Non-PCI bridge %pOF has unsupported address format\n",
-			np);
-		return;
-	}
-	rs = na + ns + pna;
-
-	/* Grab the ranges property */
-	ranges = of_get_property(np, "ranges", &rlen);
-	if (ranges == NULL || rlen < rs) {
-		pr_warn("ISA: Non-PCI bridge %pOF has absent or invalid ranges\n",
-			np);
-		return;
-	}
-
-	/* Parse it. We are only looking for IO space */
-	for (i = 0; (i + rs - 1) < rlen; i += rs) {
-		if (be32_to_cpup(ranges + i) != 1)
-			continue;
-		cbase = be32_to_cpup(ranges + i + 1);
-		size = of_read_number(ranges + i + na + pna, ns);
-		pbasep = ranges + i + na;
-		break;
-	}
-
-	/* Got something ? */
-	if (!size || !pbasep) {
-		pr_warn("ISA: Non-PCI bridge %pOF has no usable IO range\n",
-			np);
+	ret = process_ISA_OF_ranges(np, 0);
+	if (ret)
 		return;
-	}
-
-	/* Align size and make sure it's cropped to 64K */
-	size = PAGE_ALIGN(size);
-	if (size > 0x10000)
-		size = 0x10000;
-
-	/* Map pbase */
-	pbase = of_translate_address(np, pbasep);
-	if (pbase == OF_BAD_ADDR) {
-		pr_warn("ISA: Non-PCI bridge %pOF failed to translate IO base\n",
-			np);
-		return;
-	}
-
-	/* We need page alignment */
-	if ((cbase & ~PAGE_MASK) || (pbase & ~PAGE_MASK)) {
-		pr_warn("ISA: Non-PCI bridge %pOF has non aligned IO range\n",
-			np);
-		return;
-	}
 
 	/* Got it */
 	isa_bridge_devnode = np;
@@ -263,7 +175,6 @@ void __init isa_bridge_init_non_pci(struct device_node *np)
 	 * and map it
 	 */
 	isa_io_base = ISA_IO_BASE;
-	remap_isa_base(pbase, size);
 
 	pr_debug("ISA: Non-PCI bridge is %pOF\n", np);
 }
@@ -282,7 +193,7 @@ static void isa_bridge_find_late(struct pci_dev *pdev,
 	isa_bridge_pcidev = pdev;
 
 	/* Now parse the "ranges" property and setup the ISA mapping */
-	pci_process_ISA_OF_ranges(devnode, hose->io_base_phys);
+	process_ISA_OF_ranges(devnode, hose->io_base_phys);
 
 	/* Set the global ISA io base to indicate we have an ISA bridge */
 	isa_io_base = ISA_IO_BASE;
-- 
2.39.2

