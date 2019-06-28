Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE2C5938A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:40:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zlww6Q6DzDqml
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:40:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EvpaiZw7"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zlmb0nSrzDqnB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:34 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id n2so2055769pgp.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=07CsvUZ01IREox52Lr5wVvnsxzJ+PWzIfkP+aUHnooE=;
 b=EvpaiZw7l+u1SnShhXbGelh8Tptri+RQ5b9pLpAyqbIlxKCMIUS5JSS7fxpEaJY6fD
 cTplx01cytrEdv8cOXXO/IDwfmZEH6fc/axabxex3QvB8XDI3LgSKeLlGvlIlB3dyc2H
 tDRwgMmLK5T1irsFY6LDeVgUarYBDImQ70pOH0v/r29DCNvJTocKSdPWxvTq2DXibQSM
 wHTijpE3fl/z5c7Gmcj9uvJ6IATfGVTlgdpV2MB1g+XWTqYbmc/y5WICxQ/cYELt/rtF
 KEU/lqlv86TGBiSHcemA/CDfkmTEMzEyBs73BgPW/f5Oz+RHqZfcEskwbuR1SupIttR6
 ddwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07CsvUZ01IREox52Lr5wVvnsxzJ+PWzIfkP+aUHnooE=;
 b=udYCE/g3Dt47mR2M2jLDeaR0UOdS4tM2oYe4q76IJ6l5R/qIc8wN4tytElaAOmp625
 sd39hxf9brJYkncmYFFrJ+UAYxhnfU8sNDsP/NapPXyjoVq4aLB9IYLb2kHu+FjYiAzq
 3ycKAui3ewds1KlULrk485cmhNhLGKJlNb/N6geE+6C0mhT8bBrHeHjZVA1yt0udsvDE
 gLZawaiZAYsvAWHMVsEBRWvED1RPk4KC1EuXag6OSfsqr9Zp9HyLJUtho8QuEB7n/yDW
 hqejl56zJQHq9d/KuhTFA6gik9ojkQWNWxpUCWljdemMF05I2eDbRrSb1USZ5D4Kew6Q
 3v/A==
X-Gm-Message-State: APjAAAWR6ohDybK5kirMkQnBxj18gnV5I+QU1FVgaKA5Enq5sDlvJOno
 4gbDjZLT5WxyD+W2INxV419nwuSB
X-Google-Smtp-Source: APXvYqxALEHQ8C+IxnME42+dcDXdDZP4DSwGEWk11v18ubdSE8sd53PBZB+GU+0Nx88usD5UwqHDqg==
X-Received: by 2002:a17:90a:601:: with SMTP id
 j1mr10611940pjj.96.1561700012840; 
 Thu, 27 Jun 2019 22:33:32 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/13] powerpc/64s/exception: windup use r9 consistently to
 restore SPRs
Date: Fri, 28 Jun 2019 15:33:23 +1000
Message-Id: <20190628053332.22366-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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

Trivial code change, r3->r9.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0804a86f6f28..b1dfd0af0120 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -909,8 +909,8 @@ EXC_COMMON_BEGIN(system_reset_common)
 	/* Move original SRR0 and SRR1 into the respective regs */
 	ld	r9,_MSR(r1)
 	mtspr	SPRN_SRR1,r9
-	ld	r3,_NIP(r1)
-	mtspr	SPRN_SRR0,r3
+	ld	r9,_NIP(r1)
+	mtspr	SPRN_SRR0,r9
 	ld	r9,_CTR(r1)
 	mtctr	r9
 	ld	r9,_XER(r1)
@@ -1083,8 +1083,8 @@ EXC_COMMON_BEGIN(machine_check_common)
 	/* Move original SRR0 and SRR1 into the respective regs */	\
 	ld	r9,_MSR(r1);				\
 	mtspr	SPRN_SRR1,r9;				\
-	ld	r3,_NIP(r1);				\
-	mtspr	SPRN_SRR0,r3;				\
+	ld	r9,_NIP(r1);				\
+	mtspr	SPRN_SRR0,r9;				\
 	ld	r9,_CTR(r1);				\
 	mtctr	r9;					\
 	ld	r9,_XER(r1);				\
@@ -1786,8 +1786,8 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	/* Move original HSRR0 and HSRR1 into the respective regs */
 	ld	r9,_MSR(r1)
 	mtspr	SPRN_HSRR1,r9
-	ld	r3,_NIP(r1)
-	mtspr	SPRN_HSRR0,r3
+	ld	r9,_NIP(r1)
+	mtspr	SPRN_HSRR0,r9
 	ld	r9,_CTR(r1)
 	mtctr	r9
 	ld	r9,_XER(r1)
-- 
2.20.1

