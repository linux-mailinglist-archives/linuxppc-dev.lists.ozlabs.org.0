Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E931F533
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 07:40:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dhhm15cDmz3dWm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 17:40:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bHwu0aEi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bHwu0aEi; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhhg92YXXz3cLR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 17:36:21 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id lw17so3909789pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 22:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51fSnKE1F6582ktYAIsvzBpB1la/Rt8bTnqFIVhnkeU=;
 b=bHwu0aEiy3tvN/kzzUrvc//U0r+Xm9CvaZQP1I+TvjapG9j5IdgWh5AKxZHg2gzCBo
 zG8DeszMsdas1OTRuYExGKzXHWRsiIy2PrL0c2DhWS6kTnfwLk3tAb7Q6M4ic41pIWt8
 hFjGcQRxrbJzkBMUYjV7KBS/iooYlAHvyLcT4c2zR4j6fBYKP4w/exqy/TNXHj/jNfYY
 8xZLhVLGujmiiJfW0jNvPOZSYIVV1hq7bLb1WOtoYfNA01yv6hLe+GG5geCLf1WizIaN
 T+TnaBbJ8jdGIKz+kUDjfttLXNgUytuG8oNkHadmAg70s9aX3DzHQfl7UjNWqrMk8McN
 zPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51fSnKE1F6582ktYAIsvzBpB1la/Rt8bTnqFIVhnkeU=;
 b=q4SeAwzE+VBqZ8LGUFFgt2Jtd38cG3L09FBRKzOv0UeQPCER7kxHdC/6RJNIpZtmKm
 rzCRLETPdAjIhLtlQ1yWiqqnbUboD4PRDe2M9B31a7WuooYOxZCDnHD/p5saO1SPAeDL
 /PuTUE+xW+hitfcr7unopUdGyrteaK2cl21alF8fs01YeWxcR18wc5XFGXlCvCR2M6pj
 GM/Km6S36geh1B3/MLdXEz5CzBKyFypKa7DkKxup6V0ChKtRrc3rLHmDkauhQq5e9YtP
 C1812fMZYFiWI1d36WbT1c2UNjdCkUrVId8CKT0p1rKqGca2+iifFc3oGRljXfvDQnr3
 vt0w==
X-Gm-Message-State: AOAM532MQjqGL91aSDhLPyVCO0ikscsohSJj3JdmUy0xD9zwnJEn2jhI
 d66rS7G8C6hSzLur5jWEuR8=
X-Google-Smtp-Source: ABdhPJy4bK8JS7XHnotZbYxFaM4Q4XkpTTIkvkK1riWDg4Iyh2+xqTuwOdTF8Df9tWAC2An/IAAQUA==
X-Received: by 2002:a17:902:860a:b029:e3:5d18:29af with SMTP id
 f10-20020a170902860ab02900e35d1829afmr7961113plo.64.1613716578962; 
 Thu, 18 Feb 2021 22:36:18 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id v16sm7813099pfu.76.2021.02.18.22.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 22:36:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 10/13] KVM: PPC: Book3S HV: move bad_host_intr check to HV
 handler
Date: Fri, 19 Feb 2021 16:35:39 +1000
Message-Id: <20210219063542.1425130-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210219063542.1425130-1-npiggin@gmail.com>
References: <20210219063542.1425130-1-npiggin@gmail.com>
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

This is not used by PR KVM.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_64_entry.S      | 3 ---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 +++-
 arch/powerpc/kvm/book3s_segment.S       | 7 +++++++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index ef946e202773..6b2fda5dee38 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -77,11 +77,8 @@ do_kvm_interrupt:
 	beq-	.Lmaybe_skip
 .Lno_skip:
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	cmpwi	r9,KVM_GUEST_MODE_HOST_HV
-	beq	kvmppc_bad_host_intr
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	cmpwi	r9,KVM_GUEST_MODE_GUEST
-	ld	r9,HSTATE_SCRATCH2(r13)
 	beq	kvmppc_interrupt_pr
 #endif
 	b	kvmppc_interrupt_hv
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index bbf786a0c0d6..eff4437e381c 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1251,6 +1251,7 @@ hdec_soon:
 kvmppc_interrupt_hv:
 	/*
 	 * Register contents:
+	 * R9		= HSTATE_IN_GUEST
 	 * R12		= (guest CR << 32) | interrupt vector
 	 * R13		= PACA
 	 * guest R12 saved in shadow VCPU SCRATCH0
@@ -1258,6 +1259,8 @@ kvmppc_interrupt_hv:
 	 * guest R9 saved in HSTATE_SCRATCH2
 	 */
 	/* We're now back in the host but in guest MMU context */
+	cmpwi	r9,KVM_GUEST_MODE_HOST_HV
+	beq	kvmppc_bad_host_intr
 	li	r9, KVM_GUEST_MODE_HOST_HV
 	stb	r9, HSTATE_IN_GUEST(r13)
 
@@ -3254,7 +3257,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_P9_TM_HV_ASSIST)
  * cfar is saved in HSTATE_CFAR(r13)
  * ppr is saved in HSTATE_PPR(r13)
  */
-.global kvmppc_bad_host_intr
 kvmppc_bad_host_intr:
 	/*
 	 * Switch to the emergency stack, but start half-way down in
diff --git a/arch/powerpc/kvm/book3s_segment.S b/arch/powerpc/kvm/book3s_segment.S
index 1f492aa4c8d6..ef1d88b869bf 100644
--- a/arch/powerpc/kvm/book3s_segment.S
+++ b/arch/powerpc/kvm/book3s_segment.S
@@ -167,8 +167,15 @@ kvmppc_interrupt_pr:
 	 * R12             = (guest CR << 32) | exit handler id
 	 * R13             = PACA
 	 * HSTATE.SCRATCH0 = guest R12
+	 *
+	 * If HV is possible, additionally:
+	 * R9              = HSTATE_IN_GUEST
+	 * HSTATE.SCRATCH2 = guest R9
 	 */
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	ld	r9,HSTATE_SCRATCH2(r13)
+#endif
 	/* Match 32-bit entry */
 	rotldi	r12, r12, 32		  /* Flip R12 halves for stw */
 	stw	r12, HSTATE_SCRATCH1(r13) /* CR is now in the low half */
-- 
2.23.0

