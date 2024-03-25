Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313CE888FA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:57:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XiqIqYy/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V32Jr6qPdz3vjk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:57:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XiqIqYy/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V32DC5hlFz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:53:31 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P1NSTW027120;
	Mon, 25 Mar 2024 05:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tRGbgTH3wV3fNFco2k+gx8VVrn2b7Ac6mu6r/s3ezl8=;
 b=XiqIqYy/gENj+kXFoqVak1aDi4dWLpHAvhXE1ooOYxBNWk/+leiAeEEycSKAKnlMTXZK
 qngsbhWIykB4RKA8gFb4tykiBKPWiPTyyWuyzBB6JxO0noYAhtzIrhHzVc4Gai+KSK96
 giwq5P6oDu5BaBbG9X4gMiHJ7vbEFqSZ03rBN7qgSxx8njTAegRI0Au6oapsC30BQB0A
 lxBNbwts0ofndHlndUaU/cMkZJtEFGr0ys+tyUtpetAlH616Ce9EwmHrwS/rK2mM42IE
 zBCudv2fmmybGlunNpLpqfto4Ei/J18P/FiMM4CJID+ZfAF5N8Zuz9HBoekTTrEnLUlv DQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x2vxr0hqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:22 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P3YSdV011267;
	Mon, 25 Mar 2024 05:53:21 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2bmkpq1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P5rHdk23069414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:53:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BCB220043;
	Mon, 25 Mar 2024 05:53:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B57520040;
	Mon, 25 Mar 2024 05:53:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:53:17 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E914360442;
	Mon, 25 Mar 2024 16:53:12 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/5] powerpc/code-patching: Add boot selftest for data patching
Date: Mon, 25 Mar 2024 16:53:02 +1100
Message-ID: <20240325055302.876434-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325055302.876434-1-bgray@linux.ibm.com>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KsTJsG0Z7u85CwSc3KMfAc0HUTAqjvyL
X-Proofpoint-GUID: KsTJsG0Z7u85CwSc3KMfAc0HUTAqjvyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_03,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
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

Extend the code patching selftests with some basic coverage of the new
data patching variants too.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v3: * New in v3
---
 arch/powerpc/lib/test-code-patching.c | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/powerpc/lib/test-code-patching.c b/arch/powerpc/lib/test-code-patching.c
index c44823292f73..e96c48fcd4db 100644
--- a/arch/powerpc/lib/test-code-patching.c
+++ b/arch/powerpc/lib/test-code-patching.c
@@ -347,6 +347,41 @@ static void __init test_prefixed_patching(void)
 	check(!memcmp(iptr, expected, sizeof(expected)));
 }
 
+static void __init test_data_patching(void)
+{
+	void *buf;
+	u32 *addr32;
+
+	buf = vzalloc(PAGE_SIZE);
+	check(buf);
+	if (!buf)
+		return;
+
+	addr32 = buf + 128;
+
+	addr32[1] = 0xA0A1A2A3;
+	addr32[2] = 0xB0B1B2B3;
+
+	patch_uint(&addr32[1], 0xC0C1C2C3);
+
+	check(addr32[0] == 0);
+	check(addr32[1] == 0xC0C1C2C3);
+	check(addr32[2] == 0xB0B1B2B3);
+	check(addr32[3] == 0);
+
+	patch_ulong(&addr32[1], 0xD0D1D2D3);
+
+	check(addr32[0] == 0);
+	*(unsigned long *)(&addr32[1]) = 0xD0D1D2D3;
+
+	if (!IS_ENABLED(CONFIG_PPC64))
+		check(addr32[2] == 0xB0B1B2B3);
+
+	check(addr32[3] == 0);
+
+	vfree(buf);
+}
+
 static int __init test_code_patching(void)
 {
 	pr_info("Running code patching self-tests ...\n");
@@ -356,6 +391,7 @@ static int __init test_code_patching(void)
 	test_create_function_call();
 	test_translate_branch();
 	test_prefixed_patching();
+	test_data_patching();
 
 	return 0;
 }
-- 
2.44.0

