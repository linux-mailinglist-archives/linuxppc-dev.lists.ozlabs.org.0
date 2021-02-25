Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6148F325105
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZB92Wkhz3gBd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:58:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=s/3/KaxD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s/3/KaxD; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYz66Cmbz3dGP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:34 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id e9so3571316pjj.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1msQbx0Hbt6eMglomvgJz+el+SEDc6l3SYc2zTEVxU=;
 b=s/3/KaxDPHyERPd/FnBJhlvLUnkzX9y1IsZx0j3QaTcL/Gipm0lPbo8XGLZvDRSftk
 hBlGclraQunoazuEo+vX574p2QYOejng4GO1m/lIeZQxSVJ1xNHpuLaj2IYY5l4A43JM
 02KT3G4q3jFJTj/YQ1HoGkesgqqDKw/IC6A5VCiJfRT8fbkwOQN6PpQnYhFXDDn/AcuS
 ZN8H7/WEIFJvmeTAumrTGRJeiLilgigsFAZkXaEUR80YIk9fI79TC6vc3Vhs1Z7YEm2R
 dj5MQ9cZ81OZEECp/nklW5t5o4x3MOhDtCV78/bNYfYPF8L6ItybhStJ2rRbW7KEvEG2
 UPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1msQbx0Hbt6eMglomvgJz+el+SEDc6l3SYc2zTEVxU=;
 b=k26oxNkq4o1ZB3jyrlz7UxvSPNIHRTmAIYwFtYDj+PagB087rtSaunBhb3MFnRRKyh
 /KChq6rZ2YvHUrp1DFi4oGsUBJaDr3n0TNKWM+Sg8rzJc3QQt+1Zi69C496irMM/eyYP
 OpMd5g+i29f/7FEpwIxRfkxeczUYYOODmwUp7igUlJltzoc0c/NKy6YPHqDF+9HRzSXP
 hX1/46sqWrDQXDCwT/Z5nx5PuWeWiwrPemdG7yUd98WDnaZiV/LbAHicpB5PS/9LtbAv
 FhvgseNW17iuDdc4TzOZB92jEVlizQMfSImbjOys0lilcDuCqNuSmmAdvYyId9ZOOb1c
 C6uA==
X-Gm-Message-State: AOAM530nx0rHO/Ru1a7SFsy3iKSHmrkh5/Ov0+9KtbL/6b2QedruLsdV
 OBd6Xb8fdiv+b5pPsoD18TY=
X-Google-Smtp-Source: ABdhPJwHr4Jo55/pa7u26cgrj7FDeHBSv5PrK2PSvYxQlz7IUuv26xNR9pMVXf3fZ7hr1Iwpv+dYsg==
X-Received: by 2002:a17:90b:1290:: with SMTP id
 fw16mr3374278pjb.99.1614260912722; 
 Thu, 25 Feb 2021 05:48:32 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 26/37] KVM: PPC: Book3S HV P9: Improve exit timing
 accounting coverage
Date: Thu, 25 Feb 2021 23:46:41 +1000
Message-Id: <20210225134652.2127648-27-npiggin@gmail.com>
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

The C conversion caused exit timing to become a bit cramped. Expand it
to cover more of the entry and exit code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_interrupt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index f5fef7398e37..4a158c8fc0bc 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -148,6 +148,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
+	start_timing(vcpu, &vcpu->arch.rm_entry);
+
 	if (vc->tb_offset) {
 		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -198,8 +200,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	start_timing(vcpu, &vcpu->arch.rm_entry);
-
 	vcpu->arch.ceded = 0;
 
 	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
@@ -334,8 +334,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
-	end_timing(vcpu);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -400,6 +398,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
+	end_timing(vcpu);
+
 	return trap;
 }
 EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
-- 
2.23.0

