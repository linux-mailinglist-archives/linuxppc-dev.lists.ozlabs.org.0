Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F634F631
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 16:31:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WHzq2q2mzDqpr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 00:31:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Upg7baEO"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGL95kyczDqZy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:17:05 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bh12so4344604plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QilO/3K3IMNDgTxDpvjFtsPMpr+rQY/bfdmIvHgxv/0=;
 b=Upg7baEOghKQplWytQb+P1YG0+N+M00END6wJp/15eGbI/ToA4mq/O52vzBd4Fz7FO
 G8F2ZaVQTgEcO7DS3PnPsjVMBLBQm2FrZ9NqtxXjimQ3NxXfBbmOhqUcgnDdZ5Ma1hLT
 82gpLSk9noD4E/MWoPQD5lMtbXp7j+7m/P0e+YMDZahRlLv6+pZ28pP+UvgChpm7eSiX
 67QC9uIftAXDGtSODvIHd+zFDenR/Rwic4DXXylq9/Y+iiHhkX+UEw8LwcasUP9Zmj4Q
 WmmILDPE97ySiNwvjZuUP2knRCf3cfhc4G9/DugIEIoFXDIq2xqAESMkpnCpi6kPtlXx
 ha7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QilO/3K3IMNDgTxDpvjFtsPMpr+rQY/bfdmIvHgxv/0=;
 b=DPT1au1YEtp6sDkXvGMqqaCy5v0u0v4sB0VT9aRmv7BX/UhSY2zSVVdTIAetD7UpFY
 9+kGA8x3tx0NG/Ea7TnPMTwaLmqP1+cqn0HH7Om5adJhgfff4G8KkoBUtp6tRa6Z+FTp
 1tWvl1z+6ouvlhI0TDEaGZkeYDhy5jjPyQVy3WyXlnFIkU3T9FVYXb8PwN9qglasd7av
 2SGF4kA5+wN0Fh6Uja+XMVEbFoj94QMWIIXorm3QCpH+ZBcMCkSG1amnb95tv7aZF/Dn
 3PhnJMjPz3knxUPBe4BmvBDPPk7Kis4Pcn/T12duoe4+qEvTxAznLJ9U1Wz/v+voZgjU
 OWSA==
X-Gm-Message-State: APjAAAUusmb1DbTvnAcilZkmY7/D98jrASam5N+3Oby0y/2R2QcCn3aI
 eKcWYxn3oVoMnadfJ2g4XBhUpxANP04=
X-Google-Smtp-Source: APXvYqwUbyFlboCoinR+gyrwpRwfXEIiTK4SdoOVHpL2q5s95+vUmYAmijoJ63QoB+k/4WHEJL1WFw==
X-Received: by 2002:a17:902:e01:: with SMTP id 1mr6800303plw.268.1561209423613; 
 Sat, 22 Jun 2019 06:17:03 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.17.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:17:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 23/25] powerpc/64s/exception: generate regs clear
 instructions using .rept
Date: Sat, 22 Jun 2019 23:15:33 +1000
Message-Id: <20190622131535.20996-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622131535.20996-1-npiggin@gmail.com>
References: <20190622131535.20996-1-npiggin@gmail.com>
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

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 29 +++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 391ffa0f53be..144cc9b063ef 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2010,12 +2010,11 @@ BEGIN_FTR_SECTION
 	mtmsrd	r10
 	sync
 
-#define FMR2(n)  fmr (n), (n) ; fmr n+1, n+1
-#define FMR4(n)  FMR2(n) ; FMR2(n+2)
-#define FMR8(n)  FMR4(n) ; FMR4(n+4)
-#define FMR16(n) FMR8(n) ; FMR8(n+8)
-#define FMR32(n) FMR16(n) ; FMR16(n+16)
-	FMR32(0)
+	.Lreg=0
+	.rept 32
+	fmr	.Lreg,.Lreg
+	.Lreg=.Lreg+1
+	.endr
 
 FTR_SECTION_ELSE
 /*
@@ -2027,12 +2026,11 @@ FTR_SECTION_ELSE
 	mtmsrd	r10
 	sync
 
-#define XVCPSGNDP2(n) XVCPSGNDP(n,n,n) ; XVCPSGNDP(n+1,n+1,n+1)
-#define XVCPSGNDP4(n) XVCPSGNDP2(n) ; XVCPSGNDP2(n+2)
-#define XVCPSGNDP8(n) XVCPSGNDP4(n) ; XVCPSGNDP4(n+4)
-#define XVCPSGNDP16(n) XVCPSGNDP8(n) ; XVCPSGNDP8(n+8)
-#define XVCPSGNDP32(n) XVCPSGNDP16(n) ; XVCPSGNDP16(n+16)
-	XVCPSGNDP32(0)
+	.Lreg=0
+	.rept 32
+	XVCPSGNDP(.Lreg,.Lreg,.Lreg)
+	.Lreg=.Lreg+1
+	.endr
 
 ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_206)
 
@@ -2043,7 +2041,12 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
  * To denormalise we need to move a copy of the register to itself.
  * For POWER8 we need to do that for all 64 VSX registers
  */
-	XVCPSGNDP32(32)
+	.Lreg=32
+	.rept 32
+	XVCPSGNDP(.Lreg,.Lreg,.Lreg)
+	.Lreg=.Lreg+1
+	.endr
+
 denorm_done:
 	mfspr	r11,SPRN_HSRR0
 	subi	r11,r11,4
-- 
2.20.1

