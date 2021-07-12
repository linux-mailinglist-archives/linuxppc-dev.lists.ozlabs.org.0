Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F633C40F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 03:37:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNRGW0l1Xz30Dv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 11:37:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qq1iON0B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qq1iON0B; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNRG259Yfz2yM5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 11:37:13 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id b12so5394486plh.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 18:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PU3A2mYqtc/KQRmVQug3AjUPmMKxveDHUwibfEmkrVY=;
 b=qq1iON0BGjvHggEf4ORysPqLUIvRxiTtaeGANWE8jsiIkh0/KiuWtgR+kv0nrKBoZl
 BkAzz0PPY0OLfic1VJYCBf3Suhy9lxD1X6MJeNtbmtGQB4KWdCTBK+Uc5ByJbzMM6dnr
 4LUW3Vo+IJvT6+XuRUOHAf4azQP/yVTij8IMZgbLFhckkLSk6b41i27s4HvauY8DlOto
 vjmdTMLWkY8Z/HjWZPtFj4ESb4NYDOTtk4qWf19Te0AOeuBCoFwdObDYz2yqzgCHQf42
 9rnQLngKCqozONnG6APlXwtfcSJ7zIgnhMEOIpg2HehBOJOWEUqGrRbgHmtfYrIOMYwr
 wL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PU3A2mYqtc/KQRmVQug3AjUPmMKxveDHUwibfEmkrVY=;
 b=QZnoLmIzkUbmL3dMPsdz2VtASzA+ynPsgZ4cXnli1/B78gQFREVyiE1Dw3KTgSUMiY
 Fj1izj7ErmNAXnFkU8PKaoP+4gUk7mpL+v9/eXf6dEEY1ALDVBgVtfdghApeOKqu2MWp
 HG0mt+qgi10PiymAoDnYFSxwFmhHVSBMvxwWL8+U/W4cGPOrKBSQeK/jrA2kG/hqAQsL
 3OwQgR0E+XtooOu66GIGumEnnnvCmcTskXy4/l7WQ0hS8HNi3vP5bNabMA6xTDHvvuAJ
 kiJQbmSpKBgxF4AuvrYwzF7tERi20tNoLYQIfiefQ9rpiio+ZurwTr6DqXYwuqUJTIwT
 X+3w==
X-Gm-Message-State: AOAM533Sx6GzzFFW2kWVHnAX1IyNBmxEZPR9tsoF7xxhxmUdQPORthE/
 EK5bT9jyvEYyUYMDxRwszyo=
X-Google-Smtp-Source: ABdhPJwO9cYJed2/yLVMPxh0JnhMITNNIt/vcpAQIqEk1RSpn1/Youc2ICEmva5C3U4wl7dUG1/3Qw==
X-Received: by 2002:a17:90a:a089:: with SMTP id r9mr306103pjp.95.1626053828013; 
 Sun, 11 Jul 2021 18:37:08 -0700 (PDT)
Received: from bobo.ibm.com (203-219-181-43.static.tpgi.com.au.
 [203.219.181.43])
 by smtp.gmail.com with ESMTPSA id n23sm14667650pgv.76.2021.07.11.18.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 18:37:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV P9: Fix guest TM support
Date: Mon, 12 Jul 2021 11:36:50 +1000
Message-Id: <20210712013650.376325-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

The conversion to C introduced several bugs in TM handling that can
cause host crashes with TM bad thing interrupts. Mostly just simple
typos or missed logic in the conversion that got through due to my
not testing TM in the guest sufficiently.

- Early TM emulation for the softpatch interrupt should be done if fake
  suspend mode is _not_ active.

- Early TM emulation wants to return immediately to the guest so as to
  not doom transactions unnecessarily.

- And if exiting from the guest, the host MSR should include the TM[S]
  bit if the guest was T/S, before it is treclaimed.

After this fix, all the TM selftests pass when running on a P9 processor
that implements TM with softpatch interrupt.

Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Fixes: 89d35b2391015 ("KVM: PPC: Book3S HV P9: Implement the rest of the P9 path in C")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 83f592eadcd2..becb0c08ebda 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -317,6 +317,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+tm_return_to_guest:
+#endif
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
@@ -415,11 +418,23 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		 * is in real suspend mode and is trying to transition to
 		 * transactional mode.
 		 */
-		if (local_paca->kvm_hstate.fake_suspend &&
+		if (!local_paca->kvm_hstate.fake_suspend &&
 				(vcpu->arch.shregs.msr & MSR_TS_S)) {
 			if (kvmhv_p9_tm_emulation_early(vcpu)) {
-				/* Prevent it being handled again. */
-				trap = 0;
+				/*
+				 * Go straight back into the guest with the
+				 * new NIP/MSR as set by TM emulation.
+				 */
+				mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
+				mtspr(SPRN_HSRR1, vcpu->arch.shregs.msr);
+
+				/*
+				 * tm_return_to_guest re-loads SRR0/1, DAR,
+				 * DSISR after RI is cleared, in case they had
+				 * been clobbered by a MCE.
+				 */
+				__mtmsrd(0, 1); /* clear RI */
+				goto tm_return_to_guest;
 			}
 		}
 #endif
@@ -499,6 +514,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 * If we are in real mode, only switch MMU on after the MMU is
 	 * switched to host, to avoid the P9_RADIX_PREFETCH_BUG.
 	 */
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+			vcpu->arch.shregs.msr & MSR_TS_MASK)
+		msr |= MSR_TS_S;
 	__mtmsrd(msr, 0);
 
 	end_timing(vcpu);
-- 
2.23.0

