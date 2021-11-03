Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD5F443B1A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 02:46:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkV3j6nc5z2xv0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 12:46:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkV3G5k9wz2xCj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 12:45:43 +1100 (AEDT)
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HkV2t4N15z90jv;
 Wed,  3 Nov 2021 09:45:26 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme755-chm.china.huawei.com
 (10.3.19.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Wed, 3
 Nov 2021 09:45:35 +0800
From: He Ying <heying24@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH] powerpc/sysdev/of_rtc: Fix possible memory leak in
 of_instantiate_rtc
Date: Tue, 2 Nov 2021 21:47:17 -0400
Message-ID: <20211103014717.162886-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
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

If of_address_to_resource() in of_instantiate_rtc() fails, previously
allocated memory res is not freed. Add missing kfree() for it.

Signed-off-by: He Ying <heying24@huawei.com>
---
 arch/powerpc/sysdev/of_rtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/sysdev/of_rtc.c b/arch/powerpc/sysdev/of_rtc.c
index 1f408d34a6a7..23b896996c2f 100644
--- a/arch/powerpc/sysdev/of_rtc.c
+++ b/arch/powerpc/sysdev/of_rtc.c
@@ -44,6 +44,7 @@ void __init of_instantiate_rtc(void)
 				printk(KERN_ERR "OF RTC: Error "
 				       "translating resources for %pOF\n",
 				       node);
+				kfree(res);
 				continue;
 			}
 
-- 
2.17.1

