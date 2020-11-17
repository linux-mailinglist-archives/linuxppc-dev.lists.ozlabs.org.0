Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1EC2B57E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 04:32:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZs2c5qDDzDqQZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 14:32:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZs0x434kzDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 14:31:09 +1100 (AEDT)
IronPort-SDR: EvbSNR2llTykWi0nQUEyeR2HSeP9LyVMuPcO7NuFaeiWdpDvf+S8lGrRH68/lUvqoB1CkNC4m3
 gFDBrHvYVRJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="235006313"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="235006313"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 19:31:02 -0800
IronPort-SDR: 3ENWXY+KFD7MxWwBNknTO9Qrr6zKnSo++U65VmUk4A9mNnnY6bZuAOkO4wcHChQ6jNNkznLh1s
 yP585H2WMapQ==
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="475769777"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.25])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 19:31:02 -0800
Subject: [PATCH] powerpc: fix create_section_mapping compile warning
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Mon, 16 Nov 2020 19:31:01 -0800
Message-ID: <160558386174.2948926.2740149041249041764.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: kernel test robot <lkp@intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

0day robot reports that a recent rework of how
memory_add_physaddr_to_nid() and phys_to_target_node() are declared
resulted in the following new compilation warning:

arch/powerpc/mm/mem.c:91:12: warning: no previous prototype for 'create_section_mapping' [-Wmissing-prototypes]
   91 | int __weak create_section_mapping(unsigned long start, unsigned long end,
      |            ^~~~~~~~~~~~~~~~~~~~~~

...fix this by moving the declaration of create_section_mapping()
outside of the CONFIG_NEED_MULTIPLE_NODES ifdef guard, and include an
explicit include of asm/mmzone.h in mem.c. An include of linux/mmzone.h
is not sufficient.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/powerpc/include/asm/mmzone.h |    7 +++++--
 arch/powerpc/mm/mem.c             |    1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
index 177fd18caf83..6cda76b57c5d 100644
--- a/arch/powerpc/include/asm/mmzone.h
+++ b/arch/powerpc/include/asm/mmzone.h
@@ -33,8 +33,6 @@ extern struct pglist_data *node_data[];
 extern int numa_cpu_lookup_table[];
 extern cpumask_var_t node_to_cpumask_map[];
 #ifdef CONFIG_MEMORY_HOTPLUG
-extern int create_section_mapping(unsigned long start, unsigned long end,
-				  int nid, pgprot_t prot);
 extern unsigned long max_pfn;
 u64 memory_hotplug_max(void);
 #else
@@ -48,5 +46,10 @@ u64 memory_hotplug_max(void);
 #define __HAVE_ARCH_RESERVED_KERNEL_PAGES
 #endif
 
+#ifdef CONFIG_MEMORY_HOTPLUG
+extern int create_section_mapping(unsigned long start, unsigned long end,
+				  int nid, pgprot_t prot);
+#endif
+
 #endif /* __KERNEL__ */
 #endif /* _ASM_MMZONE_H_ */
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 01ec2a252f09..3fc325bebe4d 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -50,6 +50,7 @@
 #include <asm/rtas.h>
 #include <asm/kasan.h>
 #include <asm/svm.h>
+#include <asm/mmzone.h>
 
 #include <mm/mmu_decl.h>
 

