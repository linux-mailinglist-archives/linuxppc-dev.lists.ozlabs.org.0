Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C100E32511E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 15:02:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZHP5KX9z3h4K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 01:02:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=M2IA6lAX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M2IA6lAX; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYzk2BNHz3dNh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:49:06 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id p21so3791099pgl.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/d8HsRevOUAthNw1fJ9lQVtVP6HhjoYaa+NO0SoIY3c=;
 b=M2IA6lAXNli1kQg+PS6A/2dAZxaIQ3h50JKVW0pDdSSnm2OgTFr0UinELigHncu6vb
 rx6umZeJ0/v2NA3svwU7JHJ/hr/su59OXdh2+q0maBRejgMz42m99o/PdlMrH/SfUJ0n
 JUMmwgZr0nFYknRklSq+zA2RxFlsxr/WUfxPpozxWQ1rYRcSs2u1nPCBMwy/jhQFhaMk
 arGzIP5Ct4btdKarOx1Mx9qk7746mpkYTDhXktGyvLLHQm8HeRgS3Dr6Ofx8lXN+x6j9
 9zYFFF1ZfzMkhRi6nZRW5Rw034g/d9ywe7R2hZIc6rM5Df8jKd79s3A8Z3zwN6QbEZzW
 OKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/d8HsRevOUAthNw1fJ9lQVtVP6HhjoYaa+NO0SoIY3c=;
 b=kWfkoSPQil75YmAs9bJhZdRYejDLRLfxtew3pi/36PRqEArloXsIEehxuBl45bpHW8
 qTvtJSm/fuwQfNh8gjw6uUytkLkS5K5enZsBSqmoll9yZe++YUa6B2jgdDSdsTcKMwev
 RRXfHygd1JR90STpIeUt2XDjW8VFQTF3r/HXPWzTCM2n9YXH47oYNCBebrYsfdS6Uyc1
 I9QjuVM5CkEk+xjyRL5bDNARJXJF786fVJ8Fy6iiOFc4KRBfJapYrsTUELg34w0+jQ6R
 f2q3mKQ2e9oPepSabGSSxb4UXtiO3+d9utP8B/O3ab6nkBFQ30BoaRqq/Kmmg+Xkl11u
 3RbA==
X-Gm-Message-State: AOAM530JEUaeimcKPjhYGCVEqlP5Z59Efep/nl4AcYgOHx5XhYks27ig
 BmF+OQyggybadPjONyJe17g=
X-Google-Smtp-Source: ABdhPJx9GutxHKPn6nwNeeltugDeXxOtwMZO1Xkh8v+cvO3T43BAiOeR/hDF3Ae4FQVT1rax4dOQjQ==
X-Received: by 2002:a05:6a00:22ca:b029:1ed:f915:ca98 with SMTP id
 f10-20020a056a0022cab02901edf915ca98mr3317549pfj.68.1614260944724; 
 Thu, 25 Feb 2021 05:49:04 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:49:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 36/37] KVM: PPC: Book3S HV P9: implement hash host / hash
 guest support
Date: Thu, 25 Feb 2021 23:46:51 +1000
Message-Id: <20210225134652.2127648-37-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c           |  2 +-
 arch/powerpc/kvm/book3s_hv_interrupt.c | 75 ++++++++++++++++----------
 2 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 97320531f37c..10d5c7ea80ca 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4403,7 +4403,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		 * The TLB prefetch bug fixup is only in the kvmppc_run_vcpu
 		 * path, which also handles hash and dependent threads mode.
 		 */
-		if (radix_enabled())
+		if (cpu_has_feature(CPU_FTR_ARCH_300))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index d79c6f4f330c..af4772755e5d 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -140,12 +140,51 @@ static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64
 }
 
 
-static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
+static void switch_mmu_to_host(struct kvm *kvm, u32 pid)
 {
 	mtspr(SPRN_PID, pid);
 	mtspr(SPRN_LPID, kvm->arch.host_lpid);
 	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
 	isync();
+
+	/* XXX: could save and restore host SLBs to reduce SLB faults */
+	if (!radix_enabled())
+		slb_restore_bolted_realmode();
+}
+
+static void save_host_mmu(struct kvm *kvm)
+{
+	if (!radix_enabled()) {
+		mtslb(0, 0, 0);
+		slb_invalidate(6);
+	}
+}
+
+static void save_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
+{
+	if (kvm_is_radix(kvm)) {
+		radix_clear_slb();
+	} else {
+		int i;
+		int nr = 0;
+
+		/*
+		 * This must run before switching to host (radix host can't
+		 * access all SLBs).
+		 */
+		for (i = 0; i < vcpu->arch.slb_nr; i++) {
+			u64 slbee, slbev;
+			mfslb(i, &slbee, &slbev);
+			if (slbee & SLB_ESID_V) {
+				vcpu->arch.slb[nr].orige = slbee | i;
+				vcpu->arch.slb[nr].origv = slbev;
+				nr++;
+			}
+		}
+		vcpu->arch.slb_max = nr;
+		mtslb(0, 0, 0);
+		slb_invalidate(6);
+	}
 }
 
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr)
@@ -252,15 +291,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_AMOR, ~0UL);
 
+	if (!radix_enabled() || !kvm_is_radix(kvm) || cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
+
+	save_host_mmu(kvm);
 	if (kvm_is_radix(kvm)) {
-		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
-			__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
 		switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 		if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
 			__mtmsrd(0, 1); /* clear RI */
 
 	} else {
-		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
 		switch_mmu_to_guest_hpt(kvm, vcpu, lpcr);
 	}
 
@@ -437,31 +477,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	/* HDEC must be at least as large as DEC, so decrementer_max fits */
 	mtspr(SPRN_HDEC, decrementer_max);
 
-	if (kvm_is_radix(kvm)) {
-		radix_clear_slb();
-	} else {
-		int i;
-		int nr = 0;
-
-		/*
-		 * This must run before switching to host (radix host can't
-		 * access all SLBs).
-		 */
-		for (i = 0; i < vcpu->arch.slb_nr; i++) {
-			u64 slbee, slbev;
-			mfslb(i, &slbee, &slbev);
-			if (slbee & SLB_ESID_V) {
-				vcpu->arch.slb[nr].orige = slbee | i;
-				vcpu->arch.slb[nr].origv = slbev;
-				nr++;
-			}
-		}
-		vcpu->arch.slb_max = nr;
-		mtslb(0, 0, 0);
-		slb_invalidate(6);
-	}
-
-	switch_mmu_to_host_radix(kvm, host_pidr);
+	save_guest_mmu(kvm, vcpu);
+	switch_mmu_to_host(kvm, host_pidr);
 
 	/*
 	 * If we are in real mode, don't switch MMU on until the MMU is
-- 
2.23.0

