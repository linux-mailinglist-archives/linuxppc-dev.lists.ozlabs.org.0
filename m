Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C1079F8AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 05:10:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CcjCnOzC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmMl46p3Bz3dK4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 13:10:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CcjCnOzC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmMfh22Fhz3cF4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 13:06:36 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so3997335ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 20:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694660793; x=1695265593; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NCd3zXYijLU4BSO+1Z6fSOlgVMAIDUZ/MAH8e1hDO4=;
        b=CcjCnOzCoc0kwGcpnZYfAb6YQxDgorlrsgLHyMXPkzmhf48jREm/WLYClXSsY5ZI0N
         RK9eSNdEqiDtsE+q4aR7B5jDz+MSm5WwzdfDhpzJdtsWQxM9AaRb4xEi0QsJu1CCBAzb
         zT8MAmn5D07DXZErYZj1zFPAL8mQ0Jfpw0nOFI/9BRUbQ/ezYNl/Lji/wpm/UXD6GsUs
         T4WRohSdrICqH9IM3cn6eytLjknN3mvJw4YNLTGOnaeaLXTlLygPcKHEfLZqaYgnBoLG
         7DzdTJlCOeAFGGo+EUJg+PX/qPGm0KKNhfYa1nMtEwF5pX+RtkehplSDSV3K0gdk2XY0
         c7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694660793; x=1695265593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NCd3zXYijLU4BSO+1Z6fSOlgVMAIDUZ/MAH8e1hDO4=;
        b=qfI1e/212ljedi2Ct8xazpKGqlnul8G3AnRg/sXXdgTolkt/3HGWwfWe/LGYdOCKCX
         ghtgDOu1G7MYtmqZsyt0RF8aYfwfNdGNK5PVZFdxd+KTxHeDoxj0DFzvp+fOSe+x2/Rw
         KV6ywFIrmhKIiHrt3mGZ2i6Lt/MG/YV2dRbuxTFR4YzZ78Jr6VBUNf3exGmpTGqS0oBr
         haN5NexTs/7XuiAfNe/bNU6QVZ8QRJd6lQNla558kHAUZ2DxIq/TBU5QHVSed4KvDXAV
         4aQ3/OkgqM4dV7n00/ixxm5sS56h3FOva+PiymplpFJyvph9ErzPGVysn32QNeSYyhbb
         5bXg==
X-Gm-Message-State: AOJu0Yxpqd3DjMS77gy6suDl3GuanGgxgpRi9fCEK+JF13IRcnQKH+ZS
	AgjlW+kKZoW4HeFljMCv9EWFDm/CvTNFag==
X-Google-Smtp-Source: AGHT+IGVTYnkIyxRElaV0lHecRhU/0lomc867gK1VKXoa3t4TA+HovFirqpSneZH/nMjO3TJx9XSuQ==
X-Received: by 2002:a17:903:428d:b0:1bd:a42a:215e with SMTP id ju13-20020a170903428d00b001bda42a215emr3964600plb.38.1694660792964;
        Wed, 13 Sep 2023 20:06:32 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id w2-20020a170902904200b001b567bbe82dsm330521plz.150.2023.09.13.20.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 20:06:32 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 04/11] KVM: PPC: Use accessors for VCPU registers
Date: Thu, 14 Sep 2023 13:05:53 +1000
Message-Id: <20230914030600.16993-5-jniethe5@gmail.com>
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

Introduce accessor generator macros for VCPU registers. Use the accessor
functions to replace direct accesses to this registers.

This will be important later for Nested APIv2 support which requires
additional functionality for accessing and modifying VCPU state.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4:
  - Split to unique patch
---
 arch/powerpc/include/asm/kvm_book3s.h  | 37 +++++++++++++++++++++++++-
 arch/powerpc/kvm/book3s.c              | 22 +++++++--------
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  4 +--
 arch/powerpc/kvm/book3s_hv.c           | 12 ++++-----
 arch/powerpc/kvm/book3s_hv_p9_entry.c  |  4 +--
 arch/powerpc/kvm/powerpc.c             |  4 +--
 6 files changed, 59 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 109a5f56767a..1a220cd63227 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -458,10 +458,45 @@ static inline void kvmppc_set_vscr(struct kvm_vcpu *vcpu, u32 val)
 }
 #endif
 
+#define KVMPPC_BOOK3S_VCPU_ACCESSOR_SET(reg, size)			\
+static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
+{									\
+									\
+	vcpu->arch.reg = val;						\
+}
+
+#define KVMPPC_BOOK3S_VCPU_ACCESSOR_GET(reg, size)			\
+static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
+{									\
+	return vcpu->arch.reg;						\
+}
+
+#define KVMPPC_BOOK3S_VCPU_ACCESSOR(reg, size)				\
+	KVMPPC_BOOK3S_VCPU_ACCESSOR_SET(reg, size)			\
+	KVMPPC_BOOK3S_VCPU_ACCESSOR_GET(reg, size)			\
+
+KVMPPC_BOOK3S_VCPU_ACCESSOR(pid, 32)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(tar, 64)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(ebbhr, 64)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(ebbrr, 64)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(bescr, 64)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(ic, 64)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(vrsave, 64)
+
+static inline u64 kvmppc_get_dec_expires(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.dec_expires;
+}
+
+static inline void kvmppc_set_dec_expires(struct kvm_vcpu *vcpu, u64 val)
+{
+	vcpu->arch.dec_expires = val;
+}
+
 /* Expiry time of vcpu DEC relative to host TB */
 static inline u64 kvmppc_dec_expires_host_tb(struct kvm_vcpu *vcpu)
 {
-	return vcpu->arch.dec_expires - vcpu->arch.vcore->tb_offset;
+	return kvmppc_get_dec_expires(vcpu) - vcpu->arch.vcore->tb_offset;
 }
 
 static inline bool is_kvmppc_resume_guest(int r)
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index c080dd2e96ac..6cd20ab9e94e 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -565,7 +565,7 @@ int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	regs->msr = kvmppc_get_msr(vcpu);
 	regs->srr0 = kvmppc_get_srr0(vcpu);
 	regs->srr1 = kvmppc_get_srr1(vcpu);
-	regs->pid = vcpu->arch.pid;
+	regs->pid = kvmppc_get_pid(vcpu);
 	regs->sprg0 = kvmppc_get_sprg0(vcpu);
 	regs->sprg1 = kvmppc_get_sprg1(vcpu);
 	regs->sprg2 = kvmppc_get_sprg2(vcpu);
@@ -683,19 +683,19 @@ int kvmppc_get_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			*val = get_reg_val(id, vcpu->arch.fscr);
 			break;
 		case KVM_REG_PPC_TAR:
-			*val = get_reg_val(id, vcpu->arch.tar);
+			*val = get_reg_val(id, kvmppc_get_tar(vcpu));
 			break;
 		case KVM_REG_PPC_EBBHR:
-			*val = get_reg_val(id, vcpu->arch.ebbhr);
+			*val = get_reg_val(id, kvmppc_get_ebbhr(vcpu));
 			break;
 		case KVM_REG_PPC_EBBRR:
-			*val = get_reg_val(id, vcpu->arch.ebbrr);
+			*val = get_reg_val(id, kvmppc_get_ebbrr(vcpu));
 			break;
 		case KVM_REG_PPC_BESCR:
-			*val = get_reg_val(id, vcpu->arch.bescr);
+			*val = get_reg_val(id, kvmppc_get_bescr(vcpu));
 			break;
 		case KVM_REG_PPC_IC:
-			*val = get_reg_val(id, vcpu->arch.ic);
+			*val = get_reg_val(id, kvmppc_get_ic(vcpu));
 			break;
 		default:
 			r = -EINVAL;
@@ -768,19 +768,19 @@ int kvmppc_set_one_reg(struct kvm_vcpu *vcpu, u64 id,
 			kvmppc_set_fpscr(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_TAR:
-			vcpu->arch.tar = set_reg_val(id, *val);
+			kvmppc_set_tar(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_EBBHR:
-			vcpu->arch.ebbhr = set_reg_val(id, *val);
+			kvmppc_set_ebbhr(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_EBBRR:
-			vcpu->arch.ebbrr = set_reg_val(id, *val);
+			kvmppc_set_ebbrr(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_BESCR:
-			vcpu->arch.bescr = set_reg_val(id, *val);
+			kvmppc_set_bescr(vcpu, set_reg_val(id, *val));
 			break;
 		case KVM_REG_PPC_IC:
-			vcpu->arch.ic = set_reg_val(id, *val);
+			kvmppc_set_ic(vcpu, set_reg_val(id, *val));
 			break;
 		default:
 			r = -EINVAL;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 572707858d65..5c71d6ae3a7b 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -96,7 +96,7 @@ static long kvmhv_copy_tofrom_guest_radix(struct kvm_vcpu *vcpu, gva_t eaddr,
 					  void *to, void *from, unsigned long n)
 {
 	int lpid = vcpu->kvm->arch.lpid;
-	int pid = vcpu->arch.pid;
+	int pid = kvmppc_get_pid(vcpu);
 
 	/* This would cause a data segment intr so don't allow the access */
 	if (eaddr & (0x3FFUL << 52))
@@ -270,7 +270,7 @@ int kvmppc_mmu_radix_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 	/* Work out effective PID */
 	switch (eaddr >> 62) {
 	case 0:
-		pid = vcpu->arch.pid;
+		pid = kvmppc_get_pid(vcpu);
 		break;
 	case 3:
 		pid = 0;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4af5b68cf7f8..27faecad1e3b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2310,7 +2310,7 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.tcscr);
 		break;
 	case KVM_REG_PPC_PID:
-		*val = get_reg_val(id, vcpu->arch.pid);
+		*val = get_reg_val(id, kvmppc_get_pid(vcpu));
 		break;
 	case KVM_REG_PPC_ACOP:
 		*val = get_reg_val(id, vcpu->arch.acop);
@@ -2421,7 +2421,7 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.vcore->arch_compat);
 		break;
 	case KVM_REG_PPC_DEC_EXPIRY:
-		*val = get_reg_val(id, vcpu->arch.dec_expires);
+		*val = get_reg_val(id, kvmppc_get_dec_expires(vcpu));
 		break;
 	case KVM_REG_PPC_ONLINE:
 		*val = get_reg_val(id, vcpu->arch.online);
@@ -2553,7 +2553,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.tcscr = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_PID:
-		vcpu->arch.pid = set_reg_val(id, *val);
+		kvmppc_set_pid(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_ACOP:
 		vcpu->arch.acop = set_reg_val(id, *val);
@@ -2606,8 +2606,8 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		 * decrementer, which is better than a large one that
 		 * causes a hang.
 		 */
-		if (!vcpu->arch.dec_expires && tb_offset)
-			vcpu->arch.dec_expires = get_tb() + tb_offset;
+		if (!kvmppc_get_dec_expires(vcpu) && tb_offset)
+			kvmppc_set_dec_expires(vcpu, get_tb() + tb_offset);
 
 		vcpu->arch.vcore->tb_offset = tb_offset;
 		break;
@@ -2690,7 +2690,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		r = kvmppc_set_arch_compat(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DEC_EXPIRY:
-		vcpu->arch.dec_expires = set_reg_val(id, *val);
+		kvmppc_set_dec_expires(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_ONLINE:
 		i = set_reg_val(id, *val);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 34f1db212824..34bc0a8a1288 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -305,7 +305,7 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u6
 	u32 pid;
 
 	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
-	pid = vcpu->arch.pid;
+	pid = kvmppc_get_pid(vcpu);
 
 	/*
 	 * Prior memory accesses to host PID Q3 must be completed before we
@@ -330,7 +330,7 @@ static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64
 	int i;
 
 	lpid = kvm->arch.lpid;
-	pid = vcpu->arch.pid;
+	pid = kvmppc_get_pid(vcpu);
 
 	/*
 	 * See switch_mmu_to_guest_radix. ptesync should not be required here
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2e72e5cd7532..f6af752698d0 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1729,7 +1729,7 @@ int kvm_vcpu_ioctl_get_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
 			val = get_reg_val(reg->id, kvmppc_get_vscr(vcpu));
 			break;
 		case KVM_REG_PPC_VRSAVE:
-			val = get_reg_val(reg->id, vcpu->arch.vrsave);
+			val = get_reg_val(reg->id, kvmppc_get_vrsave(vcpu));
 			break;
 #endif /* CONFIG_ALTIVEC */
 		default:
@@ -1784,7 +1784,7 @@ int kvm_vcpu_ioctl_set_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
 				r = -ENXIO;
 				break;
 			}
-			vcpu->arch.vrsave = set_reg_val(reg->id, val);
+			kvmppc_set_vrsave(vcpu, set_reg_val(reg->id, val));
 			break;
 #endif /* CONFIG_ALTIVEC */
 		default:
-- 
2.39.3

