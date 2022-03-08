Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8BF4D19BD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:55:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcL04rctz3c2g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:55:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TYGt6uGA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TYGt6uGA; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDh6b7Qz3bZ4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:16 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id m2so11137769pll.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ljWZe2w7POV0ze5qOCGOcAy2jUpe6eI1F2Hya2kReco=;
 b=TYGt6uGA+Waad/PY671qU24h1xFxTfWcfOSI5foiycAP0PUUi/H9RPskQ6UGr9edOK
 dohNu/ShNFBJb8g+daK/mTlgwz+r/bqeGXHFXykGxWWvVTN0RKH1wwoRjBDH9OE8apDj
 4iNsKBRn1EBdRUDT5dPWTMUkw+BPfCJ+D4zI3S7cJpt/swHF2kbZRdrbP7UNV4jBnliU
 YeKZnN/6HDHDQCqyfY0ViyONyhYSDGwyt+mU7PMJNraGh+FKvj0CX1FGomRuyB6vIOI5
 TMRhKKdj2Zasu0+5a0S7nSQ71nCTfkrkfswc+hfYPiLZlMNaUcJa+/iKq0FyYlXbx21J
 FHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ljWZe2w7POV0ze5qOCGOcAy2jUpe6eI1F2Hya2kReco=;
 b=XcKHLEElEodMN0sv7p/uhXqKUXw3XxiYOqeLz22tOq6V5QPqqLYbuDln2inkFzV75i
 lRM/oCjTcL/AkBqLD5XDOpEUqpdGOj3nbQ+Ky4ZezKzc1LlQW4sfjO/vsFNbrlEqpddd
 wK+12Y8GAsS7mktecVrZ+b4ovAC68s/gK0QY6xcsJMkvSb7eEh/2QDybu6FJ206QkIVy
 Qg64sFpFVTYUFHXJZPgYSzrzb3dQFa255PawYpYV8suk+hdUq0L7rUGCQ+Rt+vUS7WSn
 xDr2Ldu0aEHoVCT0FfckyYejPopdshwMWKGYDt5WhAbhki388r0wK1WmaRblhR5JVHih
 8v/w==
X-Gm-Message-State: AOAM532rhfqXclLsBBnaF2eDExGolTYOmLWecrfF1n4wrnmDnWNBpdmj
 ZteAipPz5aZONNCqjX0op0ZXHAQwi3w=
X-Google-Smtp-Source: ABdhPJxrvvOTgzqSyWCJ9trIspc1PBD0keAfOCcdoJXqEk4M8aM+o6wqaIRsUPYLWkc5+vuVABbsFA==
X-Received: by 2002:a17:90a:69e6:b0:1be:f28f:3bb6 with SMTP id
 s93-20020a17090a69e600b001bef28f3bb6mr4873425pjj.44.1646747475804; 
 Tue, 08 Mar 2022 05:51:15 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/14] powerpc/rtas: PACA can be restored directly from SPRG
Date: Tue,  8 Mar 2022 23:50:40 +1000
Message-Id: <20220308135047.478297-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 64-bit, PACA is saved in a SPRG so it does not need to be saved on
stack. We also don't need to mask off the top bits for real mode
addresses because the architecture does this for us.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas_entry.S | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index 08eb731f08b8..5f65ea4436c6 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -62,10 +62,9 @@ _GLOBAL(enter_rtas)
 
 	/* Because RTAS is running in 32b mode, it clobbers the high order half
 	 * of all registers that it saves.  We therefore save those registers
-	 * RTAS might touch to the stack.  (r0, r3-r13 are caller saved)
+	 * RTAS might touch to the stack.  (r0, r3-r12 are caller saved)
 	 */
 	SAVE_GPR(2, r1)			/* Save the TOC */
-	SAVE_GPR(13, r1)		/* Save paca */
 	SAVE_NVGPRS(r1)			/* Save the non-volatiles */
 
 	mfcr	r4
@@ -129,15 +128,14 @@ rtas_return_loc:
 	mtmsrd	r6
 
 	/* relocation is off at this point */
-	GET_PACA(r4)
-	clrldi	r4,r4,2			/* convert to realmode address */
+	GET_PACA(r13)
 
 	bcl	20,31,$+4
 0:	mflr	r3
 	ld	r3,(1f-0b)(r3)		/* get &rtas_restore_regs */
 
-	ld	r1,PACAR1(r4)		/* Restore our SP */
-	ld	r4,PACASAVEDMSR(r4)	/* Restore our MSR */
+	ld	r1,PACAR1(r13)		/* Restore our SP */
+	ld	r4,PACASAVEDMSR(r13)	/* Restore our MSR */
 
 	mtspr	SPRN_SRR0,r3
 	mtspr	SPRN_SRR1,r4
@@ -153,11 +151,8 @@ _ASM_NOKPROBE_SYMBOL(rtas_return_loc)
 rtas_restore_regs:
 	/* relocation is on at this point */
 	REST_GPR(2, r1)			/* Restore the TOC */
-	REST_GPR(13, r1)		/* Restore paca */
 	REST_NVGPRS(r1)			/* Restore the non-volatiles */
 
-	GET_PACA(r13)
-
 	ld	r4,_CCR(r1)
 	mtcr	r4
 	ld	r5,_CTR(r1)
-- 
2.23.0

