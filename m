Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 355396AB804
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 09:12:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVWWz0Fr3z3cjD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 19:12:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OUL+EeKT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OUL+EeKT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVWVz5jwYz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 19:11:23 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3267dTPO032053;
	Mon, 6 Mar 2023 08:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ECwMxJ5akodVUa9VYHYTJWu375T5DLlLftB9mQeL5J0=;
 b=OUL+EeKT50PDv5JbjH3Und87y7yz5Z8HtVNlG4LhF3yTUcX7F/cO+fT1hpdfB6SI1QHF
 QizXF6qRAyNLA0bOxmOQTbMVD0WGoBH6Dd6CPzfSKmtxT6AclL8qR+D1m9trmozUJmWq
 jl55mVdQ1kf7EJTvdA9OvMkRS0LOufRCOhaWATbG8gSi8d5vskmWsEIQRY3a8e/BooY5
 QksiVIEG+2FWKqtu/vM3yQJNK8ul50APls5VvwZX+DnnMcFfy+x3Hl1s3U4gnn0pHJnF
 AqmSOrFZI7rmG8fZzp/ARuz50QAcv3tQYVpo9REMMPGAgTXg8safSqkxuKku8RK0dd24 Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4x1hf4dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 08:11:13 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3267KP1i026215;
	Mon, 6 Mar 2023 08:11:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4x1hf4d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 08:11:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 325Kh4rL005890;
	Mon, 6 Mar 2023 08:11:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p418ctdbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 08:11:11 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3268B8tA18744052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Mar 2023 08:11:08 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3B122004B;
	Mon,  6 Mar 2023 08:11:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2EE5C20043;
	Mon,  6 Mar 2023 08:11:07 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.41.105])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Mar 2023 08:11:07 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/Kconfig: Select FUNCTION_ALIGNMENT_4B
Date: Mon,  6 Mar 2023 13:40:42 +0530
Message-Id: <20230306081042.299871-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8Rk-Ub0D3lAr4pOzjpfE5WYZPId6CE5q
X-Proofpoint-ORIG-GUID: 7NFZrYhBKXRL58WTv0DVW8TyNhcAnQkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-05_12,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060068
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
Cc: naveen.n.rao@linux.vnet.ibm.com, sv@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit d49a0626216b95 ("arch: Introduce CONFIG_FUNCTION_ALIGNMENT")
introduced a generic function-alignment infrastructure. Move to using
FUNCTION_ALIGNMENT_4B on powerpc, to use the same alignment as that of the
existing _GLOBAL macro.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>

Note:
Given that alignment beyond the minimum requirement may be desirable,
should we instead select FUNCTION_ALIGNMENT_16B for ppc64 and select
FUNCTION_ALIGNMENT_4B/8B for ppc32?

From vmlinux (pseries_le_defconfig) symbol offsets, it looks like most of
the ppc64 symbols are being aligned to a 16B boundary, but there are a few
which are not.

Currently, size of vmlinux (built with pseries_le_defconfig) is 47090kB.
With FUNCTION_ALIGNMENT_4B selected, size of vmlinux is 47152kB.
With FUNCTION_ALIGNMENT_16B selected, size of vmlinux is 47152kB.

Currently, size of vmlinux (built with powernv_defconfig) is 42852kB.
With FUNCTION_ALIGNMENT_4B selected, size of vmlinux is 42911kB.
With FUNCTION_ALIGNMENT_16B selected, size of vmlinux is 42977kB.

I am wondering if we should use the same alignment as that of
_GLOBAL macro or have alignment set to a 8B/16B boundary.
Please let me know your thoughts on the same. Thanks!
---
 arch/powerpc/Kconfig               | 1 +
 arch/powerpc/include/asm/linkage.h | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a6c4407d3ec8..ac3f80c0db36 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -174,6 +174,7 @@ config PPC
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
 	select EDAC_ATOMIC_SCRUB
 	select EDAC_SUPPORT
+	select FUNCTION_ALIGNMENT_4B
 	select GENERIC_ATOMIC64			if PPC32
 	select GENERIC_CLOCKEVENTS_BROADCAST	if SMP
 	select GENERIC_CMOS_UPDATE
diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
index b88d1d2cf304..b71b9582e754 100644
--- a/arch/powerpc/include/asm/linkage.h
+++ b/arch/powerpc/include/asm/linkage.h
@@ -4,9 +4,6 @@
 
 #include <asm/types.h>
 
-#define __ALIGN		.align 2
-#define __ALIGN_STR	".align 2"
-
 #ifdef CONFIG_PPC64_ELF_ABI_V1
 #define cond_syscall(x) \
 	asm ("\t.weak " #x "\n\t.set " #x ", sys_ni_syscall\n"		\
-- 
2.31.1

