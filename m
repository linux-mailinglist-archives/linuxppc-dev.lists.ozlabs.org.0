Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88F72639E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 17:03:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbrF41YsGz3dwm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:03:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lczxyoxM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lczxyoxM;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbrD62j1zz3ch2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 01:02:13 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357EstRh014523;
	Wed, 7 Jun 2023 15:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QHFsKtermEqUOeunh6cQubrEk/8KhCQsBXuDfcuMb7c=;
 b=lczxyoxMtPN9B4/LZ8qFl3zk5JTqDk2jG7U6OugTirdHT2ww08Ieu59nTppvlXqgz9Xx
 jplodQh7TwelC8O/NdaWnE25Iq3DI0d+rvTMpkDP3YAqnSBnaIM5F7qFy10idfKUgHAz
 zUEbJKdMGeLTyrEMhjHAV9JYyDgZOa542IrCcr2KQSurgY13rgTwYRRH9HNTOF53q27w
 VZ8T+9IQcmm/D1BXiI+sy30kYVQE2oKBKTaaV1ajhwlCl0Fl1GhU7XuxWkyeUrokNkyV
 /WS4DUQmLCkSu1spVFMm0avBx9iP8LF1tLS///cu8FF5FD8yezkxyocac7JKJAm7tZY+ Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2uww8fkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 15:02:03 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 357EixP8006671;
	Wed, 7 Jun 2023 15:02:03 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2uww8fke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 15:02:03 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 357CF396008319;
	Wed, 7 Jun 2023 15:02:02 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3r2a7845wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 15:02:02 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 357F21rP31916524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 15:02:01 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 744345806E;
	Wed,  7 Jun 2023 15:02:01 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDFFE5805A;
	Wed,  7 Jun 2023 15:01:58 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.4.27])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 15:01:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 2/2] powerpc/mm: Add memory_block_size as a kernel parameter
Date: Wed,  7 Jun 2023 20:31:50 +0530
Message-Id: <20230607150150.237788-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607150150.237788-1-aneesh.kumar@linux.ibm.com>
References: <20230607150150.237788-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cVwykL6aqM6kav66JwNv8UX-5nVfvydK
X-Proofpoint-ORIG-GUID: 0omZXrztGahKcb0-h3p1EVblR7L-XpWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_07,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070123
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
 arch/powerpc/kernel/setup_64.c                | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+)

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
index 246201d0d879..54ce748a340d 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -885,13 +885,40 @@ void __init setup_per_cpu_areas(void)
 #endif
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+static unsigned long set_mem_block_size;
 unsigned long memory_block_size_bytes(void)
 {
+	if (set_mem_block_size)
+		return set_mem_block_size;
+
 	if (ppc_md.memory_block_size)
 		return ppc_md.memory_block_size();
 
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
+	set_mem_block_size = 1UL << order;
+
+	return 0;
+}
+early_param("memory_block_size", parse_mem_block_size);
 #endif
 
 #if defined(CONFIG_PPC_INDIRECT_PIO) || defined(CONFIG_PPC_INDIRECT_MMIO)
-- 
2.40.1

