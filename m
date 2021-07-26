Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA703D522E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5wG4NJCz3dCm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:06:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SX6rBbXm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SX6rBbXm; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5bG3p8Qz3cmt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:52:10 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id mt6so11149214pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I/TJyOnmABEE9AkNTcVjeb806PCZeTTaeMWQWBzIZXw=;
 b=SX6rBbXmeohLYDiGBmdYikgQxBkPOKkSixP00Rb1Nm7DLPofm/Hn7FVKh7zTRTvoug
 gJiw4ubHPfOde/XFILOW6YdWCSjHCoeh4IjxHnyqoRan0zxBrNnTB7aZN/mNw0EkLBph
 M3x4gSvR6KGwLwgPnzioW3xibNHcBnzsXAm73pJmANcQBwlbOx/YgACZGm32NkMrYxkk
 L2ghSu4xOzJ1W0h5SYnPIuToFvt4MTf56IJXxbLHDcDKSr5S0n4N+OOtjVEdohQY0FCm
 W5t7YlpWo/QZpadXlWIb0dBsLmB2IPBYNwl4CeXOEeVz2AlNGSHZNQbKbYHQYOTlb6+a
 RNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I/TJyOnmABEE9AkNTcVjeb806PCZeTTaeMWQWBzIZXw=;
 b=V4Z7vEtJdGOLR6D5/MxC0VfhqHDOOif5ZWzA3fexlU8Z6NuJfyN87ZXf/CNXlSYaDY
 4lXW+2xfzEYTDqgY7tYwX0q82kkLqbiqbjk4oJV+hASr4eAgkTdGY4TU4YhU/v8mhhM/
 HxxWb5uBjyyxo9o72+gunGYVuCxll705CyPel2hRkYOjIqJUkuk5IuI2JwsBaz1YpcyO
 jZ84qCd/ueT0nARnQuHurOzMjvHuwNy/0H9vjBh681XIQQsKOwcQgLuuKWGpviCxPj/8
 BYHYWB9TY+FPdz3XoVr/RtWDOHQOdyKiX5DNRdU0jqKyd15TxeX4xtu7GBx8BYUX/sCn
 jA1A==
X-Gm-Message-State: AOAM531Fm3cdP97wCsKBFwukSfKJtxph1puONr+x/GCgSmp1rOGxVCTC
 CmIR3Zqgj3xsryhbannkCkSO7O3iLCA=
X-Google-Smtp-Source: ABdhPJwbjlo5VbE7IwK1qAiTSiFySOjd7sqAjrEDnb5ZUOg4q6E0ClnLPxIIyKgTP3ns+CZ23MwUqA==
X-Received: by 2002:a62:cfc4:0:b029:2fe:eaf8:8012 with SMTP id
 b187-20020a62cfc40000b02902feeaf88012mr15654662pfg.45.1627271528553; 
 Sun, 25 Jul 2021 20:52:08 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:52:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 36/55] KVM: PPC: Book3S HV P9: Implement TM fastpath for
 guest entry/exit
Date: Mon, 26 Jul 2021 13:50:17 +1000
Message-Id: <20210726035036.739609-37-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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

If TM is not active, only TM register state needs to be saved.

-348 cycles (7218) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index ea531f76f116..2e7498817b2e 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -281,8 +281,15 @@ bool load_vcpu_state(struct kvm_vcpu *vcpu,
 
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
@@ -308,8 +315,16 @@ void store_vcpu_state(struct kvm_vcpu *vcpu)
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

