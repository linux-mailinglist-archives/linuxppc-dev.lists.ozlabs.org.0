Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8DF22DB9A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 05:57:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDpzL4FwMzF0QT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 13:57:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bSjbGYSn; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDpst6FDkzF0QP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 13:52:18 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id c6so737978pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 20:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nEol4cg4fgvYnjxLbZL4ZZXX5iG5npgMKo8J5imOzG8=;
 b=bSjbGYSnE0c6uodbKuTJew7DPC0iLZFIBduu4kDh9uI3sy6vjNxGnx6QdkC1c1ug1N
 OH8CU0Z5ZgTJgseJAheGcdfzVk+uDBSSYEO5j8W04uLAZmYmA/JyvjU/kOAuG+Pe7c84
 qyjxk5sSdGhOXJr3khHASMGhU2OhVZQYbhnq62dKkvhE82xbqkKR0IPDJMz6KXURTbj5
 Kw/oboHpfgBxdTVZ38uQBGl8RK7xY0ARuS3IcUPrR4UeCVfwy+yxudfziCosbCWzOfGA
 ofKJsePkjIjv2vdGQfJwzrIW0nrdHmW3GIAfpyuQbjQfrg1KlfQBR3DmS9G3cJkyciWS
 1ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nEol4cg4fgvYnjxLbZL4ZZXX5iG5npgMKo8J5imOzG8=;
 b=Cdp8j5N03eTJBNTNpUtpnRR0sYYTOOmWXiG5DMGM18fby/6905mrxa/5ohXZLCXxk8
 3M4UXXfG/FaWhdbD5aqHKxQefWJWVyHR+28yvW0CWyxOqTBFIGJOncBin+QJOmtJ+/sa
 kcP5Vn8Axtd7biP0C6mQBKwQ6gkgmRTlTNcNGXfe13g0effxhM5FBEQaldAnp3626ZMc
 ysciILcoa26g5G4ygLXTSx3yy2f/3IdvqTYDBxaiAcndSCZL6X1kffJ/NvWVA99S5EJy
 ejL0VMy6KEhfg085ez9rS7r1psXym/2nbTleG0GCwtRTu+jnBxKH9ZSdGcm5xvMxqpjE
 TkoA==
X-Gm-Message-State: AOAM532dqRnojqNv2GuZR7FQPbfabQA3a9RDj5tQTK8XfHubo7LMtkUn
 OgL5YU76eNG2J02QMAa3d13NctCS
X-Google-Smtp-Source: ABdhPJzj54leH9G5iKBA/zYgqNMa7RQaCOX/mGUoo3HpPpgcSaU7as8b6XNMoZ8WlhhRsu+rBzAbKw==
X-Received: by 2002:a17:90b:692:: with SMTP id
 m18mr1788644pjz.56.1595735536760; 
 Sat, 25 Jul 2020 20:52:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id p1sm3638860pjp.10.2020.07.25.20.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 20:52:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/3] powerpc/pseries: Use doorbells even if XIVE is
 available
Date: Sun, 26 Jul 2020 13:51:54 +1000
Message-Id: <20200726035155.1424103-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200726035155.1424103-1-npiggin@gmail.com>
References: <20200726035155.1424103-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
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

Tested-by: Cédric Le Goater <clg@kaod.org>
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

