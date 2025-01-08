Return-Path: <linuxppc-dev+bounces-4830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 074C3A057CF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:15:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSkM16Hz6z2ypV;
	Wed,  8 Jan 2025 21:15:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736331325;
	cv=none; b=SFmEqA4b2+QlqH9NPDMC98olzFKN/FMQfgDQEShjYN/UdFxi6pkO/d8GrXQJ7atzi2adWEpeOaCukOt2t2fd42WZ1igTFbPdnGckPh4jQNxVSj+RK0QqHROWEZwaFM6c4Faj0Bx9MD+/rRTU1gvHyybOFtVQ2lEJByWWM4QqxQr1eS2XCEYpBNRxMJ1qpMWMJTChfg2tdhAGY7UAkFZzFuA6NLvqYocc6F2umPka///7bEaYPwIlQ5PF1AAue5xr2rpqaxKUC2A+Xa54/dkgsFfvecTzdbd4Dw61PspYBdDd04x+pwoRz1c2i2qx4vrcusAFAMWJdJ/Vy0vXN5I5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736331325; c=relaxed/relaxed;
	bh=a51YAcOPHw8REYfzDT6Mazib9DPYr/BR2XxrvtalFWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRTjXkQJTmqGs7oWUx+YOu2jqWXhgYYOXCl+guAEZuqXj3lWrJZDiu5X/B+4DY7Qe2GbzpPkSnseo6SXZDQEVgeScULuFPmlCuwwAAeb+YGYu8HSvg+l9hwf/53jOYDdt4xX6dNR/Y5NXgwlFFcRRLLJbew4HooQSSCBE3wtFJsGZa+LbpE28jbJ8KgK3fPjJEjoKVViqAQ/YZ9G3zzRDGYhb2Vjxz0j8qvV0gD2hbkGkmyIizqRHpeI2RqCqF0LXymEyOzXiEtWdqIPFgW5bqKSFWCNZe5tAJMXDL4BP/7Y2sNPstdxhbrzptuf+FO3dL4eVbuIcRHb6P8dkRiYjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AhQVV8QQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AhQVV8QQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSkM00DXkz306x
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:15:23 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5083qf6n016007;
	Wed, 8 Jan 2025 10:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=a51YAcOPHw8REYfzD
	T6Mazib9DPYr/BR2XxrvtalFWU=; b=AhQVV8QQxG72eHttCWIWd7bZnZ4zNd1lK
	XgKDaycUXuF+UdHaJoHJMAdqXbmy7ZqZNQhsiNU9jwZf21NRNdqs8w1t/0+KpJbD
	Wtb1wlarDFdpZXvg9tklkkvVtXlEsJU2M47sEuJ5eTKI9wYgng25sGXr4EJOSTOZ
	JWSL5YPI2X8Lhmr4T2DFfETcG15EqzB/upXHMGMFQS+r+EdjNyIiABLCeU3VpITv
	2Rc0VNOYL1TTGbFAl+uPJohFQVMKuLdTjIEbGfi+WOo68ekFbzd11UsPhBmbsTdX
	qqR7TLOSE1uHj897zpkWHs6SRQ+ogLp+VPrcUjZfq17gsHCftpGzw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441huc1ky5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:11 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5089UHKo015798;
	Wed, 8 Jan 2025 10:15:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtky3vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:10 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508AF6h341746916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 10:15:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47B8B20063;
	Wed,  8 Jan 2025 10:15:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FBBB2005A;
	Wed,  8 Jan 2025 10:15:04 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 10:15:04 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v1 1/5] crash: remove an unused argument from reserve_crashkernel_generic()
Date: Wed,  8 Jan 2025 15:44:54 +0530
Message-ID: <20250108101458.406806-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: IU4BIVkhGg9N4NI_oMQyJA8sLG-MN9Wy
X-Proofpoint-GUID: IU4BIVkhGg9N4NI_oMQyJA8sLG-MN9Wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=872
 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080082
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

cmdline argument is not used in reserve_crashkernel_generic() so remove
it. Correspondingly, all the callers have been updated as well.

No functional change intended.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
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
index ccdef53872a0..2e496209af80 100644
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
index fc53ce748c80..750991df9e52 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1377,21 +1377,19 @@ static void __init arch_reserve_crashkernel(void)
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


