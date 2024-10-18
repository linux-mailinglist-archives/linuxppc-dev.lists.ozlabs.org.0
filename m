Return-Path: <linuxppc-dev+bounces-2378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 783039A4389
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 18:18:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVVHg0DWLz3bqh;
	Sat, 19 Oct 2024 03:18:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729268302;
	cv=none; b=cXfwyHTLkscMSMT1fHzGFGo64n3YRikaoiTWfavW1sy+h9KtGP6CA0XSuW529TKf5ntExuODO0zri+wzz+58S4OPlffzrEaVa65y8MK3u+zDQgmuOQOOORF7J2CePBSrb6Sg+U0gP0Y2EsapHKo9psIFxqC4B34945v91OSyX6kr0y5qI5q5NJFBClKtQPdw/6sh8wp21PIT4DE3hp0jUIaPIRgC3L1GSs38yPnhQ7hs21NOYADUvO7jbEUAfh3GdjHSN9zbIGwCgglGrjmBShWn04ZtIi7iJPDno5bcjAjsk7+fnk5IMYOIhhZHKpaMZKtiQufkpRiPyB6PfoL8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729268302; c=relaxed/relaxed;
	bh=1OVm1aMfcJH+C5h2HeT9933XrsU2qvy2OkpNXm8z7tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ho4cElGjfshcbV7yUSBWPXm4BqnnZINHgAz8RU1kusgo80P6E/IZFbiDtmKx87jErbT/WrZLeSPeLY2MHzQYT4bw8dFgagqDtKwHJ/Lg8KVfWKxqJCVepUwLJ0hS+dRwMVpfbsBTldE0WK85fZd2Xj9lCBSK7r9xCG3GwVomGg+G1j2NLKvogORex4f2CKr3gulvc/ho9fZUoo6P6+mzAty/2/H5lxYWeWRyZLsaAaxStaDqnXfgSk6JSwigIK0C9remgwZgQALN/4U85unNZQEoEDNt9qHC8SSnS+ezsjpc4Ph4L5A2o3KrMGNWVrpKIlatbDup+v4rAEvQh5E/WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NoSDoABJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NoSDoABJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVVHf1Njmz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 03:18:22 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e7086c231so1763644b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729268299; x=1729873099; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OVm1aMfcJH+C5h2HeT9933XrsU2qvy2OkpNXm8z7tg=;
        b=NoSDoABJ1Cc4qqezhl+sec5cliYZawLjPzgdDBV1tpUpqz8uUns4gkvbalVBH4kuVg
         NFE2PvIDyciRwve6Dj+oOdcwYWxMdcCa0gd27758Cghzo0z0/R0NjWS3xMoMjMV2q8Z3
         5zf0EF9bdb+1mwGHKnP3HQ4GuKKMxBqaHvLI1vAnaObaBYYy3qKthcqJn+wqQm123u1g
         qXEJgUN8l0DYvMaVKuz6Cc8JfGAR0Ef5AMYJ3brGZS9ZIG4YB+0DdEjqoUN0zKv52cXw
         NtMnoPVhWwZv2JC7k0+vfMpbFMB3J8ZcPK8X9xyiNYUVveXQqMzujpYNV+euKURKtQUs
         Bljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729268299; x=1729873099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OVm1aMfcJH+C5h2HeT9933XrsU2qvy2OkpNXm8z7tg=;
        b=lk5wdyy4IfnkClh5kUmYgEK1118r3XeKijqznC7dJE54ub2hYsfXwvOR5uzvkJZnEl
         45iI2GykRPGcEAn8KgzSzWQo/3MSSPUV+w7qJrUkmxZc+Fp3yqdi0IySGRfmyS76Q+gl
         V1XtUX106lvN1R++Ls6jri1Byxac9Rg5coiUD4mZTGq98IAM0cLVyXmFYc3Mpbid80vH
         li2vpE05Q77Y+yQipXg7DhLsreAzeHX6IOgEcW5hxDB7uXuM2jd57G7NNkz5uMudY6an
         ZsTPggq6OZ3kpV9PxETJzgyqzuigToUZ6LdEyHo3+mqX3mg+9zhwlaHtl0q7cRgrPqFA
         U09A==
X-Gm-Message-State: AOJu0YzqP23xFR2cKyyRg67MC3Lcp0wMxA2Ju8XkFEfebZdqmIpPxJON
	fGr0IyNI7likbRFtkkUu+HZWM96Hcp+7hPnFJ2NiGr67FnmV/Xue+9A2GdsL
X-Google-Smtp-Source: AGHT+IFYn+jHU87+CuAdiC2bANQdqGrWOhnXYjaGpsSCpU5oDVmDDYqIstLDV3L6h3hQlUt3per1nw==
X-Received: by 2002:a05:6a00:c84:b0:71e:58be:3604 with SMTP id d2e1a72fcca58-71ea31923b9mr4310756b3a.4.1729268298529;
        Fri, 18 Oct 2024 09:18:18 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea345677asm1692140b3a.147.2024.10.18.09.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:18:17 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Sachin P Bappalige <sachinpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v4 2/3] powerpc/fadump: Reserve page-aligned boot_memory_size during fadump_reserve_mem
Date: Fri, 18 Oct 2024 21:47:56 +0530
Message-ID: <805d6b900968fb9402ad8f4e4775597db42085c4.1729146153.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <a2afc3d6481a87a305e89cfc4a3f3d2a0b8ceab3.1729146153.git.ritesh.list@gmail.com>
References: <a2afc3d6481a87a305e89cfc4a3f3d2a0b8ceab3.1729146153.git.ritesh.list@gmail.com>
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
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
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


