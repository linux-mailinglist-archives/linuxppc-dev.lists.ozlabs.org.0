Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A33187C7C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 03:59:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZjlgGJLc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Twpqz0sVZz3vbQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 13:59:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZjlgGJLc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwppN5nvzz3bPV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 13:58:04 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42F1PFMA009419;
	Fri, 15 Mar 2024 02:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Jlqw/mG5Ai967rF7i7/yv5cLe+OUCDocRv+G7tJTiaE=;
 b=ZjlgGJLc15joDwOgwo2JDPZv+X2zXiTjcmHbyqZT8c3LX2Dqf9QKqDrGt6UjN68IHYmZ
 Rr5erBflYJojK9APjLiHm4MIDwiIp99C6hE3wAYGx63pTMdmxJDZVf3YJdJlggnR1Y/b
 0qgqz7n1bpSUS8Stb9U0X7gDfWN5daBJcaBhzBv3/kPcIxkCoCe3J17/CwvotMqglDSz
 1i3YP50jucaZ2rT+lIytIJY9D3bwupKc0C4ob2lrZsSHOSljEdhvHWGg3Wn1kBO+mcfH
 QQxHb5+ZLdEXBHY3w8Lvz6qH/bNfiffnPgU9sqUvmggyOO7f7rnYCAfK9sKfd6OlMdBL ww== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wv9qaavg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 02:57:59 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42F2kuu3015570;
	Fri, 15 Mar 2024 02:57:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ws2g09duv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 02:57:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42F2vsPd33686006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Mar 2024 02:57:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0ED1520040;
	Fri, 15 Mar 2024 02:57:54 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A6A82004E;
	Fri, 15 Mar 2024 02:57:53 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Mar 2024 02:57:53 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.9.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9855A60366;
	Fri, 15 Mar 2024 13:57:50 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v1 2/3] powerpc/code-patching: Use dedicated memory routines for patching
Date: Fri, 15 Mar 2024 13:57:35 +1100
Message-ID: <20240315025736.404867-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315025736.404867-1-bgray@linux.ibm.com>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wbfc5A0DxdSgkc0k0wbXrNOZNlO4hiZk
X-Proofpoint-GUID: wbfc5A0DxdSgkc0k0wbXrNOZNlO4hiZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=774 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403150021
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

The patching page set up as a writable alias may be in quadrant 1
(userspace) if the temporary mm path is used. This causes sanitiser
failures if so. Sanitiser failures also occur on the non-mm path
because the plain memset family is instrumented, and KASAN treats the
patching window as poisoned.

Introduce locally defined patch_* variants of memset that perform an
uninstrumented lower level set, as well as detecting write errors like
the original single patch variant does.

copy_to_user() is not correct here, as the PTE makes it a proper kernel
page (the EEA is privileged access only, RW). It just happens to be in
quadrant 1 because that's the hardware's mechanism for using the current
PID vs PID 0 in translations. Importantly, it's incorrect to allow user
page accesses.

Now that the patching memsets are used, we also propagate a failure up
to the caller as the single patch variant does.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

The patch_memcpy() can be optimised to 4 bytes at a time assuming the
same requirements as regular instruction patching are being followed
for the 'copy sequence of instructions' mode (i.e., they actually are
instructions following instruction alignment rules).
---
 arch/powerpc/lib/code-patching.c | 42 +++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c6ab46156cda..c6633759b509 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -372,9 +372,43 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
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
+static int patch_memcpy(void *dst, void *src, size_t len)
+{
+	for (void *end = src + len; src < end; dst++, src++)
+		__put_kernel_nofault(dst, src, u8, failed);
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
@@ -383,19 +417,19 @@ static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool rep
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
+		err = patch_memcpy(patch_addr, code, len);
 	}
 
 	smp_wmb();	/* smp write barrier */
 	flush_icache_range(start, start + len);
-	return 0;
+	return err;
 }
 
 /*
-- 
2.44.0

