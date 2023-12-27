Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB981ECE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 08:25:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RkEi5h89;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0NSt3kYyz30ht
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 18:25:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RkEi5h89;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0NS13fL7z2xcq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 18:24:17 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so3873474a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Dec 2023 23:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703661855; x=1704266655; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUsLGl0feOUdqm5eNMJSy02i1g3xWfsHVrashrU/qaM=;
        b=RkEi5h89WRL9ZC6T9qWxBj7rhrmml9aAxbSKgbHdq8Pm2AyLIFbhF1j1egCSt9cvZF
         RPhTKlAOLLgEtU32dIZ67vv1uxwIM3t/g9xZUIRcVbpdGjVeh5q2rA1gMhoCNFMvI0rT
         xmP9wdAhahfLlcd+eVm+k/aKDbufdEh5ZmYn1EBuvekBukODkV6UarJqKzOdXEVgYPFc
         X37Azat851EpdYElD3hQ89Zf3mfjYSY0zEXzYAiatrGkwpiNBCefTwh3jbjlncEIl/OD
         yW+Dm1hi498yYkjYz35E7lBYsj8eegXfR7EzEyV2LgOPsfSVlNol5s4Fz7CQxD4JKM/5
         iymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703661855; x=1704266655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUsLGl0feOUdqm5eNMJSy02i1g3xWfsHVrashrU/qaM=;
        b=rmE+GZvyaYla2z6O7M2Q39Qm6diykO1fv7QVD0yT0VThtgxueuPjYy2c5bCA0Bovwe
         7ztuXOZ9wAhK5yJFffP9APxgah30HMRju4ecUlvFU6/0tk448ESUFCcNwJmYOkI+xM+r
         M/SfPgF8c+tumRG+A4F/PkcJ7KZfXV4nanGE4D7X3Y2GxdjYOjF6DVX62kUL5zQRPkbf
         jjaD/D+33QePd9x8HDowwzb9fKGB9zNZTA8I3mmiqLbveVslr+j+K9BReW/wzsPVxb/d
         3Mh9ubZGQ2gEwxM3r1iXJ55H2xgdbZHQipbxXo9emB0nK4nklE9qROabafUCICQ6avdU
         2XJA==
X-Gm-Message-State: AOJu0YxdSqItjbrIXrUos/nMuJqSbgi9g/7G/xanwmfJdOhyANZwsJEt
	BPVFBspsVsOzF713H2KPTucoJ9SuXHI=
X-Google-Smtp-Source: AGHT+IHCC63pfaBXFvPMWft9UYYSM+xVDCIKpVSHZqOnfnQ7mQrGRt54mc4jW8zvFp3JUGvC9i6oHA==
X-Received: by 2002:a05:6a20:b99a:b0:18f:97c:8a1c with SMTP id ff26-20020a056a20b99a00b0018f097c8a1cmr7954170pzb.71.1703661855165;
        Tue, 26 Dec 2023 23:24:15 -0800 (PST)
Received: from wheely.local0.net ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id px9-20020a17090b270900b0028c952fd855sm261074pjb.52.2023.12.26.23.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 23:24:14 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/ps3: Fix lv1 hcall assembly for ELFv2 calling convention
Date: Wed, 27 Dec 2023 17:24:03 +1000
Message-ID: <20231227072405.63751-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231227072405.63751-1-npiggin@gmail.com>
References: <20231227072405.63751-1-npiggin@gmail.com>
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
Cc: Geoff Levand <geoff@infradead.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stack-passed parameters begin at a different offset in the caller's
stack in the ELFv2 ABI.

Reported-by: Geoff Levand <geoff@infradead.org>
Fixes: 8c5fa3b5c4df ("powerpc/64: Make ELFv2 the default for big-endian builds")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc_asm.h  |  6 ++++--
 arch/powerpc/platforms/ps3/hvcall.S | 18 +++++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index e7792aa13510..041ee2595520 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -201,11 +201,13 @@
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STK_GOT		24
-#define __STK_PARAM(i)	(32 + ((i)-3)*8)
+#define STK_PARAM_AREA	32
 #else
 #define STK_GOT		40
-#define __STK_PARAM(i)	(48 + ((i)-3)*8)
+#define STK_PARAM_AREA	48
 #endif
+
+#define __STK_PARAM(i)	(STK_PARAM_AREA + ((i)-3)*8)
 #define STK_PARAM(i)	__STK_PARAM(__REG_##i)
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
diff --git a/arch/powerpc/platforms/ps3/hvcall.S b/arch/powerpc/platforms/ps3/hvcall.S
index 509e30ad01bb..59ea569debf4 100644
--- a/arch/powerpc/platforms/ps3/hvcall.S
+++ b/arch/powerpc/platforms/ps3/hvcall.S
@@ -714,7 +714,7 @@ _GLOBAL(_##API_NAME)				\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
 	std	r5, 0(r11);			\
-	ld	r11, 48+8*8(r1);		\
+	ld	r11, STK_PARAM_AREA+8*8(r1);	\
 	std	r6, 0(r11);			\
 						\
 	ld	r0, 16(r1);			\
@@ -746,22 +746,22 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, 16(r1);			\
 						\
-	std	r10, 48+8*7(r1);		\
+	std	r10, STK_PARAM_AREA+8*7(r1);	\
 						\
 	li	r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	ld	r11, 48+8*7(r1);		\
+	ld	r11, STK_PARAM_AREA+8*7(r1);	\
 	std	r4, 0(r11);			\
-	ld	r11, 48+8*8(r1);		\
+	ld	r11, STK_PARAM_AREA+8*8(r1);	\
 	std	r5, 0(r11);			\
-	ld	r11, 48+8*9(r1);		\
+	ld	r11, STK_PARAM_AREA+8*9(r1);	\
 	std	r6, 0(r11);			\
-	ld	r11, 48+8*10(r1);		\
+	ld	r11, STK_PARAM_AREA+8*10(r1);	\
 	std	r7, 0(r11);			\
-	ld	r11, 48+8*11(r1);		\
+	ld	r11, STK_PARAM_AREA+8*11(r1);	\
 	std	r8, 0(r11);			\
-	ld	r11, 48+8*12(r1);		\
+	ld	r11, STK_PARAM_AREA+8*12(r1);	\
 	std	r9, 0(r11);			\
 						\
 	ld	r0, 16(r1);			\
@@ -777,7 +777,7 @@ _GLOBAL(_##API_NAME)				\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	ld	r11, 48+8*8(r1);		\
+	ld	r11, STK_PARAM_AREA+8*8(r1);	\
 	std	r4, 0(r11);			\
 						\
 	ld	r0, 16(r1);			\
-- 
2.42.0

