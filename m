Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 581963D124
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:41:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NZ4F6cWjzDqlF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:41:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ia6LkQu7"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZk2qkczDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:38 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id k187so6588523pga.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ZohxcGAOpxr81TQBWFmgDgE2FlhwqbedXGDd7IXfUk=;
 b=Ia6LkQu7QiUNZf62a91h7ArkP6rMncaQyT19pQbzwmfddwi3j5wiqymqYVLBM00Jq1
 kwHZ+YY5hrXTEExD0ezpTiPEY3o3WqlBTf98z100SO32U6sfSyUPoiiHWdE0spPpX4ZG
 xzWE5PsPzu/aYTUlgOuKmdXm+IIBQ9774YiNqH415wnmROVMVfzGGeSdgeWVrqn8b898
 CSCdZtjWsVLV2ZkZ5PqjV3aldKYhA4EjBj6IyyYqigR0AtnDnCBjoGcQLUp4m+Izlow6
 ucOtzxefc2MurfuK9yCmh2Ezng5xloY+XgJRjs/gVADYOtXid/i7N9H5bB5Q1bVIypeW
 3IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZohxcGAOpxr81TQBWFmgDgE2FlhwqbedXGDd7IXfUk=;
 b=osn692sIssShid7VUFSO0HO/wEoUyLt7Tvvu1YUkq8RW5T0+LABukSbzRgirU64bq7
 mx+muED/G/EPi6Ew/GyFN/k5wRnmsqFNwMALm0XCHUILhO0+gPUJaunCO+TPavAh0FMZ
 Rpo3QcRTB5AlZAEIw15/UbX4UyDFxruszZcvPLSSRkoaPN2GIQOW9of/Aqx6A96H7c70
 YHJl43hW+8G+lw/fAMov3LqiS4grtOM8W018J76f0bTKUR+b8h5ypHK1DexCdsYzEYyH
 UY8r867flR1nRnnKxEcnBi8X4jreH3rD64j3+Sf/lq23h9WwvN3fGEYXX/tA+ZQPjMZx
 IQiQ==
X-Gm-Message-State: APjAAAUL+4CBFx8Pq+JEvFhnyivQjXG6Bgcwuu8V8NWuqnRs9bi/Gl7C
 WxcCbJhe6K2AoK7x9NORtsTzFSky
X-Google-Smtp-Source: APXvYqzOAhiY0OVXtq9r+ii2/+7Gu3z5Hhbgkh1dcqQdVoC9ds1NBKv2F/QR5Vd05tRtjb9eJjsN1Q==
X-Received: by 2002:a62:188d:: with SMTP id 135mr76331384pfy.222.1560263676467; 
 Tue, 11 Jun 2019 07:34:36 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 23/28] powerpc/64s/exception: generate regs clear instructions
 using .rept
Date: Wed, 12 Jun 2019 00:30:35 +1000
Message-Id: <20190611143040.7834-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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
index a0721c3fc097..ce7aad9d3840 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2018,12 +2018,11 @@ BEGIN_FTR_SECTION
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
@@ -2035,12 +2034,11 @@ FTR_SECTION_ELSE
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
 
@@ -2051,7 +2049,12 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
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

