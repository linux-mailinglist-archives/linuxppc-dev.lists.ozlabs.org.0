Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 513BE3E9599
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFDB202nz3dtx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:10:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MKBLyv6w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MKBLyv6w; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2Q4bpdz3cKv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:22 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id a20so3343017plm.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mf3TsS6jnjzVv5z7Oc/l3ztXe15tmjXwWcLWuTb9UUM=;
 b=MKBLyv6wGjirWARVahG68wX6UrgEZSgOvPPYa+e+MMEbAl+ZEUFhYynkZ9VgiCZ6+2
 RT0p9qMBvtrwv0eUPtM81dEYCiHDM6kP44liDTZ54jMvUXsIUOHjH4i85t28AhNWH0gz
 DOjQfDpiljVuuE4WKftOVFxenUjuTdnOjJNEtKhwlkaX0Yq/gjt0Zqac02fb3WfOsySi
 StBUQiDe843a17MNiLDPPTU26xjV5Q38V4CB2ihhy32f2e03Ue0LkHcycjH2yBMNcOtC
 IJliefC+5Y6abbhVY6pVGPXuvYEUh4MNHCc8zPoTonxIipADPsqSXMpeCrcvnfXelCI2
 8EWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mf3TsS6jnjzVv5z7Oc/l3ztXe15tmjXwWcLWuTb9UUM=;
 b=b5omNY/eSQh63y58znYWD8Hd4gZvignPE8qviT0GDcuKROmHF3Px/Zij6TchKps6zr
 SdFtA8aLtC1aRXZWHIgC8U0yEYq7/ZIM5v5cUAqkvKtflYPoaSAzkDw82309VrHw7FX2
 XuWq998EC17Io/cUZaczEoU31f5+XOAvye5DlqswpWSPp7E5UZTPyGivsi3UwcUJpGd/
 qcMKesnXjjDHOmiJiuhFdTVfjhf/7as97L+Jbl9hAhK4XjkqKLZ4t7k1NFZr0Zb2wMZa
 lHggFtQ5zDvVXofRIH7zojie6lNQhF4oO6ACh0BchS4bzKStK33CuwtiwyHR1OOXf9TE
 lefA==
X-Gm-Message-State: AOAM531gZ53We+fYVa1nSlvEQ7mfHp1z6ZTdVrNU4BxS4Sx8A3qPA6rI
 rGcwEmKfL7iyFTDEvHqPWyg=
X-Google-Smtp-Source: ABdhPJypWybYsNqExAn5HNW8Otzxniv9N4Q81dTKLO/4cyNhrdpr+vPvmKt/IyP44fho1NG0XMLA0A==
X-Received: by 2002:a63:f342:: with SMTP id t2mr540567pgj.45.1628697740696;
 Wed, 11 Aug 2021 09:02:20 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 14/60] KVM: PPC: Book3S HV P9: Reduce mftb per guest
 entry/exit
Date: Thu, 12 Aug 2021 02:00:48 +1000
Message-Id: <20210811160134.904987-15-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mftb is serialising (dispatch next-to-complete) so it is heavy weight
for a mfspr. Avoid reading it multiple times in the entry or exit paths.
A small number of cycles delay to timers is tolerable.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 4 ++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 34e95d3c89e5..49a3c1e6a544 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3926,7 +3926,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	 *
 	 * XXX: Another day's problem.
 	 */
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -4049,7 +4049,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

