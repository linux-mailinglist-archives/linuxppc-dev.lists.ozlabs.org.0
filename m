Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D40112BA1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 13:39:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Sdh52wqKzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 23:39:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="A+OJZidz"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Sdc80hxRzDqLN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 23:35:35 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7B2A20862;
 Wed,  4 Dec 2019 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575462933;
 bh=M1Wf/f30+BvSWegCWZV9CQ1OJDcWNvDUUneWC9hFQOQ=;
 h=From:To:Cc:Subject:Date:From;
 b=A+OJZidzgtdJt6409seAEyH45Ss0kz2SBVJ8TWk3Q0UceO0y4S6OsXy2bjaslg5lP
 LK6ARqr0xZruFvxNrlV5jBQ6dU6ReePVQk9HAWRwyTXGhM4FszRdjBL0OgxolzqKS0
 a9CRC+a0jEEIjKw+N+wMhE7DRPXw7GklS56VuPLw=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: ensure that swiotlb buffer is allocated from low
 memory
Date: Wed,  4 Dec 2019 14:35:24 +0200
Message-Id: <20191204123524.22919-1-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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
Cc: linux-arch@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Some powerpc platforms (e.g. 85xx) limit DMA-able memory way below 4G. If a
system has more physical memory than this limit, the swiotlb buffer is not
addressable because it is allocated from memblock using top-down mode.

Force memblock to bottom-up mode before calling swiotlb_init() to ensure
that the swiotlb buffer is DMA-able.

Link: https://lkml.kernel.org/r/F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Darren Stevens <darren@stevens-zone.net>
Cc: mad skateman <madskateman@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 arch/powerpc/mm/mem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index be941d382c8d..14c2c53e3f9e 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -260,6 +260,14 @@ void __init mem_init(void)
 	BUILD_BUG_ON(MMU_PAGE_COUNT > 16);
 
 #ifdef CONFIG_SWIOTLB
+	/*
+	 * Some platforms (e.g. 85xx) limit DMA-able memory way below
+	 * 4G. We force memblock to bottom-up mode to ensure that the
+	 * memory allocated in swiotlb_init() is DMA-able.
+	 * As it's the last memblock allocation, no need to reset it
+	 * back to to-down.
+	 */
+	memblock_set_bottom_up(true);
 	swiotlb_init(0);
 #endif
 
-- 
2.24.0

