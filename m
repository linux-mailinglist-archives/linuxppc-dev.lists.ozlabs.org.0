Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B09792036
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 05:50:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E1wwQS43;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rfs3t1jC6z3cPD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 13:50:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E1wwQS43;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rfs0G6FLrz3bjc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 13:47:42 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-54290603887so1061967a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Sep 2023 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693885660; x=1694490460; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfYGiOc8xcK7Vn4qmYetUsNfG+LL1eRQ4OGdu2ofqYg=;
        b=E1wwQS43igTW4Yi6/BqHQqdBggqDfKu1WkQynlwmvQLRlxzWduHMmypCzRfuJwn9SA
         48ssuIfB1ye+g2HA5k9nvoH4jgTiK/5xbNUgLLTibjW8vf+i7LMztw66p/3SF+cchX74
         hVZbgM2qgIi93k+zh4m/P57nZvCQ5y41ZPs0CMBY7oZ7ZhpXXb0cxEFAQaY0RG+C/tpf
         CSj1nD3twY9GvaPArTQvE/n1iyHyUSXMUgVm2pkP6jtTexTjy0pdcsjGreKgUJ9sZjda
         wHz8qXCgiMzE5GHmgNpTBFBurLXahgzuBdmWcjk4H6OKe/aXNL+upaghGVDbBquvjHBo
         zA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693885660; x=1694490460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfYGiOc8xcK7Vn4qmYetUsNfG+LL1eRQ4OGdu2ofqYg=;
        b=UT8Lm8tuyRMhX7D7kfkgevQjCsHMNie73q4QG0lMiOAtfncCl6kUzKJzCbeM8rwMgY
         2umj3TyaLls7OtC7GhjWO1qbv0yYs0+3MXzYqZaUavGRJwoWSHAD/fR3jC8wD86qoq8e
         e4TDIZwgMuIbCIo3RJHCV+dntFVGY4ZedZMKqdyMP7TO2No4U4hGP8FmjbWhWvSdsjMJ
         snRUFiH6xd+jOFdNGws+txJpU1Ej+8rQQr3yr48XwbDZT1OsIAcNZnGtZ0FqphIwmgkB
         PIo8Dc2nhQ2szx/eZRJ2iE5MKpl0h4jG9tsVTtGO5XNVMqC2qkzUCFmxcdFlfYdQAyxJ
         yc/g==
X-Gm-Message-State: AOJu0YzHoH+RyNL1jk7EB5lqszqHCAKImP321TT03XXoxnL4aI9m5zoo
	UQ0+1ey7m2W6yp0YX9qZD1pvj8ScOpNpc36sY4A=
X-Google-Smtp-Source: AGHT+IEj8hNU5vIYi4xMcpdm/xTNOK09AHlZTYZQyqO6QJuKyCrKM4h0tjTIKRtrWBIrqmEyxWt2mQ==
X-Received: by 2002:a05:6a20:13d3:b0:14d:4673:4300 with SMTP id ho19-20020a056a2013d300b0014d46734300mr9452330pzc.56.1693885659942;
        Mon, 04 Sep 2023 20:47:39 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([129.41.57.2])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0063f0068cf6csm7994951pff.198.2023.09.04.20.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 20:47:39 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 03/11] KVM: PPC: Rename accessor generator macros
Date: Tue,  5 Sep 2023 13:46:50 +1000
Message-Id: <20230905034658.82835-4-jniethe5@gmail.com>
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

