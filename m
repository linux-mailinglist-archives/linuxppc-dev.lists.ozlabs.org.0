Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D334F617
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 16:00:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WHHv4YyxzDqWC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 00:00:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hIZMuRCA"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKg6VRWzDqbv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:39 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 19so4987087pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NTPJZZLrec3Fy2SgdOAFAksK0oLl0d2UpWKS+4lcgUY=;
 b=hIZMuRCAE7rnpo7na1wdb5lYHFzpakpyEcPlFOSyBelFtxpRbIIv+9M3IY55FY4888
 /XjvQsgWpsIvITi1OOUGEuVdJ7EFFZk4Ga+dHG6y3vFsHjaiDkhaxL/6XRi4cQA7fKi/
 pP1dyV6p/mSw4sAfCzxsO2K2BjclGlYgxx+6Eh05ygeOxKpDbf+oV3RDVQ4gy9Cdkb63
 jluDiv+aR1T3Kqt7DAYxOWJ2AVRSqLMhHK/8nmHVFZPWMxqowqeFdHMvbeJY9I8/gQGJ
 J6TeoYBJCLeHLLCTtrDmqnv4rnKkuOUo8GncFScOmgsQraEodkGqKgTrxZkq+9GChW9t
 I73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NTPJZZLrec3Fy2SgdOAFAksK0oLl0d2UpWKS+4lcgUY=;
 b=DSsBPmL7O1cvYDy5hH18oyId8kb2oK+u0pWN38Q2inVvjI6yqh8NZO/YPMoaDWF8kz
 dSh+1X/I3x5US7CqN0yPzkUQrfc0b81hsJkRfN9RuklbtpvU76e4unYgXirr2wsy5GNl
 mfH/Vv8Tzr6fJrD7JcOyOOPLVWW8gcunRKzDddkFhHRHBDXnOF1UxYYaZnIaIwVhTm6J
 3iuxCWUE1ZUlwOZhprdz2DL/KC5wviS7OlcFoAAHV1vrxZA4pmXWoxD2zKHbnSKCCRFi
 VqVGBs7u6X6ydAn55vGd5N3e6Zatkr+Tx35zjdSIBHwHksDf5EKXK21VONl28BfN+4kl
 IJbQ==
X-Gm-Message-State: APjAAAWYcPuzGtkR8LVUJgnBxlszLcowF1y8WeusWqKIAH4shHW/GelZ
 jL6RhsNAuIcxONQ5yG/9GV4mikubPmU=
X-Google-Smtp-Source: APXvYqwf8WRTq8HdYSU08YuUXZkYr9YrXsQ1OIfgKbL+oL5kacc8MhSO4pI+sfju+T9+zueuSRO3QQ==
X-Received: by 2002:a63:3d09:: with SMTP id k9mr17733574pga.321.1561209397822; 
 Sat, 22 Jun 2019 06:16:37 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 13/25] powerpc/64s/exception: improve 0x500 handler code
Date: Sat, 22 Jun 2019 23:15:23 +1000
Message-Id: <20190622131535.20996-14-npiggin@gmail.com>
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

After the previous cleanup, it becomes possible to consolidate some
common code outside the runtime alternate patching. Also remove
unused labels.

This results in some code change, but unchanged runtime instruction
sequence.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8ccceaee51fa..dfc9f5823284 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -746,32 +746,24 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
-	.globl hardware_interrupt_hv
-hardware_interrupt_hv:
+	SET_SCRATCH0(r13)	/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXGEN
 	BEGIN_FTR_SECTION
-		SET_SCRATCH0(r13)	/* save r13 */
-		EXCEPTION_PROLOG_0 PACA_EXGEN
 		EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
 		EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV, 1
 	FTR_SECTION_ELSE
-		SET_SCRATCH0(r13)	/* save r13 */
-		EXCEPTION_PROLOG_0 PACA_EXGEN
 		EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
 		EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_STD, 1
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
-	.globl hardware_interrupt_relon_hv
-hardware_interrupt_relon_hv:
+	SET_SCRATCH0(r13)	/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXGEN
 	BEGIN_FTR_SECTION
-		SET_SCRATCH0(r13)	/* save r13 */
-		EXCEPTION_PROLOG_0 PACA_EXGEN
 		EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
 		EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV
 	FTR_SECTION_ELSE
-		SET_SCRATCH0(r13)	/* save r13 */
-		EXCEPTION_PROLOG_0 PACA_EXGEN
 		EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
 		EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_STD
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
-- 
2.20.1

