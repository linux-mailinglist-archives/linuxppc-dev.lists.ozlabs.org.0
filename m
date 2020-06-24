Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F642074E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 15:51:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sPgz5jR9zDqjd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 23:51:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tpf/dcq4; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sPbd4xg1zDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 23:47:41 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id g75so2378986wme.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 06:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHfk96B0+ihglAFlrm1FT6zDDI3xWocJzEidZ1THNGo=;
 b=tpf/dcq4PAzW3T54HKNZWmByjNJgL82k45veKEeoYnLdGkSoRmUdwKRSHvfBLDHOG9
 FEP1fA1ZoqptL6kpfglTgJE1SIQOQRVDZgGpauAwOTppto0B5vDaQsixBq+xxkWeqHtP
 xeENTkgnV8AZLBR/oycfN8ZuB3EZqbDUo3EhSS9zettNixoVNKhGPcHB21EvWNFgOb2+
 C5XEZ+6hCIoGhCf8PEWc4/12oNrfC/o2W5x9YkuNlp3lVoe6vwltOgSl2pFpjVjUoBT5
 zh0VaRnuyMm3j1ejVdDsdsnx+FI5hdkAHB5gVGJQTYaKnK7Lc5XwbCHBIxn2791yYQ8b
 MVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHfk96B0+ihglAFlrm1FT6zDDI3xWocJzEidZ1THNGo=;
 b=EQFprI2+NGiJuZWnKQfJH3oT0Nq3eoL5PH2ih20K/nkKb6StFFRGcvvf2p2N/LnFy1
 p3ORcoU/w4HdGlLPP/kbCPbevE7dAqPcmOKhhVAQ3sabnzpeyJdKZkLJc9r4mvWfAdoZ
 DYC2Wh3vISqG4QoO09RFp/ZudM+37o0B3sjFkHhVEge+75tS242A2PLf8OnQeT12j/IK
 Qk+UEFjgaOV9d3p0CWFjuVSAk9FBqVt3rnbs/EhkX2wJcnZm90IlAyzyw/BiPOPcQXzd
 edbbT4XamG+GAeMSbqM3xh9bfxcq67EIhZ+/TMk2XjHFop+pYHiEE+N9AqljZ26u3SLO
 c8hQ==
X-Gm-Message-State: AOAM532arquqNqbLz/LJTICCv0jtpW5IE4Y/rByBNmORx2Ju9WHsApZo
 occhpCbs1qWmhLQyeAj8cG/8GgnA
X-Google-Smtp-Source: ABdhPJzx6K1kek4etHgRf3uNsg3tPsTriU2IDEDRlnOtTzqm2BUNEFWMTc0jAGsTCRsYQMA+ql0v5g==
X-Received: by 2002:a1c:154:: with SMTP id 81mr29460084wmb.23.1593006456220;
 Wed, 24 Jun 2020 06:47:36 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id h14sm11284298wrt.36.2020.06.24.06.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 06:47:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Use doorbells even if XIVE is available
Date: Wed, 24 Jun 2020 23:47:24 +1000
Message-Id: <20200624134724.2343007-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Anton Blanchard <anton@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM supports msgsndp in guests by trapping and emulating the
instruction, so it was decided to always use XIVE for IPIs if it is
available. However on PowerVM systems, msgsndp can be used and gives
better performance. On large systems, high XIVE interrupt rates can
have sub-linear scaling, and using msgsndp can reduce the load on
the interrupt controller.

So switch to using core local doorbells even if XIVE is available.
This reduces performance for KVM guests with an SMT topology by
about 50% for ping-pong context switching between SMT vCPUs. An
option vector (or dt-cpu-ftrs) could be defined to disable msgsndp
to get KVM performance back.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/smp.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 6891710833be..a737a2f87c67 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -188,13 +188,14 @@ static int pseries_smp_prepare_cpu(int cpu)
 	return 0;
 }
 
+static void  (*cause_ipi_offcore)(int cpu) __ro_after_init;
+
 static void smp_pseries_cause_ipi(int cpu)
 {
-	/* POWER9 should not use this handler */
 	if (doorbell_try_core_ipi(cpu))
 		return;
 
-	icp_ops->cause_ipi(cpu);
+	cause_ipi_offcore(cpu);
 }
 
 static int pseries_cause_nmi_ipi(int cpu)
@@ -222,10 +223,7 @@ static __init void pSeries_smp_probe_xics(void)
 {
 	xics_smp_probe();
 
-	if (cpu_has_feature(CPU_FTR_DBELL) && !is_secure_guest())
-		smp_ops->cause_ipi = smp_pseries_cause_ipi;
-	else
-		smp_ops->cause_ipi = icp_ops->cause_ipi;
+	smp_ops->cause_ipi = icp_ops->cause_ipi;
 }
 
 static __init void pSeries_smp_probe(void)
@@ -238,6 +236,18 @@ static __init void pSeries_smp_probe(void)
 		xive_smp_probe();
 	else
 		pSeries_smp_probe_xics();
+
+	/*
+	 * KVM emulates doorbells by reading the instruction, which
+	 * can't be done if the guest is secure. If a secure guest
+	 * runs under PowerVM, it could use msgsndp but would need a
+	 * way to distinguish.
+	 */
+	if (cpu_has_feature(CPU_FTR_DBELL) &&
+	    cpu_has_feature(CPU_FTR_SMT) && !is_secure_guest()) {
+		cause_ipi_offcore = smp_ops->cause_ipi;
+		smp_ops->cause_ipi = smp_pseries_cause_ipi;
+	}
 }
 
 static struct smp_ops_t pseries_smp_ops = {
-- 
2.23.0

