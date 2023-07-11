Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B129D74E60F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 06:50:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BG9+CEHK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0T2p4JqTz3c4X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BG9+CEHK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0T111MNZz302R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 14:49:08 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4cNCq016693;
	Tue, 11 Jul 2023 04:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AeSXwfsD9R/AsJzWBWx+hhyUJnbVc54scy/sJAAqljM=;
 b=BG9+CEHKYKnpiXRcdJMdYkMLdpfog0TGO9biKKeP0uRwaVDqeqR1dBE4/38XkbRhJPOE
 YyXx34WZ8+xgl/CkUYZ58IAgA9BJPlMopAw8CmiMIt+TYvI7w46uOd+4A1epxLSOppGB
 mxL7J8Npx3bS7MwGC913ZIeVwFFPNXYvxjD7Yvt5fQBX/FDO+yVuyL6DsU+DH7Jil8IH
 HqbFipAoi/RBg4RjG4H5o9QgSJYFbIu8UU+kBAzqe+U57XOx/vlT8Ecr6m/5JTrWyxC2
 JQBNhBTuoJPkVBCMQzvE3SHZmyhQDeN6Uff3FX3yR8rCwe2MYTfQv8T9lTrn25R6V6nU Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rryysgg53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:48:57 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B4d3dL019940;
	Tue, 11 Jul 2023 04:48:56 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rryysgg4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:48:56 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B1531v027311;
	Tue, 11 Jul 2023 04:48:55 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3rpye654tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 04:48:55 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B4msdG41812418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 04:48:54 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4860B5804B;
	Tue, 11 Jul 2023 04:48:54 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E18D58059;
	Tue, 11 Jul 2023 04:48:49 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.86.43])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 04:48:48 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 1/7] mm/hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
Date: Tue, 11 Jul 2023 10:18:27 +0530
Message-ID: <20230711044834.72809-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xFXDG9NbJf4RJi01_1mNrozQ1gBXyn7t
X-Proofpoint-ORIG-GUID: q9R3GYB00ZOcqzaUDUdfGuvVdo9VSWLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=731 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110040
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

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/arm64/Kconfig | 4 +---
 arch/x86/Kconfig   | 4 +---
 mm/Kconfig         | 3 +++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7856c3a3e35a..7e5985c018f8 100644
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
@@ -346,9 +347,6 @@ config GENERIC_CSUM
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
index 923bd35f81f2..932349271e28 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -572,6 +572,9 @@ config MHP_MEMMAP_ON_MEMORY
 
 endif # MEMORY_HOTPLUG
 
+config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
+       bool
+
 # Heavily threaded applications may benefit from splitting the mm-wide
 # page_table_lock, so that faults on different parts of the user address
 # space can be handled with less contention: split it at this NR_CPUS.
-- 
2.41.0

