Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9497F973
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 15:28:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460SfX6dy3zDrBB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 23:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="h7YmwDd9"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460SSX04kVzDqww
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 23:19:55 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AC9B2087C;
 Fri,  2 Aug 2019 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564751993;
 bh=kXFROHAYkXRIULUzuGLUVrpHYOTI4dMpB7Q5h8lnU3c=;
 h=From:To:Cc:Subject:Date:From;
 b=h7YmwDd9mlv87T7+94X0HrK0Gz57lzDWJYqXJlFqId3Q+Sos/zLMk4TyeR3PtSVk9
 5mhZBiLCBrQIe3ICyujYYS/GPK1mYkh1q/16l9Vv/Dua6r/TbU88gYffLb6sJZg71B
 +ZQfN4YqZqmc94pcDrBjguwh2iX1QsNM5ByWDZi4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 01/76] powerpc: fix off by one in max_zone_pfn
 initialization for ZONE_DMA
Date: Fri,  2 Aug 2019 09:18:35 -0400
Message-Id: <20190802131951.11600-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Sasha Levin <sashal@kernel.org>,
 Zorro Lang <zlang@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrea Arcangeli <aarcange@redhat.com>

[ Upstream commit 03800e0526ee25ed7c843ca1e57b69ac2a5af642 ]

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
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190625141727.2883-1-aarcange@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 2540d3b2588c3..2eda1ec36f552 100644
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
-- 
2.20.1

