Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B3B5DF96
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:19:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dvCD6X8RzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:19:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L1kDHBv9"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthq5CwDzDqQB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:56:11 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d126so839206pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhemTXFBg1IxE39/94nLrNA81QUuZG2uBfW/TSvVahM=;
 b=L1kDHBv9tzvZfDcK6z1n8PkZ2sbzlLKe/wFEt3VdrsDD/lxMRQgfxlMVNEnPZwWKfZ
 HQtQmlr02qyVVi/vDnZFTdq6SmEkmc0AiUvqj7srhZ9Dlc45KOG4N8zhi6V06npSFflg
 O20MxBxM4DsIJCHJekQGcKxBcTd1tg8frJd4Kgdk/jWglNrGYfIXuNPSPV03+HhoipNu
 IG89DAp/FmFafh7qZw8K6KYlMALdASxjZXE8v9tqln7E8Kt4lVTbfVGh2iLIk58TmXo8
 V1g7LAwGlY+z9aNjCLhDUYvxnuJVx+JczNVzQnggQDwMh9i6j/mzAE/gjRFUb/HKFZt5
 wLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhemTXFBg1IxE39/94nLrNA81QUuZG2uBfW/TSvVahM=;
 b=qmhdnyuccmb4DR65Oo9nSuWSDBUvp6Pwvt5NI/+DVvxYoaNTIaU2G9ItlcpC2s2zFX
 28mhOWNsbKvPoiWrdQVEoavfU/RSeb/L5KpLsIOs0U5zFQMIhQtTtgY9y2Ro+zr1CvLh
 Ref3bhs/Xm8B3r6RXdnf/ffucqhla6iwZp6puECfxVTEBjQ3Sd9gkXNvu9KK7iGvCcZq
 ThDUnN0AxmVgmAHNa/LICb98KaS9ds6VVQidk2kLJQjcm3Sr9jtaQDv6SWMdQGXq+b3Q
 5uH5Auoqe9E26hGHKSHUuc/qOVeflYrpUMt02k0E8UPcN8/x4wzwwKqeuUpcP0SyHR9v
 iHhA==
X-Gm-Message-State: APjAAAWMJ/s7dJ8Qp8j4uzma6CgRfl3cIxkPJO0e+Y/RvXCtM7B9UAUl
 6giUvPQG9DN/tAGZ1YYKrwY8bdd9
X-Google-Smtp-Source: APXvYqysuN+QMR9d3ESYIRFQrRSefIzN66pGaG8i2/YihgQlVEl2nHsNjn7kw4P1DLko9MzIsKD4TQ==
X-Received: by 2002:a63:5463:: with SMTP id e35mr11576390pgm.451.1562140569720; 
 Wed, 03 Jul 2019 00:56:09 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.56.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:56:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/14] powerpc/64s/exception: simplify machine check early path
Date: Wed,  3 Jul 2019 17:54:41 +1000
Message-Id: <20190703075444.19005-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 30 +++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 9bb8c89e9e77..fcc3e6d5807f 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1006,16 +1006,13 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	std	r3,_DAR(r1)
 	std	r4,_DSISR(r1)
 
-	mfmsr	r11			/* get MSR value */
+	li	r10,MSR_RI
+	mtmsrd	r10,1
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
@@ -2270,6 +2269,19 @@ CLOSE_FIXED_SECTION(virt_trampolines);
 
 USE_TEXT_SECTION()
 
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

