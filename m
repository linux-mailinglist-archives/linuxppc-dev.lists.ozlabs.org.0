Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F78B8C5F42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 04:48:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aXe0YCH6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfHjY0TxTz3dRZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 12:48:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aXe0YCH6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfHdh6NSCz30Sw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 12:45:28 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44F2UxtK031239;
	Wed, 15 May 2024 02:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+oarvLeub5glBTCi9PxVoHHnEJgG8M/aLcbeVP8+bPE=;
 b=aXe0YCH6tQQdQe+J0xIy5OijXlScdmSzXCBceMA6az7APuY6/ww19+ul+pbI0RDDmJcd
 GxelaRtPNJlcR9bX88OcJl28lu6JVYMpKggS2jXwge5aq2M/n8kJGfYH0JOebxBcyN4R
 Gb4uRrJ8trpxQijKA0ydfnrxIPLSxmbL6k9ADrTnPqHG63mO/vQKYu9DKda6L2lQl2y4
 beO75RyoZK5jJw87jqgEWvnLSYKqpoxGWw+wyye0N3AnmXqpVB6kTozdlbcZFOTiD8nx
 NBdEdz6RPWIX/3MIluD0XdztcyOd0lfQ4AaxkIj5xLP2Cmwf8P42n/y2RAuObeCYa+C1 bA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4hqn8ap9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 02:45:18 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44F1QRDI002257;
	Wed, 15 May 2024 02:45:18 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0p921b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 02:45:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44F2jDK722479344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 02:45:16 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D798F2004B;
	Wed, 15 May 2024 02:45:13 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 652C72004D;
	Wed, 15 May 2024 02:45:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 May 2024 02:45:13 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 30DB3610AF;
	Wed, 15 May 2024 12:45:08 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 5/5] powerpc/code-patching: Add boot selftest for data patching
Date: Wed, 15 May 2024 12:44:45 +1000
Message-ID: <20240515024445.236364-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240515024445.236364-1-bgray@linux.ibm.com>
References: <20240515024445.236364-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mhw_rs2n2rmdtHCBgU7tOyYJ67k16x-N
X-Proofpoint-GUID: Mhw_rs2n2rmdtHCBgU7tOyYJ67k16x-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_16,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405150017
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

v4: * Change store to a check
    * Account for doubleword alignment
v3: * New in v3
---
 arch/powerpc/lib/test-code-patching.c | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/powerpc/lib/test-code-patching.c b/arch/powerpc/lib/test-code-patching.c
index f76030087f98..8cd3b32f805b 100644
--- a/arch/powerpc/lib/test-code-patching.c
+++ b/arch/powerpc/lib/test-code-patching.c
@@ -438,6 +438,46 @@ static void __init test_multi_instruction_patching(void)
 	vfree(buf);
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
+	check(!patch_uint(&addr32[1], 0xC0C1C2C3));
+
+	check(addr32[0] == 0);
+	check(addr32[1] == 0xC0C1C2C3);
+	check(addr32[2] == 0xB0B1B2B3);
+	check(addr32[3] == 0);
+
+	/* Unaligned patch_ulong() should fail */
+	if (IS_ENABLED(CONFIG_PPC64))
+		check(patch_ulong(&addr32[1], 0xD0D1D2D3) == -EINVAL);
+
+	check(!patch_ulong(&addr32[2], 0xD0D1D2D3));
+
+	check(addr32[0] == 0);
+	check(addr32[1] == 0xC0C1C2C3);
+	check(*(unsigned long *)(&addr32[2]) == 0xD0D1D2D3);
+
+	if (!IS_ENABLED(CONFIG_PPC64))
+		check(addr32[3] == 0);
+
+	check(addr32[4] == 0);
+
+	vfree(buf);
+}
+
 static int __init test_code_patching(void)
 {
 	pr_info("Running code patching self-tests ...\n");
@@ -448,6 +488,7 @@ static int __init test_code_patching(void)
 	test_translate_branch();
 	test_prefixed_patching();
 	test_multi_instruction_patching();
+	test_data_patching();
 
 	return 0;
 }
-- 
2.45.0

