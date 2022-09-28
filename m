Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FE5ED2A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 03:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcf7l41zpz3cCx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 11:30:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R8yxxvsi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R8yxxvsi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mcf750Fvfz2yMj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 11:29:51 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S0C8J4017335;
	Wed, 28 Sep 2022 01:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hb97wHgyrzwiBtfG26gTQ+gTcY3wX9qyjvtDNUel1FA=;
 b=R8yxxvsiCZxgE9tCOp5kO8G59HUrFCcBfRem6obsuyH2FYgxuXRrbGY5cBXC05xA/muc
 yUxeT1CPKjI18w91othsQLjuRpgSX/hAr1iRwGtFBcSi25UKwmf0x6g/K8vtuVvvtNvi
 a6m+Vq1oFY8jkbNUvbcx+4O5HjNwsT1EygJA2UtU9s46zrFpESjQfvqloGysn6nIh6Ik
 fS0aKKvHoZe1JFJRXrNamxUncj/G5iZr45Sn3W8PO/Mydu3XW1DK5MaYwFMEjTlI6WsW
 kIdmeqtNrehnS09l8f4BIm/UviNHNqNLRxCt3ZF+m0xt2Jj/pgQnNtnqcTZzsn3dlrNM 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jv8wpncgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 01:29:41 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28S1FXQe021543;
	Wed, 28 Sep 2022 01:29:41 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jv8wpncgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 01:29:41 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28S1KoNw025233;
	Wed, 28 Sep 2022 01:29:40 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma01dal.us.ibm.com with ESMTP id 3jsshae0e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 01:29:40 +0000
Received: from smtpav01.wdc07v.mail.ibm.com ([9.208.128.113])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28S1Tccs6292206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Sep 2022 01:29:39 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C34958063;
	Wed, 28 Sep 2022 01:29:38 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5195658059;
	Wed, 28 Sep 2022 01:29:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.36.35])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Sep 2022 01:29:37 +0000 (GMT)
Message-ID: <b9cd844b85eb8f70459109ce1b14e44c4cc85fa7.camel@linux.ibm.com>
Subject: [PATCH v3] powerpc: Ignore DSI error caused by the copy/paste
 instruction
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Date: Tue, 27 Sep 2022 18:29:27 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g38WUsjnZrm2Xnt_Lmpg9ZWBRpNdzIfb
X-Proofpoint-GUID: KtHZTWhMBKPmAndeAsHBQkTR1CjZzp-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_12,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280004
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The data storage interrupt (DSI) error will be generated when the
paste operation is issued on the suspended Nest Accelerator (NX)
window due to NX state changes. The hypervisor expects the
partition to ignore this error during page fault handling.
To differentiate DSI caused by an actual HW configuration or by
the NX window, a new “ibm,pi-features” type value is defined.
Byte 0, bit 3 of pi-attribute-specifier-type is now defined to
indicate this DSI error. If this error is not ignored, the user
space can get SIGBUS when the NX request is issued.

This patch adds changes to read ibm,pi-features property and ignore
DSI error during page fault handling if MMU_FTR_NX_DSI is defined.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
v2: Code cleanup as suggested by Christophe Leroy
v3: Make NX DSI as MMU feature instead of CPU feature 

 arch/powerpc/include/asm/mmu.h |  6 +++++-
 arch/powerpc/kernel/prom.c     | 36 ++++++++++++++++++++++++----------
 arch/powerpc/mm/fault.c        | 17 +++++++++++++++-
 3 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 860d0290ca4d..a0c10465b94a 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -120,6 +120,10 @@
  */
 #define MMU_FTR_1T_SEGMENT		ASM_CONST(0x40000000)
 
+/* NX paste RMA reject in DSI
+ */
+#define MMU_FTR_NX_DSI			ASM_CONST(0x80000000)
+
 /* MMU feature bit sets for various CPUs */
 #define MMU_FTRS_DEFAULT_HPTE_ARCH_V2	(MMU_FTR_HPTE_TABLE | MMU_FTR_TLBIEL | MMU_FTR_16M_PAGE)
 #define MMU_FTRS_POWER		MMU_FTRS_DEFAULT_HPTE_ARCH_V2
@@ -181,7 +185,7 @@ enum {
 #endif
 #ifdef CONFIG_PPC_RADIX_MMU
 		MMU_FTR_TYPE_RADIX |
-		MMU_FTR_GTSE |
+		MMU_FTR_GTSE | MMU_FTR_NX_DSI |
 #endif /* CONFIG_PPC_RADIX_MMU */
 #endif
 #ifdef CONFIG_PPC_KUAP
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index a730b951b64b..2e7a04dab2f7 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -137,7 +137,7 @@ static void __init move_device_tree(void)
 }
 
 /*
- * ibm,pa-features is a per-cpu property that contains a string of
+ * ibm,pa/pi-features is a per-cpu property that contains a string of
  * attribute descriptors, each of which has a 2 byte header plus up
  * to 254 bytes worth of processor attribute bits.  First header
  * byte specifies the number of bytes following the header.
@@ -149,15 +149,17 @@ static void __init move_device_tree(void)
  * is supported/not supported.  Note that the bit numbers are
  * big-endian to match the definition in PAPR.
  */
-static struct ibm_pa_feature {
+struct ibm_feature {
 	unsigned long	cpu_features;	/* CPU_FTR_xxx bit */
 	unsigned long	mmu_features;	/* MMU_FTR_xxx bit */
 	unsigned int	cpu_user_ftrs;	/* PPC_FEATURE_xxx bit */
 	unsigned int	cpu_user_ftrs2;	/* PPC_FEATURE2_xxx bit */
-	unsigned char	pabyte;		/* byte number in ibm,pa-features */
+	unsigned char	pabyte;		/* byte number in ibm,pa/pi-features */
 	unsigned char	pabit;		/* bit number (big-endian) */
 	unsigned char	invert;		/* if 1, pa bit set => clear feature */
-} ibm_pa_features[] __initdata = {
+};
+
+static struct ibm_feature ibm_pa_features[] __initdata = {
 	{ .pabyte = 0,  .pabit = 0, .cpu_user_ftrs = PPC_FEATURE_HAS_MMU },
 	{ .pabyte = 0,  .pabit = 1, .cpu_user_ftrs = PPC_FEATURE_HAS_FPU },
 	{ .pabyte = 0,  .pabit = 3, .cpu_features  = CPU_FTR_CTRL },
@@ -179,9 +181,19 @@ static struct ibm_pa_feature {
 	{ .pabyte = 64, .pabit = 0, .cpu_features = CPU_FTR_DAWR1 },
 };
 
+/*
+ * ibm,pi-features property provides the support of processor specific
+ * options not described in ibm,pa-features. Right now use byte 0, bit 3
+ * which indicates the occurrence of DSI interrupt when the paste operation
+ * on the suspended NX window.
+ */
+static struct ibm_feature ibm_pi_features[] __initdata = {
+	{ .pabyte = 0, .pabit = 3, .mmu_features  = MMU_FTR_NX_DSI },
+};
+
 static void __init scan_features(unsigned long node, const unsigned char *ftrs,
 				 unsigned long tablelen,
-				 struct ibm_pa_feature *fp,
+				 struct ibm_feature *fp,
 				 unsigned long ft_size)
 {
 	unsigned long i, len, bit;
@@ -218,17 +230,18 @@ static void __init scan_features(unsigned long node, const unsigned char *ftrs,
 	}
 }
 
-static void __init check_cpu_pa_features(unsigned long node)
+static void __init check_cpu_features(unsigned long node, char *name,
+				      struct ibm_feature *fp,
+				      unsigned long size)
 {
 	const unsigned char *pa_ftrs;
 	int tablelen;
 
-	pa_ftrs = of_get_flat_dt_prop(node, "ibm,pa-features", &tablelen);
+	pa_ftrs = of_get_flat_dt_prop(node, name, &tablelen);
 	if (pa_ftrs == NULL)
 		return;
 
-	scan_features(node, pa_ftrs, tablelen,
-		      ibm_pa_features, ARRAY_SIZE(ibm_pa_features));
+	scan_features(node, pa_ftrs, tablelen, fp, size);
 }
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
@@ -380,7 +393,10 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 			identify_cpu(0, be32_to_cpup(prop));
 
 		check_cpu_feature_properties(node);
-		check_cpu_pa_features(node);
+		check_cpu_features(node, "ibm,pa-features", ibm_pa_features,
+				   ARRAY_SIZE(ibm_pa_features));
+		check_cpu_features(node, "ibm,pi-features", ibm_pi_features,
+				   ARRAY_SIZE(ibm_pi_features));
 	}
 
 	identical_pvr_fixup(node);
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 014005428687..d3b7e34810f8 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -367,7 +367,22 @@ static void sanity_check_fault(bool is_write, bool is_user,
 #elif defined(CONFIG_PPC_8xx)
 #define page_fault_is_bad(__err)	((__err) & DSISR_NOEXEC_OR_G)
 #elif defined(CONFIG_PPC64)
-#define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
+static int page_fault_is_bad(unsigned long err)
+{
+	unsigned long flag = DSISR_BAD_FAULT_64S;
+
+	/*
+	 * PAPR 14.15.3.4.1
+	 * If byte 0, bit 3 of pi-attribute-specifier-type in
+	 * ibm,pi-features property is defined, ignore the DSI error
+	 * which is caused by the paste instruction on the
+	 * suspended NX window.
+	 */
+	if (mmu_has_feature(MMU_FTR_NX_DSI))
+		flag &= ~DSISR_BAD_COPYPASTE;
+
+	return (err & flag);
+}
 #else
 #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
 #endif
-- 
2.26.3


