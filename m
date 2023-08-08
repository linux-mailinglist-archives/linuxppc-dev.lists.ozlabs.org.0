Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5999B773946
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 11:17:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FSVpmLm8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKndG0pkQz2ytN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 19:17:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FSVpmLm8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKnbL5dBQz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 19:15:26 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3789CfTG027798;
	Tue, 8 Aug 2023 09:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eUj6SooswbSssTf+siMtVhIFc1VnmxrknO53WAz9LiQ=;
 b=FSVpmLm88psbwBxEkchsyrYGar+d63DnsZlplFqfEZSSlyXJR+VvLL7BkGSfgs7ETvRs
 X5GQjEPg9BIXXxteWCl7wl6+FYBWpi4fpzo5lkreSEupOcvgskSKZOUDB4DqXF0IpDLP
 pGgVMJK6/31UmwjTsGEPceLPslvA4mGvVUXY2YaSLS64e728CBdI+oV0BTBIGwCTDvCX
 4NUWGUGHVrGNb8vvOK+bZboSSRcmgN7jWBJs/Q78uPc/MF7yTPnxMv9kUZxhligCuRE1
 WHsLx3j66RKnsKLG57PHcUn3CXWYOzXoP4vfbojQuke0cD9646nG5hlWv6hMYtBMQLkm JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sbjn8097c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 09:15:14 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3789Ckpx028080;
	Tue, 8 Aug 2023 09:15:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sbjn80970-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 09:15:14 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3788qZbM030348;
	Tue, 8 Aug 2023 09:15:13 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sa1rn55h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 09:15:13 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3789FCU531261268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Aug 2023 09:15:12 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A005C5803F;
	Tue,  8 Aug 2023 09:15:12 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BC4158064;
	Tue,  8 Aug 2023 09:15:09 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Aug 2023 09:15:09 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v8 1/6] mm/memory_hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
Date: Tue,  8 Aug 2023 14:44:56 +0530
Message-ID: <20230808091501.287660-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230808091501.287660-1-aneesh.kumar@linux.ibm.com>
References: <20230808091501.287660-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Kyb7Rlef4fcADFibeT6fdG9PIy1iyosr
X-Proofpoint-ORIG-GUID: UqjyfyjD34Vu2EQE4peVTv_qhBP4oDXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_07,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=674 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308080081
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of adding menu entry with all supported architectures, add
mm/Kconfig variable and select the same from supported architectures.

No functional change in this patch.

Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/arm64/Kconfig | 4 +---
 arch/x86/Kconfig   | 4 +---
 mm/Kconfig         | 3 +++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b1573257a4d6..0f749cfab8e6 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -78,6 +78,7 @@ config ARM64
 	select ARCH_INLINE_SPIN_UNLOCK_IRQ if !PREEMPTION
 	select ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE if !PREEMPTION
 	select ARCH_KEEP_MEMBLOCK
+	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_GNU_PROPERTY
 	select ARCH_USE_MEMTEST
@@ -347,9 +348,6 @@ config GENERIC_CSUM
 config GENERIC_CALIBRATE_DELAY
 	def_bool y
 
-config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
-	def_bool y
-
 config SMP
 	def_bool y
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 78224aa76409..d0258e92a8af 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -102,6 +102,7 @@ config X86
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
@@ -2610,9 +2611,6 @@ config ARCH_HAS_ADD_PAGES
 	def_bool y
 	depends on ARCH_ENABLE_MEMORY_HOTPLUG
 
-config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
-	def_bool y
-
 menu "Power management and ACPI options"
 
 config ARCH_HIBERNATION_HEADER
diff --git a/mm/Kconfig b/mm/Kconfig
index 5fe49c030961..721dc88423c7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -571,6 +571,9 @@ config MHP_MEMMAP_ON_MEMORY
 
 endif # MEMORY_HOTPLUG
 
+config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
+       bool
+
 # Heavily threaded applications may benefit from splitting the mm-wide
 # page_table_lock, so that faults on different parts of the user address
 # space can be handled with less contention: split it at this NR_CPUS.
-- 
2.41.0

