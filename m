Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FDD2A3B7B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:44:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHJF1RRdzDqTl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:44:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i68IBSlP; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH5v17gtzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:47 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id g12so12688529pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S7XdpBSyN2hayLd4zRl+DTnOe6f75FZb4gpZXT38Um4=;
 b=i68IBSlP0NXxs4hWvlU7VnsBXuOerg5+GL36z6GJLtuH0z+Ey8SYxV5Lc39di5WvGa
 B0onD/VU1/KJCvlSNkjE7xr2rJi17Fvjcyc+bGmYDwg69+m89hWx7gzKmbjoigX6VZ5T
 r4cY+wm9s4uTQSARjvEP0L77t3L1i3IOFqD7QwGL+uCHqUzWMwnQIQd9poXHcKf0ptph
 CCaS8/HGkpIbsfPFEvP8pCc81SvRyufRwVJ0YqYwpEnWUl0vy/NC9HnxpUG4Q5a4NNKz
 Jw6mNH0t3gaoKgzcQK08rr80OATtCmo1AkstTxeD54GcUe4L9EUOCUke+RsqqExCTDtZ
 /osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7XdpBSyN2hayLd4zRl+DTnOe6f75FZb4gpZXT38Um4=;
 b=KssthZfUTaXz9r7rM5yX0hYuDaaZdk+SMr54H8n2kYVPL5lAVUNsrEur7lzrQ5bXQS
 0SDH1F/0ecx3PoIrTY/9J1I3KNsjuMgpgfqkyCZylYGsLTL2U0DeuteRhtAL4td/9sG3
 4ylR6rKTOnzZiz4fFMoHFUkv5duxQFduzBqV7zYKBnu5tD8rlUzjfl3jK2330t5YJpdr
 VmplH5fkaPXIe6jFj61pto4GQJQzgq2lM7LyYuTQw1IR9tdhSM8XcAVnuqVz53Jr+Me1
 dMCFg6zy7qbXKFUDE7IKfBHkhg3sGq14u5j6p+tRkoZGSQ88vhjpOUJLUDm6zxfXqK6P
 tzpw==
X-Gm-Message-State: AOAM530PljPIM0g7TyuF09WwJOtc88GwD/vCs7X0TKRdwdqrfTwDIdVc
 wxaV9hebN9A2ue8FvnQOCwZ/fBIYwts=
X-Google-Smtp-Source: ABdhPJwmwc6ATWcY9F5FY8cmTYpdegTZrDktb7wZSryfXXQR1czWPP9DRd2dqaaBE9DpFPuV/Xza5A==
X-Received: by 2002:a63:7408:: with SMTP id p8mr15451268pgc.273.1604378144493; 
 Mon, 02 Nov 2020 20:35:44 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:44 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/18] powerpc/52xx/efika: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:10 +1100
Message-Id: <20201103043523.916109-5-oohall@gmail.com>
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
compile tested with mpc5200_defconfig
---
 arch/powerpc/platforms/52xx/efika.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index 4514a6f7458a..3b7d70d71692 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -185,8 +185,6 @@ static void __init efika_setup_arch(void)
 	/* Map important registers from the internal memory map */
 	mpc52xx_map_common_devices();
 
-	efika_pcisetup();
-
 #ifdef CONFIG_PM
 	mpc52xx_suspend.board_suspend_prepare = efika_suspend_prepare;
 	mpc52xx_pm_init();
@@ -218,6 +216,7 @@ define_machine(efika)
 	.name			= EFIKA_PLATFORM_NAME,
 	.probe			= efika_probe,
 	.setup_arch		= efika_setup_arch,
+	.discover_phbs		= efika_pcisetup,
 	.init			= mpc52xx_declare_of_platform_devices,
 	.show_cpuinfo		= efika_show_cpuinfo,
 	.init_IRQ		= mpc52xx_init_irq,
-- 
2.26.2

