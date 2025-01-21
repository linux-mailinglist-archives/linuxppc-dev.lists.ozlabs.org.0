Return-Path: <linuxppc-dev+bounces-5442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E7A17D4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 12:55:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycly81P4Zz308V;
	Tue, 21 Jan 2025 22:55:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737460512;
	cv=none; b=idU86Alp1J3RXnOw/kqgxQSjxW90XvAKsYDkx1UMb7IiM1pj7Unuo+5BoICYZkVTuNNh9NSmVy79a+UUQaT5CUqtEPVUoGO9HvcVSpiGVpmQ3nff3W+PXjUrflB/U4l0SJ8zaCUJPNjhFzIiI8Cu0tQwgXDhakbLDVRA6PEfMEqOs5Botj90Z/Ze5iVkGp9KM0tV/GL6ks4B+BPgoUPHdZuyGvG2mruhNjLbehY4rNPqHb31GmoeoAoduBGkbmf4hJ6joNS8XQk7QOHWwcQMuwjmySMyDGEFrroveJF4TwOUCKXqjScJrZbhUIkPgUq7zsiFrM0eyAzeTgM0SC91ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737460512; c=relaxed/relaxed;
	bh=7MKiwUiMorQ2m9dugkm4c4e1LN4evDlFQwO4FRny26c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8ZxqTgK2CgPpiS3dmJ5Acihnwj0LN/HlOo2wzJapRllIY5Nj9/JvtLpkLumwK3aMfqJz+UTVGqBHnev8Mtoxh3/ogj/h588r1gCRyThgeq/fmyi8k/HDa7fb4zT9v39L+5y0ZMaJKfn+2dLrwvjjVNTyjrwowVxAafi/3shSegy7NJOLMZqxMLaqbZNsvsJFtYUThKEAl/BNgDPk6XAau4mcfQHTfMgCGKNLqu1vh5jJBsGx9pL4YFlTcONiopk5e18hJSlh8OjtKvCtnYynb0M4Fg9qTV2z/sswH5Q9AkqGxphTkbV3kc4lMyj/uI9FUuGK/hPM3PiRpRAE/rRlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=myEcGYrC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=myEcGYrC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycly73mKDz30C5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 22:55:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L20jru003271;
	Tue, 21 Jan 2025 11:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=7MKiwUiMorQ2m9dug
	km4c4e1LN4evDlFQwO4FRny26c=; b=myEcGYrCA217doP4fXYc3kQIL6Hv9NN4w
	fUabfBOZLYYQmgMhsUYW6JgTZWQ0fRiMpxHhr2uGlMlIx3Gi/xC28dd82Do/xZ7u
	jQ3SVxLenoGOTS8H1B0Pt0K0pc5bKTmIaN5OtN2ur+FkUHVc2Jh6xPOpNc3U4kaw
	6NvDJvO8lS1YecJkoyLbqzHF2pCA19OlCMvnzF6oE5060szS1X4yhEbLOI+G4q/W
	T8KbH99PYKKN4os4jawaLR29/8mHgZ7jmyKSstROJcXUaXcX9eEflOv9jsa4Pojt
	GFHn3DMZrodBUnuAtSSmLsMiY4x0XRcu4Jlo+j0KPO0BPdxS42vYw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a2dyabbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:55:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50LAP7wp029622;
	Tue, 21 Jan 2025 11:55:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448qmnayq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:55:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50LBsuti58786262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:54:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9121A2004B;
	Tue, 21 Jan 2025 11:54:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2DA120040;
	Tue, 21 Jan 2025 11:54:53 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.54.128])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 11:54:53 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 2/6] crash: remove an unused argument from reserve_crashkernel_generic()
Date: Tue, 21 Jan 2025 17:24:38 +0530
Message-ID: <20250121115442.1278458-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z6-DVn_Dz9QAnLAslqPL55Q8Q_uaILiA
X-Proofpoint-ORIG-GUID: Z6-DVn_Dz9QAnLAslqPL55Q8Q_uaILiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 mlxlogscore=857 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210095
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

cmdline argument is not used in reserve_crashkernel_generic() so remove
it. Correspondingly, all the callers have been updated as well.

No functional change intended.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/arm64/mm/init.c          |  6 ++----
 arch/loongarch/kernel/setup.c |  5 ++---
 arch/riscv/mm/init.c          |  6 ++----
 arch/x86/kernel/setup.c       |  6 ++----
 include/linux/crash_reserve.h | 11 +++++------
 kernel/crash_reserve.c        |  9 ++++-----
 6 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 9c0b8d9558fc..6c5a1ee4b5d3 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -98,21 +98,19 @@ static void __init arch_reserve_crashkernel(void)
 {
 	unsigned long long low_size = 0;
 	unsigned long long crash_base, crash_size;
-	char *cmdline = boot_command_line;
 	bool high = false;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
 		return;
 
-	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
+	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
 				&low_size, &high);
 	if (ret)
 		return;
 
-	reserve_crashkernel_generic(cmdline, crash_size, crash_base,
-				    low_size, high);
+	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
 }
 
 static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 56934fe58170..ece9c4266c3f 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -259,18 +259,17 @@ static void __init arch_reserve_crashkernel(void)
 	int ret;
 	unsigned long long low_size = 0;
 	unsigned long long crash_base, crash_size;
-	char *cmdline = boot_command_line;
 	bool high = false;
 
 	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
 		return;
 
-	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
+	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base, &low_size, &high);
 	if (ret)
 		return;
 
-	reserve_crashkernel_generic(cmdline, crash_size, crash_base, low_size, high);
+	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
 }
 
 static void __init fdt_setup(void)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8d167e09f1fe..16b81beb41bf 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1392,21 +1392,19 @@ static void __init arch_reserve_crashkernel(void)
 {
 	unsigned long long low_size = 0;
 	unsigned long long crash_base, crash_size;
-	char *cmdline = boot_command_line;
 	bool high = false;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
 		return;
 
-	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
+	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
 				&low_size, &high);
 	if (ret)
 		return;
 
-	reserve_crashkernel_generic(cmdline, crash_size, crash_base,
-				    low_size, high);
+	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
 }
 
 void __init paging_init(void)
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index f1fea506e20f..15b6823556c8 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -469,14 +469,13 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 static void __init arch_reserve_crashkernel(void)
 {
 	unsigned long long crash_base, crash_size, low_size = 0;
-	char *cmdline = boot_command_line;
 	bool high = false;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
 		return;
 
-	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
+	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
 				&low_size, &high);
 	if (ret)
@@ -487,8 +486,7 @@ static void __init arch_reserve_crashkernel(void)
 		return;
 	}
 
-	reserve_crashkernel_generic(cmdline, crash_size, crash_base,
-				    low_size, high);
+	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
 }
 
 static struct resource standard_io_resources[] = {
diff --git a/include/linux/crash_reserve.h b/include/linux/crash_reserve.h
index 5a9df944fb80..1fe7e7d1b214 100644
--- a/include/linux/crash_reserve.h
+++ b/include/linux/crash_reserve.h
@@ -32,13 +32,12 @@ int __init parse_crashkernel(char *cmdline, unsigned long long system_ram,
 #define CRASH_ADDR_HIGH_MAX		memblock_end_of_DRAM()
 #endif
 
-void __init reserve_crashkernel_generic(char *cmdline,
-		unsigned long long crash_size,
-		unsigned long long crash_base,
-		unsigned long long crash_low_size,
-		bool high);
+void __init reserve_crashkernel_generic(unsigned long long crash_size,
+					unsigned long long crash_base,
+					unsigned long long crash_low_size,
+					bool high);
 #else
-static inline void __init reserve_crashkernel_generic(char *cmdline,
+static inline void __init reserve_crashkernel_generic(
 		unsigned long long crash_size,
 		unsigned long long crash_base,
 		unsigned long long crash_low_size,
diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
index a620fb4b2116..aff7c0fdbefa 100644
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@ -375,11 +375,10 @@ static int __init reserve_crashkernel_low(unsigned long long low_size)
 	return 0;
 }
 
-void __init reserve_crashkernel_generic(char *cmdline,
-			     unsigned long long crash_size,
-			     unsigned long long crash_base,
-			     unsigned long long crash_low_size,
-			     bool high)
+void __init reserve_crashkernel_generic(unsigned long long crash_size,
+					unsigned long long crash_base,
+					unsigned long long crash_low_size,
+					bool high)
 {
 	unsigned long long search_end = CRASH_ADDR_LOW_MAX, search_base = 0;
 	bool fixed_base = false;
-- 
2.47.1


