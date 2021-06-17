Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 236E93AB811
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:59:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RZ15G3Gz3fQY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:59:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RjYklyZR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RjYklyZR; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPx5Ng2z3c3t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:52:05 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id u190so1484066pgd.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AgJ9hFBQdtR81yElvtcZiCh3mlWTWvB4ULAMeqentuM=;
 b=RjYklyZRJEt09W7fTTrCu69CQJ+akuRNSsR+HfB8nD0qmhe1/t4yyibL8K5do6rqgz
 jchbPsxtPrAMVjOY/ejc5cAz2lZDn6tT7PI3qHY88gR8YlRNZv8yy3PTqdDV/BueDVj+
 tz1x6Nyb8knYhu+IqGy8/vanK7iyTiEgmhL8QDb8PIRT4w20jYh2PuiDzcAF9oFC4PiY
 vlu8uEnUwQDsYzZJa+LVACUVom6g028fzAFY78jDnOpxPcOnGyHHcwuePRNMfVrX7CKM
 qujCdBIk3x5t4Us5rEA+1E/CNncwHXlZ7BlX/FFhUrxaogL/xdoIRigFPmqLMnH4OynI
 YgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AgJ9hFBQdtR81yElvtcZiCh3mlWTWvB4ULAMeqentuM=;
 b=Obh2mjwkdSzRsh/fnA61tUwwZK7njXFBljOBwHqMR62uvEFYFba1rdW7Rd2hQ13Vxe
 q6UlpF+qm9ivcJj6/UY74Jp9WAnUqROtvOt77Ren4OFcUtuVWKihTkN7mzysmydnEWVx
 VVt+8N+3n8gshZEuWKFdtW2qyP+IjgkCAX3JLQYDrwo8FuAIkzpqMyh7Mj0k0r7Nz6Al
 QM5AOg83iCUNJOXW0pXY2pt0c0lQLjU7NlWUnhYFKFq09RPJeH7QKdpWjvOB1v438lT4
 llDq9gA8ttV2zkaxC15xAtp3H2pCezPVBPwy7iPnTiY5iXnS1d5yDi1n47XknodV61A8
 d35Q==
X-Gm-Message-State: AOAM531HKvK106Xl/kluUKSWAqll+vGWL2MOVO2uFGfxWqNW+kdNVeqS
 5r+DA28t3CNwd8Jkc7En+SEbLIxHshM=
X-Google-Smtp-Source: ABdhPJy4m+/5OulVgluWMxk62MfjnDb968k63ke/HwgmIGeE1Md9L5Pk/LfJ4Jr4+Xw0OvxQs4zmLg==
X-Received: by 2002:a05:6a00:1994:b029:2fe:c076:8359 with SMTP id
 d20-20020a056a001994b02902fec0768359mr402490pfl.24.1623945122833; 
 Thu, 17 Jun 2021 08:52:02 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:52:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 17/17] powerpc/interrupt: Remove prep_irq_for_user_exit()
Date: Fri, 18 Jun 2021 01:51:16 +1000
Message-Id: <20210617155116.2167984-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

prep_irq_for_user_exit() has only one caller, squash it
inside that caller.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 138c450b01bd..09b8304a7011 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -75,18 +75,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 	return true;
 }
 
-static notrace __always_inline bool prep_irq_for_user_exit(void)
-{
-	bool ret;
-
-	user_enter_irqoff();
-	ret = prep_irq_for_enabled_exit(true);
-	if (!ret)
-		user_exit_irqoff();
-
-	return ret;
-}
-
 /* Has to run notrace because it is entered not completely "reconciled" */
 notrace long system_call_exception(long r3, long r4, long r5,
 				   long r6, long r7, long r8,
@@ -276,7 +264,9 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
 		}
 	}
 
-	if (!prep_irq_for_user_exit()) {
+	user_enter_irqoff();
+	if (!prep_irq_for_enabled_exit(true)) {
+		user_exit_irqoff();
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
-- 
2.23.0

