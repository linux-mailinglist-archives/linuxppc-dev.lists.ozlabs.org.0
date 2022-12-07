Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 079D16455EC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 09:59:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRrn40Mlyz3cJM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 19:59:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.26.146; helo=unicom146.biz-email.net; envelope-from=wangchuanlei@inspur.com; receiver=<UNKNOWN>)
X-Greylist: delayed 62 seconds by postgrey-1.36 at boromir; Wed, 07 Dec 2022 17:55:16 AEDT
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRp2D5SW0z305v
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 17:55:16 +1100 (AEDT)
Received: from ([60.208.111.195])
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id BII00059;
        Wed, 07 Dec 2022 14:53:59 +0800
Received: from localhost.localdomain (10.180.204.101) by
 jtjnmail201609.home.langchao.com (10.100.2.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 14:53:59 +0800
From: wangchuanlei <wangchuanlei@inspur.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<aik@ozlabs.ru>
Subject: [PATCH] [PATCH net-next] powerpc: iommu: delete redundant row
Date: Wed, 7 Dec 2022 01:53:55 -0500
Message-ID: <20221207065355.4070022-1-wangchuanlei@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.204.101]
X-ClientProxiedBy: Jtjnmail201614.home.langchao.com (10.100.2.14) To
 jtjnmail201609.home.langchao.com (10.100.2.9)
tUid: 20221207145359ec80c3b64be1d5aef652dd31f6be9120
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Wed, 07 Dec 2022 19:58:36 +1100
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
Cc: wangchuanlei <wangchuanlei@inspur.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, wangpeihui@inspur.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: wangchuanlei <wangchuanlei@inspur.com>
---
 arch/powerpc/kernel/iommu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index caebe1431596..dd010a733404 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -953,7 +953,6 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
 		size = PAGE_ALIGN(size);
 		nio_pages = size >> tbl->it_page_shift;
 		iommu_free(tbl, dma_handle, nio_pages);
-		size = PAGE_ALIGN(size);
 		free_pages((unsigned long)vaddr, get_order(size));
 	}
 }
-- 
2.27.0

