Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77379F8AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 05:09:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HaYO8S+o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmMk64lF3z3ddf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 13:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HaYO8S+o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmMfY4221z3cB7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 13:06:29 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c0c6d4d650so4182995ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 20:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694660787; x=1695265587; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfYGiOc8xcK7Vn4qmYetUsNfG+LL1eRQ4OGdu2ofqYg=;
        b=HaYO8S+osG0vCdngMt8MSLw0kvtCvSoLwAWrulrftFUnLG/N4CZjS2FyWNlxPKEX+g
         r6AIpTqDYUeC+aR5+YG1F1AS95AJxIOC8MhyVzEcXHg0QT7V62ERjFHkPMPyni2xsqio
         SJEYN8guAbPLtxqHY5j5FXTqPgWdg7GydJOHA1YAGXLSxAO9ukNmI1Xc1KkEw3OjK5ry
         3nz1YRUMenrTQ6+Iw+5Mhs8tlVOjsop2YlXGOoyaXlTB6qlvDjppMb2mL0ujxy6v41vs
         GePiM6rw88wSzrgPHzgn+RpfpcgpOQMGWGs+k6832S7MTLrAl74lc/RhIpkIzVeuVoeV
         NMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694660787; x=1695265587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfYGiOc8xcK7Vn4qmYetUsNfG+LL1eRQ4OGdu2ofqYg=;
        b=LrBJkbsj8rzRSYaKvVoytL6LYu1nFbFNdbrQLdb64h9vLw7FPZY2InZa9Dww4cxMxe
         g2YEmMJRJbCzNjSSvo2fJdHy0plrg0ougupGOHoml3DJX4ZTMPxzfTgF7CU+q8UbMvkX
         4v2D4cGvXfprWtB6AtZ6Oh/K8E3iTzYNsXdu7j0+aLZB9HW1T6qhLu1lr6D5YJvwPHrC
         4dklTTyEc2V8yezw4rLM7mozj4I7fqapnvkzKmb1R7W8zzdNBnLlp9Kls8DWwef4km5+
         W770k/97zV/DLLoNUqUNoxECF5oVeeIGcGf6vdi9hllC5K2/x94xfzYyfOxsHSgRk4Xh
         baOg==
X-Gm-Message-State: AOJu0YysHa2S99+6cMabZrmA1kFj/AoBjqDFE2k3/gHfB97yMkbfUKOU
	TG/nJYGNCNVkULs51x2OIphebbuqd8OYDw==
X-Google-Smtp-Source: AGHT+IG3WqcXGZgJKC+ebWxgbWbfJPrHCD9C643smhuax00LIg+lUv4dDkC1nH7oO/eEww9ZpBUIyA==
X-Received: by 2002:a17:902:be0b:b0:1c4:1089:887d with SMTP id r11-20020a170902be0b00b001c41089887dmr258473pls.3.1694660787496;
        Wed, 13 Sep 2023 20:06:27 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id w2-20020a170902904200b001b567bbe82dsm330521plz.150.2023.09.13.20.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 20:06:25 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 03/11] KVM: PPC: Rename accessor generator macros
Date: Thu, 14 Sep 2023 13:05:52 +1000
Message-Id: <20230914030600.16993-4-jniethe5@gmail.com>
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

More "wrapper" style accessor generating macros will be introduced for
the nestedv2 guest support. Rename the existing macros with more
descriptive names now so there is a consistent naming convention.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3:
  - New to series
v4:
  - Fix ACESSOR typo
---
 arch/powerpc/include/asm/kvm_ppc.h | 60 +++++++++++++++---------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index d16d80ad2ae4..d554bc56e7f3 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -927,19 +927,19 @@ static inline bool kvmppc_shared_big_endian(struct kvm_vcpu *vcpu)
 #endif
 }
 
-#define SPRNG_WRAPPER_GET(reg, bookehv_spr)				\
+#define KVMPPC_BOOKE_HV_SPRNG_ACCESSOR_GET(reg, bookehv_spr)		\
 static inline ulong kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
 	return mfspr(bookehv_spr);					\
 }									\
 
-#define SPRNG_WRAPPER_SET(reg, bookehv_spr)				\
+#define KVMPPC_BOOKE_HV_SPRNG_ACCESSOR_SET(reg, bookehv_spr)		\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, ulong val)	\
 {									\
 	mtspr(bookehv_spr, val);						\
 }									\
 
-#define SHARED_WRAPPER_GET(reg, size)					\
+#define KVMPPC_VCPU_SHARED_REGS_ACCESSOR_GET(reg, size)			\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
 	if (kvmppc_shared_big_endian(vcpu))				\
@@ -948,7 +948,7 @@ static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 	       return le##size##_to_cpu(vcpu->arch.shared->reg);	\
 }									\
 
-#define SHARED_WRAPPER_SET(reg, size)					\
+#define KVMPPC_VCPU_SHARED_REGS_ACCESSOR_SET(reg, size)			\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 	if (kvmppc_shared_big_endian(vcpu))				\
@@ -957,36 +957,36 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 	       vcpu->arch.shared->reg = cpu_to_le##size(val);		\
 }									\
 
-#define SHARED_WRAPPER(reg, size)					\
-	SHARED_WRAPPER_GET(reg, size)					\
-	SHARED_WRAPPER_SET(reg, size)					\
+#define KVMPPC_VCPU_SHARED_REGS_ACCESSOR(reg, size)			\
+	KVMPPC_VCPU_SHARED_REGS_ACCESSOR_GET(reg, size)			\
+	KVMPPC_VCPU_SHARED_REGS_ACCESSOR_SET(reg, size)			\
 
-#define SPRNG_WRAPPER(reg, bookehv_spr)					\
-	SPRNG_WRAPPER_GET(reg, bookehv_spr)				\
-	SPRNG_WRAPPER_SET(reg, bookehv_spr)				\
+#define KVMPPC_BOOKE_HV_SPRNG_ACCESSOR(reg, bookehv_spr)		\
+	KVMPPC_BOOKE_HV_SPRNG_ACCESSOR_GET(reg, bookehv_spr)		\
+	KVMPPC_BOOKE_HV_SPRNG_ACCESSOR_SET(reg, bookehv_spr)		\
 
 #ifdef CONFIG_KVM_BOOKE_HV
 
-#define SHARED_SPRNG_WRAPPER(reg, size, bookehv_spr)			\
-	SPRNG_WRAPPER(reg, bookehv_spr)					\
+#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr)	\
+	KVMPPC_BOOKE_HV_SPRNG_ACCESSOR(reg, bookehv_spr)		\
 
 #else
 
-#define SHARED_SPRNG_WRAPPER(reg, size, bookehv_spr)			\
-	SHARED_WRAPPER(reg, size)					\
+#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr)	\
+	KVMPPC_VCPU_SHARED_REGS_ACCESSOR(reg, size)			\
 
 #endif
 
-SHARED_WRAPPER(critical, 64)
-SHARED_SPRNG_WRAPPER(sprg0, 64, SPRN_GSPRG0)
-SHARED_SPRNG_WRAPPER(sprg1, 64, SPRN_GSPRG1)
-SHARED_SPRNG_WRAPPER(sprg2, 64, SPRN_GSPRG2)
-SHARED_SPRNG_WRAPPER(sprg3, 64, SPRN_GSPRG3)
-SHARED_SPRNG_WRAPPER(srr0, 64, SPRN_GSRR0)
-SHARED_SPRNG_WRAPPER(srr1, 64, SPRN_GSRR1)
-SHARED_SPRNG_WRAPPER(dar, 64, SPRN_GDEAR)
-SHARED_SPRNG_WRAPPER(esr, 64, SPRN_GESR)
-SHARED_WRAPPER_GET(msr, 64)
+KVMPPC_VCPU_SHARED_REGS_ACCESSOR(critical, 64)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg0, 64, SPRN_GSPRG0)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg1, 64, SPRN_GSPRG1)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg2, 64, SPRN_GSPRG2)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg3, 64, SPRN_GSPRG3)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr0, 64, SPRN_GSRR0)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr1, 64, SPRN_GSRR1)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(dar, 64, SPRN_GDEAR)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(esr, 64, SPRN_GESR)
+KVMPPC_VCPU_SHARED_REGS_ACCESSOR_GET(msr, 64)
 static inline void kvmppc_set_msr_fast(struct kvm_vcpu *vcpu, u64 val)
 {
 	if (kvmppc_shared_big_endian(vcpu))
@@ -994,12 +994,12 @@ static inline void kvmppc_set_msr_fast(struct kvm_vcpu *vcpu, u64 val)
 	else
 	       vcpu->arch.shared->msr = cpu_to_le64(val);
 }
-SHARED_WRAPPER(dsisr, 32)
-SHARED_WRAPPER(int_pending, 32)
-SHARED_WRAPPER(sprg4, 64)
-SHARED_WRAPPER(sprg5, 64)
-SHARED_WRAPPER(sprg6, 64)
-SHARED_WRAPPER(sprg7, 64)
+KVMPPC_VCPU_SHARED_REGS_ACCESSOR(dsisr, 32)
+KVMPPC_VCPU_SHARED_REGS_ACCESSOR(int_pending, 32)
+KVMPPC_VCPU_SHARED_REGS_ACCESSOR(sprg4, 64)
+KVMPPC_VCPU_SHARED_REGS_ACCESSOR(sprg5, 64)
+KVMPPC_VCPU_SHARED_REGS_ACCESSOR(sprg6, 64)
+KVMPPC_VCPU_SHARED_REGS_ACCESSOR(sprg7, 64)
 
 static inline u32 kvmppc_get_sr(struct kvm_vcpu *vcpu, int nr)
 {
-- 
2.39.3

