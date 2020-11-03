Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FE12A3B7E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:46:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHLJ38Y9zDqTy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:46:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hE9mxHRx; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH5x3sLkzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:49 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id h6so12698123pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fE2xl1SfpG/JbbzqMFYfA0Ul38UprkCR9u030OCuybI=;
 b=hE9mxHRxfyaMZqOG4BDSAlgfqvCgfu52tsgdTPP++8Oqu8NAUMjLeHGfm9a7hiMYEW
 8boljDFyLmUnky3tY5zzzvZW4mIpW//0WSBeTeH4I1YbBg0J9NaFTCyE27CHon8Y5tKB
 ilDJJ3BlBwTM3zPLRJMxBvff1veXeJfm5PztQLbh+JqoEMJMpwZVskW/2Y/3VbnHuKci
 24G3wMbup3b1YQtYBNg5+gGnNy2EDFTSgIr60KadJ6814lhTktxazPAz/MebVaUMQ686
 +qRJnMLvxdPvycR9LMRb8rE+a8yElwmUc9v+17xY7tSohC8vvDc0Fj4EeYsp6M5ViyBh
 nR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fE2xl1SfpG/JbbzqMFYfA0Ul38UprkCR9u030OCuybI=;
 b=bGPAb/M06LSmVJL96iMQPCeB1x4Hekv/YGMeO0sgjRl810dQUYsGYTDW4bcUYYA6cO
 2MVRr53P8nFDtqT87z9g5Yii/JPJdLPtxxRrcQPkRZX3FgX+Zv9qAw2PLZbTIthmcZrI
 i+CmU3ZoKlY8TH3lvGk4zZWd+Qlo0fA+HWOzQZKUebKgnjXDAIbZD/7+DYzXCjCfOjOH
 UmH/iNVKP/yrLHGeNu3nUTB+SqZSAeac4GkLhZ9qmgyCJluwX/a/RZhR8GvhkwmdAHsu
 YGlS5Iwi15EV+PaYI8WULiDSSW/82B0yhGb3ud+BjCJGUbk31x4UQQjz49aRVx9gxU+e
 o5fg==
X-Gm-Message-State: AOAM530fLeNPg+Cotw3YTz6tiDf3QYqWE0XmW4Ioy+I8oz6uhKAS1gqn
 ZKl5ItRfe17cugTed0cxwPFHP9k6Zx4=
X-Google-Smtp-Source: ABdhPJzHdHK28LY96Udr3Nnj8xVJFkZ7YOz4p4VvRklhvlTJPvB/SlFi9+R/6XgJ0dV2LpKYefjF6g==
X-Received: by 2002:a63:f54c:: with SMTP id e12mr15434383pgk.415.1604378146468; 
 Mon, 02 Nov 2020 20:35:46 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:46 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/18] powerpc/52xx/lite5200: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:11 +1100
Message-Id: <20201103043523.916109-6-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103043523.916109-1-oohall@gmail.com>
References: <20201103043523.916109-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
compile tested with 52xx/lite5200b_defconfig
---
 arch/powerpc/platforms/52xx/lite5200.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/lite5200.c b/arch/powerpc/platforms/52xx/lite5200.c
index 3181aac08225..04cc97397095 100644
--- a/arch/powerpc/platforms/52xx/lite5200.c
+++ b/arch/powerpc/platforms/52xx/lite5200.c
@@ -165,8 +165,6 @@ static void __init lite5200_setup_arch(void)
 	mpc52xx_suspend.board_resume_finish = lite5200_resume_finish;
 	lite5200_pm_init();
 #endif
-
-	mpc52xx_setup_pci();
 }
 
 static const char * const board[] __initconst = {
@@ -187,6 +185,7 @@ define_machine(lite5200) {
 	.name 		= "lite5200",
 	.probe 		= lite5200_probe,
 	.setup_arch 	= lite5200_setup_arch,
+	.discover_phbs	= mpc52xx_setup_pci,
 	.init		= mpc52xx_declare_of_platform_devices,
 	.init_IRQ 	= mpc52xx_init_irq,
 	.get_irq 	= mpc52xx_get_irq,
-- 
2.26.2

