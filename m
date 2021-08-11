Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA13E95EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:29:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFfB6dVmz3gl0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:29:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dgY37+ZO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dgY37+ZO; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF3r5ghgz3dGN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:36 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id u15so1143918ple.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/uO7fK/ax0SJRwBtePDjtrqOVVG3TZBN5bKm0iorBes=;
 b=dgY37+ZO0KFV8f/X0uji62/5wt7HJc0rsRWa9GgQ4A1k6v1He4ROiguj+2EC5/pcRm
 NqDQFsrWnGgumfzWgjItDr4B/gj4/vCqi+jDeETvhMgxS5XjllMPZG/labRd0IeQw3x6
 aSg59ivgJXB4qwnnTCwOCt2uf2UpFxdvX8LARQedZRLDR34sb+t2yNahAzoil9J7xxww
 xO5YuiN1ojVvoNu15wrXjGSTIfnJ9ua8JAO4nZWP0OHpsWzoeYHFKHGYwDIXtr++n5Em
 aYE9fizIuoj2NknLva3F1pfdxUkT2Znwh2YrYNfYA0oWH9beGUaED71VSJ6yzsrKqCRa
 NvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/uO7fK/ax0SJRwBtePDjtrqOVVG3TZBN5bKm0iorBes=;
 b=JlSwW7pZFKAB28VM363rLrOSnWEi3PIXeMb/XC7o13B+arJknTloa5k24bWPw684Xp
 +ZO9rmG3f8GwA1vBDrfwjCnZ00PUl7xNbBXvHxEzu9tVCfSGsefSSsaTUghGzhXxQNMS
 db+1fBbO4wFi7dj/T7wRpbdiWYhxA7MwzF4+5oW6l4NRv5QafHUGgVNeVGDB56R6Q0jN
 seKLm5ZsJcGoEB26LW1XHpbv6xT/hTzJKSAI+13jF+eGtvI3s8rWktmEcyxx7POzm1CW
 xZ837tYNMYN8GrJ2Z61LQxB9iXf/UKEan5OXzxUKU0q9AcJ3e4KrhCfHrGiI1fjILkpY
 jJ1A==
X-Gm-Message-State: AOAM530TCklSDoJ43XO43ftHPoFh68ZSPAFoyR3m0frdqVjKj91tFN8W
 ZCa0LLUQ85Q29nshK0x7nSl1fYu8hWE=
X-Google-Smtp-Source: ABdhPJxtzgvDTQuCTcRgYnIN7pZsE7yXgv2IhyBUHJf8+vFhQW6dTqB0sHxvEz8D59vd932NRLgUqw==
X-Received: by 2002:a17:90a:4481:: with SMTP id
 t1mr38074543pjg.232.1628697814599; 
 Wed, 11 Aug 2021 09:03:34 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 42/60] KVM: PPC: Book3S HV P9: Restrict DSISR canary
 workaround to processors that require it
Date: Thu, 12 Aug 2021 02:01:16 +1000
Message-Id: <20210811160134.904987-43-npiggin@gmail.com>
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

Use CPU_FTR_P9_RADIX_PREFETCH_BUG to apply the workaround, to test for
DD2.1 and below processors. This saves a mtSPR in guest entry.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 3 ++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c76deb3de3e9..8ca081a32d91 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1593,7 +1593,8 @@ XXX benchmark guest exits
 		unsigned long vsid;
 		long err;
 
-		if (vcpu->arch.fault_dsisr == HDSISR_CANARY) {
+		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG) &&
+		    unlikely(vcpu->arch.fault_dsisr == HDSISR_CANARY)) {
 			r = RESUME_GUEST; /* Just retry if it's the canary */
 			break;
 		}
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 48cc94f3d642..3ec0d825b7d4 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -679,9 +679,11 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 * HDSI which should correctly update the HDSISR the second time HDSI
 	 * entry.
 	 *
-	 * Just do this on all p9 processors for now.
+	 * The "radix prefetch bug" test can be used to test for this bug, as
+	 * it also exists fo DD2.1 and below.
 	 */
-	mtspr(SPRN_HDSISR, HDSISR_CANARY);
+	if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		mtspr(SPRN_HDSISR, HDSISR_CANARY);
 
 	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
 	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
-- 
2.23.0

