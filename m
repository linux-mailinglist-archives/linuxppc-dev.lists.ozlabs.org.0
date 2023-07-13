Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A07751D9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 11:43:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1qS32Q7jz3dFd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 19:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1qNn4rLRz3cN1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 19:40:57 +1000 (AEST)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R1qMQ0F4fzrRnX;
	Thu, 13 Jul 2023 17:39:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:40:21 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<surenb@google.com>
Subject: [PATCH rfc -next 00/10] mm: convert to generic VMA lock-based page fault
Date: Thu, 13 Jul 2023 17:53:28 +0800
Message-ID: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle
  <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a generic VMA lock-based page fault handler in mm core, and convert
architectures to use it, which eliminate architectures's duplicated codes.

With it, we can avoid multiple changes in architectures's code if we 
add new feature or bugfix.

This fixes riscv missing change about commit 38b3aec8e8d2 "mm: drop per-VMA
lock when returning VM_FAULT_RETRY or VM_FAULT_COMPLETED", and in the end,
we enable this feature on ARM32/Loongarch too.

This is based on next-20230713, only built test(no loongarch compiler,
so except loongarch).

Kefeng Wang (10):
  mm: add a generic VMA lock-based page fault handler
  x86: mm: use try_vma_locked_page_fault()
  arm64: mm: use try_vma_locked_page_fault()
  s390: mm: use try_vma_locked_page_fault()
  powerpc: mm: use try_vma_locked_page_fault()
  riscv: mm: use try_vma_locked_page_fault()
  ARM: mm: try VMA lock-based page fault handling first
  loongarch: mm: cleanup __do_page_fault()
  loongarch: mm: add access_error() helper
  loongarch: mm: try VMA lock-based page fault handling first

 arch/arm/Kconfig          |  1 +
 arch/arm/mm/fault.c       | 15 ++++++-
 arch/arm64/mm/fault.c     | 28 +++---------
 arch/loongarch/Kconfig    |  1 +
 arch/loongarch/mm/fault.c | 92 ++++++++++++++++++++++++---------------
 arch/powerpc/mm/fault.c   | 54 ++++++++++-------------
 arch/riscv/mm/fault.c     | 38 +++++++---------
 arch/s390/mm/fault.c      | 23 +++-------
 arch/x86/mm/fault.c       | 39 +++++++----------
 include/linux/mm.h        | 28 ++++++++++++
 mm/memory.c               | 42 ++++++++++++++++++
 11 files changed, 206 insertions(+), 155 deletions(-)

-- 
2.27.0

