Return-Path: <linuxppc-dev+bounces-15006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D1BCDCA29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 16:13:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbwPg5lj6z2yPM;
	Thu, 25 Dec 2025 02:13:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766589223;
	cv=none; b=ZAMYS9axEC1cAsQ4WZGzsAMJl6wG5rRz2+qlyG3QM6MS96s8+z1gwasupOG4b7NnNDe3WIbMIUgcJkfwidaR95LoqCyEJ1QvKIMy59C4tmzdueRpp8A35kwBJfyZXsBWUXtwhiYsdR47x+HT94TyvK3KsDgsuf+Ki3RDdxwaSvTnWzCdhVU8LUsrl5D3OTnN/17GRqf9qwy4wZAMaJuciwzERQFPPBYF8uhWtrxgV1iS6rG3a9JYBo1+NSEd3PT116rWEem5XLDbghmwCxcx5x6F2C79oT3qjRfkkCWunm7isycXfD6YCTIVGtC0knJcEk/6/xXUlM7obfpGrSO+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766589223; c=relaxed/relaxed;
	bh=2rUrwi4/454JvpawXHtbSSSXenkYE1uudnT6J1C99ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Af67LSsx2Ydgd944VIY93UA61gOXL2SkILjEPfKxrLPNtHlxT9JnVuCx5UWTtt6Ta//1KT2Pmg7AmBNbtwRXDGj28VH+wNP+xoIRNR/PQYEQDTwMCeYph1I+qFfXtDpvhUgzBMlhHtN8r1Mrvo2IUqrfv3c/Hl0xNA9uOIJxbV1Ty6FC80+zySb4wGeSTH/bPJNk7uqUj7cNhhht3JdCpvrWnsxYxuIWN4KcVGSPrQTVl73z3HljwI8WpeRWLMfqUfR6fY5st2acWabpjDihmulHhp3q4qU1vE5YEKw2mW29q9RksYEixYkJde1TRR0m6+bmwmvnhfnqg/7tzIuf5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=la2Kc0Lu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=la2Kc0Lu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbwPg0Crcz2yHB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Dec 2025 02:13:42 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BO19Pn9029926;
	Wed, 24 Dec 2025 15:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=2rUrwi4/454JvpawXHtbSSSXenkYE1uudnT6J1C99
	ds=; b=la2Kc0LuQZJUKM4flTrAfD+yRkFMU6KjFOMOC3+iJ2Kf5CW63oJBvTfbm
	J2+AkturRQj6CT/MsFXqjnJmrP5ysUQYj+SaG5AqB8CaWjULGBEOXKXI+ZKjXyND
	ZybrheKCcalW8UQ+SjD99s+OanVmOKZdb+gtX/N+plfOzllov7QW4DRb5rTP0gs6
	TRTb6eN2feaaLMH2mKsAnw7LUuN/+gACU8TOcyZ1kzAoZItwc+4FlxAJBe2oljyX
	wBTwb1d653VEQe9DMM8W9M9D/Q3SNpW2wuUbwKVTocJae+zPeXwEVpsxuw7pjLHd
	tVOl6KpWgClsZ0VPXmgOq2yzaGRVQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kfq9x54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 15:13:24 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BOFBpNO005909;
	Wed, 24 Dec 2025 15:13:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kfq9x4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 15:13:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BOCF94i005245;
	Wed, 24 Dec 2025 15:13:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b67mk8h48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 15:13:22 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BOFDIZa50856440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Dec 2025 15:13:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71AE920043;
	Wed, 24 Dec 2025 15:13:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84FD120040;
	Wed, 24 Dec 2025 15:13:15 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.39.24.94])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Dec 2025 15:13:15 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        kernel test robot <lkp@intel.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Sachin Sant <sachinp@linux.ibm.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        kexec@lists.infradead.org
Subject: [PATCH] powerpc/kexec/core: use big-endian types for crash variables
Date: Wed, 24 Dec 2025 20:42:57 +0530
Message-ID: <20251224151257.28672-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=carfb3DM c=1 sm=1 tr=0 ts=694c0314 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=ccyOV0DOdZTP1wvw1oAA:9
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 3_cBvvd93GcmALHxSiuqFJLzGsM559X2
X-Proofpoint-GUID: WuLGOZmftnGP05-9QpadXhcWAUqtci9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzMCBTYWx0ZWRfX2TiUarZj27DR
 GisCUVA86TUjaq1QB4nA4fLm9UjmSH8J6wEpRjm7Awnrwg3Ueg5F/SyfqDx+G2947AtH1cMneR5
 4qQ7kllh17qL632PdmZ5V+V4S0E6PCO5SFLO3DRw+BYQ5/3JFjiyXe419Azn1aFKlbZ/InvMW/d
 zlHhsvxAJm2BC7K3R10gBwGczDjCQG+iedKMeEF2WdqlXeCX7pGMhP2vd90tKSFk23bumsXRG2Y
 qhJG/GvWQ7Yz6EVJ5DCKN7QEL2FPX0qke/PFTkzOj3MsnEL/0qHpih9e8alSDGkEJjd6CWkoqyg
 4yUBWU4689dVOvETD+HuycmANifQmT89wPSMMWcuES01X9GK5BmjPRsSXs70+y6E3lGQTWk7wzO
 nM/o/rlx214uroFDzHGFYGhcrVz/sFmGNxGrHVeHVeiV6h25ij8qwrVoAqc/9mi/zAkXcsuSB4C
 S/LO2RNO+BqDzTbaQGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512240130
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use explicit word-sized big-endian types for kexec and crash related
variables. This makes the endianness unambiguous and avoids type
mismatches that trigger sparse warnings.

The change addresses sparse warnings like below (seen on both 32-bit
and 64-bit builds):

CHECK   ../arch/powerpc/kexec/core.c
sparse:    expected unsigned int static [addressable] [toplevel] [usertype] crashk_base
sparse:    got restricted __be32 [usertype]
sparse: warning: incorrect type in assignment (different base types)
sparse:    expected unsigned int static [addressable] [toplevel] [usertype] crashk_size
sparse:    got restricted __be32 [usertype]
sparse: warning: incorrect type in assignment (different base types)
sparse:    expected unsigned long long static [addressable] [toplevel] mem_limit
sparse:    got restricted __be32 [usertype]
sparse: warning: incorrect type in assignment (different base types)
sparse:    expected unsigned int static [addressable] [toplevel] [usertype] kernel_end
sparse:    got restricted __be32 [usertype]

No functional change intended.

Fixes: ea961a828fe7 ("powerpc: Fix endian issues in kexec and crash dump code")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512221405.VHPKPjnp-lkp@intel.com/
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Sachin Sant <sachinp@linux.ibm.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: kexec@lists.infradead.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/core.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 104c05520bf0..dc44f11be353 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -23,6 +23,7 @@
 #include <asm/firmware.h>
 
 #define cpu_to_be_ulong __PASTE(cpu_to_be, BITS_PER_LONG)
+#define __be_word __PASTE(__be, BITS_PER_LONG)
 
 #ifdef CONFIG_CRASH_DUMP
 void machine_crash_shutdown(struct pt_regs *regs)
@@ -146,25 +147,25 @@ int __init overlaps_crashkernel(unsigned long start, unsigned long size)
 }
 
 /* Values we need to export to the second kernel via the device tree. */
-static phys_addr_t crashk_base;
-static phys_addr_t crashk_size;
-static unsigned long long mem_limit;
+static __be_word crashk_base;
+static __be_word crashk_size;
+static __be_word mem_limit;
 
 static struct property crashk_base_prop = {
 	.name = "linux,crashkernel-base",
-	.length = sizeof(phys_addr_t),
+	.length = sizeof(__be_word),
 	.value = &crashk_base
 };
 
 static struct property crashk_size_prop = {
 	.name = "linux,crashkernel-size",
-	.length = sizeof(phys_addr_t),
+	.length = sizeof(__be_word),
 	.value = &crashk_size,
 };
 
 static struct property memory_limit_prop = {
 	.name = "linux,memory-limit",
-	.length = sizeof(unsigned long long),
+	.length = sizeof(__be_word),
 	.value = &mem_limit,
 };
 
@@ -193,11 +194,11 @@ static void __init export_crashk_values(struct device_node *node)
 }
 #endif /* CONFIG_CRASH_RESERVE */
 
-static phys_addr_t kernel_end;
+static __be_word kernel_end;
 
 static struct property kernel_end_prop = {
 	.name = "linux,kernel-end",
-	.length = sizeof(phys_addr_t),
+	.length = sizeof(__be_word),
 	.value = &kernel_end,
 };
 
-- 
2.51.1


