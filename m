Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F1E64A62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 18:02:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kP8b0RfQzDqcM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 02:02:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K6e8pGz0"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNHW3HSXzDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:23:19 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id a93so1402724pla.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PSBHtS9XbJ6nMvMQzWPxBsgLb6n6JmRG7GZwJFXozpc=;
 b=K6e8pGz0tY56vOsUE+KdSbpH76BBjBo/AzDbYI19DJx92hnSfHzMyfjPqG0e85KZIk
 AHyjsxPfNe4OybAA5DWtjrS5z00KXaWPWrgI7Xm6vE/5GGfFb+w4HLkJYBAK7aRlNSVp
 ZKR9seRpqwoPeF+/kI1VGJxWx7F737aDv8oaiV1KC8dPD/A/owrHUbwyUl7LjX2p3yfH
 eNGzI9z2e6qaJTzamtdeQmngk+AmkO8boQaI8c8jumMn4lYMLHBUjJHgOSXLGL/Jrs+v
 7mL/gWfkrbIUJmxO4RDDStOo+EzJKLfYMnIdlReiFm6JP5fJuAOJqu63Uo4k7nJdoTx3
 R8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSBHtS9XbJ6nMvMQzWPxBsgLb6n6JmRG7GZwJFXozpc=;
 b=pRM5yvKuHpY5UEVs+WRZU21qCAfwF9VODWse/XW1RhqMv1tEXzuLQXUlE/xRSrSSmc
 ODSvLsxp0hPmnrUa7WOax/kLq6Dojwx8X1+XagWXuvj2EV8MFnztxRaAV496NI5SNgfk
 0KDzak3RZz0FmR4ygtLtL2Gx7/XQorMhzZWgJUug8avYRfe5zviFgDQzEcAWMVhkUKk/
 phSWwRO/2CGzJA5LJroWiDFRmxLm0lTSoihIbloxwX/7tBHKf5hF95j0QF+R+vJNaGwa
 xNL2fT9tK+aOnwW/SRabxGLUquv+BxmtDqlTU85tVE3m/m5o4xaLH2O+dF6ReH2tDRBc
 8mHQ==
X-Gm-Message-State: APjAAAXVAacExtGBFM4moKJilcmECcGmHRDglvmXDYPRIBaS1NJ0lyK0
 ISjxLMPYwd//Uz/zbBZuRc+Ah6/78LY=
X-Google-Smtp-Source: APXvYqyiDG1NAPcac/DglsDdL8XIrMMyAp3VV51ZJI7BMiTJhwW3LvnjYRDR5oSkIcmVfz/INv1mWw==
X-Received: by 2002:a17:902:145:: with SMTP id
 63mr40801233plb.55.1562772197523; 
 Wed, 10 Jul 2019 08:23:17 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.23.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:23:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/16] powerpc/64s/exception: simplify machine check early
 path
Date: Thu, 11 Jul 2019 01:19:47 +1000
Message-Id: <20190710151950.31906-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

machine_check_handle_early_common can reach machine_check_handle_early
directly now that it runs at the relocated address, so just branch
directly.

The rfi sequence is required to enable MSR[ME] but that step is moved
into a helper function, making the code easier to follow.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 31 ++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 9bb8c89e9e77..2a17275296d5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1006,16 +1006,13 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	std	r3,_DAR(r1)
 	std	r4,_DSISR(r1)
 
-	mfmsr	r11			/* get MSR value */
 BEGIN_FTR_SECTION
-	ori	r11,r11,MSR_ME		/* turn on ME bit */
+	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-	ori	r11,r11,MSR_RI		/* turn on RI bit */
-	LOAD_HANDLER(r12, machine_check_handle_early)
-1:	mtspr	SPRN_SRR0,r12
-	mtspr	SPRN_SRR1,r11
-	RFI_TO_KERNEL
-	b	.	/* prevent speculative execution */
+	li	r10,MSR_RI
+	mtmsrd	r10,1
+	b	machine_check_handle_early
+
 2:
 	/* Stack overflow. Stay on emergency stack and panic.
 	 * Keep the ME bit off while panic-ing, so that if we hit
@@ -1026,7 +1023,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	LOAD_HANDLER(r12, unrecover_mce)
 	li	r10,MSR_ME
 	andc	r11,r11,r10		/* Turn off MSR_ME */
-	b	1b
+	mtspr	SPRN_SRR0,r12
+	mtspr	SPRN_SRR1,r11
+	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
 
 EXC_COMMON_BEGIN(machine_check_common)
@@ -2270,6 +2269,20 @@ CLOSE_FIXED_SECTION(virt_trampolines);
 
 USE_TEXT_SECTION()
 
+/* MSR[RI] should be clear because this uses SRR[01] */
+enable_machine_check:
+	mflr	r0
+	bcl	20,31,$+4
+0:	mflr	r3
+	addi	r3,r3,(1f - 0b)
+	mtspr	SPRN_SRR0,r3
+	mfmsr	r3
+	ori	r3,r3,MSR_ME
+	mtspr	SPRN_SRR1,r3
+	RFI_TO_KERNEL
+1:	mtlr	r0
+	blr
+
 /*
  * Hash table stuff
  */
-- 
2.20.1

