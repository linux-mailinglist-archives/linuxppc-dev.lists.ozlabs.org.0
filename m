Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F133C91A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:10:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzrFg3XQFz3byF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:10:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=R9yvXhJ2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R9yvXhJ2; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr7L1sKFz30Gk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:46 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id gb6so9549968pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLi1S3FpkxSAZwsX8u/3TltE4SXPN2E9VJ/bztmavDE=;
 b=R9yvXhJ2A09LCVynjHTqMqAYOdhoU/hY1xLXfb3NAavb/BlZBuPjAZg/5gJdE1/5YS
 QFSUELxTbO3pE0PnTgIx6F40iI1ltFEj1mK040C6Q+SFq1QIjxggZrQGoxxE63OChFU1
 DCxuNL9OXWJXu565Ld9LJfiRHCnpfJy2rjVq8Q9rC5oh/1VapRmfUvbcaTrTmFCW1wqH
 pi4FRHgnG6T9Xsl+daCZr/cgOnghruRJu7WLfrE642QFY8R07C8nPBEQatD0VBXWWqXN
 g0NglPZ9+5QDTuFB0WZ4v8FPX77dCQgtlioeuhh1Vuw33gHcVdoNYevQaqDw0lsi4N0g
 T4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLi1S3FpkxSAZwsX8u/3TltE4SXPN2E9VJ/bztmavDE=;
 b=KQDDJ+h0X/3Y8Lj62A18Cwm/m5FHrWfTrObZc503bCzAuhO+P5p94g45yccI4DTiko
 Mw7UetS98FScWx6pY1TTP7ciEebvE2HJ4G3apYeLsol/OJTUDb+NHzsasxRaDRl86j7J
 ii+KOKCLZwxSORw0TodbRurtPeoOLRe0/Cihda4vLoxudwnBwwfwDG8Se9iqU1HNAAOU
 jVAKj7xLjqN9PZ7LoOSZ147sOQF+cRWdIlvCsfr6upqhJCNDagSwiVSca8YppF1LSt+6
 FWe3r3hKIPzv0OAVlHo/kWXeqBDctHiRUv0yb2KH5z8eyk1gzWzhL4k/nHLNzikLwdRn
 s7fQ==
X-Gm-Message-State: AOAM533FG0+fQSXtUThF31IfgOdAUBrWNxAOb5wkpTL2sxa27kcJqoHP
 W7q8EHXoHtMAQXuE4i4Rdky/t3ypGTs=
X-Google-Smtp-Source: ABdhPJyoHCwsMyRK66X1/PFD9uTGFbULJc+pnfyaAmtajnA7hdDTVi5e/8tup/CG4QmNUsrVg6F+mg==
X-Received: by 2002:a17:902:e54b:b029:e6:b39f:63ab with SMTP id
 n11-20020a170902e54bb02900e6b39f63abmr6969492plf.55.1615845883596; 
 Mon, 15 Mar 2021 15:04:43 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/14] powerpc/64s: system call avoid setting MSR[RI] until we
 set MSR[EE]
Date: Tue, 16 Mar 2021 08:04:00 +1000
Message-Id: <20210315220402.260594-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315220402.260594-1-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
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

This extends the MSR[RI]=0 window a little further into the system
call in order to pair RI and EE enabling with a single mtmsrd.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 --
 arch/powerpc/kernel/interrupt_64.S   | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bd0c82ac9de5..2f14ac3c377c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1999,8 +1999,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	mtctr	r10
 	bctr
 	.else
-	li	r10,MSR_RI
-	mtmsrd 	r10,1			/* Set RI (EE=0) */
 #ifdef CONFIG_RELOCATABLE
 	__LOAD_HANDLER(r10, system_call_common)
 	mtctr	r10
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index f28f41a1a85a..eef61800f734 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -311,10 +311,10 @@ END_BTB_FLUSH_SECTION
 	 * nothing pending. system_call_exception() will call
 	 * trace_hardirqs_off().
 	 */
-	li	r11,IRQS_ALL_DISABLED
-	li	r12,PACA_IRQ_HARD_DIS
+	li	r11,IRQS_DISABLED
+	li	r12,-1 /* Set MSR_EE and MSR_RI */
 	stb	r11,PACAIRQSOFTMASK(r13)
-	stb	r12,PACAIRQHAPPENED(r13)
+	mtmsrd	r12,1
 
 	ENTER_KERNEL_SECURITY_FALLBACK
 
-- 
2.23.0

