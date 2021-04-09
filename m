Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5678359A95
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGtsN5Ydfz3c0W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 19:59:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=zhengzucheng@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGtKC03CPz2yxr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 19:35:22 +1000 (AEST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGtFn5szrzPpGn;
 Fri,  9 Apr 2021 17:32:29 +0800 (CST)
Received: from huawei.com (10.67.174.166) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:35:13 +0800
From: Zucheng Zheng <zhengzucheng@huawei.com>
To: <benh@kernel.crashing.org>, <mpe@ellerman.id.au>, <paulus@samba.org>,
 <oohall@gmail.com>, <akpm@linux-foundation.org>, <rppt@kernel.org>,
 <christophe.leroy@csgroup.eu>
Subject: [PATCH -next] powerpc/pmac: remove not use symbol
Date: Fri, 9 Apr 2021 17:35:19 +0800
Message-ID: <20210409093519.118000-1-zhengzucheng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.166]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 09 Apr 2021 19:59:37 +1000
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

sccdbg symbol is not used, so remove it

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zucheng Zheng <zhengzucheng@huawei.com>
---
 arch/powerpc/platforms/powermac/setup.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index db5107c80485..df9ea37d5708 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -83,10 +83,6 @@ extern struct machdep_calls pmac_md;
 
 #define DEFAULT_ROOT_DEVICE Root_SDA1	/* sda1 - slightly silly choice */
 
-#ifdef CONFIG_PPC64
-int sccdbg;
-#endif
-
 sys_ctrler_t sys_ctrler = SYS_CTRLER_UNKNOWN;
 EXPORT_SYMBOL(sys_ctrler);
 
-- 
2.17.1

