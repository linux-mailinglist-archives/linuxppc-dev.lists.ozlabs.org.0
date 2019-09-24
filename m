Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46400BD103
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 19:53:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d81x0K5dzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 03:53:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="f+Cv33n9"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6YV14lHzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:47:26 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BB3C20673;
 Tue, 24 Sep 2019 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343643;
 bh=kt5nnJFZbNzDp4V7romY1V9Gxe84KLWI5aC+46wAZVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f+Cv33n93m7/I4f82Hxcwbe6GrgLogySyvjoIXtqIyCRc9xPH3VnCL+WYTNW6bfuT
 l/U7RkeSUsILnO96ozcsi3WHyTYVVUx4Wwv0Ck7aUHDhaWW6xqRMv625n0+oD7gsqK
 QOkDfTuEC0vndCXBBUbNRRdJjRhpl4j0pMVZ1MSc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 38/70] powerpc/perf: fix imc allocation failure
 handling
Date: Tue, 24 Sep 2019 12:45:17 -0400
Message-Id: <20190924164549.27058-38-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 10c4bd7cd28e77aeb8cfa65b23cb3c632ede2a49 ]

The alloc_pages_node return value should be tested for failure
before being passed to page_address.

Tested-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190724084638.24982-3-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/perf/imc-pmu.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 3bdfc1e320964..2231959c56331 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -570,6 +570,7 @@ static int core_imc_mem_init(int cpu, int size)
 {
 	int nid, rc = 0, core_id = (cpu / threads_per_core);
 	struct imc_mem_info *mem_info;
+	struct page *page;
 
 	/*
 	 * alloc_pages_node() will allocate memory for core in the
@@ -580,11 +581,12 @@ static int core_imc_mem_init(int cpu, int size)
 	mem_info->id = core_id;
 
 	/* We need only vbase for core counters */
-	mem_info->vbase = page_address(alloc_pages_node(nid,
-					  GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
-					  __GFP_NOWARN, get_order(size)));
-	if (!mem_info->vbase)
+	page = alloc_pages_node(nid,
+				GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
+				__GFP_NOWARN, get_order(size));
+	if (!page)
 		return -ENOMEM;
+	mem_info->vbase = page_address(page);
 
 	/* Init the mutex */
 	core_imc_refc[core_id].id = core_id;
@@ -839,15 +841,17 @@ static int thread_imc_mem_alloc(int cpu_id, int size)
 	int nid = cpu_to_node(cpu_id);
 
 	if (!local_mem) {
+		struct page *page;
 		/*
 		 * This case could happen only once at start, since we dont
 		 * free the memory in cpu offline path.
 		 */
-		local_mem = page_address(alloc_pages_node(nid,
+		page = alloc_pages_node(nid,
 				  GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
-				  __GFP_NOWARN, get_order(size)));
-		if (!local_mem)
+				  __GFP_NOWARN, get_order(size));
+		if (!page)
 			return -ENOMEM;
+		local_mem = page_address(page);
 
 		per_cpu(thread_imc_mem, cpu_id) = local_mem;
 	}
@@ -1085,11 +1089,14 @@ static int trace_imc_mem_alloc(int cpu_id, int size)
 	int core_id = (cpu_id / threads_per_core);
 
 	if (!local_mem) {
-		local_mem = page_address(alloc_pages_node(phys_id,
-					GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
-					__GFP_NOWARN, get_order(size)));
-		if (!local_mem)
+		struct page *page;
+
+		page = alloc_pages_node(phys_id,
+				GFP_KERNEL | __GFP_ZERO | __GFP_THISNODE |
+				__GFP_NOWARN, get_order(size));
+		if (!page)
 			return -ENOMEM;
+		local_mem = page_address(page);
 		per_cpu(trace_imc_mem, cpu_id) = local_mem;
 
 		/* Initialise the counters for trace mode */
-- 
2.20.1

