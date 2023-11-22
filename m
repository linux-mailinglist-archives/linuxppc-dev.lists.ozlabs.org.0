Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA57F4184
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 10:24:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rjAlM0cq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZwmg54sRz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 20:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rjAlM0cq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZwll2s26z3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 20:23:30 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM8LVuj012268;
	Wed, 22 Nov 2023 09:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ROG0wI0WojKzUnTlfdND97LgzDyc9TcDD/ItBZxcNKU=;
 b=rjAlM0cqSYNeSh4kkmr36O+a/ZfgtXkm5ZkkNOAppVFijKsYspvQANc1FAdhgqtCzBLo
 Tjqxd99+SX7fEW4XxRXPvfv6uu3K0zQcIdzf9iTeZzJcxG+2Ik3yed2gqXMGSs7fgFIo
 XzJMKC5du30zCtCB/0aDqMwu4ffDmKwdGpGL5LognoqXNHIlvNP18cb9nkcMQ0o9BAqr
 oy229TYLdlWjttnTHtcZytYU5vJTvSSf0AsHuyK6XuuzJE43uZLYdNhVugmLryy2f/qG
 NrG/qjK2CyVxd/+VlaeJaZF5sEVye7wUxRn1kKO48/EoC3KKy/Mt8b/X9tP+wspsQ01y uQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uhcpnwaju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:23:24 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM7Ae8P013265;
	Wed, 22 Nov 2023 09:23:23 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uf7kt75hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:23:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AM9NK6j44696082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Nov 2023 09:23:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 908222004B;
	Wed, 22 Nov 2023 09:23:20 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2017320040;
	Wed, 22 Nov 2023 09:23:19 +0000 (GMT)
Received: from li-5024144c-279b-11b2-a85c-93837c9a6aab.ibm.com.com (unknown [9.171.5.81])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Nov 2023 09:23:18 +0000 (GMT)
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Adjust config HOTPLUG_CPU dependency
Date: Wed, 22 Nov 2023 14:53:03 +0530
Message-ID: <20231122092303.223719-1-vishalc@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s1eAmRi-3m4n1gxbJFbs4uLaLLmwYdSG
X-Proofpoint-ORIG-GUID: s1eAmRi-3m4n1gxbJFbs4uLaLLmwYdSG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=844 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220065
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
Cc: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, Vishal Chourasia <vishalc@linux.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changed HOTPLUG_CPU dependency to SMP and either ARCH_HIBERNATION_POSSIBLE or
ARCH_SUSPEND_POSSIBLE, aligning with systems' suspend/hibernation capabilities.
This update links CPU hotplugging more logically with platforms' capabilities.

Other changes include

1. configs ARCH_HIBERNATION_POSSIBLE and ARCH_SUSPEND_POSSIBLE are now selected
   only if required platform dependencies are met.

2. Defaults for configs ARCH_HIBERNATION_POSSIBLE and
   ARCH_SUSPEND_POSSIBLE has been set to 'N'

Reported-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Suggested-by: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>

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

 arch/powerpc/Kconfig | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..6e7e9af2f0c1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -155,6 +155,8 @@ config PPC
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HIBERNATION_POSSIBLE        if (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
+	select ARCH_SUSPEND_POSSIBLE            if (ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES || 44x || 40x)
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
@@ -380,14 +382,10 @@ config DEFAULT_UIMAGE
 	  Used to allow a board to specify it wants a uImage built by default
 
 config ARCH_HIBERNATION_POSSIBLE
-	bool
-	default y
+	def_bool n
 
 config ARCH_SUSPEND_POSSIBLE
-	def_bool y
-	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
-		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
-		   || 44x || 40x
+	def_bool n
 
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

