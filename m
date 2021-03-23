Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D10B33454C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:15:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D2Z6MPYz3dBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:15:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RFz5Owr0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RFz5Owr0; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cnk4Qgbz3c1G
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:42 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so11433902pjq.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5JdTn5OxXho5EBUjE83UnAYh8oHgW8yUHH3wXU/FFlA=;
 b=RFz5Owr03qtm4vmeA3ix064bN5Djes2y2TvOfF+VgTrlFgsxr6SPWKh1HO51+jeLNz
 3btqsKXfOTlD069K+QWAsU6UWJxEPTxTKY7pTCrXCsyDeKnKDDCq/L+AazT+NJyufOu6
 Y4GWQcO7IEqc+RvpuL6/sLB044MpcT4niFyEE/jJnHdAMep5GRmPYW3whk5kXMeLsz0s
 Hg4T7XQzvlTJlVGiuhNqiGELKhPShs9ufjYxze6AfB5W8P/aYL9D88Lrn9SEbz+65dPh
 TdrPGl2MLzLkkwBtfqoymJEnWyQncm48dSt9hL4WCeKNKj2ssGWySyrHw9r0Gg5vfZyv
 +f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5JdTn5OxXho5EBUjE83UnAYh8oHgW8yUHH3wXU/FFlA=;
 b=lorUN9CgCUv5qSwX/uET+7HZ6XLDcW3hZwdviz8IaXLrVG/NRpB9T518z5EJmM+eOD
 nD79/Te6vxwUtCyZx4inG76155cii0mG0pSBNOF9cb01HpEcHQFdU1HJWhgH9o9L3CRM
 h5SEyUWmFVJJBS021v5uabrsvjNImvVw0pyq9LZstlB1kftlhO4oS4OnWb15h/FFh99k
 9DwBCw4AmPlgfjS6JABAzX6qCh4C37BV19p67hyixLApOeyPazqMxkHQFJHufAr+E3w8
 DPbhIdoRTdkW8wcPPbu+B/qw5kQLdx3S3rqzKVGGEmiG04SL18R8/ya0g4HSWmjNc/9P
 QhvA==
X-Gm-Message-State: AOAM532HrK1bLtmad7Itx1iPAwScVv+vJN6n6x4BbMQ4XqUIw0n4EQ+I
 KCAcf+z9Qg2Z//v4TXBv2vWPRieTlto=
X-Google-Smtp-Source: ABdhPJz41VEeWwXzCYnfFe7aZlNTXw4ctcWU0T6seoc/kgfqqOO7RmqGqEM9/gKyvHzMyZe0G5cUcA==
X-Received: by 2002:a17:90a:ba05:: with SMTP id
 s5mr1810923pjr.194.1616461481061; 
 Mon, 22 Mar 2021 18:04:41 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 28/46] KVM: PPC: Book3S HV P9: Reduce irq_work vs guest
 decrementer races
Date: Tue, 23 Mar 2021 11:02:47 +1000
Message-Id: <20210323010305.1045293-29-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
index 1f38a0abc611..989a1ff5ad11 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3745,6 +3745,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -3879,7 +3891,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - tb);
+	set_dec_or_work(local_paca->kvm_hstate.dec_expires - tb);
+
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

