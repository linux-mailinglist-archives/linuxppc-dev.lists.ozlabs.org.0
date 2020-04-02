Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AD319C394
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 16:05:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tPvr0wKlzDrRy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 01:04:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tPp32T13zDrQh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 00:59:51 +1100 (AEDT)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9923666935139C50D3D6;
 Thu,  2 Apr 2020 21:59:43 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 2 Apr 2020
 21:59:37 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <gregkh@linuxfoundation.org>, <christophe.leroy@c-s.fr>,
 <allison@lohutok.net>, <armijn@tjaldur.nl>, <tglx@linutronix.de>,
 <aneesh.kumar@linux.ibm.com>, <yuehaibing@huawei.com>
Subject: [PATCH] powerpc/mm: ptdump: Add missing include <asm/vio.h>
Date: Thu, 2 Apr 2020 21:58:28 +0800
Message-ID: <20200402135828.37308-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.223.234]
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

gcc build fails:

arch/powerpc/mm/ptdump/hashpagetable.c: In function ‘pseries_find’:
arch/powerpc/mm/ptdump/hashpagetable.c:262:18: error: ‘H_SUCCESS’ undeclared (first use in this function); did you mean ‘FL_ACCESS’?
   if (lpar_rc != H_SUCCESS)
                  ^~~~~~~~~
                  FL_ACCESS

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 65e701b2d2a8 ("powerpc/ptdump: drop non vital #ifdefs")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/mm/ptdump/hashpagetable.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index b6ed9578382f..8ea5f9a3b658 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -20,6 +20,7 @@
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/vio.h>
 #include <linux/memblock.h>
 #include <asm/firmware.h>
 
-- 
2.17.1


