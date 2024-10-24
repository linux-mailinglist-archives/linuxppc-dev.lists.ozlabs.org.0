Return-Path: <linuxppc-dev+bounces-2534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD49ADA4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 05:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYrb30HXHz2xpx;
	Thu, 24 Oct 2024 14:13:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729739598;
	cv=none; b=kBFZmbISwwvGgY5/JNtHsPMvEdgKDoXJHMIzVf8asv3eP31dGiFsuYc2XTZUJEtQJ4nH9LAh1eLqgxXaHlQkh4qs/o8acP92mAy/v3aXBaTnD9Q1iP2fowLwpv+kVc0ja/+PBKqA1eeXBQnauyhm+alyl7xSmZqor2gXXOLTxdi9u0sri6E6S8DpsvCTomDiKbavhKKGJ3jNHIpN+w1DUH8ApJt26e1J2JnXEGy4bvMD39t1AYaOQ7uHLQ2OVbsQeyq6eHRoKbMfvUS8I0Wqf9arTEG6WSJ8PwUd4nGKJo465szUnSwtNElkKzXuQIwYWwO5Fsf8DT/TLNFUHVUVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729739598; c=relaxed/relaxed;
	bh=fiDueVO7ugLnwStQAPL5qdhprnYDooacCty38yZUcxI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d78spUVy0FfRrpFkVDnT/jqzMD7DLuDK3YuV3/3IS+AR9Ecr4oV6/aLxKcOB6Tg+YqEAIX0SjTTflpvs3Y+C8Q0iLZwfSt/wg0MvmK9GjjzwML2kgunoKOhw7X4CVfROkBL+bsnOc9G5kfr0aXiPBNFfVRlJ0PXhITfWXUdh2uzuoAzdckR8CUO72FYY5wZCt5Xp9+WrXQx6HhSSq8V7w9X01smKnIaQta7B0FnN/P2RXR1YsUIvLNlpVCmITwAtGK9QD2V6fSaRpZuQWNsOwHx5fGHPgxK2McQkpgBuVjdpAKcrE2cnmJUzn/2KfoJz6ctQibJpEVuFlF2BLPeIsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYrb11y0nz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 14:13:14 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XYrY919lVz1jvqn;
	Thu, 24 Oct 2024 11:11:41 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 081F81A0190;
	Thu, 24 Oct 2024 11:13:05 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 24 Oct
 2024 11:13:04 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <maddy@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH] powerpc/chrp: Add missing of_node_get() before of_find_node_by_name()
Date: Thu, 24 Oct 2024 11:08:17 +0800
Message-ID: <20241024030817.126484-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

of_find_node_by_name() will decrease the refount of the device_node.
So, get the device_node before passing to it.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 arch/powerpc/platforms/chrp/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
index 428fd2a7b3ee..57dd0f19ada5 100644
--- a/arch/powerpc/platforms/chrp/pci.c
+++ b/arch/powerpc/platforms/chrp/pci.c
@@ -191,6 +191,7 @@ static void __init setup_peg2(struct pci_controller *hose, struct device_node *d
 	struct device_node *root = of_find_node_by_path("/");
 	struct device_node *rtas;
 
+	of_node_get(root);
 	rtas = of_find_node_by_name (root, "rtas");
 	if (rtas) {
 		hose->ops = &rtas_pci_ops;
-- 
2.17.1


