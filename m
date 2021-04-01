Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA00B351536
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 15:31:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB3xg4mymz3bpP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 00:31:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB3wT59dzz2yRb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 00:30:48 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FB3wL4M4Rz9twjV;
 Thu,  1 Apr 2021 15:30:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6QXPlekH9PAh; Thu,  1 Apr 2021 15:30:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FB3wL0Y8pz9twjT;
 Thu,  1 Apr 2021 15:30:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 115448B99F;
 Thu,  1 Apr 2021 15:30:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5LZA3QbEPpKi; Thu,  1 Apr 2021 15:30:41 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B8888B991;
 Thu,  1 Apr 2021 15:30:41 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4954967646; Thu,  1 Apr 2021 13:30:41 +0000 (UTC)
Message-Id: <0c3d5cb8a4dfdf6ca1b8aeb385c01470d6628d55.1617283827.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/3] powerpc/modules: Load modules closer to kernel text
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 jniethe5@gmail.com
Date: Thu,  1 Apr 2021 13:30:41 +0000 (UTC)
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

On book3s/32, when STRICT_KERNEL_RWX is selected, modules are
allocated on the segment just before kernel text, ie on the
0xb0000000-0xbfffffff when PAGE_OFFSET is 0xc0000000.

On the 8xx, TASK_SIZE is 0x80000000. The space between TASK_SIZE and
PAGE_OFFSET is not used and could be used for modules.

The idea comes from ARM architecture.

Having modules just below PAGE_OFFSET offers an opportunity to
minimise the distance between kernel text and modules and avoid
trampolines in modules to access kernel functions or other module
functions.

When MODULES_VADDR is defined, powerpc has it's own module_alloc()
function. In that function, first try to allocate the module
above the limit defined by '_etext - 32M'. Then if the allocation
fails, fallback to the entire MODULES area.

DEBUG logs in module_32.c without the patch:

[ 1572.588822] module_32: Applying ADD relocate section 13 to 12
[ 1572.588891] module_32: Doing plt for call to 0xc00671a4 at 0xcae04024
[ 1572.588964] module_32: Initialized plt for 0xc00671a4 at cae04000
[ 1572.589037] module_32: REL24 value = CAE04000. location = CAE04024
[ 1572.589110] module_32: Location before: 48000001.
[ 1572.589171] module_32: Location after: 4BFFFFDD.
[ 1572.589231] module_32: ie. jump to 03FFFFDC+CAE04024 = CEE04000
[ 1572.589317] module_32: Applying ADD relocate section 15 to 14
[ 1572.589386] module_32: Doing plt for call to 0xc00671a4 at 0xcadfc018
[ 1572.589457] module_32: Initialized plt for 0xc00671a4 at cadfc000
[ 1572.589529] module_32: REL24 value = CADFC000. location = CADFC018
[ 1572.589601] module_32: Location before: 48000000.
[ 1572.589661] module_32: Location after: 4BFFFFE8.
[ 1572.589723] module_32: ie. jump to 03FFFFE8+CADFC018 = CEDFC000

With the patch:

[  279.404671] module_32: Applying ADD relocate section 13 to 12
[  279.404741] module_32: REL24 value = C00671B4. location = BF808024
[  279.404814] module_32: Location before: 48000001.
[  279.404874] module_32: Location after: 4885F191.
[  279.404933] module_32: ie. jump to 0085F190+BF808024 = C00671B4
[  279.405016] module_32: Applying ADD relocate section 15 to 14
[  279.405085] module_32: REL24 value = C00671B4. location = BF800018
[  279.405156] module_32: Location before: 48000000.
[  279.405215] module_32: Location after: 4886719C.
[  279.405275] module_32: ie. jump to 0086719C+BF800018 = C00671B4

We see that with the patch, no plt entries are set.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/module.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index a211b0253cdb..fab84024650c 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -14,6 +14,7 @@
 #include <asm/firmware.h>
 #include <linux/sort.h>
 #include <asm/setup.h>
+#include <asm/sections.h>
 
 static LIST_HEAD(module_bug_list);
 
@@ -88,12 +89,28 @@ int module_finalize(const Elf_Ehdr *hdr,
 }
 
 #ifdef MODULES_VADDR
+static __always_inline void *
+__module_alloc(unsigned long size, unsigned long start, unsigned long end)
+{
+	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
+				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
+				    __builtin_return_address(0));
+}
+
 void *module_alloc(unsigned long size)
 {
+	unsigned long limit = (unsigned long)_etext - SZ_32M;
+	void *ptr = NULL;
+
 	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
 
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
-				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+	/* First try within 32M limit from _etext to avoid branch trampolines */
+	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
+		ptr = __module_alloc(size, limit, MODULES_END);
+
+	if (!ptr)
+		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END);
+
+	return ptr;
 }
 #endif
-- 
2.25.0

