Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A18728FAC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 08:10:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcrL72ddvz3fb2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 16:10:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LPxaBTaG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LPxaBTaG;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcrJG49Vfz3cdt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 16:09:18 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3595pGvv028120;
	Fri, 9 Jun 2023 06:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UUCfNiXCaS+WzWd5yKc9SuHScLa78eKoqsVXOXYx96k=;
 b=LPxaBTaGNQ7j8U4X1kyipPnSEbOHlltiK2yYdhOWgVe7HSrCz55IYsda4dhKPizvLKHe
 /vSFWIL565egkOKCMe2akGsWii0pv16l6fX7i3iekZDekKzad5EivMZw1TsT8tb2Euq0
 fC5dlgUJS9ucoxC3U6hP22WHZpZUD9NX9oMpaQHy/Qx2qHQGla/uRvMhEtchEeD95JMe
 1hQhN7h0ZZgnbrUFB2aUVVoMsWfm57n47aRoZPaxy0dv39ieWT1sBHP9KQMV3pcztKgL
 wuG4IVIkJrlDxqqBC4EzDZrMyDn5aNWuJ7M4ck5+co9asQ6iuLck9gB0ObKDF8Zc6qwi 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3xa30d39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 06:09:10 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3595s3Wo005481;
	Fri, 9 Jun 2023 06:09:10 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3xa30d2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 06:09:10 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35961F9r004580;
	Fri, 9 Jun 2023 06:09:09 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3r2a74caj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 06:09:09 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 359698r034800232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 06:09:08 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 474B358060;
	Fri,  9 Jun 2023 06:09:08 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA64A58051;
	Fri,  9 Jun 2023 06:09:05 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.55.247])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jun 2023 06:09:05 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 2/2] powerpc/mm: Add memory_block_size as a kernel parameter
Date: Fri,  9 Jun 2023 11:38:51 +0530
Message-Id: <20230609060851.329406-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
References: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q62fht0_zmBzLLxVrheco7iHK3labZjC
X-Proofpoint-ORIG-GUID: FBIrLh4bxgv4oApQaUrcg-PvYFp7SFtc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_03,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090052
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, foraker1@llnl.gov
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Certain devices can possess non-standard memory capacities, not constrained
to multiples of 1GB. Provide a kernel parameter so that we can map the
device memory completely on memory hotplug.

Restrict memory_block_size value to a power of 2 value similar to LMB size.
The memory block size should also be more than the section size.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../admin-guide/kernel-parameters.txt         |  3 +++
 arch/powerpc/kernel/setup_64.c                | 23 +++++++++++++++++++
 arch/powerpc/mm/init_64.c                     | 17 ++++++++++----
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9e5bab29685f..833b8c5b4b4c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3190,6 +3190,9 @@
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
index 97a9163f1280..5e6dde593ea3 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -549,13 +549,20 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
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
+	memory_block_size = 1UL << 30;
 	/*
 	 * We need to do memory_block_size probe early so that
 	 * radix__early_init_mmu() can use this as limit for
-- 
2.40.1

