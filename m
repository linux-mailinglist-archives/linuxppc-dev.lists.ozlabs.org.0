Return-Path: <linuxppc-dev+bounces-4318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 127B59F64E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 12:32:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCs384dmPz30TC;
	Wed, 18 Dec 2024 22:32:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734521524;
	cv=none; b=L8nNS+SmwYNoFJ1m+L+QLYZSHX7uOCN1NKOqGwRoD4Pnx2Mgc9+ptM04pY7+PUUbfwgP+aEed+SgfjcHRBj1TQLZCz+FFZft/FC6TIWbTrL/pfLMBrD4KM3bwr9hbHcpuGGzrARd4yvf/K5WbqopIslXpzyEt5ydgtUnK+22VIIpYhUBJVnbiuYkwwAJ5xk2cKWuSXH2jmxMzRx2K8v7X8upDQWYsgPXOwyFBJWX2iE7BBEiz4YQ3EptI3rDLWsyMxLIheF7QmduLzeZulG0dK66ADUKILVY/zJQ6EZ9Z8X1rDtEELZMD4mIVf6+NUEjPYrHk7n+KSMR1tG46/DB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734521524; c=relaxed/relaxed;
	bh=Qkrpy5tCcBy4B49DXo5zzwTbf8eYgl69lnVbuF6FTbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mFuH8b6eozrpC2zQ2OACNAzi5BFBpVxT5YW5mUcP/fMOHH0bjp7p/gBC8jTFSdjhQz1SUIAK/nARq5jeRgumGPHS5p7RlwjLiqcqTYCzWfTMDPkhylneFzatOoHPJIlfFmiVoZ7LJrE39UmmUQMxhvGSS/k/ALG2crGvS1QoR05zi2EpKGnOoKYu1LLkvZG2xY6COL92WgYXcpYkIeXuXzgAPcWx/yJRL5UZn5DYNZxGiyoMg25Es+pI9TLTo54aRVX9tqk2XRBK40tLvxe+YT0TfxkeKdh6aoWnInlGvfhXA6B7JMiyZf4Dcdq69iQKSvBuUGLvFHomfA3uwTWrpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gI+zVDKM; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gI+zVDKM;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCs3719nTz30T2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 22:32:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734521518;
	bh=Qkrpy5tCcBy4B49DXo5zzwTbf8eYgl69lnVbuF6FTbo=;
	h=From:To:Cc:Subject:Date:From;
	b=gI+zVDKMKKQaNy+LfXrXRfqNbFC1StuxLL7i/W5CNxvrwDAE5ajw/2VQkc4hNInwX
	 bQBrI2iwYivL4g+s/h7w+SjDUL1mdR0Rmgy7yR8vOucg7rPOHzGontvAV6sUu1nK/G
	 IhuAOAN4HNCYlv/VIq78Ifu6A3cl0+pbr+fCKq3pPpieOreVF8gDcqf4toHUe2lEi1
	 w7swTx3r5w4AG6xqzi5q5o7HmFP3+PWz266gKTl93ft5tsXeSQnXLEphwPsbifpIft
	 UETEQjtBC7XZHiEmBjYhlTyVCpRsk0oirmP3sU3HS+FkEdwd5zWw4kHIKGxerADwp2
	 spY6C93BdHnUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCs3201HKz4wc2;
	Wed, 18 Dec 2024 22:31:57 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH] powerpc/prom_init: Use IS_ENABLED()
Date: Wed, 18 Dec 2024 22:31:59 +1100
Message-ID: <20241218113159.422821-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URI_HEX autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use IS_ENABLED() for the device tree checks, so that more code is
checked by the compiler without having to build all the different
configurations.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom_init.c | 39 ++++++++++++---------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 8e776ba39497..57082fac4668 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2792,7 +2792,6 @@ static void __init flatten_device_tree(void)
 		    dt_struct_start, dt_struct_end);
 }
 
-#ifdef CONFIG_PPC_CHRP
 /*
  * Pegasos and BriQ lacks the "ranges" property in the isa node
  * Pegasos needs decimal IRQ 14/15, not hexadecimal
@@ -2843,11 +2842,7 @@ static void __init fixup_device_tree_chrp(void)
 		}
 	}
 }
-#else
-#define fixup_device_tree_chrp()
-#endif
 
-#if defined(CONFIG_PPC64) && defined(CONFIG_PPC_PMAC)
 static void __init fixup_device_tree_pmac64(void)
 {
 	phandle u3, i2c, mpic;
@@ -2887,11 +2882,7 @@ static void __init fixup_device_tree_pmac64(void)
 	prom_setprop(i2c, "/u3@0,f8000000/i2c@f8001000", "interrupt-parent",
 		     &parent, sizeof(parent));
 }
-#else
-#define fixup_device_tree_pmac64()
-#endif
 
-#ifdef CONFIG_PPC_PMAC
 static void __init fixup_device_tree_pmac(void)
 {
 	__be32 val = 1;
@@ -2911,11 +2902,7 @@ static void __init fixup_device_tree_pmac(void)
 		prom_setprop(node, NULL, "#size-cells", &val, sizeof(val));
 	}
 }
-#else
-static inline void fixup_device_tree_pmac(void) { }
-#endif
 
-#ifdef CONFIG_PPC_EFIKA
 /*
  * The MPC5200 FEC driver requires an phy-handle property to tell it how
  * to talk to the phy.  If the phy-handle property is missing, then this
@@ -3047,11 +3034,7 @@ static void __init fixup_device_tree_efika(void)
 	/* Make sure ethernet phy-handle property exists */
 	fixup_device_tree_efika_add_phy();
 }
-#else
-#define fixup_device_tree_efika()
-#endif
 
-#ifdef CONFIG_PPC_PASEMI_NEMO
 /*
  * CFE supplied on Nemo is broken in several ways, biggest
  * problem is that it reassigns ISA interrupts to unused mpic ints.
@@ -3127,17 +3110,23 @@ static void __init fixup_device_tree_pasemi(void)
 
 	prom_setprop(iob, name, "device_type", "isa", sizeof("isa"));
 }
-#else	/* !CONFIG_PPC_PASEMI_NEMO */
-static inline void fixup_device_tree_pasemi(void) { }
-#endif
 
 static void __init fixup_device_tree(void)
 {
-	fixup_device_tree_chrp();
-	fixup_device_tree_pmac();
-	fixup_device_tree_pmac64();
-	fixup_device_tree_efika();
-	fixup_device_tree_pasemi();
+	if (IS_ENABLED(CONFIG_PPC_CHRP))
+		fixup_device_tree_chrp();
+
+	if (IS_ENABLED(CONFIG_PPC_PMAC))
+		fixup_device_tree_pmac();
+
+	if (IS_ENABLED(CONFIG_PPC_PMAC) && IS_ENABLED(CONFIG_PPC64))
+		fixup_device_tree_pmac64();
+
+	if (IS_ENABLED(CONFIG_PPC_EFIKA))
+		fixup_device_tree_efika();
+
+	if (IS_ENABLED(CONFIG_PPC_PASEMI_NEMO))
+		fixup_device_tree_pasemi();
 }
 
 static void __init prom_find_boot_cpu(void)
-- 
2.47.1


