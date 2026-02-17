Return-Path: <linuxppc-dev+bounces-16900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id a05nAOZilGmlDQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 13:45:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A114C17C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 13:45:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFfW52lV4z307K;
	Tue, 17 Feb 2026 23:45:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771332321;
	cv=none; b=bQyXOGxdjCQOMjFrCyBJGu/W2ld5F40WXm7v55jkatjcFZ7iUggz8OYsuVSCAcdvDMBH/leXdnWPxMy9rb+jTLToxhUhsxCJsrvUFzJtJcuOuS3McaiqmCvkr0RN4NCPdv8dsPEmZfTdB1FHIJ1TgL9sPAveTdh07u+Y4sK7WIRN+lXdN26bcQqG8NUSlNJc8urpWBz0sc4TlxtSUogrLsEA/J0eHkzzP2bjFXk0Lf8wRQZdTBhXkS6SspeqocRXLeFk4guvgq5j8yPjnCKPpVOjOElt7/DZeci00Bl0c5PAuKnE3LwSmuQG3QyXTWHYWXiYORAUUqj+TvNHZeSQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771332321; c=relaxed/relaxed;
	bh=yQ6WcvxBkrvOqCusu3moHVsWeda0EDzW49hw4u1fXtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=osM7nz0g4uFwuqfQ2OSR0HDyq1cAYbG4XXdfAN8E+B+/gSOyZ15S3OIuInxuhgX1JMQHvR9hoq/Cj3qzQXDyCxhxwzQAtBdpC3D6vAY6Sy9M7fF5suqcSy3TYQfyoXVWrbH24rFTnJ3O94Tcs3jULJZ7draxYVl+QvB7xFkcFPHgyizI5wsoxb3LdzQeaYttD+d1XzoltuWyzUcbMXo2y0zdPWC6VAo1YSr3+8CqGQ35crlrRO+pbxh+Bchjgc14CDlt0KZO/8yG+WI0WsbcAk6B6itQaxKlDYGDj4zIdC8rPp44krxD0nZdrNDaNka2cnPN4Q9NJGDssAyNl1gZOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qBLQbKKx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qBLQbKKx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFfW36hWgz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 23:45:19 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H4qmnr3400802;
	Tue, 17 Feb 2026 12:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=yQ6WcvxBkrvOqCusu3moHVsWeda0EDzW49hw4u1fX
	tQ=; b=qBLQbKKx1fA4SvfDLBpk2e3922ZndC+b7PzBkKv0OVkYYNDzOeTrAY2Dq
	wySzkiIXH9jeWfBhxqmgfeub6/lLwfG/442Ylel0CNpNg6A46h9K7awJlxSRwdX1
	XsE5H63zWZ7l7z/iLOuA+9tnkdyfsz9DEhjPJy4MbzyHD+E3OsVWpEaMY6zWzXyp
	qo29BUhWgY4embZalXJTOB2zFGvuFAMCLVSOhrhGgCErYoDVdCzKbqiyX/wXiiBq
	pIzAbro/1EA1j3QHY5OG9pxL3Amdi8tVYVwzye+1JmXCZ7KGOIiReI8hM75eo8GZ
	Nngi7PSblfGv7p7S4x8/nESigDO9Q==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj6ruv7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 12:45:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61H8h2fn011916;
	Tue, 17 Feb 2026 12:45:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb26te78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 12:45:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61HCj9kO57409914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 12:45:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D54BE200A9;
	Tue, 17 Feb 2026 12:45:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AAF3200A6;
	Tue, 17 Feb 2026 12:45:08 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.in.ibm.com (unknown [9.109.243.201])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Feb 2026 12:45:08 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, chleroy@kernel.org,
        riteshh@linux.ibm.com, sayalip@linux.ibm.com
Subject: [PATCH 1/2] powerpc: fix KUAP warning in VMX usercopy path
Date: Tue, 17 Feb 2026 18:14:56 +0530
Message-ID: <20260217124457.89219-1-sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dvvWylg4 c=1 sm=1 tr=0 ts=699462db cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=C_LAFBNYVrejb_jBWv0A:9
X-Proofpoint-GUID: NmFiq5YxCYJg-OXlv2TOeg-jU8TKxLtr
X-Proofpoint-ORIG-GUID: NmFiq5YxCYJg-OXlv2TOeg-jU8TKxLtr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNSBTYWx0ZWRfXx2Ta6oDL2Qt8
 Aq5z/5TsTg3cMCZtBTMjpqi+2IpnFfYsgXp29U9Gd7hEZvIygWUCF9cbAjBXatF3AMsKk8QL/D+
 KKX3VozfM2uLURbIuGFrXL203ei1xz3O2uO5DW8Bi0jBpTIKb0fCAkZHdAGlvvWM1mNMy9KX83K
 UifYYxzsQZc9MqsJm1pclA6GbpZPNFSy5DBMAO3LiXXbYNd866N1ltLvnNvDvPhCC83C6TNmgxD
 9TA07lYlTcWCPCugTwY8lWw5zgC9d0FdBgQ6d0vWNnnzpoEQZ43KiHeJS3wQ9qqFsulppa2Bn78
 cAuuKIK60t847Vdxk5scaxa3AGQGz5ryB8oA7AOEOFg+C1MeS9I1HaU5NKV8oCwVauUase4BZXO
 kLDQ+n9lDJEGByG+1TmUux6B6oBfg3qkMgr6TtcZ4F/EaOZ6TA5nR8kBFIljsLQUOn5QYtahSN7
 Jtd7gFgbQpt6iPy0Fcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170105
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-16900-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A33A114C17C
X-Rspamd-Action: no action

On powerpc with PREEMPT_FULL or PREEMPT_LAZY and function tracing enabled,
KUAP warnings can be triggered from the VMX usercopy path under memory
stress workloads.

KUAP requires that no subfunctions are called once userspace access has
been enabled. The existing VMX copy implementation violates this
requirement by invoking enter_vmx_usercopy() from the assembly path after
userspace access has already been enabled. If preemption occurs
in this window, the AMR state may not be preserved correctly,
leading to unexpected userspace access state and resulting in
KUAP warnings.

Fix this by moving VMX selection and enter_vmx_usercopy()/
exit_vmx_usercopy() handling into the raw_copy_{to,from,in}_user()
wrappers in uaccess.h. The new flow is:

  - Decide whether to use the VMX path based on size and CPU capability
  - Call enter_vmx_usercopy() before enabling userspace access
  - Enable userspace access and perform the VMX copy
  - Disable userspace access
  - Call exit_vmx_usercopy()
  - Fall back to the base copy routine if the VMX copy faults

With this change, the VMX assembly routines no longer perform VMX state
management or call helper functions; they only implement the
copy operations.
The previous feature-section based VMX selection inside
__copy_tofrom_user_power7() is removed, and a dedicated
__copy_tofrom_user_power7_vmx() entry point is introduced.

This ensures correct KUAP ordering, avoids subfunction calls
while KUAP is unlocked, and eliminates the warnings while preserving
the VMX fast path.

Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Closes: https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/
Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 arch/powerpc/include/asm/uaccess.h | 67 ++++++++++++++++++++++++++++++
 arch/powerpc/lib/copyuser_64.S     |  1 +
 arch/powerpc/lib/copyuser_power7.S | 45 +++++++-------------
 arch/powerpc/lib/vmx-helper.c      |  2 +
 4 files changed, 85 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 784a00e681fa..52e4a784d148 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -13,6 +13,11 @@
 #define TASK_SIZE_MAX		TASK_SIZE_USER64
 #endif
 
+#ifdef CONFIG_ALTIVEC
+/* Threshold above which VMX copy path is used */
+#define VMX_COPY_THRESHOLD 3328
+#endif
+
 #include <asm-generic/access_ok.h>
 
 /*
@@ -323,12 +328,42 @@ do {								\
 extern unsigned long __copy_tofrom_user(void __user *to,
 		const void __user *from, unsigned long size);
 
+extern unsigned long __copy_tofrom_user_base(void __user *to,
+		const void __user *from, unsigned long size);
+
+#ifdef CONFIG_ALTIVEC
+extern unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
+		const void __user *from, unsigned long size);
+
+static inline bool will_use_vmx(unsigned long n)
+{
+	return cpu_has_feature(CPU_FTR_VMX_COPY) &&
+		n > VMX_COPY_THRESHOLD;
+}
+#endif
+
 #ifdef __powerpc64__
 static inline unsigned long
 raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
 {
 	unsigned long ret;
 
+#ifdef CONFIG_ALTIVEC
+	if (will_use_vmx(n) && enter_vmx_usercopy()) {
+		allow_read_write_user(to, from, n);
+		ret = __copy_tofrom_user_power7_vmx(to, from, n);
+		prevent_read_write_user(to, from, n);
+		exit_vmx_usercopy();
+		if (unlikely(ret)) {
+			allow_read_write_user(to, from, n);
+			ret = __copy_tofrom_user_base(to, from, n);
+			prevent_read_write_user(to, from, n);
+		}
+
+		return ret;
+	}
+#endif
+
 	allow_read_write_user(to, from, n);
 	ret = __copy_tofrom_user(to, from, n);
 	prevent_read_write_user(to, from, n);
@@ -341,6 +376,22 @@ static inline unsigned long raw_copy_from_user(void *to,
 {
 	unsigned long ret;
 
+#ifdef CONFIG_ALTIVEC
+	if (will_use_vmx(n) && enter_vmx_usercopy()) {
+		allow_read_from_user(from, n);
+		ret = __copy_tofrom_user_power7_vmx((__force void __user *)to, from, n);
+		prevent_read_from_user(from, n);
+		exit_vmx_usercopy();
+		if (unlikely(ret)) {
+			allow_read_from_user(from, n);
+			ret = __copy_tofrom_user_base((__force void __user *)to, from, n);
+			prevent_read_from_user(from, n);
+		}
+
+		return ret;
+	}
+#endif
+
 	allow_read_from_user(from, n);
 	ret = __copy_tofrom_user((__force void __user *)to, from, n);
 	prevent_read_from_user(from, n);
@@ -352,6 +403,22 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	unsigned long ret;
 
+#ifdef CONFIG_ALTIVEC
+	if (will_use_vmx(n) && enter_vmx_usercopy()) {
+		allow_write_to_user(to, n);
+		ret = __copy_tofrom_user_power7_vmx(to, (__force const void __user *)from, n);
+		prevent_write_to_user(to, n);
+		exit_vmx_usercopy();
+		if (unlikely(ret)) {
+			allow_write_to_user(to, n);
+			ret = __copy_tofrom_user_base(to, (__force const void __user *)from, n);
+			prevent_write_to_user(to, n);
+		}
+
+		return ret;
+	}
+#endif
+
 	allow_write_to_user(to, n);
 	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
 	prevent_write_to_user(to, n);
diff --git a/arch/powerpc/lib/copyuser_64.S b/arch/powerpc/lib/copyuser_64.S
index 9af969d2cc0c..25a99108caff 100644
--- a/arch/powerpc/lib/copyuser_64.S
+++ b/arch/powerpc/lib/copyuser_64.S
@@ -562,3 +562,4 @@ exc;	std	r10,32(3)
 	li	r5,4096
 	b	.Ldst_aligned
 EXPORT_SYMBOL(__copy_tofrom_user)
+EXPORT_SYMBOL(__copy_tofrom_user_base)
diff --git a/arch/powerpc/lib/copyuser_power7.S b/arch/powerpc/lib/copyuser_power7.S
index 8474c682a178..17dbcfbae25f 100644
--- a/arch/powerpc/lib/copyuser_power7.S
+++ b/arch/powerpc/lib/copyuser_power7.S
@@ -5,13 +5,9 @@
  *
  * Author: Anton Blanchard <anton@au.ibm.com>
  */
+#include <linux/export.h>
 #include <asm/ppc_asm.h>
 
-#ifndef SELFTEST_CASE
-/* 0 == don't use VMX, 1 == use VMX */
-#define SELFTEST_CASE	0
-#endif
-
 #ifdef __BIG_ENDIAN__
 #define LVS(VRT,RA,RB)		lvsl	VRT,RA,RB
 #define VPERM(VRT,VRA,VRB,VRC)	vperm	VRT,VRA,VRB,VRC
@@ -47,10 +43,14 @@
 	ld	r15,STK_REG(R15)(r1)
 	ld	r14,STK_REG(R14)(r1)
 .Ldo_err3:
-	bl	CFUNC(exit_vmx_usercopy)
+	ld      r6,STK_REG(R31)(r1)	/* original destination pointer */
+	ld      r5,STK_REG(R29)(r1)	/* original number of bytes */
+	subf    r7,r6,r3		/* #bytes copied */
+	subf    r3,r7,r5		/* #bytes not copied in r3 */
 	ld	r0,STACKFRAMESIZE+16(r1)
 	mtlr	r0
-	b	.Lexit
+	addi    r1,r1,STACKFRAMESIZE
+	blr
 #endif /* CONFIG_ALTIVEC */
 
 .Ldo_err2:
@@ -74,7 +74,6 @@
 
 _GLOBAL(__copy_tofrom_user_power7)
 	cmpldi	r5,16
-	cmpldi	cr1,r5,3328
 
 	std	r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
 	std	r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
@@ -82,12 +81,6 @@ _GLOBAL(__copy_tofrom_user_power7)
 
 	blt	.Lshort_copy
 
-#ifdef CONFIG_ALTIVEC
-test_feature = SELFTEST_CASE
-BEGIN_FTR_SECTION
-	bgt	cr1,.Lvmx_copy
-END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
-#endif
 
 .Lnonvmx_copy:
 	/* Get the source 8B aligned */
@@ -263,23 +256,14 @@ err1;	stb	r0,0(r3)
 15:	li	r3,0
 	blr
 
-.Lunwind_stack_nonvmx_copy:
-	addi	r1,r1,STACKFRAMESIZE
-	b	.Lnonvmx_copy
-
-.Lvmx_copy:
 #ifdef CONFIG_ALTIVEC
+_GLOBAL(__copy_tofrom_user_power7_vmx)
 	mflr	r0
 	std	r0,16(r1)
 	stdu	r1,-STACKFRAMESIZE(r1)
-	bl	CFUNC(enter_vmx_usercopy)
-	cmpwi	cr1,r3,0
-	ld	r0,STACKFRAMESIZE+16(r1)
-	ld	r3,STK_REG(R31)(r1)
-	ld	r4,STK_REG(R30)(r1)
-	ld	r5,STK_REG(R29)(r1)
-	mtlr	r0
 
+	std     r3,STK_REG(R31)(r1)
+	std     r5,STK_REG(R29)(r1)
 	/*
 	 * We prefetch both the source and destination using enhanced touch
 	 * instructions. We use a stream ID of 0 for the load side and
@@ -300,8 +284,6 @@ err1;	stb	r0,0(r3)
 
 	DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
 
-	beq	cr1,.Lunwind_stack_nonvmx_copy
-
 	/*
 	 * If source and destination are not relatively aligned we use a
 	 * slower permute loop.
@@ -478,7 +460,8 @@ err3;	lbz	r0,0(r4)
 err3;	stb	r0,0(r3)
 
 15:	addi	r1,r1,STACKFRAMESIZE
-	b	CFUNC(exit_vmx_usercopy)	/* tail call optimise */
+	li r3,0
+	blr
 
 .Lvmx_unaligned_copy:
 	/* Get the destination 16B aligned */
@@ -681,5 +664,7 @@ err3;	lbz	r0,0(r4)
 err3;	stb	r0,0(r3)
 
 15:	addi	r1,r1,STACKFRAMESIZE
-	b	CFUNC(exit_vmx_usercopy)	/* tail call optimise */
+	li r3,0
+	blr
+EXPORT_SYMBOL(__copy_tofrom_user_power7_vmx)
 #endif /* CONFIG_ALTIVEC */
diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
index 54340912398f..554b248002b4 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -27,6 +27,7 @@ int enter_vmx_usercopy(void)
 
 	return 1;
 }
+EXPORT_SYMBOL(enter_vmx_usercopy);
 
 /*
  * This function must return 0 because we tail call optimise when calling
@@ -49,6 +50,7 @@ int exit_vmx_usercopy(void)
 		set_dec(1);
 	return 0;
 }
+EXPORT_SYMBOL(exit_vmx_usercopy);
 
 int enter_vmx_ops(void)
 {
-- 
2.52.0


