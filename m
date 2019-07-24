Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4C72AAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 10:53:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tpzQ1vSwzDqMH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 18:53:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a6FNF4/P"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tprN1y0kzDqKr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 18:47:32 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id w10so20872101pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KXdZnBt4Dikq7l5rtbuptsrDWxyJ2ir0gklP9Kfry+c=;
 b=a6FNF4/PnRSINU/7k8ZCRYWki2wse5zEEYQXIgDOushwzdAYwFDVbhuHXX6hcZRkpj
 epN+IgLepizsLL0/eOGQfyNVoLQUah4exe3n1k+3TTg63jDQRwOTw3vZUF0VATjNDiAf
 e0R8rtgYKVTI5lFjDC1rV9np6XQh+W7JmwaotZCra6pmk9RgxzzDPksr0QGu4hRtMAl1
 5ujYVCntAT/QyIF5xeuqyT/DNklxHK8yZtYaDJpiQ8RTUIZFeYqgDzouHXpF0e71lUaX
 VORLFTOXQ1GKUgVdT0YDR8O8yueIxLzPgnz3d6t79idcBL6aqApTfuMhz+chcCan4quP
 7qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KXdZnBt4Dikq7l5rtbuptsrDWxyJ2ir0gklP9Kfry+c=;
 b=e/j7Dzu7hVDHKUy3xFTqt2P1qMIaPEUy4wSDEPRHXCgkYhX/2+kgw9aRRm9kVw4uUM
 cGZ7IuxNQmFqNQl/1hylWt1Ak/p7EivPoQYcZHCkwwbXupAy1uMrWXeLXiP5w7uVKct/
 4hNoYEVD45WjFQV32fgrH9LUnmUykzjwMSdaS2HyerGzeEhQrp6WD8sGBYhHkDMz/5de
 fCsRNW0HJ+vnEcFwNmy/EvRMWsybfWV3CZX+NcuOu3nRCNq5FlZ8hpua6K3G/7KfgYT2
 jmEzI+rAtDzc/D7N1E1X9CWd3NEmU1nuSW6YymlwxMEODvJt+cdKiWGq/kAmS3bSsR9m
 f66Q==
X-Gm-Message-State: APjAAAXq8x65Xb4AgylTIeDBPzWtt7sT6OjSDv9n+hGfr5jEtIVlCytA
 xnce3hRqhYIDYA69CVUOdPsOm50l
X-Google-Smtp-Source: APXvYqxH4DwsS1yENbxqxfO4JF8419EBgN3hVFI7yVBlpT72dPdA5GqzcXfC1YomQUAVpuBiJagGwA==
X-Received: by 2002:aa7:940c:: with SMTP id x12mr10362462pfo.80.1563958049588; 
 Wed, 24 Jul 2019 01:47:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([220.240.251.33])
 by smtp.gmail.com with ESMTPSA id a3sm54286745pje.3.2019.07.24.01.47.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:47:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] powerpc/perf: fix imc allocation failure handling
Date: Wed, 24 Jul 2019 18:46:36 +1000
Message-Id: <20190724084638.24982-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724084638.24982-1-npiggin@gmail.com>
References: <20190724084638.24982-1-npiggin@gmail.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The alloc_pages_node return value should be tested for failure
before being passed to page_address.

Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Tested-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/perf/imc-pmu.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index dea243185ea4..cb50a9e1fd2d 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -577,6 +577,7 @@ static int core_imc_mem_init(int cpu, int size)
 {
 	int nid, rc = 0, core_id = (cpu / threads_per_core);
 	struct imc_mem_info *mem_info;
+	struct page *page;
 
 	/*
 	 * alloc_pages_node() will allocate memory for core in the
@@ -587,11 +588,12 @@ static int core_imc_mem_init(int cpu, int size)
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
@@ -849,15 +851,17 @@ static int thread_imc_mem_alloc(int cpu_id, int size)
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
@@ -1095,11 +1099,14 @@ static int trace_imc_mem_alloc(int cpu_id, int size)
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
2.22.0

