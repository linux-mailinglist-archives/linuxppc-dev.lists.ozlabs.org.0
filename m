Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C78459FA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:58:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0206FRSz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:58:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Zmi4iyCs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Zmi4iyCs; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzwF2LyHz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:01 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so2423655pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A4A245xAkWFLvtQCogU+gSXjPVK3C3bw6+iPAWSjstA=;
 b=Zmi4iyCsh4xa7+1yiaIjkGGpdESYDc2PZNIPh/gaIfgud6gf6Jk9pqitCY/E/YphuB
 Kf3QJEp367HVmJcVrV0D801Wy6vjSuCQGjoRaVECiTHJVfykSDTB1l3gSWwqsEH1/kKp
 Nx9wKfwdMydS5t8KpgchpU+rOQ3cZV2K3QRvVllfpAgof0NZr+/VBIciQJdbO+oHGHI+
 4RbaolAqzkoIVR47/C9pKFAsVQoTHXgTwrXyICG7L/j1wl4OEK14yjHBfZEDdvh/mvVr
 pbXkSiIO8Gi0Ov+NWQ4md2cR9+l5lYjD4JRIPCotT00nEoh3XBvev8JVM46mZso0wbo/
 TYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A4A245xAkWFLvtQCogU+gSXjPVK3C3bw6+iPAWSjstA=;
 b=tnTQr8p6y7nlmIEUhwiRNBTaQcRNU+YVZThrgWb9et72L6iNvR4UO5xas2BEwEjZz/
 jLz+U+aMcianMGXcLC0evDYEpgdsJ45ei5OdM+tJjWj93HQxkH+WOFpZ4Wwvv8TN5C2H
 4o09RkX4f25kO84vR7XwJhzaDoRO3C5L8WEJt/tslqGwyFrjXLeqaHTdn26kCoC5C104
 DEgg7GYSlPSp9tlEN+OZC3Wh/4gxgfXcn4rUUtSIClsViZIb+cT5MwwgEHQAVKvVRduk
 Fvu1EGef+zsNJFmGL0awr/QBAyD1IkVMGQOrxQVtT/iU9wS79DScPC8amWUHSONfWP/b
 MeOQ==
X-Gm-Message-State: AOAM53265nVTnBnCmcmCilacwTbV1FLG4uWZ7qF5ARed4w6iOfraRMpt
 Pi2ZOzBd+ms7hEKh8PEIshd3/u14gv6YFw==
X-Google-Smtp-Source: ABdhPJxYsByfO/EMZ9RXrwz88+0V6k5dNcaNa3t1Xgs4wtBT2n3B1GAQCtd1aXy8s+YU4766wTigcg==
X-Received: by 2002:a17:90a:1a55:: with SMTP id
 21mr1292259pjl.240.1637661179217; 
 Tue, 23 Nov 2021 01:52:59 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:52:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 08/53] KVM: PPC: Book3S HV: POWER10 enable HAIL when
 running radix guests
Date: Tue, 23 Nov 2021 19:51:46 +1000
Message-Id: <20211123095231.1036501-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
index 1b556dbfcfc8..a683ee5f420a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5073,6 +5073,8 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
  */
 int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
 {
+	unsigned long lpcr, lpcr_mask;
+
 	if (nesting_enabled(kvm))
 		kvmhv_release_all_nested(kvm);
 	kvmppc_rmap_reset(kvm);
@@ -5082,8 +5084,13 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
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
 
@@ -5093,6 +5100,7 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
  */
 int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
 {
+	unsigned long lpcr, lpcr_mask;
 	int err;
 
 	err = kvmppc_init_vm_radix(kvm);
@@ -5104,8 +5112,17 @@ int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
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
 
@@ -5269,6 +5286,10 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
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

