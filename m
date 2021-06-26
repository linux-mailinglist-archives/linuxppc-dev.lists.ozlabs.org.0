Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 456523B4D6B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 09:27:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBlnX1SyJz3bxW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 17:27:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBln96NJHz3069
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 17:27:07 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GBlj962tnz74RW;
 Sat, 26 Jun 2021 15:23:41 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 15:26:58 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 15:26:57 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Arnd Bergmann <arnd@arndb.de>, <linux-arch@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/9] sections: Unify kernel sections range check and use
Date: Sat, 26 Jun 2021 15:34:30 +0800
Message-ID: <20210626073439.150586-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
Cc: linux-s390@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are three head files(kallsyms.h, kernel.h and sections.h) which
include the kernel sections range check, let's make some cleanup and
unify them.

1. cleanup arch specific text/data check and fix address boundary check in kallsyms.h
2. make all the basic kernel range check function into sections.h
3. update all the callers, and use the helper in sections.h to simplify the code
4. use memory_intersects() in sections.h instead of private overlap for dma-debug

Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-arch@vger.kernel.org 
Cc: iommu@lists.linux-foundation.org
Cc: bpf@vger.kernel.org 

Kefeng Wang (9):
  kallsyms: Remove arch specific text and data check
  kallsyms: Fix address-checks for kernel related range
  sections: Move and rename core_kernel_data() to is_kernel_data()
  sections: Move is_kernel_inittext() into sections.h
  kallsyms: Rename is_kernel() and is_kernel_text()
  sections: Add new is_kernel() and is_kernel_text()
  s390: kprobes: Use is_kernel() helper
  powerpc/mm: Use is_kernel_text() and is_kernel_inittext() helper
  dma-debug: Use memory_intersects() directly

 arch/powerpc/mm/pgtable_32.c   |  7 +---
 arch/s390/kernel/kprobes.c     |  9 +----
 arch/x86/kernel/unwind_orc.c   |  2 +-
 arch/x86/net/bpf_jit_comp.c    |  2 +-
 include/asm-generic/sections.h | 71 ++++++++++++++++++++++++++--------
 include/linux/kallsyms.h       | 21 +++-------
 include/linux/kernel.h         |  2 -
 kernel/cfi.c                   |  2 +-
 kernel/dma/debug.c             | 14 +------
 kernel/extable.c               | 33 ++--------------
 kernel/locking/lockdep.c       |  3 --
 kernel/trace/ftrace.c          |  2 +-
 mm/kasan/report.c              |  2 +-
 net/sysctl_net.c               |  2 +-
 14 files changed, 76 insertions(+), 96 deletions(-)

-- 
2.26.2

