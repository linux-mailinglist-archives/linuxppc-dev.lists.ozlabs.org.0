Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06553A880
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 16:10:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCrdj5Phmz3fNM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:10:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TZyJ4SIH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TZyJ4SIH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCrNN6Nwqz3fBZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 23:59:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DB9461632;
	Wed,  1 Jun 2022 13:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963F7C385A5;
	Wed,  1 Jun 2022 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654091938;
	bh=BaKhQqgyfbfjuRLsJf8naFAGGNIsWBbdAWduy+Wsrg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TZyJ4SIHLPYcbV+STHXeCMVlciIvTDT6ZYq1M2OMU7Z4Z8+j53cnhizfg+GVRBn6l
	 J0dVE7tw+1otyZN7bChtS85PO7lOsM6eFwo/GkW8X6wiE+4tzF9YA2xM+Id91prq/H
	 XHFhUY5NqXNThRHlqwoEeG6bL9blEDP/gmLqbs/oYTGiPHlQ/MQ2CROqHzklgenvRH
	 en1BQ5PEYjSTCa0qT4nx2jePaudG1n6bUW6Wdm2LHkHzsWrTDCyd9faH9c/IDWqjDt
	 UqE1eDLRBG9rqjRsruUSfqPZ7ZLhzFNQ2qZNADLpPHkC7itACVdRWSA3OBmtN0DdQ+
	 7d0KKQMwspieQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 24/26] powerpc/iommu: Add missing of_node_put in iommu_init_early_dart
Date: Wed,  1 Jun 2022 09:57:57 -0400
Message-Id: <20220601135759.2004435-24-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601135759.2004435-1-sashal@kernel.org>
References: <20220601135759.2004435-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Peng Wu <wupeng58@huawei.com>, nick.child@ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peng Wu <wupeng58@huawei.com>

[ Upstream commit 57b742a5b8945118022973e6416b71351df512fb ]

The device_node pointer is returned by of_find_compatible_node
with refcount incremented. We should use of_node_put() to avoid
the refcount leak.

Signed-off-by: Peng Wu <wupeng58@huawei.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220425081245.21705-1-wupeng58@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/sysdev/dart_iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/dart_iommu.c b/arch/powerpc/sysdev/dart_iommu.c
index 6b4a34b36d98..8ff9bcfe4b8d 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -403,9 +403,10 @@ void __init iommu_init_early_dart(struct pci_controller_ops *controller_ops)
 	}
 
 	/* Initialize the DART HW */
-	if (dart_init(dn) != 0)
+	if (dart_init(dn) != 0) {
+		of_node_put(dn);
 		return;
-
+	}
 	/*
 	 * U4 supports a DART bypass, we use it for 64-bit capable devices to
 	 * improve performance.  However, that only works for devices connected
@@ -418,6 +419,7 @@ void __init iommu_init_early_dart(struct pci_controller_ops *controller_ops)
 
 	/* Setup pci_dma ops */
 	set_pci_dma_ops(&dma_iommu_ops);
+	of_node_put(dn);
 }
 
 #ifdef CONFIG_PM
-- 
2.35.1

