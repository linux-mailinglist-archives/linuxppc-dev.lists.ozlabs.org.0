Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8584213F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:22:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQx033JRz3g0V
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:22:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QQQKWRfh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QQQKWRfh; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQTT4CFSz3cJl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:21 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id g14so14943047pfm.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nw+tyfcHLpLdeHB2w2xt0EdeJ3op84k0Tqa/00/sMlA=;
 b=QQQKWRfhFnTxudCfehAR+peIPTn68znqLLiZU86od0c40MStRasZ0h39O6G8dER/3I
 PeYdfrurA3Y02cjC1SvQvuaxzv6gnkUY20vyDyUP5LUDEQm7LzEnXv1oF5psZImZRoii
 m9MMdA5wsXibGb2zQEE2+HWXkHnX0GOTwQw+bfoWP0hgdOSmlPEhfy7JYMw6byWA3QGx
 IJi/NABHQ5r30rDkbVGDq+BqmEwzeV/IedkUCx/Gl64KcfOl1aiRMp6l7wzS96eroBkp
 1GTdqm4UwkjSXkT7tiEeFre9m3RBa2QcQigAD7UIMWF1vz8UhPh1hsZwHDdG4YijNKXX
 DKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nw+tyfcHLpLdeHB2w2xt0EdeJ3op84k0Tqa/00/sMlA=;
 b=oDk1K4Dyy4tcSE6Z4RIPMQaSUik/gSWfR5cw9wmS7UUcrL26A+Lg/7+rh4wDgMpnOv
 kUDI/PrHNMYt9RlrtoGG8Gj10besAuqhuKfHWsYzLkqs+aNhFmFMGSI2aEikVfp+WE5m
 xYK3YBWygcVurql40PnXiCz39D9pZfcVrF39GUetVOp5kaiGFupCWM8cZtnvfTQd0iwf
 tfVD4rHVCKpaJ1tsbAo2VTDU2fhjiz7IyEvreUM1iLeSCNzUgijdIardUJ4tX0z1VPP2
 i5ca1WfWIahHRZ+oDX6KmB81Qerhz82NVDkLroqWlLdF6LmZW2LFnPcwFXY9yLjtK1+x
 Qikg==
X-Gm-Message-State: AOAM532M1uLoOhC+vQQ63f3Jh6G1nKLoZYHdbuOlZB3vZ73L7CqIFVi5
 6mB+9YZ2sbbm3ID4UYPdqYeXZ2ncRig=
X-Google-Smtp-Source: ABdhPJyIsfqeG/Mh1wu9pNeXGjllDPl6AWQsRBG0NXuAIklS2i5+g/aAkqsfdqFlERZET/MpBpwKrA==
X-Received: by 2002:a63:e741:: with SMTP id j1mr11594783pgk.86.1633363339405; 
 Mon, 04 Oct 2021 09:02:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 32/52] KVM: PPC: Book3S HV P9: Implement TM fastpath for
 guest entry/exit
Date: Tue,  5 Oct 2021 02:00:29 +1000
Message-Id: <20211004160049.1338837-33-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If TM is not active, only TM register state needs to be saved and
restored, avoiding several mfmsr/mtmsrd instructions and improving
performance.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index fa080533bd8d..6bef509bccb8 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -287,11 +287,20 @@ bool load_vcpu_state(struct kvm_vcpu *vcpu,
 {
 	bool ret = false;
 
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (cpu_has_feature(CPU_FTR_TM) ||
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
-		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
-		ret = true;
+		unsigned long guest_msr = vcpu->arch.shregs.msr;
+		if (MSR_TM_ACTIVE(guest_msr)) {
+			kvmppc_restore_tm_hv(vcpu, guest_msr, true);
+			ret = true;
+		} else {
+			mtspr(SPRN_TEXASR, vcpu->arch.texasr);
+			mtspr(SPRN_TFHAR, vcpu->arch.tfhar);
+			mtspr(SPRN_TFIAR, vcpu->arch.tfiar);
+		}
 	}
+#endif
 
 	load_spr_state(vcpu, host_os_sprs);
 
@@ -315,9 +324,19 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
 #endif
 	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
 
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
-		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
+		unsigned long guest_msr = vcpu->arch.shregs.msr;
+		if (MSR_TM_ACTIVE(guest_msr)) {
+			kvmppc_save_tm_hv(vcpu, guest_msr, true);
+		} else {
+			vcpu->arch.texasr = mfspr(SPRN_TEXASR);
+			vcpu->arch.tfhar = mfspr(SPRN_TFHAR);
+			vcpu->arch.tfiar = mfspr(SPRN_TFIAR);
+		}
+	}
+#endif
 }
 EXPORT_SYMBOL_GPL(store_vcpu_state);
 
-- 
2.23.0

