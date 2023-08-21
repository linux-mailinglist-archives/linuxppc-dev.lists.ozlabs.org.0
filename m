Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD9C782308
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 07:01:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IqGaY6jk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTgLC2KvJz3c1q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 15:01:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IqGaY6jk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTgKK0fGfz2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 15:00:36 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37L4nlYA013435;
	Mon, 21 Aug 2023 04:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=3BP7bDeODG6UVTGjz19TNhnESUfJJakLyBzNwkErhc8=;
 b=IqGaY6jk3rI2zjjjSUYhdXs7kfhyPSOR5+VNJ34Zhwr4eA3w2wpb1wOgKwo7ROV/04CX
 skOwYQJpN/TvfiwkWtx06Wi0OpveOMHg/vZqBGkI4SGbkpHHOA7lOaow5TNsGamgIIFr
 znK3awQlNEpN0r5EC4bhQfQh0p2ByzhcAPjqA9v9MoDga5MDeDPjpMmeSuSwl27gHhdH
 3ZQ9VEro3EbaAhl9cBkEmTLZMpF18p3dGxlOQnjOTvEoyLtv1iyzK0a0a0uizNf74dop
 klwrMEUnC7tY4LL9nOEAzD9Mojh2focwn7jlM/KwE7AFYdmjLNup56wjMCiTJW226ijE Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sm18a84er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 04:59:40 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37L4oOLq015108;
	Mon, 21 Aug 2023 04:59:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sm18a84e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 04:59:40 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37L3PO5o018452;
	Mon, 21 Aug 2023 04:59:39 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sk82sgc2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 04:59:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37L4xbmY45154668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Aug 2023 04:59:37 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 579A720049;
	Mon, 21 Aug 2023 04:59:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5CDC20040;
	Mon, 21 Aug 2023 04:59:32 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.51.109])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 21 Aug 2023 04:59:32 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation); Mon, 21 Aug 2023 10:29:31 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: Enable generic cpu idle-loop
Date: Mon, 21 Aug 2023 10:29:27 +0530
Message-ID: <20230821045928.1350893-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xDUJgrdof8nK5PJFeS0qk8QHDtLLNxoW
X-Proofpoint-ORIG-GUID: NblDWfCNsH2Gd8Y2x87nRhyPlc1ecka3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-20_15,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=672 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308210042
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This minor patch enables config option GENERIC_IDLE_POLL_SETUP for arch
powerpc. This should add support for kernel param 'nohlt'.

Powerpc kernel also supports another kernel boot-time param called
'powersave' which can also be used to disable all cpu idle-states and
forces CPU to an idle-loop similar to what cpu_idle_poll() does. Hence this
patch  also updates the handling of 'powersave=off' kernel param to enable
generic cpu idle-loop if its enabled.

Signed-off-by: Vaibhav Jain<vaibhav@linux.ibm.com>
---
Changelog:

Since v1:
https://lore.kernel.org/all/20230818050739.827851-1-vaibhav@linux.ibm.com
* Updated powersave_off() to enable generic cpu idle-loop if
'powersave=off' kernel arg is given. [Mpe]
* Update patch description
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/powerpc/Kconfig                            | 1 +
 arch/powerpc/kernel/idle.c                      | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 722b6eca2e93..6b657ebafcfb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3738,7 +3738,7 @@
 
 	nohibernate	[HIBERNATION] Disable hibernation and resume.
 
-	nohlt		[ARM,ARM64,MICROBLAZE,MIPS,SH] Forces the kernel to
+	nohlt		[ARM,ARM64,MICROBLAZE,MIPS,PPC,SH] Forces the kernel to
 			busy wait in do_idle() and not use the arch_cpu_idle()
 			implementation; requires CONFIG_GENERIC_IDLE_POLL_SETUP
 			to be effective. This is useful on platforms where the
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0b1172cbeccb..574661403800 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -193,6 +193,7 @@ config PPC
 	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_GETTIMEOFDAY
+	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP		if PCI
diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index b1c0418b25c8..7367a0698459 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -21,6 +21,7 @@
 #include <linux/cpu.h>
 #include <linux/sysctl.h>
 #include <linux/tick.h>
+#include <linux/cpu.h>
 
 #include <asm/processor.h>
 #include <asm/cputable.h>
@@ -35,6 +36,8 @@ EXPORT_SYMBOL(cpuidle_disable);
 
 static int __init powersave_off(char *arg)
 {
+	/* Use generic idle loop if thats available */
+	cpu_idle_poll_ctrl(true);
 	ppc_md.power_save = NULL;
 	cpuidle_disable = IDLE_POWERSAVE_OFF;
 	return 1;
-- 
2.41.0

