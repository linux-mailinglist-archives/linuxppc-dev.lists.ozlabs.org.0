Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04EE8C5F3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 04:47:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ky6jj8uu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfHh01Yjjz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 12:47:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ky6jj8uu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfHdg0jKNz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 12:45:26 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44F2UxQU000747;
	Wed, 15 May 2024 02:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pINCBJSZ+85AYKeBeRIwRqru2qI8dIDSheRVKSlyDE4=;
 b=ky6jj8uu6O2vGyOf0cUlQ0P//thzOujYaDeRi3A3qXbf/9mucBm6YLY8dcFFCwZDZk2j
 j04alYzlzeXl21YkJA4L0FJ723Ym/iB3A+SwewgNjyvMwgkG1oT6+48mEjwUblBhSMHF
 0bEuXMiRUr6yLMzdnIRsW1n7lsPObBglQEYn3gzacamZ/JNn+1E6nirP4M21efdWWKZD
 Bb4sBw23/Dc1kO83kzdmeXXExQOxIW6qOl/6lHKkmyHAlAge+VhBe4MPGeJ9E+NrJryq
 a1nOuRiaDv6u8q9O9dStTpcBsx1nGokYu8QY96zznZLbGOhsIzPxMOGINW4913atuSra Xw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4ex7gr29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 02:45:16 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44ENEadS029625;
	Wed, 15 May 2024 02:45:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7krqe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 02:45:15 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44F2jBSh54067528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 02:45:14 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2BE320040;
	Wed, 15 May 2024 02:45:11 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 641EA2005A;
	Wed, 15 May 2024 02:45:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 May 2024 02:45:11 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2A875610AC;
	Wed, 15 May 2024 12:45:08 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/5] powerpc/code-patching: Add data patch alignment check
Date: Wed, 15 May 2024 12:44:42 +1000
Message-ID: <20240515024445.236364-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240515024445.236364-1-bgray@linux.ibm.com>
References: <20240515024445.236364-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: THdcSI6eXNECyBhDR5VPIFIC-Un5kdIl
X-Proofpoint-GUID: THdcSI6eXNECyBhDR5VPIFIC-Un5kdIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_16,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 adultscore=0 mlxlogscore=950 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405150017
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
index 18f762616db9..384b275d1bc5 100644
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
2.45.0

