Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E6068B41C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 03:19:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P991h4f5Kz3bfK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 13:19:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l870Xgy0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l870Xgy0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P990h6tpMz3bfK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 13:18:28 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3161EpeG030165;
	Mon, 6 Feb 2023 02:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1z2rIpmCMOyAATK65rtVwXY/bFs/lZOaJzjlfZIyq/I=;
 b=l870Xgy0NXUOqCX/S9jyaMT2sbLsnhaO0gHOwWNG/U72qQEPUZzK/BEs6Y08ra5wp/FU
 cokS2FiwLHaVD9hWqP0wEZ2qZOAQt2m8tex528Y4KStxJry5UKDhfYIfpQMopfh5uCBL
 IP3+R66Jy7z625nropZ+olCGGjrWFFyfbBAXjIeMJXCHFsQpijifRbfQOc8yiPHmDtCq
 mq35aI5x9rvvMxfkhcvBbOooSYt/Lq6HFqLfWCWFiobF0wh+AWR0wRRqvhpjpB21aUKx
 dfGFXAA8Xdbw1/oIDGFV7HdDGw+wpXlBYTu2Rdi84w4mN8heII91e/gjKVKynaOi5GKY 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj14ckft5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 02:18:23 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3162H8D7010925;
	Mon, 6 Feb 2023 02:18:23 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj14ckfsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 02:18:23 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3158Br8c012513;
	Mon, 6 Feb 2023 02:18:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3nhf06sank-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 02:18:20 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3162IIHQ51577296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Feb 2023 02:18:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C9992004D;
	Mon,  6 Feb 2023 02:18:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2797920043;
	Mon,  6 Feb 2023 02:18:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Feb 2023 02:18:17 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 66E6A6010B;
	Mon,  6 Feb 2023 13:18:14 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/5] powerpc: kcsan: Add exclusions from instrumentation
Date: Mon,  6 Feb 2023 13:17:57 +1100
Message-Id: <20230206021801.105268-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230206021801.105268-1-rmclure@linux.ibm.com>
References: <20230206021801.105268-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8VP2LXKuAfSCqt61eV70rGKqkRX8xyuu
X-Proofpoint-ORIG-GUID: AJzVfTXslAYAc22QSCWjbGy1dmJ-IXy-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_01,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=440
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060018
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

