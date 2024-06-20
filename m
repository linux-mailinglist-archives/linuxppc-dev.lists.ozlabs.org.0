Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 000A7911ACA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 07:59:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W569z36h9z30Vs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 15:59:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=52.205.10.60; helo=smtp-usa1.onexmail.com; envelope-from=jialong.yang@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 348 seconds by postgrey-1.37 at boromir; Thu, 20 Jun 2024 18:58:55 AEST
Received: from smtp-usa1.onexmail.com (smtp-usa1.onexmail.com [52.205.10.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4ZCz0SHtz2ysd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 18:58:54 +1000 (AEST)
X-QQ-mid: bizesmtpsz3t1718873509t77bppn
X-QQ-Originating-IP: wrjiMLAB4hMt+TR0SeF11oGDu37PiBlY+nuyZyiPodU=
Received: from HX01040022.powercore.com.cn ( [223.112.234.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Jun 2024 16:51:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11677031928242655138
From: Jialong Yang <jialong.yang@shingroup.cn>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH v1 2/2] powerpc/mmiotrace: bind ioremap and page fault to active mmiotrace
Date: Thu, 20 Jun 2024 16:51:18 +0800
Message-Id: <4cb8e7e64c93454518075fc14bf05daf0dce8f7b.1718873074.git.jialong.yang@shingroup.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
References: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz6a-1
X-Mailman-Approved-At: Fri, 21 Jun 2024 15:58:23 +1000
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
Cc: shenghui.qu@shingroup.cn, luming.yu@shingroup.cn, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jialong Yang <jialong.yang@shingroup.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hacking the code in ioremap entry and page fault handler entry to
integrate mmiotrace.

Signed-off-by: Jialong Yang <jialong.yang@shingroup.cn>
---
 arch/powerpc/mm/fault.c      | 17 +++++++++++++++++
 arch/powerpc/mm/ioremap_64.c | 11 +++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 215690452495..b03cba73de92 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -22,6 +22,7 @@
 #include <linux/ptrace.h>
 #include <linux/mman.h>
 #include <linux/mm.h>
+#include <linux/mmiotrace.h>
 #include <linux/interrupt.h>
 #include <linux/highmem.h>
 #include <linux/extable.h>
@@ -50,6 +51,19 @@
  * do_page_fault error handling helpers
  */
 
+/*
+ * Returns 0 if mmiotrace is disabled, or if the fault is not
+ * handled by mmiotrace:
+ */
+static nokprobe_inline int
+kmmio_fault(struct pt_regs *regs, unsigned long addr)
+{
+	if (unlikely(is_kmmio_active()))
+		if (kmmio_handler(regs, addr) == 1)
+			return -1;
+	return 0;
+}
+
 static int
 __bad_area_nosemaphore(struct pt_regs *regs, unsigned long address, int si_code)
 {
@@ -422,6 +436,9 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	vm_fault_t fault, major = 0;
 	bool kprobe_fault = kprobe_page_fault(regs, 11);
 
+	if (unlikely(kmmio_fault(regs, address)))
+		return 0;
+
 	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
 		return 0;
 
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
index d24e5f166723..f5f717bf35df 100644
--- a/arch/powerpc/mm/ioremap_64.c
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -3,12 +3,15 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <linux/mmiotrace.h>
 
 void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 			       pgprot_t prot, void *caller)
 {
 	phys_addr_t paligned, offset;
 	void __iomem *ret;
+	phys_addr_t unaligned_phys_addr = addr;
+	const unsigned long unaligned_size = size;
 	int err;
 
 	/* We don't support the 4K PFN hack with ioremap */
@@ -28,8 +31,11 @@ void __iomem *__ioremap_caller(phys_addr_t addr, unsigned long size,
 	if (size == 0 || paligned == 0)
 		return NULL;
 
-	if (slab_is_available())
-		return generic_ioremap_prot(addr, size, prot);
+	if (slab_is_available()) {
+		ret = generic_ioremap_prot(addr, size, prot);
+		mmiotrace_ioremap(unaligned_phys_addr, unaligned_size, ret);
+		return ret;
+	}
 
 	pr_warn("ioremap() called early from %pS. Use early_ioremap() instead\n", caller);
 
@@ -52,6 +58,7 @@ void iounmap(volatile void __iomem *token)
 	if (!slab_is_available())
 		return;
 
+	mmiotrace_iounmap(token);
 	generic_iounmap(PCI_FIX_ADDR(token));
 }
 EXPORT_SYMBOL(iounmap);
-- 
2.34.1

