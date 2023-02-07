Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1A68CC65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 03:01:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9mZ85p6gz3fBC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 13:01:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CpsbJpxa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CpsbJpxa;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9mW92Z1mz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 12:58:29 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3171lqUr032011;
	Tue, 7 Feb 2023 01:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FKRfD7U2J2b/kDmqzFhZKdiIhxccrnWDFXdRdvMgzaw=;
 b=CpsbJpxac4dwQRSOAMGsMGFSZo+3vNkWfaF7nxtPxg9qWn/IK7Vt0HZNaBZSmRImBzj1
 cO66tZF+ep3spG7iw571mMT+52gpijy3AJxD25QS2H8v0aJzVuRbbU/wHxVvuhAFU+Pw
 o9qfJXEz9Zwb4YN1AYrV5rrw2kSMgYKLX9MtOQRjHfCL6GA6wNCcfRDcuA16mx9NZPTR
 /FmfSdfgqp/0hK9pkHD4GBGsmf2UCHf6+zwsHPpP15b4ikrn5CmjDzmskbEDVo3wPN1O
 bso8Z8bwK0lROrHD9eci08/bvSs/qIcsSlofdJaJ2z1f5nFaPwjlkS/dja+g/X7UuqB5 Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkda0r69s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:24 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3171lu5v032089;
	Tue, 7 Feb 2023 01:58:23 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkda0r699-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3160gB6x019499;
	Tue, 7 Feb 2023 01:58:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3nhf06t4ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3171wIvB42729792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Feb 2023 01:58:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D891F2004D;
	Tue,  7 Feb 2023 01:58:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5691E20043;
	Tue,  7 Feb 2023 01:58:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Feb 2023 01:58:18 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8EBA9606E7;
	Tue,  7 Feb 2023 12:58:16 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/32: Convert patch_instruction() to patch_uint()
Date: Tue,  7 Feb 2023 12:56:43 +1100
Message-Id: <20230207015643.590684-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207015643.590684-1-bgray@linux.ibm.com>
References: <20230207015643.590684-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b-llKUVuUgtXByuufmM7b47oE-geD6o3
X-Proofpoint-ORIG-GUID: z4uiZkmRXxemoCWs_al6BfzyHZ9R9ivN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=969 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070012
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
Cc: erhard_f@mailbox.org, npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These changes are for patch_instruction() uses on data. Unlike ppc64
these should not be incorrect as-is, but using the patch_uint() alias
better reflects what kind of data being patched and allows for
benchmarking the effect of different patch_* implementations (e.g.,
skipping instruction flushing when patching data).

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/static_call.c     | 2 +-
 arch/powerpc/platforms/powermac/smp.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/static_call.c b/arch/powerpc/kernel/static_call.c
index 863a7aa24650..1502b7e439ca 100644
--- a/arch/powerpc/kernel/static_call.c
+++ b/arch/powerpc/kernel/static_call.c
@@ -17,7 +17,7 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 	mutex_lock(&text_mutex);
 
 	if (func && !is_short) {
-		err = patch_instruction(tramp + PPC_SCT_DATA, ppc_inst(target));
+		err = patch_ulong(tramp + PPC_SCT_DATA, target);
 		if (err)
 			goto out;
 	}
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 5b26a9012d2e..8a8a4688c5f4 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -825,7 +825,7 @@ static int smp_core99_kick_cpu(int nr)
 	mdelay(1);
 
 	/* Restore our exception vector */
-	patch_instruction(vector, ppc_inst(save_vector));
+	patch_uint(vector, save_vector);
 
 	local_irq_restore(flags);
 	if (ppc_md.progress) ppc_md.progress("smp_core99_kick_cpu done", 0x347);
-- 
2.39.1

