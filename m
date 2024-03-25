Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFBD888ED0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:29:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E9twj+/8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V31hT0PQyz3dmy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:29:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E9twj+/8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V31gm6XZLz2yGk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:28:52 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P4TIEi005764;
	Mon, 25 Mar 2024 05:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/GH65EX4JuT8WWcJRhz97O1bNg+rHUXNCgNcQ4qMfeo=;
 b=E9twj+/8TKjo+t3BUcQLkSWkrN+ug57hCvHZFs6y7MgVILoN/JFx6bqfqmFZlcDCpWUA
 g45SF1wsYz1gLp9PZFDlVpnVqGNgrk2HTc7dmbk96V0wAqxcOX04HogJDurI6YklvvAW
 qjcnuB/52xpe1WZGS1HI+D/n3Lahk1/2UmjIOFJS68lPqp+4G2TTc9AdVvgGS3C25JWE
 emJDHaieOwYgRYk8I6GZMMZzj8BXAggyFNHAAn6Qav+QCjSjvI6mQyrh/Gz2sbVR1jCl
 H1za9fnCl0kQ0h+anjAJZiHwnMEN9I1X2cdA3n34FbyGZatsGDw8cFx7qRMeZEdRGlHM Og== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x2gadhmx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:28:44 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P3giRn011233;
	Mon, 25 Mar 2024 05:28:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2bmkpkvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:28:43 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P5Sd3x52101592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:28:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C95EF2004B;
	Mon, 25 Mar 2024 05:28:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 543CC20040;
	Mon, 25 Mar 2024 05:28:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:28:39 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 661CB60429;
	Mon, 25 Mar 2024 16:28:36 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/code-patching: Use dedicated memory routines for patching
Date: Mon, 25 Mar 2024 16:28:15 +1100
Message-ID: <20240325052815.854044-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325052815.854044-1-bgray@linux.ibm.com>
References: <20240325052815.854044-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Rq6Ude6MiOQUNu-WOdBRixhscxcSDTFD
X-Proofpoint-ORIG-GUID: Rq6Ude6MiOQUNu-WOdBRixhscxcSDTFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_02,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=625 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250029
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

The patching page set up as a writable alias may be in quadrant 0
(userspace) if the temporary mm path is used. This causes sanitiser
failures if so. Sanitiser failures also occur on the non-mm path
because the plain memset family is instrumented, and KASAN treats the
patching window as poisoned.

Introduce locally defined patch_* variants of memset that perform an
uninstrumented lower level set, as well as detecting write errors like
the original single patch variant does.

copy_to_user() is not correct here, as the PTE makes it a proper kernel
page (the EAA is privileged access only, RW). It just happens to be in
quadrant 0 because that's the hardware's mechanism for using the current
PID vs PID 0 in translations. Importantly, it's incorrect to allow user
page accesses.

Now that the patching memsets are used, we also propagate a failure up
to the caller as the single patch variant does.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v2: * Fix typo in EAA (from EEA)
    * Fix references to quadrant number (0, not 1)
    * Use copy_to_kernel_nofault() over custom memcpy
    * Drop custom memcpy optimisation patch
---
 arch/powerpc/lib/code-patching.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c6ab46156cda..df64343b9214 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -372,9 +372,32 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
 }
 NOKPROBE_SYMBOL(patch_instruction);
 
+static int patch_memset64(u64 *addr, u64 val, size_t count)
+{
+	for (u64 *end = addr + count; addr < end; addr++)
+		__put_kernel_nofault(addr, &val, u64, failed);
+
+	return 0;
+
+failed:
+	return -EPERM;
+}
+
+static int patch_memset32(u32 *addr, u32 val, size_t count)
+{
+	for (u32 *end = addr + count; addr < end; addr++)
+		__put_kernel_nofault(addr, &val, u32, failed);
+
+	return 0;
+
+failed:
+	return -EPERM;
+}
+
 static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool repeat_instr)
 {
 	unsigned long start = (unsigned long)patch_addr;
+	int err;
 
 	/* Repeat instruction */
 	if (repeat_instr) {
@@ -383,19 +406,19 @@ static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool rep
 		if (ppc_inst_prefixed(instr)) {
 			u64 val = ppc_inst_as_ulong(instr);
 
-			memset64((u64 *)patch_addr, val, len / 8);
+			err = patch_memset64((u64 *)patch_addr, val, len / 8);
 		} else {
 			u32 val = ppc_inst_val(instr);
 
-			memset32(patch_addr, val, len / 4);
+			err = patch_memset32(patch_addr, val, len / 4);
 		}
 	} else {
-		memcpy(patch_addr, code, len);
+		err = copy_to_kernel_nofault(patch_addr, code, len);
 	}
 
 	smp_wmb();	/* smp write barrier */
 	flush_icache_range(start, start + len);
-	return 0;
+	return err;
 }
 
 /*
-- 
2.44.0

