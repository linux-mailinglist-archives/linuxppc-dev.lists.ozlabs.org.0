Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3A421410
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:28:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNR3K6HgFz3fK2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:28:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FuPAPdd4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FuPAPdd4; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQTq5bvsz3cNM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:39 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id c29so4514901pfp.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AdZU0vsaA7eoEc1W7hEx0HHSrDx68parS+Neoj58wvs=;
 b=FuPAPdd4AuCMzRlUAw1cO3YyYFfbBll4q/e22WAjqphgz+yORSeWc1whfUX0xYO+tG
 b2fJBd5sSqXGF9cwPjM+mxuP9lZRwwEv37XVnMSAmk70ENRjTJcbH8cJ8ykv1VfGAWMs
 K57sksAIEjAPB1iZ6eutfhzrFodokQQZ5BR8YF3ftYXeNF2cRkWImWzOgTU28duvo41K
 3VgexiwLGFSHBo2oCaNpSkrEgllgmK9GlMfPI096srSoWquBbSngcT4SWa0vOIa0pNcH
 HQny8M7qI7TOfdduBacS6aF1UFWF8WkxQhUP9rFgFTd9yx41LeMTWvLT8ggzZppH3TFV
 qJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AdZU0vsaA7eoEc1W7hEx0HHSrDx68parS+Neoj58wvs=;
 b=U3AwR/lJ/NDD0QS2X1VJ1ITNBuPaAKE3urUwZZyelw2cwlols49nrnPdElv0zfCGDY
 WVsfDdwSdwiueOlor/ZZ2AzcQBwY8S5/nD2eaWJdoBaEv9Ng2b9icLh+nNYX3CcMll1e
 5HM+27a0cnuGDw+bpR09+u96yzn2DSrqHeXrj9xBGcqyvAjs94IItJzMVxpVDHDBMUdT
 USbm0Mgjs7cO9xfeb6IFqu0lspPWnYnTeybcS65sA836JfmBv0UcX900dF/cMSEHvU0F
 fl0aT1zjT7ZwhYOqq5VoDlM5ErEXtWbu5I66sXalcWNGcRnXS7f+rb66mOODLpkMUWh6
 hAZQ==
X-Gm-Message-State: AOAM530PH5JeCuNJ/pODJ60XwReXNrz6nnJvTESXJKUzKlXQRkE7i/Fw
 59AWMjC0DkvUXhJIRldtNW8CWyaV8g4=
X-Google-Smtp-Source: ABdhPJwv7mubAZbz9fLyx8zI6rdNmj3T5moHXZxRqMNMlkCpzygbuyOQ2xtOyp4IrySG5p75oaTEHA==
X-Received: by 2002:a63:dd51:: with SMTP id g17mr11486439pgj.47.1633363357835; 
 Mon, 04 Oct 2021 09:02:37 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 40/52] KVM: PPC: Book3S HV P9: Test dawr_enabled() before
 saving host DAWR SPRs
Date: Tue,  5 Oct 2021 02:00:37 +1000
Message-Id: <20211004160049.1338837-41-npiggin@gmail.com>
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

Some of the DAWR SPR access is already predicated on dawr_enabled(),
apply this to the remainder of the accesses.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 34 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 323b692bbfe2..0f341011816c 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -666,13 +666,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	host_hfscr = mfspr(SPRN_HFSCR);
 	host_ciabr = mfspr(SPRN_CIABR);
-	host_dawr0 = mfspr(SPRN_DAWR0);
-	host_dawrx0 = mfspr(SPRN_DAWRX0);
 	host_psscr = mfspr(SPRN_PSSCR);
 	host_pidr = mfspr(SPRN_PID);
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		host_dawr1 = mfspr(SPRN_DAWR1);
-		host_dawrx1 = mfspr(SPRN_DAWRX1);
+
+	if (dawr_enabled()) {
+		host_dawr0 = mfspr(SPRN_DAWR0);
+		host_dawrx0 = mfspr(SPRN_DAWRX0);
+		if (cpu_has_feature(CPU_FTR_DAWR1)) {
+			host_dawr1 = mfspr(SPRN_DAWR1);
+			host_dawrx1 = mfspr(SPRN_DAWRX1);
+		}
 	}
 
 	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
@@ -1006,15 +1009,18 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_HFSCR, host_hfscr);
 	if (vcpu->arch.ciabr != host_ciabr)
 		mtspr(SPRN_CIABR, host_ciabr);
-	if (vcpu->arch.dawr0 != host_dawr0)
-		mtspr(SPRN_DAWR0, host_dawr0);
-	if (vcpu->arch.dawrx0 != host_dawrx0)
-		mtspr(SPRN_DAWRX0, host_dawrx0);
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		if (vcpu->arch.dawr1 != host_dawr1)
-			mtspr(SPRN_DAWR1, host_dawr1);
-		if (vcpu->arch.dawrx1 != host_dawrx1)
-			mtspr(SPRN_DAWRX1, host_dawrx1);
+
+	if (dawr_enabled()) {
+		if (vcpu->arch.dawr0 != host_dawr0)
+			mtspr(SPRN_DAWR0, host_dawr0);
+		if (vcpu->arch.dawrx0 != host_dawrx0)
+			mtspr(SPRN_DAWRX0, host_dawrx0);
+		if (cpu_has_feature(CPU_FTR_DAWR1)) {
+			if (vcpu->arch.dawr1 != host_dawr1)
+				mtspr(SPRN_DAWR1, host_dawr1);
+			if (vcpu->arch.dawrx1 != host_dawrx1)
+				mtspr(SPRN_DAWRX1, host_dawrx1);
+		}
 	}
 
 	if (vc->dpdes)
-- 
2.23.0

