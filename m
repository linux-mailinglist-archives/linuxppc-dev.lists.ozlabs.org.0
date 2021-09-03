Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F266F3FFDE2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 12:06:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1D2w6vknz3bXC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 20:06:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=sunnanyong@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1B1b5ptNz2xtf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 18:34:57 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H19wr218mzbgyS;
 Fri,  3 Sep 2021 16:30:52 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 3 Sep 2021 16:34:39 +0800
Received: from huawei.com (10.175.113.32) by kwepemm600003.china.huawei.com
 (7.193.23.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 3 Sep 2021
 16:34:38 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <akpm@linux-foundation.org>, <npiggin@gmail.com>, <christophe.leroy@c-s.fr>
Subject: [PATCH -next] powerpc/mm: check base flags in ioremap_prot
Date: Fri, 3 Sep 2021 17:03:39 +0800
Message-ID: <20210903090339.3671524-1-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Sep 2021 20:05:16 +1000
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

Some drivers who call ioremap_prot without setting base flags like
ioremap_prot(addr, len, 0) may work well before
commit 56f3c1413f5c ("powerpc/mm: properly set PAGE_KERNEL flags in
ioremap()"), but now they will get a virtual address "successfully"
from ioremap_prot and badly fault on memory access later because that
patch also dropped the hack adding of base flags for ioremap_prot.

So return NULL and throw a warning if the caller of ioremap_prot did
not set base flags properly. Why not just hack adding PAGE_KERNEL flags
in the ioremap_prot, because most scenarios can be covered by high level
functions like ioremap(), ioremap_coherent(), ioremap_cache()...
so it is better to keep max flexibility for this low level api.

Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
 arch/powerpc/mm/ioremap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 57342154d2b0..b7eda0f0d04d 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -46,6 +46,10 @@ void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long f
 	pte_t pte = __pte(flags);
 	void *caller = __builtin_return_address(0);
 
+	/* The caller should set base page flags properly */
+	if (WARN_ON((flags & _PAGE_PRESENT) == 0))
+		return NULL;
+
 	/* writeable implies dirty for kernel addresses */
 	if (pte_write(pte))
 		pte = pte_mkdirty(pte);
-- 
2.18.0.huawei.25

