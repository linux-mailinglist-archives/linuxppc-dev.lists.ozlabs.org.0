Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F41B792035
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 05:49:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jTe2u798;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rfs2m1Qcgz3cRR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 13:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jTe2u798;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rfs063Jj7z3bhy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 13:47:34 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68a41031768so1084054b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Sep 2023 20:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693885651; x=1694490451; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MbBv2C/S+FsXIZ456uOnZ71tUTCQlLMVTw2w6JUNlU=;
        b=jTe2u798BrOu2dnDuDNbUB0G3oi9tutE72yaL0Bqfee6689wed1XdznGzzIYke6uuR
         Zw5lk493oLkezzRZMus+yq9StOeJl52C4Dtz4dIGtuwtrfpDVY2LfCnDkp1AK86KyDYK
         WRxQx3OxUxb0JNt0pmT4Q0HwavFUAK6jJ918dt/9D0S8ddgk+um5KDKT3t7vBC5TTnII
         gjOYCYriwvGNkodNeXXyh/hDqsMqvaivCyNb3VwU7qAbDJdXrCSAwLw1SSOFdnm67Qpe
         5qsn8uE8SevKM7euyY9QWF9NA+BXAuHS0xg6jYYif4NYjyEyO9LlKH1blwT5VycllDjT
         t/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693885651; x=1694490451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MbBv2C/S+FsXIZ456uOnZ71tUTCQlLMVTw2w6JUNlU=;
        b=R1okuwJbdrgbSzwCm0PRBCmMi3nyYOEwl+RWjUF1m8WYAfcIH+54+GRi0s6RNlUIyI
         rFLd/rA08fgfrWV4c4c4OS3jan+uS8c17wGBgwl4F+aP0E+KnmmbFVafDSotBkK0Z/w2
         SsUwxMAXYM6fUtCEa8TCUED2TIv2an4IK8yxKVm2v3BhJjWN4/UmXIWzva3BhAczBIVe
         IMEyK7djtG/DYZNa1MNT3dxcA9jOaaE1knRb4HCdV2ApVbGFr27JisUQ5LfCYf+fywCZ
         +pI3MGgrSVi+EqwmQti0bckyPT6/ggHwoU+NivQ/bYSUkQ6gnwOSMknmzfa0V4HdzdOk
         6v4w==
X-Gm-Message-State: AOJu0YyscmDQ3533LeWa01AfnBwr8Z5xuwmSMnYytrzO10xftUzQKQy7
	CD8JJYy7Ik6WTSbX6yUqadSXWdWwbBSgYXf8BTY=
X-Google-Smtp-Source: AGHT+IEA3Qslyry/bO8QInkL3d+l1CX/atNBD+CuOp4kqe0+80w6Zr5Zgba31Jdy2KCfN/rQ6X7CGQ==
X-Received: by 2002:a05:6a00:1741:b0:68a:6173:295b with SMTP id j1-20020a056a00174100b0068a6173295bmr12087670pfc.2.1693885651268;
        Mon, 04 Sep 2023 20:47:31 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([129.41.57.2])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0063f0068cf6csm7994951pff.198.2023.09.04.20.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 20:47:30 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 02/11] KVM: PPC: Introduce FPR/VR accessor functions
Date: Tue,  5 Sep 2023 13:46:49 +1000
Message-Id: <20230905034658.82835-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230905034658.82835-1-jniethe5@gmail.com>
References: <20230905034658.82835-1-jniethe5@gmail.com>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, npiggin@gmail.com, David.Laight@ACULAB.COM, kvm-ppc@vger.kernel.org, Jordan Niethe <jniethe5@gmail.com>, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce accessor functions for floating point and vector registers
like the ones that exist for GPRs. Use these to replace the existing FPR
and VR accessor macros.

This will be important later for Nested APIv2 support which requires
additional functionality for accessing and modifying VCPU state.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4:
  - Split into unique patch
---
 arch/powerpc/include/asm/kvm_book3s.h | 55 ++++++++++++++++++++
 arch/powerpc/include/asm/kvm_booke.h  | 10 ++++
 arch/powerpc/kvm/book3s.c             | 16 +++---
 arch/powerpc/kvm/emulate_loadstore.c  |  2 +-
 arch/powerpc/kvm/powerpc.c            | 72 +++++++++++++--------------
 5 files changed, 110 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index bbf5e2c5fe09..109a5f56767a 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -403,6 +403,61 @@ static inline ulong kvmppc_get_fault_dar(struct kvm_vcpu *vcpu)
 	return vcpu->arch.fault_dar;
 }
 
+static inline u64 kvmppc_get_fpr(struct kvm_vcpu *vcpu, int i)
+{
+	return vcpu->arch.fp.fpr[i][TS_FPROFFSET];
+}
+
+static inline void kvmppc_set_fpr(struct kvm_vcpu *vcpu, int i, u64 val)
+{
+	vcpu->arch.fp.fpr[i][TS_FPROFFSET] = val;
+}
+
+static inline u64 kvmppc_get_fpscr(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.fp.fpscr;
+}
+
+static inline void kvmppc_set_fpscr(struct kvm_vcpu *vcpu, u64 val)
+{
+	vcpu->arch.fp.fpscr = val;
+}
+
+
+static inline u64 kvmppc_get_vsx_fpr(struct kvm_vcpu *vcpu, int i, int j)
+{
+	return vcpu->arch.fp.fpr[i][j];
+}
+
+static inline void kvmppc_set_vsx_fpr(struct kvm_vcpu *vcpu, int i, int j,
+				      u64 val)
+{
+	vcpu->arch.fp.fpr[i][j] = val;
+}
+
+#ifdef CONFIG_ALTIVEC
+static inline void kvmppc_get_vsx_vr(struct kvm_vcpu *vcpu, int i, vector128 *v)
+{
+	*v =  vcpu->arch.vr.vr[i];
+}
+
+static inline void kvmppc_set_vsx_vr(struct kvm_vcpu *vcpu, int i,
+				     vector128 *val)
+{
+	vcpu->arch.vr.vr[i] = *val;
+}
+
+static inline u32 kvmppc_get_vscr(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.vr.vscr.u[3];
+}
+
+static inline void kvmppc_set_vscr(struct kvm_vcpu *vcpu, u32 val)
+{
+	vcpu->arch.vr.vscr.u[3] = val;
+}
+#endif
+
 /* Expiry time of vcpu DEC relative to host TB */
 static inline u64 kvmppc_dec_expires_host_tb(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/powerpc/include/asm/kvm_booke.h b/arch/powerpc/include/asm/kvm_booke.h
index 0c3401b2e19e..7c3291aa8922 100644
--- a/arch/powerpc/include/asm/kvm_booke.h
+++ b/arch/powerpc/include/asm/kvm_booke.h
@@ -89,6 +89,16 @@ static inline ulong kvmppc_get_pc(struct kvm_vcpu *vcpu)
 	return vcpu->arch.regs.nip;
 }
 
+static inline void kvmppc_set_fpr(struct kvm_vcpu *vcpu, int i, u64 val)
+{
+	vcpu->arch.fp.fpr[i][TS_FPROFFSET] = val;
+}
+
+static inline u64 kvmppc_get_fpr(struct kvm_vcpu *vcpu, int i)
+{
+	return vcpu->arch.fp.fpr[i][TS_FPROFFSET];
+}
+
 #ifdef CONFIG_BOOKE
 static inline ulong kvmppc_get_fault_dar(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 686d8d9eda3e..c080dd2e96ac 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -636,17 +636,17 @@ int kvmppc_get_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			break;
 		case KVM_REG_PPC_FPR0 ... KVM_REG_PPC_FPR31:
 			i = id - KVM_REG_PPC_FPR0;
-			*val = get_reg_val(id, VCPU_FPR(vcpu, i));
+			*val = get_reg_val(id, kvmppc_get_fpr(vcpu, i));
 			break;
 		case KVM_REG_PPC_FPSCR:
-			*val = get_reg_val(id, vcpu->arch.fp.fpscr);
+			*val = get_reg_val(id, kvmppc_get_fpscr(vcpu));
 			break;
 #ifdef CONFIG_VSX
 		case KVM_REG_PPC_VSR0 ... KVM_REG_PPC_VSR31:
 			if (cpu_has_feature(CPU_FTR_VSX)) {
 				i = id - KVM_REG_PPC_VSR0;
-				val->vsxval[0] = vcpu->arch.fp.fpr[i][0];
-				val->vsxval[1] = vcpu->arch.fp.fpr[i][1];
+				val->vsxval[0] = kvmppc_get_vsx_fpr(vcpu, i, 0);
+				val->vsxval[1] = kvmppc_get_vsx_fpr(vcpu, i, 1);
 			} else {
 				r = -ENXIO;
 			}
@@ -724,7 +724,7 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			break;
 		case KVM_REG_PPC_FPR0 ... KVM_REG_PPC_FPR31:
 			i = id - KVM_REG_PPC_FPR0;
-			VCPU_FPR(vcpu, i) = set_reg_val(id, *val);
+			kvmppc_set_fpr(vcpu, i, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_FPSCR:
 			vcpu->arch.fp.fpscr = set_reg_val(id, *val);
@@ -733,8 +733,8 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 		case KVM_REG_PPC_VSR0 ... KVM_REG_PPC_VSR31:
 			if (cpu_has_feature(CPU_FTR_VSX)) {
 				i = id - KVM_REG_PPC_VSR0;
-				vcpu->arch.fp.fpr[i][0] = val->vsxval[0];
-				vcpu->arch.fp.fpr[i][1] = val->vsxval[1];
+				kvmppc_set_vsx_fpr(vcpu, i, 0, val->vsxval[0]);
+				kvmppc_set_vsx_fpr(vcpu, i, 1, val->vsxval[1]);
 			} else {
 				r = -ENXIO;
 			}
@@ -765,7 +765,7 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			break;
 #endif /* CONFIG_KVM_XIVE */
 		case KVM_REG_PPC_FSCR:
-			vcpu->arch.fscr = set_reg_val(id, *val);
+			kvmppc_set_fpscr(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_TAR:
 			vcpu->arch.tar = set_reg_val(id, *val);
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 059c08ae0340..e6e66c3792f8 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -250,7 +250,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 				vcpu->arch.mmio_sp64_extend = 1;
 
 			emulated = kvmppc_handle_store(vcpu,
-					VCPU_FPR(vcpu, op.reg), size, 1);
+					kvmppc_get_fpr(vcpu, op.reg), size, 1);
 
 			if ((op.type & UPDATE) && (emulated != EMULATE_FAIL))
 				kvmppc_set_gpr(vcpu, op.update_reg, op.ea);
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 7197c8256668..2e72e5cd7532 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -934,11 +934,11 @@ static inline void kvmppc_set_vsr_dword(struct kvm_vcpu *vcpu,
 		return;
 
 	if (index >= 32) {
-		val.vval = VCPU_VSX_VR(vcpu, index - 32);
+		kvmppc_get_vsx_vr(vcpu, index - 32, &val.vval);
 		val.vsxval[offset] = gpr;
-		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
+		kvmppc_set_vsx_vr(vcpu, index - 32, &val.vval);
 	} else {
-		VCPU_VSX_FPR(vcpu, index, offset) = gpr;
+		kvmppc_set_vsx_fpr(vcpu, index, offset, gpr);
 	}
 }
 
@@ -949,13 +949,13 @@ static inline void kvmppc_set_vsr_dword_dump(struct kvm_vcpu *vcpu,
 	int index = vcpu->arch.io_gpr & KVM_MMIO_REG_MASK;
 
 	if (index >= 32) {
-		val.vval = VCPU_VSX_VR(vcpu, index - 32);
+		kvmppc_get_vsx_vr(vcpu, index - 32, &val.vval);
 		val.vsxval[0] = gpr;
 		val.vsxval[1] = gpr;
-		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
+		kvmppc_set_vsx_vr(vcpu, index - 32, &val.vval);
 	} else {
-		VCPU_VSX_FPR(vcpu, index, 0) = gpr;
-		VCPU_VSX_FPR(vcpu, index, 1) = gpr;
+		kvmppc_set_vsx_fpr(vcpu, index, 0, gpr);
+		kvmppc_set_vsx_fpr(vcpu, index, 1,  gpr);
 	}
 }
 
@@ -970,12 +970,12 @@ static inline void kvmppc_set_vsr_word_dump(struct kvm_vcpu *vcpu,
 		val.vsx32val[1] = gpr;
 		val.vsx32val[2] = gpr;
 		val.vsx32val[3] = gpr;
-		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
+		kvmppc_set_vsx_vr(vcpu, index - 32, &val.vval);
 	} else {
 		val.vsx32val[0] = gpr;
 		val.vsx32val[1] = gpr;
-		VCPU_VSX_FPR(vcpu, index, 0) = val.vsxval[0];
-		VCPU_VSX_FPR(vcpu, index, 1) = val.vsxval[0];
+		kvmppc_set_vsx_fpr(vcpu, index, 0, val.vsxval[0]);
+		kvmppc_set_vsx_fpr(vcpu, index, 1, val.vsxval[0]);
 	}
 }
 
@@ -991,15 +991,15 @@ static inline void kvmppc_set_vsr_word(struct kvm_vcpu *vcpu,
 		return;
 
 	if (index >= 32) {
-		val.vval = VCPU_VSX_VR(vcpu, index - 32);
+		kvmppc_get_vsx_vr(vcpu, index - 32, &val.vval);
 		val.vsx32val[offset] = gpr32;
-		VCPU_VSX_VR(vcpu, index - 32) = val.vval;
+		kvmppc_set_vsx_vr(vcpu, index - 32, &val.vval);
 	} else {
 		dword_offset = offset / 2;
 		word_offset = offset % 2;
-		val.vsxval[0] = VCPU_VSX_FPR(vcpu, index, dword_offset);
+		val.vsxval[0] = kvmppc_get_vsx_fpr(vcpu, index, dword_offset);
 		val.vsx32val[word_offset] = gpr32;
-		VCPU_VSX_FPR(vcpu, index, dword_offset) = val.vsxval[0];
+		kvmppc_set_vsx_fpr(vcpu, index, dword_offset, val.vsxval[0]);
 	}
 }
 #endif /* CONFIG_VSX */
@@ -1058,9 +1058,9 @@ static inline void kvmppc_set_vmx_dword(struct kvm_vcpu *vcpu,
 	if (offset == -1)
 		return;
 
-	val.vval = VCPU_VSX_VR(vcpu, index);
+	kvmppc_get_vsx_vr(vcpu, index, &val.vval);
 	val.vsxval[offset] = gpr;
-	VCPU_VSX_VR(vcpu, index) = val.vval;
+	kvmppc_set_vsx_vr(vcpu, index, &val.vval);
 }
 
 static inline void kvmppc_set_vmx_word(struct kvm_vcpu *vcpu,
@@ -1074,9 +1074,9 @@ static inline void kvmppc_set_vmx_word(struct kvm_vcpu *vcpu,
 	if (offset == -1)
 		return;
 
-	val.vval = VCPU_VSX_VR(vcpu, index);
+	kvmppc_get_vsx_vr(vcpu, index, &val.vval);
 	val.vsx32val[offset] = gpr32;
-	VCPU_VSX_VR(vcpu, index) = val.vval;
+	kvmppc_set_vsx_vr(vcpu, index, &val.vval);
 }
 
 static inline void kvmppc_set_vmx_hword(struct kvm_vcpu *vcpu,
@@ -1090,9 +1090,9 @@ static inline void kvmppc_set_vmx_hword(struct kvm_vcpu *vcpu,
 	if (offset == -1)
 		return;
 
-	val.vval = VCPU_VSX_VR(vcpu, index);
+	kvmppc_get_vsx_vr(vcpu, index, &val.vval);
 	val.vsx16val[offset] = gpr16;
-	VCPU_VSX_VR(vcpu, index) = val.vval;
+	kvmppc_set_vsx_vr(vcpu, index, &val.vval);
 }
 
 static inline void kvmppc_set_vmx_byte(struct kvm_vcpu *vcpu,
@@ -1106,9 +1106,9 @@ static inline void kvmppc_set_vmx_byte(struct kvm_vcpu *vcpu,
 	if (offset == -1)
 		return;
 
-	val.vval = VCPU_VSX_VR(vcpu, index);
+	kvmppc_get_vsx_vr(vcpu, index, &val.vval);
 	val.vsx8val[offset] = gpr8;
-	VCPU_VSX_VR(vcpu, index) = val.vval;
+	kvmppc_set_vsx_vr(vcpu, index, &val.vval);
 }
 #endif /* CONFIG_ALTIVEC */
 
@@ -1194,14 +1194,14 @@ static void kvmppc_complete_mmio_load(struct kvm_vcpu *vcpu)
 		if (vcpu->kvm->arch.kvm_ops->giveup_ext)
 			vcpu->kvm->arch.kvm_ops->giveup_ext(vcpu, MSR_FP);
 
-		VCPU_FPR(vcpu, vcpu->arch.io_gpr & KVM_MMIO_REG_MASK) = gpr;
+		kvmppc_set_fpr(vcpu, vcpu->arch.io_gpr & KVM_MMIO_REG_MASK, gpr);
 		break;
 #ifdef CONFIG_PPC_BOOK3S
 	case KVM_MMIO_REG_QPR:
 		vcpu->arch.qpr[vcpu->arch.io_gpr & KVM_MMIO_REG_MASK] = gpr;
 		break;
 	case KVM_MMIO_REG_FQPR:
-		VCPU_FPR(vcpu, vcpu->arch.io_gpr & KVM_MMIO_REG_MASK) = gpr;
+		kvmppc_set_fpr(vcpu, vcpu->arch.io_gpr & KVM_MMIO_REG_MASK, gpr);
 		vcpu->arch.qpr[vcpu->arch.io_gpr & KVM_MMIO_REG_MASK] = gpr;
 		break;
 #endif
@@ -1419,9 +1419,9 @@ static inline int kvmppc_get_vsr_data(struct kvm_vcpu *vcpu, int rs, u64 *val)
 		}
 
 		if (rs < 32) {
-			*val = VCPU_VSX_FPR(vcpu, rs, vsx_offset);
+			*val = kvmppc_get_vsx_fpr(vcpu, rs, vsx_offset);
 		} else {
-			reg.vval = VCPU_VSX_VR(vcpu, rs - 32);
+			kvmppc_get_vsx_vr(vcpu, rs - 32, &reg.vval);
 			*val = reg.vsxval[vsx_offset];
 		}
 		break;
@@ -1438,10 +1438,10 @@ static inline int kvmppc_get_vsr_data(struct kvm_vcpu *vcpu, int rs, u64 *val)
 		if (rs < 32) {
 			dword_offset = vsx_offset / 2;
 			word_offset = vsx_offset % 2;
-			reg.vsxval[0] = VCPU_VSX_FPR(vcpu, rs, dword_offset);
+			reg.vsxval[0] = kvmppc_get_vsx_fpr(vcpu, rs, dword_offset);
 			*val = reg.vsx32val[word_offset];
 		} else {
-			reg.vval = VCPU_VSX_VR(vcpu, rs - 32);
+			kvmppc_get_vsx_vr(vcpu, rs - 32, &reg.vval);
 			*val = reg.vsx32val[vsx_offset];
 		}
 		break;
@@ -1556,7 +1556,7 @@ static int kvmppc_get_vmx_dword(struct kvm_vcpu *vcpu, int index, u64 *val)
 	if (vmx_offset == -1)
 		return -1;
 
-	reg.vval = VCPU_VSX_VR(vcpu, index);
+	kvmppc_get_vsx_vr(vcpu, index, &reg.vval);
 	*val = reg.vsxval[vmx_offset];
 
 	return result;
@@ -1574,7 +1574,7 @@ static int kvmppc_get_vmx_word(struct kvm_vcpu *vcpu, int index, u64 *val)
 	if (vmx_offset == -1)
 		return -1;
 
-	reg.vval = VCPU_VSX_VR(vcpu, index);
+	kvmppc_get_vsx_vr(vcpu, index, &reg.vval);
 	*val = reg.vsx32val[vmx_offset];
 
 	return result;
@@ -1592,7 +1592,7 @@ static int kvmppc_get_vmx_hword(struct kvm_vcpu *vcpu, int index, u64 *val)
 	if (vmx_offset == -1)
 		return -1;
 
-	reg.vval = VCPU_VSX_VR(vcpu, index);
+	kvmppc_get_vsx_vr(vcpu, index, &reg.vval);
 	*val = reg.vsx16val[vmx_offset];
 
 	return result;
@@ -1610,7 +1610,7 @@ static int kvmppc_get_vmx_byte(struct kvm_vcpu *vcpu, int index, u64 *val)
 	if (vmx_offset == -1)
 		return -1;
 
-	reg.vval = VCPU_VSX_VR(vcpu, index);
+	kvmppc_get_vsx_vr(vcpu, index, &reg.vval);
 	*val = reg.vsx8val[vmx_offset];
 
 	return result;
@@ -1719,14 +1719,14 @@ int kvm_vcpu_ioctl_get_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
 				r = -ENXIO;
 				break;
 			}
-			val.vval = vcpu->arch.vr.vr[reg->id - KVM_REG_PPC_VR0];
+			kvmppc_get_vsx_vr(vcpu, reg->id - KVM_REG_PPC_VR0, &val.vval);
 			break;
 		case KVM_REG_PPC_VSCR:
 			if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
 				r = -ENXIO;
 				break;
 			}
-			val = get_reg_val(reg->id, vcpu->arch.vr.vscr.u[3]);
+			val = get_reg_val(reg->id, kvmppc_get_vscr(vcpu));
 			break;
 		case KVM_REG_PPC_VRSAVE:
 			val = get_reg_val(reg->id, vcpu->arch.vrsave);
@@ -1770,14 +1770,14 @@ int kvm_vcpu_ioctl_set_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
 				r = -ENXIO;
 				break;
 			}
-			vcpu->arch.vr.vr[reg->id - KVM_REG_PPC_VR0] = val.vval;
+			kvmppc_set_vsx_vr(vcpu, reg->id - KVM_REG_PPC_VR0, &val.vval);
 			break;
 		case KVM_REG_PPC_VSCR:
 			if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
 				r = -ENXIO;
 				break;
 			}
-			vcpu->arch.vr.vscr.u[3] = set_reg_val(reg->id, val);
+			kvmppc_set_vscr(vcpu, set_reg_val(reg->id, val));
 			break;
 		case KVM_REG_PPC_VRSAVE:
 			if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
-- 
2.39.3

