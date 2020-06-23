Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618A205812
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 18:58:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rssh43VmzDqNT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 02:58:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.150.177; helo=15.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 15.mo3.mail-out.ovh.net (15.mo3.mail-out.ovh.net
 [87.98.150.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rsqb324FzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 02:56:11 +1000 (AEST)
Received: from player693.ha.ovh.net (unknown [10.108.35.74])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id A098B259C7F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 18:50:36 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id D386013A38801;
 Tue, 23 Jun 2020 16:50:28 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0046a9a02d6-4de9-4819-8928-acddee862ae7,EED1DA90FC9B795DFFB5AB62ED4F19E3D36D96F8)
 smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] KVM: PPC: Book3S HV: Use feature flag CPU_FTR_P9_TIDR when
 accessing TIDR
Date: Tue, 23 Jun 2020 18:50:27 +0200
Message-Id: <20200623165027.271215-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3664804199253838769
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekhedgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfdvfeeguedthedvleffgeekveeiiedvveegvefhudfhffdtieekueelfeeiheeunecuffhomhgrihhnpehrmhhhrghnughlvghrshdrshgsnecukfhppedtrddtrddtrddtpdekiedrvddutddrudehvddrvdegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The TIDR register is only available on POWER9 systems and code
accessing this register is not always protected by the CPU_FTR_P9_TIDR
flag. Fix that to make sure POWER10 systems won't use it as TIDR has
been removed.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_hv.c            | 23 +++++++++++++++++------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 16 ++++++++++++----
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d64a2dc1ccca..3e5410f27a2a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1755,7 +1755,10 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.wort);
 		break;
 	case KVM_REG_PPC_TIDR:
-		*val = get_reg_val(id, vcpu->arch.tid);
+		if (cpu_has_feature(CPU_FTR_P9_TIDR))
+			*val = get_reg_val(id, vcpu->arch.tid);
+		else
+			r = -ENXIO;
 		break;
 	case KVM_REG_PPC_PSSCR:
 		*val = get_reg_val(id, vcpu->arch.psscr);
@@ -1972,7 +1975,10 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.wort = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_TIDR:
-		vcpu->arch.tid = set_reg_val(id, *val);
+		if (cpu_has_feature(CPU_FTR_P9_TIDR))
+			vcpu->arch.tid = set_reg_val(id, *val);
+		else
+			r = -ENXIO;
 		break;
 	case KVM_REG_PPC_PSSCR:
 		vcpu->arch.psscr = set_reg_val(id, *val) & PSSCR_GUEST_VIS;
@@ -3526,13 +3532,15 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	unsigned long host_dscr = mfspr(SPRN_DSCR);
-	unsigned long host_tidr = mfspr(SPRN_TIDR);
+	unsigned long host_tidr;
 	unsigned long host_iamr = mfspr(SPRN_IAMR);
 	unsigned long host_amr = mfspr(SPRN_AMR);
 	s64 dec;
 	u64 tb;
 	int trap, save_pmu;
 
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		host_tidr = mfspr(SPRN_TIDR);
 	dec = mfspr(SPRN_DEC);
 	tb = mftb();
 	if (dec < 512)
@@ -3579,7 +3587,8 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
 	mtspr(SPRN_BESCR, vcpu->arch.bescr);
 	mtspr(SPRN_WORT, vcpu->arch.wort);
-	mtspr(SPRN_TIDR, vcpu->arch.tid);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		mtspr(SPRN_TIDR, vcpu->arch.tid);
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 	mtspr(SPRN_AMR, vcpu->arch.amr);
@@ -3653,7 +3662,8 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
 	vcpu->arch.bescr = mfspr(SPRN_BESCR);
 	vcpu->arch.wort = mfspr(SPRN_WORT);
-	vcpu->arch.tid = mfspr(SPRN_TIDR);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		vcpu->arch.tid = mfspr(SPRN_TIDR);
 	vcpu->arch.amr = mfspr(SPRN_AMR);
 	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
 	vcpu->arch.dscr = mfspr(SPRN_DSCR);
@@ -3662,7 +3672,8 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_WORT, 0);
 	mtspr(SPRN_UAMOR, 0);
 	mtspr(SPRN_DSCR, host_dscr);
-	mtspr(SPRN_TIDR, host_tidr);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		mtspr(SPRN_TIDR, host_tidr);
 	mtspr(SPRN_IAMR, host_iamr);
 	mtspr(SPRN_PSPB, 0);
 
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 71943892c81c..64e454656749 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -697,9 +697,11 @@ kvmppc_got_guest:
 	/* Save host values of some registers */
 BEGIN_FTR_SECTION
 	mfspr	r5, SPRN_TIDR
+	std	r5, STACK_SLOT_TID(r1)
+END_FTR_SECTION_IFSET(CPU_FTR_P9_TIDR)
+BEGIN_FTR_SECTION
 	mfspr	r6, SPRN_PSSCR
 	mfspr	r7, SPRN_PID
-	std	r5, STACK_SLOT_TID(r1)
 	std	r6, STACK_SLOT_PSSCR(r1)
 	std	r7, STACK_SLOT_PID(r1)
 	mfspr	r5, SPRN_HFSCR
@@ -835,13 +837,15 @@ BEGIN_FTR_SECTION
 	nop
 FTR_SECTION_ELSE
 	/* POWER9-only registers */
+BEGIN_FTR_SECTION_NESTED(96);
 	ld	r5, VCPU_TID(r4)
+	mtspr	SPRN_TIDR, r5
+END_FTR_SECTION_NESTED_IFSET(CPU_FTR_P9_TIDR, 96)
 	ld	r6, VCPU_PSSCR(r4)
 	lbz	r8, HSTATE_FAKE_SUSPEND(r13)
 	oris	r6, r6, PSSCR_EC@h	/* This makes stop trap to HV */
 	rldimi	r6, r8, PSSCR_FAKE_SUSPEND_LG, 63 - PSSCR_FAKE_SUSPEND_LG
 	ld	r7, VCPU_HFSCR(r4)
-	mtspr	SPRN_TIDR, r5
 	mtspr	SPRN_PSSCR, r6
 	mtspr	SPRN_HFSCR, r7
 ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
@@ -1637,9 +1641,11 @@ BEGIN_FTR_SECTION
 	std	r7, VCPU_CSIGR(r9)
 	std	r8, VCPU_TACR(r9)
 FTR_SECTION_ELSE
+BEGIN_FTR_SECTION_NESTED(96);
 	mfspr	r5, SPRN_TIDR
-	mfspr	r6, SPRN_PSSCR
 	std	r5, VCPU_TID(r9)
+END_FTR_SECTION_NESTED_IFSET(CPU_FTR_P9_TIDR, 96)
+	mfspr	r6, SPRN_PSSCR
 	rldicl	r6, r6, 4, 50		/* r6 &= PSSCR_GUEST_VIS */
 	rotldi	r6, r6, 60
 	std	r6, VCPU_PSSCR(r9)
@@ -1771,9 +1777,11 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 BEGIN_FTR_SECTION
 	ld	r5, STACK_SLOT_TID(r1)
+	mtspr	SPRN_TIDR, r5
+END_FTR_SECTION_IFSET(CPU_FTR_P9_TIDR)
+BEGIN_FTR_SECTION
 	ld	r6, STACK_SLOT_PSSCR(r1)
 	ld	r7, STACK_SLOT_PID(r1)
-	mtspr	SPRN_TIDR, r5
 	mtspr	SPRN_PSSCR, r6
 	mtspr	SPRN_PID, r7
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-- 
2.25.4

