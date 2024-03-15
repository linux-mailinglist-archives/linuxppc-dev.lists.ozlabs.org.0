Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C203B87C7C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 04:00:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BxbIPEpl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Twprm42Sqz3vY9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 14:00:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BxbIPEpl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwppP1Bc2z3bV2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 13:58:04 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42F2GHsb011436;
	Fri, 15 Mar 2024 02:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8lVoaxPgEeD/+8RcGMohVwmgQ4CnQdG2rhoPcWJydIM=;
 b=BxbIPEpl20nfBpHvmXLL6PilZYx7msZLX1ZO6t9KPB9gYKXtQ1NmwRcnHU3oTcS/jNKq
 XgeOaQ/UEEMVyG+BXV28YnkKQvTpA6A3zBtnsdE4qw6AMoKFQIRUcsNf0NZtcuzPJMGW
 rpKYtaiZTkjZcGBN7whvmwm6YH5s876aoUnjhBx+HHy+pC5IDaHbE8hsubiegG9MfBMC
 3raSpgGxokCm31rXYw3xzRjLXBNsN73wbs2IA54ZkLkfJpUDl7gkWvUUrzJOemCuP3J1
 R7bCVxC4kTR8B9S/Tzo5rFQCEU6odYEIqgj94pJHqSauxwnQbbruBp0TcGGBe0qhSYoi sQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wvcfhrun6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 02:58:01 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42F0xWRu020423;
	Fri, 15 Mar 2024 02:58:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ws3kmh2kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 02:57:59 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42F2vu9Z32899474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Mar 2024 02:57:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB40120043;
	Fri, 15 Mar 2024 02:57:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 810CE20040;
	Fri, 15 Mar 2024 02:57:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Mar 2024 02:57:55 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.9.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8ABD2600C9;
	Fri, 15 Mar 2024 13:57:52 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v1 3/3] powerpc/code-patching: Optimise patch_memcpy() to 4 byte chunks
Date: Fri, 15 Mar 2024 13:57:36 +1100
Message-ID: <20240315025736.404867-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315025736.404867-1-bgray@linux.ibm.com>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O6zhzCzcXRcQ6MSzYEp0YtmY93V903vz
X-Proofpoint-GUID: O6zhzCzcXRcQ6MSzYEp0YtmY93V903vz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2403150021
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

As we are patching instructions, we can assume the length is a multiple
of 4 and the destination address is aligned.

Atomicity of patching a prefixed instruction is not a concern, as the
original implementation doesn't provide it anyway.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/lib/code-patching.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c6633759b509..ed450a32918c 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -394,10 +394,10 @@ static int patch_memset32(u32 *addr, u32 val, size_t count)
 	return -EPERM;
 }
 
-static int patch_memcpy(void *dst, void *src, size_t len)
+static int patch_memcpy32(u32 *dst, u32 *src, size_t count)
 {
-	for (void *end = src + len; src < end; dst++, src++)
-		__put_kernel_nofault(dst, src, u8, failed);
+	for (u32 *end = src + count; src < end; dst++, src++)
+		__put_kernel_nofault(dst, src, u32, failed);
 
 	return 0;
 
@@ -424,7 +424,7 @@ static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool rep
 			err = patch_memset32(patch_addr, val, len / 4);
 		}
 	} else {
-		err = patch_memcpy(patch_addr, code, len);
+		err = patch_memcpy32(patch_addr, code, len / 4);
 	}
 
 	smp_wmb();	/* smp write barrier */
-- 
2.44.0

