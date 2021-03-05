Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E4B32EE30
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:17:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWZ35FnYz3dTY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:17:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DbZHtPCI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DbZHtPCI; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWMW1QNgz3dbm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:08:23 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id j6so1551666plx.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yC+1gMIfp5/fBh4frRkx5vMgkuDaaRYQYLGX38RY4MU=;
 b=DbZHtPCISKAGzjeNLDsQKfxNn0mvkF7eoHNpVXeNNJb0P8neL+qIaHgqsHAlpTvcLF
 +riBivG2mRZxW77wGV6g/j4ROIGwcFwykrfZiX1rn4A9KAMdNpqk658LsnPmhOfudMhw
 PCMUayDLQoTwoaqtFt7wpBw4r+/fCCs7iiBGVPYWv/jty7UET8NfmJAvEB5GOAUuHkLu
 2DT2JiguvOYdJpC4CJdQAp5P22H2h1kl3/IYD1YrdG5r1o3PFEeL9/e1z+OYRZ9Qpjsw
 /9TIleF0L8ioC5iScn9nnEqiBbWOdauqGCB0objN7rnEPVWM9L4J4h5CN0U+bQtu8Z6J
 s0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yC+1gMIfp5/fBh4frRkx5vMgkuDaaRYQYLGX38RY4MU=;
 b=d59ODCg9mLUquf+pxbWTGKoM3gEM6yP4/6zArE2SR3Ck9QKlOcYIP/5HmpuDFj5whq
 vKtcmdb7Gtg5cGFia4yBC7zzMBav2iYTE0jaOcYDpGZTj7p3x27mRSbnsReUIe8QNb1q
 J6EXr1PcO4882Gs5MmoIKACvK658Zwy7TVjjynhzU90HaglunjlUnWnjbkgKaAYuR8xZ
 csa2pMUUX3EGNBzrn14Db8/Ek+lWUWl5fwMgy/GTHf+Hp/oasYTZo1li4SyzcfudPrcR
 aVaFFXNhpEezqdiNcb+w1ZuQJygQbht2UVz8n6dgjFmERTEAsLIBLxQ5+0hRL0hVTXvs
 S1WA==
X-Gm-Message-State: AOAM531lsUFhM9ZSKXPj9yqqE+wLzFRotBWm23zZSZA35vHNy5PQfq0K
 FHxHHYgPETqTIEpZcetXZVVQAnLObO0=
X-Google-Smtp-Source: ABdhPJwQJywiunVLiS6fiZLcesmhrTfsXM709wrs+/veTeV8STKg1vqu5MmpZPf3cGYJHk1OTNvLsQ==
X-Received: by 2002:a17:902:7401:b029:e4:5992:e64a with SMTP id
 g1-20020a1709027401b02900e45992e64amr9043113pll.75.1614956900968; 
 Fri, 05 Mar 2021 07:08:20 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:08:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 25/41] KVM: PPC: Book3S HV P9: Reduce irq_work vs guest
 decrementer races
Date: Sat,  6 Mar 2021 01:06:22 +1000
Message-Id: <20210305150638.2675513-26-npiggin@gmail.com>
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

irq_work's use of the DEC SPR is racy with guest<->host switch and guest
entry which flips the DEC interrupt to guest, which could lose a host
work interrupt.

This patch closes one race, and attempts to comment another class of
races.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6f3e3aed99aa..b7a88960ac49 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3704,6 +3704,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
 
+	/*
+	 * When setting DEC, we must always deal with irq_work_raise via NMI vs
+	 * setting DEC. The problem occurs right as we switch into guest mode
+	 * if a NMI hits and sets pending work and sets DEC, then that will
+	 * apply to the guest and not bring us back to the host.
+	 *
+	 * irq_work_raise could check a flag (or possibly LPCR[HDICE] for
+	 * example) and set HDEC to 1? That wouldn't solve the nested hv
+	 * case which needs to abort the hcall or zero the time limit.
+	 *
+	 * XXX: Another day's problem.
+	 */
 	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
@@ -3838,7 +3850,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - tb);
+	set_dec_or_work(local_paca->kvm_hstate.dec_expires - tb);
+
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

