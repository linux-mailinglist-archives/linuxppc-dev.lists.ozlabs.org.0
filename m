Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8CA79F8AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 05:12:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rtjr6csp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmMn71WBRz3dhc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 13:12:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rtjr6csp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmMft2Bjqz3cN2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 13:06:46 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c39a4f14bcso4167825ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 20:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694660804; x=1695265604; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlADX5cLMMiTlvLrOyPgc/FqO62OU+5sT3PsPDqWJ50=;
        b=rtjr6cspxB8AcNiQGXPxcn1Uc0f/7VW9QDHNmhNg+BxgqYhBARW7Gs9F6qCMgsnwki
         KADjmv18/gtzgpSx41g0gsSqfFjYjTmUxFdSJErTtEnYqEZhiRKL0AkfLeT/SY3it7vT
         mUvfohXel3IepEFLJLt8Wymnan3H0Wzl78hQRU59TvwPbouGwvO2XcGHdrK55z4aN4v2
         8N6of+RBC0fVp4WKjM4eXe9vudk2Yr6eCi5oeLMKyYddA69ypuTGGElbeoMh3+2GKvJA
         xVApRscWgMp3VHE4DY6S1dJOrj/k1ulRnQ4IydocrvUw/rFyCJ9tRDspHR41X4zYXCgb
         FZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694660804; x=1695265604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlADX5cLMMiTlvLrOyPgc/FqO62OU+5sT3PsPDqWJ50=;
        b=dkpWrJw6juMPgvXv7RWk3gGpGmCK0bL6OW1BNjMgmAyTd7X+iVTccg5UnAHOjJEBNk
         k8EhbteruhZrMybeoSITeeoHXW+wZ/o+TlLX6h1ONHJyngAueGXzYE8YmIFLm4HTNl/R
         ZpksEd9Mh14DITPLqyCpXUQ5whf1AF64FiH50lNnBg41ulx9tqpukdCEdMfiF45g5lkt
         sVZq6FjmzSMgtv/xzgWQxoDTWBHlOMaRjmMITlwWRVGY9Uyjf5lpatDM/a9wz1slj5bT
         lwV4yRXXsnjPajVyQMEzBEzeGDsCjPG/hxtqLrn6z9IN5jQfC8xH1XhUgpVlFapSvvLC
         mO4w==
X-Gm-Message-State: AOJu0YyJtEDf/4pEu8QQfsTjZ3ZE2pcUbkyTF1jfu1ExuhXxUbz96yxp
	jqIsdm0u8xZkd1oBg+uAnWMxcCxId4Sddg==
X-Google-Smtp-Source: AGHT+IG40PbVRDrqCD5BnTYlJVEjCz+TtMeK3ffvXx/VZmiOnjAwKWxnDQ6l7nlQPX+yiVHm9SANrA==
X-Received: by 2002:a17:902:be08:b0:1b0:f8:9b2d with SMTP id r8-20020a170902be0800b001b000f89b2dmr4113112pls.29.1694660804140;
        Wed, 13 Sep 2023 20:06:44 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id w2-20020a170902904200b001b567bbe82dsm330521plz.150.2023.09.13.20.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 20:06:43 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 06/11] KVM: PPC: Book3S HV: Use accessors for VCPU registers
Date: Thu, 14 Sep 2023 13:05:55 +1000
Message-Id: <20230914030600.16993-7-jniethe5@gmail.com>
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

Introduce accessor generator macros for Book3S HV VCPU registers. Use
the accessor functions to replace direct accesses to this registers.

This will be important later for Nested APIv2 support which requires
additional functionality for accessing and modifying VCPU state.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4:
  - Split to unique patch
v5:
  - Remove unneeded trailing comment for line length
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c |   5 +-
 arch/powerpc/kvm/book3s_hv.c           | 148 +++++++++++++------------
 arch/powerpc/kvm/book3s_hv.h           |  58 ++++++++++
 3 files changed, 139 insertions(+), 72 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 5c71d6ae3a7b..ab646f59afd7 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -15,6 +15,7 @@
 
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
+#include "book3s_hv.h"
 #include <asm/page.h>
 #include <asm/mmu.h>
 #include <asm/pgalloc.h>
@@ -294,9 +295,9 @@ int kvmppc_mmu_radix_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 	} else {
 		if (!(pte & _PAGE_PRIVILEGED)) {
 			/* Check AMR/IAMR to see if strict mode is in force */
-			if (vcpu->arch.amr & (1ul << 62))
+			if (kvmppc_get_amr_hv(vcpu) & (1ul << 62))
 				gpte->may_read = 0;
-			if (vcpu->arch.amr & (1ul << 63))
+			if (kvmppc_get_amr_hv(vcpu) & (1ul << 63))
 				gpte->may_write = 0;
 			if (vcpu->arch.iamr & (1ul << 62))
 				gpte->may_execute = 0;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 73d9a9eb376f..25025f6c4cce 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -868,7 +868,7 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 		/* Guests can't breakpoint the hypervisor */
 		if ((value1 & CIABR_PRIV) == CIABR_PRIV_HYPER)
 			return H_P3;
-		vcpu->arch.ciabr  = value1;
+		kvmppc_set_ciabr_hv(vcpu, value1);
 		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_SET_DAWR0:
 		if (!kvmppc_power8_compatible(vcpu))
@@ -879,8 +879,8 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 			return H_UNSUPPORTED_FLAG_START;
 		if (value2 & DABRX_HYP)
 			return H_P4;
-		vcpu->arch.dawr0  = value1;
-		vcpu->arch.dawrx0 = value2;
+		kvmppc_set_dawr0_hv(vcpu, value1);
+		kvmppc_set_dawrx0_hv(vcpu, value2);
 		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_SET_DAWR1:
 		if (!kvmppc_power8_compatible(vcpu))
@@ -895,8 +895,8 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 			return H_UNSUPPORTED_FLAG_START;
 		if (value2 & DABRX_HYP)
 			return H_P4;
-		vcpu->arch.dawr1  = value1;
-		vcpu->arch.dawrx1 = value2;
+		kvmppc_set_dawr1_hv(vcpu, value1);
+		kvmppc_set_dawrx1_hv(vcpu, value2);
 		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
 		/*
@@ -1548,7 +1548,7 @@ static int kvmppc_pmu_unavailable(struct kvm_vcpu *vcpu)
 	if (!(vcpu->arch.hfscr_permitted & HFSCR_PM))
 		return EMULATE_FAIL;
 
-	vcpu->arch.hfscr |= HFSCR_PM;
+	kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_PM);
 
 	return RESUME_GUEST;
 }
@@ -1558,7 +1558,7 @@ static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
 	if (!(vcpu->arch.hfscr_permitted & HFSCR_EBB))
 		return EMULATE_FAIL;
 
-	vcpu->arch.hfscr |= HFSCR_EBB;
+	kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_EBB);
 
 	return RESUME_GUEST;
 }
@@ -1568,7 +1568,7 @@ static int kvmppc_tm_unavailable(struct kvm_vcpu *vcpu)
 	if (!(vcpu->arch.hfscr_permitted & HFSCR_TM))
 		return EMULATE_FAIL;
 
-	vcpu->arch.hfscr |= HFSCR_TM;
+	kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_TM);
 
 	return RESUME_GUEST;
 }
@@ -1867,7 +1867,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 * Otherwise, we just generate a program interrupt to the guest.
 	 */
 	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL: {
-		u64 cause = vcpu->arch.hfscr >> 56;
+		u64 cause = kvmppc_get_hfscr_hv(vcpu) >> 56;
 
 		r = EMULATE_FAIL;
 		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
@@ -2211,64 +2211,64 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.dabrx);
 		break;
 	case KVM_REG_PPC_DSCR:
-		*val = get_reg_val(id, vcpu->arch.dscr);
+		*val = get_reg_val(id, kvmppc_get_dscr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_PURR:
-		*val = get_reg_val(id, vcpu->arch.purr);
+		*val = get_reg_val(id, kvmppc_get_purr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_SPURR:
-		*val = get_reg_val(id, vcpu->arch.spurr);
+		*val = get_reg_val(id, kvmppc_get_spurr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_AMR:
-		*val = get_reg_val(id, vcpu->arch.amr);
+		*val = get_reg_val(id, kvmppc_get_amr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_UAMOR:
-		*val = get_reg_val(id, vcpu->arch.uamor);
+		*val = get_reg_val(id, kvmppc_get_uamor_hv(vcpu));
 		break;
 	case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR1:
 		i = id - KVM_REG_PPC_MMCR0;
-		*val = get_reg_val(id, vcpu->arch.mmcr[i]);
+		*val = get_reg_val(id, kvmppc_get_mmcr_hv(vcpu, i));
 		break;
 	case KVM_REG_PPC_MMCR2:
-		*val = get_reg_val(id, vcpu->arch.mmcr[2]);
+		*val = get_reg_val(id, kvmppc_get_mmcr_hv(vcpu, 2));
 		break;
 	case KVM_REG_PPC_MMCRA:
-		*val = get_reg_val(id, vcpu->arch.mmcra);
+		*val = get_reg_val(id, kvmppc_get_mmcra_hv(vcpu));
 		break;
 	case KVM_REG_PPC_MMCRS:
 		*val = get_reg_val(id, vcpu->arch.mmcrs);
 		break;
 	case KVM_REG_PPC_MMCR3:
-		*val = get_reg_val(id, vcpu->arch.mmcr[3]);
+		*val = get_reg_val(id, kvmppc_get_mmcr_hv(vcpu, 3));
 		break;
 	case KVM_REG_PPC_PMC1 ... KVM_REG_PPC_PMC8:
 		i = id - KVM_REG_PPC_PMC1;
-		*val = get_reg_val(id, vcpu->arch.pmc[i]);
+		*val = get_reg_val(id, kvmppc_get_pmc_hv(vcpu, i));
 		break;
 	case KVM_REG_PPC_SPMC1 ... KVM_REG_PPC_SPMC2:
 		i = id - KVM_REG_PPC_SPMC1;
 		*val = get_reg_val(id, vcpu->arch.spmc[i]);
 		break;
 	case KVM_REG_PPC_SIAR:
-		*val = get_reg_val(id, vcpu->arch.siar);
+		*val = get_reg_val(id, kvmppc_get_siar_hv(vcpu));
 		break;
 	case KVM_REG_PPC_SDAR:
-		*val = get_reg_val(id, vcpu->arch.sdar);
+		*val = get_reg_val(id, kvmppc_get_siar_hv(vcpu));
 		break;
 	case KVM_REG_PPC_SIER:
-		*val = get_reg_val(id, vcpu->arch.sier[0]);
+		*val = get_reg_val(id, kvmppc_get_sier_hv(vcpu, 0));
 		break;
 	case KVM_REG_PPC_SIER2:
-		*val = get_reg_val(id, vcpu->arch.sier[1]);
+		*val = get_reg_val(id, kvmppc_get_sier_hv(vcpu, 1));
 		break;
 	case KVM_REG_PPC_SIER3:
-		*val = get_reg_val(id, vcpu->arch.sier[2]);
+		*val = get_reg_val(id, kvmppc_get_sier_hv(vcpu, 2));
 		break;
 	case KVM_REG_PPC_IAMR:
-		*val = get_reg_val(id, vcpu->arch.iamr);
+		*val = get_reg_val(id, kvmppc_get_iamr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_PSPB:
-		*val = get_reg_val(id, vcpu->arch.pspb);
+		*val = get_reg_val(id, kvmppc_get_pspb_hv(vcpu));
 		break;
 	case KVM_REG_PPC_DPDES:
 		/*
@@ -2286,19 +2286,19 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, kvmppc_get_vtb(vcpu));
 		break;
 	case KVM_REG_PPC_DAWR:
-		*val = get_reg_val(id, vcpu->arch.dawr0);
+		*val = get_reg_val(id, kvmppc_get_dawr0_hv(vcpu));
 		break;
 	case KVM_REG_PPC_DAWRX:
-		*val = get_reg_val(id, vcpu->arch.dawrx0);
+		*val = get_reg_val(id, kvmppc_get_dawrx0_hv(vcpu));
 		break;
 	case KVM_REG_PPC_DAWR1:
-		*val = get_reg_val(id, vcpu->arch.dawr1);
+		*val = get_reg_val(id, kvmppc_get_dawr1_hv(vcpu));
 		break;
 	case KVM_REG_PPC_DAWRX1:
-		*val = get_reg_val(id, vcpu->arch.dawrx1);
+		*val = get_reg_val(id, kvmppc_get_dawrx1_hv(vcpu));
 		break;
 	case KVM_REG_PPC_CIABR:
-		*val = get_reg_val(id, vcpu->arch.ciabr);
+		*val = get_reg_val(id, kvmppc_get_ciabr_hv(vcpu));
 		break;
 	case KVM_REG_PPC_CSIGR:
 		*val = get_reg_val(id, vcpu->arch.csigr);
@@ -2316,7 +2316,7 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, vcpu->arch.acop);
 		break;
 	case KVM_REG_PPC_WORT:
-		*val = get_reg_val(id, vcpu->arch.wort);
+		*val = get_reg_val(id, kvmppc_get_wort_hv(vcpu));
 		break;
 	case KVM_REG_PPC_TIDR:
 		*val = get_reg_val(id, vcpu->arch.tid);
@@ -2349,7 +2349,7 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		*val = get_reg_val(id, kvmppc_get_lpcr(vcpu));
 		break;
 	case KVM_REG_PPC_PPR:
-		*val = get_reg_val(id, vcpu->arch.ppr);
+		*val = get_reg_val(id, kvmppc_get_ppr_hv(vcpu));
 		break;
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	case KVM_REG_PPC_TFHAR:
@@ -2429,6 +2429,9 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_PTCR:
 		*val = get_reg_val(id, vcpu->kvm->arch.l1_ptcr);
 		break;
+	case KVM_REG_PPC_FSCR:
+		*val = get_reg_val(id, kvmppc_get_fscr_hv(vcpu));
+		break;
 	default:
 		r = -EINVAL;
 		break;
@@ -2457,29 +2460,29 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.dabrx = set_reg_val(id, *val) & ~DABRX_HYP;
 		break;
 	case KVM_REG_PPC_DSCR:
-		vcpu->arch.dscr = set_reg_val(id, *val);
+		kvmppc_set_dscr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_PURR:
-		vcpu->arch.purr = set_reg_val(id, *val);
+		kvmppc_set_purr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SPURR:
-		vcpu->arch.spurr = set_reg_val(id, *val);
+		kvmppc_set_spurr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_AMR:
-		vcpu->arch.amr = set_reg_val(id, *val);
+		kvmppc_set_amr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_UAMOR:
-		vcpu->arch.uamor = set_reg_val(id, *val);
+		kvmppc_set_uamor_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR1:
 		i = id - KVM_REG_PPC_MMCR0;
-		vcpu->arch.mmcr[i] = set_reg_val(id, *val);
+		kvmppc_set_mmcr_hv(vcpu, i, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_MMCR2:
-		vcpu->arch.mmcr[2] = set_reg_val(id, *val);
+		kvmppc_set_mmcr_hv(vcpu, 2, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_MMCRA:
-		vcpu->arch.mmcra = set_reg_val(id, *val);
+		kvmppc_set_mmcra_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_MMCRS:
 		vcpu->arch.mmcrs = set_reg_val(id, *val);
@@ -2489,32 +2492,32 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		break;
 	case KVM_REG_PPC_PMC1 ... KVM_REG_PPC_PMC8:
 		i = id - KVM_REG_PPC_PMC1;
-		vcpu->arch.pmc[i] = set_reg_val(id, *val);
+		kvmppc_set_pmc_hv(vcpu, i, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SPMC1 ... KVM_REG_PPC_SPMC2:
 		i = id - KVM_REG_PPC_SPMC1;
 		vcpu->arch.spmc[i] = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_SIAR:
-		vcpu->arch.siar = set_reg_val(id, *val);
+		kvmppc_set_siar_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SDAR:
-		vcpu->arch.sdar = set_reg_val(id, *val);
+		kvmppc_set_sdar_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SIER:
-		vcpu->arch.sier[0] = set_reg_val(id, *val);
+		kvmppc_set_sier_hv(vcpu, 0, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SIER2:
-		vcpu->arch.sier[1] = set_reg_val(id, *val);
+		kvmppc_set_sier_hv(vcpu, 1, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_SIER3:
-		vcpu->arch.sier[2] = set_reg_val(id, *val);
+		kvmppc_set_sier_hv(vcpu, 2, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_IAMR:
-		vcpu->arch.iamr = set_reg_val(id, *val);
+		kvmppc_set_iamr_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_PSPB:
-		vcpu->arch.pspb = set_reg_val(id, *val);
+		kvmppc_set_pspb_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DPDES:
 		if (cpu_has_feature(CPU_FTR_ARCH_300))
@@ -2526,22 +2529,22 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		kvmppc_set_vtb(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DAWR:
-		vcpu->arch.dawr0 = set_reg_val(id, *val);
+		kvmppc_set_dawr0_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DAWRX:
-		vcpu->arch.dawrx0 = set_reg_val(id, *val) & ~DAWRX_HYP;
+		kvmppc_set_dawrx0_hv(vcpu, set_reg_val(id, *val) & ~DAWRX_HYP);
 		break;
 	case KVM_REG_PPC_DAWR1:
-		vcpu->arch.dawr1 = set_reg_val(id, *val);
+		kvmppc_set_dawr1_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_DAWRX1:
-		vcpu->arch.dawrx1 = set_reg_val(id, *val) & ~DAWRX_HYP;
+		kvmppc_set_dawrx1_hv(vcpu, set_reg_val(id, *val) & ~DAWRX_HYP);
 		break;
 	case KVM_REG_PPC_CIABR:
-		vcpu->arch.ciabr = set_reg_val(id, *val);
+		kvmppc_set_ciabr_hv(vcpu, set_reg_val(id, *val));
 		/* Don't allow setting breakpoints in hypervisor code */
-		if ((vcpu->arch.ciabr & CIABR_PRIV) == CIABR_PRIV_HYPER)
-			vcpu->arch.ciabr &= ~CIABR_PRIV;	/* disable */
+		if ((kvmppc_get_ciabr_hv(vcpu) & CIABR_PRIV) == CIABR_PRIV_HYPER)
+			kvmppc_set_ciabr_hv(vcpu, kvmppc_get_ciabr_hv(vcpu) & ~CIABR_PRIV);
 		break;
 	case KVM_REG_PPC_CSIGR:
 		vcpu->arch.csigr = set_reg_val(id, *val);
@@ -2559,7 +2562,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.acop = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_WORT:
-		vcpu->arch.wort = set_reg_val(id, *val);
+		kvmppc_set_wort_hv(vcpu, set_reg_val(id, *val));
 		break;
 	case KVM_REG_PPC_TIDR:
 		vcpu->arch.tid = set_reg_val(id, *val);
@@ -2620,7 +2623,7 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		kvmppc_set_lpcr(vcpu, set_reg_val(id, *val), false);
 		break;
 	case KVM_REG_PPC_PPR:
-		vcpu->arch.ppr = set_reg_val(id, *val);
+		kvmppc_set_ppr_hv(vcpu, set_reg_val(id, *val));
 		break;
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	case KVM_REG_PPC_TFHAR:
@@ -2704,6 +2707,9 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 	case KVM_REG_PPC_PTCR:
 		vcpu->kvm->arch.l1_ptcr = set_reg_val(id, *val);
 		break;
+	case KVM_REG_PPC_FSCR:
+		kvmppc_set_fscr_hv(vcpu, set_reg_val(id, *val));
+		break;
 	default:
 		r = -EINVAL;
 		break;
@@ -2921,13 +2927,14 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.shared_big_endian = false;
 #endif
 #endif
-	vcpu->arch.mmcr[0] = MMCR0_FC;
+	kvmppc_set_mmcr_hv(vcpu, 0, MMCR0_FC);
+
 	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		vcpu->arch.mmcr[0] |= MMCR0_PMCCEXT;
-		vcpu->arch.mmcra = MMCRA_BHRB_DISABLE;
+		kvmppc_set_mmcr_hv(vcpu, 0, kvmppc_get_mmcr_hv(vcpu, 0) | MMCR0_PMCCEXT);
+		kvmppc_set_mmcra_hv(vcpu, MMCRA_BHRB_DISABLE);
 	}
 
-	vcpu->arch.ctrl = CTRL_RUNLATCH;
+	kvmppc_set_ctrl_hv(vcpu, CTRL_RUNLATCH);
 	/* default to host PVR, since we can't spoof it */
 	kvmppc_set_pvr_hv(vcpu, mfspr(SPRN_PVR));
 	spin_lock_init(&vcpu->arch.vpa_update_lock);
@@ -2943,29 +2950,30 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	 * don't set the HFSCR_MSGP bit, and that causes those instructions
 	 * to trap and then we emulate them.
 	 */
-	vcpu->arch.hfscr = HFSCR_TAR | HFSCR_EBB | HFSCR_PM | HFSCR_BHRB |
-		HFSCR_DSCR | HFSCR_VECVSX | HFSCR_FP;
+	kvmppc_set_hfscr_hv(vcpu, HFSCR_TAR | HFSCR_EBB | HFSCR_PM | HFSCR_BHRB |
+			    HFSCR_DSCR | HFSCR_VECVSX | HFSCR_FP);
 
 	/* On POWER10 and later, allow prefixed instructions */
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
-		vcpu->arch.hfscr |= HFSCR_PREFIX;
+		kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_PREFIX);
 
 	if (cpu_has_feature(CPU_FTR_HVMODE)) {
-		vcpu->arch.hfscr &= mfspr(SPRN_HFSCR);
+		kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) & mfspr(SPRN_HFSCR));
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		if (cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
-			vcpu->arch.hfscr |= HFSCR_TM;
+			kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) | HFSCR_TM);
 #endif
 	}
 	if (cpu_has_feature(CPU_FTR_TM_COMP))
 		vcpu->arch.hfscr |= HFSCR_TM;
 
-	vcpu->arch.hfscr_permitted = vcpu->arch.hfscr;
+	vcpu->arch.hfscr_permitted = kvmppc_get_hfscr_hv(vcpu);
 
 	/*
 	 * PM, EBB, TM are demand-faulted so start with it clear.
 	 */
-	vcpu->arch.hfscr &= ~(HFSCR_PM | HFSCR_EBB | HFSCR_TM);
+	kvmppc_set_hfscr_hv(vcpu, kvmppc_get_hfscr_hv(vcpu) & ~(HFSCR_PM | HFSCR_EBB | HFSCR_TM));
 
 	kvmppc_mmu_book3s_hv_init(vcpu);
 
@@ -4848,7 +4856,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		msr |= MSR_VSX;
 	if ((cpu_has_feature(CPU_FTR_TM) ||
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
-			(vcpu->arch.hfscr & HFSCR_TM))
+			(kvmppc_get_hfscr_hv(vcpu) & HFSCR_TM))
 		msr |= MSR_TM;
 	msr = msr_check_and_set(msr);
 
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index 2f2e59d7d433..acd9a7a95bbf 100644
--- a/arch/powerpc/kvm/book3s_hv.h
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -50,3 +50,61 @@ void accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next);
 #define start_timing(vcpu, next) do {} while (0)
 #define end_timing(vcpu) do {} while (0)
 #endif
+
+#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_SET(reg, size)			\
+static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, u##size val)	\
+{									\
+	vcpu->arch.reg = val;						\
+}
+
+#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_GET(reg, size)			\
+static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
+{									\
+	return vcpu->arch.reg;						\
+}
+
+#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(reg, size)			\
+	KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_SET(reg, size)			\
+	KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_GET(reg, size)			\
+
+#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_SET(reg, size)		\
+static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, int i, u##size val)	\
+{									\
+	vcpu->arch.reg[i] = val;					\
+}
+
+#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_GET(reg, size)		\
+static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu, int i)	\
+{									\
+	return vcpu->arch.reg[i];					\
+}
+
+#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(reg, size)			\
+	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_SET(reg, size)		\
+	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_GET(reg, size)		\
+
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(mmcra, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(hfscr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(fscr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dscr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(purr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(spurr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(amr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(uamor, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(siar, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(sdar, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(iamr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr0, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr1, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx0, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx1, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ciabr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(wort, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ppr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ctrl, 64)
+
+KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(mmcr, 64)
+KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(sier, 64)
+KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(pmc, 32)
+
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(pspb, 32)
-- 
2.39.3

