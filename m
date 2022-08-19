Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776D5997F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 10:53:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8FsC2Xygz3cFH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 18:53:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenlifu@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1041 seconds by postgrey-1.36 at boromir; Fri, 19 Aug 2022 18:04:20 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Dmh6Xl4z3c9L
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 18:04:18 +1000 (AEST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M8DJ21Zr4zkWYv;
	Fri, 19 Aug 2022 15:42:58 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 19 Aug 2022 15:46:21 +0800
Received: from huawei.com (10.67.174.169) by dggpemm500001.china.huawei.com
 (7.185.36.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 19 Aug
 2022 15:46:21 +0800
From: Chen Lifu <chenlifu@huawei.com>
To: <benh@kernel.crashing.org>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <nick.child@ibm.com>,
	<zhengzucheng@huawei.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <paulus@samba.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <oohall@gmail.com>
Subject: [PATCH -next] powerpc/powermac: Fix symbol not declared warnings
Date: Fri, 19 Aug 2022 15:43:11 +0800
Message-ID: <20220819074311.862263-1-chenlifu@huawei.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 19 Aug 2022 18:53:00 +1000
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
Cc: chenlifu@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

1. ppc_override_l2cr and ppc_override_l2cr_value are only used in
   l2cr_init() function, so move them inside the function.
2. has_l2cache is not used outside of the file, so mark it static, and
   do not initialise statics to 0.

Fixes the following warning:

arch/powerpc/platforms/powermac/setup.c:74:5: warning: symbol 'ppc_override_l2cr' was not declared. Should it be static?
arch/powerpc/platforms/powermac/setup.c:75:5: warning: symbol 'ppc_override_l2cr_value' was not declared. Should it be static?
arch/powerpc/platforms/powermac/setup.c:76:5: warning: symbol 'has_l2cache' was not declared. Should it be static?

Signed-off-by: Chen Lifu <chenlifu@huawei.com>
---
 arch/powerpc/platforms/powermac/setup.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 04daa7f0a03c..f8b847a2f5b5 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -68,13 +68,11 @@
 
 #include "pmac.h"
 
 #undef SHOW_GATWICK_IRQS
 
-int ppc_override_l2cr = 0;
-int ppc_override_l2cr_value;
-int has_l2cache = 0;
+static int has_l2cache;
 
 int pmac_newworld;
 
 static int current_root_goodness = -1;
 
@@ -226,10 +224,13 @@ static void __init ohare_init(void)
 	}
 }
 
 static void __init l2cr_init(void)
 {
+	int ppc_override_l2cr = 0;
+	int ppc_override_l2cr_value;
+
 	/* Checks "l2cr-value" property in the registry */
 	if (cpu_has_feature(CPU_FTR_L2CR)) {
 		struct device_node *np;
 
 		for_each_of_cpu_node(np) {
-- 
2.37.1

