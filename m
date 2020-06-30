Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E6220F3E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 13:56:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x2rc6XWgzDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 21:56:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L0USudye; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x2kG58qYzDqkD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 21:51:02 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id f18so11757020wrs.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 04:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcYsmTzhEp8xx6FEht3XE+3X/L1jPFAQ52+7Dv3gK8g=;
 b=L0USudyektF2Cc8Oup2k3fOqJKuxbgAL6rtTM3p5xDeRowJaRXpKY/T8KI426Sp1jE
 2PR54w14o8dItuxcEdBI0+BQYsiOyKKNX2EOL0RfyLq5WQnp9w6FW2H2ztBg/OxwqAx/
 uL/y8tgrdyyth8wqHhXWm1fk+KS7Wrisj0IQ9T92S1d+jcQ+NBDHhjjfC168APoHxugz
 x+i4/WVZltTEReZHuyRj5BeSKdiBbMX39pgfaitRG2QbGV6XxkJ6M2nVpPGjqXdbZd01
 B+S7FP4p9/6a3HfFhmlPMo5BBsXvBdXXU9s/SgwdlG/+wAFOGqojiSWdEPy2aq3a7IkL
 OPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcYsmTzhEp8xx6FEht3XE+3X/L1jPFAQ52+7Dv3gK8g=;
 b=dDqyTmMeiFr8WSK0WdQeUkm89yDMywVJigmB9672DVX6fdhHVq7fLBP4xkMUtVJP/B
 yuHkVPRsSqGPjpIW6OFFl6s2IZ60Ntgv6rNJPFnl0MA7P5F9g4As4AYHg10V4YfTF/2m
 LswSSZjnr3zOTS3JcEczc7EjTWiqYOfOQ+4s0A2LEOWXv7c/WofSF6PCyvTPjg5OfA0L
 Hn6mIrYmKG+xL+wK40Xm66i6fOSuRAAvs/84I7FwqhbtxMKBtlW1F4Q6ZAN/Ni6mV+8M
 /kmMyRmcAcXCPpwKT9wzHhXNg0uodICQ06MKAZHj1t62mK0b2AhLnhrjvnz7/cQ6OUT6
 bhIw==
X-Gm-Message-State: AOAM530jjb8kwmCCTugqggMLYU49AKosHG+Wrq5vOoVZ+7ef3D1GERFZ
 Z126F4RkrTP5GzEC4YX2q/3whpnH
X-Google-Smtp-Source: ABdhPJxsML2kYOdlBwOJzT3J7t3FBvtGvblzJuhLM37QcRd+9XTNE9Km6/om/xujUR3CzYW4TeJ8BA==
X-Received: by 2002:adf:dfd1:: with SMTP id q17mr20337495wrn.94.1593517858603; 
 Tue, 30 Jun 2020 04:50:58 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id c25sm3133673wml.46.2020.06.30.04.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 04:50:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/pseries: Use doorbells even if XIVE is
 available
Date: Tue, 30 Jun 2020 21:50:32 +1000
Message-Id: <20200630115034.137050-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200630115034.137050-1-npiggin@gmail.com>
References: <20200630115034.137050-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Anton Blanchard <anton@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
 arch/powerpc/platforms/pseries/smp.c | 54 ++++++++++++++++++----------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 6891710833be..67e6ad5076ce 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -188,13 +188,16 @@ static int pseries_smp_prepare_cpu(int cpu)
 	return 0;
 }
 
-static void smp_pseries_cause_ipi(int cpu)
+/* Cause IPI as setup by the interrupt controller (xics or xive) */
+static void (*ic_cause_ipi)(int cpu) __ro_after_init;
+
+/* Use msgsndp doorbells target is a sibling, else use interrupt controller */
+static void dbell_or_ic_cause_ipi(int cpu)
 {
-	/* POWER9 should not use this handler */
 	if (doorbell_try_core_ipi(cpu))
 		return;
 
-	icp_ops->cause_ipi(cpu);
+	ic_cause_ipi(cpu);
 }
 
 static int pseries_cause_nmi_ipi(int cpu)
@@ -218,26 +221,41 @@ static int pseries_cause_nmi_ipi(int cpu)
 	return 0;
 }
 
-static __init void pSeries_smp_probe_xics(void)
-{
-	xics_smp_probe();
-
-	if (cpu_has_feature(CPU_FTR_DBELL) && !is_secure_guest())
-		smp_ops->cause_ipi = smp_pseries_cause_ipi;
-	else
-		smp_ops->cause_ipi = icp_ops->cause_ipi;
-}
-
 static __init void pSeries_smp_probe(void)
 {
 	if (xive_enabled())
-		/*
-		 * Don't use P9 doorbells when XIVE is enabled. IPIs
-		 * using MMIOs should be faster
-		 */
 		xive_smp_probe();
 	else
-		pSeries_smp_probe_xics();
+		xics_smp_probe();
+
+	/* No doorbell facility, must use the interrupt controller for IPIs */
+	if (!cpu_has_feature(CPU_FTR_DBELL))
+		return;
+
+	/* Doorbells can only be used for IPIs between SMT siblings */
+	if (!cpu_has_feature(CPU_FTR_SMT))
+		return;
+
+	/*
+	 * KVM emulates doorbells by disabling FSCR[MSGP] so msgsndp faults
+	 * to the hypervisor which then reads the instruction from guest
+	 * memory. This can't be done if the guest is secure, so don't use
+	 * doorbells in secure guests.
+	 *
+	 * Under PowerVM, FSCR[MSGP] is enabled so doorbells could be used
+	 * by secure guests if we distinguished this from KVM.
+	 */
+	if (is_secure_guest())
+		return;
+
+	/*
+	 * The guest can use doobells for SMT sibling IPIs, which stay in
+	 * the core rather than going to the interrupt controller. This
+	 * tends to be slower under KVM where doorbells are emulated, but
+	 * faster for PowerVM where they're enabled.
+	 */
+	ic_cause_ipi = smp_ops->cause_ipi;
+	smp_ops->cause_ipi = dbell_or_ic_cause_ipi;
 }
 
 static struct smp_ops_t pseries_smp_ops = {
-- 
2.23.0

