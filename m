Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E583454E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:21:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D8s34zKz3h37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:21:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Zb6mSHIO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Zb6mSHIO; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CpM1X7cz30N8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:05:14 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id c204so12526648pfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHRWFD3iHSSdLF286j0f1zwOIMoz2IhYKJedkP23IR8=;
 b=Zb6mSHIOlk5j23be2Af4KvKYudzcuLXODDzZ+aRnttGvT/4ASd7a+PzPRqEM+wOCZ1
 lqJ0sDDT4o7HVnfgBmmA0QRWLAEuUKTtw7OG9T+kEW5iI1zvwL82OtBZInKkgEFJbrpO
 A0wVLqFAzJA2e+Rdd+O9EstPtccP64F2DTaaapoKXvGFRCfe6ZYWCuzoiJrJTogGwn6p
 AceSj8bxO0wYERRTCKQv4hA8wmYU1taubYU0YEHhszRhz/oqejGa0KtQOCunvcTCDUXa
 agUuYyQhzz5oojOM5zt0IiNjsjE8Cxw1LrXkFFIMuN+/vYzznu/W9J6xK7b6pmWRAy+t
 604Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHRWFD3iHSSdLF286j0f1zwOIMoz2IhYKJedkP23IR8=;
 b=JgEkJ5Tq7MooLTI13XOGzeHvfYvFcX0MhC8dimdCAj0ItfVLSRW5WOxrlp5hgohYCm
 9Eng2IaGEmFV3GX3BK/32UILS3qqN0x5Gefw+WG9zVlbDLDQUkWGPA2055gfUS5Kv9ta
 ZY0kDiJtAOfG7uk4YJQD2l9LrZhAJMd3oUJQsi+NAtkIwscSOunBNCQ1fCHqxZWjvVPY
 V2iB42E2jYA8WTKlfdWB94VP5Wr0yq9BaPYnwxOuizlLkMl3rb5tz8fjiOtohI799cTn
 kvoHgC2Bhn6M6BskOqY6W1TNwgthBGPtUcCRzJVkyn8aTYIJALaaVASXnOf5cGYcuQdH
 GDPA==
X-Gm-Message-State: AOAM5320+2WCnts3qil4I8dlFqo/W+kBiNws9z/ups31vJmBW3i3k4OJ
 W0u80SFhokJKzHnfCgldc4s=
X-Google-Smtp-Source: ABdhPJwjyUlFyf1rEpKoKTPao3Qr4DWURM8z6pPrAzr+l4OyAGr9JoocQV0pbYJOVqvLE8aG4VCzXA==
X-Received: by 2002:a17:902:e5ce:b029:e5:dc8a:7490 with SMTP id
 u14-20020a170902e5ceb02900e5dc8a7490mr2261419plf.37.1616461513164; 
 Mon, 22 Mar 2021 18:05:13 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:05:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 40/46] KVM: PPC: Book3S HV: Remove unused nested HV tests
 in XICS emulation
Date: Tue, 23 Mar 2021 11:02:59 +1000
Message-Id: <20210323010305.1045293-41-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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

