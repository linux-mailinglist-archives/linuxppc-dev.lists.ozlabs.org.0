Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE733C69BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 07:33:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP8SQ2Dk6z3bXh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 15:33:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IARshPrm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IARshPrm; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP8Pz4fXRz2yNk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 15:31:35 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D53TbN132201; Tue, 13 Jul 2021 01:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Fu4B94XecByGojpzF5/h47uD37QP24gK+CFWTVJGVa0=;
 b=IARshPrmvDXJbSeHT39yxIRaTvhyn/UoyxM4/i2LEl7dZIxOZirOD0Z7w4u6ZRDFqxMP
 mhiKJlH4LrQtm6khAkPF6Eefu0bNLp+Tp6ixt8v7IrnBbZAuOO15m84BubJ7zemmf40V
 91lT6haMx4W9sHSABP/FaL/ux8Vgedds7XGVxLKwXT3QlOY/ze+GZH6h0LMoUh9KxXXH
 Zhws2ndwKrtjs6dneRl1b1elPmyLoqqHe8scjJiavkA5MpEIeXQuOb5OQBERBuuY5lto
 1NekkVA0mz4FcydIXFWRu8OMLF4l30b8XtNUX9YfJFrSkkxJCP9WOi4YIEvO2JjPLoH3 Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qs49fw0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:31:22 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16D53Xew132596;
 Tue, 13 Jul 2021 01:31:22 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qs49fw09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:31:22 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16D5Ri3q003535;
 Tue, 13 Jul 2021 05:31:21 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 39rkgtqcf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 05:31:21 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16D5VKca30540092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 05:31:20 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 271B7BE051;
 Tue, 13 Jul 2021 05:31:20 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C62A6BE04F;
 Tue, 13 Jul 2021 05:31:19 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.163.19.100])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP;
 Tue, 13 Jul 2021 05:31:19 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 3D036BC0C21;
 Tue, 13 Jul 2021 00:31:15 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 7/8] powerpc/64s: Initialize and use a temporary mm for
 patching on Radix
Date: Tue, 13 Jul 2021 00:31:12 -0500
Message-Id: <20210713053113.4632-8-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210713053113.4632-1-cmr@linux.ibm.com>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r7wF62Wuxc73CQARFB0IJIKBroXqIKTb
X-Proofpoint-ORIG-GUID: 6fbwWfuh-8eTmZzb9mOWiVRLpQ-wptY0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_03:2021-07-13,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130026
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When code patching a STRICT_KERNEL_RWX kernel the page containing the
address to be patched is temporarily mapped as writeable. Currently, a
per-cpu vmalloc patch area is used for this purpose. While the patch
area is per-cpu, the temporary page mapping is inserted into the kernel
page tables for the duration of patching. The mapping is exposed to CPUs
other than the patching CPU - this is undesirable from a hardening
perspective. Use a temporary mm instead which keeps the mapping local to
the CPU doing the patching.

Use the `poking_init` init hook to prepare a temporary mm and patching
address. Initialize the temporary mm by copying the init mm. Choose a
randomized patching address inside the temporary mm userspace address
space. The patching address is randomized between PAGE_SIZE and
DEFAULT_MAP_WINDOW-PAGE_SIZE.

Bits of entropy with 64K page size on BOOK3S_64:

        bits of entropy =3D log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)

        PAGE_SIZE=3D64K, DEFAULT_MAP_WINDOW_USER64=3D128TB
        bits of entropy =3D log2(128TB / 64K)
	bits of entropy =3D 31

The upper limit is DEFAULT_MAP_WINDOW due to how the Book3s64 Hash MMU
operates - by default the space above DEFAULT_MAP_WINDOW is not
available. Currently the Hash MMU does not use a temporary mm so
technically this upper limit isn't necessary; however, a larger
randomization range does not further "harden" this overall approach and
future work may introduce patching with a temporary mm on Hash as well.

Randomization occurs only once during initialization at boot for each
possible CPU in the system.

Introduce two new functions, map_patch() and unmap_patch(), to
respectively create and remove the temporary mapping with write
permissions at patching_addr. Map the page with PAGE_KERNEL to set
EAA[0] for the PTE which ignores the AMR (so no need to unlock/lock
KUAP) according to PowerISA v3.0b Figure 35 on Radix.

Based on x86 implementation:

commit 4fc19708b165
("x86/alternatives: Initialize temporary mm for patching")

and:

commit b3fd8e83ada0
("x86/alternatives: Use temporary mm for text poking")

Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>

---

v5:  * Only support Book3s64 Radix MMU for now.
     * Use a per-cpu datastructure to hold the patching_addr and
       patching_mm to avoid the need for a synchronization lock/mutex.

v4:  * In the previous series this was two separate patches: one to init
       the temporary mm in poking_init() (unused in powerpc at the time)
       and the other to use it for patching (which removed all the
       per-cpu vmalloc code). Now that we use poking_init() in the
       existing per-cpu vmalloc approach, that separation doesn't work
       as nicely anymore so I just merged the two patches into one.
     * Preload the SLB entry and hash the page for the patching_addr
       when using Hash on book3s64 to avoid taking an SLB and Hash fault
       during patching. The previous implementation was a hack which
       changed current->mm to allow the SLB and Hash fault handlers to
       work with the temporary mm since both of those code-paths always
       assume mm =3D=3D current->mm.
     * Also (hmm - seeing a trend here) with the book3s64 Hash MMU we
       have to manage the mm->context.active_cpus counter and mm cpumask
       since they determine (via mm_is_thread_local()) if the TLB flush
       in pte_clear() is local or not - it should always be local when
       we're using the temporary mm. On book3s64's Radix MMU we can
       just call local_flush_tlb_mm().
     * Use HPTE_USE_KERNEL_KEY on Hash to avoid costly lock/unlock of
       KUAP.
---
 arch/powerpc/lib/code-patching.c | 132 +++++++++++++++++++++++++++++--
 1 file changed, 125 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-pat=
ching.c
index 9f2eba9b70ee4..027dabd42b8dd 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -11,6 +11,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/random.h>
=20
 #include <asm/tlbflush.h>
 #include <asm/page.h>
@@ -103,6 +104,7 @@ static inline void unuse_temporary_mm(struct temp_mm =
*temp_mm)
=20
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
+static DEFINE_PER_CPU(struct mm_struct *, cpu_patching_mm);
=20
 #if IS_BUILTIN(CONFIG_LKDTM)
 unsigned long read_cpu_patching_addr(unsigned int cpu)
@@ -133,6 +135,51 @@ static int text_area_cpu_down(unsigned int cpu)
 	return 0;
 }
=20
+static __always_inline void __poking_init_temp_mm(void)
+{
+	int cpu;
+	spinlock_t *ptl; /* for protecting pte table */
+	pte_t *ptep;
+	struct mm_struct *patching_mm;
+	unsigned long patching_addr;
+
+	for_each_possible_cpu(cpu) {
+		/*
+		 * Some parts of the kernel (static keys for example) depend on
+		 * successful code patching. Code patching under
+		 * STRICT_KERNEL_RWX requires this setup - otherwise we cannot
+		 * patch at all. We use BUG_ON() here and later since an early
+		 * failure is preferred to buggy behavior and/or strange
+		 * crashes later.
+		 */
+		patching_mm =3D copy_init_mm();
+		BUG_ON(!patching_mm);
+
+		per_cpu(cpu_patching_mm, cpu) =3D patching_mm;
+
+		/*
+		 * Choose a randomized, page-aligned address from the range:
+		 * [PAGE_SIZE, DEFAULT_MAP_WINDOW - PAGE_SIZE] The lower
+		 * address bound is PAGE_SIZE to avoid the zero-page.  The
+		 * upper address bound is DEFAULT_MAP_WINDOW - PAGE_SIZE to
+		 * stay under DEFAULT_MAP_WINDOW with the Book3s64 Hash MMU.
+		 */
+		patching_addr =3D PAGE_SIZE + ((get_random_long() & PAGE_MASK)
+				% (DEFAULT_MAP_WINDOW - 2 * PAGE_SIZE));
+
+		per_cpu(cpu_patching_addr, cpu) =3D patching_addr;
+
+		/*
+		 * PTE allocation uses GFP_KERNEL which means we need to
+		 * pre-allocate the PTE here because we cannot do the
+		 * allocation during patching when IRQs are disabled.
+		 */
+		ptep =3D get_locked_pte(patching_mm, patching_addr, &ptl);
+		BUG_ON(!ptep);
+		pte_unmap_unlock(ptep, ptl);
+	}
+}
+
 /*
  * Although BUG_ON() is rude, in this case it should only happen if ENOM=
EM, and
  * we judge it as being preferable to a kernel that will crash later whe=
n
@@ -140,6 +187,11 @@ static int text_area_cpu_down(unsigned int cpu)
  */
 void __init poking_init(void)
 {
+	if (radix_enabled()) {
+		__poking_init_temp_mm();
+		return;
+	}
+
 	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 		"powerpc/text_poke:online", text_area_cpu_up,
 		text_area_cpu_down));
@@ -213,30 +265,96 @@ static inline int unmap_patch_area(void)
 	return -EINVAL;
 }
=20
+struct patch_mapping {
+	spinlock_t *ptl; /* for protecting pte table */
+	pte_t *ptep;
+	struct temp_mm temp_mm;
+};
+
+/*
+ * This can be called for kernel text or a module.
+ */
+static int map_patch(const void *addr, struct patch_mapping *patch_mappi=
ng)
+{
+	struct page *page;
+	pte_t pte;
+	pgprot_t pgprot;
+	struct mm_struct *patching_mm =3D __this_cpu_read(cpu_patching_mm);
+	unsigned long patching_addr =3D __this_cpu_read(cpu_patching_addr);
+
+	if (is_vmalloc_or_module_addr(addr))
+		page =3D vmalloc_to_page(addr);
+	else
+		page =3D virt_to_page(addr);
+
+	patch_mapping->ptep =3D get_locked_pte(patching_mm, patching_addr,
+					     &patch_mapping->ptl);
+	if (unlikely(!patch_mapping->ptep)) {
+		pr_warn("map patch: failed to allocate pte for patching\n");
+		return -1;
+	}
+
+	pgprot =3D PAGE_KERNEL;
+	pte =3D mk_pte(page, pgprot);
+	pte =3D pte_mkdirty(pte);
+	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, pte);
+
+	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
+	use_temporary_mm(&patch_mapping->temp_mm);
+
+	return 0;
+}
+
+static void unmap_patch(struct patch_mapping *patch_mapping)
+{
+	struct mm_struct *patching_mm =3D __this_cpu_read(cpu_patching_mm);
+	unsigned long patching_addr =3D __this_cpu_read(cpu_patching_addr);
+
+	pte_clear(patching_mm, patching_addr, patch_mapping->ptep);
+
+	local_flush_tlb_mm(patching_mm);
+
+	pte_unmap_unlock(patch_mapping->ptep, patch_mapping->ptl);
+
+	unuse_temporary_mm(&patch_mapping->temp_mm);
+}
+
 static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 {
 	int err, rc =3D 0;
 	u32 *patch_addr =3D NULL;
 	unsigned long flags;
+	struct patch_mapping patch_mapping;
=20
 	/*
-	 * During early early boot patch_instruction is called
-	 * when text_poke_area is not ready, but we still need
-	 * to allow patching. We just do the plain old patching
+	 * During early early boot patch_instruction is called when the
+	 * patching_mm/text_poke_area is not ready, but we still need to allow
+	 * patching. We just do the plain old patching.
 	 */
-	if (!this_cpu_read(text_poke_area))
-		return raw_patch_instruction(addr, instr);
+	if (radix_enabled()) {
+		if (!this_cpu_read(cpu_patching_mm))
+			return raw_patch_instruction(addr, instr);
+	} else {
+		if (!this_cpu_read(text_poke_area))
+			return raw_patch_instruction(addr, instr);
+	}
=20
 	local_irq_save(flags);
=20
-	err =3D map_patch_area(addr);
+	if (radix_enabled())
+		err =3D map_patch(addr, &patch_mapping);
+	else
+		err =3D map_patch_area(addr);
 	if (err)
 		goto out;
=20
 	patch_addr =3D (u32 *)(__this_cpu_read(cpu_patching_addr) | offset_in_p=
age(addr));
 	rc =3D __patch_instruction(addr, instr, patch_addr);
=20
-	err =3D unmap_patch_area();
+	if (radix_enabled())
+		unmap_patch(&patch_mapping);
+	else
+		err =3D unmap_patch_area();
=20
 out:
 	local_irq_restore(flags);
--=20
2.26.1

