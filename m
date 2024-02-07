Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CCC84C34D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 04:53:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j/6Rzf2S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TV5nC0ZrDz3cPd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 14:53:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j/6Rzf2S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TV5mP2tJjz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 14:52:36 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6e125818649so62476a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Feb 2024 19:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707277953; x=1707882753; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4A1AgCuiO2H1snsJBD2hb/LtLS7ShogAO5jmZ/U/8Y=;
        b=j/6Rzf2SkIqvPaxwdyzcg3KGFM6k40anLt0u9TfXM631X21yRXM1wphiI6kXppmQ+Z
         zhFF5kpUPtwoW0qWPet9Bz4w2PiFK/1k5sh7/gWIzdVIOSFTJP4Y9gXSWLTGly3Akjci
         G2C/DegBTFNiqd1yPLOiksBb3EfjuMeBAhcNmPa5OZPxyBOZATd7vW/ozGW82u1DjkOx
         CF1G+R8pf5MXTU7IYq4oojvgMqFZmRYbohkypeRaTs6KyFbv5KOPauauUD6A3+vVCQkm
         F3fuv1S3QKIHoEgPKOx/rBUB4g44o2fSui17W7Eq1r1n0llNGrmXj6xkUwg9ovlCkFM7
         59aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707277953; x=1707882753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4A1AgCuiO2H1snsJBD2hb/LtLS7ShogAO5jmZ/U/8Y=;
        b=Vq9OYGb3g7WVBuX9+4t5zH67vIvC8NBHlV6QN0yB460hsDckOmKERdswEgvqahjPh4
         N9QzDpgrH13XxfonoJc6edx21CFWVcMUnNAyQU1wAN6YRRxYKx6Ve4Trq6u9f32HzT7d
         DdhBsSUspDjvbsESXIfgHZx575BrnXAmUu3nqCroo9gVZrMg5/n98NXj0/xE57MzmPsA
         CEsSNbDKNbavYKoKo/N/4SU+yEq7y4zM+uc7i0pGevgl6/725OUxC9svq4yhavVfB7rt
         cCUS7oUr5oLB2KsdjsSo3r1hViseZ9jKsa6v0u9m1CGtSOgI5IVey4iZpQfKsn3WTUlM
         Up5w==
X-Gm-Message-State: AOJu0Yw0J2k4dvblDMVH+Z+vvatDUFbNSsH+jFopTz9qW+63aQaK8Ijm
	VmV+2tFKlzbD4K8s1iOcNZ3i+JkxR/z7qSk1RR4EgQUH/r8oIw6ZWDGXDIY8
X-Google-Smtp-Source: AGHT+IGhIoBJrwHtZVoK8x5NHmUGiFe4sp2PSx6xL+yUTXsXKbXni+IA3iHMZqbYON4wnT1JdCFCFg==
X-Received: by 2002:a05:6359:4294:b0:178:756b:6bcb with SMTP id kp20-20020a056359429400b00178756b6bcbmr1830716rwb.27.1707277952958;
        Tue, 06 Feb 2024 19:52:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTFt8KxoCpX+xjT6IC4Inhdm92FkeD6+co+dCc+G28MY7qPHd+Pr29patSOJ6Yvt9WCxMRIeFcKxe89bebegdX2GS4amE=
Received: from wheely.local0.net (220-235-217-21.tpgi.com.au. [220.235.217.21])
        by smtp.gmail.com with ESMTPSA id it7-20020a056a00458700b006e02da39dbcsm325317pfb.10.2024.02.06.19.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 19:52:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/pseries: Set CPU_FTR_DBELL according to ibm,pi-features
Date: Wed,  7 Feb 2024 13:52:19 +1000
Message-ID: <20240207035220.339726-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240207035220.339726-1-npiggin@gmail.com>
References: <20240207035220.339726-1-npiggin@gmail.com>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR will define a new ibm,pi-features bit which says that doorbells
should not be used even on architectures where they exist. This could be
because they are emulated and slower than using the interrupt controller
directly for IPIs.

Wire this bit into the pi-features parser to clear CPU_FTR_DBELL, and
ensure CPU_FTR_DBELL is not in CPU_FTRS_ALWAYS.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/cputable.h | 11 ++++++-----
 arch/powerpc/kernel/prom.c          |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 8765d5158324..48471ca388dd 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -542,19 +542,20 @@ enum {
 #define CPU_FTRS_DT_CPU_BASE	(~0ul)
 #endif
 
+/* pseries may disable DBELL with ibm,pi-features */
 #ifdef CONFIG_CPU_LITTLE_ENDIAN
 #define CPU_FTRS_ALWAYS \
-	    (CPU_FTRS_POSSIBLE & ~CPU_FTR_HVMODE & CPU_FTRS_POWER7 & \
-	     CPU_FTRS_POWER8E & CPU_FTRS_POWER8 & CPU_FTRS_POWER9 & \
-	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & \
+	    (CPU_FTRS_POSSIBLE & ~CPU_FTR_HVMODE & ~CPU_FTR_DBELL & \
+	     CPU_FTRS_POWER7 & CPU_FTRS_POWER8E & CPU_FTRS_POWER8 & \
+	     CPU_FTRS_POWER9 & CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & \
 	     CPU_FTRS_POWER10 & CPU_FTRS_DT_CPU_BASE)
 #else
 #define CPU_FTRS_ALWAYS		\
 	    (CPU_FTRS_PPC970 & CPU_FTRS_POWER5 & \
 	     CPU_FTRS_POWER6 & CPU_FTRS_POWER7 & CPU_FTRS_CELL & \
 	     CPU_FTRS_PA6T & CPU_FTRS_POWER8 & CPU_FTRS_POWER8E & \
-	     ~CPU_FTR_HVMODE & CPU_FTRS_POSSIBLE & CPU_FTRS_POWER9 & \
-	     CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & \
+	     ~CPU_FTR_HVMODE & ~CPU_FTR_DBELL & CPU_FTRS_POSSIBLE & \
+	     CPU_FTRS_POWER9 & CPU_FTRS_POWER9_DD2_1 & CPU_FTRS_POWER9_DD2_2 & \
 	     CPU_FTRS_POWER10 & CPU_FTRS_DT_CPU_BASE)
 #endif /* CONFIG_CPU_LITTLE_ENDIAN */
 #endif
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 62f4a0229fae..e3e8fe70475f 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -196,6 +196,7 @@ static struct ibm_feature ibm_pa_features[] __initdata = {
  */
 static struct ibm_feature ibm_pi_features[] __initdata = {
 	{ .pabyte = 0, .pabit = 3, .mmu_features  = MMU_FTR_NX_DSI },
+	{ .pabyte = 0, .pabit = 4, .cpu_features  = CPU_FTR_DBELL, .clear = 1 },
 };
 
 static void __init scan_features(unsigned long node, const unsigned char *ftrs,
-- 
2.42.0

