Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D8E496BCA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 11:56:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgtTf27X6z3bcg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 21:56:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ozp+OPQT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ozp+OPQT; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgtSt5grxz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 21:55:40 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d7so11002236plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 02:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBZEebPO/GHU3Jj3Q+vstKPKR/t0QiMyGQljVRgLCTQ=;
 b=Ozp+OPQTwu4IjpKBKU0QvPSRRDuILI3dH3nzXfVZGjGDccIKeWlrmHqd/6wrIfdF24
 uQjfqh6TRjooOJ33+n7iDinsQP8N92Joev0uuu/ILJHwE8HptSBaOJU72BjPiLKP42A2
 VdbHllZmAiiWwz4ZAkgMz3DsS0tFiyOhTxyAnZLn7JRI9DHw1UleY8ftF1CI9TwMZBp1
 GfJeYu1Nko4/mgdeh82PfuYwNaMy00OE7/QIRDxoME/06VD+eOzQrNs6BIAaooAOqoVn
 LYr0tYcwNznrXQ7atbHiIoGC660hD7qe4zV6pALPmt5rGpQT00lGw9ptfHLu1wAZTjFC
 rlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBZEebPO/GHU3Jj3Q+vstKPKR/t0QiMyGQljVRgLCTQ=;
 b=xgyKLqXtl8bc2LKvrKk41F6GVAYI1Nqri54Tmr1bdClBtBuGiyMaEx2ehySURsAnrg
 k0nPJn2X169BnulRdMYKvoNvtiAkTeQAharRzL0yU2G8yO6mvgT8UtCqE1RykTN0uV2r
 VBwo7xwlvDqUerDUevEsMf6FaxCJttGFJJDxqDFiGA9HwQE0qhggD6S3n3BYzPErGr3E
 myDBcifvzu7oJYFVVAGhDGlbGsKlmUhxRKlheuPz3dY7eZiW2yuIdIpl1edPNPA/8946
 H3vt3lbh4L3hK+eVLKOcfJkWSo9PrBRsM9tDvpBcmd8OP+eG8XeOGO1/lD2/uNUnLFxP
 xcRg==
X-Gm-Message-State: AOAM531uliTzHmWb95uD5JElJZziTBt04C/pSDtDSGlsU5t5+PrON2aN
 Z70fyH8LL4J4iKNSNU7xls9Ko3wp750=
X-Google-Smtp-Source: ABdhPJwfUgOHs4/NzpQfigSyHVlMG/oahnLOFCCmQKYCoMwbzk/6dVoplhEfS8mYnRqUHkPV37nhhA==
X-Received: by 2002:a17:90b:3884:: with SMTP id
 mu4mr4692619pjb.82.1642848936809; 
 Sat, 22 Jan 2022 02:55:36 -0800 (PST)
Received: from bobo.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id h6sm1020809pfc.36.2022.01.22.02.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 02:55:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV Nested: Fix nested HFSCR being clobbered
 with multiple vCPUs
Date: Sat, 22 Jan 2022 20:55:30 +1000
Message-Id: <20220122105530.3477250-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

The L0 is storing HFSCR requested by the L1 for the L2 in struct
kvm_nested_guest when the L1 requests a vCPU enter L2. kvm_nested_guest
is not a per-vCPU structure. Hilarity ensues.

Fix it by moving the nested hfscr into the vCPU structure together with
the other per-vCPU nested fields.

Fixes: 8b210a880b35 ("KVM: PPC: Book3S HV Nested: Make nested HFSCR state accessible")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h | 1 -
 arch/powerpc/include/asm/kvm_host.h      | 1 +
 arch/powerpc/kvm/book3s_hv.c             | 3 +--
 arch/powerpc/kvm/book3s_hv_nested.c      | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index fe07558173ef..827038a33064 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -39,7 +39,6 @@ struct kvm_nested_guest {
 	pgd_t *shadow_pgtable;		/* our page table for this guest */
 	u64 l1_gr_to_hr;		/* L1's addr of part'n-scoped table */
 	u64 process_table;		/* process table entry for this guest */
-	u64 hfscr;			/* HFSCR that the L1 requested for this nested guest */
 	long refcnt;			/* number of pointers to this struct */
 	struct mutex tlb_lock;		/* serialize page faults and tlbies */
 	struct kvm_nested_guest *next;
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index a770443cd6e0..d9bf60bf0816 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -818,6 +818,7 @@ struct kvm_vcpu_arch {
 
 	/* For support of nested guests */
 	struct kvm_nested_guest *nested;
+	u64 nested_hfscr;	/* HFSCR that the L1 requested for the nested guest */
 	u32 nested_vcpu_id;
 	gpa_t nested_io_gpr;
 #endif
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d1817cd9a691..84c89f08ae9a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1816,7 +1816,6 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 
 static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 {
-	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	int r;
 	int srcu_idx;
 
@@ -1922,7 +1921,7 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		 * it into a HEAI.
 		 */
 		if (!(vcpu->arch.hfscr_permitted & (1UL << cause)) ||
-					(nested->hfscr & (1UL << cause))) {
+				(vcpu->arch.nested_hfscr & (1UL << cause))) {
 			vcpu->arch.trap = BOOK3S_INTERRUPT_H_EMUL_ASSIST;
 
 			/*
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 8f8daaeeb3b7..9d373f8963ee 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -363,7 +363,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	/* set L1 state to L2 state */
 	vcpu->arch.nested = l2;
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
-	l2->hfscr = l2_hv.hfscr;
+	vcpu->arch.nested_hfscr = l2_hv.hfscr;
 	vcpu->arch.regs = l2_regs;
 
 	/* Guest must always run with ME enabled, HV disabled. */
-- 
2.23.0

