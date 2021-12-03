Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE09467574
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 11:44:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J58ZX5hHkz3cQs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 21:44:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=amit.kachhap@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J58Z61P7Dz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 21:43:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F311A15AD;
 Fri,  3 Dec 2021 02:43:36 -0800 (PST)
Received: from a077416.arm.com (unknown [10.163.33.180])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1539C3F5A1;
 Fri,  3 Dec 2021 02:43:32 -0800 (PST)
From: Amit Daniel Kachhap <amit.kachhap@arm.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 11/14] powerpc/crash_dump: Use the new interface
 copy_oldmem_page_buf
Date: Fri,  3 Dec 2021 16:12:28 +0530
Message-Id: <20211203104231.17597-12-amit.kachhap@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211203104231.17597-1-amit.kachhap@arm.com>
References: <20211203104231.17597-1-amit.kachhap@arm.com>
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
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, kexec <kexec@lists.infradead.org>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Paul Mackerras <paulus@samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
 linuxppc <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current interface copy_oldmem_page() passes user pointer without
__user annotation and hence does unnecessary user/kernel pointer
conversions during its implementation.

Use the interface copy_oldmem_page_buf() to avoid this issue.

Cc: Michael Ellerman <mpe@ellerman.id.au>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
---
 arch/powerpc/kernel/crash_dump.c | 33 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/crash_dump.c b/arch/powerpc/kernel/crash_dump.c
index 5693e1c67c2b..a1c8a3a11694 100644
--- a/arch/powerpc/kernel/crash_dump.c
+++ b/arch/powerpc/kernel/crash_dump.c
@@ -68,33 +68,34 @@ void __init setup_kdump_trampoline(void)
 }
 #endif /* CONFIG_NONSTATIC_KERNEL */
 
-static size_t copy_oldmem_vaddr(void *vaddr, char *buf, size_t csize,
-                               unsigned long offset, int userbuf)
+static size_t copy_oldmem_vaddr(void *vaddr, char __user *ubuf, char *kbuf,
+				size_t csize, unsigned long offset)
 {
-	if (userbuf) {
-		if (copy_to_user((char __user *)buf, (vaddr + offset), csize))
+	if (ubuf) {
+		if (copy_to_user(ubuf, (vaddr + offset), csize))
 			return -EFAULT;
 	} else
-		memcpy(buf, (vaddr + offset), csize);
+		memcpy(kbuf, (vaddr + offset), csize);
 
 	return csize;
 }
 
 /**
- * copy_oldmem_page - copy one page from "oldmem"
+ * copy_oldmem_page_buf - copy one page from "oldmem"
  * @pfn: page frame number to be copied
- * @buf: target memory address for the copy; this can be in kernel address
- *      space or user address space (see @userbuf)
+ * @ubuf: target user memory address for the copy; use copy_to_user() if this
+ * address is present
+ * @kbuf: target kernel memory address for the copy; use memcpy() if this
+ * address is present
  * @csize: number of bytes to copy
  * @offset: offset in bytes into the page (based on pfn) to begin the copy
- * @userbuf: if set, @buf is in user address space, use copy_to_user(),
- *      otherwise @buf is in kernel address space, use memcpy().
  *
- * Copy a page from "oldmem". For this page, there is no pte mapped
- * in the current kernel. We stitch up a pte, similar to kmap_atomic.
+ * Copy a page from "oldmem" into buffer pointed by either @ubuf or @kbuf. For
+ * this page, there is no pte mapped in the current kernel. We stitch up a pte,
+ * similar to kmap_atomic.
  */
-ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
-			size_t csize, unsigned long offset, int userbuf)
+ssize_t copy_oldmem_page_buf(unsigned long pfn, char __user *ubuf, char *kbuf,
+			     size_t csize, unsigned long offset)
 {
 	void  *vaddr;
 	phys_addr_t paddr;
@@ -107,10 +108,10 @@ ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
 
 	if (memblock_is_region_memory(paddr, csize)) {
 		vaddr = __va(paddr);
-		csize = copy_oldmem_vaddr(vaddr, buf, csize, offset, userbuf);
+		csize = copy_oldmem_vaddr(vaddr, ubuf, kbuf, csize, offset);
 	} else {
 		vaddr = ioremap_cache(paddr, PAGE_SIZE);
-		csize = copy_oldmem_vaddr(vaddr, buf, csize, offset, userbuf);
+		csize = copy_oldmem_vaddr(vaddr, ubuf, kbuf, csize, offset);
 		iounmap(vaddr);
 	}
 
-- 
2.17.1

