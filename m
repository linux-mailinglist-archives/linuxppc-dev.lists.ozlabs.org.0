Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F38662D50B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 09:29:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCY490PbNz3f5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 19:29:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCY2M044Lz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 19:27:54 +1100 (AEDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NCY1W70vLzHvtj;
	Thu, 17 Nov 2022 16:27:11 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 16:27:43 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <anshuman.khandual@arm.com>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH v7 1/2] mm/tlbbatch: Introduce arch_tlbbatch_should_defer()
Date: Thu, 17 Nov 2022 16:26:47 +0800
Message-ID: <20221117082648.47526-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20221117082648.47526-1-yangyicong@huawei.com>
References: <20221117082648.47526-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
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
Cc: wangkefeng.wang@huawei.com, darren@os.amperecomputing.com, peterz@infradead.org, yangyicong@hisilicon.com, punit.agrawal@bytedance.com, guojian@oppo.com, linux-riscv@lists.infradead.org, Anshuman Khandual <khandual@linux.vnet.ibm.com>, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, Barry Song <21cnbao@gmail.com>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, openrisc@lists.librecores.org, prime.zeng@hisilicon.com, Barry Song <baohua@kernel.org>, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anshuman Khandual <khandual@linux.vnet.ibm.com>

The entire scheme of deferred TLB flush in reclaim path rests on the
fact that the cost to refill TLB entries is less than flushing out
individual entries by sending IPI to remote CPUs. But architecture
can have different ways to evaluate that. Hence apart from checking
TTU_BATCH_FLUSH in the TTU flags, rest of the decision should be
architecture specific.

Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
[https://lore.kernel.org/linuxppc-dev/20171101101735.2318-2-khandual@linux.vnet.ibm.com/]
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
[Rebase and fix incorrect return value type]
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Xin Hao <xhao@linux.alibaba.com>
Tested-by: Punit Agrawal <punit.agrawal@bytedance.com>
---
 arch/x86/include/asm/tlbflush.h | 12 ++++++++++++
 mm/rmap.c                       |  9 +--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index cda3118f3b27..8a497d902c16 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -240,6 +240,18 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
 	flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
 }
 
+static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
+{
+	bool should_defer = false;
+
+	/* If remote CPUs need to be flushed then defer batch the flush */
+	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
+		should_defer = true;
+	put_cpu();
+
+	return should_defer;
+}
+
 static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 {
 	/*
diff --git a/mm/rmap.c b/mm/rmap.c
index 2ec925e5fa6a..a9ab10bc0144 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -685,17 +685,10 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
  */
 static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
 {
-	bool should_defer = false;
-
 	if (!(flags & TTU_BATCH_FLUSH))
 		return false;
 
-	/* If remote CPUs need to be flushed then defer batch the flush */
-	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
-		should_defer = true;
-	put_cpu();
-
-	return should_defer;
+	return arch_tlbbatch_should_defer(mm);
 }
 
 /*
-- 
2.24.0

