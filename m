Return-Path: <linuxppc-dev+bounces-346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1595B4CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 14:15:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqMbZ2Rx8z2yVV;
	Thu, 22 Aug 2024 22:15:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqHrK0KZTz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 19:26:08 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WqHKX4rXxz20m0l;
	Thu, 22 Aug 2024 17:02:56 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 5A3FD1A016C;
	Thu, 22 Aug 2024 17:07:39 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 17:07:38 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/pseries/dlpar: Use helper function for_each_child_of_node()
Date: Thu, 22 Aug 2024 16:54:30 +0800
Message-ID: <20240822085430.25753-3-zhangzekun11@huawei.com>
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

for_each_child_of_node can help to iterate through the device_node,
and we don't need to use while loop. No functional change with this
conversion.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 arch/powerpc/platforms/pseries/dlpar.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 47f8eabd1bee..ee47ed21b99d 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -250,11 +250,8 @@ int dlpar_detach_node(struct device_node *dn)
 	struct device_node *child;
 	int rc;
 
-	child = of_get_next_child(dn, NULL);
-	while (child) {
+	for_each_child_of_node(dn, child)
 		dlpar_detach_node(child);
-		child = of_get_next_child(dn, child);
-	}
 
 	rc = of_detach_node(dn);
 	if (rc)
-- 
2.17.1


