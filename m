Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF6533D62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 15:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7WgQ5cQDz3cBL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 23:12:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PxJDjalB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PxJDjalB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Wb707slz3bdF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 23:08:18 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PColMQ012980;
 Wed, 25 May 2022 13:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jEhiHKsqSEW7afFfAiNfnb1fkEAkDKeNjl8P9kRHQ5I=;
 b=PxJDjalBLmL3xerxSBxYT5gu2izcUJZ08B7fEIDSGvySd8u6KRUhi2FAs7xwmQ2Ukdzr
 ho3N35m0ETV7xTaqwd3LW1VTXepTewhjLg82njZcXUrOnFqPaGub/GC+FpZ87FcZPS+Y
 dG9uJOGQ8QR/sC4iak2kMtTlo1IScZsdQzyq9UvvwVeoXdB21W27nuMeffdjHfFMwsaz
 Q6E8pXM/hdCOTbtl2xfT7FgksHfTP70NbxnDZCoCf2TgYrFrNf8fySe+35DowUJwwN75
 oBddnEXgsGE/cKnk5IqEaWzGNm95d+28zmj7jn6ZSnMey7b+OBpH4eYDuuYuNchssmtt MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9fxjxd2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:14 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PBtjj2017337;
 Wed, 25 May 2022 13:08:14 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9fxjxd25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:14 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PD3B3P031598;
 Wed, 25 May 2022 13:08:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 3g93vbe398-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:13 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PD8CGL10551804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 13:08:12 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A49FB11206F;
 Wed, 25 May 2022 13:08:12 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 764CB112063;
 Wed, 25 May 2022 13:08:11 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.160.108.97]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 13:08:11 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] KVM: PPC: Book3S HV: Provide more detailed timings for P9
 entry path
Date: Wed, 25 May 2022 10:05:54 -0300
Message-Id: <20220525130554.2614394-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525130554.2614394-1-farosas@linux.ibm.com>
References: <20220525130554.2614394-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fKGdVGSyPHBy7id6yBXWlJAjpjNr_fNB
X-Proofpoint-GUID: OW_LQBQ1h7jW8AGhq9tNYhUDHjDUE_ZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=918
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250067
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
Cc: npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alter the data collection points for the debug timing code in the P9
path to be more in line with what the code does. The points where we
accumulate time are now the following:

vcpu_entry: From vcpu_run_hv entry until the start of the inner loop;

guest_entry: From the start of the inner loop until the guest entry in
             asm;

in_guest: From the guest entry in asm until the return to KVM C code;

guest_exit: From the return into KVM C code until the corresponding
            hypercall/page fault handling or re-entry into the guest;

hypercall: Time spent handling hcalls in the kernel (hcalls can go to
	   QEMU, not accounted here);

page_fault: Time spent handling page faults;

vcpu_exit: vcpu_run_hv exit (almost no code here currently).

Like before, these are exposed in debugfs in a file called
"timings". There are four values:

- number of occurrences of the accumulation point;
- total time the vcpu spent in the phase in ns;
- shortest time the vcpu spent in the phase in ns;
- longest time the vcpu spent in the phase in ns;

===
Before:

  rm_entry: 53132 16793518 256 4060
  rm_intr: 53132 2125914 22 340
  rm_exit: 53132 24108344 374 2180
  guest: 53132 40980507996 404 9997650
  cede: 0 0 0 0

After:

  vcpu_entry: 34637 7716108 178 4416
  guest_entry: 52414 49365608 324 747542
  in_guest: 52411 40828715840 258 9997480
  guest_exit: 52410 19681717182 826 102496674
  vcpu_exit: 34636 1744462 38 182
  hypercall: 45712 22878288 38 1307962
  page_fault: 992 111104034 568 168688

  With just one instruction (hcall):

  vcpu_entry: 1 942 942 942
  guest_entry: 1 4044 4044 4044
  in_guest: 1 1540 1540 1540
  guest_exit: 1 3542 3542 3542
  vcpu_exit: 1 80 80 80
  hypercall: 0 0 0 0
  page_fault: 0 0 0 0
===

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_host.h   | 12 +++++++-----
 arch/powerpc/kvm/Kconfig              |  9 +++++----
 arch/powerpc/kvm/book3s_hv.c          | 23 ++++++++++++++++++-----
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 14 ++++----------
 4 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 37f03665bfa2..de2b226aa350 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -827,11 +827,13 @@ struct kvm_vcpu_arch {
 	struct kvmhv_tb_accumulator *cur_activity;	/* What we're timing */
 	u64	cur_tb_start;			/* when it started */
 #ifdef CONFIG_KVM_BOOK3S_HV_P9_TIMING
-	struct kvmhv_tb_accumulator rm_entry;	/* real-mode entry code */
-	struct kvmhv_tb_accumulator rm_intr;	/* real-mode intr handling */
-	struct kvmhv_tb_accumulator rm_exit;	/* real-mode exit code */
-	struct kvmhv_tb_accumulator guest_time;	/* guest execution */
-	struct kvmhv_tb_accumulator cede_time;	/* time napping inside guest */
+	struct kvmhv_tb_accumulator vcpu_entry;
+	struct kvmhv_tb_accumulator vcpu_exit;
+	struct kvmhv_tb_accumulator in_guest;
+	struct kvmhv_tb_accumulator hcall;
+	struct kvmhv_tb_accumulator pg_fault;
+	struct kvmhv_tb_accumulator guest_entry;
+	struct kvmhv_tb_accumulator guest_exit;
 #else
 	struct kvmhv_tb_accumulator rm_entry;	/* real-mode entry code */
 	struct kvmhv_tb_accumulator rm_intr;	/* real-mode intr handling */
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 191347f44731..cedf1e0f50e1 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -135,10 +135,11 @@ config KVM_BOOK3S_HV_P9_TIMING
 	select KVM_BOOK3S_HV_EXIT_TIMING
 	depends on KVM_BOOK3S_HV_POSSIBLE && DEBUG_FS
 	help
-	  Calculate time taken for each vcpu in various parts of the
-	  code. The total, minimum and maximum times in nanoseconds
-	  together with the number of executions are reported in debugfs in
-	  kvm/vm#/vcpu#/timings.
+	  Calculate time taken for each vcpu during vcpu entry and
+	  exit, time spent inside the guest and time spent handling
+	  hypercalls and page faults. The total, minimum and maximum
+	  times in nanoseconds together with the number of executions
+	  are reported in debugfs in kvm/vm#/vcpu#/timings.
 
 	  If unsure, say N.
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 69a6b40d58b9..f485632f247a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2654,11 +2654,13 @@ static struct debugfs_timings_element {
 	size_t offset;
 } timings[] = {
 #ifdef CONFIG_KVM_BOOK3S_HV_P9_TIMING
-	{"rm_entry",	offsetof(struct kvm_vcpu, arch.rm_entry)},
-	{"rm_intr",	offsetof(struct kvm_vcpu, arch.rm_intr)},
-	{"rm_exit",	offsetof(struct kvm_vcpu, arch.rm_exit)},
-	{"guest",	offsetof(struct kvm_vcpu, arch.guest_time)},
-	{"cede",	offsetof(struct kvm_vcpu, arch.cede_time)},
+	{"vcpu_entry",	offsetof(struct kvm_vcpu, arch.vcpu_entry)},
+	{"guest_entry",	offsetof(struct kvm_vcpu, arch.guest_entry)},
+	{"in_guest",	offsetof(struct kvm_vcpu, arch.in_guest)},
+	{"guest_exit",	offsetof(struct kvm_vcpu, arch.guest_exit)},
+	{"vcpu_exit",	offsetof(struct kvm_vcpu, arch.vcpu_exit)},
+	{"hypercall",	offsetof(struct kvm_vcpu, arch.hcall)},
+	{"page_fault",	offsetof(struct kvm_vcpu, arch.pg_fault)},
 #else
 	{"rm_entry",	offsetof(struct kvm_vcpu, arch.rm_entry)},
 	{"rm_intr",	offsetof(struct kvm_vcpu, arch.rm_intr)},
@@ -4006,8 +4008,10 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 	switch_pmu_to_guest(vcpu, &host_os_sprs);
+	accumulate_time(vcpu, &vcpu->arch.in_guest);
 	trap = plpar_hcall_norets(H_ENTER_NESTED, __pa(&hvregs),
 				  __pa(&vcpu->arch.regs));
+	accumulate_time(vcpu, &vcpu->arch.guest_exit);
 	kvmhv_restore_hv_return_state(vcpu, &hvregs);
 	switch_pmu_to_host(vcpu, &host_os_sprs);
 	vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
@@ -4661,6 +4665,8 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	struct kvm *kvm;
 	unsigned long msr;
 
+	start_timing(vcpu, &vcpu->arch.vcpu_entry);
+
 	if (!vcpu->arch.sane) {
 		run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		return -EINVAL;
@@ -4726,6 +4732,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
+		accumulate_time(vcpu, &vcpu->arch.guest_entry);
 		if (cpu_has_feature(CPU_FTR_ARCH_300))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
@@ -4733,6 +4740,8 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 			r = kvmppc_run_vcpu(vcpu);
 
 		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
+			accumulate_time(vcpu, &vcpu->arch.hcall);
+
 			if (WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_PR)) {
 				/*
 				 * These should have been caught reflected
@@ -4748,6 +4757,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 			trace_kvm_hcall_exit(vcpu, r);
 			kvmppc_core_prepare_to_enter(vcpu);
 		} else if (r == RESUME_PAGE_FAULT) {
+			accumulate_time(vcpu, &vcpu->arch.pg_fault);
 			srcu_idx = srcu_read_lock(&kvm->srcu);
 			r = kvmppc_book3s_hv_page_fault(vcpu,
 				vcpu->arch.fault_dar, vcpu->arch.fault_dsisr);
@@ -4759,12 +4769,15 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 				r = kvmppc_xics_rm_complete(vcpu, 0);
 		}
 	} while (is_kvmppc_resume_guest(r));
+	accumulate_time(vcpu, &vcpu->arch.vcpu_exit);
 
 	vcpu->arch.state = KVMPPC_VCPU_NOTREADY;
 	atomic_dec(&kvm->arch.vcpus_running);
 
 	srr_regs_clobbered();
 
+	end_timing(vcpu);
+
 	return r;
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 8b2a9a360e4e..f8e1752535e8 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -772,8 +772,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
 	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
 
-	start_timing(vcpu, &vcpu->arch.rm_entry);
-
 	vcpu->arch.ceded = 0;
 
 	/* Save MSR for restore, with EE clear. */
@@ -934,13 +932,13 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
 	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
 
-	accumulate_time(vcpu, &vcpu->arch.guest_time);
-
 	switch_pmu_to_guest(vcpu, &host_os_sprs);
+	accumulate_time(vcpu, &vcpu->arch.in_guest);
+
 	kvmppc_p9_enter_guest(vcpu);
-	switch_pmu_to_host(vcpu, &host_os_sprs);
 
-	accumulate_time(vcpu, &vcpu->arch.rm_intr);
+	accumulate_time(vcpu, &vcpu->arch.guest_exit);
+	switch_pmu_to_host(vcpu, &host_os_sprs);
 
 	/* XXX: Could get these from r11/12 and paca exsave instead */
 	vcpu->arch.shregs.srr0 = mfspr(SPRN_SRR0);
@@ -1035,8 +1033,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 #endif
 	}
 
-	accumulate_time(vcpu, &vcpu->arch.rm_exit);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -1143,8 +1139,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		asm volatile(PPC_CP_ABORT);
 
 out:
-	end_timing(vcpu);
-
 	return trap;
 }
 EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
-- 
2.35.1

