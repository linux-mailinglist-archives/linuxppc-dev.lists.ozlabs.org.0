Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E1D459FD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:13:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0NK3d9Gz3g6y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:13:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pPUOjmly;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pPUOjmly; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzxG0bXTz2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:53 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id b11so16578493pld.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nw+tyfcHLpLdeHB2w2xt0EdeJ3op84k0Tqa/00/sMlA=;
 b=pPUOjmly82+PiNoz+TN7aRgxQY59umSv0TfZLqAuPpEE1P9YzrVzwY5YS/5ibYFTpx
 twEM3KZiPX0FYLvUqexh4+53X/fydjgJpzOaowKeoL64xrWzIQpQnJfVX+OpnsG+DVVF
 Ct4Y6/8Tt/k0nppUyZZtgEH0RjivNZV6cFL1OIdPEHyuq0gyIkXZYuiTJWkeLun2WoXT
 brnvp/98tUDxH5v5riayg1UjTB5TrWMqMTJ8fMUXcptKLS0lrZMOQ4hlCycT12DeMw/m
 fHcFpOEf1pQRCHv67h+4iY7B71KnKgjCZ6LY1iPrPd9rcbholPERpD84q1lXnrXPj8+v
 T6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nw+tyfcHLpLdeHB2w2xt0EdeJ3op84k0Tqa/00/sMlA=;
 b=J/wFhr47gpVffplBHEFJa0Ke3PGXAy14k12g2p8uiXzejpoEPwGNaRZhzAyXTCIuCk
 NZ4kazijNwzstS0Sa0dvCt3+hdzCtYhBCdmV4GK0n5IP4ueM+pGhQ5+tXuTVjUNTv1rE
 uwEbM9LX3WfZBPP181f1fmnSoNfeee3hm5KphaHxhAvpbO7R/ikC4eX0uvgrtR1U2UFy
 w5DEXmtg/OtMB3EVsFCDvy6WfFehNR7y33puJRu98RADDQ1kdLjkCOSkzyA3ll8rA1Kn
 +yrYZlxcUC38b+BBBhz9T+IQfPcimlKFAF1P2l7rT6Ih43dzKgynTbDrtMFwoO39gSfO
 SHjw==
X-Gm-Message-State: AOAM5312ZjE3e8e/jRjY7a/4uOK47FtUzr5wLQk6lIiO4Fupc3gb6GwK
 eO28tczRCzpd6HdKq239dUxOMgkHaxIQiQ==
X-Google-Smtp-Source: ABdhPJz1SuQ6a0II440/dJXpsAaqMGogvCIUyncMc9ipsuqTDarvuonv4EQMFSa4m9smsULv/dSq4Q==
X-Received: by 2002:a17:90b:4a50:: with SMTP id
 lb16mr1273653pjb.147.1637661232166; 
 Tue, 23 Nov 2021 01:53:52 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 32/53] KVM: PPC: Book3S HV P9: Implement TM fastpath for
 guest entry/exit
Date: Tue, 23 Nov 2021 19:52:10 +1000
Message-Id: <20211123095231.1036501-33-npiggin@gmail.com>
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

