Return-Path: <linuxppc-dev+bounces-13561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F78C20CB8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6jb3BXsz3dVB;
	Fri, 31 Oct 2025 02:00:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836419;
	cv=none; b=g0JhXXX43aJBA32+OtaoKn6C6bDLWQyidkykRB/AKdvIWUYt2KGISAEMrZNyQ9zl/BTfJU2J4O1f4bcrk6lT1My9hOlkftRQzpiziH7tg1d5vsaGjoBrA04tuL8NG5JYn4yW1EbzTpMtsh/W5F2RZwM8xu7w3VM72Z+Z3xBkygoS94IbQ7h68o0G+kLp2hcT80/mYSMakWKcAsylYw593J0mrZDNrQgVVdYo575Y4yYs//V8MjEZvWWy+j4e5KfeM1PpBCFJzpLulClEXOI1KpPeYJGvg/xc6cDizZoWfP7RVm0l0SifYIN54zIxVOOrPxQFTo1dfOGuRjDqAVC66g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836419; c=relaxed/relaxed;
	bh=z3G+FVBY9sHkLVXsE8KMrMWbEPB/8f0EMDpXSOESQpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOZECq/UwFJc/3DAsiHGylOG0j+RF9mRDgyILxMyref/0BYysOrogpoijNs+jL0N2pwKDomhFrs74db7mSZrB/GFkEjlchhmv+CfdFJNL+rkXewdKXCzsA7ND3A27W9InOdMms+dhe/e/6fiIfmt0gFO6D9k4+gDTbQi7To2fRK+WEZrkhtAFTBfMhyfxHbR8VdAaBSLIFFVgGfQ1JHsXATpLTSfcnRmtIbuX5ActLITxKFvdXqDQXFvcOxroCqzGE0v4bJmPLKbdNH1vzer9i4e6zn9+YAUSvGrBqg8JWntRjhlFXzoBoS3ckKUUawK6lpIbRQJML3A3ahxaxgejg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a0FLjIRS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a0FLjIRS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6jZ5Tp2z3dV6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:18 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7a1603a098eso805282b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836416; x=1762441216; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3G+FVBY9sHkLVXsE8KMrMWbEPB/8f0EMDpXSOESQpw=;
        b=a0FLjIRScNkxuSW426mt9IhnaLFVUPdn71ez2eYlRI5YyvvWeh02IQliK55gtPsTIf
         ezDAWrQ7HTq0omZR56ezWgORRJ12hJpj+Tbemh2q46opoa5ylD/V2LMyb4IMh0389KZY
         BYIFHwvdwcZDaZTiwUmxlRLm64qQOlu6hjGUXRuVYhkMS5YSz7d+j9PkbArwcNA2SklS
         M7iqQa51Ij2RIPFqbOeFLbxjpmpYXcWjSk1pZFOC+MFGIop2Ry3OQUe+GBXYl/tyMxgZ
         5Ci7HZxIS4bRxE1TId8twu0JRNLXTHRH0bZoAXJ1EXjh+3PbZdTHze8ehkHAyufFk18G
         e/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836416; x=1762441216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3G+FVBY9sHkLVXsE8KMrMWbEPB/8f0EMDpXSOESQpw=;
        b=rGm3ZmFPQLUNrBb2WfK0+QbuLsy10ebvM4cjXIbzSgRW9l4dK854SPQz6PBtRz0hsS
         w14JptySXvgjvltKX03Zo9wTHjQ/QfFB+osR8EtE8o8jFZyOzNXAPTWLdj0PmG9A8TM6
         OrH+BF0O9r3LjamFe0en6Dr3yPm9t0Ry+ZOsQO1hx/oa1IDl++Nkxs9JCrYstjeogS2F
         oKx8N7I6PL/nPLQzreedsZ12KKHl3Syn+pwPcQ66c4CwNuK9rtPhSaHiNxIKK3ghIx+A
         RrCswyuWkOlN5AokKuq5DJL+c5b53uK/snkwqJnLZazzVg2WM0UcJTUurr8RjpRYsmZh
         xmcw==
X-Gm-Message-State: AOJu0YwsXhswSG2zI8DDDp06t1q5DcW14BKseRWUVkxg1fk0kPmU8Yfv
	w5vEgx+0LxPz6Qm1yrITKhvCVGIA0Ghe592yY168/xHg6AOQJf4OAGN46HL2Zre4
X-Gm-Gg: ASbGnctfv7vj5Udvr9Nqy2LD+TT6ux2D9+CdIE/rc7GzjNQ/KAtl35YSEFP4+uIqCT5
	h3AOeSxBT7CzAjezCEzyk24LenzylX9g0IaO/2R2C5Wrp/oMALvpsHcz0MIcjK4tQwkIeWhFFkd
	uyPDx2sbfGgtLO5EhUh2gGWdSUvxHphWGxzvu02/PzZefJxuyT2oZySM6m8+UIox+4cFX3RtUMy
	P+BquF12wIFFnjmdOU9IPhEhJKdwJb8fvN7+OuhO1xiRRcg/fKvLEvm2vCNAdjDzoocRpQAR8S8
	KgE3BbuUGkGaTO5/RIyt2UR6yhVKbdMIGBXGk087Lb6SWj1Gefyjor41TsXmIz9+2P84DLDrjqP
	1BcNqZ3rCVEjL2lrIlNlvewBna+O2dL1yi77lQ9QWIgGd7jdXzwaufLuVjWegMZwnyS1oio8l9g
	48stpS
X-Google-Smtp-Source: AGHT+IGckPKnxRpYNgGI48SRlhDXr7OZiIZwbnGMQV3Wk2IVAtRMLX1lIO0rSRiXjMJzHndLguUHfQ==
X-Received: by 2002:aa7:88cb:0:b0:7a2:7792:a477 with SMTP id d2e1a72fcca58-7a4e4d1726dmr8494560b3a.27.1761836415232;
        Thu, 30 Oct 2025 08:00:15 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:14 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 05/11] powerpc/64s/hash: Improve hash mmu printk messages
Date: Thu, 30 Oct 2025 20:27:30 +0530
Message-ID: <a2af842f85c099cdbd19bf468606960c5226a079.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's use pr_info() instead of printk() in order to utilize the pr_fmt
set to "hash-mmu:". This improves the debug messages that are spitted
out during kernel bootup.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 0509c0a436d2..2fa98d26876a 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -952,7 +952,7 @@ static int __init htab_dt_scan_hugepage_blocks(unsigned long node,
 	block_size = be64_to_cpu(addr_prop[1]);
 	if (block_size != (16 * GB))
 		return 0;
-	printk(KERN_INFO "Huge page(16GB) memory: "
+	pr_info("Huge page(16GB) memory: "
 			"addr = 0x%lX size = 0x%lX pages = %d\n",
 			phys_addr, block_size, expected_pages);
 	if (phys_addr + block_size * expected_pages <= memblock_end_of_DRAM()) {
@@ -1135,7 +1135,7 @@ static void __init htab_init_page_sizes(void)
 		mmu_vmemmap_psize = mmu_virtual_psize;
 #endif /* CONFIG_SPARSEMEM_VMEMMAP */
 
-	printk(KERN_DEBUG "Page orders: linear mapping = %d, "
+	pr_info("Page orders: linear mapping = %d, "
 	       "virtual = %d, io = %d"
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 	       ", vmemmap = %d"
@@ -1313,7 +1313,7 @@ static void __init htab_initialize(void)
 	if (mmu_has_feature(MMU_FTR_1T_SEGMENT)) {
 		mmu_kernel_ssize = MMU_SEGSIZE_1T;
 		mmu_highuser_ssize = MMU_SEGSIZE_1T;
-		printk(KERN_INFO "Using 1TB segments\n");
+		pr_info("Using 1TB segments\n");
 	}
 
 	if (stress_slb_enabled)
@@ -1869,7 +1869,7 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 			 * in vmalloc space, so switch vmalloc
 			 * to 4k pages
 			 */
-			printk(KERN_ALERT "Reducing vmalloc segment "
+			pr_alert("Reducing vmalloc segment "
 			       "to 4kB pages because of "
 			       "non-cacheable mapping\n");
 			psize = mmu_vmalloc_psize = MMU_PAGE_4K;
-- 
2.51.0


