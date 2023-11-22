Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBF7F434C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 11:11:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=efnYwJzx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZxqM18yFz3dKS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 21:11:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=efnYwJzx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZxpW44Skz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 21:10:59 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMA3F5g012441;
	Wed, 22 Nov 2023 10:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=CZH0Y2l2kcmMioa5Fn1muIC56ZAiCvzpplFTMxpL3A8=;
 b=efnYwJzxyFBjpymheoz+AqR0olP86lSt249sOK38ZFCYnR/VFD2AtIAQvdI9V4sSE5mB
 +wP2qL68q64lXHcnx7smLe7ZX3q+u0UYfphCcRvqDZouhCwkOJVSSq6goBqKYHMpN54J
 JUGwQW+UmmeMHstBi4vi+Hr99r8b3tf5mK+8Kl1KZZMt+PaNAhgOwr0PP52ob4UDGTE5
 m3/jut0Oyn0iUokF2StHkXvzuG+KFT93/B7vCiAS9slJ/LCE2ARRC6gwBGyGtcWgsIs5
 RWQqnoYm3nmWaErEbd+zJmeoEAq88yCAw0S6ewakusLHnJBwScmZ36qNTHjQnRulC/zd GQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uhfj287bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 10:10:49 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMA42Uq017020;
	Wed, 22 Nov 2023 10:10:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uf9tkers4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 10:10:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AMAAjvD41747046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Nov 2023 10:10:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B301B20083;
	Wed, 22 Nov 2023 10:10:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05BC020084;
	Wed, 22 Nov 2023 10:10:44 +0000 (GMT)
Received: from li-5024144c-279b-11b2-a85c-93837c9a6aab.ibm.com.com (unknown [9.171.5.81])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Nov 2023 10:10:43 +0000 (GMT)
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: aneesh.kumar@kernel.org
Subject: [PATCH v3] powerpc: Adjust config HOTPLUG_CPU dependency
Date: Wed, 22 Nov 2023 15:40:40 +0530
Message-ID: <20231122101040.231850-1-vishalc@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <3fe72686-5b89-41e4-b760-d6353b426d81@kernel.org>
References: <3fe72686-5b89-41e4-b760-d6353b426d81@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l2w6voIUxdVRcD407n1AS6ebWlu7mBOK
X-Proofpoint-ORIG-GUID: l2w6voIUxdVRcD407n1AS6ebWlu7mBOK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220071
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
Cc: aneesh.kumar@linux.ibm.com, vishalc@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changed HOTPLUG_CPU dependency to SMP and either ARCH_HIBERNATION_POSSIBLE or
ARCH_SUSPEND_POSSIBLE, aligning with systems' suspend/hibernation capabilities.
This update link CPU hotplugging more logically with platforms' capabilities.

configs ARCH_HIBERNATION_POSSIBLE and ARCH_SUSPEND_POSSIBLE are now selected
only if required platform dependencies are met.

Reported-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Suggested-by: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>

v2: https://lore.kernel.org/all/20231122092303.223719-1-vishalc@linux.ibm.com
v1: https://lore.kernel.org/all/20231114082046.6018-1-vishalc@linux.ibm.com
---
During the configuration process with 'make randconfig' followed by
'make olddefconfig', we observed a warning indicating an unmet direct
dependency for the HOTPLUG_CPU option. The dependency in question relates to
various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
erroneously selected due to an implicit assumption by the PM_SLEEP_SMP option.
This misalignment in dependencies could potentially lead to inconsistent kernel
configuration states, especially when considering the necessary hardware
support for CPU hot-plugging on PowerPC platforms. The patch aims to correct
this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon the
appropriate PowerPC configurations being active.

steps to reproduce (before applying the patch):

Run 'make pseries_le_defconfig'
Run 'make menuconfig'
Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to disk') ] 
Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platform support ]
Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSeries ]
Enable SMP [ Processor support -> Symmetric multi-processing support ]
Save the config
Run 'make olddefconfig'

 arch/powerpc/Kconfig | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..87c8134da3da 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -156,6 +156,7 @@ config PPC
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+	select ARCH_HIBERNATION_POSSIBLE        if (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
@@ -166,6 +167,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx || 40x
+	select ARCH_SUSPEND_POSSIBLE            if (ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES || 44x || 40x)
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
@@ -381,13 +383,9 @@ config DEFAULT_UIMAGE
 
 config ARCH_HIBERNATION_POSSIBLE
 	bool
-	default y
 
 config ARCH_SUSPEND_POSSIBLE
-	def_bool y
-	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
-		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
-		   || 44x || 40x
+	bool
 
 config ARCH_SUSPEND_NONZERO_CPU
 	def_bool y
@@ -568,8 +566,7 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 
 config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
-	depends on SMP && (PPC_PSERIES || \
-		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
+	depends on SMP && (ARCH_HIBERNATION_POSSIBLE || ARCH_SUSPEND_POSSIBLE)
 	help
 	  Say Y here to be able to disable and re-enable individual
 	  CPUs at runtime on SMP machines.
-- 
2.41.0

