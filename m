Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABECD3E95E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFcb3zxXz30Jx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:28:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Lx3QQ9od;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lx3QQ9od; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF3l5F4dz3cM0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:31 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id nt11so4230044pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h9r7slMa/wxjs1UUTM7giJfy6Yufgbe7vAh2oRXYxVo=;
 b=Lx3QQ9odZsPvd10rGGcBQyoWkVluSa+FHJrDKFAxKHsXzb/31cevkrNjpB2+FNLTbD
 0+BPI5fyC+4RtfBNRR3tPVsYKszXK3Lo4KbVgbw25t6Gt7Y/0xattrtkGC59RMX3CgLk
 cIKEW+xpgmh8M3zKsv3bMXjgSnx05gESe1MRf6dIaXSzCpmm5V6uYBgEhhhNK+dTn7bd
 ORZrs3BfxsWP8dgqCDX/mV/tZzdmLdaQ6ihx1pOa4yjkzVBSjZI8UC3g88RnGfTob37K
 289TuT+csRAzuLYZL1XCbLpUnE/2od0cm4cF7sozCCEkQsG2MVvNVAToSuwNp/juA2mW
 zDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h9r7slMa/wxjs1UUTM7giJfy6Yufgbe7vAh2oRXYxVo=;
 b=kAa80ZXKtvjqEbNThvqA4dGUeYkjyN8uKJY4YpmSFkZAol8hyQN65UuDgYsodaMqXR
 V5XVw+18RKwijmhGki15eExmqOVsCI7mHmogYZxRq8ZQD2uAj089V67WRaP6dW4kcHE1
 oD2VDaN2C9yS3FhQpoYYE5ePGf8Y1NbWeiRC76pl6TybcdgG2j0SR830p/EZZIIhdFf0
 LNUN1daIyy8GzMaMTiuDjCbRxWhSnO8FqNF0NGphHtvDFN1kbbeQ/dDmOPfBjOMIZnxu
 K/tEFe3FDTCCad76Z1FA9xswe1frMdLpvpRvBjaUNcuCPjVy2itxiJYZHi000/ABxzGT
 XmQw==
X-Gm-Message-State: AOAM530jPaEGRatzMC53Z0jsZMuFH5OrL6M+6oDDOs6U4MsEkEUM8PAX
 CkTCz/nNWuhW+YjEHghyZyw=
X-Google-Smtp-Source: ABdhPJyKtVY7gsWVHDzOWE5GYD38Ht12rDXBJOgWTbTjSbWADtCV64mrIDjuE+J2LKGlgHw27HiF+w==
X-Received: by 2002:a05:6a00:ccb:b029:3c6:803d:8e3 with SMTP id
 b11-20020a056a000ccbb02903c6803d08e3mr35308617pfv.0.1628697809419; 
 Wed, 11 Aug 2021 09:03:29 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 40/60] KVM: PPC: Book3S HV P9: Implement TM fastpath for
 guest entry/exit
Date: Thu, 12 Aug 2021 02:01:14 +1000
Message-Id: <20210811160134.904987-41-npiggin@gmail.com>
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

If TM is not active, only TM register state needs to be saved and
restored, avoiding several mfmsr/mtmsrd instructions and improving
performance.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 9ea70736f3d7..e52d8b040970 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -289,8 +289,15 @@ bool load_vcpu_state(struct kvm_vcpu *vcpu,
 
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
 
 	load_spr_state(vcpu, host_os_sprs);
@@ -316,8 +323,16 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
 	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
 
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
 }
 EXPORT_SYMBOL_GPL(store_vcpu_state);
 
-- 
2.23.0

