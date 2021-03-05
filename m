Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF432EE9D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:22:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWh46fPnz3hgg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:22:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GpVWJzCF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GpVWJzCF; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWNK6Clgz3dnZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:09:05 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id t9so2021816pjl.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ClN0vxOwz40SiUtzul/df6PY39YvlAMDG9hVRtDkNu4=;
 b=GpVWJzCF7djJBfR4Q5DXt3pnf5MaieQbV/FHQZ1ToP6M+ZMa4PUAzLm8qMqjjuTwy2
 9xbKgDhP9LIgQiP0biV4P3X0wCklwB46dt2KSO5sPFgw1lG3GU40A++bEcJH1or2yS4U
 HO3EUSAK2S0l6YpK1xHOzCp/k6X1woQV7Og0LFhgdjHvvnJOuBz7GCVMCN9XaHf12Uwd
 4oz+CK2U3K1ktMChi7i7nqakkCJ0UT4iDg+Kwda3v04o633sRUtp8Bzz79hkC74rZF91
 TELuo5dQ0LGElZsNUbXGOJNR0a0rU9uaK45uJxZ+ZP/FXZptAn5OhBGT28zTQ2URrz6o
 Yl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ClN0vxOwz40SiUtzul/df6PY39YvlAMDG9hVRtDkNu4=;
 b=Pd/2FAtVx0ow6r4dAgy4sh+EcQe067J13fwanUacnO4/iAg0rHcXDh57Lo/Vv7fEFJ
 9DOyUcAaiTVD1APmIjb/qek6Wl1HbgaFt3yru3AIrDewBilajmd9bYklcZu28PHYjpNk
 RsEMb/qBrd2asw7nZoUsTaSeOic5a0u7wgUH94A8S5jM/6FHomZAUQ89ajQGbkD0HiEI
 6eyHRLO+hmJQFNs+CiuhCGyudLHtlunfdKz58DIDhkZs+7RppJKqwK12yIvZCDZRDXd3
 s5nM2pRTNC1HvNEUVa633jv2bEPTVKPBMW7ebKEeSxH3UPzJFOJOpnK7XuliO6kJmvhp
 sSZA==
X-Gm-Message-State: AOAM533DbKYvpVmZps2s94wqcpcA50JJOxL4r0bGlOxHYIrhhEG2q5yL
 CQfaBu2ZvWCAH2HfV2HnH8I=
X-Google-Smtp-Source: ABdhPJzwZ+6b0VnS8sdgjB5oZWexc+SZS1ikuNKCYE+c6L38/PmglJ+CQaiprUysmsHE3GfE3vWTqQ==
X-Received: by 2002:a17:90b:1216:: with SMTP id
 gl22mr10881198pjb.99.1614956943712; 
 Fri, 05 Mar 2021 07:09:03 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:09:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 37/41] KVM: PPC: Book3S HV: small pseries_do_hcall cleanup
Date: Sat,  6 Mar 2021 01:06:34 +1000
Message-Id: <20210305150638.2675513-38-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Functionality should not be changed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 5debe7652928..df8a05eb4f76 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -925,6 +925,7 @@ static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
 
 int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 {
+	struct kvm *kvm = vcpu->kvm;
 	unsigned long req = kvmppc_get_gpr(vcpu, 3);
 	unsigned long target, ret = H_SUCCESS;
 	int yield_count;
@@ -940,7 +941,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		break;
 	case H_PROD:
 		target = kvmppc_get_gpr(vcpu, 4);
-		tvcpu = kvmppc_find_vcpu(vcpu->kvm, target);
+		tvcpu = kvmppc_find_vcpu(kvm, target);
 		if (!tvcpu) {
 			ret = H_PARAMETER;
 			break;
@@ -954,7 +955,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		target = kvmppc_get_gpr(vcpu, 4);
 		if (target == -1)
 			break;
-		tvcpu = kvmppc_find_vcpu(vcpu->kvm, target);
+		tvcpu = kvmppc_find_vcpu(kvm, target);
 		if (!tvcpu) {
 			ret = H_PARAMETER;
 			break;
@@ -970,12 +971,12 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 					kvmppc_get_gpr(vcpu, 6));
 		break;
 	case H_RTAS:
-		if (list_empty(&vcpu->kvm->arch.rtas_tokens))
+		if (list_empty(&kvm->arch.rtas_tokens))
 			return RESUME_HOST;
 
-		idx = srcu_read_lock(&vcpu->kvm->srcu);
+		idx = srcu_read_lock(&kvm->srcu);
 		rc = kvmppc_rtas_hcall(vcpu);
-		srcu_read_unlock(&vcpu->kvm->srcu, idx);
+		srcu_read_unlock(&kvm->srcu, idx);
 
 		if (rc == -ENOENT)
 			return RESUME_HOST;
@@ -1062,12 +1063,12 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 
 	case H_SET_PARTITION_TABLE:
 		ret = H_FUNCTION;
-		if (nesting_enabled(vcpu->kvm))
+		if (nesting_enabled(kvm))
 			ret = kvmhv_set_partition_table(vcpu);
 		break;
 	case H_ENTER_NESTED:
 		ret = H_FUNCTION;
-		if (!nesting_enabled(vcpu->kvm))
+		if (!nesting_enabled(kvm))
 			break;
 		ret = kvmhv_enter_nested_guest(vcpu);
 		if (ret == H_INTERRUPT) {
@@ -1082,12 +1083,12 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		break;
 	case H_TLB_INVALIDATE:
 		ret = H_FUNCTION;
-		if (nesting_enabled(vcpu->kvm))
+		if (nesting_enabled(kvm))
 			ret = kvmhv_do_nested_tlbie(vcpu);
 		break;
 	case H_COPY_TOFROM_GUEST:
 		ret = H_FUNCTION;
-		if (nesting_enabled(vcpu->kvm))
+		if (nesting_enabled(kvm))
 			ret = kvmhv_copy_tofrom_guest_nested(vcpu);
 		break;
 	case H_PAGE_INIT:
@@ -1098,7 +1099,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	case H_SVM_PAGE_IN:
 		ret = H_UNSUPPORTED;
 		if (kvmppc_get_srr1(vcpu) & MSR_S)
-			ret = kvmppc_h_svm_page_in(vcpu->kvm,
+			ret = kvmppc_h_svm_page_in(kvm,
 						   kvmppc_get_gpr(vcpu, 4),
 						   kvmppc_get_gpr(vcpu, 5),
 						   kvmppc_get_gpr(vcpu, 6));
@@ -1106,7 +1107,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	case H_SVM_PAGE_OUT:
 		ret = H_UNSUPPORTED;
 		if (kvmppc_get_srr1(vcpu) & MSR_S)
-			ret = kvmppc_h_svm_page_out(vcpu->kvm,
+			ret = kvmppc_h_svm_page_out(kvm,
 						    kvmppc_get_gpr(vcpu, 4),
 						    kvmppc_get_gpr(vcpu, 5),
 						    kvmppc_get_gpr(vcpu, 6));
@@ -1114,12 +1115,12 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	case H_SVM_INIT_START:
 		ret = H_UNSUPPORTED;
 		if (kvmppc_get_srr1(vcpu) & MSR_S)
-			ret = kvmppc_h_svm_init_start(vcpu->kvm);
+			ret = kvmppc_h_svm_init_start(kvm);
 		break;
 	case H_SVM_INIT_DONE:
 		ret = H_UNSUPPORTED;
 		if (kvmppc_get_srr1(vcpu) & MSR_S)
-			ret = kvmppc_h_svm_init_done(vcpu->kvm);
+			ret = kvmppc_h_svm_init_done(kvm);
 		break;
 	case H_SVM_INIT_ABORT:
 		/*
@@ -1129,7 +1130,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		 * Instead the kvm->arch.secure_guest flag is checked inside
 		 * kvmppc_h_svm_init_abort().
 		 */
-		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
+		ret = kvmppc_h_svm_init_abort(kvm);
 		break;
 
 	default:
-- 
2.23.0

