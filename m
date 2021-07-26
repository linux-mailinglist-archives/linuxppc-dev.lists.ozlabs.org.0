Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD83D5187
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:18:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY4rL4mJMz3bmd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:18:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=J9UAVKl0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J9UAVKl0; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY4qY1B3Rz308c
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:17:44 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso17775731pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9tUkl3HG0gUKmz0bsIiU7kOzOvGSDmjH4rbPuk0kHc=;
 b=J9UAVKl0Vmsb/nZEcPpbxg59u8MKON9Ts8yVqwiF6FCNd3uZNGAGtUfGw7xO1voihX
 dwt7i6Uq2yQ4bPcUil7P6Af3VfKxFWGBJ9hVpqmbWAGnsrpq2AxovXOyI4ymCNnoEQk8
 WogIVdwCAL/htYPK9yeXTvhO9awBXFPnunRpab39Y2CEx7ww6oXnUBDb28MLjx8TX0BU
 h/QE7RullMNCfZ2Yb9NkHZADWhPA6pdctN1THoxJ7Mq3UO18XUk3O8zlfnKGZrXap5w+
 yd1pzvdLpluNZ0YoncbEFXMPw3jkBrMM5ClIpqWIA8V8E4HAAC2xbWQD6c3MhCdOKXha
 rpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9tUkl3HG0gUKmz0bsIiU7kOzOvGSDmjH4rbPuk0kHc=;
 b=IQOvWtHhrEo6vSjDVyLsbWl8xWvohSSO9LnHRYdbP3uZtWlJkjMP5eqXFu3wJWGrnb
 j6zSOCtmsCvqvTh/JvpBtM0ankseJZa5dcdpKka1ED8p+ug/hYU79S1Wp1QVhfQsaxaW
 Q2PrhijTlnHVrQyvYK1c7Sn2fRB7FxBqnEo+Yz5YTqgfyafyT47qFCzMznCL8MXFe067
 RSU2CocxD7OiFGgM/97wpGtH/XKQTgz65q69HnTfwauq4Lz8GMKHNPwMSCs6eO9CO8CQ
 V+awgtYr1MODEQMn9hc2wJlBJG5GHck7Fxu0JudMHgCGzVrrS73hgX0dMY0KKD2hqc61
 zXSw==
X-Gm-Message-State: AOAM532pAkJ4ym2HncUSX9PaiEOnoRwZB5DAwlNEBT5mb72LLNG33Uwv
 L/YNsEtW7CQcHcAIytQ993aNQ4tKSUQ=
X-Google-Smtp-Source: ABdhPJxCgDx4OBt3CYZNQAxty3Rj9VhXBhV5UtBD0fqulyaw3vluohIh5KrII7p9hKopFSwHNrTACQ==
X-Received: by 2002:aa7:848e:0:b029:333:4742:edb3 with SMTP id
 u14-20020aa7848e0000b02903334742edb3mr15784489pfn.12.1627269461316; 
 Sun, 25 Jul 2021 20:17:41 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id 10sm39123026pjc.41.2021.07.25.20.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:17:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: Rename CPU_FTR_POWER9_DD2_1 to
 CPU_FTR_P9_STOP_FIXED
Date: Mon, 26 Jul 2021 13:17:30 +1000
Message-Id: <20210726031730.729934-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726031730.729934-1-npiggin@gmail.com>
References: <20210726031730.729934-1-npiggin@gmail.com>
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

CPU feature flags work best when they are named for behaviour, not for
the CPU variant that first introduced them. Later revisions might also
contain the behaviour, for example. It's confusing for a POWER9 DD2.2
to have CPU_FTR_POWER9_DD2_1, but it's not confusing if DD2.1 and DD2.2
both have CPU_FTR_P9_STOP_FIXED.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/cputable.h   | 8 ++++----
 arch/powerpc/platforms/powernv/idle.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 46bae9624784..cb9948f318f7 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -186,7 +186,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_DAWR			LONG_ASM_CONST(0x0000008000000000)
 #define CPU_FTR_DABRX			LONG_ASM_CONST(0x0000010000000000)
 #define CPU_FTR_PMAO_BUG		LONG_ASM_CONST(0x0000020000000000)
-#define CPU_FTR_POWER9_DD2_1		LONG_ASM_CONST(0x0000080000000000)
+#define CPU_FTR_P9_STOP_FIXED		LONG_ASM_CONST(0x0000080000000000)
 #define CPU_FTR_P9_TM_HV_ASSIST		LONG_ASM_CONST(0x0000100000000000)
 #define CPU_FTR_P9_TM_XER_SO_BUG	LONG_ASM_CONST(0x0000200000000000)
 #define CPU_FTR_P9_TLBIE_STQ_BUG	LONG_ASM_CONST(0x0000400000000000)
@@ -436,11 +436,11 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_POWER9_DD2_0 (CPU_FTRS_POWER9 | CPU_FTR_P9_RADIX_PREFETCH_BUG)
 #define CPU_FTRS_POWER9_DD2_1 (CPU_FTRS_POWER9 | \
 			       CPU_FTR_P9_RADIX_PREFETCH_BUG | \
-			       CPU_FTR_POWER9_DD2_1)
-#define CPU_FTRS_POWER9_DD2_2 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
+			       CPU_FTR_P9_STOP_FIXED)
+#define CPU_FTRS_POWER9_DD2_2 (CPU_FTRS_POWER9 | CPU_FTR_P9_STOP_FIXED | \
 			       CPU_FTR_P9_TM_HV_ASSIST | \
 			       CPU_FTR_P9_TM_XER_SO_BUG)
-#define CPU_FTRS_POWER9_DD2_3 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
+#define CPU_FTRS_POWER9_DD2_3 (CPU_FTRS_POWER9 | CPU_FTR_P9_STOP_FIXED | \
 			       CPU_FTR_P9_TM_HV_ASSIST)
 #define CPU_FTRS_POWER10 (CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | CPU_FTR_ARCH_206 |\
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 528a7e0cf83a..1e908536890b 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -650,7 +650,7 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 	}
 #endif
 
-	if (!cpu_has_feature(CPU_FTR_POWER9_DD2_1)) {
+	if (!cpu_has_feature(CPU_FTR_P9_STOP_FIXED)) {
 		 /*
 		  * POWER9 DD2 can incorrectly set PMAO when waking up
 		  * after a state-loss idle. Saving and restoring MMCR0
@@ -717,7 +717,7 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 		 * might have been corrupted and needs flushing. We also need
 		 * to reload MMCR0 (see mmcr0 comment above).
 		 */
-		if (!cpu_has_feature(CPU_FTR_POWER9_DD2_1)) {
+		if (!cpu_has_feature(CPU_FTR_P9_STOP_FIXED)) {
 			asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT);
 			mtspr(SPRN_MMCR0, mmcr0);
 		}
-- 
2.23.0

