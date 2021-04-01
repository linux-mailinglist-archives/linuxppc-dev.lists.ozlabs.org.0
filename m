Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA723515FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6Cp1wBcz3fwb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:14:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dJBI861D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dJBI861D; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB60z2FZYz3cFx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:51 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id h20so1165414plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/wOLBycO7ANmZmJ1hyUAWBGRDu4iKrKXe/fsD7uKbxk=;
 b=dJBI861D3Ep/GuWZfpznMlvaWij/Rgyg6EDvbH8wdBQgeIs7adD0KT8TpCSr3MGj1J
 fyyVd/lpecQl8h53SvLeyo+uupwDUEcOuSo6cuVKMWxXx62cuoq4GGXAqiQ5VhHO2q0/
 CPDfZTQHuu/jbkzRuuSZC+hhiKzxRrKZpb/fKes+HlaGybf+caytjNoNcYIyNSu04J8Y
 v3hTxCtx6QH2UAL1zGC7rcNpWNSh0vtbareDTt4yxGSqBuQmerGJRvp97qUeSzRl4f9g
 ZtsHkb+7GVpSQ/Y4SP/RmQ8Ap4PxYj51EqUzaELAzl3RqK/VXH+QIakzlKPeb14kPT3D
 8hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/wOLBycO7ANmZmJ1hyUAWBGRDu4iKrKXe/fsD7uKbxk=;
 b=W0LWM6ft9rzLttd3pruF9mPTuRfJNKvW3NMo7SWsrCy71J8YMs0qlpUVET7OocIDGd
 /BJcKPY/mdNS2YB/WQKpTksrgKRoNYXnfmkkHrvfzItXU8UMYhk1tsJxNPbw9tKJJ7aR
 RV9aSj9TbkeWFHkeJ9miTMAb6TyXzlz+kht4Vw/TKn9xf7ITcSakIILYtnCfvJnNoD9z
 r6n7U35oFLzA1TmGryKYisIgL0tstAEMfTv7Ubk5Y+t8fGaQUiSXuoq1MFGeDI0PApmN
 BtL5A+G5sMxBlybnvxYtA359O//eqOP72wXmwqHzi5mazX36tqui6hp4HBAraOkQuz7T
 iT0Q==
X-Gm-Message-State: AOAM532NTNlSX8U+/GUp+q3LmSc9ucZInJNXbx0RwG+25d4I3CNy1DU+
 G9+dOLD5xbq75Mp3/2ch5c8=
X-Google-Smtp-Source: ABdhPJwI7NGzR3SPRUV/+jaX2KQCXxZkjEKdSbn7D6dHHsiREg32Qe1nA8sWnaBbMg847j91NHOBMA==
X-Received: by 2002:a17:90a:8a8b:: with SMTP id
 x11mr9213247pjn.151.1617289489480; 
 Thu, 01 Apr 2021 08:04:49 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 23/48] KVM: PPC: Book3S HV P9: Move setting HDEC after
 switching to guest LPCR
Date: Fri,  2 Apr 2021 01:03:00 +1000
Message-Id: <20210401150325.442125-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LPCR[HDICE]=0 suppresses hypervisor decrementer exceptions on some
processors, so it must be enabled before HDEC is set.

Rather than set it in the host LPCR then setting HDEC, move the HDEC
update to after the guest MMU context (including LPCR) is loaded.
There shouldn't be much concern with delaying HDEC by some 10s or 100s
of nanoseconds by setting it a bit later.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c45352fbc25d..c249f77ea08c 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3551,20 +3551,9 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
-	/*
-	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] = 0,
-	 * so set HDICE before writing HDEC.
-	 */
-	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
-	isync();
-
 	hdec = time_limit - mftb();
-	if (hdec < 0) {
-		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
-		isync();
+	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-	}
-	mtspr(SPRN_HDEC, hdec);
 
 	if (vc->tb_offset) {
 		u64 new_tb = mftb() + vc->tb_offset;
@@ -3610,6 +3599,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 
+	/*
+	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
+	 * so set guest LPCR (with HDICE) before writing HDEC.
+	 */
+	mtspr(SPRN_HDEC, hdec);
+
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
 	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
 
-- 
2.23.0

