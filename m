Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E89B20C2C2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 17:21:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vHXq0MJHzDrFS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 01:21:47 +1000 (AEST)
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
 header.s=20161025 header.b=BpT4/FNx; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vH9M55lmzDqvx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 01:04:55 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id t194so12022007wmt.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcYsmTzhEp8xx6FEht3XE+3X/L1jPFAQ52+7Dv3gK8g=;
 b=BpT4/FNx/etJ//DvyDsL3xQ8EMx/6WOSdzy0U3kj60HjYtYDdwEz6GSYvD7hC4kXEV
 EP2xX6uJptQIaxwNrX4HSj0hVe8VAVSByyZgmTWtVRiD/x5KcElJkA0/gjisoQ40ZVlG
 2LFBc1uLiRlsNlY1rElBp6Mz1qwc5bLJ+CBuMll3oUDCCkbqUhapTjCgbkdV5XTsM7lR
 PBxVFLSetCp1v+6amG+jiEoxAYrB1VlB1Ah+4dGabhYcxhbHd82ac6AmJKm2V7H85aNN
 uEs+KfzWvkQrsyTEzItviN6gc8M7KySEsfDu8Y0wcO/RdeErbawEB3C+BT6QCEjCqV2V
 FP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcYsmTzhEp8xx6FEht3XE+3X/L1jPFAQ52+7Dv3gK8g=;
 b=bn1SqZbZjKEdH6zjfcQaOnlqqQQzfaEAZhiNVRTXLcC0t9Y8XkIfFvjtdToLdFLqAH
 /1790vn7HjfRhXpkATv2DP12avao+/0RinhpOVKDHQE5rIBC21v9RmSoQmeepl3cXMEc
 UGk/hZuIYt9tKLJr/QDJgKg2MENN4VtRWdaSVnOSwazPD1OLcngrvgmD1FjQ583dqpat
 yV73lijvWZGyj08blf+kcwK0vvkpjSEEyBTYEiRsEFdP6XnAxe1luIi0xH+y2tdC5LSw
 v1mklonMbRugxbXxDutFB3qj86PEHJYbxR32mdUlKGd5/LwxPatK+ADevY/K971omnZ6
 IWIw==
X-Gm-Message-State: AOAM533SUaQ48fWcdha/dDw3Z1ShEdZw8MSLwrzLvNlnm3/cuq5pVHOY
 vDHtch999hFYHAJgdJPB/iXVn99F
X-Google-Smtp-Source: ABdhPJzayRlbE2c61cAd22ablp2wLNu6moYY/lO7NxFkLoDNKj25ezzEFbh69aUCYHixk0AEfkoq9Q==
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr8512913wmg.74.1593270291394; 
 Sat, 27 Jun 2020 08:04:51 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id d132sm21722029wmd.35.2020.06.27.08.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 08:04:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/pseries: Use doorbells even if XIVE is available
Date: Sun, 28 Jun 2020 01:04:27 +1000
Message-Id: <20200627150428.2525192-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200627150428.2525192-1-npiggin@gmail.com>
References: <20200627150428.2525192-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 Anton Blanchard <anton@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
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

