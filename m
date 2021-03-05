Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B80632EDC4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:07:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWLl2gfLz3dPw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:07:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bBHZ5bde;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bBHZ5bde; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWKm20m7z3cjl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:06:52 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so2250789pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6LjsSzloyP6z/8C+JC71MAftuB7rIwr5/ezBY3FEAA=;
 b=bBHZ5bdetqHKoLGHXwk5nGk4F7R+OhyhV51ewZ7VQBoiTgnCsgufNA1cog9CHcN7y0
 hAl8xLa2HhwKS4WWbbLzyNLxEfwslhiOFyl8jmpEUCw4uZ1JtIarkpKmqiiffjl6Q4V8
 hJAlVuLfOXLzch9toNlWB11D77YjOwLIPLgdacpqXXCvzASTEoheXvLJPCLEN9S7V44A
 E3vQDplF/zXZJuJKeDbllzCtAijcV1kQEtW2YINNWMxIfGNVCVZkTuSgjtchR+E2ERSm
 wJW12hDNa5qyW3sorvLpsoZVAy58yypVq406R5U3b9oH2oX+C79DcDI4n2cBSXeTIcnM
 YZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6LjsSzloyP6z/8C+JC71MAftuB7rIwr5/ezBY3FEAA=;
 b=qLPBuDvXafWlUp3KtpqvaZQ9/dvgyd4HZilSlcbxLIm+bOWz2PTPzdpOAyI4XOVstx
 CKOuCWDnWiilUyTYgOLIi1p6+xofWMzGHmOp6K47EwLR5fASCS/Q9JoIvzmixE6Y6KYA
 /e5Wj/tWSIlKMhkLBgpi7MAmenzbKviEjsdwHsVb4g4o895zwYYYGUOqJs1/zEST1X2M
 hKKwXd5GJApyBzZYM8Cew4/2VaJTzL264a7ZcymMu4GzRO6f2PsZIoDjAmT/nCWeYJmx
 1Y4FOxPp1eIFo2cU1QJIFwrnnw3tNIx7WiklXRNUUu99dlu6Ap422ka4pbcifHiN8Rdh
 aC0w==
X-Gm-Message-State: AOAM532GL+6dzXoJLGt/t1Bb1lJsrauD1h1hoyn+2NGBI7U9MsnQHPk4
 hiL41K++5nDDMVbiZlQrBL4=
X-Google-Smtp-Source: ABdhPJwN+h/R4bLaPqc/UWsl1EiPxqyJekNsCGj5Fk7zO+S2lov69pBNg4vIRMOIvbDKb6drJisY8g==
X-Received: by 2002:a17:902:7404:b029:e4:503b:f83d with SMTP id
 g4-20020a1709027404b02900e4503bf83dmr8938425pll.35.1614956809753; 
 Fri, 05 Mar 2021 07:06:49 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:06:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 01/41] KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to
 1 or 2
Date: Sat,  6 Mar 2021 01:05:58 +1000
Message-Id: <20210305150638.2675513-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are already disallowed by H_SET_MODE from the guest, also disallow
these by updating LPCR directly.

AIL modes can affect the host interrupt behaviour while the guest LPCR
value is set, so filter it here too.

Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c        | 11 +++++++++--
 arch/powerpc/kvm/book3s_hv_nested.c |  7 +++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 13bad6bf4c95..c40eeb20be39 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -803,7 +803,10 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 		vcpu->arch.dawrx1 = value2;
 		return H_SUCCESS;
 	case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
-		/* KVM does not support mflags=2 (AIL=2) */
+		/*
+		 * KVM does not support mflags=2 (AIL=2) and AIL=1 is reserved.
+		 * Keep this in synch with kvmppc_set_lpcr.
+		 */
 		if (mflags != 0 && mflags != 3)
 			return H_UNSUPPORTED_FLAG_START;
 		return H_TOO_HARD;
@@ -1667,8 +1670,12 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
 	 * On POWER8 and POWER9 userspace can also modify AIL (alt. interrupt loc.).
 	 */
 	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC;
-	if (cpu_has_feature(CPU_FTR_ARCH_207S))
+	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
 		mask |= LPCR_AIL;
+		/* LPCR[AIL]=1/2 is disallowed */
+		if ((new_lpcr & LPCR_AIL) && (new_lpcr & LPCR_AIL) != LPCR_AIL_3)
+			new_lpcr &= ~LPCR_AIL;
+	}
 	/*
 	 * On POWER9, allow userspace to enable large decrementer for the
 	 * guest, whether or not the host has it enabled.
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 2fe1fea4c934..b496079e02f7 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -139,9 +139,12 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 
 	/*
 	 * Don't let L1 change LPCR bits for the L2 except these:
+	 * Keep this in sync with kvmppc_set_lpcr.
 	 */
-	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
-		LPCR_LPES | LPCR_MER;
+	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_LD | LPCR_LPES | LPCR_MER;
+	/* LPCR[AIL]=1/2 is disallowed */
+	if ((hr->lpcr & LPCR_AIL) && (hr->lpcr & LPCR_AIL) != LPCR_AIL_3)
+		hr->lpcr &= ~LPCR_AIL;
 	hr->lpcr = (vc->lpcr & ~mask) | (hr->lpcr & mask);
 
 	/*
-- 
2.23.0

