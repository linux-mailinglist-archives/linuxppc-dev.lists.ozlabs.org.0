Return-Path: <linuxppc-dev+bounces-2122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCF199A70F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 17:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ8ts0tSJz3byk;
	Sat, 12 Oct 2024 02:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728658821;
	cv=none; b=NIyKjWGOD7Dsm2KXXNQk1eLqNVyoY/iekQjUVchiLuMdrSlVaqeqPl7pJ26Zz/V5kcS809O3ijd2Tcfz9OYom+i9P3TnRR8xYpT2wvCTDMs0ycTv0B7iSeLKnMjwxx7cvk8AwfswsCqoeXOvXgBZkpMEcrqKxOiLCB08MfGSnkX5HEfEuKKmMubDPI3SB83qWvSTl93dZtSoQljp4HhIiFvoBrm0ReV+2U9uBYcf+Xi5bxcfNYuJwzQ1k+FHKLk+Ma5yic41joxPy45S49yJSXrzB24NcUKJxTpuALriG91ngzK7i1KO9IrSMogu18qp+vbkgNn20Zb+uv0fu+98/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728658821; c=relaxed/relaxed;
	bh=GxJ3a4GJ9kmYrP2J+wqTevzfvJ84If+iUVZIlsVHzAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cjcg+dES4rLkQ557Z3P2I+uy7QQQwEiOgaFehGD7q1YBAyx/+SUjcMFdOr2X8QMIy87CTmNAb2vno2zhSUeD/EVvA8IjYcyYys3xd1LN2HGdAIrbMUme63UW9PNvIjFCU5tNVfBoq5jEOp5nuOO8IhaIdhhRhr5DBR6CSJdRGGm/syqNp4OlCFzQO10qusNN+Ne0CRMKHv8xixj4MUzC0rlgpFsryFQSibJq1U7Wpa1SzqnL4XHmT4fak28XYgaszqZDjRnsWa88X94zHJv3ULGHZq1PH5BfdIRUb/GNJIHH2rmLXCkIHfRGeA3T86bOwprLVmT1gDzJD8WZM4NoOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WcGRDLcP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WcGRDLcP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ8tr2304z3bxR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 02:00:20 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71df67c6881so1851213b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728658816; x=1729263616; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxJ3a4GJ9kmYrP2J+wqTevzfvJ84If+iUVZIlsVHzAQ=;
        b=WcGRDLcPn6RE43x9Es4jDQN23+vVO6VZ4seQzfg8n0Rty6zsCKDMKBJH3UWRwWgyV3
         U4VEE5aSiOHTWdXE0QSXo+oG/6jLToa23l8iEO62tM7FWESL0QTfD74rPvfU9BQZ5hvO
         VLbCF7nG5mYVEO926fjg/f6A2lhGDdTzB3sYfwYw+5JPhDnZpDez6hfobYAD+4uEH+AC
         Q5e6yJqoeF//0EaKP5ZGmk2JJXc1dlWLBBpILpmsyaD5ByjQE2bnGOBqIXTh1ZEsXKQ5
         g4qRgUTVo42dIFC23uNC6b760mkCnSnGGcWgRxzpDIffEbsf4vEjrb9q4+WLQxOyngIm
         cfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658816; x=1729263616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxJ3a4GJ9kmYrP2J+wqTevzfvJ84If+iUVZIlsVHzAQ=;
        b=qb05kcJCkjhvHDZwZIU7ta783G9PNuWYXgfMkjREkgefoZdKxUC4pMrurUw/Wc3zlB
         cHK90Y1L2o/7K6PlAqyuhRrB0TmA12dY8U4uPGGhpRQxrzvtH1QNs6hdfyinklwrdewr
         p3NbqGy3kOaNuPm/Iqfq3yUbPemx3K1YDHK65W+RP0HxmRasXifTfakvfr21xx+pmlWF
         EIVg0Sx2IHXh+EmZM1yWJ0HbroO00zu332JFTg86GwWHjqW5ZnGTCAJSwvVVP+jn7Tqe
         D0Z+vJwmlszdnfVm6pmh2q95Ru5nQIbPfyT5i/IiqG5Yqn0wPmWPycfZECK2KTC5u0qd
         2YKw==
X-Gm-Message-State: AOJu0Yz7QOAHFj/Pi7Tzi0fQ+8ckYj5Icicg0Gv3txVvcoA+TDr7//6L
	+X7tLDUXFGwZeC3YNrNConxwPNinXbJSAS1LYTfY7dNrsP0LHr40NypAoQ==
X-Google-Smtp-Source: AGHT+IFbjpvOtZ/4fnGnu1qPpet8fqGoBC1EXvpTqBB5vCO3GdLz4J1XYWVfGZyMKj/vHw3RhywtBA==
X-Received: by 2002:a05:6a00:84c:b0:71d:eb7d:20e4 with SMTP id d2e1a72fcca58-71e37e4e13emr4618936b3a.8.1728658815997;
        Fri, 11 Oct 2024 08:00:15 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e4a2c9767sm146561b3a.85.2024.10.11.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:00:15 -0700 (PDT)
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
Subject: [RFC v3 1/3] fadump: Refactor and prepare fadump_cma_init for late init
Date: Fri, 11 Oct 2024 20:30:04 +0530
Message-ID: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
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

We anyway don't use any return values from fadump_cma_init(). Since
fadump_reserve_mem() from where fadump_cma_init() gets called today,
already has the required checks.
This patch makes this function return type as void. Let's also handle
extra cases like return if fadump_supported is false or dump_active, so
that in later patches we can call fadump_cma_init() separately from
setup_arch().

Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
v2 -> v3: Separated the series into 2 as discussed in v2.
[v2]: https://lore.kernel.org/linuxppc-dev/cover.1728585512.git.ritesh.list@gmail.com/

 arch/powerpc/kernel/fadump.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index a612e7513a4f..162327d66982 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -78,27 +78,23 @@ static struct cma *fadump_cma;
  * But for some reason even if it fails we still have the memory reservation
  * with us and we can still continue doing fadump.
  */
-static int __init fadump_cma_init(void)
+static void __init fadump_cma_init(void)
 {
 	unsigned long long base, size;
 	int rc;

-	if (!fw_dump.fadump_enabled)
-		return 0;
-
+	if (!fw_dump.fadump_supported || !fw_dump.fadump_enabled ||
+			fw_dump.dump_active)
+		return;
 	/*
 	 * Do not use CMA if user has provided fadump=nocma kernel parameter.
-	 * Return 1 to continue with fadump old behaviour.
 	 */
-	if (fw_dump.nocma)
-		return 1;
+	if (fw_dump.nocma || !fw_dump.boot_memory_size)
+		return;

 	base = fw_dump.reserve_dump_area_start;
 	size = fw_dump.boot_memory_size;

-	if (!size)
-		return 0;
-
 	rc = cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma);
 	if (rc) {
 		pr_err("Failed to init cma area for firmware-assisted dump,%d\n", rc);
@@ -108,7 +104,7 @@ static int __init fadump_cma_init(void)
 		 * blocked from production system usage.  Hence return 1,
 		 * so that we can continue with fadump.
 		 */
-		return 1;
+		return;
 	}

 	/*
@@ -125,10 +121,9 @@ static int __init fadump_cma_init(void)
 		cma_get_size(fadump_cma),
 		(unsigned long)cma_get_base(fadump_cma) >> 20,
 		fw_dump.reserve_dump_area_size);
-	return 1;
 }
 #else
-static int __init fadump_cma_init(void) { return 1; }
+static void __init fadump_cma_init(void) { }
 #endif /* CONFIG_CMA */

 /*
@@ -638,7 +633,7 @@ int __init fadump_reserve_mem(void)
 		pr_info("Reserved %lldMB of memory at %#016llx (System RAM: %lldMB)\n",
 			(size >> 20), base, (memblock_phys_mem_size() >> 20));

-		ret = fadump_cma_init();
+		fadump_cma_init();
 	}

 	return ret;
--
2.46.0


