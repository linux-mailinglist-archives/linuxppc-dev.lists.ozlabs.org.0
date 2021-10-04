Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1CB4213E4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:19:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQs40nPYz3dZp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:19:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kmBFcBfv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kmBFcBfv; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQTD021pz3cBc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:07 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id m5so2166103pfk.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NfJOjCJ/v6ZV2LFYZwsNEIjww7KBaxYWLhodjyZWfLI=;
 b=kmBFcBfvDyvkYTfWJeoHR03tCDT3ZOvbzr+qWLrNctK8phXRCA4yZzY8DwHkmVpl6i
 5/XNkLmZFL63Fsi2Rz5F42PGAJtQiKWSWOCxC8I4BLay4Xdt85+FcnrhuR3EjhCcqBJe
 XiJgZzPs5Zbiv+HrSlLHNzZTlxfwwKrSOhK5MvsadscXOrPA/IxRiWS8ZCRMvWDa4YG/
 WeabSMO8r+b29nCzB94Y4h3TE9R+59KMVsWxuWQINYGZeP161FBwW8FAhd8HteK2SzGN
 WmQ8dtpkG3z0kaY4w5k3ZKuaTAMYoIosxCv/XdhuwA4kiLB9EK2tq23h/XPOeoWYHrME
 5AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NfJOjCJ/v6ZV2LFYZwsNEIjww7KBaxYWLhodjyZWfLI=;
 b=r1XO6+Gg0hPZsjfRc6azn8KJRweL+f3xUgzFSX4/jmRIPZ1PoivEDXwxv6lVkHE8BG
 8Apud8nQIJ3gg/EDwKQcMm04d74X44YKAzJC6cZ25pNNJEHoVCvI9yaJ1C0QfNlmqNWg
 pRMBi/KnY/9VlSVwzXcNX8gut/dA1r3XEqZU4sk0Fw7pqgXFB872TdqwYTF92i2DIZiP
 btBEf8Pxldto0rAnb7QC/+JFmDItlj66GETyhPQ7bcAQUuFjTDhgxyvsw7CzuapLQRHF
 SNNoYogLr9vptSdt/rs3tM2kdiBdmUrF2/qJUT+S7PGHusuQMhDdk/cxpWJmnsHr55un
 EdeA==
X-Gm-Message-State: AOAM533TkYVANFJSokT3wYfOrBGLIbNsI6QXy1BIjl2LH6ZaSowLHC1X
 B6eaGyzTJzfcizPZG6aamM4=
X-Google-Smtp-Source: ABdhPJwHfQ82qhsj2MZOiN/a0Ys0BngjnAHpeoAK+RJN54quEMc+t27HX7MeBOnqe7l83lNwt3N9uQ==
X-Received: by 2002:a63:6e02:: with SMTP id j2mr11581304pgc.157.1633363326090; 
 Mon, 04 Oct 2021 09:02:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 27/52] KVM: PPC: Book3S HV P9: Juggle SPR switching around
Date: Tue,  5 Oct 2021 02:00:24 +1000
Message-Id: <20211004160049.1338837-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This juggles SPR switching on the entry and exit sides to be more
symmetric, which makes the next refactoring patch possible with no
functional change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 460290cc79af..e817159cd53f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4209,7 +4209,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		msr = mfmsr(); /* TM restore can update msr */
 	}
 
-	switch_pmu_to_guest(vcpu, &host_os_sprs);
+	load_spr_state(vcpu, &host_os_sprs);
 
 	load_fp_state(&vcpu->arch.fp);
 #ifdef CONFIG_ALTIVEC
@@ -4217,7 +4217,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 #endif
 	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
-	load_spr_state(vcpu, &host_os_sprs);
+	switch_pmu_to_guest(vcpu, &host_os_sprs);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -4317,6 +4317,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			vcpu->arch.slb_max = 0;
 	}
 
+	switch_pmu_to_host(vcpu, &host_os_sprs);
+
 	store_spr_state(vcpu);
 
 	store_fp_state(&vcpu->arch.fp);
@@ -4331,8 +4333,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	switch_pmu_to_host(vcpu, &host_os_sprs);
-
 	timer_rearm_host_dec(*tb);
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
-- 
2.23.0

