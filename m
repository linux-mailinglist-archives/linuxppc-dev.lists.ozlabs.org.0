Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80497551A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 16:26:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y7l82JHRzDqRG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 00:26:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=aarcange@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y7hk6nN0zDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 00:24:38 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A14AA30BB524;
 Tue, 25 Jun 2019 14:17:35 +0000 (UTC)
Received: from ultra.random (ovpn-120-252.rdu2.redhat.com [10.10.120.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C01A21001E8C;
 Tue, 25 Jun 2019 14:17:29 +0000 (UTC)
From: Andrea Arcangeli <aarcange@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/1] powerpc: fix off by one in max_zone_pfn initialization
 for ZONE_DMA
Date: Tue, 25 Jun 2019 10:17:27 -0400
Message-Id: <20190625141727.2883-1-aarcange@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 25 Jun 2019 14:17:47 +0000 (UTC)
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

25078dc1f74be16b858e914f52cc8f4d03c2271a first introduced an off by
one error in the ZONE_DMA initialization of PPC_BOOK3E_64=y and since
9739ab7eda459f0669ec9807e0d9be5020bab88c the off by one applies to
PPC32=y too. This simply corrects the off by one and should resolve
crashes like below:

[   65.179101] page 0x7fff outside node 0 zone DMA [ 0x0 - 0x7fff ]

Unfortunately in various MM places "max" means a non inclusive end of
range. free_area_init_nodes max_zone_pfn parameter is one case and
MAX_ORDER is another one (unrelated) that comes by memory.

Reported-by: Zorro Lang <zlang@redhat.com>
Fixes: 25078dc1f74b ("powerpc: use mm zones more sensibly")
Fixes: 9739ab7eda45 ("powerpc: enable a 30-bit ZONE_DMA for 32-bit pmac")
Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
---
 arch/powerpc/mm/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 2540d3b2588c..2eda1ec36f55 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -249,7 +249,7 @@ void __init paging_init(void)
 
 #ifdef CONFIG_ZONE_DMA
 	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
-			((1UL << ARCH_ZONE_DMA_BITS) - 1) >> PAGE_SHIFT);
+				      1UL << (ARCH_ZONE_DMA_BITS - PAGE_SHIFT));
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 #ifdef CONFIG_HIGHMEM
