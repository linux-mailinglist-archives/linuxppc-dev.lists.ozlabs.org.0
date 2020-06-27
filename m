Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96B20C2C6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 17:23:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vHZz63C3zDqq7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 01:23:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NwFXawil; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vH9W2fhQzDrC7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 01:05:03 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id 17so12018816wmo.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kKjARQ03ndtBunHG+YArm4iWSi4dwTWP+fpz+DgxMuw=;
 b=NwFXawilkcv2BQRhlUbfMcLhmnUkK4luAFmdnGg9lcwGDSTpy7ksdmnSNHkhEILiRC
 o10s0gQP6wwmwXDRs/78TsaoyjHfNp5NnKLagCBaXW5hCCJTAQIvozCynhQ0rR4Xp0bX
 CJEWAO2GjYkl/ZotvSEdQzsAzo1tLa/mPiS78YHZPAOGHCYYmY6LxMUAdVxlQ45Xj6kd
 vWn5r9sWPVF2f/JRBdGSGj9FeOtomF+CwCmIij9PSzyVO/8SyMDka6YkzWVLziMLC9RA
 UiC0GKvixfH2iD1X7lik/cHIOWPRRcINEgV8vWfWgS/eLslfTRjRa5WgxXPF//sma+FE
 yRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kKjARQ03ndtBunHG+YArm4iWSi4dwTWP+fpz+DgxMuw=;
 b=dm4YdCO253ojaP8j+y2Ea+xx4GoEKycT/Kb7mv2PhgmT1EC3enXOlxsm6Gcj619t/T
 MzhzcY6oAW0aW1MSsXdJF/KAjH4nNofFlQn/cSWWqfQk27WkwZV3h2j0TRxgIT33oTV6
 bAvOJlxiU85gSPYSPEBrKFh5rbyjsFebWk4c0msQjdgwaIkexDlepqA/XWK7dRjlrYdW
 oKXmATcX0+YYTenCiVD1a++cglrDCp8kzeM/+xFxI7DJBwC6B4uuZ5SdAlDltpKptfCp
 0FhEOF5ZVmRzrF504mk1eMfCCC3lf77yJ0asN1TlH58hNGFMxHveEt1Jp6z6yLAOn+dB
 8VeQ==
X-Gm-Message-State: AOAM5338prKa752Ho3G695kJcwNNLXT5LVxC2rWIdmF02eLIKDffVEbl
 dRjjG1W86l3IGtZqnlTC0paGyLN1
X-Google-Smtp-Source: ABdhPJxs41buRX66w8FWlHAeNx8wUzLejiTMpkAl2b421vaa4HNCCL1Zu88q6l61UOm4ARapXl2E3w==
X-Received: by 2002:a1c:a7c4:: with SMTP id q187mr8348741wme.0.1593270296380; 
 Sat, 27 Jun 2020 08:04:56 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id d132sm21722029wmd.35.2020.06.27.08.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 08:04:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/pseries: Add KVM guest doorbell restrictions
Date: Sun, 28 Jun 2020 01:04:28 +1000
Message-Id: <20200627150428.2525192-4-npiggin@gmail.com>
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

KVM guests have certain restrictions and performance quirks when
using doorbells. This patch tests for KVM environment in doorbell
setup, and optimises IPI performance:

 - PowerVM guests may now use doorbells even if they are secure.

 - KVM guests no longer use doorbells if XIVE is available.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/firmware.h       |  2 ++
 arch/powerpc/include/asm/kvm_para.h       | 26 ++--------------
 arch/powerpc/platforms/pseries/firmware.c | 14 +++++++++
 arch/powerpc/platforms/pseries/smp.c      | 38 ++++++++++++++---------
 4 files changed, 42 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 6003c2e533a0..4dadb84ff2b2 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -134,7 +134,9 @@ extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
 
 #ifdef CONFIG_PPC_PSERIES
 void pseries_probe_fw_features(void);
+bool is_kvm_guest(void);
 #else
+static inline bool is_kvm_guest(void) { return false; }
 static inline void pseries_probe_fw_features(void) { };
 #endif
 
diff --git a/arch/powerpc/include/asm/kvm_para.h b/arch/powerpc/include/asm/kvm_para.h
index 9c1f6b4b9bbf..744612054c94 100644
--- a/arch/powerpc/include/asm/kvm_para.h
+++ b/arch/powerpc/include/asm/kvm_para.h
@@ -8,35 +8,15 @@
 #ifndef __POWERPC_KVM_PARA_H__
 #define __POWERPC_KVM_PARA_H__
 
-#include <uapi/asm/kvm_para.h>
-
-#ifdef CONFIG_KVM_GUEST
-
-#include <linux/of.h>
-
-static inline int kvm_para_available(void)
-{
-	struct device_node *hyper_node;
-
-	hyper_node = of_find_node_by_path("/hypervisor");
-	if (!hyper_node)
-		return 0;
+#include <asm/firmware.h>
 
-	if (!of_device_is_compatible(hyper_node, "linux,kvm"))
-		return 0;
-
-	return 1;
-}
-
-#else
+#include <uapi/asm/kvm_para.h>
 
 static inline int kvm_para_available(void)
 {
-	return 0;
+	return IS_ENABLED(CONFIG_KVM_GUEST) && is_kvm_guest();
 }
 
-#endif
-
 static inline unsigned int kvm_arch_para_features(void)
 {
 	unsigned long r;
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index 3e49cc23a97a..f58eb10011dd 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -184,3 +184,17 @@ void __init pseries_probe_fw_features(void)
 {
 	of_scan_flat_dt(probe_fw_features, NULL);
 }
+
+bool is_kvm_guest(void)
+{
+	struct device_node *hyper_node;
+
+	hyper_node = of_find_node_by_path("/hypervisor");
+	if (!hyper_node)
+		return 0;
+
+	if (!of_device_is_compatible(hyper_node, "linux,kvm"))
+		return 0;
+
+	return 1;
+}
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 67e6ad5076ce..7af0003b40b6 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -236,24 +236,32 @@ static __init void pSeries_smp_probe(void)
 	if (!cpu_has_feature(CPU_FTR_SMT))
 		return;
 
-	/*
-	 * KVM emulates doorbells by disabling FSCR[MSGP] so msgsndp faults
-	 * to the hypervisor which then reads the instruction from guest
-	 * memory. This can't be done if the guest is secure, so don't use
-	 * doorbells in secure guests.
-	 *
-	 * Under PowerVM, FSCR[MSGP] is enabled so doorbells could be used
-	 * by secure guests if we distinguished this from KVM.
-	 */
-	if (is_secure_guest())
-		return;
+	if (is_kvm_guest()) {
+		/*
+		 * KVM emulates doorbells by disabling FSCR[MSGP] so msgsndp
+		 * faults to the hypervisor which then reads the instruction
+		 * from guest memory, which tends to be slower than using XIVE.
+		 */
+		if (xive_enabled())
+			return;
+
+		/*
+		 * XICS hcalls aren't as fast, so we can use msgsndp (which
+		 * also helps exercise KVM emulation), however KVM can't
+		 * emulate secure guests because it can't read the instruction
+		 * out of their memory.
+		 */
+		if (is_secure_guest())
+			return;
+	}
 
 	/*
-	 * The guest can use doobells for SMT sibling IPIs, which stay in
-	 * the core rather than going to the interrupt controller. This
-	 * tends to be slower under KVM where doorbells are emulated, but
-	 * faster for PowerVM where they're enabled.
+	 * Under PowerVM, FSCR[MSGP] is enabled as guest vCPU siblings are
+	 * gang scheduled on the same physical core, so doorbells are always
+	 * faster than the interrupt controller, and they can be used by
+	 * secure guests.
 	 */
+
 	ic_cause_ipi = smp_ops->cause_ipi;
 	smp_ops->cause_ipi = dbell_or_ic_cause_ipi;
 }
-- 
2.23.0

