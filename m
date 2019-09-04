Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D33A7908
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 04:50:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NSxN3bNrzDqnk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 12:50:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sukadev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NSvF4DxCzDqkV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 12:48:55 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x842lGaO045367; Tue, 3 Sep 2019 22:48:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ut1jncrmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 22:48:50 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x842lVHW045872;
 Tue, 3 Sep 2019 22:48:50 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ut1jncrme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 22:48:50 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x842isj3032000;
 Wed, 4 Sep 2019 02:48:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 2uqgh6pgke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 02:48:48 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x842mmYU61473226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 02:48:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33861BE051;
 Wed,  4 Sep 2019 02:48:48 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A5A3BE04F;
 Wed,  4 Sep 2019 02:48:47 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 02:48:47 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id 595252E10EB; Tue,  3 Sep 2019 19:48:46 -0700 (PDT)
Date: Tue, 3 Sep 2019 19:48:46 -0700
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [RFC PATCH 00/11] Secure Virtual Machine Enablement
Message-ID: <20190904024846.GA16605@us.ibm.com>
References: <20180824162535.22798-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180824162535.22798-1-bauerman@linux.ibm.com>
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040027
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thiago Jung Bauermann [bauerman@linux.ibm.com] wrote:
> [ Some people didn't receive all the patches in this series, even though
>   the linuxppc-dev list did so trying to send again. This is exactly the
>   same series I posted yesterday. Sorry for the clutter. ]
> 
> This series contains preliminary work to enable Secure Virtual Machines
> (SVM) on powerpc. SVMs request to be migrated to secure memory very early in
> the boot process (in prom_init()), so by default all of their memory is
> inaccessible to the hypervisor. There is an ultravisor call that the VM can
> use to request certain pages to be made accessible (aka shared).

I would like to piggy-back on this series (since it provides the
context) to add another patch we need for SVMs :-) 

Appreciate any comments. 

---

From ed93a0e36ec886483a72fdb8d99380bbe6607f37 Mon Sep 17 00:00:00 2001
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Date: Thu, 16 May 2019 20:57:12 -0500
Subject: [PATCH 1/1] powerpc/pseries/svm: don't access some SPRs

Ultravisor disables some CPU features like EBB and BHRB in the HFSCR
for secure virtual machines (SVMs). If the SVMs attempt to access
related registers, they will get a Program Interrupt.

Use macros/wrappers to skip accessing EBB and BHRB related registers
for secure VMs.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
---
 arch/powerpc/include/asm/reg.h          | 35 ++++++++++++++++++++++++
 arch/powerpc/kernel/process.c           | 12 ++++-----
 arch/powerpc/kvm/book3s_hv.c            | 24 ++++++++---------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 48 ++++++++++++++++++++++++---------
 arch/powerpc/kvm/book3s_hv_tm_builtin.c |  6 ++---
 arch/powerpc/perf/core-book3s.c         |  4 +--
 arch/powerpc/xmon/xmon.c                |  2 +-
 7 files changed, 95 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index ec3714c..1397cb3 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1376,6 +1376,41 @@ static inline void msr_check_and_clear(unsigned long bits)
 		__msr_check_and_clear(bits);
 }
 
+#ifdef CONFIG_PPC_SVM
+/*
+ * Move from some "restricted" sprs.
+ * Secure VMs should not access some registers as the related features
+ * are disabled in the CPU. If an SVM is attempting read from the given
+ * SPR, return 0. Otherwise behave like a normal mfspr.
+ */
+#define mfspr_r(rn)						\
+({								\
+	unsigned long rval = 0ULL;				\
+								\
+	if (!(mfmsr() & MSR_S))					\
+		asm volatile("mfspr %0," __stringify(rn)	\
+				: "=r" (rval));			\
+	rval;							\
+})
+
+/*
+ * Move to some "restricted" sprs.
+ * Secure VMs should not access some registers as the related features
+ * are disabled in the CPU. If an SVM is attempting write to the given
+ * SPR, ignore the write. Otherwise behave like a normal mtspr.
+ */
+#define mtspr_r(rn, v)					\
+({								\
+	if (!(mfmsr() & MSR_S))					\
+		asm volatile("mtspr " __stringify(rn) ",%0" :	\
+				     : "r" ((unsigned long)(v)) \
+				     : "memory");		\
+})
+#else
+#define mfspr_r		mfspr
+#define mtspr_r		mtspr
+#endif
+
 #ifdef __powerpc64__
 #if defined(CONFIG_PPC_CELL) || defined(CONFIG_PPC_FSL_BOOK3E)
 #define mftb()		({unsigned long rval;				\
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8fc4de0..d5e7386 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1072,9 +1072,9 @@ static inline void save_sprs(struct thread_struct *t)
 		t->dscr = mfspr(SPRN_DSCR);
 
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
-		t->bescr = mfspr(SPRN_BESCR);
-		t->ebbhr = mfspr(SPRN_EBBHR);
-		t->ebbrr = mfspr(SPRN_EBBRR);
+		t->bescr = mfspr_r(SPRN_BESCR);
+		t->ebbhr = mfspr_r(SPRN_EBBHR);
+		t->ebbrr = mfspr_r(SPRN_EBBRR);
 
 		t->fscr = mfspr(SPRN_FSCR);
 
@@ -1111,11 +1111,11 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
 		if (old_thread->bescr != new_thread->bescr)
-			mtspr(SPRN_BESCR, new_thread->bescr);
+			mtspr_r(SPRN_BESCR, new_thread->bescr);
 		if (old_thread->ebbhr != new_thread->ebbhr)
-			mtspr(SPRN_EBBHR, new_thread->ebbhr);
+			mtspr_r(SPRN_EBBHR, new_thread->ebbhr);
 		if (old_thread->ebbrr != new_thread->ebbrr)
-			mtspr(SPRN_EBBRR, new_thread->ebbrr);
+			mtspr_r(SPRN_EBBRR, new_thread->ebbrr);
 
 		if (old_thread->fscr != new_thread->fscr)
 			mtspr(SPRN_FSCR, new_thread->fscr);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8304ee2..91f4db2 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3584,9 +3584,9 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_PSPB, vcpu->arch.pspb);
 	mtspr(SPRN_FSCR, vcpu->arch.fscr);
 	mtspr(SPRN_TAR, vcpu->arch.tar);
-	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
-	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
-	mtspr(SPRN_BESCR, vcpu->arch.bescr);
+	mtspr_r(SPRN_EBBHR, vcpu->arch.ebbhr);
+	mtspr_r(SPRN_EBBRR, vcpu->arch.ebbrr);
+	mtspr_r(SPRN_BESCR, vcpu->arch.bescr);
 	mtspr(SPRN_WORT, vcpu->arch.wort);
 	mtspr(SPRN_TIDR, vcpu->arch.tid);
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
@@ -3657,9 +3657,9 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->arch.pspb = mfspr(SPRN_PSPB);
 	vcpu->arch.fscr = mfspr(SPRN_FSCR);
 	vcpu->arch.tar = mfspr(SPRN_TAR);
-	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
-	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
-	vcpu->arch.bescr = mfspr(SPRN_BESCR);
+	vcpu->arch.ebbhr = mfspr_r(SPRN_EBBHR);
+	vcpu->arch.ebbrr = mfspr_r(SPRN_EBBRR);
+	vcpu->arch.bescr = mfspr_r(SPRN_BESCR);
 	vcpu->arch.wort = mfspr(SPRN_WORT);
 	vcpu->arch.tid = mfspr(SPRN_TIDR);
 	vcpu->arch.amr = mfspr(SPRN_AMR);
@@ -4288,9 +4288,9 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
 
 	/* Save userspace EBB and other register values */
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
-		ebb_regs[0] = mfspr(SPRN_EBBHR);
-		ebb_regs[1] = mfspr(SPRN_EBBRR);
-		ebb_regs[2] = mfspr(SPRN_BESCR);
+		ebb_regs[0] = mfspr_r(SPRN_EBBHR);
+		ebb_regs[1] = mfspr_r(SPRN_EBBRR);
+		ebb_regs[2] = mfspr_r(SPRN_BESCR);
 		user_tar = mfspr(SPRN_TAR);
 	}
 	user_vrsave = mfspr(SPRN_VRSAVE);
@@ -4336,9 +4336,9 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
 
 	/* Restore userspace EBB and other register values */
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
-		mtspr(SPRN_EBBHR, ebb_regs[0]);
-		mtspr(SPRN_EBBRR, ebb_regs[1]);
-		mtspr(SPRN_BESCR, ebb_regs[2]);
+		mtspr_r(SPRN_EBBHR, ebb_regs[0]);
+		mtspr_r(SPRN_EBBRR, ebb_regs[1]);
+		mtspr_r(SPRN_BESCR, ebb_regs[2]);
 		mtspr(SPRN_TAR, user_tar);
 		mtspr(SPRN_FSCR, current->thread.fscr);
 	}
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index f4399b0..4cbf8ca 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -808,15 +808,27 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mtspr	SPRN_CIABR, r7
 	mtspr	SPRN_TAR, r8
 	ld	r5, VCPU_IC(r4)
-	ld	r8, VCPU_EBBHR(r4)
 	mtspr	SPRN_IC, r5
-	mtspr	SPRN_EBBHR, r8
-	ld	r5, VCPU_EBBRR(r4)
-	ld	r6, VCPU_BESCR(r4)
+
+	/* EBB and TM are disabled for secure VMs so skip them */
+	mfmsr   r8
+	andis.  r8, r8, MSR_S@high
+	bne     clear_ebb0
+	ld      r5, VCPU_EBBHR(r4)
+	ld      r6, VCPU_EBBRR(r4)
+	ld      r7, VCPU_BESCR(r4)
+	b       store_ebb0
+clear_ebb0:
+	li      r5, 0
+	li      r6, 0
+	li      r7, 0
+store_ebb0:
+	mtspr   SPRN_EBBHR, r5
+	mtspr   SPRN_EBBRR, r6
+	mtspr   SPRN_BESCR, r7
+
 	lwz	r7, VCPU_GUEST_PID(r4)
 	ld	r8, VCPU_WORT(r4)
-	mtspr	SPRN_EBBRR, r5
-	mtspr	SPRN_BESCR, r6
 	mtspr	SPRN_PID, r7
 	mtspr	SPRN_WORT, r8
 BEGIN_FTR_SECTION
@@ -1611,14 +1623,26 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mfspr	r7, SPRN_TAR
 	std	r5, VCPU_IC(r9)
 	std	r7, VCPU_TAR(r9)
-	mfspr	r8, SPRN_EBBHR
-	std	r8, VCPU_EBBHR(r9)
-	mfspr	r5, SPRN_EBBRR
-	mfspr	r6, SPRN_BESCR
+
+	/* EBB and TM are disabled for secure VMs so skip them */
+	mfmsr   r8
+	andis.  r8, r8, MSR_S@high
+	bne     clear_ebb1
+	mfspr   r5, SPRN_EBBHR
+	mfspr   r6, SPRN_EBBRR
+	mfspr   r7, SPRN_BESCR
+	b       store_ebb1
+clear_ebb1:
+	li      r5, 0
+	li      r6, 0
+	li      r7, 0
+store_ebb1:
+	std     r5, VCPU_EBBHR(r9)
+	std     r6, VCPU_EBBRR(r9)
+	std     r7, VCPU_BESCR(r9)
+
 	mfspr	r7, SPRN_PID
 	mfspr	r8, SPRN_WORT
-	std	r5, VCPU_EBBRR(r9)
-	std	r6, VCPU_BESCR(r9)
 	stw	r7, VCPU_GUEST_PID(r9)
 	std	r8, VCPU_WORT(r9)
 BEGIN_FTR_SECTION
diff --git a/arch/powerpc/kvm/book3s_hv_tm_builtin.c b/arch/powerpc/kvm/book3s_hv_tm_builtin.c
index 2172462..bc3071c 100644
--- a/arch/powerpc/kvm/book3s_hv_tm_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_tm_builtin.c
@@ -45,18 +45,18 @@ int kvmhv_p9_tm_emulation_early(struct kvm_vcpu *vcpu)
 		if (!(vcpu->arch.hfscr & HFSCR_EBB) ||
 		    ((msr & MSR_PR) && !(mfspr(SPRN_FSCR) & FSCR_EBB)))
 			return 0;
-		bescr = mfspr(SPRN_BESCR);
+		bescr = mfspr_r(SPRN_BESCR);
 		/* expect to see a S->T transition requested */
 		if (((bescr >> 30) & 3) != 2)
 			return 0;
 		bescr &= ~BESCR_GE;
 		if (instr & (1 << 11))
 			bescr |= BESCR_GE;
-		mtspr(SPRN_BESCR, bescr);
+		mtspr_r(SPRN_BESCR, bescr);
 		msr = (msr & ~MSR_TS_MASK) | MSR_TS_T;
 		vcpu->arch.shregs.msr = msr;
 		vcpu->arch.cfar = vcpu->arch.regs.nip - 4;
-		vcpu->arch.regs.nip = mfspr(SPRN_EBBRR);
+		vcpu->arch.regs.nip = mfspr_r(SPRN_EBBRR);
 		return 1;
 
 	case PPC_INST_MTMSRD:
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index ca92e01..e51b2c9 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -846,9 +846,9 @@ void perf_event_print_debug(void)
 
 	if (ppmu->flags & PPMU_ARCH_207S) {
 		pr_info("MMCR2: %016lx EBBHR: %016lx\n",
-			mfspr(SPRN_MMCR2), mfspr(SPRN_EBBHR));
+			mfspr(SPRN_MMCR2), mfspr_r(SPRN_EBBHR));
 		pr_info("EBBRR: %016lx BESCR: %016lx\n",
-			mfspr(SPRN_EBBRR), mfspr(SPRN_BESCR));
+			mfspr_r(SPRN_EBBRR), mfspr_r(SPRN_BESCR));
 	}
 #endif
 	pr_info("SIAR:  %016lx SDAR:  %016lx SIER:  %016lx\n",
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 14e56c2..20b3431 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1871,7 +1871,7 @@ static void dump_207_sprs(void)
 	printf("sdar   = %.16lx   sier = %.16lx pmc6   = %.8lx\n",
 		mfspr(SPRN_SDAR), mfspr(SPRN_SIER), mfspr(SPRN_PMC6));
 	printf("ebbhr  = %.16lx  ebbrr = %.16lx bescr  = %.16lx\n",
-		mfspr(SPRN_EBBHR), mfspr(SPRN_EBBRR), mfspr(SPRN_BESCR));
+		mfspr_r(SPRN_EBBHR), mfspr_r(SPRN_EBBRR), mfspr_r(SPRN_BESCR));
 	printf("iamr   = %.16lx\n", mfspr(SPRN_IAMR));
 
 	if (!(msr & MSR_HV))
-- 
1.8.3.1

