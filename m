Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289232EE2C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:16:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWY805q7z3gYZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:16:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Glj0zZnl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Glj0zZnl; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWML53bKz3dZX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:08:14 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d8so1537239plg.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R8hvFML+h7aGhio9m3pUmg59NCmoXjdz02/DBxwqSEo=;
 b=Glj0zZnlRMTA+9nBh8B+nwlD13WWMKlabugF3KEPmCfAHbCS7rgrYEzfcJHoL1kxSi
 gx4HOykdAKAoa0XGbjy6qtptf6Sx6dPeJuq8JkAztT1uzMjaBgOhfD7IjqopHrli6a15
 UeBYhpHPBQm2sDmmQ8PKEffUvz4hICJVlYDHhHjMUr6pXIvgvQV9qlGD81xnOTzhR8Yw
 ecRjgAjvhNH8hVZkels4sKd/urWqbeTKZw/LeqY/NQQgW19+q8vWuu9cACbQIJOEfun/
 ABTRhQ3CWkDHfor/tSray8qQXxLchfjIXf9SXjh74DPLt6jhh4K3I19TSxb5GygKxiif
 cgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R8hvFML+h7aGhio9m3pUmg59NCmoXjdz02/DBxwqSEo=;
 b=XmvNhQXbrAUsAlwP0Ba768bm947wxRk3VF4HORLFrsTiZTv3SyYmodEBH/XQoBLDH6
 D14ofl/QikyvW6XhE1o00tV1POELtlfAuyqiq9GSeJHxiRq4L4PxS64N+S0bxylRgGr/
 OQASS0+7GTv8xpmFbbkpBs0tw6nNHKlQ4rsy0S0eWGTsz6uOLe3QpmtAF6G/k84DifkU
 dEHxqgbprFsuBGnoPtuBIT7aHIhtyRkOIY9Qh6LIjBNifY33XVc9Mdq4WxWOKUatJju3
 7VRPf/oNwOC0+AUztsWLpmwnYcn4YXCZzlU/uiERYdVqmOwOy8Deg0L6+iD27qxY019A
 k80Q==
X-Gm-Message-State: AOAM533hfoDE8vafNWbsv5ctavknSDoHxS704coUETw6v6q9LIRJMF3x
 pYLN3F4AXZ7TeGi9kTGev24=
X-Google-Smtp-Source: ABdhPJw7zClrxL2VsKtaYHhuvk9eJVRZg1IHxIPD2VrX6x37H9oIf9hRJ5HKUAAqq43G9jLaRv5pjg==
X-Received: by 2002:a17:902:eb11:b029:e4:a5c3:4328 with SMTP id
 l17-20020a170902eb11b02900e4a5c34328mr9278958plb.7.1614956892565; 
 Fri, 05 Mar 2021 07:08:12 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:08:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 23/41] KVM: PPC: Book3S HV P9: Reduce mftb per guest
 entry/exit
Date: Sat,  6 Mar 2021 01:06:20 +1000
Message-Id: <20210305150638.2675513-24-npiggin@gmail.com>
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

mftb is serialising (dispatch next-to-complete) so it is heavy weight
for a mfspr. Avoid reading it multiple times in the entry or exit paths.
A small number of cycles delay to timers is tolerable.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c1965a9d8d00..6f3e3aed99aa 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3505,12 +3505,13 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
-	hdec = time_limit - mftb();
+	tb = mftb();
+	hdec = time_limit - tb;
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
 	if (vc->tb_offset) {
-		u64 new_tb = mftb() + vc->tb_offset;
+		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
 		tb = mftb();
 		if ((tb & 0xffffff) < (new_tb & 0xffffff))
@@ -3703,7 +3704,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
 
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -3837,7 +3838,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - tb);
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

