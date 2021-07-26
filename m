Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BC33D51EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:55:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5fx2lV3z3drb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:55:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XzrO6kzk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XzrO6kzk; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Z701T1z30HF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:10 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id c16so4438781plh.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EgZ4lpFfP2pWHmRv1UKIWaTNAZ0Rl+EpOrIWSU3SiM0=;
 b=XzrO6kzkK2HwLUUSSSBJzaIK9uqXtBDKZRhxDjYmwEa2A+BO7maUk5GqoxrL6ZAg5L
 QFjX4zYm2+S7/i/xcWeGC3RVwtBkXMxYiwetxongZEqhUMgt/q0LI9AynUyeU34Qc1GM
 pcOqWtXh+s5tJdBwLfRrRzDjGdVbWGGPw6IndAZS27ZC/rMcaokeGA2JCRg1S3lTh9TA
 jcFmA4//GKObolRxpmJ5JSiR7v/aFhr1D64UMRabmOw3+SqIIXVb/6XbRHZiGXVu/zxZ
 YUMHCMb+1EyfCaPWU/wlcdgkyAMvlFum+3dyQHqfLm3xu0ddY0+vIZeLg4rjtKgo+DM1
 7sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EgZ4lpFfP2pWHmRv1UKIWaTNAZ0Rl+EpOrIWSU3SiM0=;
 b=Bae5Ezd3pHQFF2IMsCcPShO/bWoO7siZ5OCzB/FRfzmN7baqwNrq4mTto2syVhMimQ
 Ine+FtLQGf2kvdTaYMC2+bl4mQC7s19/8PziwXO0ONrlTDzVPueT0pnCM2BO16EJoP0Q
 BWbtI9ppHHYhklVxxR9cF87X26Rdngg/3vEyZMkI+jaAmyTyJUFc9gH2jcBQ/3t48lNs
 hfSBq934zJgNL4Z6j8Pz8WZjQ9RYG7/c18EnS1zea2P3696GZ6JUneJD01WxyeMDQiRH
 /Z3hGFSWkTDrrTQ7IfnT9I8q/wbl2bbeXLY5PyjFzfQQGuNyHQ+SZG0SGffuqCgtOvsu
 Em9Q==
X-Gm-Message-State: AOAM530mkk4zW4i4HA6cRsqMWBYp1VrpkpskzBxaDREtNY7OhJXAq3/g
 Y9kdQe3oV+ACP/U6i/Do7szQi18x5PE=
X-Google-Smtp-Source: ABdhPJxJe/TQNIbWluVSSKqWVVzlk1rNVgOoBs3cG3lcm2X/e4R7v/2XpBTZqoQ5lREEQFjwzZzohA==
X-Received: by 2002:a62:cfc4:0:b029:2fe:eaf8:8012 with SMTP id
 b187-20020a62cfc40000b02902feeaf88012mr15652003pfg.45.1627271469004; 
 Sun, 25 Jul 2021 20:51:09 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 10/55] KVM: PPC: Book3S HV P9: Reduce mftb per guest
 entry/exit
Date: Mon, 26 Jul 2021 13:49:51 +1000
Message-Id: <20210726035036.739609-11-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mftb is serialising (dispatch next-to-complete) so it is heavy weight
for a mfspr. Avoid reading it multiple times in the entry or exit paths.
A small number of cycles delay to timers is tolerable.

-118 cycles (9137) POWER9 virt-mode NULL hcall

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 4 ++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 82976f734bd1..6e6cfb10e9bb 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3896,7 +3896,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	 *
 	 * XXX: Another day's problem.
 	 */
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -4019,7 +4019,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->in_guest = 0;
 
 	next_timer = timer_get_next_tb();
-	set_dec(next_timer - mftb());
+	set_dec(next_timer - tb);
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 0ff9ddb5e7ca..bd8cf0a65ce8 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -203,7 +203,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	unsigned long host_dawr1;
 	unsigned long host_dawrx1;
 
-	hdec = time_limit - mftb();
+	tb = mftb();
+	hdec = time_limit - tb;
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
@@ -215,7 +216,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	vcpu->arch.ceded = 0;
 
 	if (vc->tb_offset) {
-		u64 new_tb = mftb() + vc->tb_offset;
+		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
 		tb = mftb();
 		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-- 
2.23.0

