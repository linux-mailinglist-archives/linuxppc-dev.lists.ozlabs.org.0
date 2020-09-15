Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459126A472
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:53:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrM7d6sZ4zDqSq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:53:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RA6BA08N; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrM0G29ZdzDqKq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:47:10 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id d19so1203345pld.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25mRSvn3CQ3AAupfysV0tQoxcIdG+8XJkZoBnvFGHUI=;
 b=RA6BA08NwGB1NtHvbBpp/zqkUJHaJ1Iv8NR0OJhJe7vVIJtLbsCynRu1CIulA/rP32
 N6GTsk5W8ZCnfJgiJAsERPwyRp3xKoN0Dr3mBGWkJNqk7oYDd626K7m0Yl+koVHWawSZ
 gDWIYKQEDfDDQB7J8V4sIxwK0z036FssbLaHCDRrT5A8CCf8EpWeN0d6DW/+VTVkTsdZ
 q2vPJDT/LKnSHfUuoCTVGSFwCsEbbhpyonultbnvYhlja4iEk4M/r3WoYXYwgW0QmThB
 VL0ncYydfTOJnxt1O9IiHtzq44mbs+VKhfLvYlWDT++sExvXhikbFLsdd2gHKqtvOTge
 7Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25mRSvn3CQ3AAupfysV0tQoxcIdG+8XJkZoBnvFGHUI=;
 b=DeYDFOa+cMrrBI5d3Eo2QLFUSAlBHBtqGAhgPu/PGyeZHtaU9fy7eOzf6lBcoXxgy+
 xNmEDx23mfvc8KcrZoWnpfhmhEoTzQ02ZPXiekPXq0r3iVZrPHp51+w2pBxQE+D1PpNd
 UPc+9aaZBaHp/vo6dcocUvLCuc7I6ydJhg7/SDB7AEMe8Y7SHlqux9V810rZkxiwTvVL
 IuovNaClo1RpgOeARn9QiC4WHANmwW1R8wx5pQWcJg6mpfuhZZIoQz02Kpjwn1RZZugG
 6LYhx8qfu+JQUA97fBQtxdwskEB39/kQQHMgcSvAMvXlk0Kpq0FFGBTQruwFZLQvBuw3
 oTog==
X-Gm-Message-State: AOAM531psx2uJsKuCfD9evP15tvjZg+jnVI8Alp7RiTmSxHLK+bRL4RZ
 UKUwThxaBKLrMCzVO5akjbQoM1uVo/kaNg==
X-Google-Smtp-Source: ABdhPJzN/glO/Ur6ku/VkhwmWltKjQUDzRJH1joLBVu1BajwnJJJRAZnDWpNx6rFnB0YweekEJXAhg==
X-Received: by 2002:a17:902:a712:b029:d1:cbf4:c583 with SMTP id
 w18-20020a170902a712b02900d1cbf4c583mr7921340plq.16.1600170428381; 
 Tue, 15 Sep 2020 04:47:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id u2sm12118077pji.50.2020.09.15.04.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 04:47:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/64e: remove 64s specific interrupt soft-mask code
Date: Tue, 15 Sep 2020 21:46:48 +1000
Message-Id: <20200915114650.3980244-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200915114650.3980244-1-npiggin@gmail.com>
References: <20200915114650.3980244-1-npiggin@gmail.com>
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

Since the assembly soft-masking code was moved to 64e specific, there
are some 64s specific interrupt types still there. Remove them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64e.S | 10 ----------
 arch/powerpc/kernel/irq.c            |  2 +-
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index ca444ca82b8d..f579ce46eef2 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1302,16 +1302,6 @@ fast_exception_return:
 	addi	r3,r1,STACK_FRAME_OVERHEAD;
 	bl	do_IRQ
 	b	ret_from_except
-1:	cmpwi	cr0,r3,0xf00
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	bl	performance_monitor_exception
-	b	ret_from_except
-1:	cmpwi	cr0,r3,0xe60
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	bl	handle_hmi_exception
-	b	ret_from_except
 1:	cmpwi	cr0,r3,0x900
 	bne	1f
 	addi	r3,r1,STACK_FRAME_OVERHEAD;
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 736a6b56e7d6..b725509f9073 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -113,7 +113,7 @@ static inline notrace int decrementer_check_overflow(void)
 #ifdef CONFIG_PPC_BOOK3E
 
 /* This is called whenever we are re-enabling interrupts
- * and returns either 0 (nothing to do) or 500/900/280/a00/e80 if
+ * and returns either 0 (nothing to do) or 500/900/280 if
  * there's an EE, DEC or DBELL to generate.
  *
  * This is called in two contexts: From arch_local_irq_restore()
-- 
2.23.0

