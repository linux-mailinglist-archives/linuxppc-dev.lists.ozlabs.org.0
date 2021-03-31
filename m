Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7F3500C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 14:57:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9RDx0C8Fz3c6t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 23:57:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9RDb5MB2z2yy7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 23:57:31 +1100 (AEDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F9R9s10JLz9thw;
 Wed, 31 Mar 2021 20:55:13 +0800 (CST)
Received: from localhost (10.174.179.96) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Wed, 31 Mar 2021
 20:57:12 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <ruscur@russell.cc>, <oohall@gmail.com>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <sbobroff@linux.ibm.com>
Subject: [PATCH -next] powerpc/eeh: Add correct inline functions
Date: Wed, 31 Mar 2021 20:53:13 +0800
Message-ID: <20210331125313.24036-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.96]
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pseries_eeh_add_device_early()/pseries_eeh_add_device_tree_early() is
never used since adding, however pseries_eeh_init_edev() and
pseries_eeh_init_edev_recursive() need their inline versions.

Fixes: b6eebb093cad ("powerpc/eeh: Make early EEH init pseries specific")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/include/asm/eeh.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index b1a5bba2e0b9..0b6c2a6711d3 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -357,8 +357,8 @@ static inline int eeh_phb_pe_create(struct pci_controller *phb) { return 0; }
 void pseries_eeh_init_edev(struct pci_dn *pdn);
 void pseries_eeh_init_edev_recursive(struct pci_dn *pdn);
 #else
-static inline void pseries_eeh_add_device_early(struct pci_dn *pdn) { }
-static inline void pseries_eeh_add_device_tree_early(struct pci_dn *pdn) { }
+static inline void pseries_eeh_init_edev(struct pci_dn *pdn) { }
+static inline void pseries_eeh_init_edev_recursive(struct pci_dn *pdn) { }
 #endif
 
 #ifdef CONFIG_PPC64
-- 
2.17.1

