Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E182A3B81
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:49:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHQ56m95zDqRg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:49:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dpwrlGeM; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH604B9tzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:52 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id a200so13089336pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aAdrOeUATeOYY9F0WJM+M2LaFIVjxmx3q+en/nm6b5o=;
 b=dpwrlGeM+gNcH+n7Hfr/+iZ/wvmotHBkhgS7Kv+keqpW9e05J8ECtVB0pxS7kyv3tM
 ZjUQlDemwPKTv4UjD25LA5R/VmAESbCFcP/2avIZ8z8NpNh3KEujqlRVb1YtJsyHgPlp
 G0vS6kHIr8uKh5N7nMmY9h2/WHQBwifnjbQKTd5aPEpiFF4TQsOehvLzZBdW6a2GU9pU
 8dizji9zwpjaPD+PkeZATQvZMhF6etaxbRuClgAmMqgzxxZtm0OVgeGHUFHCY/ZE6/0n
 EjmigE4lUzhRHs3/yYjhnqqA4mkXSYAuGdcZi5kCvjl8wpOPD4TQYAjdQdYGsB1f2Z9E
 GI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aAdrOeUATeOYY9F0WJM+M2LaFIVjxmx3q+en/nm6b5o=;
 b=X1iEAhBkuIzTn9hEgvjODXLk4i0JwqSlaDYGDiLM8KZ3C1PF3ab8cEQaykEAEg5Riz
 oj/TmURE5XfBTPdQDVm8n2u+EAajPW44gi64uvYf5H3IcoOwvUA6kejOpWRDbuxlS+XF
 aT0Rl92MmgEFiMB/fz3YVUN/AW+MWVyfInj/eqAJaNC4Wk76bZamUl3l2vnxoWdlFSIz
 1dHPEoF8z6g8j0Ll6UkL8HTpP3/2O1z4BacVZn+1/xaeCsOg3yL5zcCBaAiediuP/9ib
 jQbv7tKY64E2FSYxJdrAUl/icAvwy6VmAaAkx0HKvat9o0gawe3VaflM1D+bwRKOJSgD
 e9NA==
X-Gm-Message-State: AOAM5306zrv0SXzs3RIvZdDzXRi/2jq1oTgejvPA02Hw/3jfMAO2Lkwz
 QTkDrXMar8OlPmk4Xg+aIzjF7EKnLKI=
X-Google-Smtp-Source: ABdhPJyRi1hYi0/8JxsRn/0wIE5xpbYEjdhuvp81uCpOV0os+dU7PALeQdadRqs26LCsskZkvjbXlg==
X-Received: by 2002:a63:4511:: with SMTP id s17mr8266594pga.4.1604378150550;
 Mon, 02 Nov 2020 20:35:50 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:50 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/18] powerpc/52xx/mpc5200_simple: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:13 +1100
Message-Id: <20201103043523.916109-8-oohall@gmail.com>
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
 arch/powerpc/platforms/52xx/mpc5200_simple.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc5200_simple.c b/arch/powerpc/platforms/52xx/mpc5200_simple.c
index 2d01e9b2e779..b9f5675b0a1d 100644
--- a/arch/powerpc/platforms/52xx/mpc5200_simple.c
+++ b/arch/powerpc/platforms/52xx/mpc5200_simple.c
@@ -40,8 +40,6 @@ static void __init mpc5200_simple_setup_arch(void)
 
 	/* Some mpc5200 & mpc5200b related configuration */
 	mpc5200_setup_xlb_arbiter();
-
-	mpc52xx_setup_pci();
 }
 
 /* list of the supported boards */
@@ -73,6 +71,7 @@ define_machine(mpc5200_simple_platform) {
 	.name		= "mpc5200-simple-platform",
 	.probe		= mpc5200_simple_probe,
 	.setup_arch	= mpc5200_simple_setup_arch,
+	.discover_phbs	= mpc52xx_setup_pci,
 	.init		= mpc52xx_declare_of_platform_devices,
 	.init_IRQ	= mpc52xx_init_irq,
 	.get_irq	= mpc52xx_get_irq,
-- 
2.26.2

