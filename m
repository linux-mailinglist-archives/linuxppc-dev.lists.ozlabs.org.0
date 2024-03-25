Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2052888F8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:54:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AkyAKKoE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V32Fj4r1Wz3vYM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:54:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AkyAKKoE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V32DB3Cz6z3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:53:30 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P4Om4i013511;
	Mon, 25 Mar 2024 05:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zKMs+BcSi1s1dN/De1QjkrJrukG01WQOvWsDcGpPf8k=;
 b=AkyAKKoEkvGOs8v7Y7BolbFjITDzBcltHZXIJ4x6fv3EYnWP3w/Dj7xe05/C9fnopbOI
 A9Kw5sYZhQANexR9dJOF/yDhVAoVzUlxEwrU37B9LEBFtmh8yckPJosBhS7N3tWHfe9M
 1/p5upU7JPVQGCOQuCqaCwH8eaoB/FxnJSwa4RyKLS1O64cqibd2Wm6LtrwwiB73THeF
 i8K2vq7+Sp5PkMeVFOoUWwXqCjEKT6Flq4scWqoxPgbfoDnJrn+WUrS/nucb33yfXbsf
 Bg3Iz+a5qlGUQcTexmKAfmfeFyGgImP7kT5Qamrd1EWzrjvbvJpWemoero1jCnnxq51r xA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x1x53bjv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:20 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P5MkCw028685;
	Mon, 25 Mar 2024 05:53:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2adny3sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P5rFkf40501586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:53:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B30A2004F;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 113E420040;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D3ED760431;
	Mon, 25 Mar 2024 16:53:12 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/5] powerpc/code-patching: Add data patch alignment check
Date: Mon, 25 Mar 2024 16:52:59 +1100
Message-ID: <20240325055302.876434-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325055302.876434-1-bgray@linux.ibm.com>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WhAT2uEIwZohIrsBq2G37Dm9acDvVOQo
X-Proofpoint-ORIG-GUID: WhAT2uEIwZohIrsBq2G37Dm9acDvVOQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_03,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250030
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
Cc: Naveen N Rao <naveen@kernel.org>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The new data patching still needs to be aligned within a
cacheline too for the flushes to work correctly. To simplify
this requirement, we just say data patches must be aligned.

Detect when data patching is not aligned, returning an invalid
argument error.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v3: * New in v3
---
 arch/powerpc/include/asm/code-patching.h | 6 ++++++
 arch/powerpc/lib/code-patching.c         | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 21a36e2c4e26..e7f14720f630 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -95,11 +95,17 @@ int patch_ulong(void *addr, unsigned long val);
 
 static inline int patch_uint(void *addr, unsigned int val)
 {
+	if (!IS_ALIGNED((unsigned long)addr, sizeof(unsigned int)))
+		return -EINVAL;
+
 	return patch_instruction(addr, ppc_inst(val));
 }
 
 static inline int patch_ulong(void *addr, unsigned long val)
 {
+	if (!IS_ALIGNED((unsigned long)addr, sizeof(unsigned long)))
+		return -EINVAL;
+
 	return patch_instruction(addr, ppc_inst(val));
 }
 
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index a31e313c6321..35c620dbdfd4 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -386,12 +386,18 @@ NOKPROBE_SYMBOL(patch_instruction);
 
 int patch_uint(void *addr, unsigned int val)
 {
+	if (!IS_ALIGNED((unsigned long)addr, sizeof(unsigned int)))
+		return -EINVAL;
+
 	return patch_mem(addr, val, false);
 }
 NOKPROBE_SYMBOL(patch_uint);
 
 int patch_ulong(void *addr, unsigned long val)
 {
+	if (!IS_ALIGNED((unsigned long)addr, sizeof(unsigned long)))
+		return -EINVAL;
+
 	return patch_mem(addr, val, true);
 }
 NOKPROBE_SYMBOL(patch_ulong);
-- 
2.44.0

