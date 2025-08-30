Return-Path: <linuxppc-dev+bounces-11514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07793B3C7A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:54:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLq92YrNz300M;
	Sat, 30 Aug 2025 13:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756526053;
	cv=none; b=XAun9waxOYeO63cKDpokEAs59dpoGdCiob34nA6U+HFE3Ai2hIimyEySG5HFGnNekJlsjNPWbsS8SVvlk/p3LV9jpPBu37bY9O/YBt6lRmrQRhEh+dXWTx9CSOmalA+WwplHE3RITasbUH+od/x8HUlsnZAh4MED4jdLosYFBrzAEVTuF60NZrYVI1zSuT90kmuvUiZNGuO4AWHKwZD2ZQyTWgdimqhKc2iEfWnMd6x7fli0KPaQwnQXNZx7aVPc9v94a2+xcknHwb//44z2jTLbaPUdQogwc0HL93EFTko5E1sO3faeMSNi1ZtS5DDdFKOZJFXrMKPAawD7doA51g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756526053; c=relaxed/relaxed;
	bh=PkPvK3hvdV/qARuHqLHoXX12kdWg/PT7FuxqdRsrJ0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALjw0pw6UEDOmy6nSsOyzg1UoIl0/Pwsr7QTKsm+AAnvL76KfjHxCGFk7TO7OOkAW8OxZEzVyD2/fpkEmhidGSqFDgFt4/nkEv58VpcOMiVATJkg7LX/7AL3be1cBdQRAU/UKL/5ohHS/AnLdf3tQT3tDbSnQgBSVZEQCREoXdM7D7P69klxr1DYbq1ETod+NRi/Ix6/AyfnoZTsYJZnPtOLPEQQCDho1QKKPUHQT3VISY+rM8K/ZILjRs5WbmKd03gtKPP1bzsafky2+81MbwEDycPAUwgIwfLWpBnn7oqDTB4OMZpwncxl6X/ogzidh6chC+/lL7kjqdGPzVHv2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MVrsx3NI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MVrsx3NI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLq85W0Dz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:54:12 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b4d4881897cso827925a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756526050; x=1757130850; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkPvK3hvdV/qARuHqLHoXX12kdWg/PT7FuxqdRsrJ0c=;
        b=MVrsx3NIOCHDp2d+Cv2wUUQiwh/2q02/aBH57w+vvOO9Jc1p0n3+tFGo2KbSqZ4yPw
         uQRYsYgcJyHR9YvF0q2cW61CJERMga+bp0TC3WCemSGRUdaC5d47T/9i86bPvR0a85tx
         ba21DWYm1p2++LB+d9VgxFkAMQtacnLO+eFL+AP4AXSQcJdVKwy2thAJw3cfR8o4mVJC
         MebQZVNEqprcn6DZ4lyEj9MQRaZg7E14ZVr+6mNF7yXXjquBpK6+QgsmlR+AkKQ8T/jt
         OXA5ItKv8X0BT9/P4AwC4Xzyj3Ppmop/Mwq7fQbPsAPL7IQAlHAcjtey2nV2cp85Z2N5
         8PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756526050; x=1757130850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkPvK3hvdV/qARuHqLHoXX12kdWg/PT7FuxqdRsrJ0c=;
        b=QVl1Fjq9Dw4r6RkgXkpX2W9yXtLO0NyxMWqTJmFiYelqKWHsXPX/xeMs9WS4ir57mz
         nKGUqV3MJI8Ngui20VjGH5AiSWfGKjjgmdFZpv+Az6Gap2UpR97aeEp6PwKOLkiNt5pv
         FJm5o5A3bLwV9W7jLiwD+8/3gFqf3nL3bkWpUIjBf/MMNygaWe1aixEpkvizwCo6fobG
         2ahSVXBbJNeCt+C6FOgzK7TQkm+hgBvXY8ANh7W41YYxoy+cUSQo64TI0PL05RXAI6Yl
         Dn/GmZjsiCpeWAM76l5Nphl1ddiRt9ynES8ltdm1fSCptJy4GH2U05As0Ud9HSlzF5WO
         +9hQ==
X-Gm-Message-State: AOJu0YwLapOc4d9BwGMYkYNfGhJ8GFgxSiEkOC7Pvw9G4WNSObWWHfO7
	a1LZolgSnDq/VQDl3uS2/icT9cQ/9XoDpcj18bzoHCBO15g9Nx53za5RVDwAUw==
X-Gm-Gg: ASbGncsm3k94SvbCyn0TiaAlxMEUikCguYVny1it7deSgAcg6uYnBynjG2g2n+E8e6m
	T/5whjmRrfUxeR8l69IzxtZ9YT/vJnPbwqQwjM7gxje3O4apvE50QO5Wm8RoJXyjDiWsXbCy5kf
	22/5FsLy+02BqVVcHyJjM5w2bzL9lqrMhTcitSFjfR+/VxQq3NcGB0CozbgXpXi/+/JB62fzFhz
	ZNKtHQvAlFfIJd9j5is39B1uT6FafJIg4X9UFE61Aw7CBfCkDMeNBLko2GcyNPV6UvvzigKhHSV
	aXWgIayWyoEqm3PsdPKnQsqHgB9vP0/BRKwKo/Nr2IHNzTsk2p3aIIVdsCLtHqEpJ+hdL+i1Lz5
	BZkegt8cPrAkNzb7sA/kPdoQdjnU0y16kbTeq
X-Google-Smtp-Source: AGHT+IEJvW0ukJ7yoY0KNjdc1rvwSHjFy9/NIViZlIzge2iiLkS6CaVOXWobbtjChVYZckVpP1KMLQ==
X-Received: by 2002:a05:6a20:9144:b0:243:a9b6:dea2 with SMTP id adf61e73a8af0-243d6f02e4emr1390275637.29.1756526049966;
        Fri, 29 Aug 2025 20:54:09 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ee17sm4279879a91.24.2025.08.29.20.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:54:09 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 2/8] book3s64/hash: Restrict stress_hpt_struct memblock region to within RMA limit
Date: Sat, 30 Aug 2025 09:21:41 +0530
Message-ID: <9f48f73da905d29f3ebb9792377601021d143f7a.1756522067.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756522067.git.ritesh.list@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
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

When HV=0 & IR/DR=0, the Hash MMU is said to be in Virtual Real
Addressing Mode during early boot. During this, we should ensure that
memory region allocations for stress_hpt_struct should happen from
within RMA region as otherwise the boot might get stuck while doing
memset of this region.

History behind why do we have RMA region limitation is better explained
in these 2 patches [1] & [2]. This patch ensures that memset to
stress_hpt_struct during early boot does not cross ppc64_rma_size
boundary.

[1]: https://lore.kernel.org/all/20190710052018.14628-1-sjitindarsingh@gmail.com/
[2]: https://lore.kernel.org/all/87wp54usvj.fsf@linux.vnet.ibm.com/

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Fixes: 6b34a099faa12 ("powerpc/64s/hash: add stress_hpt kernel boot option to increase hash faults")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 4693c464fc5a..1e062056cfb8 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1302,11 +1302,14 @@ static void __init htab_initialize(void)
 	unsigned long table;
 	unsigned long pteg_count;
 	unsigned long prot;
-	phys_addr_t base = 0, size = 0, end;
+	phys_addr_t base = 0, size = 0, end, limit = MEMBLOCK_ALLOC_ANYWHERE;
 	u64 i;

 	DBG(" -> htab_initialize()\n");

+	if (firmware_has_feature(FW_FEATURE_LPAR))
+		limit = ppc64_rma_size;
+
 	if (mmu_has_feature(MMU_FTR_1T_SEGMENT)) {
 		mmu_kernel_ssize = MMU_SEGSIZE_1T;
 		mmu_highuser_ssize = MMU_SEGSIZE_1T;
@@ -1322,7 +1325,7 @@ static void __init htab_initialize(void)
 		// Too early to use nr_cpu_ids, so use NR_CPUS
 		tmp = memblock_phys_alloc_range(sizeof(struct stress_hpt_struct) * NR_CPUS,
 						__alignof__(struct stress_hpt_struct),
-						0, MEMBLOCK_ALLOC_ANYWHERE);
+						MEMBLOCK_LOW_LIMIT, limit);
 		memset((void *)tmp, 0xff, sizeof(struct stress_hpt_struct) * NR_CPUS);
 		stress_hpt_struct = __va(tmp);

@@ -1356,11 +1359,10 @@ static void __init htab_initialize(void)
 			mmu_hash_ops.hpte_clear_all();
 #endif
 	} else {
-		unsigned long limit = MEMBLOCK_ALLOC_ANYWHERE;

 		table = memblock_phys_alloc_range(htab_size_bytes,
 						  htab_size_bytes,
-						  0, limit);
+						  MEMBLOCK_LOW_LIMIT, limit);
 		if (!table)
 			panic("ERROR: Failed to allocate %pa bytes below %pa\n",
 			      &htab_size_bytes, &limit);
--
2.50.1


