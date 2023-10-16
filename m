Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EED8E7C9E71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 07:10:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d3bMJPr5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S84tZ68nFz3vX4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 16:10:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d3bMJPr5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S84rn4jSPz2yQ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 16:08:41 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39G50ma5010933;
	Mon, 16 Oct 2023 05:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DPHSjLdFE6xUZFqSzY9Hl27Ve7J78ts/zKMb3BM2H/Y=;
 b=d3bMJPr5QrmEdQF+6lDZULg9/HiVaCWGZ1IVIKeMOKVD8xq2a42yx2mgqB4oBC1gXdfX
 4sWNnV+ybvMVJWv6DZH7pnQ6VjmmFCwsl2AUJqUnsJ6+h5AF0AqAmFpJkjd/G7wjcwal
 1tGgskif1fichA4qaew6ZE9aZ92pj9pEc2vkyWfRIz/YUtY+K9bdyMtZaf5fSWMCMqL+
 UTbHmYNGckOzmvhYCJ45nRpahoXlDjUesNKu2GSUjNIqGap090Odi2fnbURXMGa047C2
 A+S3IQ0HHko4RX23ksZG+jR0UMdf9G7ojxgEYXwnFgLkc+tI8LJiak3C97VomRe0zoZi tQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3trutr3v9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 05:08:36 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39G3kcCV027154;
	Mon, 16 Oct 2023 05:03:35 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr6tjxenn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 05:03:35 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39G53XbL44761432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Oct 2023 05:03:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 042242004F;
	Mon, 16 Oct 2023 05:03:33 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 850AE20043;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 327B660511;
	Mon, 16 Oct 2023 16:03:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/3] powerpc/32: Convert patch_instruction() to patch_uint()
Date: Mon, 16 Oct 2023 16:01:47 +1100
Message-ID: <20231016050147.115686-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016050147.115686-1-bgray@linux.ibm.com>
References: <20231016050147.115686-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fh3TO3QZfLztFp5bUNzRj80mPS5DECy2
X-Proofpoint-ORIG-GUID: fh3TO3QZfLztFp5bUNzRj80mPS5DECy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-15_09,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=774 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310160044
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
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
index c83d1e14077e..cfc1cd10135d 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -827,7 +827,7 @@ static int smp_core99_kick_cpu(int nr)
 	mdelay(1);
 
 	/* Restore our exception vector */
-	patch_instruction(vector, ppc_inst(save_vector));
+	patch_uint(vector, save_vector);
 
 	local_irq_restore(flags);
 	if (ppc_md.progress) ppc_md.progress("smp_core99_kick_cpu done", 0x347);
-- 
2.39.2

