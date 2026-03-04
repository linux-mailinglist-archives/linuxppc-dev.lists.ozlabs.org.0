Return-Path: <linuxppc-dev+bounces-17661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI8YGZ7Ep2mYjgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 06:35:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F541FADFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 06:35:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQhG24CkVz3btS;
	Wed, 04 Mar 2026 16:35:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772602522;
	cv=none; b=JVDOLtRr3sQDwIHihkvsh+3twGIHdDnef2VBPfK4kqvY4cZ84Sq1uaK9+bpA7aKOtufoPSZy8fIUJFpwFXNLYfBMW6ON7tkcO5TUr8dNQvCfR6dIak9HWJ7aS6Wa553JhEy4VR3YRRU0WmgnOxQjWOqP1rVCr8aA5bhPxtLaWb+ibXJs/TvE+2yxoPDHX4Y72OFrQgGuabHfQG8cEcFRei2qaxhGwFVX0RaCWGdhpq2T8c2ak+cMVgnKtXDiCDWAY7nKzh9BprgMRL1wQzPXdlC0HJy0qA72JdeYEv/yWGj9TXWkpuIAQ2CLWKSCisaGBBiyh0RoID3/a+ycT4sIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772602522; c=relaxed/relaxed;
	bh=MVsP5A2QTl6gutGwDrXQ5cfp1+9S4FQwaZFeJJt7e7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6ZzWVGE9dju6dbv5v/rwjwtjqdHG4vI7Rcerf+px/2rJseagsz3mVO+fJL03umbVL1xV28OmYdILDUutXgRhJRtuoQvsOlk5KYACnLkM3KKnvkh0eC/d6T8v8YVim6QrgoqA6tuNeT+GTsR7e0waIliFpMcRA9x4Jg6HGEDnYn2oD2aJ4ovT1IafMKW0rxZw3Ul6xJHRufoUCev/VBFKoVgYazH3WbxjiTlhz5qsj0F9kE6dmdUY/hxH0QRcYcBwPJyxjQDKnOFHaCn3RzSr6SQqdgmXEaiFTlUypJbc9XDAMO5f0AsDXkpzd44ZhpkUlPWGgZbv36LeadhPqrL9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YH6/JNDK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YH6/JNDK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQhG13hjNz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 16:35:21 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623EEspO589479;
	Wed, 4 Mar 2026 05:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=MVsP5A2QTl6gutGwDrXQ5cfp1+9S4FQwaZFeJJt7e
	7Q=; b=YH6/JNDKVyreaduGncCb2YfZbxvOo/QPlN5+DMfpsbtOF4M5wzpkntgSD
	euVkQC0IIAoOo5yZb70M7kmxt7QFMPXJHTg2s4hi/XXIDRzvtjoAUsAnPsT2KJDr
	NFCcsJPwYXc0L07McLYcFQ0uuittLa8Qqiosicrqult6ZwllCzRK6qWGUZ/wuscc
	OeJSx17RK8vAjS0fH4hMJ1fJRSQG1pcuKAAFeSd1qxdUxggMKoSg1nVN2WA59Kgh
	7kJ1oVgNn32z+6MTz+VH4Shb/R7r11/m5dHwFOckiFUmCuy/53ulKnqAA91lSRoB
	40pUcH5WTcS7CXPjtcuQHBtxdTG2A==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssmnq7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 05:35:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62443RZd029748;
	Wed, 4 Mar 2026 05:35:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmaps5hnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 05:35:14 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6245ZAR746530982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Mar 2026 05:35:10 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0CED2004B;
	Wed,  4 Mar 2026 05:35:10 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F32F20043;
	Wed,  4 Mar 2026 05:35:08 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.ibm.com.com (unknown [9.124.213.19])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Mar 2026 05:35:08 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, chleroy@kernel.org,
        riteshh@linux.ibm.com, hbathini@linux.ibm.com, ming.lei@redhat.com,
        csander@purestorage.com, czhong@redhat.com, venkat88@linux.ibm.com
Subject: [PATCH v3 1/2] powerpc: fix KUAP warning in VMX usercopy path
Date: Wed,  4 Mar 2026 11:05:05 +0530
Message-ID: <20260304053506.118632-1-sayalip@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0MCBTYWx0ZWRfXxfQUq1AHctZR
 tZ0YIBV6snjG/wknPpMb/d5qqrWcIwhdmublLCtR7C3vjUpmFSXm9xVSBSiayKVrDxX66Y8hSxI
 GONq5YUY51v2d6c+eT+URv2zF+kAQVPBKG8N5MrQsdEJJM9lIUMKbJrO23cLBZ4Sl3eyYhoJzSA
 dG0eN27EbEFvV4gG3pOaL45eWZkBN80mQzi+N0LSPKzFPuzR5Pw87KZXUN0CouydkzjkQ3KYCNy
 bceHKtgUYS+jBNtNoWdBrXcxBGlT+yYaJY0laxwDSEhbjP3znEzU6WFjj9QzOAaZ77aXHPf0imL
 TdUamw+BmfXk2aOmVdtPHYG1jHDaSQMMDJrV0KFR2S39HlM5i0SeAFcrNXswH+XxJdeBZ+6u0vM
 m4qQ8Xe6yY9W1nFvR/rRN7bqhzE66ZVbkk6fIbQG16Tiau4u8QH3CS5MtCA+SIeB3QEYFRKOBEg
 S32NRh3iM3dzFh4UVZg==
X-Proofpoint-ORIG-GUID: 7MiLJC6cg_ykEkfAEOBCWLeT2QqB9MAk
X-Proofpoint-GUID: 7MiLJC6cg_ykEkfAEOBCWLeT2QqB9MAk
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69a7c493 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=QcROn1ASnTv-O_F-Y80A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040040
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 37F541FADFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-17661-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
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

Fix this by restructuring the VMX usercopy flow so that VMX selection
and VMX state management are centralized in raw_copy_tofrom_user(),
which is invoked by the raw_copy_{to,from,in}_user() wrappers.

The new flow is:

  - raw_copy_{to,from,in}_user() calls raw_copy_tofrom_user()
  - raw_copy_tofrom_user() decides whether to use the VMX path
    based on size and CPU capability
  - Call enter_vmx_usercopy() before enabling userspace access
  - Enable userspace access as per the copy direction
    and perform the VMX copy
  - Disable userspace access as per the copy direction
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
Suggested-by: Christophe Leroy <chleroy@kernel.org>
Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---

v2->v3
  - Addressd as per review feedback by removing usercopy_mode enum
    and using the copy direction directly for KUAP permission handling.
  - Integrated __copy_tofrom_user_vmx() functionality into
    raw_copy_tofrom_user() in uaccess.h as a static __always_inline
    implementation.
  - Exported enter_vmx_usercopy() and exit_vmx_usercopy()
    to support VMX usercopy handling from the common path.

v2: https://lore.kernel.org/all/20260228135319.238985-1-sayalip@linux.ibm.com/

---
 arch/powerpc/include/asm/uaccess.h | 66 ++++++++++++++++++++++--------
 arch/powerpc/lib/copyuser_64.S     |  1 +
 arch/powerpc/lib/copyuser_power7.S | 45 +++++++-------------
 arch/powerpc/lib/vmx-helper.c      |  2 +
 4 files changed, 66 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index ba1d878c3f40..8fd412671025 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -15,6 +15,9 @@
 #define TASK_SIZE_MAX		TASK_SIZE_USER64
 #endif
 
+/* Threshold above which VMX copy path is used */
+#define VMX_COPY_THRESHOLD 3328
+
 #include <asm-generic/access_ok.h>
 
 /*
@@ -326,40 +329,67 @@ do {								\
 extern unsigned long __copy_tofrom_user(void __user *to,
 		const void __user *from, unsigned long size);
 
-#ifdef __powerpc64__
-static inline unsigned long
-raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
+unsigned long __copy_tofrom_user_base(void __user *to,
+		const void __user *from, unsigned long size);
+
+unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
+		const void __user *from, unsigned long size);
+
+
+static __always_inline bool will_use_vmx(unsigned long n)
+{
+	return IS_ENABLED(CONFIG_ALTIVEC) &&
+		cpu_has_feature(CPU_FTR_VMX_COPY) &&
+		n > VMX_COPY_THRESHOLD;
+}
+
+static __always_inline unsigned long raw_copy_tofrom_user(void __user *to,
+		const void __user *from, unsigned long n,
+		unsigned long dir)
 {
 	unsigned long ret;
 
-	barrier_nospec();
-	allow_user_access(to, KUAP_READ_WRITE);
+	if (will_use_vmx(n) && enter_vmx_usercopy()) {
+		allow_user_access(to, dir);
+		ret = __copy_tofrom_user_power7_vmx(to, from, n);
+		prevent_user_access(dir);
+		exit_vmx_usercopy();
+
+		if (unlikely(ret)) {
+			allow_user_access(to, dir);
+			ret = __copy_tofrom_user_base(to, from, n);
+			prevent_user_access(dir);
+		}
+		return ret;
+	}
+
+	allow_user_access(to, dir);
 	ret = __copy_tofrom_user(to, from, n);
-	prevent_user_access(KUAP_READ_WRITE);
+	prevent_user_access(dir);
 	return ret;
 }
+
+#ifdef __powerpc64__
+static inline unsigned long
+raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
+{
+	barrier_nospec();
+	return raw_copy_tofrom_user(to, from, n, KUAP_READ_WRITE);
+}
 #endif /* __powerpc64__ */
 
 static inline unsigned long raw_copy_from_user(void *to,
 		const void __user *from, unsigned long n)
 {
-	unsigned long ret;
-
-	allow_user_access(NULL, KUAP_READ);
-	ret = __copy_tofrom_user((__force void __user *)to, from, n);
-	prevent_user_access(KUAP_READ);
-	return ret;
+	return raw_copy_tofrom_user((__force void __user *)to, from,
+					n, KUAP_READ);
 }
 
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	unsigned long ret;
-
-	allow_user_access(to, KUAP_WRITE);
-	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
-	prevent_user_access(KUAP_WRITE);
-	return ret;
+	return raw_copy_tofrom_user(to, (__force const void __user *)from,
+					n, KUAP_WRITE);
 }
 
 unsigned long __arch_clear_user(void __user *addr, unsigned long size);
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


