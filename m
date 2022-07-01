Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F2563627
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 16:51:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZJ7J3F46z3dsR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 00:51:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ZnNLhFMA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.112; helo=m15112.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ZnNLhFMA;
	dkim-atps=neutral
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZJ5y6hXLz3cJC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 00:50:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Cs1hk
	euBoQjKrX/Ip43i0w3A2PsBGXG4v1L3BMOCxMc=; b=ZnNLhFMAyCsQPUywX6RBE
	8d4bcomIGiQTDgYs75Np4TKIQukzdTOkxbMx/AWLEz44F/bFxin0jqyKtg+MiHI6
	mUsK6ry0jo77iDqgrNJTJjmxA/U6qE/BEKGs9BzL/cs45MU35AT6BGBUI41OWWcr
	gxlR1RVlMtln5pgcg9h3uk=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp2 (Coremail) with SMTP id DMmowABHs_+NCb9ix2bbEA--.53667S3;
	Fri, 01 Jul 2022 22:49:51 +0800 (CST)
From: Liang He <windhl@126.com>
To: arnd@arndb.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH v2 2/2] powerpc: cell: iommu: Hold reference returned by of_find_node_by_name()
Date: Fri,  1 Jul 2022 22:49:49 +0800
Message-Id: <20220701144949.252364-2-windhl@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701144949.252364-1-windhl@126.com>
References: <20220701144949.252364-1-windhl@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowABHs_+NCb9ix2bbEA--.53667S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xw1rZrykAF4ruF4kJr47Arb_yoW8JrW3pr
	nrGrZFkF18GrWrKF17tF17Zry2van3try0vFWUC3yDArn5Xr9rZFW8Zw1fWFn8XrWDAa1S
	qF4SqanY9FnYga7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRY9a9UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhAxF18RPaeCDQAAsj
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In cell_iommu_init_disabled(), we should hold the reference returned
by of_find_node_by_name() and use it to call of_node_put() for reference
balance.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: (1) split v1's two files in to two commits
     (2) using 'check-then-put' coding style
 v1: hold the reference returned by of_find_xxx OF APIs

 v1-link: https://lore.kernel.org/all/20220621075333.4081413-1-windhl@126.com/

 arch/powerpc/platforms/cell/iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 0ca3efeef293..8c7133039566 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -720,8 +720,10 @@ static int __init cell_iommu_init_disabled(void)
 	cell_disable_iommus();
 
 	/* If we have no Axon, we set up the spider DMA magic offset */
-	if (of_find_node_by_name(NULL, "axon") == NULL)
+	np = of_find_node_by_name(NULL, "axon");
+	if (!np)
 		cell_dma_nommu_offset = SPIDER_DMA_OFFSET;
+	of_node_put(np);
 
 	/* Now we need to check to see where the memory is mapped
 	 * in PCI space. We assume that all busses use the same dma
-- 
2.25.1

