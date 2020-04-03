Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A46E19D074
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 08:50:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48trCs0WgYzDrPQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 17:50:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tr9y3k4fzDqGq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 17:48:34 +1100 (AEDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7EFA5B00FAE0776F69B5;
 Fri,  3 Apr 2020 14:48:28 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 14:48:19 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <gregkh@linuxfoundation.org>, <christophe.leroy@c-s.fr>,
 <allison@lohutok.net>, <armijn@tjaldur.nl>, <tglx@linutronix.de>,
 <aneesh.kumar@linux.ibm.com>, <yuehaibing@huawei.com>
Subject: [PATCH v2] powerpc/mm: ptdump: Add missing include <asm/hvcall.h>
Date: Fri, 3 Apr 2020 14:47:56 +0800
Message-ID: <20200403064756.36128-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200402135828.37308-1-yuehaibing@huawei.com>
References: <20200402135828.37308-1-yuehaibing@huawei.com>
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

while PPC_PSERIES is not set, gcc build fails:

arch/powerpc/mm/ptdump/hashpagetable.c: In function ‘pseries_find’:
arch/powerpc/mm/ptdump/hashpagetable.c:262:18: error: ‘H_SUCCESS’ undeclared (first use in this function); did you mean ‘FL_ACCESS’?
   if (lpar_rc != H_SUCCESS)
                  ^~~~~~~~~
                  FL_ACCESS

If PPC_PSERIES is not set, <asm/plpar_wrappers.h> does not
include <asm/hvcall.h>, which leads to this failure.

Add missing include file <asm/hvcall.h> in hashpagetable.c to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 65e701b2d2a8 ("powerpc/ptdump: drop non vital #ifdefs")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: Add hvcall.h instead of vio.h, also rework patch log
---
 arch/powerpc/mm/ptdump/hashpagetable.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index b6ed9578382f..3e7e6206688c 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -20,6 +20,7 @@
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/hvcall.h>
 #include <linux/memblock.h>
 #include <asm/firmware.h>
 
-- 
2.17.1


