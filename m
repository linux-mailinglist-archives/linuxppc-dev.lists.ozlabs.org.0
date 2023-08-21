Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE10B78298F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 14:53:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTsq052yqz3dVX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 22:53:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTsnL4j0Nz3c1R
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 22:52:06 +1000 (AEST)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RTsHY0pyfzrSqg;
	Mon, 21 Aug 2023 20:29:45 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:11 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>
Subject: [PATCH rfc -next v2 00/10] mm: convert to generic VMA lock-based page fault
Date: Mon, 21 Aug 2023 20:30:46 +0800
Message-ID: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, surenb@google.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ri
 scv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a generic VMA lock-based page fault handler in mm core, and convert
architectures to use it, which eliminate architectures's duplicated
codes.

With it, we can avoid multiple changes in architectures's code if we 
add new feature or bugfix, in the end, enable this feature on ARM32
and Loongarch.

This is based on next-20230817, only built test.

v2: 
- convert "int arch_vma_check_access()" to "bool arch_vma_access_error()"
  still use __weak function for arch_vma_access_error(), which avoid to
  declare access_error() in architecture's(x86/powerpc/riscv/loongarch)
  headfile.
- re-use struct vm_fault instead of adding new struct vm_locked_fault,
  per Matthew Wilcox, add necessary pt_regs/fault error code/vm flags
  into vm_fault since they could be used in arch_vma_access_error()
- add special VM_FAULT_NONE and make try_vma_locked_page_fault() to
  return vm_fault_t

Kefeng Wang (10):
  mm: add a generic VMA lock-based page fault handler
  arm64: mm: use try_vma_locked_page_fault()
  x86: mm: use try_vma_locked_page_fault()
  s390: mm: use try_vma_locked_page_fault()
  powerpc: mm: use try_vma_locked_page_fault()
  riscv: mm: use try_vma_locked_page_fault()
  ARM: mm: try VMA lock-based page fault handling first
  loongarch: mm: cleanup __do_page_fault()
  loongarch: mm: add access_error() helper
  loongarch: mm: try VMA lock-based page fault handling first

 arch/arm/Kconfig          |   1 +
 arch/arm/mm/fault.c       |  35 ++++++++----
 arch/arm64/mm/fault.c     |  60 ++++++++-------------
 arch/loongarch/Kconfig    |   1 +
 arch/loongarch/mm/fault.c | 111 ++++++++++++++++++++++----------------
 arch/powerpc/mm/fault.c   |  66 +++++++++++------------
 arch/riscv/mm/fault.c     |  58 +++++++++-----------
 arch/s390/mm/fault.c      |  66 ++++++++++-------------
 arch/x86/mm/fault.c       |  55 ++++++++-----------
 include/linux/mm.h        |  17 ++++++
 include/linux/mm_types.h  |   2 +
 mm/memory.c               |  39 ++++++++++++++
 12 files changed, 278 insertions(+), 233 deletions(-)

-- 
2.27.0

