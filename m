Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 509E05476AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 18:56:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL3r31G9nz3dQq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 02:56:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL3qf6bqtz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 02:55:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LL3qb13Xnz9tSK;
	Sat, 11 Jun 2022 18:55:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFh1cxtmkzBP; Sat, 11 Jun 2022 18:55:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LL3qZ70grz9tSH;
	Sat, 11 Jun 2022 18:55:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DB59A8B77D;
	Sat, 11 Jun 2022 18:55:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cxP0qEisn2cd; Sat, 11 Jun 2022 18:55:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.192])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 96AB68B768;
	Sat, 11 Jun 2022 18:55:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25BGtQIQ742061
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 11 Jun 2022 18:55:26 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25BGtPqZ742060;
	Sat, 11 Jun 2022 18:55:25 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, jejb@linux.ibm.com,
        martin.petersen@oracle.com
Subject: [PATCH 1/2] powerpc: Don't include asm/setup.h in asm/machdep.h
Date: Sat, 11 Jun 2022 18:55:15 +0200
Message-Id: <3b1dfb19a2c3265fb4abc2bfc7b6eae9261a998b.1654966508.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1654966513; l=5413; s=20211009; h=from:subject:message-id; bh=vKt/zj5ubWanfk2yp2gMHh5WNCdyLmbGfiDJfEjxtqw=; b=HyRWk2N/BXduTigNxI0hSIFHBaxZrQtiXsfP/OnB4bSHTDAPXCIo5SDH1iHkWGpt/8HxFyRRfkr4 QJRdxnspCwX53tQMUhinIM1aY/ZbOwkv1Zui8d7rvM2OIeopjcsm
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

asm/machdep.h doesn't need asm/setup.h

Remove it.

Add it directly in files that needs it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/machdep.h     | 2 --
 arch/powerpc/kernel/pci-common.c       | 1 +
 arch/powerpc/kernel/prom.c             | 2 +-
 arch/powerpc/kernel/prom_init.c        | 2 +-
 arch/powerpc/kexec/core.c              | 1 +
 arch/powerpc/kvm/powerpc.c             | 1 +
 arch/powerpc/mm/mem.c                  | 1 +
 arch/powerpc/platforms/pseries/kexec.c | 2 +-
 arch/powerpc/platforms/pseries/lpar.c  | 2 +-
 arch/powerpc/platforms/pseries/setup.c | 1 +
 arch/powerpc/sysdev/fsl_pci.c          | 1 +
 drivers/scsi/mesh.c                    | 2 +-
 12 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 358d171ae8e0..613755afa8a9 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -8,8 +8,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
 
-#include <asm/setup.h>
-
 struct pt_regs;
 struct pci_bus;	
 struct device_node;
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 068410cd54a3..c87999289752 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -39,6 +39,7 @@
 #include <asm/machdep.h>
 #include <asm/ppc-pci.h>
 #include <asm/eeh.h>
+#include <asm/setup.h>
 
 #include "../../../drivers/pci/pci.h"
 
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index feae8509b59c..1066b072db35 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -44,7 +44,7 @@
 #include <asm/iommu.h>
 #include <asm/btext.h>
 #include <asm/sections.h>
-#include <asm/machdep.h>
+#include <asm/setup.h>
 #include <asm/pci-bridge.h>
 #include <asm/kexec.h>
 #include <asm/opal.h>
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 04694ec423f6..1939683e35ed 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -42,7 +42,7 @@
 #include <asm/iommu.h>
 #include <asm/btext.h>
 #include <asm/sections.h>
-#include <asm/machdep.h>
+#include <asm/setup.h>
 #include <asm/asm-prototypes.h>
 #include <asm/ultravisor-api.h>
 
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 7ab4980fe13a..9773dd0640f3 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -19,6 +19,7 @@
 #include <asm/machdep.h>
 #include <asm/pgalloc.h>
 #include <asm/sections.h>
+#include <asm/setup.h>
 
 void machine_kexec_mask_interrupts(void) {
 	unsigned int i;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 191992fcb2c2..fb1490761c87 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -33,6 +33,7 @@
 #include <asm/plpar_wrappers.h>
 #endif
 #include <asm/ultravisor.h>
+#include <asm/setup.h>
 
 #include "timing.h"
 #include "irq.h"
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 52b77684acda..2cf6748755e1 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -25,6 +25,7 @@
 #include <asm/mmzone.h>
 #include <asm/ftrace.h>
 #include <asm/code-patching.h>
+#include <asm/setup.h>
 
 #include <mm/mmu_decl.h>
 
diff --git a/arch/powerpc/platforms/pseries/kexec.c b/arch/powerpc/platforms/pseries/kexec.c
index ab6cdbebb35e..096d09ed89f6 100644
--- a/arch/powerpc/platforms/pseries/kexec.c
+++ b/arch/powerpc/platforms/pseries/kexec.c
@@ -6,7 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 
-#include <asm/machdep.h>
+#include <asm/setup.h>
 #include <asm/page.h>
 #include <asm/firmware.h>
 #include <asm/kexec.h>
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 937f9c010b22..e6c117fb6491 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -27,7 +27,7 @@
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
-#include <asm/machdep.h>
+#include <asm/setup.h>
 #include <asm/mmu_context.h>
 #include <asm/iommu.h>
 #include <asm/tlb.h>
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index afb074269b42..e86a749173e6 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -72,6 +72,7 @@
 #include <asm/svm.h>
 #include <asm/dtl.h>
 #include <asm/hvconsole.h>
+#include <asm/setup.h>
 
 #include "pseries.h"
 
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 1011cfea2e32..e8d072e98b66 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -38,6 +38,7 @@
 #include <asm/disassemble.h>
 #include <asm/ppc-opcode.h>
 #include <asm/swiotlb.h>
+#include <asm/setup.h>
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
 
diff --git a/drivers/scsi/mesh.c b/drivers/scsi/mesh.c
index 322d3ad38159..a74f0c2c8ba7 100644
--- a/drivers/scsi/mesh.c
+++ b/drivers/scsi/mesh.c
@@ -38,7 +38,7 @@
 #include <asm/irq.h>
 #include <asm/hydra.h>
 #include <asm/processor.h>
-#include <asm/machdep.h>
+#include <asm/setup.h>
 #include <asm/pmac_feature.h>
 #include <asm/macio.h>
 
-- 
2.35.3

