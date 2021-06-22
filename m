Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 673B13B0242
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Nmt1hzLz3cCt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:03:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bWtxCbT8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bWtxCbT8; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Nfs22g8z3bvp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:29 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id g4so11889091pjk.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XeckW1SELkzqZtdQyYlPpbgjiGzhPPr2SL3SVbOXvdk=;
 b=bWtxCbT8rwIKOB7gt8CU2C3NrB1/QC3aINzcoW5cjrqo7mUgwrwIPxMmCvVuA0w4cf
 5HUQDQm2TIgwLRsEQdIK8H2b9r6kI1PCQwWhfTYuWSKypIqsiUqOsKHZZrLPdXsveSum
 w/8SoU5j8Ynh6dl6vAqmAsv98bpbAxBd5UyyEmmQSCxZdOhCIJGY0xllAtXdBukn5afc
 DiGKmuY93/CuB1JKJW1UGT/hskEpibhxE/5nt2l0GH/iKGqIHF7aWhQ+NlL91ycfh4Fb
 zWLIV/OqAJ3YDAicke+KcgrDZiqGoZZIMqnPtFuyA59hT//0T6xHINmkwdlPZb97udA3
 Z4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XeckW1SELkzqZtdQyYlPpbgjiGzhPPr2SL3SVbOXvdk=;
 b=hVGTufIDKtmwQ9cQKZ9kUQoYpNRWZYdARGraTJhELxqqWwFnBxDzF7nsi/MZMqb1yR
 T6PwJKStGV7vaU6fIhNMC6BJPH3pZIZmgJTJL9xta6NkqwQs9bqqYFgQ9AddRdsQ28Ao
 ygvd7ywkU3R0ONbXq8prakO7+q3WgDsg70vL4At+n+F+oucf5/1U2nhyA7mAm+y8L6P4
 c2vYoyf0sEsaxV8h5wKew2h+zotxLC1gHSEZKnBpocbZjECKeq0eD/F1Cyp+GcoTSz54
 8HLOua/gKjoNQzDbaui4jCUQrbg/OHm4foGuhK4tCFktJdO+xP0MHhtPxz+EUi7qFLsU
 zLiA==
X-Gm-Message-State: AOAM530OCYAl4ZmBy90dXsVJGMTHjUfijqipMaI1xWuRXvZMdLk37n7Y
 unGPpI04jKnRXxR8XfnicyM=
X-Google-Smtp-Source: ABdhPJwrvayOCZ/rKcVBT7/kWwv/S4SY4OZnIWwvy5U1sMYsfU0+O9b+jLN7128qkA2N515M/xCEdQ==
X-Received: by 2002:a17:902:c641:b029:122:6927:6e50 with SMTP id
 s1-20020a170902c641b029012269276e50mr10457543pls.6.1624359505798; 
 Tue, 22 Jun 2021 03:58:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 12/43] KVM: PPC: Book3S HV P9: Factor out yield_count
 increment
Date: Tue, 22 Jun 2021 20:57:05 +1000
Message-Id: <20210622105736.633352-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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

Factor duplicated code into a helper function.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index b1b94b3563b7..38d8afa16839 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3896,6 +3896,16 @@ static inline bool hcall_is_xics(unsigned long req)
 		req == H_IPOLL || req == H_XIRR || req == H_XIRR_X;
 }
 
+static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
+{
+	struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
+	if (lp) {
+		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
+		lp->yield_count = cpu_to_be32(yield_count);
+		vcpu->arch.vpa.dirty = 1;
+	}
+}
+
 /*
  * Guest entry for POWER9 and later CPUs.
  */
@@ -3926,12 +3936,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 1;
 	vc->in_guest = 1;
 
-	if (vcpu->arch.vpa.pinned_addr) {
-		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
-		lp->yield_count = cpu_to_be32(yield_count);
-		vcpu->arch.vpa.dirty = 1;
-	}
+	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (cpu_has_feature(CPU_FTR_TM) ||
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
@@ -4069,12 +4074,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
 		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
 
-	if (vcpu->arch.vpa.pinned_addr) {
-		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
-		lp->yield_count = cpu_to_be32(yield_count);
-		vcpu->arch.vpa.dirty = 1;
-	}
+	vcpu_vpa_increment_dispatch(vcpu);
 
 	save_p9_guest_pmu(vcpu);
 #ifdef CONFIG_PPC_PSERIES
-- 
2.23.0

