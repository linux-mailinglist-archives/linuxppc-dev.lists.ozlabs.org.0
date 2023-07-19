Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D5A758EA6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 09:19:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mfK+d2do;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Rz40rcQz2yq2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 17:19:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mfK+d2do;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Ry86N7dz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 17:18:56 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J76IsS030595;
	Wed, 19 Jul 2023 07:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=e7u2GC1MXrJc2X98x6SXm0lexI2mnKgIy5Y55Jl4qCE=;
 b=mfK+d2dou4XGoi0tDG21Uu009xoSTsmFtV+AKwB5czoGRE29p2mPV3HzaRMC536hXob4
 KbD8gzlW4Har2b6JVIoTNRn3TeX0Kum66ZIuuBrOg6gPI7J0ho88z+tRYWqY+OrzaT9N
 KfVwILY1VybPm5clmcvYHperjYpD90o5AwKtQLEC20rfJ5mqx7zvfi8CiBkG+sn8QikU
 zIZV0KnmczhGtpybSmREapvpv01lOboK56hqD7Ij82Twih1KT9Efa8Nqh9yBW4dEHLVe
 QRifatjMg3BtWNqykX3NKm7Ip1dVX5yEFQ1iMVbbjc11hqprCyKraumRqboLgqWikPnu gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rxa0ghu5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 07:18:30 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36J78p56011217;
	Wed, 19 Jul 2023 07:18:30 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rxa0ghu51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 07:18:30 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36J4Hvhc016875;
	Wed, 19 Jul 2023 07:18:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv5srsfa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 07:18:29 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36J7IR9p40305360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Jul 2023 07:18:27 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C45220049;
	Wed, 19 Jul 2023 07:18:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E4F020040;
	Wed, 19 Jul 2023 07:18:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Jul 2023 07:18:27 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1830E6016C;
	Wed, 19 Jul 2023 17:18:24 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Revert "powerpc/64s: Remove support for ELFv1 little endian userspace"
Date: Wed, 19 Jul 2023 17:18:21 +1000
Message-ID: <20230719071821.320594-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wSJ7MaB7HpVG5Rt6JqxjOqjcc5fKZMLE
X-Proofpoint-ORIG-GUID: 6AzYIIPexC61uwOYxaQVuV2MctHkfSre
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_04,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=724 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307190064
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
Cc: Adam Borowski <kilobyte@angband.pl>, Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 606787fed7268feb256957872586370b56af697a.

ELFv1 with LE has never been a thing, and people who try to make ELFv1 LE
binaries are maniacs who need to be stopped, but unfortunately there are
ELFv1 LE binaries out there in the wild.

One such binary is the ppc64el (as Debian calls it) helper for
arch-test[0], a tool for detecting architectures that can be executed on a
given machine by means of attempting to execute helper binaries compiled
for each architecture and seeing which binaries succeed and fail. The
helpers are small snippets of assembly, and the ppc64el assembly doesn't
include the right directives to generate an ELFv2 binary.

This results in arch-test incorrectly determining that a ppc64el kernel
can't execute a ppc64el userspace, which in turn means that a number of
developer tools such as debootstrap will break (assuming arch-test is
installed).

[0] https://github.com/kilobyte/arch-test

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Adam Borowski <kilobyte@angband.pl>
---
 arch/powerpc/include/asm/elf.h         | 6 ------
 arch/powerpc/include/asm/thread_info.h | 6 +-----
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
index a26ca097d032..79f1c480b5eb 100644
--- a/arch/powerpc/include/asm/elf.h
+++ b/arch/powerpc/include/asm/elf.h
@@ -12,14 +12,8 @@
 
 /*
  * This is used to ensure we don't load something for the wrong architecture.
- * 64le only supports ELFv2 64-bit binaries (64be supports v1 and v2).
  */
-#if defined(CONFIG_PPC64) && defined(CONFIG_CPU_LITTLE_ENDIAN)
-#define elf_check_arch(x) (((x)->e_machine == ELF_ARCH) && \
-			   (((x)->e_flags & 0x3) == 0x2))
-#else
 #define elf_check_arch(x) ((x)->e_machine == ELF_ARCH)
-#endif
 #define compat_elf_check_arch(x)	((x)->e_machine == EM_PPC)
 
 #define CORE_DUMP_USE_REGSET
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index bc5d39a835fe..bf5dde1a4114 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -183,13 +183,9 @@ static inline bool test_thread_local_flags(unsigned int flags)
 #define clear_tsk_compat_task(tsk) do { } while (0)
 #endif
 
-#ifdef CONFIG_PPC64
-#ifdef CONFIG_CPU_BIG_ENDIAN
+#if defined(CONFIG_PPC64)
 #define is_elf2_task() (test_thread_flag(TIF_ELF2ABI))
 #else
-#define is_elf2_task() (1)
-#endif
-#else
 #define is_elf2_task() (0)
 #endif
 
-- 
2.41.0

