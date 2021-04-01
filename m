Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA235161D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:22:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6PT6mRFz3hJ6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:22:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JQNrbzgB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JQNrbzgB; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB61y16kkz3clJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:42 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id c204so1686120pfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHRWFD3iHSSdLF286j0f1zwOIMoz2IhYKJedkP23IR8=;
 b=JQNrbzgBJzAX0QRhUQ/PB5TNt7aWSefVW2t8ZMYf+wYjIExLBpiP1np8rOBsScYm1Z
 KIN3BNuznihlMcB0NFii5OPb95MG87YVNZ7kG5X91AE15cCZoSzF/SJJmcI0wXbdU/Pe
 IX6g/0mkQ1w9EMemsEqq3w4iSE/A126/IcyPpVzlydAp+DG5NfkzkxmAi12Z73/1T1fG
 QFrj5+fzbsVDb/VRgVXlZ8g5KdKhVUPZTy7SmN2TYsajkUqj5CjJH85EnLIZgVOTYOuM
 /lJv+XmbVaewBRHgp3Qlo+zA90KmocFg6/veTBUanQp9C3Rhoc5PnaCm9m3EfmeMY4mP
 3iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHRWFD3iHSSdLF286j0f1zwOIMoz2IhYKJedkP23IR8=;
 b=ZsopJizJIe6spKbzN8/WAnnGrTBP7eg6fd7gpsQ+mjVnsorLbtMti1X6KlzsftZMO/
 2+qjqETJlKq+GWhyL+ZZUjCdafRzCt+2lXi3IExH1X63Z72n+QhpivRg6uHQz5mj/ryN
 qwc5BDnse6NjY1C26AnYmPRSYmT+5dOtDPJPkQOUbd0jaAzE5MNKc0N+58iLpFVP+OxU
 ydsMX9AkJvmFXJ+wo27WqQzAjXdJCZXVmUqDHBvDbKrIjHokI/zj6Nt5CkAAf1zmyaSx
 HX5whjGbaMRe1/tIpbQLi8qLKQzB4/eS9zFjPii9Lh8DX35h6tWcyyGTOnmzwy2sqpPc
 WHHQ==
X-Gm-Message-State: AOAM532UdatsMvcGo6pIfEwLgIiMLVe7nmSAaHJb70mqHZ7RVylV2d5+
 778+77EOxy+3idxOHdVTUo9ORhIok1E=
X-Google-Smtp-Source: ABdhPJymbNP6zKGUMDQZLLEvXcf6Ek9xTVDRt61A61pzB5GEI1yOxdrtfcagr9Q7A2glKlTojHYUCw==
X-Received: by 2002:a63:fa57:: with SMTP id g23mr7620663pgk.243.1617289540520; 
 Thu, 01 Apr 2021 08:05:40 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 41/48] KVM: PPC: Book3S HV: Remove unused nested HV tests
 in XICS emulation
Date: Fri,  2 Apr 2021 01:03:18 +1000
Message-Id: <20210401150325.442125-42-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit f3c18e9342a44 ("KVM: PPC: Book3S HV: Use XICS hypercalls when
running as a nested hypervisor") added nested HV tests in XICS
hypercalls, but not all are required.

* icp_eoi is only called by kvmppc_deliver_irq_passthru which is only
  called by kvmppc_check_passthru which is only caled by
  kvmppc_read_one_intr.

* kvmppc_read_one_intr is only called by kvmppc_read_intr which is only
  called by the L0 HV rmhandlers code.

* kvmhv_rm_send_ipi is called by:
  - kvmhv_interrupt_vcore which is only called by kvmhv_commence_exit
    which is only called by the L0 HV rmhandlers code.
  - icp_send_hcore_msg which is only called by icp_rm_set_vcpu_irq.
  - icp_rm_set_vcpu_irq which is only called by icp_rm_try_update
  - icp_rm_set_vcpu_irq is not nested HV safe because it writes to
    LPCR directly without a kvmhv_on_pseries test. Nested handlers
    should not in general be using the rm handlers.

The important test seems to be in kvmppc_ipi_thread, which sends the
virt-mode H_IPI handler kick to use smp_call_function rather than
msgsnd.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 44 +++++-----------------------
 arch/powerpc/kvm/book3s_hv_rm_xics.c | 15 ----------
 2 files changed, 8 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 8d669a0e15f8..259492bb4153 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -199,15 +199,6 @@ void kvmhv_rm_send_ipi(int cpu)
 	void __iomem *xics_phys;
 	unsigned long msg = PPC_DBELL_TYPE(PPC_DBELL_SERVER);
 
-	/* For a nested hypervisor, use the XICS via hcall */
-	if (kvmhv_on_pseries()) {
-		unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
-
-		plpar_hcall_raw(H_IPI, retbuf, get_hard_smp_processor_id(cpu),
-				IPI_PRIORITY);
-		return;
-	}
-
 	/* On POWER9 we can use msgsnd for any destination cpu. */
 	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
 		msg |= get_hard_smp_processor_id(cpu);
@@ -420,19 +411,12 @@ static long kvmppc_read_one_intr(bool *again)
 		return 1;
 
 	/* Now read the interrupt from the ICP */
-	if (kvmhv_on_pseries()) {
-		unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
-
-		rc = plpar_hcall_raw(H_XIRR, retbuf, 0xFF);
-		xirr = cpu_to_be32(retbuf[0]);
-	} else {
-		xics_phys = local_paca->kvm_hstate.xics_phys;
-		rc = 0;
-		if (!xics_phys)
-			rc = opal_int_get_xirr(&xirr, false);
-		else
-			xirr = __raw_rm_readl(xics_phys + XICS_XIRR);
-	}
+	xics_phys = local_paca->kvm_hstate.xics_phys;
+	rc = 0;
+	if (!xics_phys)
+		rc = opal_int_get_xirr(&xirr, false);
+	else
+		xirr = __raw_rm_readl(xics_phys + XICS_XIRR);
 	if (rc < 0)
 		return 1;
 
@@ -461,13 +445,7 @@ static long kvmppc_read_one_intr(bool *again)
 	 */
 	if (xisr == XICS_IPI) {
 		rc = 0;
-		if (kvmhv_on_pseries()) {
-			unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
-
-			plpar_hcall_raw(H_IPI, retbuf,
-					hard_smp_processor_id(), 0xff);
-			plpar_hcall_raw(H_EOI, retbuf, h_xirr);
-		} else if (xics_phys) {
+		if (xics_phys) {
 			__raw_rm_writeb(0xff, xics_phys + XICS_MFRR);
 			__raw_rm_writel(xirr, xics_phys + XICS_XIRR);
 		} else {
@@ -493,13 +471,7 @@ static long kvmppc_read_one_intr(bool *again)
 			/* We raced with the host,
 			 * we need to resend that IPI, bummer
 			 */
-			if (kvmhv_on_pseries()) {
-				unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
-
-				plpar_hcall_raw(H_IPI, retbuf,
-						hard_smp_processor_id(),
-						IPI_PRIORITY);
-			} else if (xics_phys)
+			if (xics_phys)
 				__raw_rm_writeb(IPI_PRIORITY,
 						xics_phys + XICS_MFRR);
 			else
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index c2c9c733f359..0a11ec88a0ae 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -141,13 +141,6 @@ static void icp_rm_set_vcpu_irq(struct kvm_vcpu *vcpu,
 		return;
 	}
 
-	if (xive_enabled() && kvmhv_on_pseries()) {
-		/* No XICS access or hypercalls available, too hard */
-		this_icp->rm_action |= XICS_RM_KICK_VCPU;
-		this_icp->rm_kick_target = vcpu;
-		return;
-	}
-
 	/*
 	 * Check if the core is loaded,
 	 * if not, find an available host core to post to wake the VCPU,
@@ -771,14 +764,6 @@ static void icp_eoi(struct irq_chip *c, u32 hwirq, __be32 xirr, bool *again)
 	void __iomem *xics_phys;
 	int64_t rc;
 
-	if (kvmhv_on_pseries()) {
-		unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
-
-		iosync();
-		plpar_hcall_raw(H_EOI, retbuf, hwirq);
-		return;
-	}
-
 	rc = pnv_opal_pci_msi_eoi(c, hwirq);
 
 	if (rc)
-- 
2.23.0

