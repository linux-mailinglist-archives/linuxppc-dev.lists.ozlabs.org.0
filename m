Return-Path: <linuxppc-dev+bounces-17452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNZyKmHzomlD8QQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 14:53:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B862A1C35B5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 14:53:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNRVj759Gz3bmc;
	Sun, 01 Mar 2026 00:53:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772286813;
	cv=none; b=lWhjfqPe/Od6kXhttraMsS5+p7MF0wjtHLvbwTf/vDmLuUIgL89Xrpsv6iZIaYKzGR3mWSRedFWsa40ZcH6wJUkIAoMQRQZivDsWTf9lpTMXbFN5nE++OSZtef+CXrGglNa5kWWESo9TrOUUlwWXqkNgr02cUcfQJWqYCUBkzeeT1ZCF+lj9iUqLCgTDAzLVvU9O91QfT8fbbI3JQZa3isrB1n2P2A1RGNBKZQ7gziy87eAvvkjlaIiaMwqleY3QrBRpfe0nA2LQkCjM2nC5MmP7fHqcr+alapOnBx5nLGoyJTGOXccExwyf189B1+7qRV9B6IGpqG0MZBnEdPTm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772286813; c=relaxed/relaxed;
	bh=8274F1BLfHq05BEUeDL+OYK0tbCT74/5mbx5gcZACno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlZoSnYg5rppkDIeeG5R0dV0r+LaKQkZOZslyfvI5fu+8asNKwcfZDw+QzlwKAWurPcuzIzTBzJNKHrYttxMbv8boZp04/Q+EtZK+hypJARDHevCuEdzZfzPPiB62F/2I4XjyBISWalhq2hC0AfOZ9JKh/GUAsmCLXencsjej3fGmtevTJtoI/8Pc5KPL1WKeig097GFARVFXjP+2SAUfKB0hacPXzqS1DYdskh247DWJcwMrGtwgH394HSyRFf9vWeI3BgTDaT3K7niBL90liR3099ORzgEvBKZ7CT1CWVkkFZAnndBmMJ762foiwd9pXdd9Of9cwvaWf2CrzD0NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YY4r+GCv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YY4r+GCv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNRVj0y9xz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 00:53:32 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SB02Z92412397;
	Sat, 28 Feb 2026 13:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=8274F1BLfHq05BEUeDL+OYK0tbCT74/5mbx5gcZAC
	no=; b=YY4r+GCv/TCoC8XtATcHz19Y2luEnJyLeqY8C2a1aG6Ec4CVXYjr/79X3
	P+15BfoOxO3s7wCPMedX8Mz0uRedXT9ICoDh+FMLvMicLkWA4KvvUopRkH//8msV
	sDWpu6gZoySh2MFeQhN+YXmtsKYd2Zy/ArORMbrlTFaA8N57l+KLcB/yk0VcHVrC
	bqBLC4twY8EeawdGpdQ+YAwwGUuaY8YIxo3fBhuf8hP583CSZ1B3bdBciX8XSP8F
	Lae+Ul8pWZFCK7vASBeze6O7dmBexkSlq/m6MHj5SJrPLGQtRPlK/IG2YswdeAW8
	COL0E8WecD9W9AZyOPkxCfuYnPX3g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssm8x7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:53:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61SBE7UP027776;
	Sat, 28 Feb 2026 13:53:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfsr2ejmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:53:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61SDrMnR53281210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Feb 2026 13:53:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD0D620043;
	Sat, 28 Feb 2026 13:53:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C88620040;
	Sat, 28 Feb 2026 13:53:20 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.ibm.com.com (unknown [9.124.210.20])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 28 Feb 2026 13:53:20 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, chleroy@kernel.org,
        riteshh@linux.ibm.com, hbathini@linux.ibm.com, ming.lei@redhat.com,
        csander@purestorage.com, czhong@redhat.com, venkat88@linux.ibm.com
Subject: [PATCH v2 1/2] powerpc: fix KUAP warning in VMX usercopy path
Date: Sat, 28 Feb 2026 19:23:18 +0530
Message-ID: <20260228135319.238985-1-sayalip@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyNiBTYWx0ZWRfXzkwGI5eAK5Vk
 FCAQOoIeRFfwa+rRxsj8oJMczezQ+EWMFDuWaVuWs9eLgMMJWYu3S+opD7dx7Cn0xSpsP8wUyKl
 sz/YUXFLsLji0wQWc0wu7nl0CpgoyzikMUviaSnfwvtY3j9/zavU+uhPFfZP9+cgAKa7eVfSqI0
 6QozuAM8dl8QXNM30/2DxzjA+uguD/smLFx0xHrsjfqau5oysRUU+zKrt8ClVNhXR0u1luSMP2w
 4EnHeERM9xGU0E52CxzpDI4KnCuZdOhnOpbKTfg+sDT6ktli2YEpYs0083MxfVP8aJUc58HNgaS
 84R7Gh9OVfKo7CUfTAg2Ox29n3pGq+34VaEN2gNthOBgs8zELQzXzB/9LCyO9w4Qk0U5ldhB3Q5
 hWvlF9gywxXzay7657KLLpXOvVYeoYQP1S3cyDo6s7RfXh07GTKEZ8kdeK6cvS4dtw59hVBtKiB
 4WsllxfBTLKZnCgDRPQ==
X-Proofpoint-ORIG-GUID: 9qXAll8d44eRN9iE6RNH-PcZ-nXzJsxc
X-Proofpoint-GUID: 9qXAll8d44eRN9iE6RNH-PcZ-nXzJsxc
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69a2f357 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=0c46kXJewe5BxEcfT8EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1011 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280126
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17452-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NEQ_ENVFROM(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B862A1C35B5
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

Introduce a usercopy_mode enum to describe the copy direction
(IN, FROM, TO) and use it to derive the required KUAP permissions.
Userspace access is now enabled and disabled through common helpers
based on the selected mode, ensuring that the correct read/write
permissions are applied consistently.

 The new flow is:

  - raw_copy_{to,from,in}_user() calls raw_copy_tofrom_user()
  - raw_copy_tofrom_user() decides whether to use the VMX path
    based on size and CPU capability
  - Call enter_vmx_usercopy() before enabling userspace access
  - Enable userspace access as per the usercopy mode
    and perform the VMX copy
  - Disable userspace access as per the usercopy mode
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

v1->v2
  - Updated as per the review comments.
  - Centralized VMX usercopy handling in __copy_tofrom_user_vmx() in
    arch/powerpc/lib/vmx-helper.c.
  - Introduced a usercopy_mode enum to describe the copy direction
    (IN, FROM, TO) and derive the required KUAP permissions, avoiding
    duplication across the different usercopy paths.

v1: https://lore.kernel.org/all/20260217124457.89219-1-sayalip@linux.ibm.com/

---
 arch/powerpc/include/asm/uaccess.h | 95 ++++++++++++++++++++++++------
 arch/powerpc/lib/copyuser_64.S     |  1 +
 arch/powerpc/lib/copyuser_power7.S | 45 +++++---------
 arch/powerpc/lib/vmx-helper.c      | 26 ++++++++
 4 files changed, 119 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index ba1d878c3f40..63d6eb8b004e 100644
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
@@ -326,40 +329,96 @@ do {								\
 extern unsigned long __copy_tofrom_user(void __user *to,
 		const void __user *from, unsigned long size);
 
-#ifdef __powerpc64__
-static inline unsigned long
-raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
+enum usercopy_mode {
+	USERCOPY_IN,
+	USERCOPY_FROM,
+	USERCOPY_TO,
+};
+
+unsigned long __copy_tofrom_user_vmx(void __user *to, const void __user *from,
+				unsigned long size, enum usercopy_mode mode);
+
+unsigned long __copy_tofrom_user_base(void __user *to,
+		const void __user *from, unsigned long size);
+
+unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
+		const void __user *from, unsigned long size);
+
+
+static inline bool will_use_vmx(unsigned long n)
+{
+	return IS_ENABLED(CONFIG_ALTIVEC) &&
+		cpu_has_feature(CPU_FTR_VMX_COPY) &&
+		n > VMX_COPY_THRESHOLD;
+}
+
+static inline void raw_copy_allow(void __user *to, enum usercopy_mode mode)
+{
+	switch (mode) {
+	case USERCOPY_IN:
+		allow_user_access(to, KUAP_READ_WRITE);
+		break;
+	case USERCOPY_FROM:
+		allow_user_access(NULL, KUAP_READ);
+		break;
+	case USERCOPY_TO:
+		allow_user_access(to, KUAP_WRITE);
+		break;
+	}
+}
+
+static inline void raw_copy_prevent(enum usercopy_mode mode)
+{
+	switch (mode) {
+	case USERCOPY_IN:
+		prevent_user_access(KUAP_READ_WRITE);
+		break;
+	case USERCOPY_FROM:
+		prevent_user_access(KUAP_READ);
+		break;
+	case USERCOPY_TO:
+		prevent_user_access(KUAP_WRITE);
+		break;
+	}
+}
+
+static inline unsigned long raw_copy_tofrom_user(void __user *to,
+		const void __user *from, unsigned long n,
+		enum usercopy_mode mode)
 {
 	unsigned long ret;
 
-	barrier_nospec();
-	allow_user_access(to, KUAP_READ_WRITE);
+	if (will_use_vmx(n))
+		return __copy_tofrom_user_vmx(to, from,	n, mode);
+
+	raw_copy_allow(to, mode);
 	ret = __copy_tofrom_user(to, from, n);
-	prevent_user_access(KUAP_READ_WRITE);
+	raw_copy_prevent(mode);
 	return ret;
+
+}
+
+#ifdef __powerpc64__
+static inline unsigned long
+raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
+{
+	barrier_nospec();
+	return raw_copy_tofrom_user(to, from, n, USERCOPY_IN);
 }
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
+					n, USERCOPY_FROM);
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
+					n, USERCOPY_TO);
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
index 54340912398f..35080885204b 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -10,6 +10,32 @@
 #include <linux/hardirq.h>
 #include <asm/switch_to.h>
 
+unsigned long __copy_tofrom_user_vmx(void __user *to, const void __user *from,
+			unsigned long size, enum usercopy_mode mode)
+{
+	unsigned long ret;
+
+	if (!enter_vmx_usercopy()) {
+		raw_copy_allow(to, mode);
+		ret = __copy_tofrom_user(to, from, size);
+		raw_copy_prevent(mode);
+		return ret;
+	}
+
+	raw_copy_allow(to, mode);
+	ret = __copy_tofrom_user_power7_vmx(to, from, size);
+	raw_copy_prevent(mode);
+	exit_vmx_usercopy();
+	if (unlikely(ret)) {
+		raw_copy_allow(to, mode);
+		ret = __copy_tofrom_user_base(to, from, size);
+		raw_copy_prevent(mode);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(__copy_tofrom_user_vmx);
+
 int enter_vmx_usercopy(void)
 {
 	if (in_interrupt())
-- 
2.52.0


