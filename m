Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CC15507FF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 05:12:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQd9f2H9fz3cgD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 13:12:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aUE+gbed;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=jrdr.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aUE+gbed;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQd8z4Kdjz3bZC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 13:11:29 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id r66so1378001pgr.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OBakpvac0Bjkh+1/ThELj1/wzKw0fOxlqJA4HwHF5Ys=;
        b=aUE+gbedStapVwsEM+vW4y5uYUJBI1ecVnSV8OYPMmGRMot38U/fXMV91JvkYEl+Tu
         EWB5VUlLdgLv9RppHMUTFutz2QJ2HSrR5td73uyjjWBmnAiU00BllkC0GaYafanl7aM3
         wdVUyE65oFCrU1S1eTUpAz4Q6s8MMSQ/t62SCDg0TGoo1Ndg5UqBKUobMeaXG1UtrTWP
         e2pwGUBl6C/UEE4QRJWVJ04l1NX932TyK5F0F2A2NLCz/4ssyUBejFODzK39bwnAq0tg
         T0NnIjR5C5Z1l9zQ4cbOf0ilZRuyvrhdqgntM+xZGTAPnSzJLwe576GJMdKiDgma+nvT
         CVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OBakpvac0Bjkh+1/ThELj1/wzKw0fOxlqJA4HwHF5Ys=;
        b=CUSuQwkg8yp0KY6e64WJAWfgEEEqJxXj2iAEeRNRcOa2JGSS1C49GnkzE5W2hg4FlL
         HXDcMViFxNZukSFhpYMfdBw1c77FG2pfy5LIx8GCIy/wbHMwGqUgH88V1PYMzpSFZaWA
         y7w42DmG7M95Pn1HHzFgN+EMFo2dDhkUzaJhlwB9JPGPkDeQukNWTT7csck5K6hSpS59
         igw/RxRQ/ji0VWwzDBqwUXI2iaWaLDwaYToQ7q9b0apbS9Gs62dWhh+aPMVT+r3/rM21
         /Ff8x9/bG6q6/wql46D8GmoQfQrPUntfnlKAu6Q3T5BKwEXpibYK0qy0Iz15ablqdoy/
         Q57g==
X-Gm-Message-State: AJIora8HM4c/kb9RgVL36bxZ7WT5md1Yai0yPjzVI+VYVaz+bjf6iPgW
	qVG+Pvo2jqXHB6MP2pglhTM=
X-Google-Smtp-Source: AGRyM1sKcMswpbR7PEqtVuaVGvkgXohXNUj8lxi/ii2fqU2OlJfC6JQncxRtlfHLI1dfUeJGj+vsgQ==
X-Received: by 2002:a63:3f05:0:b0:40c:25d6:6126 with SMTP id m5-20020a633f05000000b0040c25d66126mr13423080pga.347.1655608283446;
        Sat, 18 Jun 2022 20:11:23 -0700 (PDT)
Received: from localhost.localdomain ([122.167.211.160])
        by smtp.gmail.com with ESMTPSA id ix6-20020a170902f80600b001615f64aaabsm5957938plb.244.2022.06.18.20.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 20:11:23 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	tglx@linutronix.de,
	mark.rutland@arm.com
Subject: [PATCH] powerpc/interrupt: Put braces around empty body in an 'if' statement
Date: Sun, 19 Jun 2022 08:41:14 +0530
Message-Id: <20220619031114.92060-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Souptick Joarder \(HPE\)" <jrdr.linux@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot throws warning ->

arch/powerpc/kernel/interrupt.c:
In function 'interrupt_exit_kernel_prepare':

>> arch/powerpc/kernel/interrupt.c:542:55: warning: suggest
braces around empty body in an 'if' statement [-Wempty-body]
     542 |                 CT_WARN_ON(ct_state() == CONTEXT_USER);

Fix it by adding braces.

Reported-by: Kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 784ea3289c84..b8a918bab48f 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -538,8 +538,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
 	 */
-	if (TRAP(regs) != INTERRUPT_PROGRAM)
+	if (TRAP(regs) != INTERRUPT_PROGRAM) {
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
+	}
 
 	kuap = kuap_get_and_assert_locked();
 
-- 
2.25.1

