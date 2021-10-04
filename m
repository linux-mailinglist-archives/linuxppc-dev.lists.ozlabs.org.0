Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAFE4213BE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:11:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQhP6V51z3ddg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:11:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p2/urn5r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=p2/urn5r; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQSl3c1Pz30gd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:43 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id e7so16991890pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFMn8lvRPRNRmYA8rM8dLrBYTRNSq64OxGEvfMyovHo=;
 b=p2/urn5rzExbS67HM4XpjZhOqytqq3R9uNF5LhYfxjg9s2C5kGrXIOHbSTJnEyF8TJ
 N9qFZ1qNpP48uE/6UZijGyoIyKBi62ju4f+MyWaw4rxOZYLtZJqlU+DPYQzotm+zdQnG
 eKZhtr/jGmkviquHoZUG0pr4RlsMyV7euLIIRRc5Xub1Hc3l87eBujVvCCc+zvC75JKa
 lL4ffj5tuRZ7XNSajAx8uSU50CBzlU8g8M38oT2ytiK9DTJM84vHf7/ZcGBLtUZEmVED
 xsqy7eWyiyVtRSy7LV+L1TVAtOgqVUmabpzLlucar/bspU2PAyAbP0xXK/9jVfaJ5xcM
 BbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFMn8lvRPRNRmYA8rM8dLrBYTRNSq64OxGEvfMyovHo=;
 b=GgNoz9Qb2whBB5OHfdTftgVTWsjbJeN40Uovqer/9J1/7Hdw9xfxGW3brMVQnxbsBt
 h6BWEgvhkGoWssZ/qAy+2M1ZezwI6qeFqhpAl0FdHHIYUgdULBO2eANW4MeBi6vRIkXk
 5sa74WY7nfonQRI0sZQYAqxSh01+L2JJnPOj87e+xubmhQnHyeRbFM31xKDotg5z6rAO
 e07e7kCGc6pMwUijLB/zyXz1ZMwzncer9tg0GN1H4Tyk/BXSVFEdQDonW4shy928rwFU
 STIQnGd0DmN4ueq+EPjsaWv3M6lq+RIrALAE8+6XflGXAT0+wP3YBCex3lU5TEal3TXN
 gUaQ==
X-Gm-Message-State: AOAM53286Oi6EfyytMF83MpYBKzMZQMwNd3k0etJFNjYFAZKydLquCgj
 DvINDqgDyajZT7xvxmVxhLk=
X-Google-Smtp-Source: ABdhPJz7235PlBwZMUX3vYxKnU/kU7PPk5wr8vpAcHfgGeteQsFyXpMYRgn032dUqomdMr9D++w2KQ==
X-Received: by 2002:a63:af4a:: with SMTP id s10mr11525585pgo.469.1633363301244; 
 Mon, 04 Oct 2021 09:01:41 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 16/52] KVM: PPC: Book3S HV P9: Factor out yield_count
 increment
Date: Tue,  5 Oct 2021 02:00:13 +1000
Message-Id: <20211004160049.1338837-17-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Factor duplicated code into a helper function.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6bbd670658b9..f0ad3fb2eabd 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4118,6 +4118,16 @@ static inline bool hcall_is_xics(unsigned long req)
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
@@ -4146,12 +4156,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4279,12 +4284,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
 		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
 
-	if (vcpu->arch.vpa.pinned_addr) {
-		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
-		lp->yield_count = cpu_to_be32(yield_count);
-		vcpu->arch.vpa.dirty = 1;
-	}
+	vcpu_vpa_increment_dispatch(vcpu);
 
 	switch_pmu_to_host(vcpu, &host_os_sprs);
 
-- 
2.23.0

