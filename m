Return-Path: <linuxppc-dev+bounces-2097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8E999DC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 09:23:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPym25cGcz3btc;
	Fri, 11 Oct 2024 18:23:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728631426;
	cv=none; b=GPnEZChWSzX0JfNNDyca9/5xxOwdMlbJKd1BnwIYNEFQ5u86+D3032SPpWkRsxK9b23Nn9O+YBBLSqvrFz4pQpQs80CWwjEOaZECSbqv/WZxuDVfCzuZbY8RgU5qxfRwg7Vp1wBUS7/1vpXOrslYHH5yZ6aL4Fgq7MUh+WBSeMY3kwlPd1/O8VrMiuIrjn1kUzL2pKcoY8nyXB1gxyUhIt1joxHS8Xbu5itoUH9950DW8AW7nWR+AX1jX2+YnrYl0Kj7lIwCvr9tWE5L43EzLk19isLXwLK5YvSr9HlDkibyio9ux5YrSHwBpEjWXjkIqm4txoIc67pX0befPqpq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728631426; c=relaxed/relaxed;
	bh=5ubewzzmHjedesx22pwLGzOS0cZPbgARDYakPnaDJMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hA+cCLOZVFikil27kmuluXN37se55NF/9X1Fy2Xa7zmgD38gMpXsY3f/G89501PNCH/XUQIFg+yTaZ63XHzrNk6/f6pmflR9376Xp0mEZvRtYBZ3DfP0GniC9Pv27N6BXnrQsKcs37bdOtuwYZKTmP50C5LI1N/CL3UqMdSXOrhIIZmBDiPpXA3PkdHmWP1ftvnAtz99Yvno+R0URFGE1Y05EJapEBvMBRpTBl2wEZtPEsNEDaTsztZbdZOtyeoVSji2e2HLoAgSX8q/llQmHfsuqG2ky2MU8KjZH7UdaFFKs1BGkaeq7qJi2Q3RdImHwpNazSFpFvMfR833UaFJLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wl0ijBj3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wl0ijBj3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPym169bGz2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 18:23:45 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20b90ab6c19so17327455ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728631423; x=1729236223; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ubewzzmHjedesx22pwLGzOS0cZPbgARDYakPnaDJMA=;
        b=Wl0ijBj33J9kXjPTnQlNF7tYLOMI4fgy4NjRvHeng//sO2PRlIHkz1NC/gD7hd5iul
         ePhiHnNyiWao52SinWKzCNv1YSR1LILREvDlzxcxXnF7MQNwWlS661A31AN7OYf1qkMS
         uMr5xhReouwd9i6M3IX4ylZesK/EozzdMoLqrknf/uT+KNuSit/PeUbQ6I+ZpRAiPDCa
         qtVAkxtCzKsZi/dMgQ2M9FrWMz+mxqJ7djIhj5ZrvaXsiMjkASUtUrJgNUG9TisycAWR
         uIjenjnXvMWHz/jvPtRlhg4WDJa+aNsIId70cc1w0H+SedaqBh0vGWpj3OZtYnU1eZAl
         84DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631423; x=1729236223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ubewzzmHjedesx22pwLGzOS0cZPbgARDYakPnaDJMA=;
        b=uRNz44hAJoinpfxDoZR6G9zeuGyf2o9d8XwwaTGPRNG7gzutF+FlYTPPFbQPNl+7/l
         khZ8+Eo6ROzWu4ZZmxNSd7EQQ85B/MLyR9WkE8SHHse3DERETyHWbX7okHGn/5O1isXc
         Ojt9PZnaXPbEyQnST/uUiSRv707jBuM3Gc+KldN7bjKuawLEjlDG3o3T+zChnJivqq9g
         ng0Nw+bJNg+jNhaDqXUTg1tLVMi7Jccn0IQNF/hNNjlxQoKDC3Z/lGM1Wrz+MbU3FjlM
         ZntWjLJ05sveX6SdHnvZunIWBuSwUyTxu1z6WTSq4MrQ5H9lHIu460PtK7yAIVQbqOoA
         d7SA==
X-Gm-Message-State: AOJu0Yzl3o5cpSvV8E2Rt1NljpDS4gpYOi+vcb2jpPwjvjLa5fz4+elx
	nFlJWrUwmR3wkhirh5/KHCxL7Q3t/H+BfzW6i+0A2ieNSXEkWbkg7JSi2w==
X-Google-Smtp-Source: AGHT+IGf9QK0QpSNxbm45T2FEivaCIusibESERuvwR9YsSh8uK+WhxBRvYeFa70z9Xc08Q9BwN2JgQ==
X-Received: by 2002:a17:902:fc8f:b0:20b:5231:cd61 with SMTP id d9443c01a7336-20ca14732d9mr21408005ad.24.1728631422585;
        Fri, 11 Oct 2024 00:23:42 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad335dsm18825155ad.50.2024.10.11.00.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 00:23:41 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Sachin P Bappalige <sachinpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v2 3/4] fadump: Reserve page-aligned boot_memory_size during fadump_reserve_mem
Date: Fri, 11 Oct 2024 12:53:11 +0530
Message-ID: <4cea3a03fb0a9f52dbd6b62ec21209abf14fb7bf.1728585512.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728585512.git.ritesh.list@gmail.com>
References: <cover.1728585512.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This patch refactors all CMA related initialization and alignment code
to within fadump_cma_init() which gets called in the end. This also means
that we keep [reserve_dump_area_start, boot_memory_size] page aligned
during fadump_reserve_mem(). Then later in fadump_cma_init() we extract the
aligned chunk and provide it to CMA. This inherently also fixes an issue in
the current code where the reserve_dump_area_start is not aligned
when the physical memory can have holes and the suitable chunk starts at
an unaligned boundary.

After this we should be able to call fadump_cma_init() independently
later in setup_arch() where pageblock_order is non-zero.

Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/fadump.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 162327d66982..ffaec625b7a8 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -80,7 +80,7 @@ static struct cma *fadump_cma;
  */
 static void __init fadump_cma_init(void)
 {
-	unsigned long long base, size;
+	unsigned long long base, size, end;
 	int rc;
 
 	if (!fw_dump.fadump_supported || !fw_dump.fadump_enabled ||
@@ -92,8 +92,24 @@ static void __init fadump_cma_init(void)
 	if (fw_dump.nocma || !fw_dump.boot_memory_size)
 		return;
 
+	/*
+	 * [base, end) should be reserved during early init in
+	 * fadump_reserve_mem(). No need to check this here as
+	 * cma_init_reserved_mem() already checks for overlap.
+	 * Here we give the aligned chunk of this reserved memory to CMA.
+	 */
 	base = fw_dump.reserve_dump_area_start;
 	size = fw_dump.boot_memory_size;
+	end = base + size;
+
+	base = ALIGN(base, CMA_MIN_ALIGNMENT_BYTES);
+	end = ALIGN_DOWN(end, CMA_MIN_ALIGNMENT_BYTES);
+	size = end - base;
+
+	if (end <= base) {
+		pr_warn("%s: Too less memory to give to CMA\n", __func__);
+		return;
+	}
 
 	rc = cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma);
 	if (rc) {
@@ -116,11 +132,12 @@ static void __init fadump_cma_init(void)
 	/*
 	 * So we now have successfully initialized cma area for fadump.
 	 */
-	pr_info("Initialized 0x%lx bytes cma area at %ldMB from 0x%lx "
+	pr_info("Initialized [0x%llx, %luMB] cma area from [0x%lx, %luMB] "
 		"bytes of memory reserved for firmware-assisted dump\n",
-		cma_get_size(fadump_cma),
-		(unsigned long)cma_get_base(fadump_cma) >> 20,
-		fw_dump.reserve_dump_area_size);
+		cma_get_base(fadump_cma), cma_get_size(fadump_cma) >> 20,
+		fw_dump.reserve_dump_area_start,
+		fw_dump.boot_memory_size >> 20);
+	return;
 }
 #else
 static void __init fadump_cma_init(void) { }
@@ -553,13 +570,6 @@ int __init fadump_reserve_mem(void)
 	if (!fw_dump.dump_active) {
 		fw_dump.boot_memory_size =
 			PAGE_ALIGN(fadump_calculate_reserve_size());
-#ifdef CONFIG_CMA
-		if (!fw_dump.nocma) {
-			fw_dump.boot_memory_size =
-				ALIGN(fw_dump.boot_memory_size,
-				      CMA_MIN_ALIGNMENT_BYTES);
-		}
-#endif
 
 		bootmem_min = fw_dump.ops->fadump_get_bootmem_min();
 		if (fw_dump.boot_memory_size < bootmem_min) {
-- 
2.46.0


