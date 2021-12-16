Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BE5476FA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 12:14:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF8f91KNNz3ccR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 22:14:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF8dB0WzYz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 22:14:03 +1100 (AEDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JF8ZQ0B4xz8vpZ;
 Thu, 16 Dec 2021 19:11:42 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 19:13:56 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 19:13:55 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <dennis@kernel.org>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: [PATCH 0/4] mm: percpu: Cleanup percpu first chunk function
Date: Thu, 16 Dec 2021 19:23:55 +0800
Message-ID: <20211216112359.103822-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
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
Cc: wangkefeng.wang@huawei.com, linux-ia64@vger.kernel.org,
 dave.hansen@linux.intel.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, cl@linux.com, will@kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, aou@eecs.berkeley.edu, bp@alien8.de,
 paul.walmsley@sifive.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 gregkh@linuxfoundation.org, linux-mips@vger.kernel.org, palmer@dabbelt.com,
 tj@kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When support page mapping percpu first chunk allocator on arm64, we
found there are lots of duplicated codes in percpu embed/page first
chunk allocator. This patchset is aimed to cleanup them and should
no function change. 

The currently supported status about 'embed' and 'page' in Archs shows
below,

embed: NEED_PER_CPU_PAGE_FIRST_CHUNK
page:  NEED_PER_CPU_EMBED_FIRST_CHUNK

	embed	page
------------------------
arm64	  Y	 Y
mips	  Y	 N
powerpc	  Y	 Y
riscv	  Y	 N
sparc	  Y	 Y
x86	  Y	 Y
------------------------

There are two interfaces about percpu first chunk allocator,

 extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
                                size_t atom_size,
                                pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
-                               pcpu_fc_alloc_fn_t alloc_fn,
-                               pcpu_fc_free_fn_t free_fn);
+                               pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);


 extern int __init pcpu_page_first_chunk(size_t reserved_size,
-                               pcpu_fc_alloc_fn_t alloc_fn,
-                               pcpu_fc_free_fn_t free_fn,
-                               pcpu_fc_populate_pte_fn_t populate_pte_fn);
+                               pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);


The pcpu_fc_alloc_fn_t/pcpu_fc_free_fn_t is killed, we provide generic
pcpu_fc_alloc() and pcpu_fc_free() function, which are called in the
pcpu_embed/page_first_chunk().

1) For pcpu_embed_first_chunk(), pcpu_fc_cpu_to_node_fn_t is needed to be
   provided when archs supported NUMA.
2) For pcpu_page_first_chunk(), the pcpu_fc_populate_pte_fn_t is killed too,
   a generic pcpu_populate_pte() which marked '__weak' is provided, if you
   need a different function to populate pte on the arch(like x86), please
   provide its own implementation.

I have been built test on arm64/ia64/mips/powerpc/sparcx86/riscv based
on v5.16-rc4 on my machine, also all patches are in[1], which checked
by lkp too,
  [kevin78:percpu-cleanup] BUILD SUCCESS c14a59a0aad7db88ebddbeb5e914ddcccb406e1c.

[1] https://github.com/kevin78/linux.git percpu-cleanup

Changes since RFC
- Address Dennis's comments 

RFC:
https://lore.kernel.org/linux-mm/4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com/T/

Kefeng Wang (4):
  mm: percpu: Generalize percpu related config
  mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
  mm: percpu: Add generic pcpu_fc_alloc/free funciton
  mm: percpu: Add generic pcpu_populate_pte() function

 arch/arm64/Kconfig             |  20 +----
 arch/ia64/Kconfig              |   9 +-
 arch/mips/Kconfig              |  10 +--
 arch/mips/mm/init.c            |  14 +--
 arch/powerpc/Kconfig           |  17 +---
 arch/powerpc/kernel/setup_64.c |  97 ++-------------------
 arch/riscv/Kconfig             |  10 +--
 arch/sparc/Kconfig             |  12 +--
 arch/sparc/kernel/smp_64.c     | 103 +---------------------
 arch/x86/Kconfig               |  17 +---
 arch/x86/kernel/setup_percpu.c |  66 ++------------
 drivers/base/arch_numa.c       |  68 +--------------
 include/linux/percpu.h         |  13 +--
 mm/Kconfig                     |  12 +++
 mm/percpu.c                    | 154 +++++++++++++++++++++++++--------
 15 files changed, 180 insertions(+), 442 deletions(-)

-- 
2.18.0.huawei.25

