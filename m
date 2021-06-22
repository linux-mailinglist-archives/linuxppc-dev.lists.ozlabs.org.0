Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E23B022B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NjQ5jPTz3c3p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:00:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KsljJKuI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KsljJKuI; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NfX0kYYz30BG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:11 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id bb20so7682055pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HwJMJ+M3lZ7LKAr188SC+V94ehruDB42lsvXKWHhLw=;
 b=KsljJKuITKwAGTy1HlWe/atuGOyB50IBg64I0rlMWeigk6Xnc/NVVRjOPFBx41en55
 Nzh61AuzPRoCTeuDJZ/e7LTTptdxRs4ZI5dYCa097wMZrCNkMkeCx/G0uQ8JPs+MN13v
 624v/ov82HWdkQDgxFCZkLBSLRLiNUl7qTVq7qrnnNqOfvePB1FILbspa9gkVdwCft1w
 hXbMfQs1IMyxHSndeld71X33uxCCtVOPG28HltdP5YMOSnIW/vXpX35FnFMZVMPCc4FK
 9MB+s8xeo/81cSmHDuN/+mXqgkMXwhKCJ9RytvtQgaOzsdrOb2oRI/Dzubw1WHY22ttw
 lgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2HwJMJ+M3lZ7LKAr188SC+V94ehruDB42lsvXKWHhLw=;
 b=WWueDRtm7d2VMn+STA9nb/D7TpaKpKuOzI8c+1CFmkVKlLhy1LLajgWM95dFUyHOZ2
 pAOQsAQUvUoRxYTfLEmpMtAfCwKbXG8ZpHw9pjDOOQBmfqcs0P8kB5uPjkYjMldJoyhc
 DzjuO40hh5/oficYNL6s8bTyq63+Tx7LZCdcQloJ6F9+iSOeDqOM076yV88AstxpdaQ7
 ORFjZQhp7VwVtUU/tb9MsVPvWN7PxjkVghd2AGWYfZlJk4GzxNPWjJBTsF3xNK/t0J8w
 tMp40uysKs5pe+SLWEG455emy9Gmrug4B99ihpTq7uxYsaqThWUacgw2HR0H9E3nfqJV
 kl2Q==
X-Gm-Message-State: AOAM530H3B7kKMsXIFd3yQk5HSFyueLsp3AgEPEMTQWau96j+Gg3Wr7v
 VawWt59sXw75CMaDYMH4Bp0=
X-Google-Smtp-Source: ABdhPJzoOumOB90vpW0/ovtLjN1XL8sGNQJor6rhhW7lWsrYLLlfzJfGhdRpOrZj6l7a0HLKDiLzAA==
X-Received: by 2002:a17:90b:11ca:: with SMTP id
 gv10mr3408322pjb.94.1624359489126; 
 Tue, 22 Jun 2021 03:58:09 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 05/43] KVM: PPC: Book3S HV P9: Reduce mftb per guest
 entry/exit
Date: Tue, 22 Jun 2021 20:56:58 +1000
Message-Id: <20210622105736.633352-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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
index a413377aafb5..5ec534620e07 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3794,7 +3794,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	 *
 	 * XXX: Another day's problem.
 	 */
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -3914,7 +3914,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->in_guest = 0;
 
 	next_timer = timer_get_next_tb();
-	set_dec(next_timer - mftb());
+	set_dec(next_timer - tb);
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 63afd277c5f3..c4f3e066fcb4 100644
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

