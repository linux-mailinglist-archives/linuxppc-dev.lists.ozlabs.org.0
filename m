Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D345E49A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 03:33:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0f1X4Hm9z3c7L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 13:33:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iYhyb2zX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iYhyb2zX; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0f063mmpz304V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 13:32:06 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CBF261181;
 Fri, 26 Nov 2021 02:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637893925;
 bh=7Y6x205BDUFgAZRQgyrD2j4b6+OUapip8rPatiemWc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iYhyb2zXXA2tGtz+HsnYK1khlmWil5EuyrPT8wQ8GtNOc4h0I9TnqxlZPEh6Fc71Q
 5OyXkeKqjg3I+AycPG424NKrwOtUkbc10IBpEtKfbz2XFg6zTdq/EZ2MXIYPFvBWGE
 sNO0BbbejzOB2LDWPl/NAolUXiZszLC9m6iQPErMGvCsrgMFmGEZWTKC/BKHof/cRm
 RbJg2B4Ko5rK48+BOyUYLrStGRr1+mCX3ZWeMW3DTZ1bgmQ8ShqqOvp26XFq5zJq6g
 Ctc/FZSviZzH/AO8V+S3afsr1zO6GP8PgUwOOwJRZkYqGiAPgnOrzZU5OZEbm7/77g
 RDZAbxM8/cGLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 04/39] powerpc/pseries/ddw: Do not try direct
 mapping with persistent memory and one window
Date: Thu, 25 Nov 2021 21:31:21 -0500
Message-Id: <20211126023156.441292-4-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023156.441292-1-sashal@kernel.org>
References: <20211126023156.441292-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, leobras.c@gmail.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, fbarrat@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit ad3976025b311cdeb822ad3e7a7554018cb0f83f ]

There is a possibility of having just one DMA window available with
a limited capacity which the existing code does not handle that well.
If the window is big enough for the system RAM but less than
MAX_PHYSMEM_BITS (which we want when persistent memory is present),
we create 1:1 window and leave persistent memory without DMA.

This disables 1:1 mapping entirely if there is persistent memory and
either:
- the huge DMA window does not cover the entire address space;
- the default DMA window is removed.

This relies on reverted 54fc3c681ded
("powerpc/pseries/ddw: Extend upper limit for huge DMA window for persistent memory")
to return the actual amount RAM in ddw_memory_hotplug_max() (posted
separately).

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20211108040320.3857636-4-aik@ozlabs.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index ad96d6e13d1f6..8322ca86d5acf 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1356,8 +1356,10 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		len = order_base_2(query.largest_available_block << page_shift);
 		win_name = DMA64_PROPNAME;
 	} else {
-		direct_mapping = true;
-		win_name = DIRECT64_PROPNAME;
+		direct_mapping = !default_win_removed ||
+			(len == MAX_PHYSMEM_BITS) ||
+			(!pmem_present && (len == max_ram_len));
+		win_name = direct_mapping ? DIRECT64_PROPNAME : DMA64_PROPNAME;
 	}
 
 	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
-- 
2.33.0

