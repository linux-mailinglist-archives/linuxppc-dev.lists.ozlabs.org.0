Return-Path: <linuxppc-dev+bounces-2123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC1999A711
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 17:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ8tx1HLlz3c2P;
	Sat, 12 Oct 2024 02:00:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728658825;
	cv=none; b=PhfS7dd8xOgLgYi1KqK2QpRm2yHpIYnD63Hsx3E5ueX7sdS0Keuf1zoWQ/KxOJ2epbdJhQYxuSNI078v/hjYlSjaIDRYgaggynPlGmcCGPdVmqLJrrb0Nk13n6JfRL1lK8/ATQcUTqW7Auo/0lOWGQPsEOz9XYrH2qGdYMLAaZq/BdsL+CQGzKC6IpSlC4FPQ/pnfivOFHMRDa8YUPB9QCRpe67cKln2Xs58MCKpB0eaBSOg+pyGny153KtBPUXO5HdXM7cfgfnwuFLSg0PknCc1BjL1IPuFtieWXgQtvRV6uJ4ZHBfQlrBrc1ys97KrXBuwee+E9o01EVtWgnaI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728658825; c=relaxed/relaxed;
	bh=FOuvgWQlE/foa4I7724xWSn7l3vcksejBT7rSNJjxxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHtBnjeAE+SbLj3qzF4CCOjLIuqOEuFmDVvDHMc9VZnPomM3+KZPUVx27bcvM0+v4iDx+KRRcJGjjJUDwpAqTQNttcffYqCJcs45zKRG0QfmZGRbB5YsioDHtt5N5FAxKBPdhATOrjzf90QmC9bCJSwjzwbw1Iw0emKKFl0asohTFeaCAQ3MOV2FzmeDGuk9HTJViQVAOBh0foHTZLjAoGdba1ntQL44jIAyHlbN/esqcDLX3Bm5hmWQhEgXg9qgWvxagYBUspOu3yjcy8qHHOGov9xk9MPbvsy5yWT3Yk5fg3wynwskJiYhqkUnrNXKe89Nyv4xdYuf8Mm6bh0bKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WCroKYlq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WCroKYlq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ8tw29g9z3bxR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 02:00:24 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e0c3e85c5so1795441b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728658821; x=1729263621; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOuvgWQlE/foa4I7724xWSn7l3vcksejBT7rSNJjxxM=;
        b=WCroKYlqZa9p5vB7B0ouw/xz3+dB7ZGK3aaRLYHYbERfMEUqmV0MU6J4h5BYNL+YGd
         YyVcgeCK/d+FmqgNLbCHZn/6Csg+YMYO3Jt5qZ/YUEPNGCih0X5WPDrik2SOU2Ns+p2Q
         7+zUryahkkdkCDAHPR7jnzXMKnHf0lYMcvd44wf/YLk6ZoVSHPiht5yX7kjMzTNPXin1
         4Lh4l0P0JAZ0R5cJ/nOCArjl5TltkK4/xnWw9oIZbADfHLDR0yOwhhgOHax80Ybmql5l
         FFQoB8aqJVbUmBp/qAOZ4a59/ab3pgYuHBEF8wDdPsugE5VVDmK5OSYGGp9ljb1sUzMj
         VLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658821; x=1729263621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOuvgWQlE/foa4I7724xWSn7l3vcksejBT7rSNJjxxM=;
        b=QCxV/hCuMpcsRg1blKKCv5O/57MBAVKVmXyCEZ7pl0gX7a0hQzKce3R6xWMKqAE+QW
         xjaBYuvZ8tU/54WNngz6L7AD1IvMsCJPqJiOUdw/Jksc6dQdoxKibJTHV5HSQ+aHRpy7
         StvtSsFnBF83ROy83axgbh+tWNecyvQs4ju7JiSihVHpn9re/nBlkBerTo1lWZeQSIdU
         +WDWPwkPxouRVtw4ccon9yV3PI21AxPD9CW3DdJHO4GNbthqR7KQoSp8gNozTRFoEo2u
         aGh0fi6DSGVK8SjeMAOEcxaWUZa6Pr/lptx0ghtoV1SNcH0E8JfTPUNpHgwQAq39jxeP
         SRNw==
X-Gm-Message-State: AOJu0Yy6j5XquMME03u3qa6tBy6g5sqIuMAao349I/vqA2Qe7/Plaxjp
	nvI/2XkkJYCA+khaunPa3oj2+fasEYEDMf0Swc3iduiIP+q4dGMOwU/PFg==
X-Google-Smtp-Source: AGHT+IG28SN7o4rqiQUvFnUoGcWs4GuDv3GMOcb/mAbo3sv1g27mwrxdu/TPHQf2tYzBTJhSQ+rF+g==
X-Received: by 2002:a05:6a00:4fd6:b0:71d:fb10:7d1c with SMTP id d2e1a72fcca58-71e380beb6bmr3997069b3a.26.1728658820768;
        Fri, 11 Oct 2024 08:00:20 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e4a2c9767sm146561b3a.85.2024.10.11.08.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:00:20 -0700 (PDT)
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
Subject: [RFC v3 2/3] fadump: Reserve page-aligned boot_memory_size during fadump_reserve_mem
Date: Fri, 11 Oct 2024 20:30:05 +0530
Message-ID: <32496f6daeb4ed04c772ae484895241ab2ae1da1.1728658614.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com>
References: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com>
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
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
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


