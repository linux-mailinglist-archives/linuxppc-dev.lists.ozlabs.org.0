Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FA95E95DE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Sep 2022 22:27:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbHWd0dYXz3c41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 06:27:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TPfmgqqG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TPfmgqqG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbHVt1lXyz2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 06:27:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28PF76Fv020535;
	Sun, 25 Sep 2022 20:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=L6pqRqD5sd4jarl1FA5Jk4Txr1vX8NXKRT3cDd1MDYc=;
 b=TPfmgqqG7zlgbwyWG9w26cv4SAKVmNABjlimbB41gRC0Q2Gs342epfYNjRVieuyzX8UL
 9cXyc3GM8KNaSRXhveqWqGMCs2kZcfDaapN+vYvwlSh2ALA+cEVAzawx2Jyy1gH63Wxl
 gT63Pkqa9AVzMm6Eb2sdQaDRydrX7zdl7JZvazFxZR/d6Z7ZzC23yAzg2272bCL09NJu
 K++xufpPRk5T/qgFyBgwHj4iGw8YJP3uj9yMNXVAX9SChYOkrmRVNREtapAc2f8ARUb+
 tjmTo4K7BdzS06xgizYXrFo5PPecWgmDRlZRHH9UGKxYVhdrk17BFPp7ZuAwIlVIzLO/ qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtb6ttc6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Sep 2022 20:27:06 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28PKR5j0027807;
	Sun, 25 Sep 2022 20:27:05 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtb6ttc6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Sep 2022 20:27:05 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28PKKdLw004236;
	Sun, 25 Sep 2022 20:27:04 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma01dal.us.ibm.com with ESMTP id 3jssh9v19h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Sep 2022 20:27:04 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28PKR2HW45482332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 25 Sep 2022 20:27:03 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB66E5805A;
	Sun, 25 Sep 2022 20:27:02 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76F7158054;
	Sun, 25 Sep 2022 20:27:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.36.35])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 25 Sep 2022 20:27:01 +0000 (GMT)
Message-ID: <12b8c238593b835837dbb8ce664c50dcaf9ecb3d.camel@linux.ibm.com>
Subject: [PATCH v2] powerpc: Ignore DSI error caused by the copy/paste
 instruction
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Date: Sun, 25 Sep 2022 13:26:51 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0xvBq68bx8_FDL0_y-FFxdTt4pZI-J-Z
X-Proofpoint-GUID: aqI_Z3Fdg_i9uuRsLN_sk7E5CqkPnMOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-25_01,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209250146
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


DSI error will be generated when the paste operation is issued on
the suspended NX window due to NX state changes. The hypervisor
expects the partition to ignore this error during page pault
handling. To differentiate DSI caused by an actual HW configuration
or by the NX window, a new “ibm,pi-features” type value is defined.
Byte 0, bit 3 of pi-attribute-specifier-type is now defined to
indicate this DSI error. If this error is not ignored, the user
space can get SIGBUS when the NX request is issued.

This patch adds changes to read ibm,pi-features property and ignore
DSI error in the page fault handling if CPU_FTR_NX_DSI if defined.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
v2: Code cleanup as suggested by Christophe Leroy 

 arch/powerpc/include/asm/cputable.h |  5 ++--
 arch/powerpc/kernel/prom.c          | 36 +++++++++++++++++++++--------
 arch/powerpc/mm/fault.c             | 17 +++++++++++++-
 3 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index ae8c3e13cfce..8dc9949b6365 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -192,6 +192,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
 #define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
 #define CPU_FTR_DAWR1			LONG_ASM_CONST(0x0008000000000000)
+#define CPU_FTR_NX_DSI			LONG_ASM_CONST(0x0010000000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -429,7 +430,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
 	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_P9_TLBIE_STQ_BUG | \
-	    CPU_FTR_P9_TLBIE_ERAT_BUG | CPU_FTR_P9_TIDR)
+	    CPU_FTR_P9_TLBIE_ERAT_BUG | CPU_FTR_P9_TIDR | CPU_FTR_NX_DSI)
 #define CPU_FTRS_POWER9_DD2_0 (CPU_FTRS_POWER9 | CPU_FTR_P9_RADIX_PREFETCH_BUG)
 #define CPU_FTRS_POWER9_DD2_1 (CPU_FTRS_POWER9 | \
 			       CPU_FTR_P9_RADIX_PREFETCH_BUG | \
@@ -451,7 +452,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
 	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
-	    CPU_FTR_DAWR | CPU_FTR_DAWR1)
+	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | CPU_FTR_NX_DSI)
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
 	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index a730b951b64b..19047c582e9f 100644
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
+	{ .pabyte = 0, .pabit = 3, .cpu_features  = CPU_FTR_NX_DSI },
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
index 014005428687..cb949f12baa9 100644
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
+	if (cpu_has_feature(CPU_FTR_NX_DSI))
+		flag &= ~DSISR_BAD_COPYPASTE;
+
+	return (err & flag);
+}
 #else
 #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
 #endif
-- 
2.26.3


