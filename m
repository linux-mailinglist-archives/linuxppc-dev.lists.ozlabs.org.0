Return-Path: <linuxppc-dev+bounces-2898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FC9BDF36
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 08:17:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjxND0KQ9z2yl1;
	Wed,  6 Nov 2024 18:17:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730877419;
	cv=none; b=llKgzim5qbPbYiZHh62ouzFpBmcuxiLfykZUWfrRyVEiA91acC2z0eLQt673iS47n+sbDsRKESWYPRyuFu8U5i5jyD7f8XPc+Vzc9QnsIP5C8Cax5TQZOmZcmTiUkRMqKyG3cHZEnC6Gs5oFcJOji2YZcT2nXdC7+qByGyyNLSFpLmhf6Tv9s3AKsvKepUDkiT1csn+g0DFNxVRr5mKz4fvoqMV9ZTdCABKcblkd+kq8NJKaaWumrimjTy78s4Eo66ccBBpG/om9Ky9Lc9jvIO9DYbuFE/J4YWlpo+Cp+sEmZHa7eHsuHKn2R4P+gHd9NibHolTPxqPsR2rNsAsmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730877419; c=relaxed/relaxed;
	bh=z1tOzpGJUDoMGmHPMzCssNo7wfSI9QEDd1Z01auK1A4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dxvUEPed95IQ21hRzXb3XT4uxFZ9IzATyFIu6uIBzaXBykwIUgw6jtJ/BoIRiYyXlqX6uYhhx9lcGZAgXCa7tTSUPBBNOy1Jfp9SeszaorkP2mbec0BUI6BLKGhJoRgOp2+etIQz5u9Fd0a0q3RMZL/FM+jAUdrBqbGRdjmC4VPn7dus3NGzwBbWTwrzA5uWaOsUmKOwWX7TSxQ3VIIOlcKieP5YnQybz1Kx2PRuoEiODyFtqrfWoUiCtgBZ1jMptgAZfKo2xj8Ol33yjBXbvc7LMJaBZzDR5StLCIGY1tjlY2w9HGXrIOiaK7T4vxuk+b7bkYLoN0Azw+7gZt3xFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjxN95N5Bz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 18:16:54 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XjxKq72VMz1SF1L;
	Wed,  6 Nov 2024 15:14:55 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F4DE180019;
	Wed,  6 Nov 2024 15:16:37 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 6 Nov
 2024 15:16:36 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <christophe.leroy@csgroup.eu>, <biwen.li@nxp.com>, <leoyang.li@nxp.com>,
	<ran.wang_1@nxp.com>, <linuxppc-dev@lists.ozlabs.org>
CC: <chenjun102@huawei.com>, <liuyongqiang13@huawei.com>,
	<zhangzekun11@huawei.com>
Subject: [PATCH] soc: fsl: Add missing of_node_put() after using device_node
Date: Wed, 6 Nov 2024 15:11:23 +0800
Message-ID: <20241106071123.49678-1-zhangzekun11@huawei.com>
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
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

of_find_compatible_node() will increase the refcount of the device_node.
Decrease the refcount once finish using it.

Fixes: e95f287deed2 ("soc: fsl: handle RCPM errata A-008646 on SoC LS1021A")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/soc/fsl/rcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index 3d0cae30c769..06bd94b29fb3 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -36,6 +36,7 @@ static void copy_ippdexpcr1_setting(u32 val)
 		return;
 
 	regs = of_iomap(np, 0);
+	of_node_put(np);
 	if (!regs)
 		return;
 
-- 
2.17.1


