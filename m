Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF866561
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 05:54:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lJvL2qg0zDqSJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 13:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.alibaba.com
 (client-ip=47.88.44.36; helo=out4436.biz.mail.alibaba.com;
 envelope-from=alex.shi@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lGxj1gdtzDqkp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 12:26:00 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=21; SR=0; TI=SMTPD_---0TWfJjL-_1562898031; 
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWfJjL-_1562898031) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 12 Jul 2019 10:20:31 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 03/12] Documentation/ia64: repointer docs to
 Documentation/arch/ia64
Date: Fri, 12 Jul 2019 10:20:09 +0800
Message-Id: <20190712022018.27989-3-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jul 2019 13:28:55 +1000
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
Cc: Tony Luck <tony.luck@intel.com>, linux-s390@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Alex Shi <alex.shi@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since we move 'ia64' docs to Documentation/arch/ia64 dir,
redirect the doc pointer to them.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
---
 MAINTAINERS             | 2 +-
 arch/ia64/kernel/efi.c  | 2 +-
 arch/ia64/kernel/fsys.S | 2 +-
 arch/ia64/mm/ioremap.c  | 2 +-
 arch/ia64/pci/pci.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c21d5464c86f..583c35cba7bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14286,7 +14286,7 @@ SGI SN-IA64 (Altix) SERIAL CONSOLE DRIVER
 M:	Pat Gefre <pfg@sgi.com>
 L:	linux-ia64@vger.kernel.org
 S:	Supported
-F:	Documentation/ia64/serial.txt
+F:	Documentation/arch/ia64/serial.txt
 F:	drivers/tty/serial/ioc?_serial.c
 F:	include/linux/ioc?.h
 
diff --git a/arch/ia64/kernel/efi.c b/arch/ia64/kernel/efi.c
index 8f106638913c..02cdc38d15e8 100644
--- a/arch/ia64/kernel/efi.c
+++ b/arch/ia64/kernel/efi.c
@@ -852,7 +852,7 @@ valid_phys_addr_range (phys_addr_t phys_addr, unsigned long size)
 	 * /dev/mem reads and writes use copy_to_user(), which implicitly
 	 * uses a granule-sized kernel identity mapping.  It's really
 	 * only safe to do this for regions in kern_memmap.  For more
-	 * details, see Documentation/ia64/aliasing.txt.
+	 * details, see Documentation/arch/ia64/aliasing.txt.
 	 */
 	attr = kern_mem_attribute(phys_addr, size);
 	if (attr & EFI_MEMORY_WB || attr & EFI_MEMORY_UC)
diff --git a/arch/ia64/kernel/fsys.S b/arch/ia64/kernel/fsys.S
index d80c99a5f55d..b493ca74890a 100644
--- a/arch/ia64/kernel/fsys.S
+++ b/arch/ia64/kernel/fsys.S
@@ -28,7 +28,7 @@
 #include <asm/native/inst.h>
 
 /*
- * See Documentation/ia64/fsys.txt for details on fsyscalls.
+ * See Documentation/arch/ia64/fsys.txt for details on fsyscalls.
  *
  * On entry to an fsyscall handler:
  *   r10	= 0 (i.e., defaults to "successful syscall return")
diff --git a/arch/ia64/mm/ioremap.c b/arch/ia64/mm/ioremap.c
index 5e3e7b1fdac5..989cc4df9087 100644
--- a/arch/ia64/mm/ioremap.c
+++ b/arch/ia64/mm/ioremap.c
@@ -42,7 +42,7 @@ ioremap (unsigned long phys_addr, unsigned long size)
 	/*
 	 * For things in kern_memmap, we must use the same attribute
 	 * as the rest of the kernel.  For more details, see
-	 * Documentation/ia64/aliasing.txt.
+	 * Documentation/arch/ia64/aliasing.txt.
 	 */
 	attr = kern_mem_attribute(phys_addr, size);
 	if (attr & EFI_MEMORY_WB)
diff --git a/arch/ia64/pci/pci.c b/arch/ia64/pci/pci.c
index e308196c2229..6ba87b70e30c 100644
--- a/arch/ia64/pci/pci.c
+++ b/arch/ia64/pci/pci.c
@@ -450,7 +450,7 @@ pci_mmap_legacy_page_range(struct pci_bus *bus, struct vm_area_struct *vma,
 		return -ENOSYS;
 
 	/*
-	 * Avoid attribute aliasing.  See Documentation/ia64/aliasing.txt
+	 * Avoid attribute aliasing.  See Documentation/arch/ia64/aliasing.txt
 	 * for more details.
 	 */
 	if (!valid_mmap_phys_addr_range(vma->vm_pgoff, size))
-- 
2.19.1.856.g8858448bb

