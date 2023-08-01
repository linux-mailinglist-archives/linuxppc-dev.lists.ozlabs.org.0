Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86D76A806
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 06:50:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NUKd0AH5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFN2d2QJ1z3dJZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 14:50:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NUKd0AH5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFMwk0PGhz3cTW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 14:45:09 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3714hxRg032633;
	Tue, 1 Aug 2023 04:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NH+4QknNEzj/+b5YVq5nKHmN1jOTK/pCXLPwdOnI3V8=;
 b=NUKd0AH5V5MrWTkrKlc3nrd38eDCDeADsMJviFlLpYNQpuT5u0cff95DUxViTg1ZTWeC
 ErNQAyGHrA6aWUUe37Pz4syvYfMEQoWmlMnrbJOydh7vjrcN0aH1YbeTUGi0fAo7YBei
 jIEqJ7PDl2nRUcwnWWiQAANJOo/pmmpRBXyVZZTX1GrVC68ckrvJx+0cKPkcmpaev+dI
 YQxuBG8o47fwlrZ06hpoJdkce/LXUSuf8qByx0EfZXt6g+spLX5udHl97+8oGgHydekj
 L2SqicFGQGqt+/qnlkEbwK67NZ7g6jg/2seoCC5KiYpL3WkTvg+0nn6p/wkFmoREgmUB tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6tup0k0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:45:01 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3714j0Q3004709;
	Tue, 1 Aug 2023 04:45:00 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6tup0k0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:45:00 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3712wqjH006099;
	Tue, 1 Aug 2023 04:45:00 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5d3s998p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:45:00 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3714ixfH7406222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Aug 2023 04:44:59 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18D2C58055;
	Tue,  1 Aug 2023 04:44:59 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CA415804B;
	Tue,  1 Aug 2023 04:44:56 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Aug 2023 04:44:56 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v4 2/2] powerpc/mm: Add memory_block_size as a kernel parameter
Date: Tue,  1 Aug 2023 10:14:47 +0530
Message-ID: <20230801044447.11275-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801044447.11275-1-aneesh.kumar@linux.ibm.com>
References: <20230801044447.11275-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Re7-zOqV-TUzUSAbGbnQFFqPj74kazfF
X-Proofpoint-ORIG-GUID: 35RZ3Y503wsZsP3YNOHqWV8-A4oLUBgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_02,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010041
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
index d74d4a441616..fcda46c2b8df 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -566,13 +566,20 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
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

