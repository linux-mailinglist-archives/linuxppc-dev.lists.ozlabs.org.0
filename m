Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9F2564DD5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 08:42:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lbx7Z3tP2z3bsr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 16:42:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q+RHPfdv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q+RHPfdv;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lbx6v6xzcz2x9v
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 16:41:59 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2646GRdo019337;
	Mon, 4 Jul 2022 06:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=I5EXbKb38ZXBB0N3z9chbigvZr8HTBSxyVhD3AUDyoc=;
 b=Q+RHPfdvvPq3FgV/HLAUWDv5enIyv2mxPmTea8ubeWnzqYUL3F40HQFfcqJ86GWjN+mf
 vQqTsdUgz0QStVOuHy+bSnuf2emB6tsv8dKVIng5HmQCKUptwgFXi048EaRz5r9LrvhY
 00pnscttRKn99bAvx0P806d93TMayw+yh0QREtneKJteoYEmWk/6LO2TzIxJM/6Zcypz
 hmw0twJukf+xwIctzWZcqNan0QasOYh7wX+18FvL3dJJttjTlH8aHr5fmq8brGVyLdhC
 ngwCOldnHyi53KFPRBqW3bN4ZPK570TwdgNKvtKF3TlUlRflcqN64shFyGSVs4HnwIzJ 4w== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h3tsmgf9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 06:41:52 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2646KT1Z020182;
	Mon, 4 Jul 2022 06:41:52 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma04dal.us.ibm.com with ESMTP id 3h2dn9h3xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 06:41:52 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2646fpYl23724502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Jul 2022 06:41:51 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E8B56A04F;
	Mon,  4 Jul 2022 06:41:51 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FA196A047;
	Mon,  4 Jul 2022 06:41:48 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.74.198])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  4 Jul 2022 06:41:47 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2] mm/add_pages: Move Kconfig variable to mm/Kconfig
Date: Mon,  4 Jul 2022 12:11:42 +0530
Message-Id: <20220704064142.296830-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6jt5jq-_Z8T-JmX_8gVeIwLM0AtN2qcc
X-Proofpoint-ORIG-GUID: 6jt5jq-_Z8T-JmX_8gVeIwLM0AtN2qcc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_05,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 mlxlogscore=883
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207040027
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
Cc: Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No functional change in this patch. This was done so that
the previous change (commit ac790d09885d ("powerpc/memhotplug:
Add add_pages override for PPC")) can be easily backported.

Cc: Michal Hocko <mhocko@suse.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/Kconfig | 5 +----
 arch/x86/Kconfig     | 5 +----
 mm/Kconfig           | 3 +++
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7aa12e88c580..20c1f8e26c96 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -112,6 +112,7 @@ config PPC
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
+	select ARCH_HAS_ADD_PAGES		if ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_HAS_COPY_MC			if PPC64
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
@@ -358,10 +359,6 @@ config ARCH_SUSPEND_NONZERO_CPU
 	def_bool y
 	depends on PPC_POWERNV || PPC_PSERIES
 
-config ARCH_HAS_ADD_PAGES
-	def_bool y
-	depends on ARCH_ENABLE_MEMORY_HOTPLUG
-
 config PPC_DCR_NATIVE
 	bool
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index be0b95e51df6..151ddb96ae46 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -68,6 +68,7 @@ config X86
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if (PGTABLE_LEVELS > 2) && (X86_64 || X86_PAE)
 	select ARCH_ENABLE_THP_MIGRATION if X86_64 && TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
+	select ARCH_HAS_ADD_PAGES		if ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
@@ -2453,10 +2454,6 @@ source "kernel/livepatch/Kconfig"
 
 endmenu
 
-config ARCH_HAS_ADD_PAGES
-	def_bool y
-	depends on ARCH_ENABLE_MEMORY_HOTPLUG
-
 config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	def_bool y
 
diff --git a/mm/Kconfig b/mm/Kconfig
index 169e64192e48..af4e3f9a3019 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -475,6 +475,9 @@ config EXCLUSIVE_SYSTEM_RAM
 config HAVE_BOOTMEM_INFO_NODE
 	def_bool n
 
+config ARCH_HAS_ADD_PAGES
+	bool
+
 config ARCH_ENABLE_MEMORY_HOTPLUG
 	bool
 
-- 
2.36.1

