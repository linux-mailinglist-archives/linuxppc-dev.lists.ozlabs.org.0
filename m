Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4ED7F5FD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:31:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Q2q5Y16zDqvj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:30:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ymoj/7+x"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PML4DXZzDqsR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:14 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id r22so8292259pgk.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Xk7bFkfW7Yu12XC6rpdJb88i0Q++InL4ODMs5oBK3w=;
 b=Ymoj/7+xXSicHOXYZg1zO9mE65YPSzvTEezJ3PM3sh8Gj6XZ36xajLVEHgA7f7rxrd
 wyyiHlsiAoXAW73lTF+h50hzgmlEJbCZb3KN3av2FnELpgDumu5oTm8cAIPTcqeO43nP
 M+8okRcrZvOKJoYevoHvnppRJymb/MZ+C6D4lkEzz4L5zlLdvTolB7k41k+p9oZeD6Cb
 CR8UAgLAf3TCcF4TbQWjrJS8lQ1SnZB7ec9oqA67WI+ZUj5uKuKM7oQvmMUEQ28QzOHR
 6RaQFT3zwEYIsrki1ICj2FM8SM3RqL4Wwdn/U6c35O6vgnwG84DP+edVWDxoZPb3KSC4
 cYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Xk7bFkfW7Yu12XC6rpdJb88i0Q++InL4ODMs5oBK3w=;
 b=hmQkMOu+IpYPuFdFMlp9UNnF/NidEgINH3mCp9b3p16JP1nQhztGe0NrD/GPp2USay
 V3P874NZf/uplyRM03h7JkbZBvIMwNvHrtDxzJlfBagnDjmJpzw8AtYJh28C4tmmeRH7
 f/JSo9X9qE/Wd3Q5I/HvzLy+kXr7emoymYWlRntndo/BcxXWLVF64Xb4Hm2tw/DmuFWa
 3VZLoPAJ+q7Hii35PdyU3Nqc7SeQ8iKP53nBndcgNeqb/uia6Rd8xVMc9Ve5s9/6mR94
 dOO98tZ6VjSp3QeRwLEeJuAO35AdUR746HDcWersrAjbHeaNbVM54B2/qFXPYQRejgEB
 bH5g==
X-Gm-Message-State: APjAAAUNkeQTotTMBqwVo3YQGNTw+r6QwvMV8Ha2WTTeyQTxI4dTH0lg
 DQQa4yOiXtOVfKAlKhl8ULHKDE2HwOI=
X-Google-Smtp-Source: APXvYqzuAM9Ri/l63JokEudRirdnBXPdlRFq9gY6aXedeno/Y2GJIKnb1r9Wt0TvYSmcV1qkn1Fl1Q==
X-Received: by 2002:a17:90a:8a15:: with SMTP id
 w21mr3800838pjn.134.1564743611562; 
 Fri, 02 Aug 2019 04:00:11 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/44] powerpc/64s/exception: simplify machine check early
 path
Date: Fri,  2 Aug 2019 20:56:38 +1000
Message-Id: <20190802105709.27696-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
index 20fcc17832b5..18e5251705e9 100644
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
2.22.0

