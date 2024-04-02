Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3819894D32
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 10:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V80vP5nZCz3vqp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 19:11:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V80tb0Ll0z3cM5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 19:10:30 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V80RS5xc3zwRBB;
	Tue,  2 Apr 2024 15:50:28 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B67C140415;
	Tue,  2 Apr 2024 15:53:15 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 15:53:14 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH 0/7] arch/mm/fault: accelerate pagefault when badaccess
Date: Tue, 2 Apr 2024 15:51:35 +0800
Message-ID: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
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
Cc: x86@kernel.org, linux-s390@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>, surenb@google.com, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After VMA lock-based page fault handling enabled, if bad access met
under per-vma lock, it will fallback to mmap_lock-based handling,
so it leads to unnessary mmap lock and vma find again. A test from
lmbench shows 34% improve after this changes on arm64,

  lat_sig -P 1 prot lat_sig 0.29194 -> 0.19198

Only build test on other archs except arm64.

Kefeng Wang (7):
  arm64: mm: cleanup __do_page_fault()
  arm64: mm: accelerate pagefault when VM_FAULT_BADACCESS
  arm: mm: accelerate pagefault when VM_FAULT_BADACCESS
  powerpc: mm: accelerate pagefault when badaccess
  riscv: mm: accelerate pagefault when badaccess
  s390: mm: accelerate pagefault when badaccess
  x86: mm: accelerate pagefault when badaccess

 arch/arm/mm/fault.c     |  4 +++-
 arch/arm64/mm/fault.c   | 31 ++++++++++---------------------
 arch/powerpc/mm/fault.c | 33 ++++++++++++++++++++-------------
 arch/riscv/mm/fault.c   |  5 ++++-
 arch/s390/mm/fault.c    |  3 ++-
 arch/x86/mm/fault.c     | 23 ++++++++++++++---------
 6 files changed, 53 insertions(+), 46 deletions(-)

-- 
2.27.0

