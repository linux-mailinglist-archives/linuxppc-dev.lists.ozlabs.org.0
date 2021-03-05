Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F015A32EE27
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:15:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWWn702Lz3fJJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:15:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bolL2wY5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bolL2wY5; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWM13mLtz3dT9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:07:57 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id 18so2325438pfo.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQ3/M2pAv7d1Wpqn9zaXNomJqAHRErrNglb/BiHoKmY=;
 b=bolL2wY5wK2mZH94RhDD72Y/iJHKEqk30tF0KlkrHNiJwvXnCJKqm05YsxMYVtfpQG
 ssclPQeUFV8S7nhz4M8afSEI4rzQgVrB2KURUD/191uyuVfr+rkhZ2sPbMEPgtOT/f8c
 ehf2pFzPYm9WvRMW0WSzDQtareSS8kUt3dAYH4shNAqAchnrwMTOHCw70+wMV7fef9rz
 Cobycxvzg/Aypc1xQ0DnW1IpseNz/pOJRRm1Cv5SOIcserVm3j9Mgo7RvePmzHOrCwSJ
 Gp5dryGySp8Z1y9/Vfa9OpN8BhjvyLL35NqKMYNGm/FHSDE9FoxsnF3PJtcoZWHVQQum
 XA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQ3/M2pAv7d1Wpqn9zaXNomJqAHRErrNglb/BiHoKmY=;
 b=Pq7RsAobB1A9zt+60HeJTntFjKFaX6vc+4pCZozs7aZYCKKEpcHD6aih+Yp2BbBUSe
 jG0vdrnVqnXeYSXEQhUJHZh440LTlh4e/q6pwEPGaviKQLuksb4hFnNT7eVtV5qHCvXn
 UR37WPwWeVf+dcaJih12eyspU363J6AHYY9AeaGaoT+sqvUy8fMCHyB070Tjgqc1pfom
 u16LMVL7ca/LJ3KjxoCzAXTBLmo6Z+t68lxAXWDnO5BVZW9viuv1s9KB8LyKZKcRFuKt
 5Fo6+zKo2KRH++6mwf8HX/4Hh6FAKKiiExvboRCCxzIVuL+e6dW0Lx3gFJGuh58CcbL8
 +vsA==
X-Gm-Message-State: AOAM531Gxuq7GuYF1eHY8j2rwdW80msaxp74qZaAsC7XV3QbuMhZWqcs
 ODQ4KirpU29auMGgFZjoLGQ=
X-Google-Smtp-Source: ABdhPJxW1J59E4vIIpJ2pB6l0t3RwysNthEwiN9dw/x43lfNUpOYvOoa1CsoqTVfXdzr+MoRICyWEw==
X-Received: by 2002:a63:50a:: with SMTP id 10mr8923239pgf.89.1614956875270;
 Fri, 05 Mar 2021 07:07:55 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:07:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 20/41] KVM: PPC: Book3S HV P9: Move setting HDEC after
 switching to guest LPCR
Date: Sat,  6 Mar 2021 01:06:17 +1000
Message-Id: <20210305150638.2675513-21-npiggin@gmail.com>
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

LPCR[HDICE]=0 suppresses hypervisor decrementer exceptions on some
processors, so it must be enabled before HDEC is set.

Rather than set it in the host LPCR then setting HDEC, move the HDEC
update to after the guest MMU context (including LPCR) is loaded.
There shouldn't be much concern with delaying HDEC by some 10s or 100s
of nanoseconds by setting it a bit later.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 1f2ba8955c6a..ffde1917ab68 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3505,20 +3505,9 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -3564,6 +3553,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
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

