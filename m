Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6324F421430
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNRD2239Jz3fbK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:35:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bhz3Eh6n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Bhz3Eh6n; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQVJ3Zckz3cY1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:03:04 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 75so16993273pga.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CkLYCnetbtAZE9M5QXDIsnhwTgD/585hJdfqEy8WJpw=;
 b=Bhz3Eh6n84uesPvImheylLT3lvMJSApOuL5JN2Tnt09hqDf4YIin64PCQjO+qjUpT3
 fvQhJTdrW3v97EIH8TPPtmVW7NoGFqUJdpUP+ealpGSf45xxTh4gFGjYjHfqRymFZULZ
 Q1FvgJEgAjzcwJQv+7kA8ERWKYwwu9pdlqAay4ESyhO2gOcN1BGZO9kPExfrRAmOnJN4
 +a9zMGWbHSr4bB1kHm4nIj+671/YUZGz2xHFKnPwaS+a5IBYd41XF6pdxIF291R6YIi5
 QnNI/CMBTgFPah0+UamK2KeKUslXUAC6Fww3CB9vfHDdd+9xW2oqdNEnNqzzMUXclT4M
 en7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CkLYCnetbtAZE9M5QXDIsnhwTgD/585hJdfqEy8WJpw=;
 b=pdyKARedC03WtfVFBEyXoZk2WWbpnwly3Nrw9oOMzU2bTlgZ8w5UlQl77Fab79UKHW
 /qYoaHCgTQGc0sRTmZXqPXb65nDR26h8rdaMzqWyCXRnzxMIGHr2rtMyzN9NYh0kYgjR
 goakQUre4n6zHt6CGDR2KD8fUZ8zhQVqaMauAMzZrwuaVpLEdUA6saTCJZ4Urrue6f50
 R21deSt1jRIhYQtjHUwTiqvitllFeUKggITY6x09QuSLqqZIptjP1Gvcw5Sv6zRWS2zP
 XuUmXUOpEiuhjcPiha2+fGzzlfpBvxVX5Z8Eu3sW6rOIhlFQANa3j6FfXwenk5jsyWgb
 brxg==
X-Gm-Message-State: AOAM530gLiORD0JFbhBB7FnwFA32mF/TycNBtGylOuyIlMEX77QeP7lz
 XTOVSXCelI9MEykaHHSHIGzn0QDbaQw=
X-Google-Smtp-Source: ABdhPJxWQl/NXUBjwkMvCQFlYDmU9y/0E6caP9R6/YaW/XbY9beMQPR/rmTIUKJNDl2uQoEB7ZCVMg==
X-Received: by 2002:a05:6a00:140c:b0:447:96be:2ade with SMTP id
 l12-20020a056a00140c00b0044796be2ademr26451699pfu.26.1633363382281; 
 Mon, 04 Oct 2021 09:03:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:03:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 51/52] KVM: PPC: Book3S HV P9: Stop using vc->dpdes
Date: Tue,  5 Oct 2021 02:00:48 +1000
Message-Id: <20211004160049.1338837-52-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The P9 path uses vc->dpdes only for msgsndp / SMT emulation. This adds
an ordering requirement between vcpu->doorbell_request and vc->dpdes for
no real benefit. Use vcpu->doorbell_request directly.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 18 ++++++++++--------
 arch/powerpc/kvm/book3s_hv_builtin.c  |  2 ++
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 14 ++++++++++----
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 57bf49c90e73..351018f617fb 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -761,6 +761,8 @@ static bool kvmppc_doorbell_pending(struct kvm_vcpu *vcpu)
 
 	if (vcpu->arch.doorbell_request)
 		return true;
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		return false;
 	/*
 	 * Ensure that the read of vcore->dpdes comes after the read
 	 * of vcpu->doorbell_request.  This barrier matches the
@@ -2185,8 +2187,10 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		 * either vcore->dpdes or doorbell_request.
 		 * On POWER8, doorbell_request is 0.
 		 */
-		*val = get_reg_val(id, vcpu->arch.vcore->dpdes |
-				   vcpu->arch.doorbell_request);
+		if (cpu_has_feature(CPU_FTR_ARCH_300))
+			*val = get_reg_val(id, vcpu->arch.doorbell_request);
+		else
+			*val = get_reg_val(id, vcpu->arch.vcore->dpdes);
 		break;
 	case KVM_REG_PPC_VTB:
 		*val = get_reg_val(id, vcpu->arch.vcore->vtb);
@@ -2423,7 +2427,10 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
 		vcpu->arch.pspb = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_DPDES:
-		vcpu->arch.vcore->dpdes = set_reg_val(id, *val);
+		if (cpu_has_feature(CPU_FTR_ARCH_300))
+			vcpu->arch.doorbell_request = set_reg_val(id, *val) & 1;
+		else
+			vcpu->arch.vcore->dpdes = set_reg_val(id, *val);
 		break;
 	case KVM_REG_PPC_VTB:
 		vcpu->arch.vcore->vtb = set_reg_val(id, *val);
@@ -4472,11 +4479,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	if (!nested) {
 		kvmppc_core_prepare_to_enter(vcpu);
-		if (vcpu->arch.doorbell_request) {
-			vc->dpdes = 1;
-			smp_wmb();
-			vcpu->arch.doorbell_request = 0;
-		}
 		if (test_bit(BOOK3S_IRQPRIO_EXTERNAL,
 			     &vcpu->arch.pending_exceptions))
 			lpcr |= LPCR_MER;
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index fcf4760a3a0e..a4fc4b2d3806 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -649,6 +649,8 @@ void kvmppc_guest_entry_inject_int(struct kvm_vcpu *vcpu)
 	int ext;
 	unsigned long lpcr;
 
+	WARN_ON_ONCE(cpu_has_feature(CPU_FTR_ARCH_300));
+
 	/* Insert EXTERNAL bit into LPCR at the MER bit position */
 	ext = (vcpu->arch.pending_exceptions >> BOOK3S_IRQPRIO_EXTERNAL) & 1;
 	lpcr = mfspr(SPRN_LPCR);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 5a71532a3adf..fbecbdc42c26 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -705,6 +705,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	unsigned long host_pidr;
 	unsigned long host_dawr1;
 	unsigned long host_dawrx1;
+	unsigned long dpdes;
 
 	hdec = time_limit - *tb;
 	if (hdec < 0)
@@ -767,8 +768,10 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	if (vc->pcr)
 		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
-	if (vc->dpdes)
-		mtspr(SPRN_DPDES, vc->dpdes);
+	if (vcpu->arch.doorbell_request) {
+		vcpu->arch.doorbell_request = 0;
+		mtspr(SPRN_DPDES, 1);
+	}
 
 	if (dawr_enabled()) {
 		if (vcpu->arch.dawr0 != host_dawr0)
@@ -999,7 +1002,10 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	vcpu->arch.shregs.sprg2 = mfspr(SPRN_SPRG2);
 	vcpu->arch.shregs.sprg3 = mfspr(SPRN_SPRG3);
 
-	vc->dpdes = mfspr(SPRN_DPDES);
+	dpdes = mfspr(SPRN_DPDES);
+	if (dpdes)
+		vcpu->arch.doorbell_request = 1;
+
 	vc->vtb = mfspr(SPRN_VTB);
 
 	dec = mfspr(SPRN_DEC);
@@ -1061,7 +1067,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		}
 	}
 
-	if (vc->dpdes)
+	if (dpdes)
 		mtspr(SPRN_DPDES, 0);
 	if (vc->pcr)
 		mtspr(SPRN_PCR, PCR_MASK);
-- 
2.23.0

