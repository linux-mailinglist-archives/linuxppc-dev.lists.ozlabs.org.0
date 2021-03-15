Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3033A9F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:20:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzMBc6mSsz3dlb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:20:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CuCxekBr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CuCxekBr; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzM710NCTz3cSn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:17:48 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id x29so19637469pgk.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OcsBt8ewTV2UbzQaVDNSvhXoJcm4z8nW6w0OfWtZ0vQ=;
 b=CuCxekBr3NkRpfWArcu1L5rMxHy6k/UOIfU1ccs2H4aVhU65ZUoqdmzcqY03Ysp5SG
 KRqy8Uc5M4s/3l5cia03v2BztkNx2s5NEijQnEuCa3V/XfKMLwiUX+0kEz4I4RZ+OzOv
 K7mmj+OZV/n+JD1ppg6VFZ/o0rCqKDZ7Ak7A8PKMV5H/1p3dL+OsuUTf7nR3AfU3MGkn
 ewYDi4JR7sD/pnzYMJbm9WRdB3PEqkBCHOha0jkWjYQf3GAqLySFALzZME587j9Sxusw
 OywR8eJMymIVQ86O8J6YUvFOD/XaLvp6M7FcsX3LT6W3MX8W4d/ia2J8qcLtHnXukIVL
 1sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OcsBt8ewTV2UbzQaVDNSvhXoJcm4z8nW6w0OfWtZ0vQ=;
 b=tCATQn9cFwVJSqVzy0goAiFONExoDT9Jks0NWSlLLfPlf5jkRihGMl8tvG22nEzE9m
 fIkkPRRUPv4XW1MmFrPFSKafrC5uZzVxYXEARtngiUUufemI4OYwiqNZ3ugu63jGYtvs
 1Pmw0TNNFpKwv3AHr0YYwTwNkzMC8l6yi17aLvTJDmQ+7Rp6+Ui6ry9Rdbi0W5fjunX9
 jpVKnAzVaHcS5ylVQLQjLSXZ5kb2Ovi0/rQVnRDr5t83IXaETbLtMr2EyDVSI56yL8CB
 mv+Lu8FtTZJDBWOHD56cU5ETQw+TOGAeICk/TicQY8nEGDeamxLuAEoZ7CkGZUNjWIHr
 O8xw==
X-Gm-Message-State: AOAM531E5BHEmocHUHhxZ/0GFCfQiI892sgqx1SMAcTRuAb91eTHq+Xm
 U6jK+fAmqdRzsx0wZXUitu+0mpCMIew=
X-Google-Smtp-Source: ABdhPJzpN6xD3OO85Xjgb2gE5cJXCIxOstuOP78vu0IPylJA32kLzstBwokWZoXJ4puYlXIR40ZT+g==
X-Received: by 2002:a65:4c43:: with SMTP id l3mr21178568pgr.327.1615778266442; 
 Sun, 14 Mar 2021 20:17:46 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 j22sm8517740pjz.3.2021.03.14.20.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:17:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/10] powerpc/64e/interrupt: handle bad_page_fault in C
Date: Mon, 15 Mar 2021 13:17:13 +1000
Message-Id: <20210315031716.3940350-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315031716.3940350-1-npiggin@gmail.com>
References: <20210315031716.3940350-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With non-volatile registers saved on interrupt, bad_page_fault
can now be called by do_page_fault.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64e.S | 6 ------
 arch/powerpc/mm/fault.c              | 5 +----
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index a059ab3542c2..b08c84e0fa56 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -937,12 +937,6 @@ storage_fault_common:
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
 	bl	do_page_fault
-	cmpdi	r3,0
-	bne-	1f
-	b	interrupt_return
-	mr	r4,r3
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	__bad_page_fault
 	b	interrupt_return
 
 /*
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 2e54bac99a22..44833660b21d 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -552,12 +552,9 @@ static long __do_page_fault(struct pt_regs *regs)
 	if (likely(entry)) {
 		instruction_pointer_set(regs, extable_fixup(entry));
 		return 0;
-	} else if (!IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
+	} else {
 		__bad_page_fault(regs, err);
 		return 0;
-	} else {
-		/* 32 and 64e handle the bad page fault in asm */
-		return err;
 	}
 }
 NOKPROBE_SYMBOL(__do_page_fault);
-- 
2.23.0

