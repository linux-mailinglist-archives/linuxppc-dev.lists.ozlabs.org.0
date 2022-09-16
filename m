Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 865C55BA663
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:38:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNCK48ldz3fPy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:38:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e0H12GKq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e0H12GKq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5k3c15z3bcF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:28 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5UwNL036073;
	Fri, 16 Sep 2022 05:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=F5RCjTbl8eaCGqYmijhJED9sLYlEDFAE7HYDEVUzdNI=;
 b=e0H12GKqHLw9z+mU1LDGmldh/qpdfzSnWluJ9enremAWsDitKwr/Hk1hkulaFYDSEYu/
 jBgNZ2H5SKRV0hj9vhbF1Oo1z+qQ0CwQA4b1j0ff8/9zr0U99W2eZH2XuFSzE/Ii7vLg
 qVFap79FkLp2Iv21V0JGjf7602OeA31uxwye/IMe4OlmIr+/a64yDUFN1AdftkK0MA3J
 OuFjEAlqQPuDaiOQ4w3dOvYwfv3xfQMvl6zLpSt4vPNhSg2fgpH7TIP6bQsHkJXf86bg
 JfP+MgQN62r5rZXsuc+lbCL4zOdcFjZTHiebsE6S9VeVOcZRv2EvMRKa5i6v569+m3Od Kw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2kr1mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5Kjxj021863;
	Fri, 16 Sep 2022 05:33:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3jm921gh8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5Xhl414877032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67D44A4040;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1284BA4051;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 597F660539;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/23] asm-generic: compat: Support BE for long long args in 32-bit ABIs
Date: Fri, 16 Sep 2022 15:32:46 +1000
Message-Id: <20220916053300.786330-10-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AfYL7YSoEVhwDtv_EMYwGnfqKZ7GmvCk
X-Proofpoint-ORIG-GUID: AfYL7YSoEVhwDtv_EMYwGnfqKZ7GmvCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=882 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160041
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

32-bit ABIs support passing 64-bit integers by registers via argument
translation. Commit 59c10c52f573 ("riscv: compat: syscall: Add
compat_sys_call_table implementation") implements the compat_arg_u64
macro for efficiently defining little endian compatibility syscalls.

Architectures supporting big endianness may benefit from reciprocal
argument translation, but are welcome also to implement their own.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V4 -> V5: New patch.
---
 include/asm-generic/compat.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/compat.h b/include/asm-generic/compat.h
index d06308a2a7a8..aeb257ad3d1a 100644
--- a/include/asm-generic/compat.h
+++ b/include/asm-generic/compat.h
@@ -14,12 +14,17 @@
 #define COMPAT_OFF_T_MAX	0x7fffffff
 #endif
 
-#if !defined(compat_arg_u64) && !defined(CONFIG_CPU_BIG_ENDIAN)
+#ifndef compat_arg_u64
+#ifdef CONFIG_CPU_BIG_ENDIAN
 #define compat_arg_u64(name)		u32  name##_lo, u32  name##_hi
 #define compat_arg_u64_dual(name)	u32, name##_lo, u32, name##_hi
+#else
+#define compat_arg_u64(name)		u32  name##_hi, u32  name##_lo
+#define compat_arg_u64_dual(name)	u32, name##_hi, u32, name##_lo
+#endif
 #define compat_arg_u64_glue(name)	(((u64)name##_lo & 0xffffffffUL) | \
 					 ((u64)name##_hi << 32))
-#endif
+#endif /* compat_arg_u64 */
 
 /* These types are common across all compat ABIs */
 typedef u32 compat_size_t;
-- 
2.34.1

