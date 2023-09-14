Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8E779F8AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 05:11:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ae57njcw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmMm20ftCz3dHH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 13:11:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ae57njcw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmMfn5r4Bz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 13:06:41 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68fb2e9ebcdso362629b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 20:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694660798; x=1695265598; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quAkYB9Enlr4JCakDFhG1NziT87Rmi15Sg8CUNN3A/Y=;
        b=Ae57njcwSa+vFV52pi/DU8MzNQVs/D6dY2MYK6sbeuIT7x7fxRwUscUNquD42dbj28
         +RrEfAhcTu1kl/yTvhyi27ef3oGZ78zpnflsASm5S5G2wo8FGHxHOZh2MaXSGcnLM6H1
         FQGsspsSci9LaUc9SsLdpPyWYAj1RYridB2G7cXDMLEZf2x/5Beo8WOqnZSr4KaM9Sik
         5+mnbbAd2HsnjNIzwEW343DNDAUi+5oDBF9CbVGLRxaHiCzmMAKtCwbBouapY6vRIorI
         iNAaLxdTWJOApO87xukCT+1fQ53ZHujlOCrdZUNIBKSELJPwfEZZ5wsUJIaSL8mHH7IM
         TULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694660798; x=1695265598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quAkYB9Enlr4JCakDFhG1NziT87Rmi15Sg8CUNN3A/Y=;
        b=N/hQY7BYuzhbSIbHJ86CbRtyb0mCUYGJpE729o7xzX/J7FfPJGa2i/9jEQKL6fsor4
         YsznRZh2iPvUlbWRnjvEvUNMBcfds10v29bfuEvbDwX6U6kRvDF7Hp9v1KtrCIn2/o73
         oRDjv2/4qNiF8EGLslsvMHKcYWyj1bGeF3hLW4MWKfAgXGkKygDn9+Fb4Ao4jL/iWTXw
         Ui8P4sRWdH+VaEtbefHLSAGs6lgCWey4MyNBlOaaBL0yI8w95eDwxM4YWtFkH2hukkoh
         UjMif90TZTSkbGZClADP6qecIPtGggvqXQhooADZ4+glnZixMS6HZ5j+eTF+LyD/pv0E
         Kevg==
X-Gm-Message-State: AOJu0YxjEEsj/AYmWHT6/1SW+h9hQdS3NhdFsEAVeL9eOGJidI1ZEpKm
	io0dTyPMmbSpzA1scXZk5Ye0okL8qVLjiQ==
X-Google-Smtp-Source: AGHT+IGSdqtsI0nvmOZOGcD9QXiTs5fRI904HY8of60Rh53yaCaqmiCW0hSZfUhwX0aZc6cKG54Fmw==
X-Received: by 2002:a05:6a20:f3a6:b0:14b:d28e:e947 with SMTP id qr38-20020a056a20f3a600b0014bd28ee947mr3944197pzb.48.1694660798565;
        Wed, 13 Sep 2023 20:06:38 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id w2-20020a170902904200b001b567bbe82dsm330521plz.150.2023.09.13.20.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 20:06:38 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 05/11] KVM: PPC: Use accessors for VCORE registers
Date: Thu, 14 Sep 2023 13:05:54 +1000
Message-Id: <20230914030600.16993-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230914030600.16993-1-jniethe5@gmail.com>
References: <20230914030600.16993-1-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, npiggin@gmail.com, David.Laight@ACULAB.COM, kvm-ppc@vger.kernel.org, sachinp@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce accessor generator macros for VCORE registers. Use the accessor
functions to replace direct accesses to this registers.

This will be important later for Nested APIv2 support which requires
additional functionality for accessing and modifying VCPU state.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4:
  - Split to unique patch
  - Remove _hv suffix
  - Do not generate for setter arch_compat and lpcr
---
 arch/powerpc/include/asm/kvm_book3s.h | 25 ++++++++++++++++++++++++-
 arch/powerpc/kvm/book3s_hv.c          | 24 ++++++++++++------------
 arch/powerpc/kvm/book3s_hv_ras.c      |  4 ++--
 arch/powerpc/kvm/book3s_xive.c        |  4 +---
 4 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 1a220cd63227..4c6558d5fefe 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -483,6 +483,29 @@ KVMPPC_BOOK3S_VCPU_ACCESSOR(bescr, 64)
 KVMPPC_BOOK3S_VCPU_ACCESSOR(ic, 64)
 KVMPPC_BOOK3S_VCPU_ACCESSOR(vrsave, 64)
 
+
+#define KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(reg, size)			\
+static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
+{									\
+	vcpu->arch.vcore->reg = val;					\
+}
+
+#define KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(reg, size)			\
+static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
+{									\
+	return vcpu->arch.vcore->reg;					\
+}
+
+#define KVMPPC_BOOK3S_VCORE_ACCESSOR(reg, size)				\
+	KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(reg, size)			\
+	KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(reg, size)			\
+
+
+KVMPPC_BOOK3S_VCORE_ACCESSOR(vtb, 64)
+KVMPPC_BOOK3S_VCORE_ACCESSOR(tb_offset, 64)
+KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(arch_compat, 32)
+KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(lpcr, 64)
+
 static inline u64 kvmppc_get_dec_expires(struct kvm_vcpu *vcpu)
 {
 	return vcpu->arch.dec_expires;
@@ -496,7 +519,7 @@ static inline void kvmppc_set_dec_expires(struct kvm_vcpu *vcpu, u64 val)
 /* Expiry time of vcpu DEC relative to host TB */
 static inline u64 kvmppc_dec_expires_host_tb(struct kvm_vcpu *vcpu)
 {
-	return kvmppc_get_dec_expires(vcpu) - vcpu->arch.vcore->tb_offset;
+	return kvmppc_get_dec_expires(vcpu) - kvmppc_get_tb_offset(vcpu);
 }
 
 static inline bool is_kvmppc_resume_guest(int r)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 27faecad1e3b..73d9a9eb376f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -794,7 +794,7 @@ static void kvmppc_update_vpa_dispatch(struct kvm_vcpu *vcpu,
 
 	vpa->enqueue_dispatch_tb = cpu_to_be64(be64_to_cpu(vpa->enqueue_dispatch_tb) + stolen);
 
-	__kvmppc_create_dtl_entry(vcpu, vpa, vc->pcpu, now + vc->tb_offset, stolen);
+	__kvmppc_create_dtl_entry(vcpu, vpa, vc->pcpu, now + kvmppc_get_tb_offset(vcpu), stolen);
 
 	vcpu->arch.vpa.dirty = true;
 }
@@ -845,9 +845,9 @@ static bool kvmppc_doorbell_pending(struct kvm_vcpu *vcpu)
 
 static bool kvmppc_power8_compatible(struct kvm_vcpu *vcpu)
 {
-	if (vcpu->arch.vcore->arch_compat >= PVR_ARCH_207)
+	if (kvmppc_get_arch_compat(vcpu) >= PVR_ARCH_207)
 		return true;
-	if ((!vcpu->arch.vcore->arch_compat) &&
+	if ((!kvmppc_get_arch_compat(vcpu)) &&
 	    cpu_has_feature(CPU_FTR_ARCH_207S))
 		return true;
 	return false;
@@ -2283,7 +2283,7 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 			*val = get_reg_val(id, vcpu->arch.vcore->dpdes);
 		break;
 	case KVM_REG_PPC_VTB:
-		*val = get_reg_val(id, vcpu->arch.vcore->vtb);
+		*val = get_reg_val(id, kvmppc_get_vtb(vcpu));
 		break;
 	case KVM_REG_PPC_DAWR:
 		*val = get_reg_val(id, vcpu->arch.dawr0);
@@ -2342,11 +2342,11 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		spin_unlock(&vcpu->arch.vpa_update_lock);
 		break;
 	case KVM_REG_PPC_TB_OFFSET:
-		*val = get_reg_val(id, vcpu->arch.vcore->tb_offset);
+		*val = get_reg_val(id, kvmppc_get_tb_offset(vcpu));
 		break;
 	case KVM_REG_PPC_LPCR:
 	case KVM_REG_PPC_LPCR_64:
-		*val = get_reg_val(id, vcpu->arch.vcore->lpcr);
+		*val = get_reg_val(id, kvmppc_get_lpcr(vcpu));
 		break;
 	case KVM_REG_PPC_PPR:
 		*val = get_reg_val(id, vcpu->arch.ppr);
@@ -2418,7 +2418,7 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		break;
 #endif
 	case KVM_REG_PPC_ARCH_COMPAT:
-		*val = get_reg_val(id, vcpu->arch.vcore->arch_compat);
+		*val = get_reg_val(id, kvmppc_get_arch_compat(vcpu));
 		break;
 	case KVM_REG_PPC_DEC_EXPIRY:
 		*val = get_reg_val(id, kvmppc_get_dec_expires(vcpu));
@@ -2523,7 +2523,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 			vcpu->arch.vcore->dpdes = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_VTB:
-		vcpu->arch.vcore->vtb = set_reg_val(id, *val);
+		kvmppc_set_vtb(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DAWR:
 		vcpu->arch.dawr0 = set_reg_val(id, *val);
@@ -2606,10 +2606,11 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		 * decrementer, which is better than a large one that
 		 * causes a hang.
 		 */
+		kvmppc_set_tb_offset(vcpu, tb_offset);
 		if (!kvmppc_get_dec_expires(vcpu) && tb_offset)
 			kvmppc_set_dec_expires(vcpu, get_tb() + tb_offset);
 
-		vcpu->arch.vcore->tb_offset = tb_offset;
+		kvmppc_set_tb_offset(vcpu, tb_offset);
 		break;
 	}
 	case KVM_REG_PPC_LPCR:
@@ -4042,7 +4043,6 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
 /* call our hypervisor to load up HV regs and go */
 static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	unsigned long host_psscr;
 	unsigned long msr;
 	struct hv_guest_state hvregs;
@@ -4122,7 +4122,7 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 		dec = (s32) dec;
 	*tb = mftb();
-	vcpu->arch.dec_expires = dec + (*tb + vc->tb_offset);
+	vcpu->arch.dec_expires = dec + (*tb + kvmppc_get_tb_offset(vcpu));
 
 	timer_rearm_host_dec(*tb);
 
@@ -4681,7 +4681,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	tb = mftb();
 
-	kvmppc_update_vpa_dispatch_p9(vcpu, vc, tb + vc->tb_offset);
+	kvmppc_update_vpa_dispatch_p9(vcpu, vc, tb + kvmppc_get_tb_offset(vcpu));
 
 	trace_kvm_guest_enter(vcpu);
 
diff --git a/arch/powerpc/kvm/book3s_hv_ras.c b/arch/powerpc/kvm/book3s_hv_ras.c
index 82be6d87514b..9012acadbca8 100644
--- a/arch/powerpc/kvm/book3s_hv_ras.c
+++ b/arch/powerpc/kvm/book3s_hv_ras.c
@@ -174,14 +174,14 @@ long kvmppc_p9_realmode_hmi_handler(struct kvm_vcpu *vcpu)
 		ppc_md.hmi_exception_early(NULL);
 
 out:
-	if (vc->tb_offset) {
+	if (kvmppc_get_tb_offset(vcpu)) {
 		u64 new_tb = mftb() + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
 		if ((mftb() & 0xffffff) < (new_tb & 0xffffff)) {
 			new_tb += 0x1000000;
 			mtspr(SPRN_TBU40, new_tb);
 		}
-		vc->tb_offset_applied = vc->tb_offset;
+		vc->tb_offset_applied = kvmppc_get_tb_offset(vcpu);
 	}
 
 	return ret;
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 48d11baf1f16..24d8378824a2 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -2779,8 +2779,6 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
 
 int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
 {
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-
 	/* The VM should have configured XICS mode before doing XICS hcalls. */
 	if (!kvmppc_xics_enabled(vcpu))
 		return H_TOO_HARD;
@@ -2799,7 +2797,7 @@ int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
 		return xive_vm_h_ipoll(vcpu, kvmppc_get_gpr(vcpu, 4));
 	case H_XIRR_X:
 		xive_vm_h_xirr(vcpu);
-		kvmppc_set_gpr(vcpu, 5, get_tb() + vc->tb_offset);
+		kvmppc_set_gpr(vcpu, 5, get_tb() + kvmppc_get_tb_offset(vcpu));
 		return H_SUCCESS;
 	}
 
-- 
2.39.3

