Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE377180E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 03:48:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bRLdrKHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJzkd669Jz3cWP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 11:48:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bRLdrKHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJzgX5s0vz3012
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 11:46:16 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686ba97e4feso3884059b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Aug 2023 18:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691372773; x=1691977573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2NckWVGzVKoAl4zO6MDkmoo78bvtrIDrF0tB1Y+yFs=;
        b=bRLdrKHAtAxSZegViCpn3odNY1hP1C9eKxb6+4VWmTVxB6XcBaXOMZ+B76jUAd4qxC
         9NhHmjOaEMViBYfeaaKLMVhNzDm0YxpY3cjAsvfK13+5/q7CM5j9a+59y7SxqrtVBEGh
         /Okkm6BywQ+PTIF9qtZv8fQMTkBmdgE185jYjaU+/LFYVdyfu4tpBG0nZhqPCMhTTQdJ
         jBDTSCSZBFmX5Qi7+Q1lmWlX6mjs+NhEsDCeK52kzzL0TdriVH6U0OuuuqS3TkFhI/m8
         HR4PV1IIh/G/uaH1ZKS2uFTLXC6ipSRozqWvjFxP79JjsNZvPWea2gL5JYeTrWQubTYY
         5TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691372773; x=1691977573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2NckWVGzVKoAl4zO6MDkmoo78bvtrIDrF0tB1Y+yFs=;
        b=NbZ9JwdDg2NHNMEipMgOxpyPttjFhOW1YtuP9Ox8Vm22y4MqvXsgQxlCtk6OVqKpE+
         +RTq8t9zwS7go7hDF7Ftw+seYzwHsUy8UrGBEhONJfIwRY/gAwxuK/hNMC9YH8/pXFlL
         OufxoqLQRynlxAqPKv2QlqkcDesrKLS2yYz4+RNUeFXmd0D3PSq+xYK5cMvQBx6D39Hi
         UfKz0BAB+4p00j+X3RlqJQ91x9/fvcsBn6jOBLtKNhDZkl4580yzfuT1GUiaHwSXRCki
         UKikEhPe201TmpMAXg0Q2J2g7yBp6qZ9z3yjnvVLw7XBFbZXXgxpOFS5Au3O+MaS95Ii
         ojng==
X-Gm-Message-State: AOJu0YxOj2pXdOPHGyz73HhRuD5/A726KQgkkj89Tite3LnELn+aIFNq
	bC/vLzp4i3eK5wUK5nIKdMgaTi/4ZvvonA==
X-Google-Smtp-Source: AGHT+IHFD/DItQGDvrYNtM85A9C+YKuIf6ubYuE3IxGBKTF72362heV316NTO63AcU3aAOYzrHWwHQ==
X-Received: by 2002:a05:6a20:385:b0:138:834:5dc7 with SMTP id 5-20020a056a20038500b0013808345dc7mr7096665pzt.30.1691372773572;
        Sun, 06 Aug 2023 18:46:13 -0700 (PDT)
Received: from pwon.ibmuc.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.gmail.com with ESMTPSA id jk16-20020a170903331000b001b9e0918b0asm5485139plb.169.2023.08.06.18.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 18:46:13 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/6] KVM: PPC: Rename accessor generator macros
Date: Mon,  7 Aug 2023 11:45:49 +1000
Message-Id: <20230807014553.1168699-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230807014553.1168699-1-jniethe5@gmail.com>
References: <20230807014553.1168699-1-jniethe5@gmail.com>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

More "wrapper" style accessor generating macros will be introduced for
the nestedv2 guest support. Rename the existing macros with more
descriptive names now so there is a consistent naming convention.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3:
  - New to series
---
 arch/powerpc/include/asm/kvm_ppc.h | 60 +++++++++++++++---------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index d16d80ad2ae4..b66084a81dd0 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -927,19 +927,19 @@ static inline bool kvmppc_shared_big_endian(struct kvm_vcpu *vcpu)
 #endif
 }
 
-#define SPRNG_WRAPPER_GET(reg, bookehv_spr)				\
+#define KVMPPC_BOOKE_HV_SPRNG_ACESSOR_GET(reg, bookehv_spr)		\
 static inline ulong kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
 	return mfspr(bookehv_spr);					\
 }									\
 
-#define SPRNG_WRAPPER_SET(reg, bookehv_spr)				\
+#define KVMPPC_BOOKE_HV_SPRNG_ACESSOR_SET(reg, bookehv_spr)		\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, ulong val)	\
 {									\
 	mtspr(bookehv_spr, val);						\
 }									\
 
-#define SHARED_WRAPPER_GET(reg, size)					\
+#define KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(reg, size)			\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
 	if (kvmppc_shared_big_endian(vcpu))				\
@@ -948,7 +948,7 @@ static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 	       return le##size##_to_cpu(vcpu->arch.shared->reg);	\
 }									\
 
-#define SHARED_WRAPPER_SET(reg, size)					\
+#define KVMPPC_VCPU_SHARED_REGS_ACESSOR_SET(reg, size)			\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 	if (kvmppc_shared_big_endian(vcpu))				\
@@ -957,36 +957,36 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 	       vcpu->arch.shared->reg = cpu_to_le##size(val);		\
 }									\
 
-#define SHARED_WRAPPER(reg, size)					\
-	SHARED_WRAPPER_GET(reg, size)					\
-	SHARED_WRAPPER_SET(reg, size)					\
+#define KVMPPC_VCPU_SHARED_REGS_ACESSOR(reg, size)					\
+	KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(reg, size)					\
+	KVMPPC_VCPU_SHARED_REGS_ACESSOR_SET(reg, size)					\
 
-#define SPRNG_WRAPPER(reg, bookehv_spr)					\
-	SPRNG_WRAPPER_GET(reg, bookehv_spr)				\
-	SPRNG_WRAPPER_SET(reg, bookehv_spr)				\
+#define KVMPPC_BOOKE_HV_SPRNG_ACESSOR(reg, bookehv_spr)					\
+	KVMPPC_BOOKE_HV_SPRNG_ACESSOR_GET(reg, bookehv_spr)				\
+	KVMPPC_BOOKE_HV_SPRNG_ACESSOR_SET(reg, bookehv_spr)				\
 
 #ifdef CONFIG_KVM_BOOKE_HV
 
-#define SHARED_SPRNG_WRAPPER(reg, size, bookehv_spr)			\
-	SPRNG_WRAPPER(reg, bookehv_spr)					\
+#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr)	\
+	KVMPPC_BOOKE_HV_SPRNG_ACESSOR(reg, bookehv_spr)			\
 
 #else
 
-#define SHARED_SPRNG_WRAPPER(reg, size, bookehv_spr)			\
-	SHARED_WRAPPER(reg, size)					\
+#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr)	\
+	KVMPPC_VCPU_SHARED_REGS_ACESSOR(reg, size)			\
 
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
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(critical, 64)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg0, 64, SPRN_GSPRG0)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg1, 64, SPRN_GSPRG1)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg2, 64, SPRN_GSPRG2)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg3, 64, SPRN_GSPRG3)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr0, 64, SPRN_GSRR0)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr1, 64, SPRN_GSRR1)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(dar, 64, SPRN_GDEAR)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(esr, 64, SPRN_GESR)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(msr, 64)
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
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(dsisr, 32)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(int_pending, 32)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg4, 64)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg5, 64)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg6, 64)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg7, 64)
 
 static inline u32 kvmppc_get_sr(struct kvm_vcpu *vcpu, int nr)
 {
-- 
2.39.3

