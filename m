Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AFE393F93
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:11:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzSW2S2Vz3cbT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:11:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bC/QtKAx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bC/QtKAx; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPD6y66z30Dr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:16 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id m124so2023630pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/JcnlCtAMxSYUY04r4LfF3kj2cQw1ve9RclgS2qwxc=;
 b=bC/QtKAxSV1H++gR8WxPHc11T7Wqpw7qPzYLPGvxFgBORBWwmcyyL1UZEg8ys0BX1z
 nLYZiYSCnFXa3lC3A5RWPuQzjMb1BBPow8Mc4Z9TQJMGTDbyCY44JrPIqgzGZBSJoQfE
 tI8NgunWULBhvzE8tTMs0zJse5iSTFbYd9v2++IKsUcm8sctioGeo/1xMbReqPKv0pUT
 5Q2KA2webld35hhSOpmrt6OcrLGkjzCfdYUx8zdKH+vg4Yf6Z7hK3HSMMGnvMJ9SxPAe
 U2ys3JSpL3DRkqIHoh+3wepgtUHtp3lp8cvCbEP95QpEPPM4DeRGaCEi43DO2z4czO2T
 qNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U/JcnlCtAMxSYUY04r4LfF3kj2cQw1ve9RclgS2qwxc=;
 b=r9y0K4CA/iG94aX489o7cUXLtSMH7XtKG1aSk8XyqYgZ1qAbrenBSVt2wSzj5mjMkd
 asNSbEjZKNdo37+O2rS2ekJUDzL6ZMLhH+So+1fSqcBH0jO3xxBwBo9ZtSizlEr6fdPU
 w7LH9CUkJMw3LYDfzV1m3GDDx4ehG6hFAbSsCFTFFRUOxi8F0NHU78G564CLjXu8T0yd
 MI/Ryzhw4+M+wPGh2+f61lFToP7IbbiWexvakczjvhmz+0C5UrUOxdg18w1QWWtlwR+V
 WyCl5uvBoPAmDimOKFCMxM60sutLqsShzbkIFgbPeYE+YL82Mjg5xVORF+LvhW9q7myc
 11zw==
X-Gm-Message-State: AOAM531DQ23/72IhUapbsWffcHAaNntIDeVHVd7Z5gJDHIokENeCTeZ/
 49lvSx4SrihqOU9pCHSALz0=
X-Google-Smtp-Source: ABdhPJwGkQSjdR7Ai4qg8hx4cdgmelH/SGRl/HxjzJgSqm9z1ywy52KQ7OdEKiS2jUkUSG8ze1tKPg==
X-Received: by 2002:a63:6387:: with SMTP id x129mr7921898pgb.58.1622192895003; 
 Fri, 28 May 2021 02:08:15 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 06/32] KVM: PPC: Book3S 64: move bad_host_intr check to HV
 handler
Date: Fri, 28 May 2021 19:07:26 +1000
Message-Id: <20210528090752.3542186-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The bad_host_intr check will never be true with PR KVM, move
it to HV code.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_64_entry.S      | 4 ----
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 +++-
 arch/powerpc/kvm/book3s_segment.S       | 3 +++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 2c9d106145e8..66170ea85bc2 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -107,16 +107,12 @@ do_kvm_interrupt:
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
 #else
-	ld	r9,HSTATE_SCRATCH2(r13)
 	b	kvmppc_interrupt_pr
 #endif
 
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index a28b41b1bb38..a8abe79bcb99 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1268,6 +1268,7 @@ hdec_soon:
 kvmppc_interrupt_hv:
 	/*
 	 * Register contents:
+	 * R9		= HSTATE_IN_GUEST
 	 * R12		= (guest CR << 32) | interrupt vector
 	 * R13		= PACA
 	 * guest R12 saved in shadow VCPU SCRATCH0
@@ -1275,6 +1276,8 @@ kvmppc_interrupt_hv:
 	 * guest R9 saved in HSTATE_SCRATCH2
 	 */
 	/* We're now back in the host but in guest MMU context */
+	cmpwi	r9,KVM_GUEST_MODE_HOST_HV
+	beq	kvmppc_bad_host_intr
 	li	r9, KVM_GUEST_MODE_HOST_HV
 	stb	r9, HSTATE_IN_GUEST(r13)
 
@@ -3279,7 +3282,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_P9_TM_HV_ASSIST)
  * cfar is saved in HSTATE_CFAR(r13)
  * ppr is saved in HSTATE_PPR(r13)
  */
-.global kvmppc_bad_host_intr
 kvmppc_bad_host_intr:
 	/*
 	 * Switch to the emergency stack, but start half-way down in
diff --git a/arch/powerpc/kvm/book3s_segment.S b/arch/powerpc/kvm/book3s_segment.S
index 1f492aa4c8d6..202046a83fc1 100644
--- a/arch/powerpc/kvm/book3s_segment.S
+++ b/arch/powerpc/kvm/book3s_segment.S
@@ -164,12 +164,15 @@ kvmppc_interrupt_pr:
 	/* 64-bit entry. Register usage at this point:
 	 *
 	 * SPRG_SCRATCH0   = guest R13
+	 * R9              = HSTATE_IN_GUEST
 	 * R12             = (guest CR << 32) | exit handler id
 	 * R13             = PACA
 	 * HSTATE.SCRATCH0 = guest R12
+	 * HSTATE.SCRATCH2 = guest R9
 	 */
 #ifdef CONFIG_PPC64
 	/* Match 32-bit entry */
+	ld	r9,HSTATE_SCRATCH2(r13)
 	rotldi	r12, r12, 32		  /* Flip R12 halves for stw */
 	stw	r12, HSTATE_SCRATCH1(r13) /* CR is now in the low half */
 	srdi	r12, r12, 32		  /* shift trap into low half */
-- 
2.23.0

