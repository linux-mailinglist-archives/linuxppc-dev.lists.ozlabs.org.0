Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B5D3E9580
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:05:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlF6945NNz3d9g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:05:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RFqv6pBn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RFqv6pBn; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF211vZkz2yXs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:01 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so10322595pjn.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYei3BlTiyrrgi66vFfJKSG/jGz/R3VmvpQE8Xx8Q/8=;
 b=RFqv6pBnoB7du76hq41hx30dFEObjs+y27xkrKJ93QHQHmoMIp/OW2w/t7RJk0Su2y
 2n2gwtAt1zZ5NkNe46HpWnrUtkKagG55+GaFEpCGn4IQoCdxstDT8bmKo1PTxwMCbVpG
 V4FxcnYv6DVQZXR2Ph9njPvAAR2n4HZwNQklt2QQc333LgH6AfFyMxAN6tUnIzQ+K6T6
 DGoF7TvtIVSpL0wOk5TcOE7n4jsEqovqcTMTg4OyUlNx/JQrsFJ9u7HdEwY6eyOpLSEz
 zNrrTkBu6g9VAg+aduWtbNxjTuXHfyQvkSFAqsKZ0lCRuvSdvy5s/yk878s04G+CyjDq
 p8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYei3BlTiyrrgi66vFfJKSG/jGz/R3VmvpQE8Xx8Q/8=;
 b=F3LGJSKFAVwCZW7Ce5wVKBOfcQ8tz+SUoh9X4LlNSxVoJ7fPG3xbWMeHqf5ukKbXaS
 xk8tD35GQOq5uxFdz7l3/nHYa9QpKbKEYbeQmBCPS1CtCHN6Jw0MchiTH4RYQq4Bw9El
 fO+mcO+0LojsJOogOUgrLFV8G/vt+uMpD1LsqRueS/cimSdsgzzlF9DL6+jSkuoSBDZ3
 Ood+c5H5TAU8IxJa/GlF0JbQh3UG7a1gy+CMnMju9chgKIqT1PXuZOGhdQjhh9p/pZYn
 MD8tpLF+cRAvJWymUXFZZae3Qm9z0YMZVdaVjsO+G7EFNxlZR6sXRlSYIu21Nrb+sWb2
 2U6A==
X-Gm-Message-State: AOAM53157aFWHkOp/DbWKvunMvOSH53VHiFcSkZfBeqzvTyIk4DFGu1e
 /yPqMGyyasn6jsHJrEkDEvE=
X-Google-Smtp-Source: ABdhPJxmK/zmVg7WvVk6WLaFW5ifqZuJQ2yzKqGhVkALuU6uyQ2ci1JjQ5Tpz2QpAXv6xTtB+UnaVw==
X-Received: by 2002:a65:6894:: with SMTP id e20mr841206pgt.419.1628697719294; 
 Wed, 11 Aug 2021 09:01:59 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:01:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 06/60] KVM: PPC: Book3S HV Nested: Make nested HFSCR state
 accessible
Date: Thu, 12 Aug 2021 02:00:40 +1000
Message-Id: <20210811160134.904987-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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

When the L0 runs a nested L2, there are several permutations of HFSCR
that can be relevant. The HFSCR that the L1 vcpu L1 requested, the
HFSCR that the L1 vcpu may use, and the HFSCR that is actually being
used to run the L2.

The L1 requested HFSCR is not accessible outside the nested hcall
handler, so copy that into a new kvm_nested_guest.hfscr field.

The permitted HFSCR is taken from the HFSCR that the L1 runs with,
which is also not accessible while the hcall is being made. Move
this into a new kvm_vcpu_arch.hfscr_permitted field.

These will be used by the next patch to improve facility handling
for nested guests, and later by facility demand faulting patches.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h | 1 +
 arch/powerpc/include/asm/kvm_host.h      | 2 ++
 arch/powerpc/kvm/book3s_hv.c             | 2 ++
 arch/powerpc/kvm/book3s_hv_nested.c      | 5 +++--
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index eaf3a562bf1e..19b6942c6969 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -39,6 +39,7 @@ struct kvm_nested_guest {
 	pgd_t *shadow_pgtable;		/* our page table for this guest */
 	u64 l1_gr_to_hr;		/* L1's addr of part'n-scoped table */
 	u64 process_table;		/* process table entry for this guest */
+	u64 hfscr;			/* HFSCR that the L1 requested for this nested guest */
 	long refcnt;			/* number of pointers to this struct */
 	struct mutex tlb_lock;		/* serialize page faults and tlbies */
 	struct kvm_nested_guest *next;
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 9f52f282b1aa..a779f7849cfb 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -811,6 +811,8 @@ struct kvm_vcpu_arch {
 
 	u32 online;
 
+	u64 hfscr_permitted;	/* A mask of permitted HFSCR facilities */
+
 	/* For support of nested guests */
 	struct kvm_nested_guest *nested;
 	u32 nested_vcpu_id;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e79eedb65e6b..c65bd8fa4368 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2718,6 +2718,8 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	if (cpu_has_feature(CPU_FTR_TM_COMP))
 		vcpu->arch.hfscr |= HFSCR_TM;
 
+	vcpu->arch.hfscr_permitted = vcpu->arch.hfscr;
+
 	kvmppc_mmu_book3s_hv_init(vcpu);
 
 	vcpu->arch.state = KVMPPC_VCPU_NOTREADY;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 1eb4e989edc7..5ad5014c6f68 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -272,10 +272,10 @@ static void load_l2_hv_regs(struct kvm_vcpu *vcpu,
 				      (vc->lpcr & ~mask) | (*lpcr & mask));
 
 	/*
-	 * Don't let L1 enable features for L2 which we've disabled for L1,
+	 * Don't let L1 enable features for L2 which we don't allow for L1,
 	 * but preserve the interrupt cause field.
 	 */
-	vcpu->arch.hfscr = l2_hv->hfscr & (HFSCR_INTR_CAUSE | vcpu->arch.hfscr);
+	vcpu->arch.hfscr = l2_hv->hfscr & (HFSCR_INTR_CAUSE | vcpu->arch.hfscr_permitted);
 
 	/* Don't let data address watchpoint match in hypervisor state */
 	vcpu->arch.dawrx0 = l2_hv->dawrx0 & ~DAWRX_HYP;
@@ -362,6 +362,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	/* set L1 state to L2 state */
 	vcpu->arch.nested = l2;
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
+	l2->hfscr = l2_hv.hfscr;
 	vcpu->arch.regs = l2_regs;
 
 	/* Guest must always run with ME enabled, HV disabled. */
-- 
2.23.0

