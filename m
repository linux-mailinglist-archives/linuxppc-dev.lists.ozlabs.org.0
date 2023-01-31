Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A163268331B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:57:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rnl3DHZz3dyW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 03:57:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QvBwW/P2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QvBwW/P2;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rln6slHz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:55:48 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id m2so10705014plg.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNv1NH6crUe3EWJ/2wkBhfP0j0dEvWb5r6AB12gg7pE=;
        b=QvBwW/P2j0VaveZDl3tGM6rFSTZEFRVhQKzCaI+X3LDzG6WmPUDZcifxdoAl2qTvBi
         f1o0C7EbUB2nZ8Pur/bVxP6M92MLgW0LkyLKKq4YTgudquBzfXTsctiy6WsjZZ7b46XL
         Wb+4qDTguSHf05ktUQzP1Q9E67OJE6a+YGf5963LDs3PGEg52PBdW+WJxcjNeI9Mj5Wo
         duamrGSZYlNJplpbP/Q3CC/zTfAGoLdfteBZ0UvhcHpfYEqlh6D6bYJWujxIizot0H1z
         o8Cc6TIGYP/LzEw9ts0yawRjPOR3PM2pf9/G1kftu5QNl7CDldkEGYoOmkCB3BotXkna
         YnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNv1NH6crUe3EWJ/2wkBhfP0j0dEvWb5r6AB12gg7pE=;
        b=kiHasAleq26z48M1gjSxgWWPyjs51xnQ/+JMaIcP8qYeaSw7Jg3/xQCOQLMK2kFcDs
         PnrpW+C0JuYwWAMIITmaSKogkJ7m4LQcRWiPRyH8hMHmVgOz5DXf7ffqv16v8QFm8jM1
         TbQYShoesEwftUzAZ69Qwfql+xkqv/htDOOtfb49lTA/4yA8XY0Hr/oj2gC+MBHciLcL
         YPjVljcKQXI+g/I7PR4u3X/3AguFp4qNqqNpZN+BSCKw0HuogQWo5042qJXAMJNaiQlq
         JusgM2Y3LYyjyk7CzGnoN/bzzQhHavFxyVw7v9F5UZSFlY2pF9ZX1nW271qS628JEdAG
         JsKA==
X-Gm-Message-State: AO0yUKVI2m/TiHCvx7VOb7XuURS7a+8d8YEOykXj9f7Jf9qCn1RZnDGe
	quu9caXyvZzJu3pGSsFn18O89GFo9zo=
X-Google-Smtp-Source: AK7set8OAkLbgh6wZcev+enmRG7emeYlrpKRPjlJ/t77R6Pa2rypzVsdnDwLyyi+rN1TDU7PWQUTYw==
X-Received: by 2002:a17:90b:3e81:b0:22c:8636:bd66 with SMTP id rj1-20020a17090b3e8100b0022c8636bd66mr11219914pjb.37.1675184145376;
        Tue, 31 Jan 2023 08:55:45 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id bk7-20020a17090b080700b00223f495dc28sm9029371pjb.14.2023.01.31.08.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:55:44 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/8] powerpc: copy_thread remove unused pkey code
Date: Wed,  1 Feb 2023 02:55:27 +1000
Message-Id: <20230131165534.601490-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131165534.601490-1-npiggin@gmail.com>
References: <20230131165534.601490-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pkey registers (AMR, IAMR) do not get loaded from the switch frame
so it is pointless to save anything there. Remove the dead code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index c22cc234672f..ba10505f62c1 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1814,6 +1814,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	sp -= STACK_SWITCH_FRAME_SIZE;
 	((unsigned long *)sp)[0] = sp + STACK_SWITCH_FRAME_SIZE;
 	kregs = (struct pt_regs *)(sp + STACK_SWITCH_FRAME_REGS);
+	kregs->nip = ppc_function_entry(f);
 	p->thread.ksp = sp;
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
@@ -1846,17 +1847,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 	p->thread.tidr = 0;
 #endif
-	/*
-	 * Run with the current AMR value of the kernel
-	 */
-#ifdef CONFIG_PPC_PKEY
-	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
-		kregs->amr = AMR_KUAP_BLOCKED;
-
-	if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP))
-		kregs->iamr = AMR_KUEP_BLOCKED;
-#endif
-	kregs->nip = ppc_function_entry(f);
 	return 0;
 }
 
-- 
2.37.2

