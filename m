Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33FD7EAB84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 09:21:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FGNRcupu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STzm843Rwz3cSg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 19:21:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FGNRcupu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STzlG6XQdz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 19:20:57 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE8FdZV012881
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 08:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=rQRr08syZawfbDrV3ikgYwSb099FJ2VH9aPVMhSkIxU=;
 b=FGNRcupuobcG5PzRcNkpfp1MjM3zzVyfpHRCJXstRLFlJ0AzmTKfykDAy83fL9Ogyh6C
 2F9vWT3x+iIygCQY95NBzZx8ORvr1uqsERhJ725ztK5uA9RtutfxXK8dGQCpk4BhpTho
 kiZ8JFONrpAIvOj8MFQ4/DU3TzQkXEd7lMxWcLAGGGd1VNz+9EAquuE/+vInRgns7kJ3
 bfzSKGQaN1p7SNdpjZ8F5AxMFtxuVDRNj0E2OTUGPN0eSa2fmAilT3tS7kjqUYj0aAq0
 Tu3rS4JPTqPQk5Z/xElkzcFQ0G+gzRoaKUVYNDDSnqzIIBjA5g5CE59yb9IG4gOutGkp 4A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uc57hg4nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 08:20:53 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE8ItWS029428
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 08:20:52 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uakxsptfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 08:20:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AE8KoNl45089034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 08:20:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 188A52004B;
	Tue, 14 Nov 2023 08:20:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7058B2004D;
	Tue, 14 Nov 2023 08:20:49 +0000 (GMT)
Received: from li-5024144c-279b-11b2-a85c-93837c9a6aab.in.ibm.com (unknown [9.204.201.194])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Nov 2023 08:20:49 +0000 (GMT)
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Restrict ARCH_HIBERNATION_POSSIBLE to supported configurations
Date: Tue, 14 Nov 2023 13:50:46 +0530
Message-ID: <20231114082046.6018-1-vishalc@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xqVYwxSyyQo8ikfBctqEORfws3WQoIB0
X-Proofpoint-ORIG-GUID: xqVYwxSyyQo8ikfBctqEORfws3WQoIB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_07,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 mlxlogscore=562
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311140063
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
Cc: Vishal Chourasia <vishalc@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch modifies the ARCH_HIBERNATION_POSSIBLE option to ensure that it
correctly depends on these PowerPC configurations being enabled. As a result,
it prevents the HOTPLUG_CPU from being selected when the required dependencies
are not satisfied.

This change aligns the dependency tree with the expected hardware support for
CPU hot-plugging under PowerPC architectures, ensuring that the kernel
configuration steps do not lead to inconsistent states.

Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
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

 arch/powerpc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..bf99ff9869f6 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -380,8 +380,9 @@ config DEFAULT_UIMAGE
 	  Used to allow a board to specify it wants a uImage built by default
 
 config ARCH_HIBERNATION_POSSIBLE
-	bool
-	default y
+	def_bool y
+	depends on PPC_PSERIES || \
+		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
 
 config ARCH_SUSPEND_POSSIBLE
 	def_bool y
-- 
2.41.0

