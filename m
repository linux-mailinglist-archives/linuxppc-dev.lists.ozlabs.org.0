Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34743515DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB65c69nrz3cSg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:08:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GdkJQx9s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GdkJQx9s; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB60H4dGRz3c6C
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:15 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id f29so161239pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ocK5Yj4V6zWz31hzBzslA9cG5h0MlbgFIped0AK4ODc=;
 b=GdkJQx9spOFFcxE2CC3tfo7++LldwXZuoRpuCpO0i9gfDP7LorEwp1S0Io+MbGhfTI
 Rl9GCU23NUBr3F8obxfhuLOPg9shvnjv92DFVr2RzNqI3BSsMOyXMM1LH70WaJyiI9E5
 9MGEsahxc1Lt8Y6/fRsxqHiEuFAggZoayvmcXSYWZROuW4Y+MbKLv3aH/RroWHq09ZVv
 c2Jqu0VEYyvpOO9dFHBDEpEh2HjU41jRw1/oLwlXozJ1g2IZO+CnpXNijVBNimXrsXcp
 s3TiHoL07CVbLvbQ+YpSg5rOiewXBS7R553w8ZSkwQJG6rZJWMkSPLVmqQauf8aKtmBw
 a6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ocK5Yj4V6zWz31hzBzslA9cG5h0MlbgFIped0AK4ODc=;
 b=N8UgEKdQ9TM40fSkQrnL0d2VlCqVPDg9wVATPM8U9a8Z1m4UO8mXzwY7GS6Jk/Nn61
 3RalK4zAPPO2C1h7v9ieSuE51m83tzMgkdxouoX2A0CYyauauPUyBeqM9RjHmqqNna6K
 RwdOQMX92YtldJvdByvsTVewVJcsKkfEQ+fZNE/2739+x42aLPRxUk7vMcRKoxY8aaAM
 dTI7IMo1NyyazkPm18Yk57vCAOJ2sn+sUWoeTH9aK1CefU3teOO6CfT+nVGQmI1LQR5z
 118nD1yoo2bewRskDNVFeeqcfi2H/R8BrfSCbrmcICg60LLlvZstqs/8C09yuIK9J80p
 rhHA==
X-Gm-Message-State: AOAM530CjjzddlkIRM0SwXJj6yajKfWEtGnX5LsTwktZyRRh95BEh9s1
 UYhdOwdSd9y3+UKZ+A2F+ng=
X-Google-Smtp-Source: ABdhPJzqDZWMnnEUOqNw+ciJtfQN5aGcnLgdUdfS5EX2zmqvx19FJY7/qxH35JIhv3UeF62ymFzW6g==
X-Received: by 2002:a65:4c43:: with SMTP id l3mr7736960pgr.327.1617289453409; 
 Thu, 01 Apr 2021 08:04:13 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 11/48] KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear
 in guest MSR
Date: Fri,  2 Apr 2021 01:02:48 +1000
Message-Id: <20210401150325.442125-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
warn if it is present.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
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
index fb03085c902b..60724f674421 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -344,8 +344,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
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

