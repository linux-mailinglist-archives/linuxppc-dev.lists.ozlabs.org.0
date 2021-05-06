Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA4374EA1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:39:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLT334SRz30Cw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:39:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=revk1EqS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=revk1EqS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLNN3jFMz2yyP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:35:14 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1464YSBV143348; Thu, 6 May 2021 00:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=n9LbBqQtBFE4LtmZPU4ioEFuAST+D4KN0WLJyE4a0mw=;
 b=revk1EqSO5J7M8FTll2+sOncLEgzH0TdUqbex6HmvSuFrkVOA0/xZ6bfI0uWVyTRjV1B
 Kw6ZFcWdKbaRhlKkv3GOYM746UIfG8IqReYZYzA5W5lYDBly+FB3+CGIV9cI5xwas9fB
 cprvyhmovYOJiH6FZPqEhGQ25aty0HYBPucoZJIBjsoRf7RBKKpLW7W0dLfLkH7Coc2f
 SxvZix3rHNv7lZbPFpeg3AC3pG5hPwS8mB6LMUnjw1P62qi9p7PU1hQkwXWgvhvVVoaX
 k6t5ffZ7/miakxL35GFDW2FhZEcdb5k17UMaHA8jupCGQ78k6/eUnweOMklGh+3tJITz Pg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38c9dpg53e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 00:35:09 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1464Xq90014545;
 Thu, 6 May 2021 04:35:09 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 38bedr976k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 04:35:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1464Z8K027066688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 04:35:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51FDCBE04F;
 Thu,  6 May 2021 04:35:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 541FDBE054;
 Thu,  6 May 2021 04:35:07 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.160.168.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP;
 Thu,  6 May 2021 04:35:07 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id E40D0BC1EF2;
 Wed,  5 May 2021 23:34:53 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RESEND PATCH v4 10/11] powerpc: Protect patching_mm with a lock
Date: Wed,  5 May 2021 23:34:51 -0500
Message-Id: <20210506043452.9674-11-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210506043452.9674-1-cmr@linux.ibm.com>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8gSdd_q9_77Z83UBv3-mfw91algd6cbr
X-Proofpoint-ORIG-GUID: 8gSdd_q9_77Z83UBv3-mfw91algd6cbr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_03:2021-05-05,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060029
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

Powerpc allows for multiple CPUs to patch concurrently. When patching
with STRICT_KERNEL_RWX a single patching_mm is allocated for use by all
CPUs for the few times that patching occurs. Use a spinlock to protect
the patching_mm from concurrent use.

Modify patch_instruction() to acquire the lock, perform the patch op,
and then release the lock.

Also introduce {lock,unlock}_patching() along with
patch_instruction_unlocked() to avoid per-iteration lock overhead when
patch_instruction() is called in a loop. A follow-up patch converts some
uses of patch_instruction() to use patch_instruction_unlocked() instead.

Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>

---

v4:  * New to series.
---
 arch/powerpc/include/asm/code-patching.h |  4 ++
 arch/powerpc/lib/code-patching.c         | 85 +++++++++++++++++++++---
 2 files changed, 79 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/incl=
ude/asm/code-patching.h
index e51c81e4a9bda..2efa11b68cd8f 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -28,8 +28,12 @@ int create_branch(struct ppc_inst *instr, const struct=
 ppc_inst *addr,
 int create_cond_branch(struct ppc_inst *instr, const struct ppc_inst *ad=
dr,
 		       unsigned long target, int flags);
 int patch_branch(struct ppc_inst *addr, unsigned long target, int flags)=
;
+int patch_branch_unlocked(struct ppc_inst *addr, unsigned long target, i=
nt flags);
 int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
+int patch_instruction_unlocked(struct ppc_inst *addr, struct ppc_inst in=
str);
 int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
+unsigned long lock_patching(void);
+void unlock_patching(unsigned long flags);
=20
 static inline unsigned long patch_site_addr(s32 *site)
 {
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-pat=
ching.c
index 7e15abc09ec04..0a496bb52bbf4 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -52,13 +52,17 @@ int raw_patch_instruction(struct ppc_inst *addr, stru=
ct ppc_inst instr)
=20
 #ifdef CONFIG_STRICT_KERNEL_RWX
=20
+static DEFINE_SPINLOCK(patching_lock);
+
 struct temp_mm {
 	struct mm_struct *temp;
 	struct mm_struct *prev;
 	struct arch_hw_breakpoint brk[HBP_NUM_MAX];
+	spinlock_t *lock; /* protect access to the temporary mm */
 };
=20
-static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struc=
t *mm)
+static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struc=
t *mm,
+				spinlock_t *lock)
 {
 	/* Do not preload SLB entries from the thread_info struct */
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
@@ -66,12 +70,14 @@ static inline void init_temp_mm(struct temp_mm *temp_=
mm, struct mm_struct *mm)
=20
 	temp_mm->temp =3D mm;
 	temp_mm->prev =3D NULL;
+	temp_mm->lock =3D lock;
 	memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
 }
=20
 static inline void use_temporary_mm(struct temp_mm *temp_mm)
 {
 	lockdep_assert_irqs_disabled();
+	lockdep_assert_held(temp_mm->lock);
=20
 	temp_mm->prev =3D current->active_mm;
 	switch_mm_irqs_off(temp_mm->prev, temp_mm->temp, current);
@@ -93,11 +99,13 @@ static inline void use_temporary_mm(struct temp_mm *t=
emp_mm)
 static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
 {
 	lockdep_assert_irqs_disabled();
+	lockdep_assert_held(temp_mm->lock);
=20
 	switch_mm_irqs_off(temp_mm->temp, temp_mm->prev, current);
=20
 	/*
-	 * On book3s64 the active_cpus counter increments in
+	 * The temporary mm can only be in use on a single CPU at a time due to
+	 * the temp_mm->lock. On book3s64 the active_cpus counter increments in
 	 * switch_mm_irqs_off(). With the Hash MMU this counter affects if TLB
 	 * flushes are local. We have to manually decrement that counter here
 	 * along with removing our current CPU from the mm's cpumask so that in
@@ -230,7 +238,7 @@ static int map_patch(const void *addr, struct patch_m=
apping *patch_mapping)
 	pte =3D pte_mkdirty(pte);
 	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, pte);
=20
-	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
+	init_temp_mm(&patch_mapping->temp_mm, patching_mm, &patching_lock);
 	use_temporary_mm(&patch_mapping->temp_mm);
=20
 	/*
@@ -258,7 +266,6 @@ static int do_patch_instruction(struct ppc_inst *addr=
, struct ppc_inst instr)
 {
 	int err;
 	struct ppc_inst *patch_addr =3D NULL;
-	unsigned long flags;
 	struct patch_mapping patch_mapping;
=20
 	/*
@@ -269,11 +276,12 @@ static int do_patch_instruction(struct ppc_inst *ad=
dr, struct ppc_inst instr)
 	if (!patching_mm)
 		return raw_patch_instruction(addr, instr);
=20
-	local_irq_save(flags);
+	lockdep_assert_held(&patching_lock);
+	lockdep_assert_irqs_disabled();
=20
 	err =3D map_patch(addr, &patch_mapping);
 	if (err)
-		goto out;
+		return err;
=20
 	patch_addr =3D (struct ppc_inst *)(patching_addr | offset_in_page(addr)=
);
=20
@@ -287,11 +295,33 @@ static int do_patch_instruction(struct ppc_inst *ad=
dr, struct ppc_inst instr)
=20
 	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
=20
-out:
-	local_irq_restore(flags);
-
 	return err;
 }
+
+unsigned long lock_patching(void)
+{
+	unsigned long flags;
+
+	/* We don't need the lock if we're not using the patching_mm. */
+	if (!patching_mm)
+		return 0;
+
+	spin_lock_irqsave(&patching_lock, flags);
+	return flags;
+}
+
+void unlock_patching(const unsigned long flags)
+{
+	/* We never held the lock if we're not using the patching_mm. */
+	if (!patching_mm)
+		return;
+
+	lockdep_assert_held(&patching_lock);
+	lockdep_assert_irqs_disabled();
+
+	spin_unlock_irqrestore(&patching_lock, flags);
+}
+
 #else /* !CONFIG_STRICT_KERNEL_RWX */
=20
 static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst i=
nstr)
@@ -299,19 +329,46 @@ static int do_patch_instruction(struct ppc_inst *ad=
dr, struct ppc_inst instr)
 	return raw_patch_instruction(addr, instr);
 }
=20
+unsigned long lock_patching(void)
+{
+	return 0;
+}
+
+void unlock_patching(const unsigned long flags) {}
+
 #endif /* CONFIG_STRICT_KERNEL_RWX */
=20
 int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 {
+	int err;
+	unsigned long flags;
+
 	/* Make sure we aren't patching a freed init section */
 	if (init_mem_is_free && init_section_contains(addr, 4)) {
 		pr_debug("Skipping init section patching addr: 0x%px\n", addr);
 		return 0;
 	}
-	return do_patch_instruction(addr, instr);
+
+	flags =3D lock_patching();
+	err =3D do_patch_instruction(addr, instr);
+	unlock_patching(flags);
+
+	return err;
 }
 NOKPROBE_SYMBOL(patch_instruction);
=20
+int patch_instruction_unlocked(struct ppc_inst *addr, struct ppc_inst in=
str)
+{
+	/* Make sure we aren't patching a freed init section */
+	if (init_mem_is_free && init_section_contains(addr, 4)) {
+		pr_debug("Skipping init section patching addr: 0x%p\n", addr);
+		return 0;
+	}
+
+	return do_patch_instruction(addr, instr);
+}
+NOKPROBE_SYMBOL(patch_instruction_unlocked);
+
 int patch_branch(struct ppc_inst *addr, unsigned long target, int flags)
 {
 	struct ppc_inst instr;
@@ -320,6 +377,14 @@ int patch_branch(struct ppc_inst *addr, unsigned lon=
g target, int flags)
 	return patch_instruction(addr, instr);
 }
=20
+int patch_branch_unlocked(struct ppc_inst *addr, unsigned long target, i=
nt flags)
+{
+	struct ppc_inst instr;
+
+	create_branch(&instr, addr, target, flags);
+	return patch_instruction_unlocked(addr, instr);
+}
+
 bool is_offset_in_branch_range(long offset)
 {
 	/*
--=20
2.26.1

