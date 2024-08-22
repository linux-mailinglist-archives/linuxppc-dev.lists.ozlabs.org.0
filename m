Return-Path: <linuxppc-dev+bounces-356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4754095B7B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 15:57:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqPss1sc1z2yXY;
	Thu, 22 Aug 2024 23:57:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724332695;
	cv=none; b=HG/nEtdXzq3vg9J/zBFlKylPLU0ZrISzs4t7kj9DT05KQ9AAUHne+UZbsvo619XWv0fX/eP4/M5PD4KONXE6muB5Hy7Shy6LO8NsmkfScHiSm0zDo/17xkRagLLsz7aCKFz3QCICFlKTcj/3RcFAB8u4TpYJZVbHfQvQLtifTkAr0Hbq/KHADfx5Pq+ar9bCAYGsClamMvJsGGkv6aR1SbQB3cWKi+B1QXjfNUNh+m1OFkeKOe1ojPb1xi9U/XFzUZssa2gEKlR+fz2Xo/wlKoMHyNx3Gg0OGLqLlXu7H3yFoYTAb36wVTOcXUUx9ZCPdUDBlfI2SsUIu0g8hEwe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724332695; c=relaxed/relaxed;
	bh=a4H6R0ffZRcdTnl7DDzczyjLKc3IVUXxPAywHWwGoBA=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy; b=Z6DfUtb2zNMvOiIVMSoqvK9xpv0RTjbP+3h++2b8pcrA9FoxhSkuVzVrf+2NzrLaCMWZhhv3PtxMLqVF5lITiSUSL4EGRR96XVfbdHATs2C6268gG5BSANH2Vd3bhIbW/4u94UJg8xjg2FbtBW072nmgyCmgXny5cFeQ1hseLD0p3Rq1RzM188mcy+S9OvvvzcXW1OsAWE+YIXtsB04nPgSBHcUypP75FTfOHO1aPW6deeGwy3o2SDT1AywTewxV7mf2QWluiRehaAYioP3T3wsQi/Qe8sc0h6jC9EvqllmBNM48HU10I5FHhiBbs87pVE3OQbOXrIf8oFogcbTm+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqP064Pcqz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 23:18:10 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WqNZ76KxWzpTfP;
	Thu, 22 Aug 2024 20:59:11 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id E10F118009B;
	Thu, 22 Aug 2024 21:00:44 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 22 Aug 2024 21:00:44 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <cuigaosheng1@huawei.com>
CC: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next] powerpc/powernv/pci: Remove obsoleted declaration for pnv_pci_init_ioda_hub
Date: Thu, 22 Aug 2024 21:00:43 +0800
Message-ID: <20240822130043.783756-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The pnv_pci_init_ioda_hub() have been removed since
commit 5ac129cdb50b ("powerpc/powernv/pci: Remove ioda1 support"),
and now it is useless, so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/powerpc/platforms/powernv/pci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 957f2b47a3c0..93fba1f8661f 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -274,7 +274,6 @@ int pnv_pci_cfg_write(struct pci_dn *pdn,
 		      int where, int size, u32 val);
 extern struct iommu_table *pnv_pci_table_alloc(int nid);
 
-extern void pnv_pci_init_ioda_hub(struct device_node *np);
 extern void pnv_pci_init_ioda2_phb(struct device_node *np);
 extern void pnv_pci_init_npu2_opencapi_phb(struct device_node *np);
 extern void pnv_pci_reset_secondary_bus(struct pci_dev *dev);
-- 
2.25.1


