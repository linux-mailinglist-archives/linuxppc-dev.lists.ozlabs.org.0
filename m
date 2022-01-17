Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AD1490FC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:41:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JczjQ3XDRz3fHq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 04:41:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lCfQTuXj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lCfQTuXj; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcyyB65rRz3f5y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 04:07:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13E4961290;
 Mon, 17 Jan 2022 17:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34312C36AED;
 Mon, 17 Jan 2022 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642439248;
 bh=ehxo8YQgznHOl0EbViewbaIP5NiLJZCNpNXsawUryR8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lCfQTuXjcQE//JHgZKLX/fzC0QclQTVbLviYV3wJbKgb7pw/rn27SXyuGAEb8a4Vo
 pcwCRtX9k/rFIwKCA2JisDBFar3LlRItVS1xIwOEnsR//7U9Hi+ICdiBMGugvBrTmu
 TLLBaJQMZlc6D8L56KtvaXBbkAbsk2EHGy2RBVesfuFJEJ/LTh+J5ctO9hnuQZpzG+
 UkKQqtD2y2st8qKKJxMZYA51Ut1MDeaYWTfJxrYZe6gXVEjl0OoW06Hk66oCKBXnlJ
 4/6QB5Qbg43Y+u9eUwWp7KDMIffvECoO1pDd4n2D+MUPAIReDH/zHtVQVq4LqQg6Ir
 WlCu0qq3zO68w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 03/13] powerpc/cell: add missing of_node_put
Date: Mon, 17 Jan 2022 12:07:11 -0500
Message-Id: <20220117170722.1473137-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170722.1473137-1-sashal@kernel.org>
References: <20220117170722.1473137-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Julia Lawall <Julia.Lawall@lip6.fr>

[ Upstream commit a841fd009e51c8c0a8f07c942e9ab6bb48da8858 ]

for_each_node_by_name performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
expression e,e1;
local idexpression n;
@@

 for_each_node_by_name(n, e1) {
   ... when != of_node_put(n)
       when != e = n
(
   return n;
|
+  of_node_put(n);
?  return ...;
)
   ...
 }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/1448051604-25256-7-git-send-email-Julia.Lawall@lip6.fr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/cell/iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 7ff51f96a00e8..8df43781f5db9 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -1107,6 +1107,7 @@ static int __init cell_iommu_fixed_mapping_init(void)
 			if (hbase < dbase || (hend > (dbase + dsize))) {
 				pr_debug("iommu: hash window doesn't fit in"
 					 "real DMA window\n");
+				of_node_put(np);
 				return -1;
 			}
 		}
-- 
2.34.1

