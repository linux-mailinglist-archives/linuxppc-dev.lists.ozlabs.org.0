Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBE3F19DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 14:58:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr4ZZ4Lpnz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 22:58:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr4YG2rddz3bW7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 22:57:21 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JCbZaN020435; Thu, 19 Aug 2021 08:57:09 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ahq8hrqqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 08:57:09 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17JClQBd020742;
 Thu, 19 Aug 2021 12:57:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ae53j0aff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 12:57:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17JCv4NG53543362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 12:57:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58B4D4C05A;
 Thu, 19 Aug 2021 12:57:04 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 139C24C04E;
 Thu, 19 Aug 2021 12:57:04 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 19 Aug 2021 12:57:03 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 66247220179;
 Thu, 19 Aug 2021 14:57:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/compat_sys: Declare syscalls
Date: Thu, 19 Aug 2021 14:56:56 +0200
Message-Id: <20210819125656.14498-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819125656.14498-1-clg@kaod.org>
References: <20210819125656.14498-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oSxZXvoTH3BjVbGC4OQIK8bnLPruapvX
X-Proofpoint-ORIG-GUID: oSxZXvoTH3BjVbGC4OQIK8bnLPruapvX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_04:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=714 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108190072
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a compile error with W=3D1.

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/syscalls.h | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
index 398171fdcd9f..1d5f2abaa38a 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -6,6 +6,7 @@
 #include <linux/compiler.h>
 #include <linux/linkage.h>
 #include <linux/types.h>
+#include <linux/compat.h>
=20
 struct rtas_args;
=20
@@ -18,5 +19,35 @@ asmlinkage long sys_mmap2(unsigned long addr, size_t l=
en,
 asmlinkage long ppc64_personality(unsigned long personality);
 asmlinkage long sys_rtas(struct rtas_args __user *uargs);
=20
+#ifdef CONFIG_COMPAT
+unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
+			       unsigned long prot, unsigned long flags,
+			       unsigned long fd, unsigned long pgoff);
+
+compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, co=
mpat_size_t count,
+				  u32 reg6, u32 pos1, u32 pos2);
+
+compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *u=
buf, compat_size_t count,
+				   u32 reg6, u32 pos1, u32 pos2);
+
+compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 off=
set2, u32 count);
+
+asmlinkage int compat_sys_truncate64(const char __user *path, u32 reg4,
+				     unsigned long len1, unsigned long len2);
+
+asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 =
offset2,
+				     u32 len1, u32 len2);
+
+asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigne=
d long len1,
+				      unsigned long len2);
+
+long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
+		     size_t len, int advice);
+
+asmlinkage long compat_sys_sync_file_range2(int fd, unsigned int flags,
+					    unsigned int offset1, unsigned int offset2,
+					    unsigned int nbytes1, unsigned int nbytes2);
+#endif
+
 #endif /* __KERNEL__ */
 #endif /* __ASM_POWERPC_SYSCALLS_H */
--=20
2.31.1

