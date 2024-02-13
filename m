Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0E9852803
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 05:37:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LPVh9BE8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYpTb0Tn2z3dX8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 15:37:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LPVh9BE8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYpSp4NMgz3bs2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 15:36:58 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41D4CY7P008025;
	Tue, 13 Feb 2024 04:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=vGnMbkmjJVV09purTBXeRTfG05uiEcwcd/UcrMVg4KA=;
 b=LPVh9BE8stqYNhwPR35ymogSvbA2Bc0VkQ5ln73aH7KJ7gjqh8QXHC3UsOv0NO0KxpkL
 0/HXr/I+v/KbPg5wgdWOxAqViVBfQVF5jAWu4oP6m3YNMufljS+IzKmafOYUzvLJqHxx
 zrvdLH9Jw+znvUUAQ86VGnLj6ps8qcMae9kZ10CiK2IEKk4DZNq3DT+CgZ8G76QuszhL
 7DHu2BUpWgrR29ycZdIjpj+VjQua26AL4M8pb3fb/cjukuttWh1twUPyuRK0p/ogf/v3
 /DKSdj9twzfuZGbIDm3ZOiuRkb5JLO1Dy4bV/g8t+9NxOtjNaFqMufQh2w6hDghpBNJW /Q== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w816jrc1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 04:36:50 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41D1WY04024877;
	Tue, 13 Feb 2024 04:36:49 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6mfp56gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 04:36:49 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41D4ak5O17433140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Feb 2024 04:36:48 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 403B720065;
	Tue, 13 Feb 2024 04:36:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE94A20043;
	Tue, 13 Feb 2024 04:36:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Feb 2024 04:36:45 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CD8D7602C3;
	Tue, 13 Feb 2024 15:36:42 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/code-patching: Disable KASAN in __patch_instructions()
Date: Tue, 13 Feb 2024 15:36:38 +1100
Message-ID: <20240213043638.168048-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A0Cf7PZElcSy4SYLK2gYdJiBaLFbGXdB
X-Proofpoint-ORIG-GUID: A0Cf7PZElcSy4SYLK2gYdJiBaLFbGXdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_20,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=15 priorityscore=1501
 adultscore=0 spamscore=15 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=76 suspectscore=0 malwarescore=0 clxscore=1011
 mlxscore=15 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402130030
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
Cc: hbathini@linux.ibm.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The memset/memcpy functions are by default instrumented by KASAN, which
complains about user memory access when using a poking page in
userspace.

Using a userspace address is expected though, so don't instrument with
KASAN for this function.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

I tried to replace the memsetN calls with __memsetN, but we appear to
disable the non-instrumented variants of these when KASAN is enabled.
Christophe might you know more here?

The cost of just suppressing reports for this section shouldn't be too
relevant; KASAN detects the access, but exits before it starts preparing
the report itself. So it's just like any other KASAN instrumented
function for the most part.
---
 arch/powerpc/lib/code-patching.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c6ab46156cda..24989594578a 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -3,6 +3,7 @@
  *  Copyright 2008 Michael Ellerman, IBM Corporation.
  */
 
+#include <linux/kasan.h>
 #include <linux/kprobes.h>
 #include <linux/mmu_context.h>
 #include <linux/random.h>
@@ -377,6 +378,7 @@ static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool rep
 	unsigned long start = (unsigned long)patch_addr;
 
 	/* Repeat instruction */
+	kasan_disable_current();
 	if (repeat_instr) {
 		ppc_inst_t instr = ppc_inst_read(code);
 
@@ -392,6 +394,7 @@ static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool rep
 	} else {
 		memcpy(patch_addr, code, len);
 	}
+	kasan_enable_current();
 
 	smp_wmb();	/* smp write barrier */
 	flush_icache_range(start, start + len);
-- 
2.43.0

