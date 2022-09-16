Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 300945BA673
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNKG50yWz3fYm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:43:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=agzMcjeC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=agzMcjeC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5l2YjTz3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:30 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5VKP8004180;
	Fri, 16 Sep 2022 05:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ruZsaTCsVcjyXtcsM0nUJNNvbRXrLKX2sgcKzuQ4Cmc=;
 b=agzMcjeCCHoPE+VW33YBCRm7psgK9QhMfPj6nQdm2UDUYD1FACc9YqMzEypXP+yfpE71
 vysSQAXvocf6InJJ+3DpaQU0TLL6j6Gn/gD3DM1PtpBb1TrJiyM1EMrDApU8085TRHKK
 O775I7DaPpn8ySHYlVRunPnKOLeuhRzZVUN1fnKz7NA7I+RqwEECtv0CF3ZdE139rqPV
 aISCnwzVIil/DT7hKiF7Us5vp4DjAEd7NNylNiytVffoZCBOXlRaENU+u8qb0uUoQu54
 zyTMMp9rQqE7kgg4NRhypYNjGSJTKD6XDYYPoSPspkPwWV52F3ufQ/6BBM9OWcp2Be21 1A== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2f81xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:23 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5Kpne020720;
	Fri, 16 Sep 2022 05:33:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma01fra.de.ibm.com with ESMTP id 3jm9168cgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XIY741288064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 663B111C050;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1228F11C052;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5F6C16050B;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/23] powerpc: Use generic fallocate compatibility syscall
Date: Fri, 16 Sep 2022 15:32:47 +1000
Message-Id: <20220916053300.786330-11-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 270sra3677XnUESH2n7UIZyWXA-jBto0
X-Proofpoint-GUID: 270sra3677XnUESH2n7UIZyWXA-jBto0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 mlxlogscore=710 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160041
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc fallocate compat syscall handler is identical to the
generic implementation provided by commit 59c10c52f573f ("riscv:
compat: syscall: Add compat_sys_call_table implementation"), and as
such can be removed in favour of the generic implementation.

A future patch series will replace more architecture-defined syscall
handlers with generic implementations, dependent on introducing generic
implementations that are compatible with powerpc and arm's parameter
reorderings.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Remove arch-specific fallocate handler.
V2 -> V3: Remove generic fallocate prototype. Move to beginning of
series.
V4 -> V5: Remove implementation as well which I somehow failed to do.
Replace local BE compat_arg_u64 with generic.
---
 arch/powerpc/include/asm/syscalls.h | 2 --
 arch/powerpc/include/asm/unistd.h   | 1 +
 arch/powerpc/kernel/sys_ppc32.c     | 7 -------
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 16b668515d15..960b3871db72 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -51,8 +51,6 @@ compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offset2, u3
 int compat_sys_truncate64(const char __user *path, u32 reg4,
 			  unsigned long len1, unsigned long len2);
 
-long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2, u32 len1, u32 len2);
-
 int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
 			   unsigned long len2);
 
diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
index b1129b4ef57d..659a996c75aa 100644
--- a/arch/powerpc/include/asm/unistd.h
+++ b/arch/powerpc/include/asm/unistd.h
@@ -45,6 +45,7 @@
 #define __ARCH_WANT_SYS_UTIME
 #define __ARCH_WANT_SYS_NEWFSTATAT
 #define __ARCH_WANT_COMPAT_STAT
+#define __ARCH_WANT_COMPAT_FALLOCATE
 #define __ARCH_WANT_COMPAT_SYS_SENDFILE
 #endif
 #define __ARCH_WANT_SYS_FORK
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index ba363328da2b..d961634976d8 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -79,13 +79,6 @@ int compat_sys_truncate64(const char __user * path, u32 reg4,
 	return ksys_truncate(path, merge_64(len1, len2));
 }
 
-long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
-				     u32 len1, u32 len2)
-{
-	return ksys_fallocate(fd, mode, merge_64(offset1, offset2),
-			     merge_64(len1, len2));
-}
-
 int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
 				 unsigned long len2)
 {
-- 
2.34.1

