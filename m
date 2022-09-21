Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE885BF6E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTsV73Ntz3f7m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:03:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OTJ+GlGW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OTJ+GlGW;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTlf73z6z3cDs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:58:38 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6jG0A020678;
	Wed, 21 Sep 2022 06:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MyeSrPzlHHPfcQNYUww99wjowkJUCGhNq9LRaeab2h4=;
 b=OTJ+GlGWHsRD70VhW8xRtRdqwees/TezYzRDoFR2cwBQxMLl8VTuTnz1vgz/Xg1BIVWa
 wOng5qDrknXgLX3QlRH/wMyM7NCb2BSvlUlNJpcF7i+DCqCzlUKOjcTiOHwQSRwqvTFg
 PciN8IdqzJ6WTugBw3MTYuXsf5eDHMjzSYDAC+XfMEqfzG2Imj0f0/gF7rnUynx7Q7XW
 gazbQ0t28nO2QWgWIOXZac1YocqYiZVDEjgf9+FvLuTVSTkUjp4YDHVBJ6nRS4mZcxSt
 NFBULYfLgeKAvdy+1uRZ2TWsOuQgMxH9HOe6tchujtKX8EH0JlSw07lhk1Y0sFRkwzR/ Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6twrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:34 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L6nweh006561;
	Wed, 21 Sep 2022 06:58:33 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6twqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:33 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6v011007170;
	Wed, 21 Sep 2022 06:58:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma02fra.de.ibm.com with ESMTP id 3jn5v8ukbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6wT3L33620238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:58:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22202AE051;
	Wed, 21 Sep 2022 06:58:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1CBDAE045;
	Wed, 21 Sep 2022 06:58:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:58:28 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E384960060;
	Wed, 21 Sep 2022 16:58:24 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 09/25] asm-generic: compat: Support BE for long long args in 32-bit ABIs
Date: Wed, 21 Sep 2022 16:55:49 +1000
Message-Id: <20220921065605.1051927-10-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X8qGvdS6wOljpqhoH88yICX8CsbO0G1G
X-Proofpoint-GUID: dCgbA6l3x-nPGiMs60LM0iLsWvfwkura
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=892 clxscore=1011
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Arnd Bergmann <arnd@anrdb.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

32-bit ABIs support passing 64-bit integers by registers via argument
translation. Commit 59c10c52f573 ("riscv: compat: syscall: Add
compat_sys_call_table implementation") implements the compat_arg_u64
macro for efficiently defining little endian compatibility syscalls.

Architectures supporting big endianness may benefit from reciprocal
argument translation, but are welcome also to implement their own.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Arnd Bergmann <arnd@anrdb.de>
---
V5: New patch.
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

