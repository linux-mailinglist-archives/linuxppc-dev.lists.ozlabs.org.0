Return-Path: <linuxppc-dev+bounces-347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B4E95B4D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 14:15:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqMbn1lpSz2yVT;
	Thu, 22 Aug 2024 22:15:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqHsQ1bjdz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 19:27:05 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WqHMF4sDFz1HH00;
	Thu, 22 Aug 2024 17:04:25 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id BC9061A016C;
	Thu, 22 Aug 2024 17:07:38 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 17:07:38 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/powermac/pfunc_base: Use helper function for_each_child_of_node()
Date: Thu, 22 Aug 2024 16:54:29 +0800
Message-ID: <20240822085430.25753-2-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240822085430.25753-1-zhangzekun11@huawei.com>
References: <20240822085430.25753-1-zhangzekun11@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf500003.china.huawei.com (7.202.181.241)

for_each_child_of_node() can help to iterate through the device_node,
and we don't need to do it manually. No functional change with this
conversion.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 arch/powerpc/platforms/powermac/pfunc_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/pfunc_base.c b/arch/powerpc/platforms/powermac/pfunc_base.c
index 085e0ad20eba..8253de737373 100644
--- a/arch/powerpc/platforms/powermac/pfunc_base.c
+++ b/arch/powerpc/platforms/powermac/pfunc_base.c
@@ -313,7 +313,7 @@ static void __init uninorth_install_pfunc(void)
 	/*
 	 * Install handlers for the hwclock child if any
 	 */
-	for (np = NULL; (np = of_get_next_child(uninorth_node, np)) != NULL;)
+	for_each_child_of_node(uninorth_node, np)
 		if (of_node_name_eq(np, "hw-clock")) {
 			unin_hwclock = np;
 			break;
-- 
2.17.1


