Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD638E621
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 14:03:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpbSz2Tgjz3bvQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 22:03:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aS7m2zdB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aS7m2zdB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpbSV2Q58z2yjJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 22:02:49 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OBX7Yp001016; Mon, 24 May 2021 08:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=i+LjMcUWku+lG6vdtq8pFQIa/7R370HK/y0HY7OkrRU=;
 b=aS7m2zdBsKK04bdo+l5gDZBjl1dIqdxBQ4oBd81N08T85xhGG7lLO9rp9bmQX3RRuzOM
 XNs4BeggclekfckAApYrcJFm7ZG66qFd+yAQJeYQ2NjBJLh8idKWg6FuURqBF/+3XOdg
 HrI3Z9a7yKijfe7QfLB55RAR6Q+pLadmaXjMlIXh9MVQSkEtRBJK+8ZIImcleFKnqNcK
 LaBYqs/co3Mcj5ptvBO/uy7azQb/yYjcaJvrkGg0SrRQcyEmYXxSEnrDiM8XmpelrEOC
 KNTvbSvqWIRYyV64plHJ8Efs2Hn++n1YaCfQgD5U0ov+Z5WQbxxYgPIEOY2ACBDXOPp7 EA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rak7t0tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 08:02:41 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14OC2de1031335;
 Mon, 24 May 2021 12:02:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 38psk88dv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 12:02:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14OC2afR12780010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 12:02:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2896E4C050;
 Mon, 24 May 2021 12:02:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C8FD4C044;
 Mon, 24 May 2021 12:02:34 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.75.18])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 12:02:34 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/configs: Enable STACK_TRACER and FTRACE_SYSCALLS in
 some of the configs
Date: Mon, 24 May 2021 17:32:27 +0530
Message-Id: <20210524120227.3333208-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mz55USRAdSL_FpoAHZsyrESvrHABo5BS
X-Proofpoint-GUID: Mz55USRAdSL_FpoAHZsyrESvrHABo5BS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_06:2021-05-24,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240078
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Both these config options are generally enabled in distro kernels.
Enable the same in a few powerpc64 configs to get better coverage and
testing.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/configs/powernv_defconfig | 1 +
 arch/powerpc/configs/ppc64_defconfig   | 2 ++
 arch/powerpc/configs/pseries_defconfig | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 2c87e856d839b0..8bfeea6c7de7b4 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -309,6 +309,7 @@ CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_FUNCTION_TRACER=y
 CONFIG_SCHED_TRACER=y
+CONFIG_STACK_TRACER=y
 CONFIG_FTRACE_SYSCALLS=y
 CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_PPC_EMULATED_STATS=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 701811c91a6f3f..0ad2291337a713 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -368,7 +368,9 @@ CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_DEBUG_MUTEXES=y
 CONFIG_FUNCTION_TRACER=y
+CONFIG_FTRACE_SYSCALLS=y
 CONFIG_SCHED_TRACER=y
+CONFIG_STACK_TRACER=y
 CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_CODE_PATCHING_SELFTEST=y
 CONFIG_FTR_FIXUP_SELFTEST=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index 50168dde4ea598..b183629f1bcfb8 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -289,7 +289,9 @@ CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_FUNCTION_TRACER=y
+CONFIG_FTRACE_SYSCALLS=y
 CONFIG_SCHED_TRACER=y
+CONFIG_STACK_TRACER=y
 CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_CODE_PATCHING_SELFTEST=y
 CONFIG_FTR_FIXUP_SELFTEST=y

base-commit: 8dbbcb8a8856c6b4e56ae705218d8dad1f9cf1e9
-- 
2.30.2

