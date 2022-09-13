Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C49C45B6937
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 10:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRbkZ5s9Rz3c5v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 18:10:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1177 seconds by postgrey-1.36 at boromir; Tue, 13 Sep 2022 18:10:18 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRbk23DLWz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 18:10:14 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MRbBm6WZTz14QMg;
	Tue, 13 Sep 2022 15:46:40 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 15:50:35 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<geoff@infradead.org>, <jk@ozlabs.org>, <arnd@arndb.de>, <clg@kaod.org>,
	<aik@ozlabs.ru>, <maciej.szmigiero@oracle.com>, <seanjc@google.com>,
	<jgg@ziepe.ca>, <willy@infradead.org>, <nick.child@ibm.com>,
	<bsingharora@gmail.com>, <michael@ellerman.id.au>,
	<arnd.bergmann@de.ibm.com>, <paulus@samba.org>, <benh@kernel.crashing.org>,
	<alistair@popple.id.au>, <miltonm@bga.com>, <Geert.Uytterhoeven@sonycom.com>,
	<geoffrey.levand@am.sony.com>, <yu.liu@freescale.com>,
	<scottwood@freescale.com>, <hollisb@us.ibm.com>, <avi@redhat.com>,
	<agraf@suse.de>, <cuigaosheng1@huawei.com>
Subject: [PATCH 5/9] powerpc/mm: remove orphan declarations from mmu_context.h
Date: Tue, 13 Sep 2022 15:50:25 +0800
Message-ID: <20220913075029.682327-6-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913075029.682327-1-cuigaosheng1@huawei.com>
References: <20220913075029.682327-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the following orphan declarations from mmu_context.h:
1. switch_cop() and drop_cop() have been removed since
commit 6ff4d3e96652 ("powerpc: Remove old unused icswx
based coprocessor support").

2. mm_iommu_cleanup() has been removed since
commit 4b6fad7097f8 ("powerpc/mm/iommu, vfio/spapr: Put
pages on VFIO container shutdown").

So remove the declarations for them from header file.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/powerpc/include/asm/mmu_context.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 3f25bd3e14eb..c1ea270bb848 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -31,7 +31,6 @@ extern long mm_iommu_newdev(struct mm_struct *mm, unsigned long ua,
 extern long mm_iommu_put(struct mm_struct *mm,
 		struct mm_iommu_table_group_mem_t *mem);
 extern void mm_iommu_init(struct mm_struct *mm);
-extern void mm_iommu_cleanup(struct mm_struct *mm);
 extern struct mm_iommu_table_group_mem_t *mm_iommu_lookup(struct mm_struct *mm,
 		unsigned long ua, unsigned long size);
 extern struct mm_iommu_table_group_mem_t *mm_iommu_get(struct mm_struct *mm,
@@ -117,7 +116,6 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
 }
 #endif
 
-extern void switch_cop(struct mm_struct *next);
 extern int use_cop(unsigned long acop, struct mm_struct *mm);
 extern void drop_cop(unsigned long acop, struct mm_struct *mm);
 
-- 
2.25.1

