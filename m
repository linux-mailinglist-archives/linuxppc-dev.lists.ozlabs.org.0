Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A960432EE49
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:19:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWcc5DLtz3h4G
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:19:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=C3oJapWj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C3oJapWj; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWMs4knNz3dgx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:08:41 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id l2so1564674pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ng35u+WMA/qGWz587TPAryNNgxNTtoIA/vWcbEoH+FI=;
 b=C3oJapWjkCMlnytC2LatdI8vXXW0ivp39To+cqTM4bZKxRpgk0A7n6WVxreAzo73x8
 TexgkpR0Viy4Dm3ugG5xQkb2G2IdupUgc45c0/aBdd5Nn4bFf5VhMO+lfMsxtfNP2dvf
 e+71fNMkBmQKJ/EYtot7Dh4L24bIZ/cAnoSJ+neqpDfIBmTJleJRxIeEvBpGJnBw9zsg
 4WlOtGlr00zJFCh80fDEIN3qp7Mx74dB8eIokYOc3hS+OkR575KKLRRV4uEksnIBILgn
 vGF/Q3Xwtn9fZErzYl8CwU7M96w3uZPxaB1blsMlbmb9gCeyxUHFmnAuCNx7f6CuzxJK
 sgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ng35u+WMA/qGWz587TPAryNNgxNTtoIA/vWcbEoH+FI=;
 b=a4FTLYq5y+3JcA8aPZVp3mgdlfa2JDyQoD+/8NR5pRKPGK2Fq4gOth0+71fDtBfTmu
 Jl+kh4EB3hMHr2Mdzlo++KLc2msNtYIAn8gYCdHQ0WNt2IKqwqFNOJahzVtbFH1FPa+N
 hMbAqSvXkCSUElC3AXsR5OtcYbkZicEJ5Q9gBwd2uCt8GT8DNrcBoWW1hgPYVbhq6Svm
 YcKpQfN3RIAcS9UejLhPksqEi7iu5n5viTHm0GTS85gvHcMWRPmNQNq7+rdb8AegTEgP
 27FhO/YDQh6ZJa4r7RWSRLxIWxMWYTekQUfFMvyLOXETpEAMSn9POdz2/x+5Y9ZoQx84
 Qkbg==
X-Gm-Message-State: AOAM53040+QA+HGvm4tuEg+jQMdUKMNhjgeW/buDGpqGp+E8Foibz5I5
 ZDr4qo7nodHOxQOKqk119rWPevMoea4=
X-Google-Smtp-Source: ABdhPJwh+4+cqQLfeLEqswCg8NCwhljf48NkGzhpsY/+eHliO7mDc3DYeNuh9gCEBdr6fopMoZzzEg==
X-Received: by 2002:a63:1725:: with SMTP id x37mr9131048pgl.48.1614956919330; 
 Fri, 05 Mar 2021 07:08:39 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:08:38 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 30/41] KVM: PPC: Book3S HV P9: Move SPR loading after
 expiry time check
Date: Sat,  6 Mar 2021 01:06:27 +1000
Message-Id: <20210305150638.2675513-31-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is wasted work if the time limit is exceeded.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_interrupt.c | 36 ++++++++++++++++----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index 68514ab5a438..d81aef6c69d9 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -127,21 +127,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	u64 tb, purr, spurr;
 	u64 *exsave;
 	bool ri_set;
-	unsigned long msr = mfmsr();
 	int trap;
-	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
-	unsigned long host_ciabr = mfspr(SPRN_CIABR);
-	unsigned long host_dawr0 = mfspr(SPRN_DAWR0);
-	unsigned long host_dawrx0 = mfspr(SPRN_DAWRX0);
-	unsigned long host_psscr = mfspr(SPRN_PSSCR);
-	unsigned long host_pidr = mfspr(SPRN_PID);
-	unsigned long host_dawr1 = 0;
-	unsigned long host_dawrx1 = 0;
-
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		host_dawr1 = mfspr(SPRN_DAWR1);
-		host_dawrx1 = mfspr(SPRN_DAWRX1);
-	}
+	unsigned long msr;
+	unsigned long host_hfscr;
+	unsigned long host_ciabr;
+	unsigned long host_dawr0;
+	unsigned long host_dawrx0;
+	unsigned long host_psscr;
+	unsigned long host_pidr;
+	unsigned long host_dawr1;
+	unsigned long host_dawrx1;
 
 	tb = mftb();
 	hdec = time_limit - tb;
@@ -159,6 +154,19 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		vc->tb_offset_applied = vc->tb_offset;
 	}
 
+	msr = mfmsr();
+
+	host_hfscr = mfspr(SPRN_HFSCR);
+	host_ciabr = mfspr(SPRN_CIABR);
+	host_dawr0 = mfspr(SPRN_DAWR0);
+	host_dawrx0 = mfspr(SPRN_DAWRX0);
+	host_psscr = mfspr(SPRN_PSSCR);
+	host_pidr = mfspr(SPRN_PID);
+	if (cpu_has_feature(CPU_FTR_DAWR1)) {
+		host_dawr1 = mfspr(SPRN_DAWR1);
+		host_dawrx1 = mfspr(SPRN_DAWRX1);
+	}
+
 	if (vc->pcr)
 		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
 	mtspr(SPRN_DPDES, vc->dpdes);
-- 
2.23.0

