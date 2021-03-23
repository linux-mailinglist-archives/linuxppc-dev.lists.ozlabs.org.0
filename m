Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 685FE3454AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:08:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Ct42zYKz3dgY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:08:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PjOiyXfF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PjOiyXfF; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cmm1f2wz30Qy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:03:52 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id b184so12526121pfa.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAmyop6LwM+4FDD1RxgDkC21dW+bikvsGlmlJj1lI8o=;
 b=PjOiyXfF+7iUXAE8OVjNkcy4hQhF3A1LfCRadGlw7i7n9joQxtsTYQct6lg9YgOwbE
 yvW1eTX9R2n1CG2Dj+N0dehT1rWXep1sDtCHNwB/XXcUZN5D8FokJKJMUWESWcG1BDU8
 r1g7Zzm8meMR0EwKiCt6pAWo6gj+iT9Ld5O4P3dK8be6FEULAN9CzG4sDi6tpwrrHnIW
 GBEfdQYlqAgzSpGtMh8C/56cGx/6828bc0h4so05GrofrV/o5GXuyusOi95G1NsKF3ae
 6Ar1HkfjJ9kqnRAJQ/JOUyJm3IMs58+jAwn/AX2A+WRXNzRce31zkPvSfdz4NwuSgjEm
 sXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAmyop6LwM+4FDD1RxgDkC21dW+bikvsGlmlJj1lI8o=;
 b=gWxvUFqQaJzjGHE3/aCF1vGHLQwSTNmSt35+zEAsenmxG0At+t/4SqhKz7ZukwFUfA
 ZKKW5L3tL6MqXGDPEfhxafUdvEMP94M8zJOtK4SLORJObhRx/+xB/tZLkKdsxC8yYHeU
 tmLqnbcfqBmLT+A8EmL1x74y/v55gLEM9bq9SFVRgDyWJ30fJxhQ3Fp8brvBHjg/5eJw
 XmaeqPhnjOImUSNJqWjCNhe7KwI4dI/D1Uzkp+Kui6fRBptb67CXipEDFpIGg1KpUBUJ
 dHG8fVkHG8muxxilSjb6cW2QWcM5ZnqZ49z+wrWJgpK/IULXY4aHQ5TH3Zf6m/so6GJa
 Z3Aw==
X-Gm-Message-State: AOAM533aWUE4mzy+MgTORjdWH0omXWRkGvcqGP6KcP/eOZH91hShzkd3
 On9gXVM0ElBiT+jXS+OGFV/TQAuzjz4=
X-Google-Smtp-Source: ABdhPJxihCf2xHLUgCEyFWk/daW/fvZ9JJ1/5SDgSc7y8eu/UO2AUIcujHd9jumg4R0PolkaebqikQ==
X-Received: by 2002:a17:902:b7c5:b029:e6:1a9f:5f55 with SMTP id
 v5-20020a170902b7c5b02900e61a9f5f55mr2171864plz.57.1616461430283; 
 Mon, 22 Mar 2021 18:03:50 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:03:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 11/46] KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear
 in guest MSR
Date: Tue, 23 Mar 2021 11:02:30 +1000
Message-Id: <20210323010305.1045293-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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

Rather than clear the HV bit from the MSR at guest entry, make it clear
that the hypervisor does not allow the guest to set the bit.

The HV clear is kept in guest entry for now, but a future patch will
warn if it's not present.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 4 ++--
 arch/powerpc/kvm/book3s_hv_nested.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 41cb03d0bde4..7a0e33a9c980 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -662,8 +662,8 @@ static void kvmppc_end_cede(struct kvm_vcpu *vcpu)
 
 void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
 {
-	/* Guest must always run with ME enabled. */
-	msr = msr | MSR_ME;
+	/* Guest must always run with ME enabled, HV disabled. */
+	msr = (msr | MSR_ME) & ~MSR_HV;
 
 	/*
 	 * Check for illegal transactional state bit combination
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 886c7fa86add..d192e799c0af 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -329,8 +329,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
 	vcpu->arch.regs = l2_regs;
 
-	/* Guest must always run with ME enabled. */
-	vcpu->arch.shregs.msr = vcpu->arch.regs.msr | MSR_ME;
+	/* Guest must always run with ME enabled, HV disabled. */
+	vcpu->arch.shregs.msr = (vcpu->arch.regs.msr | MSR_ME) & ~MSR_HV;
 
 	sanitise_hv_regs(vcpu, &l2_hv);
 	restore_hv_regs(vcpu, &l2_hv);
-- 
2.23.0

