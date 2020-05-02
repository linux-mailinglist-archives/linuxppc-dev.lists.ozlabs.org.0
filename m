Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ABF1C24BA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:28:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Dn0y3hDxzDrBf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:28:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DmjK443gzDr3D
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:14:29 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 042B23Jq054674; Sat, 2 May 2020 07:14:24 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s5qgad5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:14:23 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 042BApdU006167;
 Sat, 2 May 2020 11:14:23 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 30s0g5javh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 11:14:23 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 042BEM0813763462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 2 May 2020 11:14:22 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C28E92805C;
 Sat,  2 May 2020 11:14:22 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E802D28058;
 Sat,  2 May 2020 11:14:20 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.206])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  2 May 2020 11:14:20 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 07/12] powerpc/book3s64/pkeys: kill cpu feature key
 CPU_FTR_PKEY
Date: Sat,  2 May 2020 16:43:42 +0530
Message-Id: <20200502111347.541836-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502111347.541836-1-aneesh.kumar@linux.ibm.com>
References: <20200502111347.541836-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-02_06:2020-05-01,
 2020-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=2 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005020095
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We don't use CPU_FTR_PKEY anymore. Remove the feature bit and mark it
free.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/cputable.h | 10 +++++-----
 arch/powerpc/kernel/dt_cpu_ftrs.c   |  6 ------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 40a4d3c6fd99..b77f8258ee8c 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -198,7 +198,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_STCX_CHECKS_ADDRESS	LONG_ASM_CONST(0x0000000080000000)
 #define CPU_FTR_POPCNTB			LONG_ASM_CONST(0x0000000100000000)
 #define CPU_FTR_POPCNTD			LONG_ASM_CONST(0x0000000200000000)
-#define CPU_FTR_PKEY			LONG_ASM_CONST(0x0000000400000000)
+/* LONG_ASM_CONST(0x0000000400000000) Free */
 #define CPU_FTR_VMX_COPY		LONG_ASM_CONST(0x0000000800000000)
 #define CPU_FTR_TM			LONG_ASM_CONST(0x0000001000000000)
 #define CPU_FTR_CFAR			LONG_ASM_CONST(0x0000002000000000)
@@ -437,7 +437,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_DSCR | CPU_FTR_SAO  | CPU_FTR_ASYM_SMT | \
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | \
-	    CPU_FTR_VMX_COPY | CPU_FTR_HAS_PPR | CPU_FTR_DABRX | CPU_FTR_PKEY)
+	    CPU_FTR_VMX_COPY | CPU_FTR_HAS_PPR | CPU_FTR_DABRX )
 #define CPU_FTRS_POWER8 (CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | CPU_FTR_ARCH_206 |\
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
@@ -447,7 +447,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_DAWR | \
-	    CPU_FTR_ARCH_207S | CPU_FTR_TM_COMP | CPU_FTR_PKEY)
+	    CPU_FTR_ARCH_207S | CPU_FTR_TM_COMP )
 #define CPU_FTRS_POWER8E (CPU_FTRS_POWER8 | CPU_FTR_PMAO_BUG)
 #define CPU_FTRS_POWER9 (CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | CPU_FTR_ARCH_206 |\
@@ -458,8 +458,8 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
-	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_PKEY | \
-	    CPU_FTR_P9_TLBIE_STQ_BUG | CPU_FTR_P9_TLBIE_ERAT_BUG | CPU_FTR_P9_TIDR)
+	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_P9_TLBIE_STQ_BUG | \
+	    CPU_FTR_P9_TLBIE_ERAT_BUG | CPU_FTR_P9_TIDR)
 #define CPU_FTRS_POWER9_DD2_0 (CPU_FTRS_POWER9 | CPU_FTR_P9_RADIX_PREFETCH_BUG)
 #define CPU_FTRS_POWER9_DD2_1 (CPU_FTRS_POWER9 | \
 			       CPU_FTR_P9_RADIX_PREFETCH_BUG | \
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 36bc0d5c4f3a..120ea339ffda 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -747,12 +747,6 @@ static __init void cpufeatures_cpu_quirks(void)
 	}
 
 	update_tlbie_feature_flag(version);
-	/*
-	 * PKEY was not in the initial base or feature node
-	 * specification, but it should become optional in the next
-	 * cpu feature version sequence.
-	 */
-	cur_cpu_spec->cpu_features |= CPU_FTR_PKEY;
 }
 
 static void __init cpufeatures_setup_finished(void)
-- 
2.26.2

