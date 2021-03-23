Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089FF3454A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:08:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4CsT71yCz3db5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:07:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fEe7AiMu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fEe7AiMu; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cmj75gQz30Nx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:03:49 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id c17so5626019pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dk5Q5Z4e+foxwg9SPWLW5LDYDiqB75zP/uAAU3KLgnA=;
 b=fEe7AiMuG1FIkoWcu4L+4anvLSLgY+yjfbjBl/lzSpiQQXdc0F8IqCW77bWnvpZSeE
 ZQfIf32wfKhP2ySEXq/ZdXQV2OKwleN4cSL/VMwqps1Xojy2oxhJ1ytk8wbKuGs+TDsg
 aZY28A+Jn+NHudCcAunZyyYgCB+Q/cL3+L0IQ9tTL6OHmIcYpjh+B9/QVW8bFTkJo0em
 rXR/1pjF86+jP+DwLgG99SMjCVh43IyC82NH1HWFD3AAZD92UR9M50Wz2U1cfsMCizbF
 STKovOnHy3gdCUoBxcfARiM6ZlsH0h6U+zv3o0nQrEcjAFY9dltyqtl8iD65nBc0C1Uy
 cRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dk5Q5Z4e+foxwg9SPWLW5LDYDiqB75zP/uAAU3KLgnA=;
 b=Xd2YelsFn9tmkz+YwXzml9o2KvVXHw2XZKnhHxqhNEGpTmPZNbkobKAx2k7sWDZt/D
 DY1tAFREelrXlUN2ft3q+v7fkfe4mVJTDzQUhxqBY2FwTHTA97oMN4jSWFqb3/gwmuVo
 MKpbqBhBb7RsB/B0s0tXCoOBG1fT6B6rP13n5suJd0CeXLYr0TnUwZLGCoJWaz2mSQdp
 PKMUWA+Tj87HINS3HYa8+pXsC1mjP991SfrtWxgqaSnyWauP68YQagXmpDOr/BjP+Peu
 lbSsrK5SBkAAUfT6NFUEnOj3Qx0uS7r2JxNNVO0/JTgn4cUr2pjjw8tt8GYlftRb43BF
 N/ww==
X-Gm-Message-State: AOAM5339ktmuB58mJhJJYvgrnkyn5nUZ9/T8rN/tfJkjLaAZLND2TMJ0
 nY91s+VANez49Iq/2D8leJzVn3tynlg=
X-Google-Smtp-Source: ABdhPJx9lnGWRstc9BoZOXUBhW15S6WU7QZT+WTC+goDI3pnELMtfe4iVK2v8gRhqUZGibilij/EYQ==
X-Received: by 2002:a17:902:bd96:b029:e6:3d73:f90e with SMTP id
 q22-20020a170902bd96b02900e63d73f90emr2221997pls.63.1616461427921; 
 Mon, 22 Mar 2021 18:03:47 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:03:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 10/46] KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in
 guest MSR
Date: Tue, 23 Mar 2021 11:02:29 +1000
Message-Id: <20210323010305.1045293-11-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than add the ME bit to the MSR at guest entry, make it clear
that the hypervisor does not allow the guest to clear the bit.

The ME set is kept in guest entry for now, but a future patch will
warn if it's not present.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 3 +++
 arch/powerpc/kvm/book3s_hv_nested.c  | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 158d309b42a3..41cb03d0bde4 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -662,6 +662,9 @@ static void kvmppc_end_cede(struct kvm_vcpu *vcpu)
 
 void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
 {
+	/* Guest must always run with ME enabled. */
+	msr = msr | MSR_ME;
+
 	/*
 	 * Check for illegal transactional state bit combination
 	 * and if we find it, force the TS field to a safe state.
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 851e3f527eb2..886c7fa86add 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -328,7 +328,9 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	vcpu->arch.nested = l2;
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
 	vcpu->arch.regs = l2_regs;
-	vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
+
+	/* Guest must always run with ME enabled. */
+	vcpu->arch.shregs.msr = vcpu->arch.regs.msr | MSR_ME;
 
 	sanitise_hv_regs(vcpu, &l2_hv);
 	restore_hv_regs(vcpu, &l2_hv);
-- 
2.23.0

