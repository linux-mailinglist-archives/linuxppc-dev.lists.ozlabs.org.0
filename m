Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F623766AEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 12:41:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qV23wp1m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC41l0dKKz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 20:41:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qV23wp1m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC40G0FnGz3cT7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 20:40:13 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SAOa6M022794;
	Fri, 28 Jul 2023 10:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cbyyVJRZiJ1i7jXMce5JkSasPuiD77sGBtRrnq7PoNg=;
 b=qV23wp1mUmHl17dwET7XskixEM5NrSNr5leMuC9lbPUAhU+l1FHDKP/vJU3GW3DOaLkt
 ELfFPPyu3lE3w7d/A/WjOICBoawZJAw1q//Qm/kLvN92Zt2YRQZ12lxtbLIPRh5BKV+6
 sSA9P477PTtKmDy06PCvZZjtSySv5u9a0CsEErTxasgFDYDq9XawfDQTQBCnLmbyjsMY
 ZKku2o366VVOe6p6lIG9cvPOmzooPOI4ErrNkv/cBamXdMD4hObMVVqnv1g28j6pzLjm
 39I5Ihk4eQMV0sg04bAlOa3W4QtE/T0ZvJQCGVYexoITkL2KBDl17MWGVcdd+vzTLZ97 hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4bw18ffd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 10:40:06 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36SAQFp1028154;
	Fri, 28 Jul 2023 10:40:06 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4bw18fej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 10:40:05 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36SA0mJK002370;
	Fri, 28 Jul 2023 10:40:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txkn4nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 10:40:04 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36SAe3DZ1508020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jul 2023 10:40:03 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1A26580D4;
	Fri, 28 Jul 2023 10:36:06 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64FDF580CA;
	Fri, 28 Jul 2023 10:36:03 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.12.215])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 28 Jul 2023 10:36:02 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 2/2] powerpc/mm: Add memory_block_size as a kernel parameter
Date: Fri, 28 Jul 2023 16:05:56 +0530
Message-ID: <20230728103556.745681-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728103556.745681-1-aneesh.kumar@linux.ibm.com>
References: <20230728103556.745681-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WIEkResTjTaKXe5-Uv25g3Mzkb9Y8xXj
X-Proofpoint-ORIG-GUID: _0zYZmIAVjnMlU6GelIdn6t-PFg1rU1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280097
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, foraker1@llnl.gov, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Certain devices can possess non-standard memory capacities, not constrained
to multiples of 1GB. Provide a kernel parameter so that we can map the
device memory completely on memory hotplug.

Restrict memory_block_size value to a power of 2 value similar to LMB size.
The memory block size should also be more than the section size.

Reviewed-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../admin-guide/kernel-parameters.txt         |  3 +++
 arch/powerpc/kernel/setup_64.c                | 23 +++++++++++++++++++
 arch/powerpc/mm/init_64.c                     | 17 ++++++++++----
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a1457995fd41..4e49696e0976 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3201,6 +3201,9 @@
 			Note that even when enabled, there are a few cases where
 			the feature is not effective.
 
+	memory_block_size=size [PPC]
+			 Use this parameter to configure the memory block size value.
+
 	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV] Enable memtest
 			Format: <integer>
 			default : 0 <disable>
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 246201d0d879..cbdb924462c7 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -892,6 +892,29 @@ unsigned long memory_block_size_bytes(void)
 
 	return MIN_MEMORY_BLOCK_SIZE;
 }
+
+/*
+ * Restrict to a power of 2 value for memblock which is larger than
+ * section size
+ */
+static int __init parse_mem_block_size(char *ptr)
+{
+	unsigned int order;
+	unsigned long size = memparse(ptr, NULL);
+
+	order = fls64(size);
+	if (!order)
+		return 0;
+
+	order--;
+	if (order < SECTION_SIZE_BITS)
+		return 0;
+
+	memory_block_size = 1UL << order;
+
+	return 0;
+}
+early_param("memory_block_size", parse_mem_block_size);
 #endif
 
 #if defined(CONFIG_PPC_INDIRECT_PIO) || defined(CONFIG_PPC_INDIRECT_MMIO)
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 29178b3aafe6..dbed37d6cffb 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -569,13 +569,20 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
 	return 0;
 }
 
-/*
- * start with 1G memory block size. Early init will
- * fix this with correct value.
- */
-unsigned long memory_block_size __ro_after_init = 1UL << 30;
+unsigned long memory_block_size __ro_after_init;
 static void __init early_init_memory_block_size(void)
 {
+	/*
+	 * if it is set via early param just return.
+	 */
+	if (memory_block_size)
+		return;
+
+	/*
+	 * start with 1G memory block size. update_memory_block_size()
+	 * will derive the right value based on device tree details.
+	 */
+	memory_block_size = SZ_1G;
 	/*
 	 * We need to do memory_block_size probe early so that
 	 * radix__early_init_mmu() can use this as limit for
-- 
2.41.0

