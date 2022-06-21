Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04123552C77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 09:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRzPm6qYKz3bbQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 17:57:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=W0c52eRh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=W0c52eRh;
	dkim-atps=neutral
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRzP71mw5z306m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 17:56:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0wT0G
	DLyfRKMSMwOPFkjCvUllSbjo7GAMhIMRNmmGp0=; b=W0c52eRhECKN5oG5u0JG8
	dUOLJDc8yUkUzboNO9mfBwJRILB6Ru49jl9Rqmp/kpaihakGUNSvdSsBzKmPyCTa
	dxr9fbJGDLJhZjSVxwWfPx3H4MWSCUTyiifMAp3EvMj5FbHhy+3mirV+U3qvYA3w
	CtkLeJ1d5jYanSniyL70bg=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgDnNXr+eLFi7iU4FA--.36884S2;
	Tue, 21 Jun 2022 15:53:36 +0800 (CST)
From: Liang He <windhl@126.com>
To: arnd@arndb.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc/cell: Hold reference returned by of_find_node_by_xxx APIs
Date: Tue, 21 Jun 2022 15:53:33 +0800
Message-Id: <20220621075333.4081413-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgDnNXr+eLFi7iU4FA--.36884S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF48XFyrGFyDXw1UZr17GFg_yoW8CF1Upr
	yDGFZayF18GrW0kF1Iva4UZrW3trn5KrW8Zw4xGa9rA3Z3XF93Jr48Zw1IkrnxXryxZa1S
	qr1fKa1YqFn5W3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UY_MfUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AAnF1pEDxJ9GQAAsL
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

In cell_iommu_init_disabled() and cbe_get_be_node(), we need to
hold the reference returned by of_find_node_by_xxx APIs and use
it to call of_node_put() for refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/cell/cbe_regs.c | 10 ++++++++--
 arch/powerpc/platforms/cell/iommu.c    |  5 ++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/cell/cbe_regs.c b/arch/powerpc/platforms/cell/cbe_regs.c
index 316e533afc00..09cbdfc070b3 100644
--- a/arch/powerpc/platforms/cell/cbe_regs.c
+++ b/arch/powerpc/platforms/cell/cbe_regs.c
@@ -182,9 +182,15 @@ static struct device_node *__init cbe_get_be_node(int cpu_id)
 		if (WARN_ON_ONCE(!cpu_handle))
 			return np;
 
-		for (i=0; i<len; i++)
-			if (of_find_node_by_phandle(cpu_handle[i]) == of_get_cpu_node(cpu_id, NULL))
+		for (i=0; i<len; i++) {
+			struct device_node *ch_np = of_find_node_by_phandle(cpu_handle[i]);
+			struct device_node *ci_np = of_get_cpu_node(cpu_id, NULL);
+
+			of_node_put(ch_np);
+			of_node_put(ci_np);
+			if (ch_np == ci_np)
 				return np;
+		}
 	}
 
 	return NULL;
diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 0ca3efeef293..3ba3742c4ae7 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -719,8 +719,11 @@ static int __init cell_iommu_init_disabled(void)
 	/* First make sure all IOC translation is turned off */
 	cell_disable_iommus();
 
+	np = of_find_node_by_name(NULL, "axon")
+	of_node_put(np);
+
 	/* If we have no Axon, we set up the spider DMA magic offset */
-	if (of_find_node_by_name(NULL, "axon") == NULL)
+	if (!np)
 		cell_dma_nommu_offset = SPIDER_DMA_OFFSET;
 
 	/* Now we need to check to see where the memory is mapped
-- 
2.25.1

