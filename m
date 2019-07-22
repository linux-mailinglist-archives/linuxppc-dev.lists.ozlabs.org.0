Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D98707F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 19:54:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sq4t3CpTzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 03:54:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LLRhBkii"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45spwG3sXQzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 03:47:26 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i70so7268687pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5UwUccDT7idepOx9wTEsK1MsiNpu1jsT4caspeaAVc=;
 b=LLRhBkiisgB80uVaw2RwSttwpr0MqqYYPp8nK+UoJ5A/dERrOeGx4fwTysuzbkxaPf
 +QLwNK0TYm6TrnwsbczGjyqNZ2FuWKZ/prEWG/y68a+B7p4bmOkDQOE5hNdW/NdYRnPU
 DVaPRKSS5Bd4wWwY6I6jf8Zp3+iTj8xPeCxKhwEHzWwe6UqyRp40k+PeawRY4/pTc6eX
 ek1wCF1F/jnxy2+Vw2lUZpawyfTSSh4h22hdhZCuBy5J52X2AzuYjkcdMwiLT0rB7ZTd
 YLFE3yC92piJyeJEW4fIRKdaV6IJThJ5XszfxDwsl2abBtlBAAVSWMLmRZdbWmTJfG1q
 u6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5UwUccDT7idepOx9wTEsK1MsiNpu1jsT4caspeaAVc=;
 b=AuuXbyteb6jVtpoEEzB3Q5CFZKLin0cw9dvVlyqAqPQ6T0EfittzU7SrtaaXEnTDIp
 qwDQiPFxqb8YibUqQnzcJZkYv4DbPrd4YIVxe9QOqQkRmW99Sr4VtvZzPVwkq4KLbQVe
 iwS/yWxNB/lriBOICzE8Thfj1gRJpYJRAfOfxQAw7MrKU1RmmxV5erZxvmjJd7rpegnf
 DlQToUOfXKpvY75g4eO3arlVS6Ry8crU6wSbzw/rb91zpNpU1BSmSk4W7i605vUTQ3zd
 BsjJKtU1vmyWAThHfx7Z9u09nOZ/s2BAYTYdWqLZvyNPkjWxpP3dggC1ucjFizCziUT2
 wahw==
X-Gm-Message-State: APjAAAXSH9wUJqp+sKr54K9gaT5C+7vRY2BIceQ9cuEZC7EhRo/hmGxW
 LiZ1jxHX0Qi99csv6Afo5zFVDGaL
X-Google-Smtp-Source: APXvYqxGTGvZXyBLQkm7SKZ+aDY4hjFXYr0o5j8SDlVE78luq/8bjuwQhRhz/xFpWB/XQLxA4ESKvw==
X-Received: by 2002:a17:90a:35e6:: with SMTP id
 r93mr78684036pjb.20.1563817643831; 
 Mon, 22 Jul 2019 10:47:23 -0700 (PDT)
Received: from bobo.local0.net (193-116-123-212.tpgi.com.au. [193.116.123.212])
 by smtp.gmail.com with ESMTPSA id z24sm69170057pfr.51.2019.07.22.10.47.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:47:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/4] powerpc/perf: fix imc allocation failure
Date: Tue, 23 Jul 2019 03:46:59 +1000
Message-Id: <20190722174700.11483-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722174700.11483-1-npiggin@gmail.com>
References: <20190722174700.11483-1-npiggin@gmail.com>
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

alloc_pages_node return value should be tested before applying
page_address.

Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
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
2.20.1

