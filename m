Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 461552A3B80
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:48:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHN84LcyzDqDM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:48:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=idqr+nmY; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH5y4lqRzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:50 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id w65so13121688pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D5qtslshvrhaaM1PpdIGdaX4z8+z5ZAL/vniYoBwcKc=;
 b=idqr+nmY1zlJSIoGRx2D16QBqn11o9RejHowwlfkI6to7MRKX2WER79Y5qhdiBbzzO
 tf+pC4vg/4FDITKw8n+qThADc2pGt8Y+lOJ6MgFvMiA1JRQ+h3Z4tyCz4pz9rBVucJ5x
 t2PnBmVOLmEJnSaxDPaKq1J+451jGLP8fX0QCnxOcoB6QYX8ftQ8S7jmwx3WdB/GXv+1
 jrxTJHX3xi12g0B1lgMN0F6QrdrO0mJGFF5mptf1dxBPOflEfT9j+ao2nMy/UWQWzY3K
 Kjs4VCU/ZmlhcvmXSf+6WyNiynVbgqrGsp8MTrsTNTCdhs+mbKVeZDe5m7LfmSztV5Wx
 gFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D5qtslshvrhaaM1PpdIGdaX4z8+z5ZAL/vniYoBwcKc=;
 b=kAYRN/Xw8m1In1plbySqTNGiPoNyp/dT56/UGwwx522FQtdjqeRr3lOunM0EAc9JBQ
 15xw7CZ2A6RZFSHMYKOfGZoNrdhjCAYZx8XeUdd2peUtrcigcifW+Zrn7nKFl9IS6zPX
 W2NMpt7X0EJMiFNQReZbVDiqk9PMgUxx1l0p0nnbbXNK9xJgW8FxB6bzpzTbR5GhuecL
 5dWLu+lCXWNvcgz01O+aLHvA54g8pFUY9JEtVPAJ/kf3bSAjkul+uy0DNpmjZ5krJDKA
 DV/VIm2XcMOheNYxHzf9rxJQqOFBxu7heT8jykgfawLqMLHjeZQI6RY1JmTmC8x4po4o
 t+2Q==
X-Gm-Message-State: AOAM533WcnCE7/gdOhdLAYQ4dXzszxRHa7kcvo9AH27s723UKcMYacj0
 NgdnX5+lhiUvOV1TbK/QDfdbXkaoMGQ=
X-Google-Smtp-Source: ABdhPJzQyNuIVR3CrM/1CIeqfpPapOCezTIptLQ0vA8FhLzyEp1ZlXmM0eNkmXrXC+IOUSn1EFtTUQ==
X-Received: by 2002:a65:6219:: with SMTP id d25mr15318374pgv.1.1604378148618; 
 Mon, 02 Nov 2020 20:35:48 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:47 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/18] powerpc/52xx/media5200: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:12 +1100
Message-Id: <20201103043523.916109-7-oohall@gmail.com>
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
 arch/powerpc/platforms/52xx/media5200.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index 07c5bc4ed0b5..efb8bdecbcc7 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -202,8 +202,6 @@ static void __init media5200_setup_arch(void)
 	/* Some mpc5200 & mpc5200b related configuration */
 	mpc5200_setup_xlb_arbiter();
 
-	mpc52xx_setup_pci();
-
 	np = of_find_matching_node(NULL, mpc5200_gpio_ids);
 	gpio = of_iomap(np, 0);
 	of_node_put(np);
@@ -244,6 +242,7 @@ define_machine(media5200_platform) {
 	.name		= "media5200-platform",
 	.probe		= media5200_probe,
 	.setup_arch	= media5200_setup_arch,
+	.discover_phbs	= mpc52xx_setup_pci,
 	.init		= mpc52xx_declare_of_platform_devices,
 	.init_IRQ	= media5200_init_irq,
 	.get_irq	= mpc52xx_get_irq,
-- 
2.26.2

