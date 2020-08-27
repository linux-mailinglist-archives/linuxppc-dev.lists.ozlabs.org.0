Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD9C253C61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 05:57:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcTSx5WNRzDqSw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 13:57:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aBcQgjwB; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTR110mkzDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 13:55:40 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id g1so2369626pgm.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 20:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gZVQBjfpxyC1dFVuo7iaEtdXbvjEDAi24MFG98GqBk8=;
 b=aBcQgjwBjroG15JCYpG4rTl/jvQfwZnv3whfEwCl/rIQFiisRT8eMcsXhy9E9W7Jaa
 e0+oQDONGJE9NQT+gmnEECIQOhxNatMdsz+pQrD9v7NvieX1OjqO/K+pACu0hiuo71AG
 XUmnWg8TFMHrUH3POcZuJvKPRPqRkCcUKyT2r+omGiza072RPzXLNgEeX1/WRTJUuZng
 jsvWteryuCFUiWk0WnsS6N/hMfVrAP/TYx9TXuFOI3YrnilkL3xRMuGi7gxwdQO+YdMw
 0TWtybz2WZoxZbx2+ZqwDU9lK3BsOedu6i9OM2CnleczaVa+lhKF9aKPcE+hlg86u1l0
 FmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gZVQBjfpxyC1dFVuo7iaEtdXbvjEDAi24MFG98GqBk8=;
 b=qnnMRX7U6BVFS1pKfwBPN3Ed3X6+1bphxqxHLHBtwXZSbmbnLPoB7XDRnFXu9Ekfkx
 XbTU9l098nQDxt1bIbbAlFv1E8NKKyZC4GFqbwzbXyOCum4Xh3NxahqVrEz31WQ9VJ1t
 B3oPKHDRTWbXLXA9pDoSRPtkPVxuXAA5T9SyGPIJzmx1kZjC01NXE1nzxJF9QfvMRpF7
 1BdH/8AKAu9KsmTF/P0ki07fWgVvl+YumQFTbdtKWwBlU8X1nCdAOfjhGhVkQ92Q7RwE
 dANJL8TaNG2tqsTnGr7M13EvGpvO2jv1ZceLgaPsLwjjMwh3Ldm1/rgfegjqz0fEXZ9f
 urHQ==
X-Gm-Message-State: AOAM533lbV01d3NFEIL4bt6xBwI+0wLSiwpWIOxfCrrskPeLyLhlukwo
 GMyZIWWUxDm+28evXrgDaK2ir5iEres=
X-Google-Smtp-Source: ABdhPJxGkD7vNDOzhuwHA5HplX67fJl7+E6tsTdezGGVpQJyReLd3mrSuLbuyBA2O+Kk3g7dlV9hRw==
X-Received: by 2002:aa7:959c:: with SMTP id z28mr14340714pfj.297.1598500537135; 
 Wed, 26 Aug 2020 20:55:37 -0700 (PDT)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id r28sm725962pfg.158.2020.08.26.20.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 20:55:36 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Remove TM from Power10 features
Date: Thu, 27 Aug 2020 13:55:29 +1000
Message-Id: <20200827035529.900-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA v3.1 removes transactional memory and hence it should not be present
in cpu_features or cpu_user_features2. Remove CPU_FTR_TM_COMP from
CPU_FTRS_POWER10. Remove PPC_FEATURE2_HTM_COMP and
PPC_FEATURE2_HTM_NOSC_COMP from COMMON_USER2_POWER10.

Fixes: a3ea40d5c736 ("powerpc: Add POWER10 architected mode")
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/cputable.h |  2 +-
 arch/powerpc/kernel/cputable.c      | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index fdddb822d564..5322fec6d413 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -478,7 +478,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
 	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
 	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
-	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
+	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
 	    CPU_FTR_DAWR | CPU_FTR_DAWR1)
 #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 2f10a874e849..23f9bb51edc3 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -123,9 +123,16 @@ extern void __restore_cpu_e6500(void);
 				 PPC_FEATURE2_DARN | \
 				 PPC_FEATURE2_SCV)
 #define COMMON_USER_POWER10	COMMON_USER_POWER9
-#define COMMON_USER2_POWER10	(COMMON_USER2_POWER9 | \
-				 PPC_FEATURE2_ARCH_3_1 | \
-				 PPC_FEATURE2_MMA)
+#define COMMON_USER2_POWER10	(PPC_FEATURE2_ARCH_3_1 | \
+				 PPC_FEATURE2_MMA | \
+				 PPC_FEATURE2_ARCH_3_00 | \
+				 PPC_FEATURE2_HAS_IEEE128 | \
+				 PPC_FEATURE2_DARN | \
+				 PPC_FEATURE2_SCV | \
+				 PPC_FEATURE2_ARCH_2_07 | \
+				 PPC_FEATURE2_DSCR | \
+				 PPC_FEATURE2_ISEL | PPC_FEATURE2_TAR | \
+				 PPC_FEATURE2_VEC_CRYPTO)
 
 #ifdef CONFIG_PPC_BOOK3E_64
 #define COMMON_USER_BOOKE	(COMMON_USER_PPC64 | PPC_FEATURE_BOOKE)
-- 
2.17.1

