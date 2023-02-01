Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D8B685E90
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 05:37:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P68KD3sCSz3dwn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 15:37:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mzlulsvp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mzlulsvp;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P68HN2Rvtz3cdm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 15:35:44 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3112fne4021507;
	Wed, 1 Feb 2023 04:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1z2rIpmCMOyAATK65rtVwXY/bFs/lZOaJzjlfZIyq/I=;
 b=MzlulsvpkfOOGt+/IDdQwxWyPgiM0FL4P5w3AB6XrwCNzIcroJCDK9WA0CPCXqgwZrXY
 vQcUUQVYxvroO1Lf5Mu9FxoZGIaag6Q9M3m76u2zHAxTvZP2SiPOemRT4AdX6kiXLThP
 rJMaEzLvUjCCLuW3DLHyfvzCNDnE2xxCkfBJWOMJEABkjDlJhYLPhMvk8fr0meGMxWNA
 Y13I4rQK00NrVY+nybjW3R+kXzLklTYs9x85JGJx0vyEQC0TCO+nbMiKAURwqrArbWlf
 0kToHg5rFIpPYN5mrAgIEJPQybhCwFfIVxj2XWjSw3JdkxU5GJMCZivJcmISkmtSS7C5 Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfewmaprn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:35:35 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3114UHOS027154;
	Wed, 1 Feb 2023 04:35:34 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfewmapr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:35:34 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VDsvO2013274;
	Wed, 1 Feb 2023 04:35:32 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtyc9b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 04:35:32 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3114ZURj43844088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 04:35:30 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 676EC2004B;
	Wed,  1 Feb 2023 04:35:30 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6039220040;
	Wed,  1 Feb 2023 04:35:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 04:35:29 +0000 (GMT)
Received: from civic.. (unknown [9.177.78.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A39BA60425;
	Wed,  1 Feb 2023 15:35:24 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/5] powerpc: kcsan: Add exclusions from instrumentation
Date: Wed,  1 Feb 2023 15:34:34 +1100
Message-Id: <20230201043438.1301212-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230201043438.1301212-1-rmclure@linux.ibm.com>
References: <20230201043438.1301212-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PnOSO3gGQ70P9LVLQzzCHcBKNEyMT7q7
X-Proofpoint-GUID: 2sYRirrRvC1Bdk3CYMyyebESSjj0o2r_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_01,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=445 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010033
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Exclude various incompatible compilation units from KCSAN
instrumentation.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/kernel/Makefile       | 10 ++++++++++
 arch/powerpc/kernel/trace/Makefile |  1 +
 arch/powerpc/kernel/vdso/Makefile  |  1 +
 arch/powerpc/lib/Makefile          |  2 ++
 arch/powerpc/purgatory/Makefile    |  1 +
 arch/powerpc/xmon/Makefile         |  1 +
 6 files changed, 16 insertions(+)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 9b6146056e48..9bf2be123093 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -54,6 +54,13 @@ CFLAGS_cputable.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_btext.o += -DDISABLE_BRANCH_PROFILING
 endif
 
+KCSAN_SANITIZE_early_32.o := n
+KCSAN_SANITIZE_early_64.o := n
+KCSAN_SANITIZE_cputable.o := n
+KCSAN_SANITIZE_btext.o := n
+KCSAN_SANITIZE_paca.o := n
+KCSAN_SANITIZE_setup_64.o := n
+
 #ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
 # Remove stack protector to avoid triggering unneeded stack canary
 # checks due to randomize_kstack_offset.
@@ -177,12 +184,15 @@ obj-$(CONFIG_PPC_SECVAR_SYSFS)	+= secvar-sysfs.o
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
 KCOV_INSTRUMENT_prom_init.o := n
+KCSAN_SANITIZE_prom_init.o := n
 UBSAN_SANITIZE_prom_init.o := n
 GCOV_PROFILE_kprobes.o := n
 KCOV_INSTRUMENT_kprobes.o := n
+KCSAN_SANITIZE_kprobes.o := n
 UBSAN_SANITIZE_kprobes.o := n
 GCOV_PROFILE_kprobes-ftrace.o := n
 KCOV_INSTRUMENT_kprobes-ftrace.o := n
+KCSAN_SANITIZE_kprobes-ftrace.o := n
 UBSAN_SANITIZE_kprobes-ftrace.o := n
 GCOV_PROFILE_syscall_64.o := n
 KCOV_INSTRUMENT_syscall_64.o := n
diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace/Makefile
index af8527538fe4..b16a9f9c0b35 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -23,4 +23,5 @@ obj-$(CONFIG_PPC32)			+= $(obj32-y)
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_ftrace.o := n
 KCOV_INSTRUMENT_ftrace.o := n
+KCSAN_SANITIZE_ftrace.o := n
 UBSAN_SANITIZE_ftrace.o := n
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 6a977b0d8ffc..3a2f32929fcf 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -46,6 +46,7 @@ GCOV_PROFILE := n
 KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
+KCSAN_SANITIZE := n
 
 ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
 ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 4de71cbf6e8e..c4db459d304a 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -16,6 +16,8 @@ KASAN_SANITIZE_feature-fixups.o := n
 # restart_table.o contains functions called in the NMI interrupt path
 # which can be in real mode. Disable KASAN.
 KASAN_SANITIZE_restart_table.o := n
+KCSAN_SANITIZE_code-patching.o := n
+KCSAN_SANITIZE_feature-fixups.o := n
 
 ifdef CONFIG_KASAN
 CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index a81d155b89ae..6f5e2727963c 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 KASAN_SANITIZE := n
+KCSAN_SANITIZE := n
 
 targets += trampoline_$(BITS).o purgatory.ro
 
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index eb25d7554ffd..d334de392e6c 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -5,6 +5,7 @@ GCOV_PROFILE := n
 KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
+KCSAN_SANITIZE := n
 
 # Disable ftrace for the entire directory
 ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
-- 
2.37.2

