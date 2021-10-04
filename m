Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD542139C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:06:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQZ81bJ4z3cY2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:06:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lAVDfCEP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lAVDfCEP; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQSM2159z2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:23 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id u7so14866501pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PeeoMt4W4XFn9V2VfFg4Edyu34SbX1NSkfz7A99z94=;
 b=lAVDfCEPocM8um2kUJzsls5OFEbkcHeWvtz99SsEikKpioduRotj/qOTgvc9L7Oi6b
 eaYbNrAxf3Z1e1JpJ+o1pp4J3DGxMiUeCdA1QCURdsYCoq+T6RTKZxz+1yRcodbEFVb8
 7LSwCb+Y6huuB20ZE2spNNx+keSsrShU/keBRhJMZTjopgDcgde/Smm2VE2O5Os8uYjw
 1nh2B8FbnXrKMyvcH/TvJKmXn43/WLD+RyJOKa5P+GL3pXdn8Qf7f7YRMxmXN7UIAWfX
 4oTunS9RckNoGZc4AxDBL6kn7kdxklc6cvhE9ceOyeuhq0Neg8zoqPJFqzkiSB0EK6Cw
 zkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PeeoMt4W4XFn9V2VfFg4Edyu34SbX1NSkfz7A99z94=;
 b=qj7FF1DhUxPFJZxdfIsJYHrrFWi2oZNG9d6g+fQ/PYemOxlZbbPo66jiPP63MNgRk8
 MmoUqTNNeofbChz6E8PCgZhFA0sI8l7dbakG1pna2jIIaO6hkqfwAE8rB0nD4bOn5pU+
 d/TT9DMxFQL1C2JbEdOgRSYdylu/EZymhB2ATfpNDIeTjBjU/Pab+94jkkVe644qd7kf
 suIYEvSYQVB5mVnYQBJZlAZvL2bW8EYbe83Qpq4V4QJUluWueJos+XjW01gY0ve+XmID
 sAagA5fY4hAXxHyihtP+DItwWZMhXtFV6aE+83Xqy85k57F21U+Zbzd6GOwQGKm/UADq
 ikkQ==
X-Gm-Message-State: AOAM531uMTyV/y7mvbX7QqUVhcZSAjnmIFfG7B4TMms+hE3xW7/HBf6w
 iOgrecL5qEwiyjQSGCDPTzI=
X-Google-Smtp-Source: ABdhPJzFi8aVzvJ0az0svpFGY4o9SjVSZ3fjMU+6MJlYUE22BC3r6kMNvuLjEeOCIuNRfljIABI87w==
X-Received: by 2002:a63:e10:: with SMTP id d16mr11465052pgl.438.1633363280995; 
 Mon, 04 Oct 2021 09:01:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/52] KVM: PPC: Book3S HV: POWER10 enable HAIL when
 running radix guests
Date: Tue,  5 Oct 2021 02:00:05 +1000
Message-Id: <20211004160049.1338837-9-npiggin@gmail.com>
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

HV interrupts may be taken with the MMU enabled when radix guests are
running. Enable LPCR[HAIL] on ISA v3.1 processors for radix guests.
Make this depend on the host LPCR[HAIL] being enabled. Currently that is
always enabled, but having this test means any issue that might require
LPCR[HAIL] to be disabled in the host will not have to be duplicated in
KVM.

This optimisation takes 1380 cycles off a NULL hcall entry+exit micro
benchmark on a POWER10.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e83c7aa7dbba..463534402107 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5047,6 +5047,8 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
  */
 int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
 {
+	unsigned long lpcr, lpcr_mask;
+
 	if (nesting_enabled(kvm))
 		kvmhv_release_all_nested(kvm);
 	kvmppc_rmap_reset(kvm);
@@ -5056,8 +5058,13 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
 	kvm->arch.radix = 0;
 	spin_unlock(&kvm->mmu_lock);
 	kvmppc_free_radix(kvm);
-	kvmppc_update_lpcr(kvm, LPCR_VPM1,
-			   LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR);
+
+	lpcr = LPCR_VPM1;
+	lpcr_mask = LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR;
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		lpcr_mask |= LPCR_HAIL;
+	kvmppc_update_lpcr(kvm, lpcr, lpcr_mask);
+
 	return 0;
 }
 
@@ -5067,6 +5074,7 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
  */
 int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
 {
+	unsigned long lpcr, lpcr_mask;
 	int err;
 
 	err = kvmppc_init_vm_radix(kvm);
@@ -5078,8 +5086,17 @@ int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
 	kvm->arch.radix = 1;
 	spin_unlock(&kvm->mmu_lock);
 	kvmppc_free_hpt(&kvm->arch.hpt);
-	kvmppc_update_lpcr(kvm, LPCR_UPRT | LPCR_GTSE | LPCR_HR,
-			   LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR);
+
+	lpcr = LPCR_UPRT | LPCR_GTSE | LPCR_HR;
+	lpcr_mask = LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR;
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		lpcr_mask |= LPCR_HAIL;
+		if (cpu_has_feature(CPU_FTR_HVMODE) &&
+				(kvm->arch.host_lpcr & LPCR_HAIL))
+			lpcr |= LPCR_HAIL;
+	}
+	kvmppc_update_lpcr(kvm, lpcr, lpcr_mask);
+
 	return 0;
 }
 
@@ -5243,6 +5260,10 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 		kvm->arch.mmu_ready = 1;
 		lpcr &= ~LPCR_VPM1;
 		lpcr |= LPCR_UPRT | LPCR_GTSE | LPCR_HR;
+		if (cpu_has_feature(CPU_FTR_HVMODE) &&
+		    cpu_has_feature(CPU_FTR_ARCH_31) &&
+		    (kvm->arch.host_lpcr & LPCR_HAIL))
+			lpcr |= LPCR_HAIL;
 		ret = kvmppc_init_vm_radix(kvm);
 		if (ret) {
 			kvmppc_free_lpid(kvm->arch.lpid);
-- 
2.23.0

