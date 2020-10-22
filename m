Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 748622956E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 05:43:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGtVY4v3zzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 14:43:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fQcKe3g6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGtSH2TTwzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 14:41:02 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09M3Yuiu036529; Wed, 21 Oct 2020 23:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+SkyMBgKZULR7t7puyd9b7zygxgqhSYtB8peeFtI4u4=;
 b=fQcKe3g6q4vUUzkG0ztqrwHT8nGurY222XCB5R/iq6LsJd4OXkmjgmDu81Tga8lt8dc5
 y82Q48BZuTi37wyIlnuwWVzZyy8gyQ60ZmHVYmCxE3A42MBMnEgSXT98nKwR5VrcnOil
 JNUDBVKvtsDhvRNlto6rlSmmJwobhTK905KbcOoE7MP2qS0qe1BNU/FwRKf4rXp9cVXX
 Pqm4IEr/+fhShqmjvSI8ECPpocqPgkfqZKQt9ali+7jRHGqUKGHbFHOlM/ULcfQ9w3JN
 8UII85ZpuS8bBBHMLN+iKWlu8g3cTdT1GD5y7J2q6y+49WKHgUwrHHahRFFImxV6/Ko1 lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b0n9j6hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 23:40:53 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09M3ZJHj038018;
 Wed, 21 Oct 2020 23:40:53 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34b0n9j6hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 23:40:53 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09M3UxQn020068;
 Thu, 22 Oct 2020 03:40:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 347r88cy7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Oct 2020 03:40:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09M3emRi30474746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 03:40:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 944D842047;
 Thu, 22 Oct 2020 03:40:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13EDA42045;
 Thu, 22 Oct 2020 03:40:46 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.32.208])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Oct 2020 03:40:45 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/2] powerpc: Introduce POWER10_DD1 feature
Date: Thu, 22 Oct 2020 09:10:38 +0530
Message-Id: <20201022034039.330365-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-22_01:2020-10-20,
 2020-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=1 mlxscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220019
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, mikey@linux.ibm.com,
 jniethe5@gmail.com, npiggin@gmail.com, maddy@linux.ibm.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER10_DD1 feature flag will be needed while adding
conditional code that applies only for Power10 DD1.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/cputable.h | 8 ++++++--
 arch/powerpc/kernel/dt_cpu_ftrs.c   | 3 +++
 arch/powerpc/kernel/prom.c          | 9 +++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 93bc70d4c9a1..d486f56c0d33 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -216,6 +216,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
 #define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
 #define CPU_FTR_DAWR1			LONG_ASM_CONST(0x0008000000000000)
+#define CPU_FTR_POWER10_DD1		LONG_ASM_CONST(0x0010000000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -479,6 +480,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
 	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
 	    CPU_FTR_DAWR | CPU_FTR_DAWR1)
+#define CPU_FTRS_POWER10_DD1	(CPU_FTRS_POWER10 | CPU_FTR_POWER10_DD1)
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
 	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
@@ -497,14 +499,16 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_POSSIBLE	\
 	    (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
 	     CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
-	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
+	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
+	     CPU_FTRS_POWER10_DD1)
 #else
 #define CPU_FTRS_POSSIBLE	\
 	    (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
 	     CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
 	     CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
 	     CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
-	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
+	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
+	     CPU_FTRS_POWER10_DD1)
 #endif /* CONFIG_CPU_LITTLE_ENDIAN */
 #endif
 #else
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 1098863e17ee..b2327f2967ff 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -811,6 +811,9 @@ static __init void cpufeatures_cpu_quirks(void)
 	}
 
 	update_tlbie_feature_flag(version);
+
+	if ((version & 0xffffffff) == 0x00800100)
+		cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
 }
 
 static void __init cpufeatures_setup_finished(void)
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index c1545f22c077..c778c81284f7 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -305,6 +305,14 @@ static void __init check_cpu_feature_properties(unsigned long node)
 	}
 }
 
+static void __init fixup_cpu_features(void)
+{
+	unsigned long version = mfspr(SPRN_PVR);
+
+	if ((version & 0xffffffff) == 0x00800100)
+		cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
+}
+
 static int __init early_init_dt_scan_cpus(unsigned long node,
 					  const char *uname, int depth,
 					  void *data)
@@ -378,6 +386,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 
 		check_cpu_feature_properties(node);
 		check_cpu_pa_features(node);
+		fixup_cpu_features();
 	}
 
 	identical_pvr_fixup(node);
-- 
2.25.1

