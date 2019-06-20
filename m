Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C204C717
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:05:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Trrz2T96zDq9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:05:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KI49yzfw"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqlt13cxzDqvT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:54 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id s27so938123pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=exSfd2K3G4C2W55JoinF/Gji/GVlpxwvguGIM2vAzL8=;
 b=KI49yzfw8lMOXKEHE1QTI9Ocq8CsDS7A0frWxBBOsr6XW9YP+NNmLRXh9OGQ+0npUj
 0y0ubFikHubizM4AJT6bcC5BazcMhdbTWVPJ6z/A+wzPYWRv5O3wvSekBgVzuh6Yy+Yf
 5o7pJIQdH/hgoOywAquafVRKLudtcZ06LGXzvOUXyq6sTa8DxoqB1NQCue597m70DYpf
 kRijjRGrqKM7sHMuAyWbF1Fqx6WZtL495eDq/kUgBYziTkw1j+4ZcOKLqkbHij7RBAGe
 oTgOkqSxRfx4f/DDSD9XqK1P6R7x7cImYsFFhqUWAYCm8V85ieBzuBXH6DjCtM+K835o
 2F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=exSfd2K3G4C2W55JoinF/Gji/GVlpxwvguGIM2vAzL8=;
 b=CYP2Z9/dJcsPPMMUufml8DWq8rHVA/sgmpM016+u3KfwLOksOZ5rRV6U01RLSajCOG
 vv316TYddeO7UjMJ3/XNZd6J9u4y7XX3xLfnDxGunIxmvNI4duEUG7pKb+n13Td1sNF2
 8e/Moh9QtiCz3OO9k5JP/DC23LVZqPrgmrDfo9JDCd7TBpy5loXqdngS1+STCiyx3WvM
 6XyL4UvR4GRKf0Sdt3ScVfOhmPwhAQMRXoXkZZV4QjcgK5xIvrftOH0RRUj/ZFONV7GU
 r5N/0egM+hOwVEPtN5PljyLjlvqkOdmMXn2htC2XL+W1/MWkfo3dlIJ8OOR2Un8qawKu
 2udg==
X-Gm-Message-State: APjAAAV7yj4Q2L8ikN2/4IBBCepPkYh+9DnuTE6rr5UseFfw3qbx81Pi
 s6vgG5a64oIeiD9YXxT4MeISeC9O
X-Google-Smtp-Source: APXvYqzMuG8nVVJGlePbu6ADzJoC8hwge5iOaLYnTS1OjI4HQmS370nVU5yQqRJyIdo7DXYh3pkkXg==
X-Received: by 2002:a63:5d61:: with SMTP id o33mr11295027pgm.114.1561007750987; 
 Wed, 19 Jun 2019 22:15:50 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 24/52] powerpc/64s/exception: generate regs clear
 instructions using .rept
Date: Thu, 20 Jun 2019 15:14:31 +1000
Message-Id: <20190620051459.29573-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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
index 02b4722b7c64..0a2b4e8b02b0 100644
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

