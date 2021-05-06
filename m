Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D09374E9E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLRX4sBJz3c3G
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:38:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VuuDuCL0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VuuDuCL0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLNN0LwZz2yxj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:35:14 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1464Wpp6129887; Thu, 6 May 2021 00:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=U+x/MLhpAUbzGNlu93fxez6e4QHQiTyfUqkcQIdSBzA=;
 b=VuuDuCL0+0c3WsoldbhbULjGBoHlXzsAeOVCWxiaAxsL4J0duXf+/B/qrJB7eSZYCexU
 bUcAuFQTcCYGcZIFydsp2t2jS7Ay67WbNMcAMh7oIQELgh6qJs6yOFtatFYFLhMxX6rZ
 87MKxbPfYGs9MjBkNDo4RjFQmgEd4pwymyftSgiz5GhsLdZaC3uxoJAjFCToSRNJ4QP+
 BBYwGR6Kc234TDwG0xbCl9jjDCwNmvISW9eEvqYTzjCT27R4wpGBvYvQTRi7D4XcEDGv
 wKkxh6CpV+m+f2pfRkpwpe4Vfvg9NGC1MibaAFQjWk3Ukr+7NGpCdJP2MNUKJRuTFA5g lQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38c9b1g77y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 00:35:09 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1464Y9F6023806;
 Thu, 6 May 2021 04:35:08 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 38bedwh653-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 04:35:07 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1464Z7fp32309672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 04:35:07 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68F20B206A;
 Thu,  6 May 2021 04:35:07 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABD45B206B;
 Thu,  6 May 2021 04:35:06 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.160.168.222])
 by b01ledav003.gho.pok.ibm.com (Postfix) with SMTP;
 Thu,  6 May 2021 04:35:06 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id A2907BC1160;
 Wed,  5 May 2021 23:34:53 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RESEND PATCH v4 05/11] powerpc/64s: Add ability to skip SLB preload
Date: Wed,  5 May 2021 23:34:46 -0500
Message-Id: <20210506043452.9674-6-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210506043452.9674-1-cmr@linux.ibm.com>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hBmmjDjvHBsl-M7jNJR4tZJRLvSqZEvN
X-Proofpoint-ORIG-GUID: hBmmjDjvHBsl-M7jNJR4tZJRLvSqZEvN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_03:2021-05-05,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060029
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switching to a different mm with Hash translation causes SLB entries to
be preloaded from the current thread_info. This reduces SLB faults, for
example when threads share a common mm but operate on different address
ranges.

Preloading entries from the thread_info struct may not always be
appropriate - such as when switching to a temporary mm. Introduce a new
boolean in mm_context_t to skip the SLB preload entirely. Also move the
SLB preload code into a separate function since switch_slb() is already
quite long. The default behavior (preloading SLB entries from the
current thread_info struct) remains unchanged.

Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>

---

v4:  * New to series.
---
 arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
 arch/powerpc/include/asm/mmu_context.h   | 13 ++++++
 arch/powerpc/mm/book3s64/mmu_context.c   |  2 +
 arch/powerpc/mm/book3s64/slb.c           | 56 ++++++++++++++----------
 4 files changed, 50 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/incl=
ude/asm/book3s/64/mmu.h
index eace8c3f7b0a1..b23a9dcdee5af 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -130,6 +130,9 @@ typedef struct {
 	u32 pkey_allocation_map;
 	s16 execute_only_pkey; /* key holding execute-only protection */
 #endif
+
+	/* Do not preload SLB entries from thread_info during switch_slb() */
+	bool skip_slb_preload;
 } mm_context_t;
=20
 static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/includ=
e/asm/mmu_context.h
index 4bc45d3ed8b0e..264787e90b1a1 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -298,6 +298,19 @@ static inline int arch_dup_mmap(struct mm_struct *ol=
dmm,
 	return 0;
 }
=20
+#ifdef CONFIG_PPC_BOOK3S_64
+
+static inline void skip_slb_preload_mm(struct mm_struct *mm)
+{
+	mm->context.skip_slb_preload =3D true;
+}
+
+#else
+
+static inline void skip_slb_preload_mm(struct mm_struct *mm) {}
+
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
 #include <asm-generic/mmu_context.h>
=20
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/boo=
k3s64/mmu_context.c
index c10fc8a72fb37..3479910264c59 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -202,6 +202,8 @@ int init_new_context(struct task_struct *tsk, struct =
mm_struct *mm)
 	atomic_set(&mm->context.active_cpus, 0);
 	atomic_set(&mm->context.copros, 0);
=20
+	mm->context.skip_slb_preload =3D false;
+
 	return 0;
 }
=20
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/sl=
b.c
index c91bd85eb90e3..da0836cb855af 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -441,10 +441,39 @@ static void slb_cache_slbie_user(unsigned int index=
)
 	asm volatile("slbie %0" : : "r" (slbie_data));
 }
=20
+static void preload_slb_entries(struct task_struct *tsk, struct mm_struc=
t *mm)
+{
+	struct thread_info *ti =3D task_thread_info(tsk);
+	unsigned char i;
+
+	/*
+	 * We gradually age out SLBs after a number of context switches to
+	 * reduce reload overhead of unused entries (like we do with FP/VEC
+	 * reload). Each time we wrap 256 switches, take an entry out of the
+	 * SLB preload cache.
+	 */
+	tsk->thread.load_slb++;
+	if (!tsk->thread.load_slb) {
+		unsigned long pc =3D KSTK_EIP(tsk);
+
+		preload_age(ti);
+		preload_add(ti, pc);
+	}
+
+	for (i =3D 0; i < ti->slb_preload_nr; i++) {
+		unsigned char idx;
+		unsigned long ea;
+
+		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
+		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
+
+		slb_allocate_user(mm, ea);
+	}
+}
+
 /* Flush all user entries from the segment table of the current processo=
r. */
 void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 {
-	struct thread_info *ti =3D task_thread_info(tsk);
 	unsigned char i;
=20
 	/*
@@ -502,29 +531,8 @@ void switch_slb(struct task_struct *tsk, struct mm_s=
truct *mm)
=20
 	copy_mm_to_paca(mm);
=20
-	/*
-	 * We gradually age out SLBs after a number of context switches to
-	 * reduce reload overhead of unused entries (like we do with FP/VEC
-	 * reload). Each time we wrap 256 switches, take an entry out of the
-	 * SLB preload cache.
-	 */
-	tsk->thread.load_slb++;
-	if (!tsk->thread.load_slb) {
-		unsigned long pc =3D KSTK_EIP(tsk);
-
-		preload_age(ti);
-		preload_add(ti, pc);
-	}
-
-	for (i =3D 0; i < ti->slb_preload_nr; i++) {
-		unsigned char idx;
-		unsigned long ea;
-
-		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
-		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
-
-		slb_allocate_user(mm, ea);
-	}
+	if (!mm->context.skip_slb_preload)
+		preload_slb_entries(tsk, mm);
=20
 	/*
 	 * Synchronize slbmte preloads with possible subsequent user memory
--=20
2.26.1

