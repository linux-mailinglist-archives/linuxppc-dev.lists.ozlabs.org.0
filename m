Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EAB17B70B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 07:52:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YdbR2KHZzDqvY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 17:52:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YdMN3jlTzDqxM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 17:42:07 +1100 (AEDT)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4AFD3F8296F177E16BCD;
 Fri,  6 Mar 2020 14:42:01 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Mar 2020
 14:41:52 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>,
 <oss@buserror.net>
Subject: [PATCH v4 6/6] powerpc/fsl_booke/kaslr: rename kaslr-booke32.rst to
 kaslr-booke.rst and add 64bit part
Date: Fri, 6 Mar 2020 14:40:33 +0800
Message-ID: <20200306064033.3398-7-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200306064033.3398-1-yanaijie@huawei.com>
References: <20200306064033.3398-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
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
Cc: Jason Yan <yanaijie@huawei.com>, dja@axtens.net,
 linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now we support both 32 and 64 bit KASLR for fsl booke. Add document for
64 bit part and rename kaslr-booke32.rst to kaslr-booke.rst.

Signed-off-by: Jason Yan <yanaijie@huawei.com>
Cc: Scott Wood <oss@buserror.net>
Cc: Diana Craciun <diana.craciun@nxp.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Kees Cook <keescook@chromium.org>
---
 Documentation/powerpc/index.rst               |  2 +-
 .../{kaslr-booke32.rst => kaslr-booke.rst}    | 35 ++++++++++++++++---
 2 files changed, 32 insertions(+), 5 deletions(-)
 rename Documentation/powerpc/{kaslr-booke32.rst => kaslr-booke.rst} (59%)

diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 0d45f0fc8e57..3bad36943b22 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -20,7 +20,7 @@ powerpc
     hvcs
     imc
     isa-versions
-    kaslr-booke32
+    kaslr-booke
     mpc52xx
     papr_hcalls
     pci_iov_resource_on_powernv
diff --git a/Documentation/powerpc/kaslr-booke32.rst b/Documentation/powerpc/kaslr-booke.rst
similarity index 59%
rename from Documentation/powerpc/kaslr-booke32.rst
rename to Documentation/powerpc/kaslr-booke.rst
index 8b259fdfdf03..42121fed8249 100644
--- a/Documentation/powerpc/kaslr-booke32.rst
+++ b/Documentation/powerpc/kaslr-booke.rst
@@ -1,15 +1,18 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-===========================
-KASLR for Freescale BookE32
-===========================
+=========================
+KASLR for Freescale BookE
+=========================
 
 The word KASLR stands for Kernel Address Space Layout Randomization.
 
 This document tries to explain the implementation of the KASLR for
-Freescale BookE32. KASLR is a security feature that deters exploit
+Freescale BookE. KASLR is a security feature that deters exploit
 attempts relying on knowledge of the location of kernel internals.
 
+KASLR for Freescale BookE32
+-------------------------
+
 Since CONFIG_RELOCATABLE has already supported, what we need to do is
 map or copy kernel to a proper place and relocate. Freescale Book-E
 parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
@@ -38,5 +41,29 @@ bit of the entropy to decide the index of the 64M zone. Then we chose a
 
                               kernstart_virt_addr
 
+
+KASLR for Freescale BookE64
+---------------------------
+
+The implementation for Freescale BookE64 is similar as BookE32. One
+difference is that Freescale BookE64 set up a TLB mapping of 1G during
+booting. Another difference is that ppc64 needs the kernel to be
+64K-aligned. So we can randomize the kernel in this 1G mapping and make
+it 64K-aligned. This can save some code to creat another TLB map at early
+boot. The disadvantage is that we only have about 1G/64K = 16384 slots to
+put the kernel in::
+
+    KERNELBASE
+
+          64K                     |--> kernel <--|
+           |                      |              |
+        +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
+        |  |  |  |....|  |  |  |  |  |  |  |  |  |....|  |  |
+        +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
+        |                         |                        1G
+        |----->   offset    <-----|
+
+                              kernstart_virt_addr
+
 To enable KASLR, set CONFIG_RANDOMIZE_BASE = y. If KASLR is enable and you
 want to disable it at runtime, add "nokaslr" to the kernel cmdline.
-- 
2.17.2

