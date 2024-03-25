Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D42888F9B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:56:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HhAuMe7K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V32HH5bGfz3dXY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HhAuMe7K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V32DC1qFNz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:53:30 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P4TIFi005764;
	Mon, 25 Mar 2024 05:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Fo6YCdq4X7eI/O+FU0BB0RJpWix7rE5uKjbXiLeadSw=;
 b=HhAuMe7KtLhkWb04TRxaugZQIdmdX8wXvaNrKbTCY0L16OuGJnw9v28zqUfNyWiuVVB1
 oAp0EgEYukjnwIikr5CKsyCittEjMDJ0QUEElTi3N2snTOdXcfuYqa/3DpyjTpf7lhgR
 5EgcXtvUTlvrZ2cz9Fmvmg/Mo53kbTjwH5n6EjfU5CTsxvVne+wjaR/5x+ZrlM2B74TH
 eJ3CbhBHXrAmT3P2kK8qh5qCOjVRGzN6dGPmPWJ3rqjA4lSSrTL4JNDnUwWyzee02KcR
 H/Suoor60AMdLtQJuFfa5wJqY0hfWZhsyZWAYQz/T68g7vpLZBlM8aZGiX7nvnLw/6fH SQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x2gadhp06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:20 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P4NfE4016394;
	Mon, 25 Mar 2024 05:53:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x29dtqdvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P5rFWE44499344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:53:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EF6320040;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FEDB2004D;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E5B416043B;
	Mon, 25 Mar 2024 16:53:12 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/5] powerpc/32: Convert patch_instruction() to patch_uint()
Date: Mon, 25 Mar 2024 16:53:01 +1100
Message-ID: <20240325055302.876434-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325055302.876434-1-bgray@linux.ibm.com>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GnDMFdmZQu48L9pXmYRT6KjDGFJi2UiB
X-Proofpoint-ORIG-GUID: GnDMFdmZQu48L9pXmYRT6KjDGFJi2UiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_03,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=894 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
index 15644be31990..d21b681f52fb 100644
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
2.44.0

