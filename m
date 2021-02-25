Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A22D33250E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:52:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ334RNJz3dx6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:51:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oN/KqaNu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oN/KqaNu; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYy80Tl8z3cYp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:47:43 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id b15so3543363pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/KksQ3NoTja4HR9q6bStGFmmuukVXyNVWmRp3h0EkF4=;
 b=oN/KqaNurMawdiWHffSoWaWasXoxM0KkFY2RzTaxl0tQoQsqV/XKeu55fOlkpLafvq
 t1Kr+vg5b5tMjNHBUS6hAqlABB+hpOdvinrTNUj1jVZU6qMH/vPag8Pgpz/ketWram/X
 H+89HwZUmYDpJFzxSl4bWIVDj/hNlgvRvnCEvYhAF+NIkcLlRuhLyIvJuhWvUa8YNbq2
 MBsJmkCVtJC+QDaFvKmeGy85V0MPI+xjM2M1tFluyakhZbYw4bz5HyuNN8rI+izRGFEm
 jgBfKLhcvs4h35DPgAQ90PhKNKIj0jBHPVC+r6TjoPfm0kfRTZOWfZ7hKLW/uccnFG4u
 m6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/KksQ3NoTja4HR9q6bStGFmmuukVXyNVWmRp3h0EkF4=;
 b=gG/01JtrwViyu3UuFyg0RsgZvw1WjX4qGkyHg15i/6w0I2L1hSSSY5l3MijVk/sLMb
 dkU5bzFoBytUw7O5cG7JjrFZ94pSjipv45BpqX0O58gm0Bmy12xw2wv8NlYMD8OQA6Fx
 TjddiCZEcsn5UvG19ypRb+CxV+4W3vMhsVEb5ywKC03YfjERecHkkuTP7i2EEM82ciWC
 Tg+tVWgNIFTiLbQo1R44fxgFe+gW4Ljo8Aj+QCgr6kC5AZ0m05sEKpJk+0sk4lgAGvvG
 fYFGAVkasvh/SyU/Z5Hfpdh3G+sp8sQgmq0wH9Kzf6skQt6CQr9oTl4XR0x3KqhShQ/P
 F9ow==
X-Gm-Message-State: AOAM530F3oFAsEoAihCJLDErvl+RKybAdMdrx1Q4O45ZTZcmDcdiDBtR
 l5gIzruJRxkFfqC+fdUpmdg=
X-Google-Smtp-Source: ABdhPJylqeBoTtCQhFBwmeRqFOcRawDo/ooewyuCSswjXpp1ZIYz5XY+O9HoV7jNNDlAzLZFqxoX5g==
X-Received: by 2002:a17:90a:b782:: with SMTP id
 m2mr3378164pjr.220.1614260862150; 
 Thu, 25 Feb 2021 05:47:42 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:47:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 11/37] KVM: PPC: Book3S 64: move bad_host_intr check to HV
 handler
Date: Thu, 25 Feb 2021 23:46:26 +1000
Message-Id: <20210225134652.2127648-12-npiggin@gmail.com>
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

This is not used by PR KVM.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_64_entry.S      | 3 ---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 +++-
 arch/powerpc/kvm/book3s_segment.S       | 7 +++++++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 4603c0709ae3..75accb1321c9 100644
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
index f976efb7e4a9..75405ef53238 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1265,6 +1265,7 @@ hdec_soon:
 kvmppc_interrupt_hv:
 	/*
 	 * Register contents:
+	 * R9		= HSTATE_IN_GUEST
 	 * R12		= (guest CR << 32) | interrupt vector
 	 * R13		= PACA
 	 * guest R12 saved in shadow VCPU SCRATCH0
@@ -1272,6 +1273,8 @@ kvmppc_interrupt_hv:
 	 * guest R9 saved in HSTATE_SCRATCH2
 	 */
 	/* We're now back in the host but in guest MMU context */
+	cmpwi	r9,KVM_GUEST_MODE_HOST_HV
+	beq	kvmppc_bad_host_intr
 	li	r9, KVM_GUEST_MODE_HOST_HV
 	stb	r9, HSTATE_IN_GUEST(r13)
 
@@ -3272,7 +3275,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_P9_TM_HV_ASSIST)
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

